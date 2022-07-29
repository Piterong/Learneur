//
//  DetailsPage.swift
//  Learneur
//
//  Created by Piter Wongso on 25/07/22.
//

import SwiftUI

struct DetailsPage: View {
    @State var searchbar = ""
    @ObservedObject var model = ViewModel()
    @State var buttonIndex = 1
    @State var type : String = ""
    var body: some View {
        
            ZStack (alignment: .leading){
                colorPicker(type: "tech").ignoresSafeArea()
                    .padding(.bottom,500)
                VStack(alignment: .leading, spacing: 10){
                    Group {
                        Text("Technical")
                            .font(.system(size: 34, weight: .bold))
                        Text("110 learning objectives")
                            .font(.system(size: 12, weight: .light))
                    }.padding(.leading,40)
                    
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: UIScreen.main.bounds.size.width, height: 650)
                            .foregroundColor(.white)
                        VStack{
                            TextField("Find a topic...", text: $searchbar)
                                .font(.system(size: 12, weight: .bold ))
                                .padding()
                                .frame(width: 330, height: 40)
                                .background(Color.learneurGrey)
                                .cornerRadius(20)
                            HStack{
                                Button {
                                    buttonIndex = 1
                                    model.getData()
                                } label: {
                                    Text("All")
                                        .padding(.horizontal,10)
                                        .padding(.vertical,5)
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .bold))
                                        .background(buttonIndex == 1 ? Color.learneurBlue : Color.learneurGrey)
                                        .cornerRadius(10)
                                }
                                Button {
                                    buttonIndex = 2
                                    model.getData()
                                } label: {
                                    Text("Finished")
                                        .padding(.horizontal,10)
                                        .padding(.vertical,5)
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .bold))
                                        .background(buttonIndex == 2 ? Color.learneurBlue : Color.learneurGrey)
                                        .cornerRadius(10)
                                }
                                Button {
                                    buttonIndex = 3
                                    model.getData()
                                } label: {
                                    Text("Unfinished")
                                        .padding(.horizontal,10)
                                        .padding(.vertical,5)
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .bold))
                                        .background(buttonIndex == 3 ? Color.learneurBlue : Color.learneurGrey)
                                        .cornerRadius(10)
                                }
                                Button {
                                    buttonIndex = 4
                                    model.getData()
                                } label: {
                                    Text("Bookmarked")
                                        .padding(.horizontal,10)
                                        .padding(.vertical,5)
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .bold))
                                        .background(buttonIndex == 4 ? Color.learneurBlue : Color.learneurGrey)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.vertical,5)
                            ScrollView{
                                ForEach(model.list){ lo in
                                    if buttonIndex == 1 {
                                        listOfLO(lo: lo)
                                    }else if buttonIndex == 2 {
                                        if lo.completed{
                                            listOfLO(lo: lo)
                                        }
                                    }else if buttonIndex == 3 {
                                        if !lo.completed{
                                            listOfLO(lo: lo)
                                        }
                                    }else {
                                        if lo.bookmarked{
                                            listOfLO(lo: lo)
                                        }
                                    }
                                }
                            }
//                            List (model.list){ lo in
//                                HStack{
//                                    Image(systemName: "circle.fill")
//                                        .resizable()
//                                        .frame(width: 8, height: 8)
//                                        .foregroundColor(lo.completed ? Color.green : Color.black)
//                                    Text(lo.code)
//                                        .font(.system(size: 12, weight: .bold))
//                                    Divider()
//                                    VStack (alignment: .leading, spacing:5 ){
//                                        Text(lo.objective)
//                                            .font(.system(size: 12, weight: .regular))
//                                            .multilineTextAlignment(.leading)
//                                        Text("Keywords: \(lo.electiveKeyword.isEmpty ? "-" : lo.electiveKeyword)")
//                                            .font(.system(size: 12, weight: .thin))
//                                    }
//                                }
//                            }
                            
                            NavigationLink {
                                WebView(webID: "https://docs.swift.org/swift-book/LanguageGuide/Functions.html")
                            } label: {
                                Text("click here for documentation")
                                    .font(.system(size: 14, weight: .regular))
                                    .italic()
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        .padding()
                    }
                    
                }
            }
            //        .navigationBarHidden(true)
        .onAppear {
            model.getData()
        }
    }
    init(){
        model.getData()
    }
    func colorPicker(type : String) -> Color{
        if type == "tech" {
            return Color.learneurBlue
        }else if type == "design"{
            return Color.learneurPeach
        }else {
            return Color.learneurRed
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage()
    }
}


struct listOfLO: View {
    @State var lo : TechnicalLearningObjectives
    @ObservedObject var model = ViewModel()
    var body: some View {
        NavigationLink {
            ContentDetailsPage(lo: lo)
        } label: {
            ZStack{
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color.learneurGrey)
                HStack{
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(lo.completed ? Color.green : Color.black)
                        .padding(.leading,10)
                    Text(lo.code)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                    Divider()
                    VStack (alignment: .leading, spacing:5 ){
                        Text(lo.objective)
                            .font(.system(size: 12, weight: .regular))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                        Text("Keywords: \(lo.electiveKeyword.isEmpty ? "-" : lo.electiveKeyword)")
                            .font(.system(size: 12, weight: .thin))
                            .foregroundColor(.black)
                    }
                    .padding(.leading,5).padding(.vertical,10)
                    Spacer()
                    Divider().padding(.leading)
                    Button {
                        lo.bookmarked.toggle()
                        model.toggleBookmark(lo: lo)
                        model.getData()
                    } label: {
                        Image(systemName: lo.bookmarked ? "bookmark.fill" : "bookmark").foregroundColor( lo.bookmarked ? Color.yellow : Color.black)
                            .padding(.trailing, 15)
                            .frame(width: 40, height: 40, alignment: .trailing)
                    }

                   
                }
            }.frame(width: 320, height: .infinity)
        }
    }
}
