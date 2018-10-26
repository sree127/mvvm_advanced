//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

public class ViewModel {
  var sections = ValueObservable<[SectionViewModel]>(value: [])
  init() {
  }
  
  public func process() {
    
    var details = [SectionViewModel]()

    getPerson { person in
      let personModel = PersonModel(name: person)
      let sectionViewModel = SectionViewModel(rowViewModel: personModel)
      details.append(sectionViewModel)
      self.sections.value.append(sectionViewModel)
    }
    
    getAddress { address in
      let addressModel = AddressModel(address: address)
      let sectionViewModel = SectionViewModel(rowViewModel: addressModel)
      details.append(sectionViewModel)
      self.sections.value.append(sectionViewModel)
    }
  }
  
  func getPerson(callback: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
      callback("Carlos Tocard")
    }
  }
  
  func getAddress(callback: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
      callback("Stocard, Mannheim")
    }
  }
}

public class Bulder {
  let viewController: MyViewController
  init() {
    let viewModel = ViewModel()
    self.viewController = MyViewController(viewModel: viewModel)
  }
}

public protocol CellConfigurable {
  func setup(viewModel: RowViewModel?)
}


class PersonCell: UITableViewCell, CellConfigurable {
  
  func setup(viewModel: RowViewModel?) {
    guard let viewModel = viewModel as? PersonModel else { return }
    self.textLabel?.text = viewModel.name
  }
  
  public static func cellIdentifier() -> String {
    return String(describing: self)
  }
}


class MyViewController : UITableViewController {
  
  let viewModel: ViewModel

  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(style: .plain)
    initBinding()
    tableView.register(PersonCell.self, forCellReuseIdentifier: PersonCell.cellIdentifier())
    tableView.register(AddressCell.self, forCellReuseIdentifier: AddressCell.cellIdentifier())
    viewModel.process()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initBinding() {
    viewModel.sections.addObserver { viewModel in
      self.tableView.reloadData()
    }
  }
  
  func cellIdentifier(for viewModel: RowViewModel) -> String {
    switch viewModel {
    case is PersonModel:
      return PersonCell.cellIdentifier()
    case is AddressModel:
      return AddressCell.cellIdentifier()
    default:
      fatalError("Unexpected view model type: \(viewModel)")
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    print("\(viewModel.sections.value.count)")
    return viewModel.sections.value.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let viewModel = self.viewModel.sections.value[indexPath.section].rowViewModel
    print(viewModel)
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: viewModel!), for: indexPath)
    if let cell = cell as? CellConfigurable {
      cell.setup(viewModel: viewModel)
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Section \(section)"
  }
}

let builder = Bulder()
let tableViewController = builder.viewController

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = tableViewController
