import Foundation

public struct PersonModel: RowViewModel {
  public let name: String
  public init(name: String) {
    self.name = name
  }
}
