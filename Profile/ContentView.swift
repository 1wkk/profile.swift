//
//  ContentView.swift
//  Profile
//
//  Created by Eureka on 2022/7/4.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowContactView = false
    
    let profile = Resume.shared
    
    var body: some View {
        ScrollView {
            VStack (spacing: 30) {
                ProfileView
                
                Text(profile.bio).font(.title3).lineSpacing(10)
                
                ContactMeView
                
                Text("Skills")
                    .bold().font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                SkillsView
                
                Text("Experiences")
                    .bold().font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ExperiencesView
                
            }.padding()
                .overlay(Color.black.opacity(isShowContactView ? 0.5 : 0))
                .onTapGesture {isShowContactView = false}
                .overlay(alignment: .top) { ContactOverlayView }
                .animation(.spring(), value: isShowContactView)
        }.background(Color(uiColor: .secondarySystemBackground))
    }
    
    // MARK: - ProfileView
    var ProfileView: some View {
        HStack {
            Image("Avatar")
                .resizable().aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 200)
            
            VStack (spacing: 20) {
                Text(profile.name)
                    .font(.title).bold()
                Text(profile.title)
                Label(profile.location, systemImage: "location").foregroundColor(.secondary)
            }
        }
    }
    
    // MARK: - ContactMeView
    var ContactMeView: some View {
        Button {
            isShowContactView = true
        } label: {
            Text("Contact Me")
                .foregroundColor(.white)
                .font(.title2.weight(.bold))
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))
        }
    }
    
    // MARK: - ContactOverlayView
    var ContactOverlayView: some View {
        // It looks like without `Group`, the code is still right.
        Group {
            if (isShowContactView) {
                ContactView(isShowContactView: $isShowContactView)
                    .offset(y: UIScreen.main.bounds.maxY * 0.33)
                    .transition(.slide)
            }
        }
    }
    
    // MARK: - SkillsView
    var SkillsView: some View {
        HStack (spacing: 25) {
            ForEach (profile.skills, id: \.self) { skill in
                VStack {
                    Image(skill)
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55)
                    Text(skill)
                }
            }
        }
    }
    
    // MARK: - ExperiencesView
    var ExperiencesView: some View {
        VStack (spacing: 0) {
            ForEach (profile.experiences.indices, id: \.self) { idx in
                HStack {
                    DotLineShape(
                        lineWidth: 3,
                        dotDiameter: 10,
                        style: idx == 0 ? .bottom : idx == profile.experiences.count - 1 ? .top : .full
                    ).frame(width: 70).foregroundColor(.secondary)
                    
                    let exp = profile.experiences[idx]
                    
                    VStack (spacing: 10) {
                        Group {
                            Text("\(exp.start) - \(exp.end)").foregroundColor(.secondary)
                            Text(exp.title).bold()
                            Text(exp.company).padding(.bottom, 30)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
