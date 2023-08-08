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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
          
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
    
}


