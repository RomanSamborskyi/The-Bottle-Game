//
//  StartAppView.swift
//  Bottle Game
//
//  Created by Roman Samborskyi on 09.08.2022.
//

import SwiftUI

struct StartAppView: View {
    @State var strokeStartAnimation = false
    @State var strokeEndAnimation = true
    @State private var changeView = false
    @State private var isRottated = true
    @State private var isRottate:Int = 0
    @Binding var showLaunchScreen :Bool
    @AppStorage("isDark") private var isDark = false
    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
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
                Image("bottle")
                    .resizable()
                    .frame(width: 75, height: 200)
                    .rotationEffect(.degrees(isRottated ? 0 : 360))
                Circle()
                    .trim(from: strokeStartAnimation ? 1/3 : 1/9, to: strokeEndAnimation ? 2/5 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color(red: 0.2, green: 2, blue: 3))
                    .rotationEffect(.degrees(isRottated ? 360 : 0))
                    
                    }.onAppear(){
                        withAnimation(Animation.linear(duration: 1).repeatCount(3))
                        {self.isRottated.toggle(); isRottate += 1}
                        withAnimation(Animation.linear(duration: 1).delay(0.5).repeatCount(2))
                        {self.strokeStartAnimation.toggle(); isRottate += 1}
                        withAnimation(Animation.linear(duration: 1).delay(1).repeatCount(1))
                        {self.strokeEndAnimation.toggle(); isRottate += 1;
                            if isRottate <= 3 {
                            showLaunchScreen = false
                    }else{ isRottate += 1}}
                }
            }
        }
struct StartAppView_Previews: PreviewProvider {
    static var previews: some View {
        StartAppView(showLaunchScreen: .constant(true))
    }
}
