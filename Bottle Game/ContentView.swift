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
    @State var showSettings: Bool = false
    
    var animation: Animation {
        Animation.easeIn
    }
    var body: some View {
        ZStack{
            //Background gradient
        LinearGradient(gradient:Gradient(colors: [
                Color.black,
                Color.blue,
                Color.black,
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
                        .foregroundColor(Color.init(red: 0.4, green: 11, blue: 4, opacity: 0.2))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                        .shadow(color: .black, radius: 3)
                }
            }
            VStack{
                Spacer()
            Button( action: {
                showSettings.toggle()
            }){
                    Text("made with \(Image(systemName: "heart.fill")) by @RomanSamborskyi")
                    .foregroundColor(Color.gray)
                }
            }
        }
        .sheet(isPresented: $showSettings, content:{ AbotAppView()})
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
