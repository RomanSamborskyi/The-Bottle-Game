//
//  StartScreenView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 02.08.2022.
//

import SwiftUI

struct StartScreenView: View {
    @State private var changeView = false
    
    var body: some View {
        if changeView{
            ContentView()
        }else{
        ZStack{
        LinearGradient(gradient:Gradient(colors: [Color.white,
                                                  Color.blue,
                                                  Color.white
                                                 ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
        ).ignoresSafeArea(.all,edges: .all)
            
            VStack{
                Text("the Bottle Game")
                    .font(.custom("Savoye LET", size: 90))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(90)
                
                Button(action:{
                    //code
                    self.changeView.toggle()
                
                }){
                    Text("START")
                        .padding()
                        .foregroundColor(Color.black)
                        .font(.title)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white,Color.gray,Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: Color.black, radius: 10)
                    
                        }
            
                Spacer()
                Text("made by @Roman Samborskyi")
                
               }
            }
        }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
