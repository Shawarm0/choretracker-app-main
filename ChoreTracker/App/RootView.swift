//
//  ContentView.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 25/01/2026.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authService = AuthService()
    
    var body: some View {
        Group {
            if authService.isLoading {
                ProgressView()
            } else if authService.session != nil {
                MainView(authService: authService)
            } else {
                LoginView(authService: authService)
            }
        }
    }
}
