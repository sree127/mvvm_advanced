import Foundation
import UIKit

public class MyViewController : UITableViewController {
  
  let viewModel: ViewModel
  
  public init(viewModel: ViewModel) {
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
  
  public override func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.sections.value.count
  }
  
  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let viewModel = self.viewModel.sections.value[indexPath.section].rowViewModel
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: viewModel!), for: indexPath)
    if let cell = cell as? CellConfigurable {
      cell.setup(viewModel: viewModel)
    }
    return cell
  }
  
  public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Section \(section)"
  }
}

