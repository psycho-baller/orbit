//
//  OrbitApp.swift
//  Orbit
//
//  Created by Rami Maalouf on 2024-10-15.
//

import SwiftUI
import UIKit

@main
struct OrbitApp: App {
    // Using the AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Use scenePhase to handle scene lifecycle events in SwiftUI
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var systemEventsHandler = SystemEventsHandler() // Replace with your system events handler
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentView.ViewModel(container: AppEnvironment.bootstrap().container))
                .onChange(of: scenePhase) { newPhase in
                    handleScenePhaseChange(newPhase)
                }
        }
    }
    
    private func handleScenePhaseChange(_ newPhase: ScenePhase) {
        switch newPhase {
        case .active:
            systemEventsHandler.sceneDidBecomeActive()
        case .inactive:
            systemEventsHandler.sceneWillResignActive()
        case .background:
            // Handle background transition if needed
            break
        @unknown default:
            break
        }
    }
}
