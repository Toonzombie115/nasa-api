//
//  ViewController.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 26/05/25.
//

import UIKit

class APODViewController: UIViewController {
    
    private let apodView = APODView()
    private let repository = APODRepository()
    var hdImgURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(popImg(_:)))
        apodView.picture.addGestureRecognizer(tap)
        fetchAPOD()
    }
    
    override func loadView() {
        self.view = apodView
    }
    
    private func fetchAPOD (){
        repository.fetchAPOD{ [weak self] (response: APODResponse) in
            guard let self = self else{
                return
            }
            
            DispatchQueue.main.async {
                self.apodView.picture.loadImg(url: response.url)
                self.apodView.explanation.text = response.explanation
                self.apodView.title.text = response.title
                self.hdImgURL = response.hdurl ?? response.url
            }
        }
    }
    
    @objc private func popImg(_ sender: UITapGestureRecognizer){
        self.presentFullScreenImg(from: hdImgURL!)
    }
    
    
    
    private func presentFullScreenImg(from url: String){
        
        let fullscreen = UIImageView(frame: view.bounds)
        fullscreen.backgroundColor = .black
        fullscreen.contentMode = .scaleAspectFit
        fullscreen.isUserInteractionEnabled = true
        fullscreen.loadImg(url: url)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullScreenImg))
        fullscreen.addGestureRecognizer(tap)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        self.view.addSubview(fullscreen)
        
    }
    @objc func dismissFullScreenImg(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
}
