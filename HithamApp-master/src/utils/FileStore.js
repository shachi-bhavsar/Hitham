import { AsyncStorage } from 'react-native'
import RNFetchBlob from 'react-native-fetch-blob';

export default class FileStore {

    static async updateSongInfo(song){
        song[SONG_IS_DOWNLOADED] = false;
        song[SONG_DOWNLOAD_PATH] = '';
        await RNFetchBlob.config({fileCache : true, appendExt : 'jpg',timeout:2000})
        .fetch('GET',song[SONG_ICON_URL],{})
        .progress((received, total) => {
            console.log('image download progress', received*100.0 / total);
        })
        .then((res) => {
            console.log('----pic download successful');
            song[SONG_ICON_PATH]=res.path();
            AsyncStorage.setItem(''+song[SONG_ID],JSON.stringify(song));
        }).catch((err)=>{
            console.log('fetch song error '+err);
            song[SONG_ICON_PATH]=NO_IMAGE_PATH;
            AsyncStorage.setItem(''+song[SONG_ID],JSON.stringify(song));
        });
    }
 
    static async updatePlaylistInfo(playlist){
        try{
            let res = await RNFetchBlob.config({fileCache : true}).fetch('GET',playlist[PLAYLIST_ICON_URL],{});
            playlist[PLAYLIST_ICON_PATH] = res.path();
            return playlist;    
        }catch(error){
            return playlist;
        }
    }

    static async downloadSong(song){
        try{
        await console.log("Downloading Song:" +JSON.stringify(song));    
        let res = await RNFetchBlob.config({fileCache : true}).fetch('GET',song[SONG_URL],{})
        .progress((received, total) => {
                  console.log('song download progress: '+ received +' '+total);
            });
        await console.log('----song download successful: '+song[SONG_ID]);
        song[SONG_IS_DOWNLOADED] = true;
        song[SONG_DOWNLOAD_PATH]=res.path();
        return song;
        }catch(error){
            await console.log("downloadSong Error :"+error);
            return song;
        }
    }    
}