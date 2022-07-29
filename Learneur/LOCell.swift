//
//  LOCell.swift
//  Learneur
//
//  Created by Piter Wongso on 27/07/22.
//

import SwiftUI

struct LOCell: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        ZStack{
        Rectangle()
            .cornerRadius(10)
            .foregroundColor(Color.learneurGrey)
            HStack{
                
            }
        }.frame(width: 320, height: 35)
    }
}

struct LOCell_Previews: PreviewProvider {
    static var previews: some View {
        LOCell()
    }
}
