//
//  SongListViewController.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class SongListViewController: UIViewController {

    @IBOutlet weak var songTableView: UITableView!

    var songs: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        songTableView.delegate = self
        songTableView.dataSource = self
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "SongData", ofType: "json") else {
            return
        }
        let myURL = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: myURL) {
            let allSongs = Song.getSongs(from: data)
            songs = allSongs
        }
    }
}

extension SongListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let currentSong = songs[indexPath.row]
        
        cell.textLabel?.text = currentSong.songName
        cell.detailTextLabel?.text = currentSong.artistName
        
        return cell
    }
    
}
