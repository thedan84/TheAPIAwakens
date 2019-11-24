//
//  DetailCell.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import UIKit

protocol DetailCellDelegate: class {
    func beginHeightUpdate(for cell: DetailCell)
    func endHeightUpdate(for cell: DetailCell)
}

final class DetailCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var planetLabel: UILabel!
    
    weak var delegate: DetailCellDelegate?
    
    func configure(with entity: StarWarsEntity) {
        nameLabel.text = entity.name
        
        //TODO: - Rename planetLabel and populate with different entities
        if let vehicle = entity as? Vehicle {
            planetLabel.text = vehicle.cargoCapacity
        }
        
        if let person = entity as? Person {
            PeopleController.fetchHomePlanet(for: person) { [unowned self] result in
                if let result = result {
                    switch result {
                    case .success(let value): self.planetLabel.text = value.name
                    case .failure(let error): print(error)
                    }
                }
            }
            
            VehicleController<Vehicle>.fetchVehicles(for: person) { [unowned self] result in
                if let result = result {
                    switch result {
                    case .success(let vehicles):
                        for vehicle in vehicles {
                            print(vehicle.name)
                        }
                    case .failure(let error): print(error)
                    }
                }
            }
        }
    }
    
    func collapseCell() {
        CATransaction.begin()
        delegate?.beginHeightUpdate(for: self)
        planetLabel.isHidden = !planetLabel.isHidden
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            self.layoutIfNeeded()
        }
        delegate?.endHeightUpdate(for: self)
        CATransaction.commit()
    }
}
