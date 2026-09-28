Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F81F54705E;
	Mon, 28 Sep 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790563421; cv=fail; b=IuYm0SdcwmmXFyZeQwBlPGYtgVcNPOWgLwbZmaA7ZjojEVLKVx0Sng4guSCgOkuQV53U8KdOchK+1GBBW1uQpuXKHJXISKgtnZkzI3GmzvsZyixuAml1TnYCPUfcwicjxGvpWVTFhP2Fj1Nsa6kP6se7gt2FeocjjCZwisaiESM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790563421; c=relaxed/simple;
	bh=vKXsK0NQ7JvbdeLy037ecTYkmWGOFCXakHsyj/8Re+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h39/VUF0IAcakYvuA0Dz1r5wGfcXo0ifjoGH5aeM9t9BpfIUEjau6+sST+0HmqXa4hvFiztrMZJK7RK0ZKusNpUVcmvii51FfjBtSEGpiFAMQkLnhApl/KnYnz+weC5dhGLkRoN1J3HoSTWNtqaOgV7TljUgCSrnBsusmu2vABw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj9zidyJbRER0kTYcwqNiIqHUFzF0KcK13pV5O8xuhmh/sxcYuCFiq3xKpiMuO/2EkQZ3XOWJse80TbedugbNYJP7M31S09/vmi9lpiIE5JEtpYDiyxQ0K0uwdoL8UkhXG4HeQTUDPwtBJhFrYz6WpyioVTLVubG44CYPhWJizsFKjlhlHLu1FWh5N4G+irZpa22rbPufvYv28fdVZyHubmwfh7HNLBJ3vhNSBanG4yKBPeQcN0V1dYtFIgxIqU3WqXeniZoKyaY4NmCRyIh/v98dYF2orbjxan+yVDarjXPR05EGPX/rq8ky8BeVKBf1O9YS0zv71LEI6HGnfYfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKXsK0NQ7JvbdeLy037ecTYkmWGOFCXakHsyj/8Re+E=;
 b=STLiBtN1KEzwLwoR2Ev2hw0gZjTSjwR/VEUu5kwlKvuXy5UbMP6A5+fBuubLkpZ7ifL4F6QU8zGVn3OOVgmDJJ8fSgwjDJECz00Z9VNX0jJmrnhEHtKmJfl7SK5Z4NbajqUG9twfODk72C9r8WymoMCnbp0NIr4mekO/wjKf+cjkUG4xEuwbZhJMERKEWZFjNPu9qV8tODoR3TLP1ogi1nyzW2wiXjeQmRSx3pD3HBwBsPqI7uexSRv/EJT+AtK4fFdc7vmHcmRgL6L6BnjegDmFIiYeG6bmgjEYV3aAfR02G4mDU3bBHP/htCHjaMzWKZhcFQ6bt52CrE4kdofWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 01:08:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 01:08:26 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/6] peci: controller: Add StarFive JHB100 PECI driver
Thread-Topic: [PATCH v1 2/6] peci: controller: Add StarFive JHB100 PECI driver
Thread-Index: AQHdO6kQ7y3JU7Gi0Ei5+A+m0SbCDbbTVCAAgABgBlCADCjzAIADd00w
Date: Mon, 28 Sep 2026 01:08:25 +0000
Message-ID:
 <ZQ4PR01MB1202E2DF171E5166EFDC289FF28D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
		 <20260903133408.110847-3-changhuang.liang@starfivetech.com>
	 <284b44b5962d7043dddce038aca678c8c2f8051d.camel@intel.com>
	 <ZQ4PR01MB120247B14F68233454DEF4F3F2872@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <e618efb43668c41796547b352e6908d84c414d2a.camel@intel.com>
