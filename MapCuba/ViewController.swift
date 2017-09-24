//
//  ViewController.swift
//  MapCuba
//
//  Created by Randy Hector Bartumeu Huergo on 9/24/17.
//  Copyright © 2017 Randy Hector Bartumeu Huergo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var theViewC: MaplyBaseViewController?
    private var globeViewC: WhirlyGlobeViewController?
    private var mapViewC: MaplyViewController?
    
    private let doGlobe = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapViewC = MaplyViewController(mapType: .typeFlat)
        theViewC = mapViewC
        
        self.view.addSubview(theViewC!.view)
        theViewC!.view.frame = self.view.bounds
        addChildViewController(theViewC!)
        
        theViewC!.clearColor = (globeViewC != nil) ? UIColor.black : UIColor.gray
        theViewC!.frameInterval = 2
        
        if let tileSource = MaplyMBTileSource(mbTiles: "cuba"),
            let layer = MaplyQuadImageTilesLayer(tileSource: tileSource) {
            layer.handleEdges = (globeViewC != nil)
            layer.coverPoles = (globeViewC != nil)
            layer.requireElev = false
            layer.waitLoad = false
            layer.drawPriority = 0
            layer.singleLevelLoading = false
            theViewC!.add(layer)
        }
        
        if let mapViewC = mapViewC {
            mapViewC.height = 1.0
            mapViewC.animate(toPosition: MaplyCoordinateMakeWithDegrees(23.0469, -82.2906), time: 1.0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

