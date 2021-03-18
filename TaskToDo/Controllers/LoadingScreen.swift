//
//  LoadingScreen.swift
//  TaskToDo
//
//  Created by PC on 18/03/2021.
//  Copyright © 2021 db. All rights reserved.
//

import Foundation
import RevealingSplashView

class LoadingScreen: UITableViewController {
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        //MARK: - amnimation loading
        
        let splashView = RevealingSplashView(iconImage: UIImage(named: "logo-TaskToDo")!, iconInitialSize: CGSize(width: 300, height: 300), backgroundImage: UIImage(named: "background")!)
        
        splashView.animationType = SplashAnimationType.squeezeAndZoomOut
        
        //let window = UIApplication.shared.keyWindow
        // window?.addSubview(splashView)
        self.view.addSubview(splashView)
        
        splashView.startAnimation(){
            print("Completed")
        }
}
}
