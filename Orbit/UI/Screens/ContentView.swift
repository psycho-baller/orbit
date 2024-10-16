//
//  ContentView.swift
//  Orbit
//
//  Created by Alexey Naumov on 23.10.2019.
//  Copyright © 2019 Alexey Naumov. All rights reserved.
//

import Combine
import SwiftUI

// MARK: - View

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var userVM: UserViewModel

    @State var isOneSecondAfterLaunch = false
    //    init(viewModel: ViewModel) {
    //        self.viewModel = viewModel
    //        _authVM =
    //            StateObject(
    //                wrappedValue: AuthViewModel(
    //                    viewModel.container.services.accountManagementService
    //                )
    //            )
    //    }

    var body: some View {
        NavigationView {
            ZStack {
                if authVM.isLoading {
                    // Show a loading indicator while checking login status
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.opacity.combined(with: .scale))  // Loading transition
                }
                if authVM.isLoggedIn {
                    //                    CountriesList(
                    //                        viewModel: .init(container: viewModel.container)
                    //                    )
                    //                    .attachEnvironmentOverrides(
                    //                        onChange: viewModel.onChangeHandler
                    //                    )
                    //                    .modifier(
                    //                        RootViewAppearance(
                    //                            viewModel: .init(container: viewModel.container))
                    //                    )
                    //                    .transition(
                    //                        .move(edge: .trailing)
                    //                    )
                    MainTabView()

                }
                if !authVM.isLoggedIn && !authVM.isLoading {

                    LoginView()
                        //                            .transition(.move(edge: .leading))  // Regular transition
                        .transition(
                            .asymmetric(
                                insertion: isOneSecondAfterLaunch
                                    ? .move(edge: .leading) : .scale,
                                removal: .move(edge: .leading))
                        )

                }
            }.animation(
                .easeInOut, value: authVM.isLoggedIn || authVM.isLoading)
        }.onAppear {
            Task {
                await authVM.initialize()
                // wait for 1 second
                try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
                isOneSecondAfterLaunch = true
            }

        }
    }

}


// MARK: - Preview

#if DEBUG
    #Preview{
        ContentView()
            .environmentObject(AuthViewModel())
            .environmentObject(UserViewModel())
    }
#endif
