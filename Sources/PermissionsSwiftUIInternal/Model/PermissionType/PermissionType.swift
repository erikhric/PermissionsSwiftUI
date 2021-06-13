//
//  PermissionModel.swift
//
//
//  Created by Jevon Mao on 1/30/21.
//

import Foundation
import SwiftUI
import HealthKit

/**
 The types of iOS system permission for show in the JMPermissions view
 
 Pass this as a parameter into JMPermissions View Modifier will display 3 UI elements–location, photo, and microphone.
 ```
 [.location, photo, microphone]
 ```
 */
@available(iOS 13.0, tvOS 13.0, *)
public enum PermissionType: Hashable, Equatable {
    public static func == (lhs: PermissionType, rhs: PermissionType) -> Bool {
        lhs.rawValue == rhs.rawValue ? true : false
    }
    open class PermissionManager: NSObject, Identifiable {
        open var permissionComponent: JMPermission {
            get {
                preconditionFailure("This property must be overridden.")
            }
        }
        open var healthPermissionCategories: Set<HKSampleType>?
        
        open var permissionType: PermissionType {
            preconditionFailure("This property must be overridden.")
        }
        
        open var authorizationStatus: AuthorizationStatus  {
            get {
                preconditionFailure("This property must be overridden.")
            }
        }
        
        public init(_ healthPermissionCategories: Set<HKSampleType>? = nil) {
            self.healthPermissionCategories = healthPermissionCategories
        }
        open func requestPermission(completion: @escaping (Bool, Error?) -> Void) {
            preconditionFailure("This method must be overridden.")
        }
    }
    ///The `location` permission allows the device's positoin to be tracked
        case location
        
        ///Used to access the user's photo library
        case photo
       
        ///The `notification` permission allows the iOS system to receive notification from app
        case notification
        
        ///Permission that allows app to access device's bluetooth technologies
        case bluetooth
        
        ///In order for app to track user's data across apps and websites, the tracking permission is needed
        @available(iOS 14, tvOS 14, *) case tracking
        #if !os(tvOS)
        /**
         Permission that allows app to access healthkit information
         
         - Note: Extensive Info.plist  values and configurations are required for HealthKit authorization. Please see Apple Developer [website](https://developer.apple.com/documentation/healthkit/authorizing_access_to_health_data) for details. \n
         
         For example, passing in a `Set` of `HKSampleType`:
         ```
         [.health(categories: .init(readAndWrite: Set([HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!])))]
         ```
         */
        case health
        #endif

        ///The `locationAlways` permission provides location data even if app is in background
        @available(tvOS, unavailable) case locationAlways
        
        ///Permission allows developers to interact with the device microphone
        @available(tvOS, unavailable) case microphone
        
        ///Permission that allows developers to interact with on-device camera
        @available(tvOS, unavailable) case camera
        
        ///A permission that allows developers to read & write to device contacts
        @available(tvOS, unavailable) case contacts
        
        ///Permission that give app access to motion and fitness related sensor data
        @available(tvOS, unavailable) case motion
        
        ///The `reminders` permission is needed to interact with device reminders
        @available(tvOS, unavailable) case reminders
        
        ///Permission that allows app to read & write to device calendar
        @available(tvOS, unavailable) case calendar
        
        ///Permission that allows app to use speech recognition
        @available(tvOS, unavailable) case speech
        
        ///Permission that allows app to control audio playback of the device
        @available(tvOS, unavailable) case music
    
}



