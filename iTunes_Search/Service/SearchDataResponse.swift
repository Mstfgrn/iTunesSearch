//
//  SearchDataResponse.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 29.10.2021.
//
import Foundation

// MARK: - Welcome
class SearchDataResponse: Codable {
    var resultCount: Int?
    var results: [Results]?

    init(resultCount: Int?, results: [Results]?) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
typealias Resultss = [Results]
typealias searchDataResponses = [SearchDataResponse]
struct Results: Codable {
    let trackID, artistID, collectionID: Int?
    let artistName, collectionName, trackName: String?
    let artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let formattedPrice: String?
    let price: Int?
    let releaseDate: String
    let currency, resultDescription, shortDescription, longDescription: String?

    enum CodingKeys: String, CodingKey {
        case trackID = "trackId"
        case artistID = "artistId"
        case collectionID = "collectionId"
        case artistName, collectionName, trackName, artworkUrl100, collectionPrice, trackPrice, formattedPrice, price, releaseDate, currency
        case resultDescription = "description"
        case shortDescription, longDescription
    }

    public init(trackID: Int?, artistID: Int?, collectionID: Int?, artistName: String?, collectionName: String?, trackName: String?, artworkUrl100: String?, collectionPrice: Double?, trackPrice: Double?, formattedPrice: String?, price: Int?, releaseDate: String, currency: String?, resultDescription: String?, shortDescription: String?, longDescription: String?) {
        self.trackID = trackID
        self.artistID = artistID
        self.collectionID = collectionID
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.formattedPrice = formattedPrice
        self.price = price
        self.releaseDate = releaseDate
        self.currency = currency
        self.resultDescription = resultDescription
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
}
