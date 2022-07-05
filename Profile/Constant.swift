//
//  Constant.swift
//  Profile
//
//  Created by Eureka on 2022/7/4.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "Eureka"
    let title    = "Web Developer"
    let location = "Shanghai"
    let bio      = "The life form of the earth, which may appear at any time, is full of flashing skills, FE at day, Any at night."
    let skills   = ["TypeScript", "React", "Swift", "Git"]
    let experiences: [Experience] = [("FE Development Engineer",
                                      "QingFlow",
                                      "April 2022",
                                      "Present"),
                                     ("FE Development Engineer",
                                      "Trip.com",
                                      "April 2021",
                                      "September 2021"),
                                     ("College Student",
                                      "NTU",
                                      "September 2018",
                                      "March 2021")]
    let socialMedia: [(name: String, url: String)] = [
        ("GitHub","https://github.com/echoeureka"),
        ("Site","https://echoeureka.vercel.app/"),
        ("Twitter","https://twitter.com/echo_eureka")
    ]
}
