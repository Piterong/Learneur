//
//  ContentDetailsPage.swift
//  Learneur
//
//  Created by Piter Wongso on 27/07/22.
//

import SwiftUI

struct ContentDetailsPage: View {
    @State var lo : TechnicalLearningObjectives
    @ObservedObject var model = ViewModel()

    var body: some View {
       
            ZStack (alignment: .leading){
                colorPicker(type: "tech").ignoresSafeArea()
                    .padding(.bottom,500)
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        VStack (alignment: .leading){
                            HStack{
                                Text(lo.code)
                                    .frame(width: 128, height: 40, alignment: .leading)
                                    .minimumScaleFactor(0.2)
                            .font(.system(size: 34, weight: .bold))
                                ChallengeRecommendation(lo:lo)
                            }
                        Text(lo.goal)
                            .font(.system(size: 12, weight: .light))
                            .italic()
                            .frame(width: 300, height: 40, alignment:.topLeading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        }
                    }.padding(.top,50).padding(.leading,40)
                    Spacer()
                    ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.white)
                        VStack(alignment: .leading){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Objective:")
                                        .font(.system(size: 14, weight: .bold))
                                        .padding(.vertical,2)
                                    Text(lo.objective)
                                        .font(.system(size: 12, weight: .light))
                                        .italic()
                                        
                                }
                                Spacer()
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
                            Text("Core Keywords:")
                                .font(.system(size: 14, weight: .bold))
                                .padding(.vertical,2)
                            Text(lo.coreKeyword.isEmpty ? "No keywords found" : lo.coreKeyword)
                                .font(.system(size: 12, weight: .light))
                                .italic()
                            Text("Elective Keywords:")
                                .font(.system(size: 14, weight: .bold))
                                .padding(.vertical,2)
                            Text(lo.electiveKeyword.isEmpty ? "No keywords found" : lo.electiveKeyword)
                                .font(.system(size: 14, weight: .light))
                                .italic()
                            NavigationLink {
                                WebView(webID: "\(lo.documentation)")
                            } label: {
                                Text("click here for documentation")
                                    .font(.system(size: 14, weight: .regular))
                                    .italic()
                                    .foregroundColor(.blue)
                                    .padding(.vertical,1)
                            }
                            Text("Some examples:")
                                .font(.system(size: 14, weight: .bold))
                            ScrollView{
                            VStack{
                                VideoView(videoID: lo.currentLink.randomElement() ?? "")
                                    .frame(width: 300, height: 130)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                Spacer()
                                VideoView(videoID: lo.currentLink.randomElement() ?? "")
                                    .frame(width: 300, height: 130)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                Spacer()
                                VideoView(videoID: lo.currentLink.randomElement() ?? "")
                                    .frame(width: 300, height: 130)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                Spacer()
                            }
                            }.frame(width: 300, height: 270)
                            Button {
                                lo.completed.toggle()
                                model.toggleCompleted(lo: lo)
//                                model.getData()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 180, height: 40, alignment: .center)
                                        .foregroundColor(lo.completed ? .red :.green)
                                    Text(lo.completed ? "Not Done Yet" : "Finish Learning")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .bold))
                                }.frame(width: UIScreen.main.bounds.width-100, height: 40, alignment: .center)
                                    .padding(.top)
                            }

                        }.padding(.horizontal,40).padding(.bottom,80)
                        
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: 700)
                    
                }
               
            }
            //        .navigationBarHidden(true)
        .onAppear {
            model.getData()
        }
        .onDisappear {
            model.getData()
        }
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

struct ContentDetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailsPage(lo: TechnicalLearningObjectives(id: "TEC001", code: "TEC001", objective: "Macro", challengeRecommendation: "Mini 1; Macro; Nano 1", bookmarked: true, completed: true, documentation: "https://developer.apple.com/documentation/uikit/text_display_and_fonts", coreKeyword: "UILabel; UITextField;", electiveKeyword: "UITextView;", goal: "Learn how to work with interfaces development", goalSN: ""))
    }
}

struct ChallengeRecommendation: View {
    var lo : TechnicalLearningObjectives
    var body: some View {
        HStack{
            if lo.challengeRecommendation.contains("Mini 1"){
                Text("Mini 1")
                    .padding(5)
                    .background()
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black))
                
            }
            if lo.challengeRecommendation.contains("Mini 2"){
                Text("Mini 2")
                    .padding(5)
                    .background()
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }
            if lo.challengeRecommendation.contains("Nano 1"){
                Text("Nano 1")
                    .padding(5)
                    .background()
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }
            if lo.challengeRecommendation.contains("Nano 2"){
                Text("Nano 2")
                    .padding(5)
                    .background()
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }
            if lo.challengeRecommendation.contains("Nano 3"){
                Text("Nano 3")
                    .padding(5)
                    .background()
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }
            if lo.challengeRecommendation.contains("Macro"){
                Text("Macro")
                    .padding(5)
                    .background()
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }
        }
    }
}
