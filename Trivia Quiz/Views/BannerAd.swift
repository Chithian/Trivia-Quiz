//
//  BannerAd.swift
//  Trivia Quiz
//
//  Created by Chithian on 12/7/22.
//

import Foundation
import SwiftUI
import GoogleMobileAds


struct Banner: UIViewRepresentable{
    func updateUIView(_ uiView: GADBannerView, context: Context) {
        
    }
    var unitID: String
    
    func makeCoordinator() -> Coordinator {
        //
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> GADBannerView {
        
        let adsView = GADBannerView(adSize: GADAdSizeBanner)
    
//        let adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 50))
        adsView.adUnitID = unitID
        adsView.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
        adsView.rootViewController = UIApplication.shared.getRootViewCoodinator()
        adsView.delegate = context.coordinator
        adsView.load(GADRequest())
        return adsView
    }
    
   
    class Coordinator: NSObject,GADBannerViewDelegate {
        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
          print("bannerViewDidReceiveAd")
        }

        func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
          print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        }

        func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
          print("bannerViewDidRecordImpression")
        }

        func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
          print("bannerViewWillPresentScreen")
        }

        func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
          print("bannerViewWillDIsmissScreen")
        }

        func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
          print("bannerViewDidDismissScreen")
        }
    }
}

//Extending Application to get root View

extension UIApplication {
    func getRootViewCoodinator() -> UIViewController {
        
        guard let screen = self.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
