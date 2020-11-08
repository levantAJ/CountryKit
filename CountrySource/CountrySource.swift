//
//  CountrySource.swift
//  CountrySource
//
//  Created by Tai Le on 10/18/20.
//

import Foundation

open class CountrySource {
    public init() {}
}

public extension CountrySource {
    func currentCountry(completion: ((Result<Country, Error>) -> Void)?) {
        allCountries { (result) in
            switch result {
            case .success(let countries):
                let regionCode = Locale.current.regionCode
                if let country = countries.first(where: { $0.code == regionCode }) {
                    completion?(.success(country))
                } else {
                    completion?(.failure(CountrySourceError.notFound))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }

    func allCountries(completion: ((Result<[Country], Error>) -> Void)?) {
        DispatchQueue.global().async {
            do {
                let bundle = Bundle(for: CountrySource.self)
                guard let path = bundle.path(forResource: "country-phone-number-codes", ofType: "json") else { return }
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion?(.success(countries))
                }
            } catch {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
            }
        }
    }
}

public enum CountrySourceError: Int, Error {
    case notFound = 1000
}

extension CountrySourceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound:
            return NSLocalizedString("Not found", comment: "")
        }
    }
}

public struct Country: Codable, Equatable {
    public var name: String
    public var dialCode: String
    public var code: String
}
