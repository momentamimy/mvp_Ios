//
//  ViewController.swift
//  MVPTask
//
//  Created by tamimy on 3/26/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import UIKit

protocol FirstViewProtocol: class {
    func navigateToSecondView()
}

class FirstVC: UIViewController, FirstViewProtocol {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var presenter: FirstPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FirstPresenter(viewProtocol: self)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        presenter?.checkCrdentials(username: usernameTF.text ?? "", password: passwordTF.text ?? "")
    }
    
    func navigateToSecondView() {
        let secondView = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        self.present(secondView, animated: true)
    }
}

