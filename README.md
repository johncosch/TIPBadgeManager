# TIPBadgeManager

![alt text](https://github.com/johncosch/TIPBadgeManager/raw/master/Screenshots/TIPBadgeManagerImage.png "Screenshot")

 Use TIPBadgeManager with a single badge or easily manange all badges across your application. Cocoa Touch only has built in support for the application icon badge and UITabBarItems. With TIPBadgeManager you can easily add badges to any object that inherits from UIView!

## Getting Started

### Adding Badges
```
  var view : UIView = UIView()
  var badgeVal : Int = 1
  TIPBadgeManager.sharedInstance.addBadgeSuperview("someViewName", view: view)
  TIPBadgeManager.sharedInstance.setBadgeValue("someViewName", value: badgeVal)
```
First add the view you wish to append a badge to with addBadgeSuperview. The first paramater is just a string of your choosing which will be used to reference the badge object. The second parameter is the view itself. Although the second paramater is named "view" it also will accept a UITabBarItem. To actually get the view to show up you must set its value to a positive Int with setBadgeValue. The first parameter is the same referencing string as used in addBadgeSuperview and the second is the value to be set.

### Removing Badges
```
  TIPBadgeManager.sharedInstance.setBadgeValue("someViewName", value: 0)
```
Like the application icon badge, you remove badges from their superview by setting the value to 0.

### Removing All Badges
```
  TIPBadgeManager.sharedInstance.clearAllBadgeValues()
```
Remove all badges with the clearAllBadgeValues function.

## License
TIPBadgeManager is released under the MIT license. See LICENSE for details.

