//
//  Song.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

class Song {
    
    static var songs: [Song] = []
    
    let songName: String
    let artistName: String
 
    init(songName: String, artistName: String) {
        self.songName = songName
        self.artistName = artistName
    }
    
    convenience init?(from songs: [String : String]) {
        guard let name = songs["song_name"] else {
            print("song didn't work")
            return nil
        }
        
        guard let artist = songs["display_artist"] else {
            print("artist didn't work")
            return nil
        }
        
        self.init(songName: name, artistName: artist)
    }
    
    static func getSongs(from data: Data) -> [Song] {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let songDictArr = json as? [Any] else {
                return []
            }
            
            for eachSongDict in songDictArr {
                if let songDict = eachSongDict as? [String : String], let song = Song(from: songDict) {
                    songs.append(song)
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        return songs
    }
    
}
