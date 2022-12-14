//
//  SnowView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 12.12.2022.
//

import SwiftUI

struct SnowView: View {
    var body: some View {
        VStack{
            SnowView1()
        }.ignoresSafeArea(.all,edges: .all)
    }
    struct SnowView1: UIViewRepresentable {
        
        
        func makeUIView(context: Context) -> some UIView {
            let screenSize = UIScreen.main.bounds
            let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
            view.layer.masksToBounds = true
            let emitterLayer = CAEmitterLayer()
            emitterLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            emitterLayer.emitterShape = .circle
            emitterLayer.emitterPosition = CGPoint(x: screenSize.width/2, y: -100)
            
            emitterLayer.emitterMode = .surface
            emitterLayer.renderMode = .oldestLast
            
            let cell = CAEmitterCell()
            cell.birthRate = 100
            cell.lifetime = 10
            cell.velocity = 100
            cell.scale = 0.01
            cell.emissionRange = CGFloat.pi
                    
            cell.contents = UIImage(named: "snow")?.cgImage
            
            emitterLayer.emitterCells = [cell]
            view.layer.addSublayer(emitterLayer)
            
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
    }
}
