import Foundation

/// Protocol all the ViewModels should conform to
public protocol RowViewModel {}

/// Section View Model
public struct SectionViewModel {
  public let rowViewModel: RowViewModel?
  
  public init(rowViewModel: RowViewModel?) {
    self.rowViewModel = rowViewModel
  }
}


public class ViewModel {
  
  var sections = ValueObservable<[SectionViewModel]>(value: [])
  
  init() {}
  
  public func process() {
    
    var details = [SectionViewModel]()
    
//    getPerson { person in
//      let personModel = PersonModel(name: person)
//      let sectionViewModel = SectionViewModel(rowViewModel: personModel)
//      details.append(sectionViewModel)
//      self.sections.value.append(sectionViewModel)
//    }
//    
//    getAddress { address in
//      let addressModel = AddressModel(address: address)
//      let sectionViewModel = SectionViewModel(rowViewModel: addressModel)
//      details.append(sectionViewModel)
//      self.sections.value.append(sectionViewModel)
//    }
  }
  
  func getPerson(callback: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
      callback("Carlos Tocard")
    }
  }
  
  func getAddress(callback: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
      callback("Stocard, Mannheim")
    }
  }
}
