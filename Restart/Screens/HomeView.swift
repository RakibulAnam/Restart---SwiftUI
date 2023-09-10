//
//  HomeView.swift
//  Restart
//
//  Created by Jotno on 9/10/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = false
    @State private var isAnimating : Bool = false
    
    
    var body: some View {
        
        
        VStack(spacing: 20){
            //MARK: - HEADER
            
            Spacer()
            
            ZStack {
                
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation
                        .easeInOut(duration: 4)
                        .repeatForever()
                        , value: isAnimating)
            }
            
            
            
            
            //MARK: - CENTER
            Text("The Time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - FOOTER
            
            Spacer()
            
            Button(action:{
                
                withAnimation{
                    isOnboardingViewActive = true
                }
                
            })
            {
                // When 2 or more elements are used in a button, it is already stackedin a hstack
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        } //: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
