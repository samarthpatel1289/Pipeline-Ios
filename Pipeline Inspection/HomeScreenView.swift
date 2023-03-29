//
//  HomeScreenView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/1/23.
//

import SwiftUI

struct HomeScreenView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var userId : String
    @State private var showAddNew = false
    @State private var showSearch = false
    @State private var showProfile = false
    
    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
    var body: some View {
        ZStack(alignment: .topLeading) {
                Color.white
                .ignoresSafeArea()
            VStack(alignment:.leading, spacing: 20){
                HStack {
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
                        Text("Inspection")
                         .fontWeight(.bold)

                         HStack(spacing: 30) {
                             
// Button for new inspection
                          Button(action: {self.showAddNew = true})
                            {
                              VStack {
                              ZStack{
                                 Rectangle()
                                .frame(width: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 300 : 150, height: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 300 : 150)
                                .cornerRadius(10)
                                .opacity(0.2)
                               
                                 Image(systemName: "plus")
                                 .imageScale(.large)
                              }
                             .foregroundColor(customColor)

                                Text("Add New")
                                 .foregroundColor(.black)
                                  .fontWeight(.bold)
                               }

                                }

                                .fullScreenCover(isPresented: $showAddNew) {
                                    AddNewView(userId: $userId)
                                }

// Search Inspection
                             Button(action: {self.showSearch = true})
                               {
                                VStack {
                                  ZStack{
                                   Rectangle()
                                       .frame(width: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 300 : 150, height: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 300 : 150)
                                       .cornerRadius(10)
                                       .opacity(0.2)
                                

                                     Image(systemName: "magnifyingglass")
                                        .imageScale(.large)

                                    }
                                   .foregroundColor(customColor)

                                   Text("Search")
                                      .foregroundColor(.black)
                                      .fontWeight(.bold)
                                  }
                               }
                               .fullScreenCover(isPresented: $showSearch) {
                                   SearchView(userId: $userId)
                               }
                            }

                            Spacer()
                        }
            .foregroundColor(Color.black)
            .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
            .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
            }
            
        
        
//        ZStack(alignment: .topLeading) {
//                   Color.white
//                       .ignoresSafeArea()
//                   if horizontalSizeClass == .regular && verticalSizeClass == .regular{
//                   VStack(alignment:.leading, spacing: 20){
//                       HStack {
//                           Spacer()
//                           Image(systemName: "person.circle")
//
//                               .imageScale(.large)
//                               .padding(20)
//                       }
//                       Text("Inspection")
//                           .fontWeight(.bold)
//                           .font(.system(size:32))
//
//                       HStack(spacing: 30) {
//
//                           Button(action: {self.showAddNew = true})
//                           {
//                                   VStack {
//                                       ZStack{
//                                       Rectangle()
//                                           .frame(width: 300, height: 300)
//                                           .cornerRadius(10)
//                                           .opacity(0.2)
//                                       Image(systemName: "plus")
//                                               .imageScale(.large)
//
//                                       }
//                                       .foregroundColor(customColor)
//
//                                       Text("Add New")
//                                           .foregroundColor(.black)
//                                    .fontWeight(.bold)
//                                }
//
//                    }
//
//                    .fullScreenCover(isPresented: $showAddNew) {
//                        AddNewView()
//                    }
//
//                            VStack {
//                                ZStack{
//                                Rectangle()
//                                    .frame(width: 300, height: 300)
//                                    .cornerRadius(10)
//                                    .opacity(0.2)
//                                Image(systemName: "magnifyingglass")
//                                    .imageScale(.large)
//
//                                }
//                                .foregroundColor(customColor)
//
//                                Text("Search")
//                                    .foregroundColor(.black)
//                                    .fontWeight(.bold)
//                                }
//
//                        }
//
//                Spacer()
//            }
//            .padding(15)
//            .font(.system(size: 32))
//
//        }
//            else{
//                VStack(alignment:.leading, spacing: 20){
//                    HStack {
//                        Spacer()
//                        Image(systemName: "person.circle")
//                            .font(.system(size: 24))
//                            .imageScale(.large)
//                            .padding(10)
//                    }
//                    Text("Inspection")
//                        .fontWeight(.bold)
//                        .font(.system(size:24))
//
//                    HStack(spacing: 20) {
//
//                        Button(action: {self.showAddNew = true})
//                        {
//                                VStack {
//                                    ZStack{
//                                    Rectangle()
//                                        .frame(width: 150, height: 150)
//                                        .cornerRadius(10)
//                                        .opacity(0.2)
//                                    Image(systemName: "plus")
//                                            .imageScale(.large)
//                                            .font(.system(size: 24))
//                                    }
//                                    .foregroundColor(customColor)
//
//                                    Text("Add New")
//                                        .foregroundColor(.black)
//                                        .fontWeight(.bold)
//                                    }
//                        }
//
//                        .fullScreenCover(isPresented: $showAddNew) {
//                            AddNewView()
//                        }
//
//                                VStack {
//                                    ZStack{
//                                    Rectangle()
//                                        .frame(width: 150, height: 150)
//                                        .cornerRadius(10)
//                                        .opacity(0.2)
//                                    Image(systemName: "magnifyingglass")
//                                        .imageScale(.large)
//                                        .font(.system(size: 24))
//                                    }
//                                    .foregroundColor(customColor)
//
//                                    Text("Search")
//                                        .foregroundColor(.black)
//                                        .fontWeight(.bold)
//                                    }
//                            }
//                    Spacer()
//                }
//                .padding(10)
//            }
//    }
//        HStack(spacing: 30) {
//            ForEach(["Add New", "Search"], id: \.self) { title in
//                Button(action: {
//                    if title == "Add New" {
//                        self.showAddNew = true
//                    }
//                }) {
//                    VStack {
//                        ZStack {
//                            Rectangle()
//                                .frame(width: 150, height: 150)
//                                .cornerRadius(10)
//                                .opacity(0.2)
//                            Image(systemName: title == "Add New" ? "plus" : "magnifyingglass")
//                                .imageScale(.large)
//                                .font(.system(size: 24))
//                        }
//                        .foregroundColor(customColor)
//                        Text(title)
//                            .foregroundColor(.black)
//                            .fontWeight(.bold)
//                    }
//                }
//                .fullScreenCover(isPresented: $showAddNew) {
//                    if title == "Add New" {
//                        AddNewView()
//                    }
//                }
//            }
//        }
//        Spacer()
//
//    .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
//    .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
        
//        .frame(width: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 300 : 150, height: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 300 : 150)


}
}

struct HomeScreenView_Previews: PreviewProvider {
    @State static var userId : String = ""
    static var previews: some View {
         Group {
                   
                   
            HomeScreenView(userId: $userId)
                 .previewDevice("iPhone 11 Pro")
                 
                   
            HomeScreenView(userId: $userId)
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                
                
           
                
               }
    }
}
