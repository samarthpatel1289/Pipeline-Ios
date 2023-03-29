//
//  SearchView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/16/23.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State private var back = false
    @State private var showProfile = false
    @Binding var userId : String
    
    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
    
    func textField(_ title: String, text: Binding<String>) -> some View {
        TextField(title, text: text)
            .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width / 1.5 : 315,height: 25)
            .padding()
            .background(Color.white)
            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
            .overlay(
                Rectangle()
                .stroke(customColor, lineWidth: 2)
                        )
            
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
                Color.white
            .ignoresSafeArea()
            VStack(alignment:.leading, spacing: 20){
                HStack{
                    Button(action: {self.back = true}){
                    Image(systemName: "arrow.backward")
                        .padding(5)
                    }
                    .fullScreenCover(isPresented: $back) {
                        HomeScreenView(userId: $userId)
                    }
                    Spacer()
                    Button(action: {self.showProfile = true})
                    {
                        Image(systemName: "person.circle")

                        .imageScale(.large)
                        .padding(20)
                    }
                    .fullScreenCover(isPresented: $showProfile) {
                        ProfileView(userId: $userId)
                    }
                }
                
                
                    Text("New Inspection")
                     .fontWeight(.heavy)
                
// Search Fields
                VStack{
                    VStack(alignment:.leading, spacing: 20){
                        Text("Client Name")
                        textField("Client name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding(5)
                            
                    }
                   
                    
                    VStack(alignment:.leading, spacing: 20){
                        Text("Location")
                        textField("City,State", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding(5)
                    }
                   
                    
                    VStack(alignment:.leading, spacing: 20){
                        Text("Date")
                        textField("date", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding(5)
                    }
                    
                    
                }
                Spacer()
                
                HStack{
                Spacer()
                Button(action:{} ) {
                    Text("Search")
                        .foregroundColor(Color.white)
                        .padding()
                    
                }
                .frame(width: 200, height: 40)

                .background(customColor)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    )
            .clipShape((RoundedRectangle(cornerRadius: 20)))
            .padding(10)
               Spacer()
                }
            }
        }
        .foregroundColor(Color.black)
        .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
        .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
    }
    
}

struct SearchView_Previews: PreviewProvider {
    @State static var userId : String = ""
    static var previews: some View {
        Group {
                  
                  
           SearchView(userId: $userId)
                .previewDevice("iPhone 11")
                
                  
           SearchView(userId: $userId)
               .previewDevice("iPad Pro (11-inch) (3rd generation)")
               
               
          
               
              }
    }
}
