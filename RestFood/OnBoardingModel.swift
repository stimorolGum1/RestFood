//
//  OnBoardingModel.swift
//  RestFood
//
//  Created by Danil on 06.03.2024.
//

import Foundation
struct OnBoardingModel {
    var slides = [OnBoardingView]()
    mutating func createSlides() {
        let firstOnBoarding = OnBoardingView()
        firstOnBoarding.setPageLabelText(text: "Make your food order simply by scanning the QR code")
        let secondOnBoarding = OnBoardingView()
        secondOnBoarding.setPageLabelText(text: "Make purchase fast and easy")
        let thirdOnBoarding = OnBoardingView()
        thirdOnBoarding.setPageLabelText(text: "Enjoy your food")
        self.slides.append(contentsOf: [firstOnBoarding, secondOnBoarding, thirdOnBoarding])
    }
}
