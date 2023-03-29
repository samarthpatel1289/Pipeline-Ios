//
//  AddNewView.swift
//  Pipeline Inspection
//
//  Created by Mansi on 3/3/23.
//

//------------ with api integration---------------


import SwiftUI


struct  AddNewView: View {
    
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
    @State private var back = false
    @Binding var userId : String
    @State private var user: User?
//    @Binding var firstname : String
//    @Binding var lastname : String
    
    @State private var addMeasure = false
    @State private var showProfile = false

    @State private var client = ""
    @State private var address1: String = ""
    @State private var address2: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipcode: String = ""
    @State private var cimaExam: String = ""
//    @State private var date: Date = Date()
    @State private var date: String = ""
    @State private var purchaseorder: String = ""
    @State private var part_report: String = ""
    @State private var specification: String = ""
    @State private var procedure: String = ""
    @State private var acceptancecriteria: String = ""
    @State private var partidentification: String = ""
    @State private var type: String = ""
    @State private var serial: String = ""
    @State private var pnid: String = ""
    @State private var dwg: String = ""
    @State private var temp: String = ""
    @State private var velocity: String = ""
    @State private var delay: String = ""
    @State private var mtl: String = ""
    @State private var frequency: String = ""
    @State private var description: String = ""
    @State private var cbmaterial: String = ""
    @State private var cbsurface: String = ""
    @State private var ueserial: String = ""
    @State private var uemodel: String = ""
    @State private var probemodel: String = ""
    @State private var probeserial: String = ""
    @State private var other: String = ""
    
    
   
    @State private var selectedTML = "Elbow"
    @State private var selectedOption = ""
    @State private var directionValue = ""
    @State private var selectedItems: [[String: String]] = []
    @State private var selectedItemIndex: Int?
   
    @State private var errorMessage = ""
    @State private var showErrorAlert = false
    
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
            
