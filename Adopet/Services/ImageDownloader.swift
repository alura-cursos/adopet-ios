//
//  ImageDownloader.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import UIKit

class ImageDownloader {
    func downloadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
