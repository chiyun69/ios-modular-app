//
//  AppEnvironment.swift
//  main-app
//
//  Created by Chi Zhuang Yan on 19/4/25.
//

import Foundation

// Global app-level dependencies/environment
class AppEnvironment {
    static let shared = AppEnvironment()
    
    private init() {}
    
    // Common services that might be needed across modules
    let networkService = NetworkService()
    let storageService = StorageService()
    let analyticsService = AnalyticsService()
}

// Common services
class NetworkService {
    func request<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        // Implementation here
        print("Making request to \(endpoint)")
        
        // Simulate network request
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            // Mock success for demo purposes
            completion(.failure(NSError(domain: "NetworkError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])))
        }
    }
}

class StorageService {
    private let userDefaults = UserDefaults.standard
    
    func save<T: Encodable>(_ object: T, forKey key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            userDefaults.set(data, forKey: key)
        } catch {
            print("Failed to encode object: \(error)")
        }
    }
    
    func retrieve<T: Decodable>(forKey key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Failed to decode object: \(error)")
            return nil
        }
    }
}

class AnalyticsService {
    func logEvent(_ name: String, parameters: [String: Any]? = nil) {
        print("Analytics - Event: \(name), Parameters: \(parameters ?? [:])")
    }
}
