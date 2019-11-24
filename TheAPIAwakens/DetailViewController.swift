//
//  DetailViewController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import UIKit

final class DetailViewController: UITableViewController {
    
    var entity: StarWarsEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = entity as? Person {
            PeopleController.fetchHomePlanet(for: person) { result in
                if let result = result {
                    switch result {
                    case .success(let planet): print(planet)
                    case .failure(let error): print(error)
                    }
                }
            }
            
            VehicleController<Vehicle>.fetchVehicles(for: person) { result in
                if let result = result {
                    switch result {
                    case .success(let vehicles): vehicles.forEach { print("Vehicles: \($0.name)") }
                    case .failure(let error): print(error)
                    }
                }
            }
            
            VehicleController<Starship>.fetchVehicles(for: person) { result in
                if let result = result {
                    switch result {
                    case .success(let starships): starships.forEach { print("Starships: \($0.name)") }
                    case .failure(let error): print(error)
                    }
                }
            }
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
