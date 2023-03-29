//
//  LoginView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/17/23.
//



import SwiftUI


    struct LoginResponse: Codable {
        let id: String
        let firstname: String
        let lastname: String
        let empid: String
        let email: String
    }

struct LoginView: View {

            @Environment(\.horizontalSizeClass) var horizontalSizeClass
            @Environment(\.verticalSizeClass) var verticalSizeClass

            @State private var email = ""
           @State private var password = ""
           @State private var errorMessage = ""
           @State private var showErrorAlert = false
           @State private var isSuccessAlertShown = false
            @State private var isLoggedIn = false
            @State private var userId : String = ""

            @State private var showSignUp = false
            @State private var showhome = false
            @State private var showsample = false

            let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)


           var body: some View {
               ZStack{

              //
                   customColor.ignoresSafeArea()
//                   NavigationView{
                       
                          VStack {

                              Spacer()
              //Logo
                              if horizontalSizeClass == .regular && verticalSizeClass == .regular{
                                  Image("logo")
                                      .resizable()
                                      .frame(width: 300, height: 170)
                                      .padding()
                              }
                              else{
                              Image("logo")
                                  .resizable()
                                  .frame(width: 200, height: 130)
                                  .padding()

                              }

              // Sign in text
                              Text("Sign In")
                                  .fontWeight(.bold)
                                  .font(.system(size:24))


              // Input fields
                              if horizontalSizeClass == .regular && verticalSizeClass == .regular{

                              VStack{
                                  TextField("Username", text: $email)
                                      .padding()
                                      .background(Color.white)
                                      .foregroundColor(.black)
                                      .preferredColorScheme(.light)
                                      .overlay(
                                              RoundedRectangle(cornerRadius: 20)
                                              .stroke(Color.black, lineWidth: 1)
                                              )
                                      .clipShape((RoundedRectangle(cornerRadius: 20)))

                                  SecureField("Password", text: $password)

                                      .padding()
                                      .background(Color.white)
                                      .foregroundColor(.black)
                                      .preferredColorScheme(.light)
                                  .overlay(
                                          RoundedRectangle(cornerRadius: 20)
                                          .stroke(Color.black, lineWidth: 1)
                                          )
                                  .clipShape((RoundedRectangle(cornerRadius: 20)))

                              }
                              .frame(width: UIScreen.main.bounds.width / 2)

                              }

                              else{

                                      TextField("Username", text: $email)

                                      .frame(width: 300, height: 25)
                                          .padding()
                                          .preferredColorScheme(.light)
                                          .background(Color.white)
                                          .foregroundColor(.black)
                                          .overlay(
                                                  RoundedRectangle(cornerRadius: 20)
                                                  .stroke(Color.black, lineWidth: 1)
                                                  )
                                          .clipShape((RoundedRectangle(cornerRadius: 20)))

                                      SecureField("Password", text: $password)
                                      .frame(width: 300, height: 25)
                                          .padding()
                                          .background(Color.white)
                                          .preferredColorScheme(.light)
                                      .overlay(
                                              RoundedRectangle(cornerRadius: 20)
                                              .stroke(Color.black, lineWidth: 1)
                                              )
                                      .clipShape((RoundedRectangle(cornerRadius: 20)))
                                  }


                              Spacer()


              // Sign in Button
                              if horizontalSizeClass == .regular && verticalSizeClass == .regular{
                                  VStack{
                                      Button(action: {
                                                     login()
                                                 }) {
                                                     Text("Login")
                                                         .font(.system(size:30))
                                                 }
                                                 .foregroundColor(Color.white)

                                  .frame(width: 200, height: 60)

                                  .background(Color.blue)
                                      
                              .overlay(
                                      RoundedRectangle(cornerRadius: 10)
                                      .stroke(Color.black, lineWidth: 1)
                                      )
                              .clipShape((RoundedRectangle(cornerRadius: 10)))
                              .padding(10)

                                      Button(action: {
                                          self.showhome = true
                                      }) {
                                          Text("testing")
                                              .font(.system(size:20))
                                              .foregroundColor(Color.blue)
                                      }
                                      .fullScreenCover(isPresented: $showhome) {
                                            HomeScreenView(userId: $userId)}
                                      
                                  
                                      
                                      if isLoggedIn {
                                          
                                          ProfileView(userId: $userId)
                                              .fullScreenCover(isPresented: $isLoggedIn) {
                                                  ProfileView(userId: $userId)
                                              }
//                                          NavigationLink(
//                                                              destination: HomeScreenView(userId: $userId),
//                                                              isActive: $isLoggedIn,
//                                                              label: { EmptyView() }
//                                                          )
                                      }
//                                      if isLoggedIn  {
////                                          NavigationLink(destination: ProfileView(userId: username)) {
////                                              print(userId)
////                                          }
//                                          Button(action: {
//                                              self.showhome = true
//                                          }) {
//                                              Text("go to home page")
//                                                  .font(.system(size:20))
//                                                  .foregroundColor(Color.blue)
//                                          }
//                                          .fullScreenCover(isPresented: $showhome) {
//                                                HomeScreenView()}
//                                      }

                                      Button(action: {
                                          self.showSignUp = true
                                      }) {
                                          Text("Create an account")
                                              .font(.system(size:20))
                                              .foregroundColor(Color.blue)
                                      }
                                      .fullScreenCover(isPresented: $showSignUp) {
                                          SignupView()
                                      }


                              }
                                  .padding()
                              }
                              else{
                                  
                                  VStack{
                                      Button(action: {
                                                     login()
                                                 }) {
                                                     Text("Login")
                                                         .foregroundColor(Color.white)
                                                 }
                                  .frame(width: 200, height: 40)

                                  .background(Color.blue)
                              .overlay(
                                      RoundedRectangle(cornerRadius: 20)
                                      .stroke(Color.black, lineWidth: 1)
                                      )
                              .clipShape((RoundedRectangle(cornerRadius: 20)))
                              .padding(10)
                                      Button(action: {
                                          self.showhome = true
                                      }) {
                                          Text("testing")
                                              .font(.system(size:20))
                                              .foregroundColor(Color.blue)
                                      }
                                      .fullScreenCover(isPresented: $showhome) {
                                            HomeScreenView(userId: $userId)}

                                      if isLoggedIn {
                                          
                                          ProfileView(userId: $userId)
                                              .fullScreenCover(isPresented: $isLoggedIn) {
                                                  ProfileView(userId: $userId)
                                              }
                                      }

//                                      if isLoggedIn  {
//
//
//                                          Button(action: {
//                                              self.showhome = true
//                                          }) {
//
//                                              Text("go to home page")
//                                                  .font(.system(size:20))
//                                                  .foregroundColor(Color.blue)
//                                          }
//                                          .fullScreenCover(isPresented: $showhome) {
//                                                HomeScreenView()}
//
//                                      }

//                              .fullScreenCover(isPresented: $showhome) {
//                                  HomeScreenView()}

//                                      Button(action: {
//                                          self.showhome = true
//                                      }) {
//                                          Text("go to home page")
//                                              .font(.system(size:20))
//                                              .foregroundColor(Color.blue)
//                                      }
//                                      .fullScreenCover(isPresented: $showhome) {
//                                            HomeScreenView()}

                                      Button(action: {
                                          self.showSignUp = true
                                      }) {
                                          Text("Create an account")
                                              .font(.system(size:20))
                                              .foregroundColor(Color.blue)
                                      }
                                      .fullScreenCover(isPresented: $showSignUp) {
                                          SignupView()
                                      }

                              }
                                 

                              }
//                        Passing userID to every view
                              NavigationLink(destination:HomeScreenView(userId: $userId), isActive: $isLoggedIn) {
                                              EmptyView()
                                          }
                              NavigationLink(destination:SearchView(userId: $userId), isActive: $isLoggedIn) {
                                              EmptyView()
                                          }
                              NavigationLink(destination:AddNewView(userId: $userId), isActive: $isLoggedIn) {
                                              EmptyView()
                                          }
                             
                              }
//                          }

                      }
               .alert(isPresented: $showErrorAlert) {
                   print("Error:\(errorMessage)")
                   return Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
               }
                   .alert(isPresented: $isSuccessAlertShown) {
                   Alert(title: Text("Success"), message: Text("Login successful"), dismissButton: .default(Text("OK")))
               }



           }
    
    
    // API integration
           func login() {
               let url = URL(string: "http://192.168.1.163:3000/login")!
               var request = URLRequest(url: url)
               request.httpMethod = "POST"
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")

               let body = ["email": email, "password": password]
               print(body)
               guard let bodyData = try? JSONSerialization.data(withJSONObject: body) else {
                   self.errorMessage = "Failed to serialize request body"
                   self.showErrorAlert = true
                   return
               }
               request.httpBody = bodyData
               URLSession.shared.dataTask(with: request) { data, response, error in
                       guard let data = data, error == nil else {
                           DispatchQueue.main.async {
                               self.errorMessage = "Network error"
                               self.showErrorAlert = true
                           }
                           return
                       }

                       if let decodedResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                           DispatchQueue.main.async {
                               self.userId = decodedResponse.id // <-- Set the loggedInUserID property here
                               
                               self.isLoggedIn = true
                           }
                       } else {
                           DispatchQueue.main.async {
                               self.errorMessage = "Invalid email or password"
                               self.showErrorAlert = true
                           }
                       }


               }.resume()
           }

           func showSuccessAlert() {
               self.isSuccessAlertShown = true
           }

    }




