//
//  ContentView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 31.07.2022.
//

import SwiftUI

class HapticEngine {
    //Haptic feadback engine
    static let impact = HapticEngine()
        func imapct(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
struct ContentView: View {
    
    @State private var isRotated = 0.0
    var animation: Animation {
        Animation.easeIn
    }
    var body: some View {
        ZStack{
            //Background gradient
            LinearGradient(gradient:Gradient(colors: [
                Color.white,
                Color.blue,
                Color.white,
            ]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            ).ignoresSafeArea(.all,edges: .all)
            
            VStack{
                Image("bottle")
                    .resizable()
                    .frame(width: 80, height: 200)
                    .rotationEffect(.degrees(isRotated))
                    .padding(100)
                //Rotate button of bottle
                Button(action:{
                    HapticEngine.impact.imapct(style: .soft) // vibrate
                    let d = Double.random(in: 720...7200) // random stop of animation
                    let baseAnimation = Animation.easeInOut(duration: d / 660)
                        withAnimation (baseAnimation) {
                        self.isRotated += d
                        }
                }){
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white,Color.gray,Color.white]), startPoint: .topLeading, endPoint:. bottomTrailing))
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 10)
                }
            }
            VStack{
                Spacer()
                    Text("made with \(Image(systemName: "heart.fill")) by @RomanSamborskyi")
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
