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
    @State var animatedButton: Bool = false
    @Environment (\.colorScheme) var colorScheme
    @AppStorage("isDark") private var isDark = false
    
    var body: some View {
        NavigationView{
           ZStack{
            //Background gradient
            LinearGradient(gradient: isDark ? Gradient(colors: [
                Color.black,
                Color.blue,
                Color.black,
            ]) : Gradient(colors: [
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
                        .foregroundColor(Color.init(red: 0.4, green: 11, blue: 4, opacity: 0.2))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                        .shadow(color: isDark ? .black : .blue, radius:animatedButton ? 10 : 45, x: 0, y: animatedButton ? 30 : 0)
                        .scaleEffect(animatedButton ? 1.15 : 1.0)
                }
            }.onAppear(perform: animatedBuuton)
            VStack{
             Spacer()
                
            Button( action: {
                showSettings.toggle()
            }){
                Text("made with \(Image(systemName: "heart.fill")) by @RomanSamborskyi")
                    .foregroundColor(Color.gray)
                }
            }
           }.sheet(isPresented: $showSettings, content:{ AbotAppView()})
                .navigationTitle("")
                .navigationBarItems(leading: Button(action:{
                    isDark.toggle()
                }){
                    Text(Image(systemName: isDark ? "moon.fill" : "sun.max.fill"))
                        .foregroundColor(isDark ? Color.purple : Color.yellow)
                }.buttonStyle(.bordered).tint(isDark ? .gray : .blue))
        }.environment(\.colorScheme, isDark ? .dark : .light)
}
    func animatedBuuton(){
        guard !animatedButton else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()){
                animatedButton.toggle()
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
