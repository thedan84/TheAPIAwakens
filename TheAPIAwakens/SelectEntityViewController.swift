//
//  SelectEntityViewController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import UIKit

final class SelectEntityViewController: UITableViewController {
    
    enum Identifer: String {
        case showPeople, showVehicles, showStarships
    }
    
    var segueIdentifer: String?
    var entities = [StarWarsEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let identifierString = segueIdentifer, let identifier = Identifer(rawValue: identifierString) {
            switch identifier {
            case .showPeople:
                EntityController<Person>.fetchAll(completion: handleResult)
            case .showStarships:
                EntityController<Starship>.fetchAll(completion: handleResult)
            case .showVehicles:
                EntityController<Vehicle>.fetchAll(completion: handleResult)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entityCell", for: indexPath)

        cell.textLabel?.text = entities[indexPath.row].name
        
//        if let detailCell = cell as? DetailCell {
//            detailCell.configure(with: entities[indexPath.row])
//            detailCell.delegate = self
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let cell = tableView.cellForRow(at: indexPath)
//
//        if let detailCell = cell as? DetailCell {
//            detailCell.collapseCell()
//        }
        
        guard let navController = storyboard?.instantiateViewController(withIdentifier: "DetailNavController") as? UINavigationController,
            let detailVC = navController.viewControllers.first as? DetailViewController else { return }
        
        detailVC.entity = entities[indexPath.row]
        
        present(navController, animated: true)
    }
    
    private func handleResult<T: StarWarsEntity>(_ result: Result<[T], Error>) {
        do {
            entities = try result.get()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            DispatchQueue.main.async {
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        }
    }
}

//extension SelectEntityViewController: DetailCellDelegate {
//    func beginHeightUpdate(for cell: DetailCell) {
//        tableView.beginUpdates()
//    }
//
//    func endHeightUpdate(for cell: DetailCell) {
//        tableView.endUpdates()
//    }
//}
