//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UITableViewController {
  
  let cellId = "cellId"
  
  override func loadView() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = "Some"
    return cell
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
