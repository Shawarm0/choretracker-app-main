//
//  SupabaseConfi.swift
//  ChoreTracker
//
//  Created by Lovin Sharma on 27/01/2026.
//
import Foundation

enum Environment {
    static let url = URL(string: Bundle.main.object(
        forInfoDictionaryKey: "SUPABASE_URL"
    ) as! String)!

    static let anonKey = Bundle.main.object(
        forInfoDictionaryKey: "SUPABASE_KEY"
    ) as! String
}
