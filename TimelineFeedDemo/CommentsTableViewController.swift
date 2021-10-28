//
//  CommentsTableViewController.swift
//  TimelineFeedDemo
//
//  Created by Rudra Misra on 10/28/21.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        loadData()

    }

    func loadData(){
        
        comments = [Comments(userName: "Dalai Lama", postDescription: "The purpose of our lives is to be happy.", media: "staff3"),
                    Comments(userName: "John Lennon", postDescription: "Life is what happens when you’re busy making other plans.", media: "staff2"),
                    Comments(userName: "Thomas A. Edison", postDescription: "Many of life’s failures are people who did not realize how close they were to success when they gave up.", media: nil),
                    Comments(userName: "Will Smith", postDescription: "Money and success don’t change people; they merely amplify what is already there.", media: nil),
                    Comments(userName: "Steve Jobs", postDescription: "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking.", media: nil)
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
        return comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell

        // Configure the cell...
        
        if comments[indexPath.row].media == nil{
            cell.media.isHidden = true
        }else{
            cell.media.isHidden = false
            cell.media.image = UIImage(named: comments[indexPath.row].media ?? "")
        }
        
        cell.userName.text = comments[indexPath.row].userName
        cell.comments.text = comments[indexPath.row].postDescription

        return cell
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
