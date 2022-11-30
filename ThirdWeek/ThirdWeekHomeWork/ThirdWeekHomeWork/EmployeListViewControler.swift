//
//  EmployeListViewControler.swift
//  ThirdWeekHomeWork
//
//  Created by Ali Rıza İLHAN on 18.11.2022.
//

import UIKit

class EmployeListViewControler: UIViewController {

    @IBOutlet weak var employeTableView: UITableView!
    var employees: [Employee] = []
    var vakifBank: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employees = vakifBank?.employees ?? []
        employeTableView.delegate = self
        employeTableView.dataSource = self
        employeTableView.register(UINib(nibName: "EmployeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeCell")

        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Type something to search"
        navigationItem.searchController = search
    }
    

  

}
extension EmployeListViewControler: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeCell", for: indexPath) as? EmployeTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = employees[indexPath.row].name ?? "-"
        cell.experienceLabel.text = employees[indexPath.row].type.rawValue
        cell.salaryLabel.text = String(employees[indexPath.row].salary)
        
        return cell
    }
    
}
extension EmployeListViewControler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected \(employees[indexPath.row])")
    }
}
extension EmployeListViewControler: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print("emplpye => \(employees)")
        print("baksanabana\(text)")
        employees = vakifBank?.employees.filter({ $0.name == text }) ?? []
        if text == "" {
            employees = vakifBank?.employees ?? []
        }
        employeTableView.reloadData()
    }
}
