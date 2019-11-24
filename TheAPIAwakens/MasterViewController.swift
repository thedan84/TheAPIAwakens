//
//  ViewController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import UIKit

final class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? SelectEntityViewController else {
                return
        }
        
        destination.segueIdentifer = identifier
    }
}
