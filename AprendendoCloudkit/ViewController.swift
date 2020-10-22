//
//  ViewController.swift
//  AprendendoCloudkit
//
//  Created by Alley Pereira on 22/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayDeAlunos: [Alunos] = [] {
        didSet{
            DispatchQueue.main.async {
                for alunos in self.arrayDeAlunos {
                    print("Aluno: \(alunos.name) Número da chamada: \(alunos.roll)")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAlunos()
    }
    func getAlunos() {
        modelCloudkit.currentModel.fetchAlunos { response in
            switch response {
            case .success(let data):
                self.arrayDeAlunos = data
            case .failure(let error):
                print(error)
            }  }
    }
    
}

