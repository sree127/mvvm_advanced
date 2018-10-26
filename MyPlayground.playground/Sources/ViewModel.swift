import Foundation

/// Protocol all the ViewModels should conform to
public protocol RowViewModel {}


public struct SectionViewModel {
  public let rowViewModel: RowViewModel?
  
  public init(rowViewModel: RowViewModel?) {
    self.rowViewModel = rowViewModel
  }
}
