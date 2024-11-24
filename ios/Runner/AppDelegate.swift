import Flutter
import UIKit
import GoogleMaps

@UIApplicationMain

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyAtdm_WaTAALh7KzQdR9xV9CUXtdXDhUvE")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
