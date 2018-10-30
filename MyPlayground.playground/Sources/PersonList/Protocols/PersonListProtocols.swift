import Foundation
import UIKit

public protocol PersonListViewProtocol: class {
  func showPersons(persons: [PersonModel])
}

public protocol PersonListPresenterProtocol: class {
  var interactor: PersonListInpuptInteractorProtocol? { get set }
  var view: PersonListViewProtocol? { get set }
  var router: PersonListRouterProtocol? { get set }
  
  func showPersonSelection(with person: PersonModel, from view: UIViewController)
}

public protocol PersonListInpuptInteractorProtocol: class {
  var presenter: PersonListOutputInteractorProtocol? { get set }
  func getPersonList()
}

public protocol PersonListOutputInteractorProtocol: class {
  func personListDidFetch(personsList: [PersonModel])
}

public protocol PersonListRouterProtocol: class {
  func pushToPersonDetail(with person: PersonModel)
}
