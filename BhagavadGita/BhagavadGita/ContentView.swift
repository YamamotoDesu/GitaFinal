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

    var count = "1"
    var body: some View {
        NavigationView {
            VStack {
                Text(L10n.CpntentView.bhagavadGitaChapter(count))
                Text(L10n.CpntentView.bhagavadGitaTitle)
                Text("CpntentView.bhagavad_gita_chapter \(count)")
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}
