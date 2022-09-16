//
//  AbotAppView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 13.08.2022.
//

import SwiftUI

struct AbotAppView: View {
    @Environment (\.colorScheme) var colorSheme
    
    var body: some View {
        ZStack{
           VStack{
        Image("me")
            .resizable()
            .frame(width: 270, height: 245)
            .clipShape(Circle())
            .shadow(color: Color.black, radius: 10)
            .padding()
            
            Text("Hello 👋, my name is Roman Samborskyi and I'm passionate about programming and just learning it 📖This application is my first app.This is a simple game, bottle.So enjoy it 😉")
                .font(.callout)
                .bold()
                .padding()
            
               Text("If you enjoy this app, you can by me a cup of coffee ☕️")
                   .font(.callout)
                   .bold()
                   .padding()
                  
                    Button(action:{
                       //
                    }){
                        ZStack{
                            Rectangle().cornerRadius(12)
                                .foregroundColor(Color.gray)
                                .frame(width: 110, height: 55, alignment: .center)
                        Text("$ 1.00")
                                .font(.body)
                            .foregroundColor(Color.black)
                            .bold()
                        }
                    }.padding(40)
                    
               Text("Also you can connect with me by email 📧")
                   .font(.body)
                   .bold()
                   .padding(10)
               Text("r.samborskyi@gmail.com")
                   .textContentType(.emailAddress)
                   .font(.headline)
               Spacer()
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

