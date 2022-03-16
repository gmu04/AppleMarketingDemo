// AppleMarkettingToolError.swift by Gokhan Mutlu on 16.03.2022

import Foundation

/**
 Http errors
 AMT = App Marketting Tool
 */
enum AMTError: Error{
	case anyError(Error)
	case jsonParsing(String)
	case statusCodeNot200(String)
}
