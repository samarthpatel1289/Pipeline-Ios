//
//  ProfileView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/17/23.
//

import SwiftUI

struct ProfileView: View {
//    let userId: Int
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State private var user: User?
    @Binding var userId : String
    @State private var errorMessage: String?
    @State private var showhome = false
    @State private var isLoggedIn = false
    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
    

    
    var body: some View {
        VStack {
            
            if let user = user {
               
                VStack(spacing: 10) {
                    HStack{
                    Button(action: {
                        self.showhome = true
                    }) {
                        Image(systemName: "house.fill")
                                        .font(.title)
                                        .foregroundColor(customColor)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .padding()
                    }
                    .fullScreenCover(isPresented: $showhome) {
                        HomeScreenView(userId: $userId)}
                        Spacer()
                }
                           Image(systemName: "person.circle")
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 100, height: 100)
                               .foregroundColor(.gray)
                               .padding(.top, 50)
                    VStack(alignment:.leading, spacing: 10) {
                        Spacer()
                               HStack {
                                   Text("Name:")
                                       .bold()
                                   HStack{
                                        Spacer()
                                       Text("\(user.firstname) \(user.lastname)")
                                       Spacer()
                                   }

                                    Spacer()
                               }
//                               Text("Name: \(user.firstname) \(user.lastname)")
                                   
                               Text("Employee ID: \(user.empid)")
                                   
                               Text("Email: \(user.email)")
                             
                        Spacer()
                        HStack{
                            Spacer()
                                Button(action: { }) {
                                               Text("Edit")
                                                   .font(.system(size:20))
                                           }
                                           .foregroundColor(Color.white)

                            .frame(width: 150, height: 40)

                            .background(Color.blue)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                )
                        .clipShape((RoundedRectangle(cornerRadius: 10)))
                        .padding(10)
                            Spacer()
                        }
                           }
                           .frame(width: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 350 : 250, height: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 350 : 250)
                           .padding(10)
                           .foregroundColor(.white)
                           .background(customColor)
                            
                           .cornerRadius(10)
                           .padding()
                           Spacer()
                       }
                       .navigationBarTitle("Profile")
                       
              
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                ProgressView()
            }
//            NavigationLink(destination:AddNewView(name: "\(user.firstName) \(user.lastName)", email: \(user.email)) {
//                            EmptyView()
//                        }
        }
        .background(.white)
        .ignoresSafeArea()
        .foregroundColor(Color.black)
        .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 30 : 10)
        .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 30 : 24))
        .onAppear {
//            print("UserID \(userId)")
           
            let urlString = "http://192.168.1.163:3000/profile/\(userId)"
//            print("URL \(urlString)")
                    guard let url = URL(string: urlString) else {
                        errorMessage = "Invalid URL"
                       
                        return
                    }
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(User.self, from: data)
                        DispatchQueue.main.async {
                            self.user = decodedResponse
                        }
                    } catch {
                        self.errorMessage = "Invalid response from server"
                    }
                } else {
                    self.errorMessage = "Unknown error"
                }
            }.resume()
        }
    }
}

struct User: Codable {
    let id: String
    let firstname: String
    let lastname: String
    let empid: String
    let email: String
}


//struct ProfileView_Previews: PreviewProvider {
//
//    @State static var userId : Int = 0
//
//    static var previews: some View {
////        ProfileView(userId: $userId)
//
//        ProfileView(userId: $userId)
//            .previewDevice("iPad Pro (11-inch) (3rd generation)")
//    }
//}
