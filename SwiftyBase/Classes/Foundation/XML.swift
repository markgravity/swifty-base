//
//  XML.swift
//  Moco360
//
//  Created by Mark G on 7/28/20.
//  Copyright © 2020 Mobiclix. All rights reserved.
//

import UIKit
import SwiftRichString
import RxSwift
import RxCocoa

// MARK: UILabel
public extension UILabel {
    var xmlText: String? {
        set {
            let normal = Style { [unowned self] in
                $0.font = self.font
                $0.color = self.textColor
                $0.alignment = self.textAlignment
            }
            
            let group = StyleXML(base: normal, [:])
            group.xmlAttributesResolver = BaseXmlAttributesResolver()
            attributedText = newValue?.set(style: group)
        }
        
        get {
            assertionFailure()
            return nil
        }
    }
}


public extension Reactive where Base: UILabel {
    
    /// Bindable sink for `xmlText` property.
    var xmlText: Binder<String?> {
        return Binder(self.base) { label, text in
            label.xmlText = text
        }
    }
}

// MARK: - UITextView
public extension UITextView {
    var style: Style {
        Style { [unowned self] in
            $0.font = self.font
            $0.color = self.textColor
            $0.alignment = self.textAlignment
        }
    }
    
    var xmlText: String? {
        set {
            let normal = style
            
            let group = StyleXML(base: normal, [:])
            group.xmlAttributesResolver = BaseXmlAttributesResolver()
            attributedText = newValue?.set(style: group)
        }
        
        get {
            assertionFailure()
            return nil
        }
    }
}

// MARK: - UIButton
public extension UIButton {
    var style: Style {
        Style { [unowned self] in
            $0.font = self.titleLabel?.font
            $0.alignment = self.titleLabel?.textAlignment ?? .center
        }
    }
    
    func setXMLTitle(xml: String, for state: UIControl.State) {
        let normal = style
        let textColor = titleColor(for: state)
        normal.color = textColor
        
        let group = StyleXML(base: normal, [:])
        group.xmlAttributesResolver = BaseXmlAttributesResolver()
        
        let attributedTitle = xml.set(style: group)
        setAttributedTitle(attributedTitle, for: state)
    }
    
}


// MARK: - Resolver
open class BaseXmlAttributesResolver: StandardXMLAttributesResolver {
    
    open func fontForBold(with point: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: point)
    }
    
    override open func styleForUnknownXMLTag(_ tag: String, to attributedString: inout AttributedString, attributes: [String : String]?, fromStyle: StyleXML) {
        
        switch tag {
            
            case "color":
                // Hex
                guard let hex = attributes?["hex"] else { return }
                
                let style = Style {
                    $0.color = UIColor(hexString: hex)
                }
                attributedString.add(style: style)
            
        case "b":
            guard let font = attributedString.attribute(
                .font,
                at: 0,
                longestEffectiveRange: nil,
                in: NSRange(location: 0, length: attributedString.length)
                ) as? UIFont else { return }
            
            let style = Style { [unowned self] in
                $0.font = self.fontForBold(with: font.pointSize)
            }
            attributedString.add(style: style)

        case "u":
            
            let style = Style {
                $0.underline = (.styleSingle, nil)
            }
            attributedString.add(style: style)
            
        case "strike":
            
            let style = Style {
                $0.strikethrough = (.styleSingle, nil)
            }
            attributedString.add(style: style)
            
        default:
            super.styleForUnknownXMLTag(
                tag,
                to: &attributedString,
                attributes: attributes,
                fromStyle: fromStyle
            )
        }
    }
}
