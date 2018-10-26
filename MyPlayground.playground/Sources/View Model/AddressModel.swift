import Foundation

public struct AddressModel: RowViewModel {
  public let address: String
  public init(address: String) {
    self.address = address
  }
}
