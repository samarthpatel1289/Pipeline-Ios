//
//  ContentView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 2/23/23.
//

import SwiftUI

    
    
    struct ContentView: View {
        @State private var showLogin = false
        var body: some View {

                        LoginView()


        }
//        @State var isLoggedIn = false
//           @State var userID = ""
//
//           var body: some View {
//               if isLoggedIn {
//                   ProfileView(userID: userID)
//               } else {
//                   LoginView(onLogin: { id in
//                       isLoggedIn = true
//                       userID = id
//                   })
//               }
//           }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                   
                   
                   ContentView()
                .previewDevice("iPhone 11 Pro")
                   
                   ContentView()
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
