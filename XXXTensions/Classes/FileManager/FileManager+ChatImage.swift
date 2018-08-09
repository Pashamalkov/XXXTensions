//
//  FileManager+ChatImage.swift
//  VTBMed
//
//  Created by manuely.aurora on 30.05.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import Foundation

import Foundation

extension FileManager {
    static func filesTemporaryDirectory() -> URL {
        return URL(fileURLWithPath: NSTemporaryDirectory())
    }
    
    static func saveTemporaryFile(_ data: Data, name: String) -> Error? {
        let directory = FileManager.filesTemporaryDirectory()
        let url = directory.appendingPathComponent(name)
        do {
            try data.write(to: url)
        } catch {
            return error
        }
        return nil
    }
    
    static func loadTemporaryFile(name: String) -> Data? {
        let directory = FileManager.filesTemporaryDirectory()
        let url = directory.appendingPathComponent(name)
        return try? Data(contentsOf: url)
    }
  
    static func deleteTemporaryFiles() -> Error? {
        let fileManager = FileManager.default
        let directory = FileManager.filesTemporaryDirectory()
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: directory.path)
            for filePath in filePaths {
                try fileManager.removeItem(at: directory.appendingPathComponent(filePath))
            }
        }
        catch let error {
            return error
        }
        return nil
    }
}
