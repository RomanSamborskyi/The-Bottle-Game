//
//  AbotAppView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 13.08.2022.
//

import SwiftUI

struct AbotAppView: View {
    @State var animatedButton : Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient:Gradient(colors: [
                    Color.black,
                    Color.blue,
                    Color.black,
                ]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                ).ignoresSafeArea(.all,edges: .all)
           VStack{
        Image("me")
            .resizable()
            .frame(width: 270, height: 245)
            .clipShape(Circle())
            .shadow(color: Color.black, radius: 10)
            .padding()
            
            Text("Hello 👋, my name is Roman Samborskyi and I'm passionate about programming and just learning it 📖This application is my first app.This is a simple game, bottle.So enjoy it 😉")
                .font(.callout)
                .foregroundColor(Color.gray)
                .bold()
                .padding()
            
               Text("If you enjoy this app, you can by me a cup of coffee ☕️")
                   .font(.callout)
                   .foregroundColor(Color.gray)
                   .bold()
                   .padding()
                  
                    Button(action:{
                       //
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 3)
                                .foregroundColor(Color.teal)
                                .frame(width: 110, height: 55, alignment: .center)
                                
                        Text("$ 1.00")
                            .font(.body)
                            .foregroundColor(Color.black)
                            .bold()
                        }.shadow(color: Color.black, radius: 10, x: 0, y: animatedButton ? 40 : 0)
                            .scaleEffect(animatedButton ? 1.15 : 1.0)
                    }.padding(40)
                     
                    
               Text("Also you can connect with me by email 📧")
                   .font(.body)
                   .foregroundColor(Color.gray)
                   .bold()
                   .padding(10)
               Text("r.samborskyi@gmail.com")
                   .textContentType(.emailAddress)
                   .font(.headline)
               Spacer()
           }.onAppear(perform: animatedButtonFunc)
        }
    }
    func animatedButtonFunc(){
        guard !animatedButton else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()){
                animatedButton.toggle()
            }
        }
    }
}

struct AbotAppView_Previews: PreviewProvider {
    static var previews: some View {
        AbotAppView()
                .preferredColorScheme(.light)
    }
}

