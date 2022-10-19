//
//  ViewController.swift
//  mospos
//
//  Created by lsd on 27/10/19.
//  Modified by by researcx on 19/10/22.
//  Copyright © 2019 Leonardo Dabus. All rights reserved.
//  Copyright © 2022 researcx. All rights reserved.
//

import Cocoa

func doMousePosition(mouse: String){
    if (mouse != "0, 0"){
        print(mouse)
        exit(0);
    }
}

class ViewController: NSViewController {
    var mouse = "0, 0"
    lazy var window: NSWindow = self.view.window!
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var location: NSPoint { window.mouseLocationOutsideOfEventStream }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSApp.hide(nil)
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            let mouse = String(format: "%.1f, %.1f", self.mouseLocation.x, self.mouseLocation.y)
            doMousePosition(mouse: mouse)
            return $0
        }
        NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { _ in
           let mouse = String(format: "%.0f, %.0f", self.mouseLocation.x, self.mouseLocation.y)
           doMousePosition(mouse: mouse)
        }
    }
    func resizeFrame(newWidth: CGFloat, newHeight: CGFloat) {
        if let originalFrame = view.window?.frame {
            let newSize = CGSize(width: newWidth, height: newHeight)
            view.window?.setFrame(NSRect(origin: originalFrame.origin, size: newSize), display: true, animate: true)
        }
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        window.acceptsMouseMovedEvents = true
        view.window?.isOpaque = false
        view.window?.hasShadow = false
        view.window?.backgroundColor = NSColor.clear
        view.window?.titlebarAppearsTransparent = true
        self.title = "mospos"
        NSApp.hide(nil)
        resizeFrame(newWidth: 1, newHeight: 1)
    }
}
func applicationDidFinishLaunching(_ notification: Notification) {
    NSApp.hide(nil)
}
