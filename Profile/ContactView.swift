//
//  ContactView.swift
//  Profile
//
//  Created by Eureka on 2022/7/5.
//

import SwiftUI

struct ContactView: View {
    
    @Binding var isShowContactView: Bool
    
    var body: some View {
        VStack {
            HStack {
                ForEach (Resume.shared.socialMedia, id: \.name) {media in
                    Image(media.name).resizable().aspectRatio(contentMode: .fit).padding()
                        .onTapGesture {
                            openUrl(media.url)
                        }
                }
            }
            
            Text("Cancel").bold().font(.title3).foregroundColor(.secondary).onTapGesture {
                isShowContactView = false
            }
        }.padding().background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(uiColor: .tertiarySystemBackground))
        ).padding()
    }
    
    func openUrl(_ url: String) {
        UIApplication.shared.open(URL(string: url)!)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(isShowContactView: .constant(true)).background(.indigo)
    }
}
