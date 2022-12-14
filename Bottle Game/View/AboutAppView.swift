//
//  AbotAppView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 13.08.2022.
//

import SwiftUI
import RevenueCat


struct AboutAppView: View {
    @State var animatedButton : Bool = false
    @AppStorage("isDark") private var isDark = false
    var body: some View {
            ZStack{
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
                    ScrollView{
                        Image("me")
                            .resizable()
                            .frame(width: 270, height: 245)
                            .clipShape(Circle())
                            .shadow(color: Color.black, radius: 10)
                            .padding()
                        
                        Text("Hello 👋, my name is Roman Samborskyi and I'm passionate about programming and just learning it 📖This application is my first app.This is a simple game, bottle.So enjoy it 😉")
                            .font(.callout)
                            .foregroundColor(Color.black)
                            .bold()
                            .padding()
                        Text("If you enjoy this app, you can by me a cup of coffee ☕️")
                            .font(.callout)
                            .foregroundColor(Color.black)
                            .bold()
                            .padding()
                        
                        ZStack{
                              PayWallView()
                            }.shadow(color: isDark ? .black : .blue, radius: animatedButton ? 10 : 35, x: 0, y: animatedButton ? 30 : 0)
                                .scaleEffect(animatedButton ? 1.15 : 1.0)
                                .padding(20)
                     
                        Text("Also you can connect with me by email 📧")
                            .font(.body)
                            .foregroundColor(Color.black)
                            .bold()
                            .padding(10)
                        Text("r.samborskyi@gmail.com")
                            .textContentType(.emailAddress)
                            .font(.headline)
                        Spacer()
                    }.onAppear(perform: animatedButtonFunc)
                }
            }
        }
    func animatedButtonFunc(){
        guard !animatedButton else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()){
                animatedButton.toggle()
            }
        }
      }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}

