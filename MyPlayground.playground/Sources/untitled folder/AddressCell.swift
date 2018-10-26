import Foundation
import UIKit

public class AddressCell: UITableViewCell, CellConfigurable {
  
  public func setup(viewModel: RowViewModel?) {
    guard let viewModel = viewModel as? AddressModel else { return }
    self.textLabel?.text = viewModel.address
  }
  
  public static func cellIdentifier() -> String {
    return String(describing: self)
  }
}
