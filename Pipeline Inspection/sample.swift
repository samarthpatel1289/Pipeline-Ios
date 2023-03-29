//
//  sample.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/7/23.
//

import SwiftUI

struct sample: View {
    
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
    @State private var back = false
//    @Binding var userId : Int
    @State private var addMeasure = false
    @State private var showProfile = false
    
//    @Binding var userId : Int
   
    @State private var selectedTML = "Elbow"
    @State private var selectedOption = ""
    @State private var directionValue = ""
    @State private var selectedItems: [[String: String]] = []
    @State private var selectedItemIndex: Int?
   

    let TMLSelection = ["Elbow", "Pipe", "Tee"]
    let PipeDirection = ["North", "South", "East", "West", "Top","Bottom"]
    let ElbowDirection = ["North", "South", "East", "West", "Top","Bottom", "Inside", "Outside"]
    let TeeDirection = ["North", "South", "East", "West"]
    
    var options: [String] {
        switch selectedTML {
        case "Elbow":
            return ElbowDirection
        case "Pipe":
            return PipeDirection
        case "Tee":
            return TeeDirection
        default:
            return []
        }
    }
    
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
            VStack{
            HStack{
                Button(action: {self.back = true}){
                Image(systemName: "arrow.backward")
                    .padding(5)
                }
//                       .fullScreenCover(isPresented: $back) {
//                           HomeScreenView(userId: $userId)
//                       }
                Spacer()
                Button(action: {self.showProfile = true})
                {
                    Image(systemName: "person.circle")

                    .imageScale(.large)
                    .padding(20)
                }
//                       .fullScreenCover(isPresented: $showProfile) {
//                           ProfileView(userId: $userId)
//                       }
            }
            
            
                Text("New Inspection")
                 .fontWeight(.heavy)
            
            TabView {
               ZStack(alignment: .topLeading) {
                   Color.white
               .ignoresSafeArea()
               VStack(alignment:.leading, spacing: 20){
                 
                   
                   ScrollView {
                       VStack(alignment:.leading, spacing: 20){
               
   //  Client data
                   Group{
                       Text("Client Data")
                       .fontWeight(.bold)
                   
                      VStack(alignment:.leading, spacing: 20){
                          Text("Client")
                          textField("Client name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                      }
                      VStack(alignment:.leading, spacing: 20){
                          Text("Location")
                          textField("City,State", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                      }
                      VStack(alignment:.leading, spacing: 20){
                          Text("Date")
                          textField("date", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                      }
                      VStack(alignment:.leading, spacing: 20){
                          Text("Part#/Report#")
                          textField("Part no./Report no.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                      }
                   }
   // PArt Data
                   Group{
                       Text("Part Data")
                       .fontWeight(.bold)
                           
                       VStack(alignment:.leading, spacing: 20){
                              Text("Part Identification")
                              textField("Part no.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                          }
                          VStack(alignment:.leading, spacing: 20){
                              Text("Procedure")
                              textField("procedure", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                          }
                          VStack(alignment:.leading, spacing: 20){
                              Text("PND#")
                              textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                          }
                          VStack(alignment:.leading, spacing: 20){
                              Text("DWG#")
                              textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                          }
                           VStack(alignment:.leading, spacing: 20){
                               Text("Temp")
                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                           }
                           VStack(alignment:.leading, spacing: 20){
                               Text("MTL")
                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                           }
                   }
                           
   //Calibreation block data
                           Group{
                               Text("Calibration Block")
                               .fontWeight(.bold)
                                   
                               VStack(alignment:.leading, spacing: 20){
                                      Text("Material")
                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                  }
                                  VStack(alignment:.leading, spacing: 20){
                                      Text("Surface")
                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                  }
                               Text("Ultrasonic Equipment")
                               .fontWeight(.bold)
                                  VStack(alignment:.leading, spacing: 20){
                                      Text("Model#")
                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                  }
                                  VStack(alignment:.leading, spacing: 20){
                                      Text("Serial#")
                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                  }
                               Text("Probe")
                               .fontWeight(.bold)
                                   VStack(alignment:.leading, spacing: 20){
                                       Text("Probe Model#")
                                       textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                   }
                                   VStack(alignment:.leading, spacing: 20){
                                       Text("Probe Serial#")
                                       textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                   }
                           }
                           
   // data
                           Group{
                               
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Valocity")
                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                              }
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Delay")
                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                              }
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Frequency")
                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                              }
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Other")
                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                              }
                           }
                           
                           
                   }
                   }
                    
               }
              
           }
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("inspection data")
                            .foregroundColor(.black)
                    }
                       
                
                
                
//                Measurement data
                ZStack(alignment: .topLeading) {
                Color.white
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    
                
                VStack {
                    Picker("TML", selection: $selectedTML) {
                        ForEach(TMLSelection, id: \.self) { tml in
                            Text(tml)
                                
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .font(.system(size: 30))
                    .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width/1.5 : 315,height: 30)
                        .padding()
                        .background(Color.white)
                        .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)

                    
                    HStack{
                    Spacer()
                    Picker("Options", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                
                        }
                    }
                    .id(selectedTML)
                        
                    Spacer()
                        
                    TextField("Measurement", text: $directionValue)
                        .keyboardType(.numberPad)
                    }
                    .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width/1.5 : 315,height: 30)
                        .padding()
                        .background(Color.white)
                        .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
                    Spacer()
                    
                    Button(selectedItemIndex == nil ? "Add" : "Update") {
                        if let index = selectedItemIndex {
                            selectedItems[index]["option"] = selectedOption
                            selectedItems[index]["measurement"] = directionValue
                            selectedItemIndex = nil
                        } else {
                            let item = ["TML": selectedTML, "option": selectedOption, "measurement": directionValue]
                            selectedItems.append(item)
                        }
                        selectedOption = ""
                        directionValue = ""
                    }
                    .frame(width: 200, height: 40)
                    
                    .opacity(0.7)
                     .overlay(
                          RoundedRectangle(cornerRadius: 20)
                          .stroke(customColor, lineWidth: 1)
                       )
                      .clipShape((RoundedRectangle(cornerRadius: 20)))
                      .padding(10)
                    
                   
                   
                    VStack{
                    List{
                        ForEach(TMLSelection, id: \.self) { tml in
                            Section(header: Text(tml).font(.headline)) {
                                ForEach(selectedItems.filter { $0["TML"] == tml }, id: \.self) { item in
                                    HStack {
                                        Text(item["option"] ?? "").font(.subheadline)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(item["measurement"] ?? "").font(.subheadline)
                                        Button(action: {
                                            if let index = selectedItems.firstIndex(where: { $0 == item }) {
                                                selectedItems.remove(at: index)
                                            }
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }

                                      
                                    }
                                    .background(.white)
                                    
                                }
                            }
                            .background(.white)
                           
                        }
                    }
                    .background(customColor)
                    .preferredColorScheme(.light)
                }
                
                    
                    
                }
                }
                    
                
                }
            
        
                    .tabItem {
                        Image(systemName: "2.circle")
                            .foregroundColor(customColor)
                    
                        Text("Add New Measure")
                            .foregroundColor(customColor)
                    }
                    
            }
            
            Button(action:{} ) {
                Text("Submit")
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
            
        
    }
            .foregroundColor(Color.black)
            .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
            .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
    }
       
}

struct sample_Previews: PreviewProvider {
    static var previews: some View {
        sample()
    }
}
