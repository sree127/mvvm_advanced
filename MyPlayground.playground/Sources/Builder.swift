import Foundation
import UIKit

public class Builder {
  
  public let viewController: MyViewController
  
  public init() {
    let viewModel = ViewModel()
    self.viewController = MyViewController(viewModel: viewModel)
  }
}