            TabView {
                
//------------ Tab 1 ---------------//
               ZStack(alignment: .topLeading) {
                   Color.white
               .ignoresSafeArea()	
               VStack(alignment:.leading, spacing: 20){
                 
                   
                   ScrollView {
                       VStack(alignment:.leading, spacing: 20){
               
   //  Client data
                    Section(header: Text("Client Data").fontWeight(.bold)){
                
                   
                      VStack(alignment:.leading, spacing: 20){
                          Text("Client")
                          textField("Client name", text: $client)
                      }
                      VStack(alignment:.leading, spacing: 20){
                          Text("Location")
                          VStack{
                          TextField("address1", text: $address1)
                          TextField("address2", text: $address2)
                          TextField("city", text: $city)
                          TextField("state", text: $state)
                          TextField("zipcode", text: $zipcode)
                          }
                          .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width / 1.5 : 315)
                          .padding()
                          .background(Color.white)
                          .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
                          .overlay(
                              Rectangle()
                              .stroke(customColor, lineWidth: 2)
                                      )
                      }
                        VStack(alignment:.leading, spacing: 20){
                            Text("cima_exam#")
                            textField("cima/exam#", text: $cimaExam)
                        }
//                      VStack(alignment:.leading, spacing: 20){
//
//                          DatePicker(selection: $date, in: ...Date(), displayedComponents: .date){Text("Date")}
//                      }
                        VStack(alignment:.leading, spacing: 20){
                            Text("Date")
                            textField("Date", text: $date)
                        }
                        VStack(alignment:.leading, spacing: 20){
                            Text("Purchase order#")
                            textField("order no", text: $purchaseorder)
                        }
                      VStack(alignment:.leading, spacing: 20){
                          Text("Part#/Report#")
                          textField("Part no./Report no.", text: $part_report)
                      }
                        VStack(alignment:.leading, spacing: 20){
                            Text("specification")
                            textField("specification", text: $specification)
                        }
                        VStack(alignment:.leading, spacing: 20){
                            Text("procedure")
                            textField("procedure", text: $procedure )
                        }
                        VStack(alignment:.leading, spacing: 20){
                            Text("acceptance_criteria")
                            textField("information", text: $acceptancecriteria)
                        }
                   }
   // PArt Data
                           Section(header: Text("Part Data").fontWeight(.bold)){
                     
                           
                       VStack(alignment:.leading, spacing: 20){
                              Text("Part Identification")
                              textField("Part no.", text: $partidentification)
                          }
                          VStack(alignment:.leading, spacing: 20){
                              Text("Surface")
                              textField("surface", text: $type)
                          }
                           VStack(alignment:.leading, spacing: 20){
                               Text("serial")
                               textField("serial", text: $serial)
                           }
                          VStack(alignment:.leading, spacing: 20){
                              Text("PND#")
                              textField("", text: $pnid)
                          }
                          VStack(alignment:.leading, spacing: 20){
                              Text("DWG#")
                              textField("", text: $dwg)
                          }
                           VStack(alignment:.leading, spacing: 20){
                               Text("Temp")
                               textField("", text: $temp)
                           }
                           VStack(alignment:.leading, spacing: 20){
                               Text("MTL")
                               textField("", text: $mtl)
                           }
                   }
                           
   //Calibreation block data
                           Section(header: Text("Calibreation block").fontWeight(.bold)){
                               
                               VStack(alignment:.leading, spacing: 20){
                                      Text("Material")
                                      textField("", text: $cbmaterial)
                                  }
                                  VStack(alignment:.leading, spacing: 20){
                                      Text("Surface")
                                      textField("", text: $cbsurface)
                                  }
                               Text("Ultrasonic Equipment")
                               .fontWeight(.bold)
                                  VStack(alignment:.leading, spacing: 20){
                                      Text("Model#")
                                      textField("", text: $uemodel)
                                  }
                                  VStack(alignment:.leading, spacing: 20){
                                      Text("Serial#")
                                      textField("", text: $ueserial)
                                  }
                               Text("Probe")
                               .fontWeight(.bold)
                                   VStack(alignment:.leading, spacing: 20){
                                       Text("Probe Model#")
                                       textField("", text: $probemodel)
                                   }
                                   VStack(alignment:.leading, spacing: 20){
                                       Text("Probe Serial#")
                                       textField("", text: $probeserial)
                                   }
                           }
                           
   // data
                           Group{
                               
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Valocity")
                                  textField("", text: $velocity)
                              }
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Delay")
                                  textField("", text: $delay)
                              }
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Frequency")
                                  textField("", text: $frequency)
                              }
                              VStack(alignment:.leading, spacing: 20){
                                  Text("Other")
                                  textField("", text: $other)
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
                       
                
                
// ---------- Tab2 --------------//
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
                        Button("Print List") {
                                        print(selectedItems)
                                    }
                }
                    
                }
                }
                    
                
                }
            
                    .tabItem {
                        Image(systemName: "2.circle")
                                            .foregroundColor(Color.green) // change the image color to green
                                        Text("Add New Measure")
                                            .foregroundColor(Color.yellow)
                    }
                    .background(.white)
            }
            
                
                
