//
//  slidenumberApp.swift
//  slidenumber
//
//  Created by KnoWhere on 20/11/23.
//

import SwiftUI

@main
struct slidenumberApp: App {
    var body: some Scene {
        @StateObject var game = slidenumberViewModel()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
