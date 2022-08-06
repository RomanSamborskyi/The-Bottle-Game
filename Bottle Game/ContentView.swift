//
//  ContentView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isRotated = 0.0
    var animation: Animation {
        Animation.easeIn
    }
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient:Gradient(colors: [
                Color.blue,
                Color.red,
                Color.purple,
                Color.pink
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
                Button(action:{
                    let d = Double.random(in: 720...7200)
                    let baseAnimation = Animation.easeInOut(duration: d / 660)
                        withAnimation (baseAnimation) {
                        self.isRotated += d
                        }
                }){
                    Text("SPIN")
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white,Color.gray,Color.white]), startPoint: .topLeading, endPoint:. bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: .black, radius: 10)
                }
            }
            
            VStack{
                Spacer()
                    Text("made by @Roman Samborskyi")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
