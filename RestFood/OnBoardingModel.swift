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
        firstOnBoarding.setPageLabelText(text: "Я бы хотел щас поесть к вам придти")
        let secondOnBoarding = OnBoardingView()
        secondOnBoarding.setPageLabelText(text: "А с чем вам приготовить?")
        let thirdOnBoarding = OnBoardingView()
        thirdOnBoarding.setPageLabelText(text: "Рыбу")
        self.slides.append(contentsOf: [firstOnBoarding, secondOnBoarding, thirdOnBoarding])
    }
}
