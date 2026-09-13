Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2131.outbound.protection.partner.outlook.cn [139.219.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0F361DDC;
	Sun, 13 Sep 2026 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789283478; cv=fail; b=Z21k/fvv4PulFNXDFI7a5oyi7SsLD/D+4DoGTCxqwobNOh6Glc/IFIHNZqy1z5EdP1PHKaE7M/D2cMx8JbTePp8kIV2f2tVU2TbgsR9OOIytqjVGyT/yf08C06Bv32u7OYhCe9vbyYJ1TD1qoBV2U5ytzheCEl5cL8DVCXaUzgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789283478; c=relaxed/simple;
	bh=ZYeGvNDyBFWHz0HKP+BTOA2zhmp+WxQqqJC0b+BIr4A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QGk98lS/xIdZiKXCr/QD570RK3TxBEqRloryI0WM4JH1hVKEi6vBxuShHnxveWpv2Kl3Qs2rVik6n0I2LOK5oZxs49RjaHxmcmvItmgYSIxsAbgITw+TQ0ZB5YRXxcL9u7nXDjELFzgRorakHKCIspB20gdQZfVpGUCrqFxSsi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB18QA8KUY8Tw/0tzu9Mk9f+l2Es06TZ0re2d2dLGp8L9fLTPqiLWlcOnqtYPHOkz/RXxV+ZAIL74gESBddWKaneCPhzyJhEjqbXt0imXiAK87UrLw0KRpf5fiBdM1EdbjtT5gGc1856aYAa9hDijqCDcgL7p/zR2uKVr4O42r8gBsfZfhuQrfE+adg9VjliXTwcfLHtHk9RYlamk38e4k6GBrM2Xa2NvIEJK4sIllBhzGTlCFELLsuzz+/V7+skq+vTZwgjMmuT7ErreG1a5s0KAwr6UJ50QVDXIFsreNDGA+k1J1aFZY2j/gvzMJLwIze9PxzKZMDqUYbC6VVDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYeGvNDyBFWHz0HKP+BTOA2zhmp+WxQqqJC0b+BIr4A=;
 b=N6ZrbeL0a5ytW8s/+vM2tOi9qYo3p1Dk1RKEwk7R8jtpaodCTKhbXv+GOFE+E/m5QePV8DXEBAGtqyo5vxhI480IZfEkdEk5mmemDExS3UxHxPk12D5ihLK37G8+6OFjEW5gjfBRgw1ejPCF5N7nJy/zpmbAvJ/SOSM2at8Z6ivEFkGF4N4UIYOAvvY/5G6lAPv3uRTGs9kQ8RAKwJwy56D83PMBHO6APoGzQrr365mr8s0S+N4smd/0chxg3Eyny0XJuAP8pQ5JE76aBTCF/qq+dg+ApS1H9rlKU3RmqUpufmDni6kZ2scx0AjcHrb4eTVRK+W3qYi9LgwqXBb8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1251.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sun, 13 Sep
 2026 03:36:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0406.007; Sun, 13 Sep 2026 03:36:27 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdO6kWobiqEWs+306uaml9udyWb7bLG0uAgADPftA=
Date: Sun, 13 Sep 2026 03:36:27 +0000
Message-ID:
 <ZQ4PR01MB120212E0FFA32C9501736A94F2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-6-changhuang.liang@starfivetech.com>
 <b47789a3-731e-44c4-a954-e9352529cdf5@roeck-us.net>
In-Reply-To: <b47789a3-731e-44c4-a954-e9352529cdf5@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1251:EE_
x-ms-office365-filtering-correlation-id: 4a9c9f74-d799-45cc-290d-08df1148315a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|6133799003|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 fH9g9GxYVbGtc01sy4TxLeqYhKl6in1qaMsZJr54Bty5szojwS/gkMSvGKxzuZ/WJRgyHUE/11Y3BUWwaPOTaBd5ME/Atu+gSh8B/IiOgXkTebS78en/XNmGex3gt5+zVc0ln6q/c8s7tSjaHF65HruCFbgM6JiLbG1F2UDylORAuzYphy3bJIBIUDAxYWg0OBX2Ywec6dpMxKRo8MHIc9ctFbeoM1DvtMQJOGikR2GQdzMb4Vt8TDXFtLieStwJxiO+51+xPcZK/09qeioam1XBjBQSzhky4I/9IA1t2o0iS/TiJu4IMtzq8cT4EmULmi89R6/PIi5bl1L24XcKSUh9Uf8H6PDUQnCbE3Rft5EAw2yoJEMNCFKtZtvjnYykrodNK8uuXUtODlmAU13Mu8h5ibhZoGYixmHP7oniBJYVWGDgJzSz2ex/Vy3NJ0P3QIRTbkFl5QpmF10Cek/P07HM0UdfK6THOVzl3MscPjS3P7KixfgbOeZBv4T/5Zam9ctWd39Y6nhMcdwEYwTbE5GZsxDu7ZvPr5Lsm6CPY06DNB/1Oo7UdGVyKdfQiy1D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWNOVlA4VmZlZVlFSlVhdE1UQWlLMi9DTDBWcytrSnlMTUtCZiswVDU5UzNI?=
 =?utf-8?B?TWZKYlRTUW1qWTRVTW5YOERQMnRNalRwNTFXdlhBTk9PbU0vMmtXNmRrNHpY?=
 =?utf-8?B?MHdtZUc1NmU0QjdCcG0yb2FuZmdCOGFsamkzVlBRVGVNbXQvZ3A1a2xGNCtD?=
 =?utf-8?B?bjBZVFBkdlcrYUJlQlZXYTBjVG1PdE9WbTJrU211MVVyZmoycDNGM3JWRUcr?=
 =?utf-8?B?YktBc1RkL1FDQXVaamhzMGVqeU0zRG9GdUZ4SDZuRkd1TXlwcjFsd2ZUeDZT?=
 =?utf-8?B?Zm95L3JJakZ3VkdSTmljU0tmN25XSjEvWmlVS2dPS0pqL1p1WjlOUVo4VmN1?=
 =?utf-8?B?MDY4Z0VpZVpxUGNkWGFRUE5lNG5pY3RzOTIvRHhZRlpUUzhTVGd3Wno2MVpK?=
 =?utf-8?B?bURRRDdFSDk4VkdCa1BQcHkrQzhjN0JOYkcvbndHUm42ZVROM2JpaEwvWkFy?=
 =?utf-8?B?cUlMNTY1S1N4NEtyOWptakxxeUkyRUQ2bmNLaHNVYmx6aEttTGR4OWtXSHZL?=
 =?utf-8?B?SStjenl0cmpHOVBiYlFrSUdhZkhjck93UitsZ0pHWXlCK2FMV0R1cVVKdVd3?=
 =?utf-8?B?cU1CMXpQdTdrbmd5N1hwSnoyYVlDc2xrRXVIelZtSVNPWHZGRnFXVU8xcDJt?=
 =?utf-8?B?ZWQ4aHlDclNVSXd4YmFsZjNRVGNDK1kyRU1XbFZBWGNESkplL3FSZ3RXd1Bu?=
 =?utf-8?B?aDBxcEFtZ3JUb1pIWmp0alFsRWxqZmpjRGRvM3VSajBzY1k1a3FTdmUrdG9X?=
 =?utf-8?B?WmdUM1g1QTJzSDJQY1BzZ2RIU1RDMVFTdEpxazd6N0Zja3FzVHA3RmppMVht?=
 =?utf-8?B?dEZMNS8xNmdhd0U3Y0wzcmhNdW1QNFN3YnpsMlFBVlZWa21vd21ick9KQWlU?=
 =?utf-8?B?bS9hQXFRaFVHbE8zZzF4b0draER3RkcwcFhRSDZrU1Q3WFRQelFJUEhrNS9E?=
 =?utf-8?B?M01yZDRyalpaTjNjMWZOc05sOVpLdWhKTktsZzB4czExb1hETC84THhIVFVn?=
 =?utf-8?B?ZUFRbG8rWEZ3M0NiZ21DUFFpeVMvRmZ3YlRza3JFZTJoeS9wZ0g4TmRvVklB?=
 =?utf-8?B?bjBRSytSb0lBSkpuODkya256dGVjMVdRZlhBdGtpM1FsOVViRkFaZWMrZFFt?=
 =?utf-8?B?WmNZWjhkeDJzdEdxVmVlVHF0SWZjWVpKblJldnNMM2c0N043NHlGWkdhSWhR?=
 =?utf-8?B?NUVJUkExUzdqbG1rQ1dLRjlaVzhNSFFHYkRrQ1R6VEJNM1Z5dG5zQUZlR2ZX?=
 =?utf-8?B?eFB2VDB5cjVmMm5mV2RPZmg5TkU2ZDhzRlczNVJWMVVYdHByL3ljRmF0NGx5?=
 =?utf-8?B?dmx6Zy9IMlJrMi9VSHNMdGV2ekQzVmVvVHlXcU5yYzBSZ1FBMnFkN3Nhek14?=
 =?utf-8?B?ajMycHh5eUdDeDJhSmt6K0FaOEpodzljU0xXR3pnYUtUZ3kybjJUc2w3M0xX?=
 =?utf-8?B?MTJMMlpWTFgxTkRPaDZ3V3p5cFl2OUt0bUVsK1AxaERSNkd1M2FpSGlmT2ZI?=
 =?utf-8?B?Nk5HNUNYb2p6QWwrRkRNTFRCZXhLanluYnNtRkFKQUdGa0xHNlg5SWJNS0k4?=
 =?utf-8?B?aEtNV3RhQUNLWG96ZEVxZ29IL0M1TnVqMWlqb05Pc0RQK01EZlVtVEdPejdX?=
 =?utf-8?B?OTNSaTNZM3o4WWxOa0tkM1o2OG5VWmFjbHhTWEpRcDdBVkNGVnFOeGc4SjBK?=
 =?utf-8?B?clFWeWh1cXczbEgwM0JYektOZ2ZscFdzL1RWcEdSdVhoVW5acVp2emdUMGU1?=
 =?utf-8?B?di8vT0xDanVvRVUxL3NYTWZGK0JGdWhlQUVSdHBqQ3ZJeU1qcWdidFlLeWs0?=
 =?utf-8?B?eTVTMEtvbkxITEVlMlEvZWNKbExFWFNuUXhMV0Ric0N2cDZUN20vM3IzTml3?=
 =?utf-8?B?WWNOb2Z3U0k4OUNXa2FVSzV6SEtuZ3VPOWwyQVJoRDdqeDdmdDNSSThlOWdT?=
 =?utf-8?B?TWowbVcvL3E1VHgvRzRPMkdOOXYrN2RVaWErYjRPWlJOUk45VzRkT3dLY09Y?=
 =?utf-8?B?eG5qV0RpVnQ2Q0lzR28wNVBCbTZXQUNVZGp5WEtnWndjTFNmSkJZYW5sejN1?=
 =?utf-8?B?dzR2MVRZdlBNeDA4WE50Y3FTTHlwSlNqK2xhZk1OSTV2Rmw2cWRiZUVIYi80?=
 =?utf-8?B?Y2NnY0xwSWh0RXZ3dUx3U1FVYnJpS3BwMXJhemx5dlVjNWhDOFUzVnRQOUVl?=
 =?utf-8?B?ZldoTUdNVVkzQ1B3ZFBOQm9lc2RUMG1VZVJxdmJXNnl0ODI3cmhBVWxpUlBz?=
 =?utf-8?B?SGlPang0U0ZUZzNNT1M1MUVpVUlaUzc2TUtUK25OQ0hCOXoyRHg3S2k2VHVU?=
 =?utf-8?B?VmkvZ05wdWJ6Rk8za0hxSXkzVmJtY2RjbUlMaWtBdnVhdE9Eb1pWeExoMWh0?=
 =?utf-8?Q?DgBkYdJUpnNAKNpA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9c9f74-d799-45cc-290d-08df1148315a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2026 03:36:27.2858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCu5xDnRC+cuv8QKwsETuvv04g1vaDfFZsOD9Ky0vHmserTTwnTWcXpmjYTGZhcffpmC2uX7c5d9k3SaczBf6zD3SX5J0teSjWhH+DEIsrUMeXTqw4Z3RbxnFBu8PdS3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1251

SGksIEd1ZW50ZXINCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIDkvMy8yNiAwNjoz
NCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBBZGQgR3Jhbml0ZSBSYXBpZHMgKEdOUikg
Q1BVIHN1cHBvcnQgdG8gdGhlIFBFQ0kgY3B1dGVtcCBkcml2ZXIuIFRoZQ0KPiA+IEdOUiBwbGF0
Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBjb3JlIG1hc2sgc2NhbiB2aWEgUENJIGxvY2FsIHJl
YWQsDQo+ID4gc28gaGFuZGxlIHRoaXMgY2FzZSBleHBsaWNpdGx5IGJ5IHJldHVybmluZyAtRVBF
Uk0gYW5kIHNraXBwaW5nIHRoZQ0KPiA+IGNvcmUgbWFzayBpbml0aWFsaXphdGlvbi4NCj4gPg0K
PiANCj4gQWZ0ZXIgcmVhZGluZyB0aGUgbmV4dCBwYXRjaCBvZiB0aGUgc2VyaWVzOiBBcmUgeW91
IHN1cmUgdGhhdCB0aGlzIGlzIHRoZSBjYXNlLCBvcg0KPiBpcyBpdCBwb3NzaWJsZSB0aGF0IEdy
YW5pdGUgUmFwaWRzIGp1c3QgdXNlcyBhIGRpZmZlcmVudCBhY2Nlc3MgbWVjaGFuaXNtIHRvDQo+
IHByb3ZpZGUgdGhlIGluZm9ybWF0aW9uID8NCj4gDQoNClRoaXMgaXMgdGhlIGluZm9ybWF0aW9u
IEkgb2J0YWluZWQgYnkgcmVmZXJyaW5nIHRvIHRoZSBjb21taXQgYmVsb3cuIA0KT2YgY291cnNl
LCBpdCB3b3VsZCBiZSBiZXN0IGlmIEl3b25hIGNvdWxkIGFsc28gaGVscCB2ZXJpZnkgaXQuDQoN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9vY3AtaG0tb3BlbmJtYy1vcGYtYW1pL2xpbnV4L2NvbW1pdC85
NGI0YjBjODNkMzNiZWM3MGRjYzkyZjY4N2M0YTMyZTFhMWUyNTNjDQoNCj4gVGhhbmtzLA0KPiBH
dWVudGVyDQo+IA0KPiA+IERlZmluZSBuZXcgY3B1X2luZm8gc3RydWN0dXJlIGZvciBHTlIgd2l0
aCBtaW5pbXVtIFBFQ0kgcmV2aXNpb24gMHg0MA0KPiA+IGFuZCB0aGUgdGhlcm1hbCBtYXJnaW4g
Y29udmVyc2lvbiBmdW5jdGlvbg0KPiBkdHNfdGVuX2RvdF9zaXhfdG9fbWlsbGlkZWdyZWUoKS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlh
bmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvaHdtb24vcGVjaS9j
cHV0ZW1wLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3Bl
Y2kvY3B1dGVtcC5jDQo+ID4gYi9kcml2ZXJzL2h3bW9uL3BlY2kvY3B1dGVtcC5jIGluZGV4IDQ1
NzA4OWM1NjFiNC4uNDNlNTJhNmRiNzliDQo+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaHdt
b24vcGVjaS9jcHV0ZW1wLmMNCj4gPiArKysgYi9kcml2ZXJzL2h3bW9uL3BlY2kvY3B1dGVtcC5j
DQo+ID4gQEAgLTMzOSw2ICszMzksMTcgQEAgc3RhdGljIGludCBpbml0X2NvcmVfbWFzayhzdHJ1
Y3QgcGVjaV9jcHV0ZW1wDQo+ICpwcml2KQ0KPiA+ICAgCXUzMiBkYXRhOw0KPiA+ICAgCWludCBy
ZXQ7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBTb21lIHBsYXRmb3JtcyAoZS5nLiBHcmFuaXRl
IFJhcGlkcykgZG8gbm90IGV4cG9zZSB0aGUNCj4gUkVTT0xWRURfQ09SRVMNCj4gPiArCSAqIHJl
Z2lzdGVyIG92ZXIgUEVDSSAtIHBlci1jb3JlIHRlbXBlcmF0dXJlcyBhcmUgc2ltcGx5IG5vdCBh
dmFpbGFibGUuDQo+ID4gKwkgKi8NCj4gPiArCWlmICghcmVnKSB7DQo+ID4gKwkJZGV2X2RiZyhw
cml2LT5kZXYsDQo+ID4gKwkJCSJyZXNvbHZlZCBjb3JlcyBzY2FuIGlzIG5vdCBzdXBwb3J0ZWQg
b24gdmVuZG9yLWZhbWlseS1tb2RlbA0KPiAweCV4XG4iLA0KPiA+ICsJCQlwZWNpX2Rldi0+aW5m
by54ODZfdmZtKTsNCj4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gKwl9DQo+ID4gKw0K
PiA+ICAgCS8qIEdldCB0aGUgUkVTT0xWRURfQ09SRVMgcmVnaXN0ZXIgdmFsdWUgKi8NCj4gPiAg
IAlzd2l0Y2ggKHBlY2lfZGV2LT5pbmZvLng4Nl92Zm0pIHsNCj4gPiAgIAljYXNlIElOVEVMX0lD
RUxBS0VfWDoNCj4gPiBAQCAtNTQzLDYgKzU1NCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNw
dV9pbmZvIGNwdV9lbXIgPSB7DQo+ID4gICAJLnRoZXJtYWxfbWFyZ2luX3RvX21pbGxpZGVncmVl
ID0NCj4gJmR0c190ZW5fZG90X3NpeF90b19taWxsaWRlZ3JlZSwNCj4gPiAgIH07DQo+ID4NCj4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjcHVfaW5mbyBjcHVfZ25yID0gew0KPiA+ICsJLm1pbl9w
ZWNpX3JldmlzaW9uID0gMHg0MCwNCj4gPiArCS50aGVybWFsX21hcmdpbl90b19taWxsaWRlZ3Jl
ZSA9ICZkdHNfdGVuX2RvdF9zaXhfdG9fbWlsbGlkZWdyZWUsIH07DQo+ID4gKw0KPiA+ICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlX2lkIHBlY2lfY3B1dGVtcF9pZHNbXSA9
IHsNCj4gPiAgIAl7DQo+ID4gICAJCS5uYW1lID0gInBlY2lfY3B1LmNwdXRlbXAuaHN4IiwNCj4g
PiBAQCAtNTc2LDYgKzU5MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF1eGlsaWFyeV9kZXZp
Y2VfaWQNCj4gcGVjaV9jcHV0ZW1wX2lkc1tdID0gew0KPiA+ICAgCQkubmFtZSA9ICJwZWNpX2Nw
dS5jcHV0ZW1wLmVtciIsDQo+ID4gICAJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkm
Y3B1X2VtciwNCj4gPiAgIAl9LA0KPiA+ICsJew0KPiA+ICsJCS5uYW1lID0gInBlY2lfY3B1LmNw
dXRlbXAuZ25yIiwNCj4gPiArCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmNwdV9n
bnIsDQo+ID4gKwl9LA0KPiA+ICAgCXsgfQ0KPiA+ICAgfTsNCj4gPiAgIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUoYXV4aWxpYXJ5LCBwZWNpX2NwdXRlbXBfaWRzKTsNCg0KQmVzdCBSZWdhcmRzLA0KQ2hh
bmdodWFuZw0KDQo=
