//
//  FirstPresenter.swift
//  MVPTask
//
//  Created by tamimy on 3/26/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import Foundation
import UIKit.UIViewController

protocol FirstPresenterProtocol: class {
    func checkCrdentials(username: String, password: String)
}

class FirstPresenter: NSObject, FirstPresenterProtocol {
    
    weak var view: FirstViewProtocol?
    
    init(viewProtocol: FirstViewProtocol) {
        super.init()
        view = viewProtocol
    }
    
    func checkCrdentials(username: String, password: String) {
        if username == "" || password == "" {
            return
        } else {
            if isCorrectCredentials(username: username, password: password) {
                view?.navigateToSecondView()
            }
        }
    }
    
    private func isCorrectCredentials(username: String, password: String) -> Bool{
        if let userModel = checkForCredentialInJson() {
            if userModel.username == username && userModel.password == password {
                return true
            }
            return false
        } else {
            return false
        }
    }

    private func checkForCredentialInJson() -> User? {
        if let path = Bundle.main.path(forResource: "Users", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let userModel = try decoder.decode(User.self, from: data)
                return userModel
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
