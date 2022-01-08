//
//  ContentView.swift
//  prova
//
//  Created by Kekko Paciello on 27/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstX: CGFloat = -200
    @State private var secondX: CGFloat = 200

    var body: some View {
        ZStack {
            Image("natale")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 8)
            VStack {
                Text("🎅🏼 Merry")
                    .foregroundColor(.white)
                    .offset(x: firstX)
                    
                Text("Christmas 🎄")
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: secondX)
                
                Button {
                    animate()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 300, height: 60)
                        .foregroundColor(.red)
                        .overlay(Text("Click me").font(.title2).bold().foregroundColor(.white))
                }
                .padding(.top, 30)


            }
            .shadow(radius: 20)
            .font(.largeTitle)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 3)){
                    firstX = 0
                    secondX = 0
                }
        }
        }
    }
    
    func animate() {
        firstX = -200
        secondX = 200
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.easeInOut(duration: 3)){
                firstX = 0
                secondX = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
