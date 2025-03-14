//
//  ProgressiveJPEGDemo.swift
//  Kingfisher
//
//  Created by onevcat on 2025/03/03.
//
//  Copyright (c) 2025 Wei Wang <onevcat@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Kingfisher
import SwiftUI

@available(iOS 14.0, *)
struct ProgressiveJPEGDemo: View {
    
    @State private var totalSize: Int64?
    @State private var receivedSize: Int64?
    
    var body: some View {
        KFImage(ImageLoader.progressiveImageURL)
            .progressiveJPEG()
            .onProgress({ receivedSize, totalSize in
                self.totalSize = totalSize
                self.receivedSize = receivedSize
            })
            .resizable()
            .frame(width: 300, height: 300)
        if let totalSize = totalSize, let receivedSize = receivedSize {
            Text("Received: \(receivedSize) / \(totalSize)")
        }
    }
}

@available(iOS 14.0, *)
struct ProgressiveJPEGDemo_Previews : PreviewProvider {
    static var previews: some View {
        ProgressiveJPEGDemo()
    }
}