In-Reply-To: <e618efb43668c41796547b352e6908d84c414d2a.camel@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
x-ms-office365-filtering-correlation-id: 216f6d9f-7ea2-4bac-fb49-08df1cfcffe6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|3023799007|6133799003|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 AE2KwPn8HA4siJyN6HlS/gawSAuvstoV/4cDv/RitF0tZ91pWfnlNWY7MPR7bafaUjpF+uiHFuIBfnomKlqbQoAUIQIa9taPjkSGljI9i+7GmOjyW4sU3SdfxG7WnsePRxf0CIduXsY1kIATXsczfdMhioF9C83fMcp+rLd6nMic8coKU4coB4WbWQRFRa1HH6gAXdXBC5XE+blgAiY6UxQVtL6tH50VnTcUCsA5TCmO63uSvuAL5i31GIrfiYYqn5JY367sIinbtTFE0cMHxdBVGG2qEgZ3y19fyH8oMcYOX4+a14ah+saXijMrjm4mdwz/djJm+jCA9ychc6+FDhT4JEDWvhXae0M1KLcd4WB3RqVqgwjJ22VFGk6QOIsnH6zEXYhFeu20+jfqpmylftadJdOUpCkuIJ0vRHhvYGT4ixs89TnUICC4ZmNea7/upccD/ZN8RL4t9U0zn1r7dC20PGRZU3TN3HOdWYkpiHdumCvlgDlYdvuqj2K0aP3SKs2IYUm7Lh7zOXR+mHyFUYxwjJeZqmbBrnZcMUXinxhbJJUtE4jPgt7fRf2wtjo8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(3023799007)(6133799003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGlvaG5xUy9mblUrM3R6ZGNxZ1lKRkhnOVVxaVpqK01mdkJHTWVWejBSZHdM?=
 =?utf-8?B?K2F1bDYrNjBkSHh4VHdHZjlNcmxBaituTWw2UkZNa2FaZDJ1TkV0eGoxWnpa?=
 =?utf-8?B?SE8zYmFzSm1pRUNSM0h1clNOd0JPcjZWRUU1dW5JajlCV2M4Q1FTUmg4QjNy?=
 =?utf-8?B?WGprNHJvVVRZbWlRU0tKbUR3UzVPWjFIRU16bGI1R2NRZ1lwRWc1SnNLandq?=
 =?utf-8?B?N01Ma2lrZEVWZ3ArcnEydDYyK3NMNVhYanJSQUN1ZEtYY3BacGI3dHdNYVl1?=
 =?utf-8?B?SzZaZy9PN3B2T3ZCOEZQWGgvbldCRmVHM0pKSUw2VjhENzkzZ0JUUElDTmdn?=
 =?utf-8?B?eEQ4UzlMMWVCWE1FNzNNZkhmZDllQ0w5bnlwMWJVM2VRR1JubXpDcUp3aTVT?=
 =?utf-8?B?eWJvM0drbGhBSjdWcUlCR2RPcS9qc05NTE45SmlWSnQ3WGhoSEtPL0liSWlU?=
 =?utf-8?B?b2lvWHVxZ09qelI5Qk9XK0szQzBIbG1QT1NOZFp3MDR1cVdsejdqUVNXRWdM?=
 =?utf-8?B?aVMvem0xczlETkRvS0pKZklxMlF3ZEtwWEZrNEdaWWRUb2dFVmhoNm5lWXUz?=
 =?utf-8?B?d1FLcjR2d3I2OWxLcVM1R3ZkcDF5ZlF6RHBrNU9mT3ZUVkRwUDV6Z3M3Q2hs?=
 =?utf-8?B?dHFDQzZVcmxld2VZZjdxRTh4T05hSFc4NVVTRFZsNXBacEwwcGg3MjY1UGhq?=
 =?utf-8?B?WGhSTUd2YjBDOTk3cDlROWM2MXZqWDhrcW1KVzZ4ZzhvK2xGQVlraFRNRUV5?=
 =?utf-8?B?Mys0Tzk5dzNIYjRCNUFXV3FSWEVOcDgxYVV0YWFGWnpwQXdMUVEwSEtjSmkr?=
 =?utf-8?B?eWVLU3gvc2RWZWJ4WHo5VzZwNTNWR01jVXRLSUhKVnZZNG9SS3RKRXBYbGRs?=
 =?utf-8?B?bzc5MmxIWnkrSzM4R1BuSWQrcUoxVGVjLzN3RlMyOFljcjhQdElTbUtKSEFP?=
 =?utf-8?B?VTFIMWNQYjR6bjgxMVQ0cXM3ZzBJV04xSVNUb3dDSUU3VVlrSlJKWDZVdXR1?=
 =?utf-8?B?dFBaT01KdGI1dFJLVyswdlBMUHRESkdTcGtUYlh1TFc5OFNmN1JuWGNwYkh6?=
 =?utf-8?B?N3BoU2ovL08rTlh1MDdGZklpKzZUdGltdWltbzF6cUlscTNqczZiQ0R4cE1u?=
 =?utf-8?B?Mm9lU1M3OXZVV3JoNGZBdE9acXlWcW9NQmx1cGE1WlhiYnBDa1NEWm9xOVE4?=
 =?utf-8?B?bkZ4V3BQaUZOZnlLbS9YU1MxUjRrTDhEWEpJM1lkUmFwbSthY1lWWWlCU0tE?=
 =?utf-8?B?Z05Fc1BIWGxvZlUxb2R5SG1DZFJ4clhFUFpsRktVaFlHZTFHMFRuSVk3cFlS?=
 =?utf-8?B?dkJIN2FCVG5rMFlMbm1WZDVHQUY4YVJRT0I2YkMwTTh2bFU1SlgrSjBMMGpK?=
 =?utf-8?B?OFR4K01CU2tsQ3E0T2tPZ1FhT2dMblh4ZzF0SzJITndwUmlGNng0bmNaZzYw?=
 =?utf-8?B?djRUMDh1cmM5QklQdFQvMHdSYnFTUTdhbWtqVlNlVnA4ZjVTWThoellqb1lj?=
 =?utf-8?B?a05SREJla2pHU0ZFOHlXbDdNejViNXlrUjRvb2U4WXJZdDFHaUVGY09JOG9p?=
 =?utf-8?B?WEp0UnpvQm5FUTg4enV1d0RBVDI1TytPaG1GVU1qb2NTMHNzck5ad2dvWTd3?=
 =?utf-8?B?dlJ6aU5nOW84eTVsYzUxYzBXWUtFeGNWZGRvNVFjVEhvbjgzVmdwd2NxbVN0?=
 =?utf-8?B?YUY3ZkZ1L1d3R2paUkRzem9SSTV5TkxhNG9LSkJEa0dvc29lc1N2ZGpxS3I5?=
 =?utf-8?B?QnMwS3VLbDZXVHY5U014L3dHY1Y4UzZZUktmeGd4NVl6dHc1Q0FaRHlpa1lu?=
 =?utf-8?B?d2gvQmZvN2QyNGg0ZHhNUkx2ZitHMVRnRnl4NURNR2wvOEpVcC84cWJoNml2?=
 =?utf-8?B?RnNlR1ViUCsrajRBcEpDZm5DQ2V5NitaM093M3J1OHhRYjhxT085NTdTYzB0?=
 =?utf-8?B?bTM2aWpYQWwzVlJZSXI0TXE1UnNybXBjK1ZjeFZkcEVmWnFwajIxeE1rTmw4?=
 =?utf-8?B?cERuVG5OVDVvN0ltL01SVzFlTVlFcDA0VkNhbE1XUExqYThaRmxzTFB0dmoy?=
 =?utf-8?B?aTRXajVlN1VxYVAwdGlHM2x5anNCeUV6MzVlS05ZcWpONU5pZ05Zdkw2ZDBt?=
 =?utf-8?B?SlpBRHliUkJmcE9JN09YKzNlaXBqOGZadUFPV0M3RjMxRTlkaGtjcWpLMCtz?=
 =?utf-8?B?VktPSkRyZCt3dmI1cWkvS2VuS0ltOUZJdGVaNGVpaTIrN1RYOEhqT2tnRkhu?=
 =?utf-8?B?S0U4YXRBdndIY0FkZlRWV0drektuc0Y0SDBwSmZJRFZYS2xEcDJnZ1U1SFFB?=
 =?utf-8?B?QytsQ0QrTVpEamFkUHUxQk9hdUdSK21lc1RyUzhkaXR4RzJHM2NqRUp1ZWFj?=
 =?utf-8?Q?jYOW/aJpu6Y8Q7RU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 216f6d9f-7ea2-4bac-fb49-08df1cfcffe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 01:08:26.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mNcGtinEXMtXXbgQuVVkbkYY1HL6zi795f7JLIYfL1sTVIi7190UtLCkCd8pVq3XKCVWm/fnyDkwPc0fy8lMGkqADHcYBzWCHo0819JOfqcrR5mEnhr3q0N/hIQQe2Ib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

SGksIEl3b25hDQoNCj4gT24gRnJpLCAyMDI2LTA5LTE4IGF0IDAyOjMwICswMDAwLCBDaGFuZ2h1
YW5nIExpYW5nIHdyb3RlOg0KPiA+IEhpLCBJd29uYQ0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUg
cmV2aWV3Lg0KPiA+DQo+ID4gPiBPbiBUaHUsIDIwMjYtMDktMDMgYXQgMDY6MzQgLTA3MDAsIENo
YW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiA+IEFkZCBQRUNJIGNvbnRyb2xsZXIgZHJpdmVy
IGZvciBTdGFyRml2ZSBKSEIxMDAgU29DLiBUaGUgZHJpdmVyDQo+ID4gPiA+IHN1cHBvcnRzIFBF
Q0kgcHJvdG9jb2wgY29tbXVuaWNhdGlvbiBmb3IgQ1BVIHRoZXJtYWwgbWFuYWdlbWVudC4NCj4g
PiA+ID4NCj4gPiA+ID4gRm9yIHRoaXMgY29udHJvbGxlciwgdGhlIHNwZWNpYWwgY2xvY2sgYW5k
IHJlc2V0IG9wZXJhdGlvbiBzZXF1ZW5jZSBpczoNCj4gPiA+ID4gwqAgcHJvYmU6IGNsa19wcmVw
YXJlX2VuYWJsZSgpIHRoZW4gcmVzZXRfY29udHJvbF9kZWFzc2VydCgpDQo+ID4gPiA+IMKgIHJl
bW92ZTogY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgdGhlbiByZXNldF9jb250cm9sX2Fzc2VydCgp
DQo+ID4gPiA+DQo+ID4gPiA+IENvLWRldmVsb3BlZC1ieTogTWFzb24gSHVvIDxtYXNvbi5odW9A
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFzb24gSHVvIDxtYXNv
bi5odW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFu
ZyBMaWFuZw0KPiA+ID4gPiA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KDQpb
Li4uXQ0KDQo+ID4gPiA+ICsJcGVjaV9oZHIgPQ0KPiBGSUVMRF9QUkVQKFNUQVJGSVZFX1BFQ0lf
SERSX1RBUkdFVF9BRERSX01BU0ssDQo+ID4gPiBhZGRyKSB8DQo+ID4gPiA+ICsJCcKgwqAgRklF
TERfUFJFUChTVEFSRklWRV9QRUNJX0hEUl9XUl9MRU5fTUFTSywNCj4gcmVxLT50eC5sZW4pDQo+
ID4gPiA+DQo+ID4gPiA+ICsJCcKgwqAgRklFTERfUFJFUChTVEFSRklWRV9QRUNJX0hEUl9SRF9M
RU5fTUFTSywgcmVxLQ0KPiA+ID4gPiA+cngubGVuKTsNCj4gPiA+ID4gKwlyZWdtYXBfd3JpdGUo
cHJpdi0+cmVnbWFwLCBTVEFSRklWRV9QRUNJX0hEUiwgcGVjaV9oZHIpOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJaWYgKHJlcS0+dHgubGVuKSB7DQo+ID4gPiA+ICsJCS8qDQo+ID4gPiA+ICsJCSAq
IHJlcS0+dHguYnVmWzBdIGFsd2F5cyBzdG9yZSB0aGUgY29tbWFuZCBjb2RlLg0KPiA+ID4gPiAr
CQkgKiBVc2UgY29tbWFuZCBjb2RlIHNldCBkaWZmZXJlbnQgY29uZmlndXJhdGlvbi4NCj4gPiA+
ID4gKwkJICovDQo+ID4gPiA+ICsJCXU4IGNtZF9uaWJibGUgPSBGSUVMRF9HRVQoR0VOTUFTSygz
LCAwKSwgcmVxLT50eC5idWZbMF0pOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCWlmIChjbWRfbmli
YmxlID09IFNUQVJGSVZFX1BFQ0lfQ01EX1dSSVRFX05JQkJMRSkgew0KPiA+ID4gPiArCQkJLyoN
Cj4gPiA+ID4gKwkJCSAqIFRoaXMgaW5kaWNhdGVzIGN1cnJlbnQgY29tbWFuZCBjb2RlIGlzIHdy
aXRlLg0KPiA+ID4gPiArCQkJICogT25seSB3cml0ZSBjb21tYW5kIHNob3VsZCBlbmFibGUgaGFz
X2F3ZmNzLg0KPiA+ID4gPiArCQkJICovDQo+ID4gPg0KPiA+ID4gVGVjaG5pY2FsbHksIHdlIGRv
bid0IGhhdmUgc3VwcG9ydCBmb3IgYW55IHdyaXRlIGNvbW1hbmRzIGF0IHRoaXMNCj4gPiA+IHBv
aW50IGluIHRoZSB0cmVlLiBBcmUgeW91IHBsYW5uaW5nIHRvIGFkZCB0aGUgdXNhZ2UgZm9yIHdy
aXRlDQo+ID4gPiBjb21tYW5kcyBpbiB0aGUgbmVhciBmdXR1cmU/DQo+ID4NCj4gPiBJJ20gbm90
IHF1aXRlIHN1cmUgZWl0aGVyLiBJIHByZXZpb3VzbHkgYWRhcHRlZCBsaWJwZWNpIGJhc2VkIG9u
IHRoZQ0KPiA+IGN1cnJlbnQgdHJlZSwgYW5kIHRlc3RlZCB0aGUgd3JpdGUgY29tbWFuZHMuIFNv
IEkga2VwdCB0aGUgd3JpdGUNCj4gPiBjb21tYW5kcyBicmFuY2ggaGVyZS4gSSdtIG5vdCBxdWl0
ZSBzdXJlIHdoeSBsaWJwZWNpIHdhc24ndCBhZGFwdGVkDQo+ID4gaGVyZeKAlGlzIGl0IGJlY2F1
c2UgdGhlcmUgd2Fzbid0IHRpbWUgdG8gcHVzaCB0aGlzIHBhcnQgZm9yd2FyZD8NCj4gDQo+IE5v
LCB3ZSBkb24ndCB3YW50IHRvIGFkZCBhIHVBUEkgdGhhdCBleHBvc2VzIHJhdyBQRUNJIGNvbW1h
bmQgYWNjZXNzLg0KPiBJZiB3ZSBuZWVkIHNvbWUgZnVuY3Rpb25hbGl0eSB0aGF0IGNvdWxkIGJl
IGltcGxlbWVudGVkIHVzaW5nIFBFQ0ksIHdlDQo+IHNob3VsZCBjb25zaWRlciBhZGRpbmcgYSBk
ZWRpY2F0ZWQgZHJpdmVyIGZvciB0aGF0IGFuZCB0aGVuIGRlZmluZSB1QVBJIGZvcg0KPiB0aGF0
IGNhc2UgKHBsZWFzZSBzZWUgaHdtb24gZHJpdmVycykuDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxk
IGJlIGJldHRlciB0byBza2lwIHRoaXMgcGFydCBmb3Igbm93LCBhbmQgcmVpbnRyb2R1Y2UgaXQg
aW4gYWxsDQo+IGRyaXZlcnMgYWNyb3NzIHRyZWUsIHdoZW4gaXQgaXMgbmVlZGVkIGZvciB3cml0
ZSBzdXBwb3J0Lg0KDQpPa2F5LCBJJ2xsIHJlbW92ZSB0aGUgd3JpdGUgc3VwcG9ydCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=
