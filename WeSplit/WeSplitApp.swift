//
//  WeSplitApp.swift
//  WeSplit
//
//  Created by Sandeep.Tomar on 08/12/22.
//

import SwiftUI

@main
struct WeSplitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
