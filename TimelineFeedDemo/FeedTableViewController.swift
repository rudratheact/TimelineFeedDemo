//
//  FeedTableViewController.swift
//  TimelineFeedDemo
//
//  Created by Rudra Misra on 10/28/21.
//

import UIKit

class FeedTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false

        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        loadData()

    }

    func loadData(){
        
        feeds = [Feeds(title: "AN 87 YEAR OLD COLLEGE STUDENT NAMED ROSE", postDate: "Yesterday at 03:00AM", postDescription: "The first day of school our professor introduced himself and challenged us to get to know someone we didn’t already know. I stood up to look around when a gentle hand touched my shoulder. I turned around to find a wrinkled, little old lady beaming up at me with a smile that lit up her entire being.", media: nil, likes: true, hearts: true, lols: nil, interactions: 32),
                 Feeds(title: "she told me", postDate: "Yesterday at 03:00PM", postDescription: "I always dreamed of having a college education and now I’m getting one!", media: "staff1", likes: true, hearts: true, lols: true, interactions: 32),
                 Feeds(title: "He jokingly replied", postDate: "Today at 01:00AM", postDescription: "I’m here to meet a rich husband, get married, and have a couple of kids…", media: "staff2", likes: true, hearts: true, lols: true, interactions: 12),
                 Feeds(title: "Unknown", postDate: "Today at 03:00AM", postDescription: "If I am eighty-seven years old and stay in bed for a year and never do anything I will turn eighty-eight.", media: nil, likes: true, hearts: nil, lols: false, interactions: 3)
        ]
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell

        // Configure the cell...
        
        if feeds[indexPath.row].likes == true{
            cell.like.isHidden = false
        }else{
            cell.like.isHidden = true
        }
        
        if feeds[indexPath.row].lols == true{
            cell.lol.isHidden = false
        }else{
            cell.lol.isHidden = true
        }
        
        if feeds[indexPath.row].hearts == true{
            cell.heart.isHidden = false
        }else{
            cell.heart.isHidden = true
        }
        
        if feeds[indexPath.row].media == nil{
            cell.postMedia.isHidden = true
        }else{
            cell.postMedia.isHidden = false
            cell.postMedia.image = UIImage(named: feeds[indexPath.row].media ?? "")
        }
        
        cell.postTitle.text = feeds[indexPath.row].title
        cell.postDate.text = feeds[indexPath.row].postDate
        cell.postDescription.text = feeds[indexPath.row].postDescription
        cell.totalInteractions.text = "\(feeds[indexPath.row].interactions ?? 0)"

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.resignFirstResponder()
        
        let vc = CommentsTableViewController()
        self.present(vc, animated: true) {
            self.tableView.deselectRow(at: indexPath, animated: true)
            self.view.endEditing(true)
        }
    }

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
