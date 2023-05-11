//
//  LaunchScreenVC.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import UIKit

class LaunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        switchView()
    }

    func switchView(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main_view") as! MainVC
                mainVC.modalPresentationStyle = .fullScreen
                let appDel = (UIApplication.shared.delegate as! AppDelegate)
                appDel.window?.rootViewController = mainVC
        }
    }

}
