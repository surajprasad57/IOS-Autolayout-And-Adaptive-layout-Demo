//
//  ImageDisplayVC.swift
//  AutoLayoutAssignment
//
//  Created by Suraj Prasad on 07/03/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class ImageDisplayVC: UIViewController {

   var cellImage:UIImage?
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var crossButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayImage.image = cellImage
       
    }
    
   
    @IBAction func dismissView(_ sender: Any) {
        
        crossButton.alpha = 1
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
