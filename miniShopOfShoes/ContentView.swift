//
//  ContentView.swift
//  miniShopOfShoes
//
//  Created by Peter Clarke on 22.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var shoesIndex = 0
    @State var namesOfBrand = ["Nike", "Puma", "Adidas"]
    @State var imagesOfShoes = ["nike", "puma", "adidas"]
    
    var body: some View {
        
        VStack{
            
            Text("Название кроссовок - \(namesOfBrand[shoesIndex])")
            Spacer()
            ZStack{
                
                RoundedRectangle(cornerRadius: 15)
                Image(imagesOfShoes[shoesIndex])
                    .resizable()
                    .frame(width: 300, height: 300)
                
                
            }
            .foregroundColor(Color.white)
            .padding()
            .animation(.spring(response: 0.7, blendDuration: 0.5))
            
            Picker(selection: Binding(get: {
                self.shoesIndex
            }, set: {
                newValue in
                self.shoesIndex = newValue
            }),  label: Text("")){
                ForEach(0..<namesOfBrand.count){
                    Text(self.namesOfBrand[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer().frame(height: 20)
            .background(Color.red)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
