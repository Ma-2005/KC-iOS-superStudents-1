//
//  ContentView.swift
//  RPS
//
//  Created by Mac on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var RPS = ["1","2","3"]
    
    @State var P = ""
    
    @State var IG = "1"
    @State var IM = "1"
    
    @State var R1 = 0
    @State var R2 = 0
    
    @State var win = ""
    
    @State private var showAlert = false
    
    var body: some View {
    
        ZStack{
            Image("33")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                Text("Guest")
                    .font(.custom("Amiri-BoldItalic", size: 36))
                    .foregroundColor(.white)
                    .shadow(color: .yellow, radius: 5)
                    .padding()
                    .background(.yellow.opacity(0.7))
                    .cornerRadius(30)
                Spacer()
                
                    
                HStack{
                HStack{
                    VStack{
                    
                        Text("\(R1)")

                        Divider()
                        
                        Text("\(R2)")
                        
                        
                    }
                    .padding()
                    .font(.custom("Amiri-BoldItalic", size: 35))
                    .foregroundColor(.black)
                    .shadow(color: .yellow, radius: 5)
                    .frame(width: 60, height: 220)
                    .background(.white.opacity(1))
                    .cornerRadius(15)
                    
                    Spacer()
                }
                    
                    HStack{
                        Spacer()
                        
                        VStack{
                            
                            Image(IG)
                                .resizable()
                                .scaledToFit()
                              
                                
                            Image(IM)
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    MyGame()
                                    
                                }
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Congratulations"), message: Text("Winner : \(win)"), dismissButton: .default(Text("Play again")){
                                        R1 = 0
                                        R2 = 0
                                    }) }

                                
                            
                        }
                    }
                    .padding()
                    
                }
                Spacer()
                
                TextField("     Player Name", text: $P)
                    .font(.custom("Amiri-BoldItalic", size: 36))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5)
                    .frame(width: 300, height: 100)
                    .background(.yellow.opacity(1))
                    .cornerRadius(30)
                    .padding()
                
            }.padding()
        }
    }
    func MyGame(){
        if let B = RPS.randomElement(){
        IG = B
            
        }
        if let A = RPS.randomElement(){
        IM = A
            
        }
        if  IG == RPS[0] && IM == RPS[0] {
            
        }
        else if IG == RPS[0] && IM == RPS[1] {
            R1 += 1
        }
        else if IG == RPS[0] && IM == RPS[2] {
            R2 += 1
        }
        else if  IG == RPS[1] && IM == RPS[0] {
            R2 += 1
        }
        else if  IG == RPS[1] && IM == RPS[1] {
            
        }
        else if  IG == RPS[1] && IM == RPS[2] {
            R1 += 1
        }
        else if  IG == RPS[2] && IM == RPS[0] {
            R1 += 1
        }
        else if  IG == RPS[2] && IM == RPS[1] {
            R2 += 1
        }
        else if  IG == RPS[2] && IM == RPS[2] {
            
        }
        if R2 == 3 || R1 == 3 {
                  
            if R1 == 3 {
                       win = "Guest"
                   }
                   else if R2 == 3 {
                       win = P
                   }
            
            showAlert = true
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
