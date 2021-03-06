//
//  AccessLog.swift
//
//  AccessToken.swift
//  Perfect-OAuth2-Server
//
//  Created by Jonathan Guthrie on 2017-02-06.
//
//

import StORM
import PostgresStORM

public class AccessLog: PostgresStORM {
	public var accesstoken		= ""
	public var refreshtoken		= ""
	public var userid			= ""


	override public func to(_ this: StORMRow) {
		accesstoken     = this.data["accesstoken"] as? String	?? ""
		refreshtoken	= this.data["refreshtoken"] as? String	?? ""
		userid			= this.data["userid"] as? String		?? ""
	}

	func rows() -> [AccessLog] {
		var rows = [AccessLog]()
		for i in 0..<self.results.rows.count {
			let row = AccessLog()
			row.to(self.results.rows[i])
			rows.append(row)
		}
		return rows
	}
}
