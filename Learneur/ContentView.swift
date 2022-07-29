//
//  ContentView.swift
//  Learneur
//
//  Created by Piter Wongso on 22/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        NavigationView{
        HStack{
            VStack(alignment: .leading, spacing: 10){
            Text ("Hey Piter,")
                .font(.system(size: 24, weight: .bold))
                .padding(.leading)
            Text ("Find an objective you want to learn")
                .font(.system(size: 12, weight: .light))
                .padding(.leading)
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 330, height: 40, alignment: .center)
                        .foregroundColor(.learneurGrey)
                    Text("Search for anything ... \(searchText)")
                        .searchable(text: $searchText)
                        .padding(.leading)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .opacity(0.5)
                }.padding()
                
                
            Text("Categories")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.leading)
                HStack{
                    VStack(spacing: 20){
                        NavigationLink {
                            DetailsPage()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.learneurBlue)
                                    .shadow(radius: 5)
                                VStack(spacing:5){
                                    Text("Technical")
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                    Text("110 learning objectives")
                                        .font(.system(size: 12, weight: .light, design: .default))
                                }
                               
                            }.frame(width: 155, height: 79, alignment: .center)
                            .foregroundColor(.black)
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 20) .foregroundColor(.learneurPeach)
                                .shadow(radius: 5)
                            VStack(spacing:5){
                                Text("Design")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                Text("44 learning objectives")
                                    .font(.system(size: 12, weight: .light, design: .default))
                            }
                            Color.black.opacity(0.4).cornerRadius(20)
                        }.frame(width: 155, height: 71, alignment: .center)
                            .foregroundColor(.black)
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.learneurRed)
                                .shadow(radius: 5)
                            VStack(spacing:5){
                                Text("Process")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                Text("34 learning objectives")
                                    .font(.system(size: 12, weight: .light, design: .default))
                            }
                            Color.black.opacity(0.4).cornerRadius(20)
                        }.frame(width: 155, height: 73, alignment: .center)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    VStack(spacing: 40){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.learneurGreen)
                                .shadow(radius: 5)
                            VStack(spacing:5){
                                Text("Professional\nSkills")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .multilineTextAlignment(.center)
                                Text("26 learning objectives")
                                    .font(.system(size: 12, weight: .light, design: .default))
                            }
                            Color.black.opacity(0.4).cornerRadius(20)
                        }.frame(width: 155, height: 99, alignment: .center)
                            .foregroundColor(.black)
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.learneurYellow)
                                .shadow(radius: 5)
                            VStack(spacing:5){
                                Text("App Business\nAnd\nMarketing")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .multilineTextAlignment(.center)
                                Text("14 learning objectives")
                                    .font(.system(size: 12, weight: .light, design: .default))
                            }
                            Color.black.opacity(0.4).cornerRadius(20)
                        }.frame(width: 155, height: 104, alignment: .center)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .padding()
//
//            VideoView(videoID: "CX-BdDHW0Ho")
//                    .frame(width: 300, height: 130)
//                    .cornerRadius(8)
//                    .padding(.horizontal)
//
//            VideoView(videoID: "m3XbTkMZMPE")
//                    .frame(width: 300, height: 130)
//                    .cornerRadius(8)
//                    .padding(.horizontal)
//            WebView(webID: "https://developer.apple.com/documentation/playgroundbluetooth")
            Spacer()
            
            }.padding()
            Spacer()
        }
        .navigationBarHidden(true)
        }.accentColor(.black)
    }
    init(){
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
