<span align="center">
  <br>
<img src="https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96_2x.png" width="150">
  <br>
</span>

# PermissionsSwiftUI: A SwiftUI package to handle permissions

<img src="https://img.shields.io/github/workflow/status/jevonmao/PermissionsSwiftUI/Swift?label=CI%20Build"> <img src="https://img.shields.io/github/contributors/jevonmao/PermissionsSwiftUI"> <img src="https://img.shields.io/badge/License-MIT-blue.svg"> <img src="https://img.shields.io/github/issues/jevonmao/PermissionsSwiftUI"> <img src="https://img.shields.io/github/commit-activity/w/jevonmao/PermissionsSwiftUI?color=yellowgreen&logoColor=yellowgreen"> [![Codacy Badge](https://app.codacy.com/project/badge/Grade/6fe1a84c136b4a99823e7d71a8d08625)](https://www.codacy.com/gh/jevonmao/PermissionsSwiftUI/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=jevonmao/PermissionsSwiftUI&amp;utm_campaign=Badge_Grade)

`PermissionsSwiftUI` displays and handles permissions in SwiftUI.
The UI/UX is highly customizable and resembles an **Apple style**. If you like the project, don't forget to `put star ★` and follow me on GitHub. <br />
<img src="https://github.com/jevonmao/PermissionsSwiftUI/blob/main/Resources/Screenshot1.png" height="500"/>
&emsp; &emsp;
<img src="https://github.com/jevonmao/PermissionsSwiftUI/blob/main/Resources/Screenshot-dark.png" height="500"/> <br />
<p align="center"> PermissionsSwiftUI looks equally gorgeous on both ☀️light and 🌑dark mode. </p>

## Navigation
-  [Quickstart](#quickstart) 
-  [Usage](#usage)
-  [License](#license)

## Quickstart
To use PermissionsSwiftUI, simply add the `JMPermission` modifier to any view. <br />
Pass in a `Binding<Bool>` to show the modal view, and add whatever permissions you want to show.
```Swift
   struct ContentView: View {
       @State var showModal = false
       
       var body: some View {
           Button(action: {
               showModal=true
           }, label: {
               Text("Ask user for permissions")
           })
           .JMPermissions(showModal: $showModal, for: [.locationAlways, .photo, .microphone])
       }
   }
 ```
## Usage
### Customize permission texts
⚠️ This feature is still very work in progress. It is only available for the camera and location

To customize permission texts, use the modifier with syntax `permission+"permissionName"`. Ex. `permissionCamera` is for camera.

You can change title and description:
```Swift
.JMPermissions(showModal: $showModal, for: [.camera])
.permissionCamera(title: "Camcorder", description: "App needs to record videos")
```
<div style="text-align:center">
<img src="https://github.com/jevonmao/PermissionsSwiftUI/blob/main/Resources/Screenshot-camera.png" height="100">
</div>

Or only change 1 of title and description.
```Swift
.permissionCamera(title: "Camcorder")
```
## License
PermissionsSwiftUI is created by Jingwen (Jevon) Mao and licensed under the [MIT License](https://jingwen-mao.mit-license.org)
