import Foundation
import UIKit

public class PersonCell: UITableViewCell, CellConfigurable {
  
  public func setup(viewModel: RowViewModel?) {
    guard let viewModel = viewModel as? PersonModel else { return }
    self.textLabel?.text = viewModel.name
  }
  
  public static func cellIdentifier() -> String {
    return String(describing: self)
  }
}