//----submit button ------//
            Button(action:{saveData()} ) {
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
       

// API integration
    
// Rsponse Data
    
    

    func saveData() {
        guard let url = URL(string: "http://192.168.1.163:3000/inspection") else {
            errorMessage = "Invalid URL"
            showErrorAlert = true
            return
        }

        let inspectionData = ["client": client, "cima_exam": cimaExam, "date": date, "purchaseorder": purchaseorder, "part_report": part_report, "specification": specification, "procedure": procedure,"acceptance_criteria": acceptancecriteria, "partidentification": partidentification, "pnid": pnid, "dwg": dwg, "temp": temp, "velocity": velocity, "delay": delay,"frequency": frequency, "description": description] as [String : Any]
            let locationData = ["address1": address1, "address2": address2, "city": city, "state": state, "zipcode": zipcode]
            let calibrationblockData = ["cbmaterial": cbmaterial, "cbsurface": cbsurface]
            let ultrasonicData = ["uemodel": uemodel, "ueserial": ueserial]
            let probeData = ["probemodel": probemodel, "probeserial": probeserial]
            let typeData = ["type": type, "serial": serial]
    //    let technicianData = ["name": (user?.firstname)(user?.lastname), "email":user?.email]
        var data: [[String: Any]] = []
               
               for tml in TMLSelection {
                   let items = selectedItems.filter { $0["tml"] == tml }
                   print("items::::",items)
                   if !items.isEmpty {
                       var itemData: [String: Any] = [:]
                       var subData: [String: Any] = [:]
                       
                       for item in items {
                           subData[item["option"] ?? ""] = Int(item["measurement"] ?? "") ?? 0
                       }
                       
                       itemData["tml"] = tml
                       itemData[tml.lowercased()] = subData
                       print("item:",itemData)
                       data.append(itemData)
                   }
               }
        print(data)
        let addData : [String: Any] = ["inspectionData": inspectionData, "locationData": locationData, "ultrasonicData": ultrasonicData, "calibrationblockData": calibrationblockData,"typeData": typeData , "probeData": probeData, "Data": data]

        print(addData)
            guard let data = try? JSONSerialization.data(withJSONObject: addData, options: []) else {
                print("Error: Cannot convert data to JSON format")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data

            URLSession.shared.dataTask(with: request) { data, response, error in
               if let error = error {
                   print(error.localizedDescription)
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    print("Data saved successfully!")
                } else {
                    print("Error: Data cannot be saved")
                }
            }.resume()
        }

    struct saveDataResponse: Codable {
        let id: String
        let client: String
        let cima_exam: String
        let date: Date
        let purchaseorder: String
        let part_report: String
        let specification: String
        let procedure: String
        let acceptancecriteria: String
        let partidentification: String
        let pnid: String
        let dwg: String
        let temp: String
        let MTL: String
        let valocity: String
        let delay: String
        let frequency: String
        let laddress1: String
        let address2: String
        let city: String
        let state: String
        let zipcode: String
        let cbmaterial: String
        let cbsurface: String
        let probemodel: String
        let probeserial: String
        let type: String
        let serial: String
    
    
        let name: String
        let email: String
    
        let tml: String
        let options: [String:Double]
    
    }


}
struct addnew_Previews: PreviewProvider {
    @State static var userId : String = ""
    static var previews: some View {
        
        AddNewView(userId: $userId)
     .previewDevice("iPhone 11 Pro")
        
        AddNewView(userId: $userId)
     .previewDevice("iPad Pro (11-inch) (3rd generation)")
     
        
    }
}









//-----------------tab views----------------------------


//import SwiftUI
//struct NewInspectionResponse: Codable {
//    let id: Int
//    let clientname: String
//    let location: String
//    let date: String
//    let reportno: String
//    let partno: String
//    let procedure: String
//    let PNDno: String
//    let DWGno: String
//    let temp: String
//    let MTL: String
//    let calMaterial: String
//    let calSurface: String
//    let UEModelno: String
//    let UESerialno: String
//    let probeModelno: String
//    let probeSerialno: String
//    let valocity: String
//    let delay: String
//    let frsequency: String
//    let other: String
//
//}
//
//struct  AddNewView: View {
//
//
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
//    @State private var back = false
//    @Binding var userId : Int
//    @State private var addMeasure = false
//    @State private var showProfile = false
//
//
//    @State private var selectedTML = "Elbow"
//    @State private var selectedOption = ""
//    @State private var directionValue = ""
//    @State private var selectedItems: [[String: String]] = []
//    @State private var selectedItemIndex: Int?
//
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
//    func textField(_ title: String, text: Binding<String>) -> some View {
//        TextField(title, text: text)
//            .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width / 1.5 : 315,height: 25)
//            .padding()
//            .background(Color.white)
//            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
//            .overlay(
//                Rectangle()
//                .stroke(customColor, lineWidth: 2)
//                        )
//
//    }
//
//        var body: some View {
//            VStack{
//            HStack{
//                Button(action: {self.back = true}){
//                Image(systemName: "arrow.backward")
//                    .padding(5)
//                }
//                       .fullScreenCover(isPresented: $back) {
//                           HomeScreenView(userId: $userId)
//                       }
//                Spacer()
//                Button(action: {self.showProfile = true})
//                {
//                    Image(systemName: "person.circle")
//
//                    .imageScale(.large)
//                    .padding(20)
//                }
//                  	     .fullScreenCover(isPresented: $showProfile) {
//                           ProfileView(userId: $userId)
//                       }
//            }
//
//
//                Text("New Inspection")
//                 .fontWeight(.heavy)
//
//            TabView {
//               ZStack(alignment: .topLeading) {
//                   Color.white
//               .ignoresSafeArea()
//               VStack(alignment:.leading, spacing: 20){
//
//
//                   ScrollView {
//                       VStack(alignment:.leading, spacing: 20){
//
//   //  Client data
//                   Group{
//                       Text("Client Data")
//                       .fontWeight(.bold)
//
//                      VStack(alignment:.leading, spacing: 20){
//                          Text("Client")
//                          textField("Client name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                      }
//                      VStack(alignment:.leading, spacing: 20){
//                          Text("Location")
//                          textField("City,State", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                      }
//                      VStack(alignment:.leading, spacing: 20){
//                          Text("Date")
//                          textField("date", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                      }
//                      VStack(alignment:.leading, spacing: 20){
//                          Text("Part#/Report#")
//                          textField("Part no./Report no.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                      }
//                   }
//   // PArt Data
//                   Group{
//                       Text("Part Data")
//                       .fontWeight(.bold)
//
//                       VStack(alignment:.leading, spacing: 20){
//                              Text("Part Identification")
//                              textField("Part no.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                          }
//                          VStack(alignment:.leading, spacing: 20){
//                              Text("Procedure")
//                              textField("procedure", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                          }
//                          VStack(alignment:.leading, spacing: 20){
//                              Text("PND#")
//                              textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                          }
//                          VStack(alignment:.leading, spacing: 20){
//                              Text("DWG#")
//                              textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                          }
//                           VStack(alignment:.leading, spacing: 20){
//                               Text("Temp")
//                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                           }
//                           VStack(alignment:.leading, spacing: 20){
//                               Text("MTL")
//                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                           }
//                   }
//
//   //Calibreation block data
//                           Group{
//                               Text("Calibration Block")
//                               .fontWeight(.bold)
//
//                               VStack(alignment:.leading, spacing: 20){
//                                      Text("Material")
//                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                  }
//                                  VStack(alignment:.leading, spacing: 20){
//                                      Text("Surface")
//                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                  }
//                               Text("Ultrasonic Equipment")
//                               .fontWeight(.bold)
//                                  VStack(alignment:.leading, spacing: 20){
//                                      Text("Model#")
//                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                  }
//                                  VStack(alignment:.leading, spacing: 20){
//                                      Text("Serial#")
//                                      textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                  }
//                               Text("Probe")
//                               .fontWeight(.bold)
//                                   VStack(alignment:.leading, spacing: 20){
//                                       Text("Probe Model#")
//                                       textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                   }
//                                   VStack(alignment:.leading, spacing: 20){
//                                       Text("Probe Serial#")
//                                       textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                   }
//                           }
//
//   // data
//                           Group{
//
//                              VStack(alignment:.leading, spacing: 20){
//                                  Text("Valocity")
//                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                              }
//                              VStack(alignment:.leading, spacing: 20){
//                                  Text("Delay")
//                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                              }
//                              VStack(alignment:.leading, spacing: 20){
//                                  Text("Frequency")
//                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                              }
//                              VStack(alignment:.leading, spacing: 20){
//                                  Text("Other")
//                                  textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                              }
//                           }
//
//
//                   }
//                   }
//
//               }
//
//           }
//                    .tabItem {
//                        Image(systemName: "1.circle")
//                        Text("inspection data")
//                            .foregroundColor(.black)
//                    }
//
//
//
//
////                Measurement data
//                ZStack(alignment: .topLeading) {
//                Color.white
//                    .ignoresSafeArea()
//                VStack(alignment: .leading, spacing: 20) {
//
//
//                VStack {
//                    Picker("TML", selection: $selectedTML) {
//                        ForEach(TMLSelection, id: \.self) { tml in
//                            Text(tml)
//
//                        }
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                    .font(.system(size: 30))
//                    .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width/1.5 : 315,height: 30)
//                        .padding()
//                        .background(Color.white)
//                        .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
//
//
//                    HStack{
//                    Spacer()
//                    Picker("Options", selection: $selectedOption) {
//                        ForEach(options, id: \.self) { option in
//                            Text(option)
//
//                        }
//                    }
//                    .id(selectedTML)
//
//                    Spacer()
//
//                    TextField("Measurement", text: $directionValue)
//                        .keyboardType(.numberPad)
//                    }
//                    .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width/1.5 : 315,height: 30)
//                        .padding()
//                        .background(Color.white)
//                        .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
//                    Spacer()
//
//                    Button(selectedItemIndex == nil ? "Add" : "Update") {
//                        if let index = selectedItemIndex {
//                            selectedItems[index]["option"] = selectedOption
//                            selectedItems[index]["measurement"] = directionValue
//                            selectedItemIndex = nil
//                        } else {
//                            let item = ["TML": selectedTML, "option": selectedOption, "measurement": directionValue]
//                            selectedItems.append(item)
//                        }
//                        selectedOption = ""
//                        directionValue = ""
//                    }
//                    .frame(width: 200, height: 40)
//
//                    .opacity(0.7)
//                     .overlay(
//                          RoundedRectangle(cornerRadius: 20)
//                          .stroke(customColor, lineWidth: 1)
//                       )
//                      .clipShape((RoundedRectangle(cornerRadius: 20)))
//                      .padding(10)
//
//
//
//                    VStack{
//                    List{
//                        ForEach(TMLSelection, id: \.self) { tml in
//                            Section(header: Text(tml).font(.headline)) {
//                                ForEach(selectedItems.filter { $0["TML"] == tml }, id: \.self) { item in
//                                    HStack {
//                                        Text(item["option"] ?? "").font(.subheadline)
//                                            .foregroundColor(.black)
//                                        Spacer()
//                                        Text(item["measurement"] ?? "").font(.subheadline)
//                                        Button(action: {
//                                            if let index = selectedItems.firstIndex(where: { $0 == item }) {
//                                                selectedItems.remove(at: index)
//                                            }
//                                        }) {
//                                            Image(systemName: "trash")
//                                                .foregroundColor(.red)
//                                        }
//
//
//                                    }
//                                    .background(.white)
//
//                                }
//                            }
//                            .background(.white)
//
//                        }
//                    }
//                    .background(customColor)
//                    .preferredColorScheme(.light)
//                }
//
//
//
//                }
//                }
//
//
//                }
//
//
//                    .tabItem {
//                        Image(systemName: "2.circle")
//                                            .foregroundColor(Color.green) // change the image color to green
//                                        Text("Add New Measure")
//                                            .foregroundColor(Color.yellow)
//                    }
//                    .background(.white)
//            }
//
//            Button(action:{} ) {
//                Text("Submit")
//                    .foregroundColor(Color.white)
//                    .padding()
//
//            }
//            .frame(width: 200, height: 40)
//
//            .background(customColor)
//        .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.black, lineWidth: 1)
//                )
//        .clipShape((RoundedRectangle(cornerRadius: 20)))
//        .padding(10)
//
//
//    }
//            .foregroundColor(Color.black)
//            .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
//            .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
//    }
//
//}
//
//struct addnew_Previews: PreviewProvider {
//    @State static var userId : Int = 0
//    static var previews: some View {
//
//        AddNewView(userId: $userId)
//     .previewDevice("iPhone 11 Pro")
//
//        AddNewView(userId: $userId)
//     .previewDevice("iPad Pro (11-inch) (3rd generation)")
//
//
//    }
//}













//------------------ two different views---------------------------


//import SwiftUI
//
//struct AddNewView: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    let customColor = Color(red: 1.0, green: 0.525, blue: 0.224)
//    @State private var back = false
//    @Binding var userId : Int
//    @State private var addMeasure = false
//    @State private var showProfile = false
//
//    func textField(_ title: String, text: Binding<String>) -> some View {
//        TextField(title, text: text)
//            .frame(width:horizontalSizeClass == .regular && verticalSizeClass == .regular ? UIScreen.main.bounds.width / 1.5 : 315,height: 25)
//            .padding()
//            .background(Color.white)
//            .shadow( color:customColor.opacity(0.7),radius: 7,x:2, y:4)
//            .overlay(
//                Rectangle()
//                .stroke(customColor, lineWidth: 2)
//                        )
//
//    }
//
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//                Color.white
//            .ignoresSafeArea()
//            VStack(alignment:.leading, spacing: 20){
//                HStack{
//                    Button(action: {self.back = true}){
//                    Image(systemName: "arrow.backward")
//                        .padding(5)
//                    }
//                    .fullScreenCover(isPresented: $back) {
//                        HomeScreenView(userId: $userId)
//                    }
//                    Spacer()
//                    Button(action: {self.showProfile = true})
//                    {
//                        Image(systemName: "person.circle")
//
//                        .imageScale(.large)
//                        .padding(20)
//                    }
//                    .fullScreenCover(isPresented: $showProfile) {
//                        ProfileView(userId: $userId)
//                    }
//                }
//
//
//                    Text("New Inspection")
//                     .fontWeight(.heavy)
//
//                ScrollView {
//                    VStack(alignment:.leading, spacing: 20){
//
////  Client data
//                Group{
//                    Text("Client Data")
//                    .fontWeight(.bold)
//
//                   VStack(alignment:.leading, spacing: 20){
//                       Text("Client")
//                       textField("Client name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                   }
//                   VStack(alignment:.leading, spacing: 20){
//                       Text("Location")
//                       textField("City,State", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                   }
//                   VStack(alignment:.leading, spacing: 20){
//                       Text("Date")
//                       textField("date", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                   }
//                   VStack(alignment:.leading, spacing: 20){
//                       Text("Part#/Report#")
//                       textField("Part no./Report no.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                   }
//                }
//// PArt Data
//                Group{
//                    Text("Part Data")
//                    .fontWeight(.bold)
//
//                    VStack(alignment:.leading, spacing: 20){
//                           Text("Part Identification")
//                           textField("Part no.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                       }
//                       VStack(alignment:.leading, spacing: 20){
//                           Text("Procedure")
//                           textField("procedure", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                       }
//                       VStack(alignment:.leading, spacing: 20){
//                           Text("PND#")
//                           textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                       }
//                       VStack(alignment:.leading, spacing: 20){
//                           Text("DWG#")
//                           textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                       }
//                        VStack(alignment:.leading, spacing: 20){
//                            Text("Temp")
//                            textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                        }
//                        VStack(alignment:.leading, spacing: 20){
//                            Text("MTL")
//                            textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                        }
//                }
//
////Calibreation block data
//                        Group{
//                            Text("Calibration Block")
//                            .fontWeight(.bold)
//
//                            VStack(alignment:.leading, spacing: 20){
//                                   Text("Material")
//                                   textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                               }
//                               VStack(alignment:.leading, spacing: 20){
//                                   Text("Surface")
//                                   textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                               }
//                            Text("Ultrasonic Equipment")
//                            .fontWeight(.bold)
//                               VStack(alignment:.leading, spacing: 20){
//                                   Text("Model#")
//                                   textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                               }
//                               VStack(alignment:.leading, spacing: 20){
//                                   Text("Serial#")
//                                   textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                               }
//                            Text("Probe")
//                            .fontWeight(.bold)
//                                VStack(alignment:.leading, spacing: 20){
//                                    Text("Probe Model#")
//                                    textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                }
//                                VStack(alignment:.leading, spacing: 20){
//                                    Text("Probe Serial#")
//                                    textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                                }
//                        }
//
//// data
//                        Group{
//
//                           VStack(alignment:.leading, spacing: 20){
//                               Text("Valocity")
//                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                           }
//                           VStack(alignment:.leading, spacing: 20){
//                               Text("Delay")
//                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                           }
//                           VStack(alignment:.leading, spacing: 20){
//                               Text("Frequency")
//                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                           }
//                           VStack(alignment:.leading, spacing: 20){
//                               Text("Other")
//                               textField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                           }
//                        }
//
//                        HStack{
//                            Spacer()
//                            Button(action: {self.addMeasure = true}){
//                            Text("Add Measurements")
//
//                            }
//                            .frame(width: 200, height: 40)
//                            .background(customColor)
//                             .overlay(
//                                  RoundedRectangle(cornerRadius: 20)
//                                  .stroke(Color.black, lineWidth: 1)
//                               )
//                              .clipShape((RoundedRectangle(cornerRadius: 20)))
//                              .padding(10)
//                            .fullScreenCover(isPresented: $addMeasure) {
//                                AddNewMeasure(userId:$userId)}
//
//                        }
//                }
//                }
//
//            }
//            .foregroundColor(Color.black)
//            .padding(horizontalSizeClass == .regular && verticalSizeClass == .regular ? 20 : 10)
//            .font(.system(size: horizontalSizeClass == .regular && verticalSizeClass == .regular ? 32 : 24))
//        }
//        .padding(10)
//    }
//}
//
//
//// Measurement page
//struct AddNewMeasure: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//
//    @Binding var userId : Int
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
//                    AddNewView(userId:$userId)
//                }
//                Spacer()
//
//            }
//
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
//                    Section(header: Text(tml).font(.headline)) {
//                        ForEach(selectedItems.filter { $0["TML"] == tml }, id: \.self) { item in
//                            HStack {
//                                Text(item["option"] ?? "").font(.subheadline)
//                                    .foregroundColor(.black)
//                                Spacer()
//                                Text(item["measurement"] ?? "").font(.subheadline)
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
//                            .background(.white)
//
//                        }
//                    }
//                    .background(.white)
//
//                }
//            }
//            .background(customColor)
//            .preferredColorScheme(.light)
//        }
//
//            Button(action:{} ) {
//                Text("Submit")
//                    .foregroundColor(Color.white)
//                    .padding()
//
//            }
//            .frame(width: 200, height: 40)
//
//            .background(customColor)
//        .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                .stroke(Color.black, lineWidth: 1)
//                )
//        .clipShape((RoundedRectangle(cornerRadius: 20)))
//        .padding(10)
//
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
//struct AddNewView_Previews: PreviewProvider {
//    @State static var userId : Int = 0
//    static var previews: some View {
////        Group {
//
////           AddNewView(userId: $userId)
////                .previewDevice("iPhone 11 Pro")
////
////
////           AddNewView(userId: $userId)
////               .previewDevice("iPad Pro (11-inch) (3rd generation)")
////
////          }
//
//        AddNewMeasure(userId: $userId)
//             .previewDevice("iPhone 11 Pro")
//
//
//        AddNewMeasure(userId: $userId)
//            .previewDevice("iPad Pro (11-inch) (3rd generation)")
//
//       }
//    }
//
