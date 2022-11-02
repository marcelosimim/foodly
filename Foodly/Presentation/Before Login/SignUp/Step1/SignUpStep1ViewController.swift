//
//  SignUpStep1ViewController.swift
//  Foodly
//
//  Created by Marcelo Simim Santos on 11/2/22.
//

import RxSwift
import UIKit

class SignUpStep1ViewController: UIViewController, Coordinating {
    private let customView = SignUpStep1View()
    private let viewmodel = AppContainer.shared.resolve(SignUpStep1ViewModel.self)!
    private let disposeBag = DisposeBag()
    private let imagePickerController = UIImagePickerController()
    private let cameraPickerController = UIImagePickerController()
    var coodinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view = customView
        customView.setup()
        customView.inputTextField.textField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModelBinds()
        configurePickers()
    }

    private func setupButtons() {
        customView.inputTextField.clearButton.addTarget(self, action: #selector(clearPressed), for: .touchDown)
        customView.inputTextField.arrowButton.addTarget(self, action: #selector(arrowPressed), for: .touchDown)
        customView.userPhoto.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addPhotoPressed)))
    }

    @objc private func clearPressed() {
        customView.inputTextField.textField.text = ""
        viewmodel.checkName("")
    }

    @objc private func arrowPressed() {
        viewmodel.saveName()
        coodinator?.eventOccurred(with: .signUpStep1Tapped)
    }

    private func viewModelBinds() {
        let arrowButton = customView.inputTextField.arrowButton

        viewmodel.isNameValid.bind { isValid in
            arrowButton.isEnabled = isValid
        }.disposed(by: disposeBag)
    }
}

extension SignUpStep1ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewmodel.checkName(textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}

extension SignUpStep1ViewController: UIImagePickerControllerDelegate,   UINavigationControllerDelegate {
    func configurePickers() {
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        cameraPickerController.allowsEditing = true
        cameraPickerController.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraPickerController.sourceType = .camera
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage, let data = image.pngData() else { return }
            viewmodel.savePhoto(data)
            customView.userPhoto.changeImage(data)
            dismiss(animated: true)
    }

    @objc private func addPhotoPressed() {
        let actionSheet = UIAlertController(title: "Escolha a fonte", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { _ in
            self.present(self.cameraPickerController, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Biblioteca", style: .default, handler: { _ in
            self.present(self.imagePickerController, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        present(actionSheet, animated: true)
    }
}
