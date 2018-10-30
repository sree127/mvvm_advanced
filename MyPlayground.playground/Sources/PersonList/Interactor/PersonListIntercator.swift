import Foundation
import UIKit

class PersonListInteractor: PersonListInpuptInteractorProtocol {
  
  weak var presenter: PersonListOutputInteractorProtocol?
  
  func getPersonList() {
    getPersonList { personModel in
      self.presenter?.personListDidFetch(personsList: personModel)
    }
  }
  
  func getPersonList(callback: @escaping ([PersonModel]) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
      var personModel = [PersonModel]()
      for _ in 0..<10 {
        let person = PersonModel(name: self.randomString(length: 4))
        personModel.append(person)
      }
      callback(personModel)
    }
  }
  
  public func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0...length-1).map{ _ in letters.randomElement()! })
  }
}
