//
//  File.swift
//
//
//  Created by Jevon Mao on 1/31/21.
//

import Foundation
import UIKit
import UserNotifications
import PermissionsSwiftUIInternal

@available(iOS 13.0, tvOS 13.0, *)
public extension PermissionType.PermissionManager {
    static let notification = JMNotificationPermissionManager()
}

@available(iOS 13.0, tvOS 13.0, *)
public class JMNotificationPermissionManager: PermissionType.PermissionManager {
    internal init() { super.init() }
    
    public override var permissionType: PermissionType {
        .notification
    }
    
    public override var authorizationStatus: AuthorizationStatus {
        var notificationSettings: UNNotificationSettings?
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            self.notificationManager.getNotificationSettings { settings in
                notificationSettings = settings
                semaphore.signal()
            }
        }

        semaphore.wait()
        guard let settings = notificationSettings else{
            #if DEBUG
            print("Notification settings is nil while getting authorization status for JMNotificationPermissionManager")
            #endif
            return .notDetermined
        }
        switch settings.authorizationStatus{
        case .authorized:
            return .authorized
        case .denied:
            return .denied
        case .notDetermined:
            return .notDetermined
        case .provisional:
            return .limited
        default:
            return .denied
        }
    }
    var notificationManager = UNUserNotificationCenter.current()

    override public func requestPermission(completion: @escaping (Bool, Error?) -> Void) {
        notificationManager.requestAuthorization(options: [.badge,.alert,.sound]){ granted, error in
            completion(granted, error)
            
        }
       
        UIApplication.shared.registerForRemoteNotifications()
    }
}
