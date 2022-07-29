//
//  SplashScreen.swift
//  Learneur
//
//  Created by Piter Wongso on 29/07/22.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
    var body: some View {
                if self.isActive {
                    ContentView()
                }else{
                    ZStack{
                        Color.learneurGrey.ignoresSafeArea()
                        Image("LearneurSplash").scaleEffect(0.3)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        self.isActive = true
                                    }
                                }
                            }
                }
            }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
