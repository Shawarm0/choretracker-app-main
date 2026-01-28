//
//  ChoreTrackerApp.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 25/01/2026.
//

import SwiftUI
internal import Auth

@main
struct ChoreTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .onOpenURL { url in
                    SupabaseClientProvider
                        .supabaseClient
                        .auth
                        .handle(url)
                }
        }
    }
}