//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}









//struct ContentView: View {
//
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var showSignUp = false
//    @State private var showhome = false
//    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
//
//    var body: some View {
//
//            ZStack{
//
//            customColor.ignoresSafeArea()
//            VStack {
//
//                Spacer()
////Logo
//                if horizontalSizeClass == .regular && verticalSizeClass == .regular{
//                    Image("logo")
//                        .resizable()
//                        .frame(width: 300, height: 170)
//                        .padding()
//                }
//                else{
//                Image("logo")
//                    .resizable()
//                    .frame(width: 200, height: 130)
//                    .padding()
//
//                }
//
//// Sign in text
//                Text("Sign In")
//                    .fontWeight(.bold)
//                    .font(.system(size:24))
//
//
//// Input fields
//                if horizontalSizeClass == .regular && verticalSizeClass == .regular{
//
//                VStack{
//                    TextField("Username", text: $username)
//                        .padding()
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .overlay(
//                                RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.black, lineWidth: 1)
//                                )
//                        .clipShape((RoundedRectangle(cornerRadius: 20)))
//
//                    SecureField("Password", text: $password)
//
//                        .padding()
//                        .background(Color.white)
//                    .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.black, lineWidth: 1)
//                            )
//                    .clipShape((RoundedRectangle(cornerRadius: 20)))
//
//                }
//                .frame(width: UIScreen.main.bounds.width / 2)
//
//                }
//
//                else{
//
//                        TextField("Username", text: $username)
//
//                        .frame(width: 300, height: 25)
//                            .padding()
//
//                            .background(Color.white)
//                            .foregroundColor(.black)
//                            .overlay(
//                                    RoundedRectangle(cornerRadius: 20)
//                                    .stroke(Color.black, lineWidth: 1)
//                                    )
//                            .clipShape((RoundedRectangle(cornerRadius: 20)))
//
//                        SecureField("Password", text: $password)
//                        .frame(width: 300, height: 25)
//                            .padding()
//                            .background(Color.white)
//                        .overlay(
//                                RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.black, lineWidth: 1)
//                                )
//                        .clipShape((RoundedRectangle(cornerRadius: 20)))
//                    }
//
//
//
//                Spacer()
//
//
//// Sign in Button
//                if horizontalSizeClass == .regular && verticalSizeClass == .regular{
//                    VStack{
//                    Button(action:{self.showhome = true}) {
//                        Text("Sign In")
//                            .foregroundColor(Color.white)
//                            .padding()
//                    }
//                    .frame(width: 200, height: 60)
//
//                    .background(Color.blue)
//                .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.black, lineWidth: 1)
//                        )
//                .clipShape((RoundedRectangle(cornerRadius: 10)))
//                .padding(10)
//                .fullScreenCover(isPresented: $showhome) {
//                    HomeScreenView()}
//
//                        Button(action: {
//                            self.showSignUp = true
//                        }) {
//                            Text("Create an account")
//                                .font(.system(size:20))
//                                .foregroundColor(Color.blue)
//                        }
//                        .fullScreenCover(isPresented: $showSignUp) {
//                            SignupView()
//                        }
//
//
//
//
//                }
//                    .padding()
//                }
//                else{
//                    VStack{
//                    Button(action:{self.showhome = true}) {
//                        Text("Sign In")
//                            .foregroundColor(Color.white)
//                            .padding()
//                    }
//                    .frame(width: 200, height: 40)
//
//                    .background(Color.blue)
//                .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.black, lineWidth: 1)
//                        )
//                .clipShape((RoundedRectangle(cornerRadius: 20)))
//                .padding(10)
//                .fullScreenCover(isPresented: $showhome) {
//                    HomeScreenView()}
//
//                        Button(action: {
//                            self.showSignUp = true
//                        }) {
//                            Text("Create an account")
//                                .font(.system(size:20))
//                                .foregroundColor(Color.blue)
//                        }
//                        .fullScreenCover(isPresented: $showSignUp) {
//                            SignupView()
//                        }
//
//
//                }
//
//                }
//            }
//
//        }
//            .fullScreenCover(isPresented: $showSignUp) {
//                SignupView()
//            }
//
//    }
//}

//struct SignupView: View {
//    var body: some View {
//        Text("Signup")
//            .font(.headline)
//            .navigationBarTitle("signup")
//    }
//}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {


                   LoginView()
                .previewDevice("iPhone 11 Pro")

                   LoginView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .previewInterfaceOrientation(.portraitUpsideDown)



               }
    }
}

//struct ContentView: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//
//    var body: some View {
//        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
//            Text("iPhone portrait")
//        } else if horizontalSizeClass == .compact && verticalSizeClass == .compact {
//            Text("iPhone landscape")
//        } else if horizontalSizeClass == .regular && verticalSizeClass == .compact {
//            Text("iPad landscape")
//        } else {
//            Text("iPad portrait")
//        }
//    }
//}
//In this example, the ContentView view checks the horizontalSizeClass and verticalSizeClass environment values and displays different text depending on the size class combination.


//    .frame(width: UIScreen.main.bounds.width / 2)

//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: SecondView()) {
//                    Text("Go to Second View")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                Spacer()
//            }
//            .navigationBarTitle("First View")
//        }
//    }
//}
//
//struct SecondView: View {
//    var body: some View {
//        Text("Second View")
//            .font(.headline)
//            .navigationBarTitle("Second View")
//    }
//}
