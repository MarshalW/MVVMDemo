//
//  MainTableViewController.swift
//  MVVCDemo
//
//  Created by Marshal Wu on 16/7/7.
//  Copyright © 2016年 Marshal Wu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainTableViewController: UITableViewController {

	@IBOutlet var tableTitle: UILabel!

	@IBOutlet var songsTableView: UITableView!

	var songs: [Song] = [] {
		didSet {
			self.tableTitle.text = "  Songs"
			self.songsTableView.reloadData()
		}
		willSet {
		}
	}

	func loadingSongs() {
		self.tableTitle.text = "  Loading.."

		Alamofire.request(.GET, K.baseUrl + "songs.json?new")
			.responseJSON { response in
				switch response.result {
				case .Success(let data):
					var _songs: [Song] = []
					let json = JSON(data)
					for (_, subJson) in json {
                        let song = Song(name: subJson["name"].stringValue, singer: subJson["singer"].stringValue, image: subJson["image"].stringValue,songUrl:subJson["songUrl"].stringValue)
						_songs.append(song)
					}
					self.songs = _songs
                    print("songs load OK.")
				case .Failure(let error):
					print("Request failed with error: \(error)")
				}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false

		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem()

		let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
		songsTableView.registerNib(nib, forCellReuseIdentifier: "MainCell")

		self.loadingSongs()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return self.songs.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as! MainTableViewCell
		cell.song = self.songs[indexPath.row]

		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
		self.navigationController!.pushViewController(detailViewController, animated: true)
		detailViewController.song = self.songs[indexPath.row]        
	}

	// 只在当前vc隐藏导航条
	override func viewWillDisappear(animated: Bool)
	{
		super.viewWillDisappear(animated)
		self.navigationController?.navigationBarHidden = false
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.navigationBarHidden = true
	}

	/*
	 // Override to support conditional editing of the table view.
	 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	 // Return false if you do not want the specified item to be editable.
	 return true
	 }
	 */

	/*
	 // Override to support editing the table view.
	 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
	 if editingStyle == .Delete {
	 // Delete the row from the data source
	 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
	 } else if editingStyle == .Insert {
	 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	 }
	 }
	 */

	/*
	 // Override to support rearranging the table view.
	 override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

	 }
	 */

	/*
	 // Override to support conditional rearranging of the table view.
	 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	 // Return false if you do not want the item to be re-orderable.
	 return true
	 }
	 */

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */

}
