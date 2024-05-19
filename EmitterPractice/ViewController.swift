//
//  ViewController.swift
//  EmitterPractice
//
//  Created by Macbook Pro on 16/03/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image : UIImageView!
    
    func creatingEmission(){
        //the layer that emits,animates and renders particles
        let emitterLayer = CAEmitterLayer()
        //emitterposition is the position from where particles will emit
        emitterLayer.emitterPosition = CGPoint(x: self.view.frame.width/2, y: 0)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: self.view.frame.width, height: 2)
    
        let image  = [ UIImage(named: "image"),
                                  UIImage(named:"Image 1"),
                                  UIImage(named:"Image 2"),
                                  UIImage(named:"Image 3")]
        
        let cells = image.compactMap({
            let cell = CAEmitterCell()
            //no. of particles emitted in one sec
            cell.birthRate = 4
            cell.lifetime = 30
            cell.spin = 3
            cell.velocity = .random(in: 50...60)
            cell.scale = 0.1
            cell.emissionRange = CGFloat.pi * 2.0
            cell.contents = $0!.cgImage
            return cell
        })
        
        emitterLayer.emitterCells = cells
        view.layer.addSublayer(emitterLayer)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        creatingEmission()
        
    }

}

