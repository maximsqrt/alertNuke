import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Setze deinen Google Maps API-Schlüssel
    GMSServices.provideAPIKey("DEIN_API_SCHLÜSSEL")
    
    // Registriere alle generierten Plugins
    GeneratedPluginRegistrant.register(with: self)
    
    // Rufe die super.application-Methode auf und gib ihren Rückgabewert zurück
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
