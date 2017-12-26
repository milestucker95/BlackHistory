//
//  ViewController.swift
//  TimelinesSwift
//
//  Created by Twitter  on 5/26/15.
//  Copyright (c) 2015 Twitter. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = TWTRUserTimelineDataSource(screenName: "twitterdev", apiClient: TWTRAPIClient())
    }

    

    
}
