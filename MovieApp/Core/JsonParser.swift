//
//  JsonParser.swift
//  MovieApp
//
//  Created by Kishan Soni on 03/07/25.
//

import Foundation

nonisolated class JsonParser {
    static func LoadJson<T:Decodable> (filename: String) throws -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            throw NSError(domain: "Invalid file name or extension: \(filename)", code: 0)
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw NSError(domain: "Couldn't load \(filename) from main bundle: /n \(error)", code: 0)
        }
        do {
            return try Self.DecodeData(type: T.self, data: data)
        } catch {
            throw NSError(domain: "Couldn't decode \(filename):/n\(error)", code: 0)
        }
    }

    static func DecodeData<T:Decodable> (type: T.Type, data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NSError(domain: "Couldn't parse data as \(T.self): /n \(error)", code: 0)
        }
    }
}
