//
//  DIContainer.Interactors.swift
//  Orbit
//
//  Created by Alexey Naumov on 24.10.2019.
//  Copyright © 2019 Alexey Naumov. All rights reserved.
//
//protocol CountriesInteractor {}
//protocol ImagesInteractor {}
//protocol UserPermissionsInteractor {}
//
//struct StubCountriesInteractor: CountriesInteractor {}
//struct StubImagesInteractor: ImagesInteractor {}
//struct StubUserPermissionsInteractor: UserPermissionsInteractor {}

extension DIContainer {
    struct Interactors {
        let countriesInteractor: CountriesInteractor
        let imagesInteractor: ImagesInteractor
        let userPermissionsInteractor: UserPermissionsInteractor
        
        init(countriesInteractor: CountriesInteractor,
             imagesInteractor: ImagesInteractor,
             userPermissionsInteractor: UserPermissionsInteractor) {
            self.countriesInteractor = countriesInteractor
            self.imagesInteractor = imagesInteractor
            self.userPermissionsInteractor = userPermissionsInteractor
        }
        
        static var stub: Self {
            .init(countriesInteractor: StubCountriesInteractor(),
                  imagesInteractor: StubImagesInteractor(),
                  userPermissionsInteractor: StubUserPermissionsInteractor())
        }
    }
}
