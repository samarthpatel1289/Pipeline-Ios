////
////  AddNewMeasure.swift
////  Pipeline Inspection
////
////  Created by Mansi on 3/5/23.
////
//
//import SwiftUI
//
//struct measurement: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    
//    @State private var back = false
//    @State private var selectedTML = "Elbow"
//    @State private var selectedOption = ""
//    @State private var directionValue = ""
//    @State private var selectedItems: [[String: String]] = []
//    @State private var selectedItemIndex: Int?
//    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
//
//    let TMLSelection = ["Elbow", "Pipe", "Tee"]
//    let PipeDirection = ["North", "South", "East", "West", "Top","Bottom"]
//    let ElbowDirection = ["North", "South", "East", "West", "Top","Bottom", "Inside", "Outside"]
//    let TeeDirection = ["North", "South", "East", "West"]
//    
//    var options: [String] {
//        switch selectedTML {
//        case "Elbow":
//            return ElbowDirection
//        case "Pipe":
//            return PipeDirection
//        case "Tee":
//            return TeeDirection
//        default:
//            return []
//        }
//    }
//    
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//        Color.white
//            .ignoresSafeArea()
//        VStack(alignment: .leading, spacing: 20) {
//            HStack {
//                Button(action: { self.back = true }) {
//                    Image(systemName: "arrow.backward")
//                        .padding(5)
//                }
//                .fullScreenCover(isPresented: $back) {
//                    AddNewView()
//                }
//                Spacer()
//                Image(systemName: "person.circle")
//                    .padding(10)
//            }
//            .imageScale(.large)
//
//            Text("New Inspection")
//                .fontWeight(.heavy)
//        
//        VStack {
//            Picker("TML", selection: $selectedTML) {
//                ForEach(TMLSelection, id: \.self) { tml in
//                    Text(tml)
//                        
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .font(.system(size: 30))
//            .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width/1.5 : 315,height: 30)
//                .padding()
//                .background(Color.white)
//                .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
//
//            
//            HStack{
//            Spacer()
//            Picker("Options", selection: $selectedOption) {
//                ForEach(options, id: \.self) { option in
//                    Text(option)
//                        
//                }
//            }
//            .id(selectedTML)
//                
//            Spacer()
//                
//            TextField("Measurement", text: $directionValue)
//                .keyboardType(.numberPad)
//            }
//            .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width/1.5 : 315,height: 30)
//                .padding()
//                .background(Color.white)
//                .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
//            Spacer()
//            
//            Button(selectedItemIndex == nil ? "Add" : "Update") {
//                if let index = selectedItemIndex {
//                    selectedItems[index]["option"] = selectedOption
//                    selectedItems[index]["measurement"] = directionValue
//                    selectedItemIndex = nil
//                } else {
//                    let item = ["TML": selectedTML, "option": selectedOption, "measurement": directionValue]
//                    selectedItems.append(item)
//                }
//                selectedOption = ""
//                directionValue = ""
//            }
//            .frame(width: 200, height: 40)
//            
//            .opacity(0.7)
//             .overlay(
//                  RoundedRectangle(cornerRadius: 20)
//                  .stroke(customColor, lineWidth: 1)
//               )
//              .clipShape((RoundedRectangle(cornerRadius: 20)))
//              .padding(10)
//            
//           
//           
//            VStack{
//            List{
//                ForEach(TMLSelection, id: \.self) { tml in
//                    Section(header: Text(tml)) {
//                        ForEach(selectedItems.filter { $0["TML"] == tml }, id: \.self) { item in
//                            HStack {
//                                Text(item["option"] ?? "")
//                                Spacer()
//                                Text(item["measurement"] ?? "")
//                                Button(action: {
//                                    if let index = selectedItems.firstIndex(where: { $0 == item }) {
//                                        selectedItems.remove(at: index)
//                                    }
//                                }) {
//                                    Image(systemName: "trash")
//                                        .foregroundColor(.red)
//                                }
//
//                              
//                            }
//                        }
//                    }
//                }
//            }
//           
//        }
//            .background(Color.white)
//        }
//        }
//            
//        .foregroundColor(Color.black)
//        .background(Color.white)
//        .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
//        .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
//        }
//    }
//}
//
//
//
//    
//    
//    
//    
////    @State private var back = false
////    @State private var selectedTML = "Elbow"
////    @State private var directionValue = ""
////    @State private var selectedItems: [String] = []
////    @State private var measurementData: [[String: Any]] = []
////    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
////
////    let TMLSelection = ["Elbow", "Pipe", "Tee"]
////    let PipeDirection = ["North", "South", "East", "West", "Top","Bottom"]
////    let ElbowDirection = ["North", "South", "East", "West", "Top","Bottom", "Inside", "Outside"]
////    let TeeDirection = ["North", "South", "East", "West"]
////
////    var body: some View {
////        ZStack(alignment: .topLeading) {
////            Color.white
////                .ignoresSafeArea()
////            VStack(alignment: .leading, spacing: 20) {
////                HStack {
////                    Button(action: { self.back = true }) {
////                        Image(systemName: "arrow.backward")
////                            .padding(5)
////                    }
////                    .fullScreenCover(isPresented: $back) {
////                        AddNewView()
////                    }
////                    Spacer()
////                    Image(systemName: "person.circle")
////                        .padding(10)
////                }
////                .imageScale(.large)
////
////                Text("New Inspection")
////                    .fontWeight(.heavy)
////
////                VStack {
////                               Picker("TML", selection: $selectedTML) {
////                                   ForEach(TMLSelection, id: \.self) { tml in
////                                       Text(tml)
////                                   }
////                               }
////                               .pickerStyle(.segmented)
////
////                               if selectedTML == "Elbow" {
////                                   Picker("Elbow Direction", selection: $selectedItems) {
////                                       ForEach(ElbowDirection, id: \.self) { elbow in
////                                           Text(elbow)
////                                       }
////                                   }
////                               } else if selectedTML == "Pipe" {
////                                   Picker("Pipe Direction", selection: $selectedItems) {
////                                       ForEach(PipeDirection, id: \.self) {pipe in
////                                           Text(pipe)
////                                       }
////                                   }
////                               } else if selectedTML == "Tee" {
////                                   Picker("Tee Direction", selection: $selectedItems) {
////                                       ForEach(TeeDirection, id: \.self) {tee in
////                                           Text(tee)
////                                       }
////                                   }
////                               }
////
////                               TextField("Value", text: $directionValue)
////                                   .keyboardType(.numberPad)
////
////                               Divider()
////
////                               List {
////                                   ForEach(TMLSelection, id: \.self) { tml in
////                                       Section(header: Text(tml)) {
////                                           ForEach(selectedItems.indices, id: \.self) { index in
////                                               let measurement = selectedItems[index]
////                                               if measurement["TML"] == tml {
////                                                   HStack {
////                                                        Text(measurement["Options"] ?? "")
////                                                       Spacer()
////                                                       Text(measurement["Value"] ?? "")
////                                                   }
////                                               }
////                                           }
////                                       }
////                                   }
////                               }
////                           }
////                       }
////                   }
////               }
////
////}
//    
//    
//    
//    
//    
//    
////    @Environment(\.horizontalSizeClass) var horizontalSizeClass
////        @Environment(\.verticalSizeClass) var verticalSizeClass
////        @State private var back = false
////        @State private var selectedTML = "Elbow"
////        @State private var selectedDirection = "North"
////        @State private var directionValue = ""
////        @State private var selectedItems: [[String: String]] = []
////        let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
////
////        let TMLSelection = ["Elbow","Pipe","Tee"]
////        let Direction = ["North","South","East","West","Top", "Bottom","Inside", "Outside" , "Nominal", "Min Thick"]
////
////
////       var body: some View {
////           ZStack(alignment: .topLeading) {
////                           Color.white
////                       .ignoresSafeArea()
////                       VStack(alignment:.leading, spacing: 20){
////                           HStack{
////                               Button(action: {self.back = true}){
////                               Image(systemName: "arrow.backward")
////                                       .padding(5)
////                               }
////                               .fullScreenCover(isPresented: $back) {
////                                   AddNewView()
////                               }
////                               Spacer()
////                               Image(systemName: "person.circle")
////                                   .padding(10)
////                           }
////                           .imageScale(.large)
////
////                               Text("New Inspection")
////                                .fontWeight(.heavy)
////
////           VStack {
////               Picker("TML", selection: $selectedTML) {
////                   ForEach(TMLSelection, id: \.self) { TML in
////                       Text(TML)
////                   }
////               }
////               .pickerStyle(.segmented)
////
////               Text("Select Direction")
////
////               HStack{
////
////               Picker("Direction", selection: $selectedDirection) {
////                   ForEach(Direction, id: \.self) { direction in
////                        Text(direction)
////                   }
////               }
////               .id(selectedTML)
////
////               Spacer()
////
////               TextField("Value", text: $directionValue    )
////                   .keyboardType(.numberPad)
////               }
////               Button("Add") {
////                   let item = ["TML": selectedTML, "Direction": selectedDirection, "Value": directionValue]
////                   selectedItems.append(item)
////                   selectedDirection = ""
////                   directionValue = ""
////               }
////               .padding()
////
////               List {
////                   ForEach(TMLSelection, id: \.self) { TML in
////                       Section(header: Text(TML)) {
////                           ForEach(selectedItems.filter { $0["TML"] == TML }, id: \.self) { item in
////                               HStack {
////                                   Text(item["Direction"]!)
////                                   Spacer()
////                                   Text(item["Value"]!)
////                               }
////                           }
////                       }
////                   }
////               }
////           }
////       }
////        }
////}
////}
//
//    
//
//    
//    
//    
////    @Environment(\.horizontalSizeClass) var horizontalSizeClass
////    @Environment(\.verticalSizeClass) var verticalSizeClass
////    @State private var selectedTML = "Elbow"
////    @State private var selectedDirection = "North"
////    @State private var directionValue: String = ""
////    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
////
////    let TMLSelection = ["Elbow","Pipe"]
////    let direction = ["North","South","East","West","Top", "Bottom","Inside", "Outside" , "Nominal", "Min Thick"]
////
////    @State private var back = false
////    @State private var addMeasure = false
////
////    var body: some View {
////        ZStack(alignment: .topLeading) {
////                Color.white
////            .ignoresSafeArea()
////            VStack(alignment:.leading, spacing: 20){
////                HStack{
////                    Button(action: {self.back = true}){
////                    Image(systemName: "arrow.backward")
////                            .padding(5)
////                    }
////                    .fullScreenCover(isPresented: $back) {
////                        AddNewView()
////                    }
////                    Spacer()
////                    Image(systemName: "person.circle")
////                        .padding(10)
////                }
////                .imageScale(.large)
////
////                    Text("New Inspection")
////                     .fontWeight(.heavy)
////
////
////                HStack{
////                Picker("TML",selection: $selectedTML){
////                    ForEach(TMLSelection, id:\.self) {
////                        TML in Text(TML)
////                    }
////                }
////                    Spacer()
////                Image(systemName: "chevron.down.circle")
////                .imageScale(.large)
////                }
////                .pickerStyle(.menu)
////                .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width / 1.5 : 315,height: 25)
////                .padding()
////                .background(Color.white)
////                .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
////                .overlay(
////                    Rectangle()
////                    .stroke(customColor, lineWidth: 2)
////                            )
////
////
////
////
////                if selectedTML == "Elbow"{
////                    HStack{
////                    Picker("Elbow",selection: $selectedDirection){
////                        ForEach(direction, id:\.self){
////                            direction in Text(direction)
////                        }
////                    }
////                    Spacer()
////                    TextField("Value", text: $directionValue)
////                    }
////                    .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width / 1.5 : 315,height: 25)
////                    .padding()
////                    .background(Color.white)
////                    .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
////                    .overlay(
////                        Rectangle()
////                        .stroke(customColor, lineWidth: 2)
////                                )
////
////
////                }
////
////
////                Spacer()
////
////                HStack{
////                    VStack{
////                        Text("TML")
////                            .frame(width: 150 ,height: 30)
////                            .padding()
////                            .background(Color.white)
////                            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
////                            .overlay(
////                                Rectangle()
////                                .stroke(customColor, lineWidth: 2)
////                                        )
////                        Text("\(selectedTML)")
////                            .frame(width: 150 ,height: 30)
////                            .padding()
////                            .background(Color.white)
////                            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
////                            .overlay(
////                                Rectangle()
////                                .stroke(customColor, lineWidth: 2)
////                                        )
////                    }
////
////
////                    VStack{
////                        Text("\(selectedDirection)")
////                            .frame(width: 150 ,height: 30)
////                            .padding()
////                            .background(Color.white)
////                            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
////                            .overlay(
////                                Rectangle()
////                                .stroke(customColor, lineWidth: 2)
////                                        )
////                        Text("\(directionValue)")
////                            .frame(width: 150 ,height: 30)
////                            .padding()
////                            .background(Color.white)
////                            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
////                            .overlay(
////                                Rectangle()
////                                .stroke(customColor, lineWidth: 2)
////                                        )
////                    }
////
////                }
////
////
////            }
////            .padding(10)
////            .foregroundColor(Color.black)
////        }
////    }
////}
//
//struct AddNewMeasure_Previews: PreviewProvider {
//    static var previews: some View {
//       
//        Group {
//         
//           AddNewMeasure()
//                .previewDevice("iPhone 11 Pro")
//                
//                  
//           AddNewMeasure()
//               .previewDevice("iPad Pro (11-inch) (3rd generation)")
//  
//          }
//
//    }
//}
