//
//  ContentView.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/02/27.
//

import SwiftUI
import BGUtility

struct ContentView: View {

    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            Text("Select an item")
                .onAppear {
                    viewModel.onAppear()
                }
        }
    }
}
