//
//  SecondPresenter.swift
//  MVPTask
//
//  Created by tamimy on 3/26/20.
//  Copyright © 2020 tamimy. All rights reserved.
//

import Foundation

protocol SecondPresenterProtocol: class {
    func logoutPressed()
}

class SecondPresenter: NSObject, SecondPresenterProtocol {
    
    weak var view: SecondViewProtocol?
    
    init(viewProtocol: SecondViewProtocol) {
        super.init()
        view = viewProtocol
    }
    
    func logoutPressed() {
        view?.navigateToFirstView()
    }
}
