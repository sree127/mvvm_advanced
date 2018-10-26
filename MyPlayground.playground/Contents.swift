//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let builder = Builder()
let tableViewController = builder.viewController

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = tableViewController
