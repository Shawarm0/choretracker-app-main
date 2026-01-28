//
//  MainViewModel.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 28/01/2026.
//

import Foundation
internal import Combine

@MainActor
final class MainViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }
    
    func signOut() async {
        isLoading = true
        errorMessage = nil

        do {
            try await authService.signOut()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
