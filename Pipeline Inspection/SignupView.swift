//
//  SignupView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/1/23.
//

import SwiftUI

struct SignupView: View {
        
   
//    @State private var firstname = ""
//    @State private var lastname = ""
//    @State private var empid = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var errorMessage = ""
//    @State private var showErrorAlert = false
//    @State private var showSuccessAlert = false
//@State private var signupSuccess = false
//
//
//var body: some View
//{
//    NavigationView{
//        VStack {
//
//            Text("Sign up")
//                .font(.largeTitle)
//
//                .fontWeight(.bold)
//                .padding()
//
//
//                TextField("First name", text: $firstname)
//                    .padding()
//                TextField("Last name", text: $lastname)
//                    .padding()
//
//                TextField("Employee ID", text: $empid)
//                    .padding()
//
//                TextField("Email", text: $email)
//                    .padding()
//
//                SecureField("Password", text: $password)
//                    .padding()
//
//                Button(action: signup) {
//                    Text("Sign up")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//            if signupSuccess {
//
//                Button(action: {
//                  self.signupSuccess  = true
//              }) {
//                  Text("Login")
//              }
//              .fullScreenCover(isPresented: $signupSuccess) {
//                  HomeScreenView()
//              }
//
//            }
//
//                Spacer()
//            }
//    }
//
//
//                .alert(isPresented: $showErrorAlert) {
//                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//
//                }
//                .alert(isPresented: $showSuccessAlert) {
//                                 Alert(title: Text("Success"), message: Text("Sign up successful"), dismissButton: .default(Text("OK")))
//                             }
//                         }
//
//                     func signup() {
//                         guard let url = URL(string: "http://192.168.1.163:3000/signup") else {
//                             errorMessage = "Invalid URL"
//                             showErrorAlert = true
//                             return
//                         }
//
//                         let body = ["firstname": firstname, "lastname": lastname, "empid": empid, "email": email, "password": password]
//
//                         var request = URLRequest(url: url)
//                         request.httpMethod = "POST"
//                         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//                         guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
//                             errorMessage = "Unable to encode HTTP body"
//                             showErrorAlert = true
//                             return
//                         }
//                         request.httpBody = httpBody
//
//                         URLSession.shared.dataTask(with: request) { data, response, error in
//                             if let error = error {
//                                 errorMessage = error.localizedDescription
//                                 showErrorAlert = true
//                                 return
//                             }
//
//                             guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                                 errorMessage = "Invalid response"
//                                 showErrorAlert = true
//                                 return
//                             }
//
//                             guard let data = data else {
//                                 errorMessage = "No data returned"
//                                 showErrorAlert = true
//                                 return
//                             }
//
//                             if (try? JSONDecoder().decode(SignupResponse.self, from: data)) != nil {
//                                 DispatchQueue.main.async {
//                                     self.signupSuccess = true
//                                     self.showSuccessAlert = true
//
//
//                                 }
//                             } else {
//                                 errorMessage = "Unable to decode response"
//                                 showErrorAlert = true
//                             }
//                         }.resume()
//
//                 }

  
    
    
        @Environment(\.horizontalSizeClass) var horizontalSizeClass
        @Environment(\.verticalSizeClass) var verticalSizeClass
        let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)

        @State private var firstname = ""
        @State private var lastname = ""
        @State private var empid = ""
        @State private var email = ""
        @State private var password = ""
        @State private var confirmPassword = ""
        @State private var errorMessage = ""
        @State private var showErrorAlert = false
        @State private var showSuccessAlert = false
        @State private var showSignin = false
        @State private var signupSuccess = false


    func textField(_ title: String, text: Binding<String>) -> some View {
        TextField(title, text: text)
            .foregroundColor(.black)
                .frame(height: 25)
                .padding()
                .background(Color.white)
                .preferredColorScheme(.light)

                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(customColor, lineWidth: 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }


        var body: some View {
            ZStack{
                      Color.white.ignoresSafeArea()
                      VStack{
                          Spacer()
              // Sign in text
                              Text("Sign Up")
                  .foregroundColor(Color.black)
                                  .fontWeight(.bold)
                                  .font(.system(size:28))


              // Input fields
                              if horizontalSizeClass == .regular && verticalSizeClass == .regular{

                              VStack{
                                  textField("FirstName", text: $firstname)

                                  textField("LastName", text: $lastname)

                                  textField("EmailId", text: $email)

                                  textField("Employee Id", text: $empid)

                                  SecureField("Password", text: $password)

                                      .padding()
                                      .background(Color.white)
                                  .overlay(
                                          RoundedRectangle(cornerRadius: 20)
                                          .stroke(customColor, lineWidth: 2)
                                          )
                                  .clipShape((RoundedRectangle(cornerRadius: 20)))

                                  SecureField("Confirm Password", text: $confirmPassword)

                                      .padding()
                                      .background(Color.white)
                                  .overlay(
                                          RoundedRectangle(cornerRadius: 20)
                                          .stroke(customColor, lineWidth: 2)
                                          )
                                  .clipShape((RoundedRectangle(cornerRadius: 20)))
                                  
                                  

                              }
                              .foregroundColor(.black)
                              .frame(width: UIScreen.main.bounds.width / 2)

                              }

                          else{

                          VStack{
                              textField("FirstName", text: $firstname)

                              textField("LastName", text: $lastname)

                              textField("EmailId", text: $email)

                              textField("Employee Id", text: $empid)

                              SecureField("Password", text: $password)
                                  .frame(height: 25)
                                  .padding()
                                  .background(Color.white)
                              .overlay(
                                      RoundedRectangle(cornerRadius: 20)
                                      .stroke(customColor, lineWidth: 2)
                                      )
                              .clipShape((RoundedRectangle(cornerRadius: 20)))

                              SecureField("Confirm Password", text: $confirmPassword)
                                  .frame( height: 25)
                                  .padding()
                                  .background(Color.white)
                              .overlay(
                                      RoundedRectangle(cornerRadius: 20)
                                      .stroke(customColor,lineWidth: 2)
                                      )
                              .clipShape((RoundedRectangle(cornerRadius: 20)))
                          }
                          .frame(width: 330)
                          }

              Spacer()

          // Sign in Button
                          if horizontalSizeClass == .regular && verticalSizeClass == .regular{
                              VStack{
                              Button(action: signup) {
                                  Text("Sign Up")
                                      .foregroundColor(Color.white)
                                      .padding()
                                 
                              }
                              .frame(width: 200, height: 60)

                              .background(customColor)
                          .overlay(
                                  RoundedRectangle(cornerRadius: 10)
                                  .stroke(Color.black, lineWidth: 1)
                                  )
                          .clipShape((RoundedRectangle(cornerRadius: 10)))
                          .padding(10)
//                                  if signupSuccess {
//
//                                     Button(action: {
//                                       self.signupSuccess  = true
//                                   }) {
//                                       Text("Go to login page")
//                                   }
//                                   .fullScreenCover(isPresented: $signupSuccess) {
//                                       HomeScreenView()
//                                   }
//
//                                 }
                                  
                                  Button(action: {
                                      self.showSignin = true
                                  }) {
                                      Text("Already have an account? Sign In")
                                          .font(.system(size:20))
                                          .foregroundColor(Color.blue)
                                  }
                                  .fullScreenCover(isPresented: $showSignin) {
                                      ContentView()
                                  }




                          }
                              .padding()
                          }
                          else{
                              VStack{
                              Button(action: signup) {
                                  Text("Sign Up")
                                      .foregroundColor(Color.white)
                                      .padding()
                                  
                              }
                              .frame(width: 200, height: 40)

                              .background(customColor)
                          .overlay(
                                  RoundedRectangle(cornerRadius: 20)
                                  .stroke(Color.black, lineWidth: 1)
                                  )
                          .clipShape((RoundedRectangle(cornerRadius: 20)))
                          .padding(10)
//                                  if signupSuccess {
//
//                                     Button(action: {
//                                       self.signupSuccess  = true
//                                   }) {
//                                       Text("Go to login page")
//                                   }
//                                   .fullScreenCover(isPresented: $signupSuccess) {
//                                       HomeScreenView()
//                                   }
//
//                                 }
                                  
                                  Button(action: {
                                      self.showSignin = true
                                  }) {
                                      Text("Already have an account? Sign In")
                                          .font(.system(size:15))
                                          .foregroundColor(Color.blue)
                                  }
                                  .fullScreenCover(isPresented: $showSignin) {
                                      ContentView()
                                  }


          //                        .sheet(isPresented: $showSignUp) {
          //                            SignupView()
          //                        }
          //

                          }

                          }
                      }

                  }
            .alert(isPresented: $showErrorAlert) {
                print("Error:\(errorMessage)")
                return Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showSuccessAlert) {
                Alert(title: Text("Success"), message: Text("Sign up successful Go to login Page"), dismissButton: .default(Text("OK")))
            }
        }

        func signup() {
            // Check that all required fields are filled
                guard !firstname.isEmpty, !lastname.isEmpty, !empid.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
                    errorMessage = "All fields are required"
//                    print("Error:\(errorMessage)")
                    showErrorAlert = true
                    return
                }

                // Check that password matches confirmation
                guard password == confirmPassword else {
                    errorMessage = "Passwords do not match"
//                    print("Error:\(errorMessage)")
                    showErrorAlert = true
                    return
                }
            
//             Create the request
            guard let url = URL(string: "http://192.168.1.163:3000/signup") else {
                errorMessage = "Invalid URL"
                showErrorAlert = true
                return
            }
            // Create the request body
            let body = ["firstname": firstname, "lastname": lastname, "empid": empid, "email": email, "password": password]
            print("body",body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
                errorMessage = "Unable to encode HTTP body"
                showErrorAlert = true
                return
            }
            request.httpBody = httpBody

            // Send the request
            URLSession.shared.dataTask(with: request) { data, response, error in
                    // Check for errors
                
                    if let error = error {
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            errorMessage = "Failed to sign up"
                            showErrorAlert = true
                        }
                        return
                    }

                    // Parse the response
                if let data = data {
                    do {
                        let signupResponse = try JSONDecoder().decode(SignupResponse.self, from: data)
                        DispatchQueue.main.async {
                            print("response", signupResponse)
                            showSuccessAlert = true
                            print(showSuccessAlert)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            print(data)
                            errorMessage = "Failed to decode response"
                            showErrorAlert = true
                        }
                    }
                }
                }.resume()
            }

    struct SignupResponse: Codable {
        let id: String
        let firstname: String
        let lastname: String
        let empid: String
        let email: String
    }

    
}


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                   
                   
                   SignupView()
                .previewDevice("iPhone 11 Pro")
                   
                   SignupView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                
                
           
                
               }
    }
}

    
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
//
//    @State private var firstname: String = ""
//    @State private var lastname: String = ""
//    @State private var emailId: String = ""
//    @State private var empId: String = ""
//    @State private var password: String = ""
//    @State private var confirmpassword: String = ""
//    @State private var showSignin = false
//
//    func textField(_ title: String, text: Binding<String>) -> some View {
//        TextField(title, text: text)
//            .frame(height: 25)
//            .padding()
//            .background(Color.white)
//
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(customColor, lineWidth: 2)
//            )
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//    }
//
//    var body: some View {
//
//        ZStack{
//            Color.white.ignoresSafeArea()
//            VStack{
//                Spacer()
//                // Sign in text
//                                Text("Sign Up")
//                    .foregroundColor(Color.black)
//                                    .fontWeight(.bold)
//                                    .font(.system(size:28))
//
//
//                // Input fields
//                                if horizontalSizeClass == .regular && verticalSizeClass == .regular{
//
//                                VStack{
//                                    textField("FirstName", text: $firstname)
//
//                                    textField("LastName", text: $lastname)
//
//                                    textField("EmailId", text: $emailId)
//
//                                    textField("Employee Id", text: $empId)
//
//                                    SecureField("Password", text: $password)
//
//                                        .padding()
//                                        .background(Color.white)
//                                    .overlay(
//                                            RoundedRectangle(cornerRadius: 20)
//                                            .stroke(customColor, lineWidth: 2)
//                                            )
//                                    .clipShape((RoundedRectangle(cornerRadius: 20)))
//
//                                    SecureField("Confirm Password", text: $confirmpassword)
//
//                                        .padding()
//                                        .background(Color.white)
//                                    .overlay(
//                                            RoundedRectangle(cornerRadius: 20)
//                                            .stroke(customColor, lineWidth: 2)
//                                            )
//                                    .clipShape((RoundedRectangle(cornerRadius: 20)))
//
//                                }
//                                .foregroundColor(.black)
//                                .frame(width: UIScreen.main.bounds.width / 2)
//
//                                }
//
//                            else{
//
//                            VStack{
//                                textField("FirstName", text: $firstname)
//
//                                textField("LastName", text: $lastname)
//
//                                textField("EmailId", text: $emailId)
//
//                                textField("Employee Id", text: $empId)
//
//                                SecureField("Password", text: $password)
//                                    .frame(height: 25)
//                                    .padding()
//                                    .background(Color.white)
//                                .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                        .stroke(customColor, lineWidth: 2)
//                                        )
//                                .clipShape((RoundedRectangle(cornerRadius: 20)))
//
//                                SecureField("Confirm Password", text: $confirmpassword)
//                                    .frame( height: 25)
//                                    .padding()
//                                    .background(Color.white)
//                                .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                        .stroke(customColor,lineWidth: 2)
//                                        )
//                                .clipShape((RoundedRectangle(cornerRadius: 20)))
//                            }
//                            .frame(width: 330)
//                            }
//
//                Spacer()
//
//// Sign in Button
//                if horizontalSizeClass == .regular && verticalSizeClass == .regular{
//                    VStack{
//                    Button(action:{}) {
//                        Text("Sign Up")
//                            .foregroundColor(Color.white)
//                            .padding()
//                    }
//                    .frame(width: 200, height: 60)
//
//                    .background(customColor)
//                .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.black, lineWidth: 1)
//                        )
//                .clipShape((RoundedRectangle(cornerRadius: 10)))
//                .padding(10)
//
//
//                        Button(action: {
//                            self.showSignin = true
//                        }) {
//                            Text("Already have an account? Sign In")
//                                .font(.system(size:20))
//                                .foregroundColor(Color.blue)
//                        }
//                        .fullScreenCover(isPresented: $showSignin) {
//                            ContentView()
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
//                    Button(action:{}) {
//                        Text("Sign Up")
//                            .foregroundColor(Color.white)
//                            .padding()
//                    }
//                    .frame(width: 200, height: 40)
//
//                    .background(customColor)
//                .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.black, lineWidth: 1)
//                        )
//                .clipShape((RoundedRectangle(cornerRadius: 20)))
//                .padding(10)
//
//                        Button(action: {
//                            self.showSignin = true
//                        }) {
//                            Text("Already have an account? Sign In")
//                                .font(.system(size:15))
//                                .foregroundColor(Color.blue)
//                        }
//                        .fullScreenCover(isPresented: $showSignin) {
//                            ContentView()
//                        }
//
//
////                        .sheet(isPresented: $showSignUp) {
////                            SignupView()
////                        }
////
//
//                }
//
//                }
//            }
//
//        }
//
//
//    }


//struct CustomTextFieldStyle: TextFieldStyle {
//    var placeholderColor: Color
//
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .padding()
//            .background(Color.white)
//            .foregroundColor(.black)
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.black, lineWidth: 1)
//            )
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .colorScheme(.light)
//            .onAppear {
//                UITextField.appearance().attributedPlaceholder = NSAttributedString(string: configuration._label.text ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
//            }
//    }
//}

