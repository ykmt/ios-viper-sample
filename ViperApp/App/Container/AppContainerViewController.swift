// AppContainerViewController.swift

import UIKit

/// Viper

protocol AppContainerViper {
    var presenter: AppContainerPresenter? { get set }
}

/// View Behavior

protocol AppContainerViewBehavior: ViewBehavior {
    func setBackgroundColor(_ color: UIColor)
}

class AppContainerViewCell: UITableViewCell {
    @IBOutlet weak var aLabel: UILabel!
}

/// View

class AppContainerViewController: UIViewController, AppContainerViper, AppContainerViewBehavior{

    let AwesomeTableCellIdentifier = "AwesomeTableCell"
    
    var presenter: AppContainerPresenter?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDelegate.viewDidLoad()
        presenter?.viewTableDataSource.loadData()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Behavior
    
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
        view.setNeedsDisplay()
    }
    
}

/// Table View Data Source

extension AppContainerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.viewTableDataSource.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewTableDataSource.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AwesomeTableCellIdentifier, for: indexPath) as! AppContainerViewCell
        
        guard let data = presenter?.viewTableDataSource.cellDataForRowAt(indexPath) as? AppContainerCellData else {
            return cell
        }
        
        cell.aLabel.text = data.title
        
        return cell
    }
    
}

/// Table View Delegate

extension AppContainerViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.viewTableDelegate.didSelectRowAt(indexPath)
    }
    
}
