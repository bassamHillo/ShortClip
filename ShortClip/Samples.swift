//
//  Samples.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import Foundation

struct Samples {
    struct Dashboard {

        static let trendings: [TrendingModel] = [
            TrendingModel(
                image: .popular,
                tags: ["Titles goes here", "Language", "Director"]
            ),
            TrendingModel(
                image: .popular2,
                tags: ["Titles goes here", "Language", "Director"]
            ),
            TrendingModel(
                image: .popular3,
                tags: ["Titles goes here", "Language", "Director"]
            )
        ]

        static let continueWatchSectionItems: [ContinueWatchModel] = [
            .init(
                title: "2/4 Episodes",
                subTitle: "Hollywood Star's Fake Girlfriend",
                image: .posterContinue,
                progress: 2/4
            ),
            .init(
                title: "1/4 Episodes",
                subTitle: "My Sister Stole My Man ",
                image: .posterContinue1,
                progress: 1/4
            ),
            .init(
                title: "3/4 Episodes",
                subTitle: "One Night Stand",
                image: .posterContinue2,
                progress: 3/4
            ),
            .init(
                title: "Movie",
                subTitle: "Maleficent 2",
                image: .posterContinue3,
                progress: 0.3
            ),
        ]

        static let mostPopularSectionItems: [MostPopularModel] = [
            .init(
                cover: .most1,
                title: "Lovely Runner",
                tags: ["Romantic", "Swoonworthy"],
                rate: "5",
                episodesCount: 12
            ),
            .init(
                cover: .most2,
                title: "True Beauty",
                tags: ["Korean", "Romantic", "Swoonworthy"],
                rate: "5",
                episodesCount: 12
            ),
            .init(
                cover: .most3,
                title: "Artificial City",
                tags: ["Korean", "Romantic", "Swoonworthy"],
                rate: "5",
                episodesCount: 12
            ),
            .init(
                cover: .most4,
                title: "Maleficent 2",
                tags: ["Movie", "Swoonworthy"],
                rate: "4",
                episodesCount: 12
            ),
            .init(
                cover: .most5,
                title: "Midnight Runners",
                tags: ["Witty", "Suspenseful", "Exciting"],
                rate: "4.8",
                episodesCount: 12
            ),
        ]

        static let sections: [NewSeriesSectionModel] = [
            .init(
                fromString: "China",
                items: [
                    NewSeriesModel(
                        cover: .china1,
                        episodesCount: 20
                    ),
                    NewSeriesModel(
                        cover: .china2,
                        episodesCount: 16
                    ),
                    NewSeriesModel(
                        cover: .china3,
                        episodesCount: 40
                    ),
                    NewSeriesModel(
                        cover: .china4,
                        episodesCount: 16
                    ),
                ]
            ),
            .init(
                fromString: "Korea",
                items: [
                    NewSeriesModel(
                        cover: .korea1,
                        episodesCount: 16
                    ),
                    NewSeriesModel(
                        cover: .korea2,
                        episodesCount: 16
                    ),
                    NewSeriesModel(
                        cover: .korea3,
                        episodesCount: 16
                    ),
                    NewSeriesModel(
                        cover: .korea4,
                        episodesCount: 16
                    ),
                ]
            )
        ]
    }
}
