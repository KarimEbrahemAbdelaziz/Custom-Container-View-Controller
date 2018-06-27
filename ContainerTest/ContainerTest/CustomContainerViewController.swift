//
//  CustomContainerViewController.swift
//  ContainerTest
//
//  Created by Graphic on 5/12/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import UIKit

class CustomContainerViewController: UIViewController {

    private lazy var summaryViewController: SummaryViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        viewController.baseViewController = self
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var sessionsViewController: SessionsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController
        viewController.baseViewController = self
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateView()
    }
    
    private func updateView() {
        add(asChildViewController: summaryViewController)
        remove(asChildViewController: sessionsViewController)
    }
    
    func switchViews(whereToGo: Int) {
        if whereToGo == 0 {
            //remove(asChildViewController: sessionsViewController)
            //add(asChildViewController: self.summaryViewController)
            pop(oldViewController: sessionsViewController, toViewController: summaryViewController)
        } else {
            //remove(asChildViewController: summaryViewController)
            //add(asChildViewController: self.sessionsViewController)
            push(oldViewController: summaryViewController, toViewController: sessionsViewController)
        }
    }
    
    private func push(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        
        addChildViewController(newViewController)
        
        // Add Child View as Subview
        view.addSubview(newViewController.view)
        
        // Configure Child View
        newViewController.view.frame = self.view.bounds
        newViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let customWidth = (self.view.window?.frame.width)!/2.0
        //newViewController.view.layer.position.x = -customWidth
        newViewController.view.layer.position.x = (customWidth)*(3)
        UIView.animate(withDuration: 1.0, animations: {
            oldViewController.view.layer.position.x = customWidth*(-3)
            newViewController.view.layer.position.x = customWidth
        }) { (finished) in
            self.remove(asChildViewController: oldViewController)
            self.add(asChildViewController: newViewController)
        }
        
    }
    
    private func pop(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        
        addChildViewController(newViewController)
        
        // Add Child View as Subview
        view.addSubview(newViewController.view)
        
        // Configure Child View
        newViewController.view.frame = self.view.bounds
        newViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let customWidth = (self.view.window?.frame.width)!/2.0
        newViewController.view.layer.position.x = -customWidth
        
        UIView.animate(withDuration: 1.0, animations: {
            oldViewController.view.layer.position.x = customWidth*3
            newViewController.view.layer.position.x = customWidth
        }) { (finished) in
            self.remove(asChildViewController: oldViewController)
            self.add(asChildViewController: newViewController)
        }
        
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = self.view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }


}
