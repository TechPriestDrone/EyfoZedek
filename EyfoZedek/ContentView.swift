//
//  ContentView.swift
//  EyfoZedek
//
//  Created by Andrey Safronov on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack {
            if mainViewModel.numberToDisplay == ""{
                Button(action: {
                    mainViewModel.getDataFromAPI()
                }, label: {
                    Text("מצא צדק")
                })
            } else {
                Text("")
            }
            if mainViewModel.numberToDisplay == ""{
                Text("")
            } else {
                Text("הצדק שחיפשת נמצא \(mainViewModel.numberToDisplay) קילומטר ממך.ֿ\n כי הוא כוכב לכת. \n והוא מאוד רחוק.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(mainViewModel: MainViewModel())
}
