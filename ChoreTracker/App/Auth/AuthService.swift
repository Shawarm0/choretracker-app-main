//
//  AuthService.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 28/01/2026.
//
internal import Auth
internal import Combine


final class AuthService: ObservableObject {
    @Published var session: Session?
    @Published var isLoading = true
    
    private let auth = SupabaseClientProvider
        .supabaseClient
        .auth
    
    init() {
        Task {
            await loadSession()
        }
    }
    
    func loadSession() async {
        defer { isLoading = false }
        
        do {
            session = try await auth.session
        } catch {
            session = nil
        }
        
    }
    

    func signIn(email: String, password: String) async throws {
        let response = try await auth.signIn(
            email: email,
            password: password
        )
        session = response
    }
    
    func signOut() async throws {
        try await auth.signOut()
        session = nil
    }
    
    
}
