//
//  Untitled.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 28/01/2026.
//

import Foundation
internal import Combine

@MainActor
class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }
    
    
    
    func signIn() async {
        isLoading = true
        errorMessage = nil

        do {
            try await authService.signIn(
                email: email,
                password: password
            )
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

}
