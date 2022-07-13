//
//  BannerAdsView.swift
//  Trivia Quiz
//
//  Created by Chithian on 12/7/22.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdsViewApp: View {
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BannerAdsView_Previews: PreviewProvider {
    static var previews: some View {
        BannerAdsViewApp()
    }
}
