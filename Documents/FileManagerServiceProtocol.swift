//
//  FileManagerServiceProtocol.swift
//  Documents
//
//  Created by Евгений Стафеев on 14.03.2023.
//

import Foundation
import UIKit


protocol FileManagerServiceProtocol {
    func contentsOfDirectory(currentDirectory: URL) -> [URL]
    func createDirectory(currentDirectory: URL, newDirectoryName: String)
    func createFile(currentDirectory: URL, newFile: URL, image: UIImage)
    func removeContent(currentDirectory: URL, toDelete: URL)
}
