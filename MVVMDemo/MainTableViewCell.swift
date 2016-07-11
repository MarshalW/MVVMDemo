//
//  MainTableViewCell.swift
//  MVVCDemo
//
//  Created by Marshal Wu on 16/7/8.
//  Copyright © 2016年 Marshal Wu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MainTableViewCell: UITableViewCell {

	@IBOutlet var songTitle: UILabel!
	@IBOutlet var songImage: UIImageView!

	var song: Song? {
		didSet {
			songTitle.text = "\(song!.name), \(song!.singer)"

			Alamofire.request(.GET, K.baseUrl + self.song!.image)
				.responseImage { response in
					if let image = response.result.value {
                        self.songImage.image=image
					}
			}
		}
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
