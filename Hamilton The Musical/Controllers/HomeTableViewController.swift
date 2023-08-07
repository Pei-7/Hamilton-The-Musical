//
//  HomeTableViewController.swift
//  Hamilton The Musical
//
//  Created by 陳佩琪 on 2023/8/6.
//

import UIKit
import AVFoundation

class HomeTableViewController: UITableViewController {
    
    var player = AVPlayer()
    
    var songs = Song.data
    var songLink: String!
    var songLyrics: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SongTableViewCell.self)", for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        
        cell.numberLabel.text = String(indexPath.row + 1)
        cell.songNameLabel.text = song.songName
        cell.singerLabel.text = song.singer
        cell.link = song.mvLink
        cell.mvButton.tag = indexPath.row
        cell.lyricsButton.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row].songName
        print(indexPath.row,song)
        let url = Bundle.main.url(forResource: song, withExtension: "mp3")
        if let url {
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }

    }
    
    
    @IBAction func updateMV(_ sender: UIButton) {
        let index = sender.tag
        songLink = songs[index].mvLink
        performSegue(withIdentifier: "showMV", sender: nil)
    }
    
    @IBSegueAction func showMVSegue(_ coder: NSCoder) -> MVViewController? {
        player.pause()
        
        let controller = MVViewController(coder: coder)
        controller?.link = songLink
        return controller
    }
    
  
    @IBAction func updateLyrics(_ sender: UIButton) {
        let index = sender.tag
        songLyrics = songs[index].lyrics
        print(songLyrics)
        performSegue(withIdentifier: "showLyrics", sender: nil)
    }
    
    @IBSegueAction func showLyricsSegue(_ coder: NSCoder) -> LyricsViewController? {
        let controller = LyricsViewController(coder: coder)
        controller?.lyrics = songLyrics
        return controller
    }
    /*
    @IBSegueAction func showLyrics(_ coder: NSCoder) -> LyricsViewController? {
        let controller = LyricsViewController(coder: coder)
        controller?.lyrics = songLyrics
        return controller
    }
     */
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
