//
//  BookUploadViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/7/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BookUploadViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var bookCoverView: UIView!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var descTextArea: UIView!
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateViews([descLabel,descTextArea])
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(uploadBookCover))
        bookCoverView.isUserInteractionEnabled = true
        bookCoverView.addGestureRecognizer(tapGesture)
    
    }
    
    @objc private func uploadBookCover(){
        print("Tapped--BookCoverView")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Photo Source", message: "Upload BookCover", preferredStyle: .actionSheet)
        let alertActionTakePhoto = UIAlertAction(title: "Take a photo", style: .default) { (completed) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }else {
                self.alertMessage("No Camera available")
            }
        }
        let alertActionLibrary = UIAlertAction(title: "Photo Library", style: .default) { (completed) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(alertActionTakePhoto)
        alertController.addAction(alertActionLibrary)
        alertController.addAction(alertActionCancel)
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.bookCover.contentMode = .scaleAspectFit
            self.bookCover.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    private func decorateViews(_ sender: [UIView]) {
        for s in sender{
            s.layer.borderColor = UIColor.orange.cgColor
            s.layer.borderWidth = 1
            s.layer.cornerRadius = 16
        }
    }
    
    private func alertMessage(_ message: String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        print("pressed--DONE")
        self.alertMessage("The book has been uploaded to database")
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        print("pressed--Cancel")
        navigationController?.popViewController(animated: true)
    }
}
