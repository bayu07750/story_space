import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Add the following line, with your API key
    GMSServices.provideAPIKey("YOUR_API_KEY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
