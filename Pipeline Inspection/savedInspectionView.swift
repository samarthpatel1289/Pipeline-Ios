//
//  savedInspectionView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/28/23.
//

import SwiftUI

struct savedInspectionView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
    @State private var back = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
                Color.white
                .ignoresSafeArea()
            VStack(alignment:.leading, spacing: 20){
                HStack {
                    Spacer()
                    Button(action: {})
                    {
                        Image(systemName: "person.circle")

                        .imageScale(.large)
                        .padding(20)
                    }
//                    .fullScreenCover(isPresented: $showProfile) {
//                        ProfileView(userId: $userId)
//                    }
                        }
                        Text("Saved Inspection")
                         .fontWeight(.bold)
                HStack{
                    Image(systemName: "cloud")

                    .imageScale(.large)
                    .padding(20)
                    Spacer()
                    VStack{
                        Text("ABC Company")
                            .bold()
                            
                        Text("Houston, Texas")
                            .font(.system(size:20))
                        Text("02/12/2023")
                            .font(.system(size:20))
                    }
                    .padding(8)
                }
                .background(customColor)
                .opacity(0.8)
                .cornerRadius(5)
                
            }
            .foregroundColor(Color.black)
            .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
            .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
            
        }
    }
}

struct savedInspectionView_Previews: PreviewProvider {
    static var previews: some View {
        savedInspectionView()
    }
}
