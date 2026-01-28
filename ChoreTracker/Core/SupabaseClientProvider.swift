//
//  SupabaseClientProvider.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 27/01/2026.
//
import Supabase

final class SupabaseClientProvider {
    static let supabaseClient = SupabaseClientProvider()
    
    let client: SupabaseClient
    let auth: AuthClient
    
    
    private init() {
        client = SupabaseClient(
            supabaseURL: Environment.url,
            supabaseKey: Environment.anonKey,
        )
        auth = client.auth
    }
}
