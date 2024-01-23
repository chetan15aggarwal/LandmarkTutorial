//
// WatchLandmarks Watch App
// Created by Chetan Aggarwal.


import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: LandmarkModel?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    override func didReceive(_ notification: UNNotification) {
//        let modelData = ModelData()
        let notificationData =
            notification.request.content.userInfo as? [String: Any]


        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]


        title = alert?["title"] as? String
        message = alert?["body"] as? String


        if let index = notificationData?[landmarkIndexKey] as? Int {
            //TODO: transfer value back to the view model
//            landmark = modelData.landmarks[index]
        }
    }
}
