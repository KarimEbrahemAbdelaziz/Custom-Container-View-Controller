//
//  SessionsViewController.swift
//  ContainerTest
//
//  Created by Graphic on 5/12/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import UIKit

class SessionsViewController: UIViewController {

    weak var baseViewController: CustomContainerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update(_ sender: UIButton) {
        baseViewController.switchViews(whereToGo: 0)
    }

}
