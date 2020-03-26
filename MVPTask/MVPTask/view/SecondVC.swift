//
//  SecondVC.swift
//  MVPTask
//
//  Created by tamimy on 3/26/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import UIKit

protocol SecondViewProtocol: class {
    func navigateToFirstView()
}

class SecondVC: UIViewController, SecondViewProtocol {

    @IBOutlet weak var resultLbl: UILabel!
    
    var presenter: SecondPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SecondPresenter(viewProtocol: self)
    }
    
    func navigateToFirstView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtn(_ sender: Any)
    {
        presenter?.logoutPressed()
    }
}
