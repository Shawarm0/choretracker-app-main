//
//  MainView.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 28/01/2026.
//
import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    init(authService: AuthService) {
        self.viewModel = MainViewModel(authService: authService)
    }
    
    var body: some View {
        Button {
            Task { await viewModel.signOut() }
        } label: {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text("Sign Out")
                    .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(.borderedProminent)
        .disabled(viewModel.isLoading)
    }
}
