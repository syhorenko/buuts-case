Case:
    
    Create a small test app with a list of locations. Your app should fetch the locations from https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json
Once opened, the app should show the list of locations in a list view.
The use of UIKit is mandatory as a foundation, but a small amount of SwiftUI is allowed.’


Intro:
    App consist of moduls:
    
        00 SharedHelpers
            <Contains Utils which can be shared.>
        01 APIModule
            <Responsible for API calls. Getting Locations or images>
            LocationImageApi
            LocationsApi
        02 DBModule
            <Responsible for DB communication>
            LocationsDb
        03 ShareModule
            <TODO Module for sharing locations>
        AppModule
            <Everything related to the app>
        Features
            <Contains features protocols (DIP)>
            LocationFeature
            LocationImage
        Scenes
            <App scenes. Uses Clean Swift architecture>
            Generics
                <Some base classes>
            Locations
            Location Detail
        
        Main.storyboard
            <App is not using storyboard. Layout is done from the code>
            <BUT storyboard is used to build Application Map.>
            <It represents screens and navigation between scenes>
            <After finishing feature add it to storyboard>
            <Later can be used as addition to UI test>
        
Future improvements and TODO's':
    - Add Core Data and store there Locations
    - Coverege 100% with unit tests
    - Add documentation
    - Add localization
    - Add images
    - RemoteLocationImageLoader // TODO: Parse response here. If error - throw an error
    - DBLocationsLoader // TODO: Implement loading from DB
    - DBLocationsStoring // TODO: Implement storing to DB
    - CombinedLocationsLoader 
        // TODO: Possible imrovment. Show stored items if we have so user see without waiting stored items and meanwhile load from API
        // First we try to make API call to fetch the most recent Locations and store them to DB
    - LocationDetailWorker // TODO: Add caching of the image (or saving to DB)
    - LocationsListRouter // TODO: LocationsList.DisplayedLocation should not contain latitude, longitude it should operate with id. When DB is implemented rework it.
