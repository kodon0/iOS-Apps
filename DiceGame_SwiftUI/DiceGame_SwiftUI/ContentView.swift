//
//  ContentView.swift
//  DiceGame_SwiftUI
//
//  Created by Kieran O'Donnell on 10/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @ State var rhdNum = 4
    @ State var lhdNum = 5
    var body: some View {
                ZStack{
            Color(UIColor(red: 0.88, green: 0.44, blue: 0.33, alpha: 0.9))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack {
                        Spacer()
                        HStack {
                            DiceView(n: rhdNum)
                            DiceView(n: lhdNum)
                        }
                    .padding()
                        Spacer()
                        Button(action: {
                            self.rhdNum = Int.random(in: 1...6)
                            self.lhdNum = Int.random(in: 1...6)
                        }) {
                            Text("Let's roll!")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            .padding()
                        }
                        .background(Color(.white))
                        Spacer()
                    }
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

