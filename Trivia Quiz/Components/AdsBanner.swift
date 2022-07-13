//
//  AdsBanner.swift
//  Trivia Quiz
//
//  Created by Chithian on 12/7/22.
//

import SwiftUI
import GoogleMobileAds
import UIKit

final private class BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-1981542238186326/9081895824"

        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct AdsBanner: View {
    var body: some View{
            HStack{
                Spacer()
                BannerVC().frame(width: 320, height: 50, alignment: .center)
                Spacer()
            }
        }
}

struct AdsBanner_Previews: PreviewProvider {
    static var previews: some View {
        AdsBanner()
    }
}
