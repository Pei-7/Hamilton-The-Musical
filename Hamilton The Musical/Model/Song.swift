//
//  Song.swift
//  Hamilton The Musical
//
//  Created by 陳佩琪 on 2023/8/6.
//

import UIKit
import CodableCSV

struct Song: Codable {
    var songName: String
    var singer: String
    var mvLink: String
    var lyrics: String
}

extension Song {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "Hamilton")?.data {
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print(error)
            }
        }
        return array
    }
}
