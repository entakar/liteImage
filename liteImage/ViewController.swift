//
//  ViewController.swift
//  liteImage
//
//  Created by EndoTakashi on 2019/07/03.
//  Copyright © 2019 tak. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    let userDefaults = UserDefaults.standard
    var saveData  = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if userDefaults.object(forKey: "image") != nil {
            let image = UIImage(data: userDefaults.object(forKey: "image") as! Data)
            imageView.image = image
        }
    }

    @IBAction func selectButtonAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    // 撮影完了時
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 元の処理
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        let saveImage = imageView.image?.pngData()
        userDefaults.set(saveImage, forKey: "image")
        // 終了
        dismiss(animated: true, completion: nil)
    }
    
}

