//
//  SongTableViewCell.swift
//  Hamilton The Musical
//
//  Created by 陳佩琪 on 2023/8/6.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    
    @IBOutlet var statusButton: UIButton!
    
    @IBOutlet var songNameLabel: UILabel!
    
    @IBOutlet var singerLabel: UILabel!
    
    @IBOutlet var mvButton: UIButton!
    
    @IBOutlet var lyricsButton: UIButton!
    
    var link: String!
    
    var lyrics: String!

    var timer: Timer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func longStringMarquee() {
//        var stringArray = Array(songNameLabel.text!)
//        if stringArray.count > 30 {
//            let spaceArray = Array(repeating: " ", count: 20)
//            let spaceString = spaceArray.joined()
//            stringArray.append(contentsOf: spaceString)
//        
//            timer = Timer.scheduledTimer(withTimeInterval: 0.16, repeats: true) { _ in
////                let firstElement = stringArray[0]
////                stringArray.remove(at: 0)
////                stringArray.append(firstElement)
////                let newString = String(stringArray)
////                self.songNameLabel.text = newString
//                print("timer preset")
//            }
//            print("0",timer.isValid)
//            if timer.isValid == true {
//                timer.invalidate()
//                print("1",timer.isValid)
//                timer = Timer.scheduledTimer(withTimeInterval: 0.16, repeats: true) { _ in
//                    let firstElement = stringArray[0]
//                    stringArray.remove(at: 0)
//                    stringArray.append(firstElement)
//                    let newString = String(stringArray)
//                    self.songNameLabel.text = newString
//                }
//                print("2",timer.isValid)
//            }
//            }
//
//        }
//    }
//    
    
}


