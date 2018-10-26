import Foundation

public class ValueObservable<T> {
  public var value: T {
    didSet {
      DispatchQueue.main.async {
        self.valueChanged?(self.value)
      }
    }
  }
  
  private var valueChanged: ((T) -> Void)?
  
  public init(value: T) {
    self.value = value
  }
  
  public func addObserver(fireNow: Bool = true, _ onChange: ((T) -> Void)?) {
    valueChanged = onChange
    if fireNow {
      onChange?(value)
    }
  }
  
  public func removeObserver() {
    valueChanged = nil
  }
}
