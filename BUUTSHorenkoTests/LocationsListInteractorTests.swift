//
//  LocationsListInteractorTests.swift
//  BUUTSHorenkoTests
//
//  Created by Serhii Horenko on 09/07/2025.
//

import XCTest
@testable import BUUTSHorenko

final class LocationsListInteractorTests: XCTestCase {
    
    // MARK: - Mocks
    
    private class WorkerMock: LocationsListWorker {
        
        var expectedLocations: [Location] = []
        var errorToThrow: Error?
        
        private(set) var loadLocationsCalled = false
        
        override func loadLocations() async throws -> [Location] {
            loadLocationsCalled = true
            
            if let errorToThrow {
                throw errorToThrow
            }
            
            return expectedLocations
        }
    }
    
    private class PresenterMock: LocationsListPresentationLogic {
        var givenFetchLocationsResponse: LocationsList.FetchLocations.Response!
        var givenFetchLocationsViewModel: LocationsList.FetchLocations.ViewModel!
        
        private(set) var presentFetchedLocationsCalled = false
        private(set) var presentErrorCalled = false
        
        func presentFetchedLocations(response: LocationsList.FetchLocations.Response) {
            presentFetchedLocationsCalled = true
            givenFetchLocationsResponse = response
        }
        
        func presentError(viewModel: LocationsList.FetchLocations.ViewModel) {
            presentErrorCalled = true
            givenFetchLocationsViewModel = viewModel
        }
    }
    
    // MARK: - Test fetchLocations(request:)
    
    func testFetchLocations_shouldCallWorker_loadLocations() async {
        // Given
        let (workerMock, _, sut) = makeSUT()
        
        // When
        await sut.fetchLocations(request: .init())
        
        // Then
        XCTAssertTrue(workerMock.loadLocationsCalled, "Worker.loadLocations() was called")
    }
    
    func testFetchLocations_shouldNotCallPresenter_presentFetchedLocations_ifWorkerThrowsError() async {
        // Given
        let error = NSError(domain: "TestErrorDomain", code: 0, userInfo: nil)
        let (workerMock, presenterMock, sut) = makeSUT()
        workerMock.errorToThrow = error
        
        // When
        await sut.fetchLocations(request: .init())
        
        // Then
        XCTAssertFalse(presenterMock.presentFetchedLocationsCalled, "Presenter.presentFetchedLocations was not called")
    }
    
    func testFetchLocations_shouldCallPresenter_presentErrorWithExpectedViewModel_ifWorkerThrowError() async {
        // Given
        let error = NSError(domain: "TestErrorDomain", code: 0, userInfo: nil)
        let (workerMock, presenterMock, sut) = makeSUT()
        workerMock.errorToThrow = error
        
        // When
        await sut.fetchLocations(request: .init())
        
        // Then
        XCTAssertTrue(presenterMock.presentErrorCalled, "Presenter.presentError was called")
        XCTAssertEqual(presenterMock.givenFetchLocationsViewModel.displayedLocations.count, 0, "ViewModel should contain no displayedLocations")
        XCTAssertEqual(presenterMock.givenFetchLocationsViewModel.error?.title, "Failed to load locations")
        XCTAssertEqual(presenterMock.givenFetchLocationsViewModel.error?.explanation, error.localizedDescription)
    }
    
    func testFetchLocations_shouldCallPresenter_presentFetchedLocations_withExpectedLocationsFromWorker() async {
        // Given
        let locations: [Location] = [
            .init(name: "Any name", latitude: 0.0, longitude: 0.0)
        ]
        let (workerMock, presenterMock, sut) = makeSUT()
        workerMock.expectedLocations = locations
        
        // When
        await sut.fetchLocations(request: .init())
        
        // Then
        XCTAssertTrue(presenterMock.presentFetchedLocationsCalled, "Presenter.presentFetchedLocations was called")
        XCTAssertEqual(locations.count, presenterMock.givenFetchLocationsResponse.locations.count, "Presenter.presentFetchedLocations received correct number of locations")
    }
    
    // MARK: - Private helpers
    
    private func makeSUT() -> (worker: WorkerMock, presenter: PresenterMock, sut: LocationsListInteractor) {
        let worker = WorkerMock()
        let sut = LocationsListInteractor(worker: worker)
        let presenter = PresenterMock()
        sut.presenter = presenter
        
        return (worker, presenter, sut)
    }
}
