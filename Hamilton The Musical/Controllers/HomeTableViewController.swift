//
//  HomeTableViewController.swift
//  Hamilton The Musical
//
//  Created by 陳佩琪 on 2023/8/6.
//

import UIKit
import Foundation
import AVFoundation

class HomeTableViewController: UITableViewController {
    
    var player = AVPlayer()
    
    var songs = Song.data
    var songLink: String!
    var songLyrics: String!
    
    var playingStatus = false
    
    var timer: Timer!
    
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
        
        
        cell.statusButton.setTitle(String(indexPath.row + 1), for: .normal)
        cell.songNameLabel.text = song.songName
        cell.singerLabel.text = song.singer
        cell.link = song.mvLink
        cell.statusButton.tag = indexPath.row
        cell.mvButton.tag = indexPath.row
        cell.lyricsButton.tag = indexPath.row
        
        cell.songNameLabel.lineBreakMode = .byClipping

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
            
        if let cell = tableView.cellForRow(at: indexPath) as? SongTableViewCell, let songLabel = cell.songNameLabel {

            
            if let songLabelText = songLabel.text {
                if songLabelText.count > 30 {
                        var stringArray = Array(songLabelText)
                        let spaceArray = Array(repeating: " ", count: 20)
                        let spaceString = spaceArray.joined()
                        stringArray.append(contentsOf: spaceString)
                        
                        timer = Timer.scheduledTimer(withTimeInterval: 0.16, repeats: true) { _ in
                            let firstElement = stringArray[0]
                            stringArray.remove(at: 0)
                            stringArray.append(firstElement)
                            let newString = String(stringArray)
                            cell.songNameLabel.text = newString
                        }
                    }
            }
            
            cell.statusButton.setTitle("| |", for: .normal)
            cell.statusButton.setTitleColor(UIColor(red: 171/255, green: 114/255, blue: 58/255, alpha: 1), for: .normal)
        }

    }
    
    
    fileprivate func resetCell(_ index: Int) {
        player.pause()
        if timer != nil {
            timer.invalidate()
            print("2",timer.isValid)
        }
        
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? SongTableViewCell {
            cell.statusButton.setTitle(String(index + 1), for: .normal)
            cell.statusButton.setTitleColor(.systemGray, for: .normal)
            cell.songNameLabel.text = songs[index].songName
        }
    }
    
    @IBAction func updateMV(_ sender: UIButton) {

        let index = sender.tag
        resetCell(index)
                 
        songLink = songs[index].mvLink
        performSegue(withIdentifier: "showMV", sender: nil)

    }
    
    @IBSegueAction func showMVSegue(_ coder: NSCoder) -> MVViewController? {
        
        let controller = MVViewController(coder: coder)
        controller?.link = songLink
        return controller
    }
    
  
    @IBAction func updateLyrics(_ sender: UIButton) {
        let index = sender.tag
        songLyrics = songs[index].lyrics
        performSegue(withIdentifier: "showLyrics", sender: nil)
    }
    
    @IBSegueAction func showLyricsSegue(_ coder: NSCoder) -> LyricsViewController? {
        let controller = LyricsViewController(coder: coder)
        controller?.lyrics = songLyrics
        return controller
    }
    
    @IBAction func pause(_ sender: UIButton) {
        let index = sender.tag
        resetCell(index)

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
