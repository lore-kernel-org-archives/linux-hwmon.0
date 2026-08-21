Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2131.outbound.protection.partner.outlook.cn [139.219.146.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23323339375;
	Fri, 21 Aug 2026 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787291326; cv=fail; b=CNWtcDzR2aSpgYwo1fQzl8K77gTLOWnU6hMtei5c/1JOi7wpkJJFNpYcxiZVu4MP2BJOUYIEtNN+B7k9RQTEOfkgMkGTjQB0LLBIBgxjaO+BcA3HeaiOTm7Q4brGFkZTYLd2lX0Tj0OYG3kIfHX99NQdivugFIrOog9+RJQOnEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787291326; c=relaxed/simple;
	bh=O41JOX+W2ueAYJbFVS4PBm3m2lJQwH9FNtrfLPFjLqg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=svNMdYf3phrJ42MqiHr6+vtuqi9XO0fPXzpBgryQ12tggh+wx8fKf93DZ8fv5+DmvgNCJ2/qdChmKF/P+CjVPRvVZWdZ6JTg2ejiqCnbnTSGWMaa634A9ygcbBrNj7SAmtS2bTdFWrkLqiPFa0lzyjpRH34gJWdAFBK8swdemC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kO63zxt0gjNUH/2ZllQ6sA3iklMUCTik5OlmzTIlrX3DVkzplC71BNzPqoCFH1JFB/p7qrC6MT2DVS0RuJ7pYZJ9xU0d0lcTRWhUGOvG7VV6SsWEFJ5QKY1pr1S+hF1ZRdwfT4CRTN9HSJottlQqIdq0p51W/fepeFlCYoQ8D6N+uTXtKRgZ23QFh1ODpCpzjT/ILKGuJaZ412b1R1Ozp1CtxVLLCA8n/LEXzdL7qqhvLC4Au20qpIZKm0Q60M6Ryl6tRsTOwpWw4tJ5pjGnf2BvoeHycECmYtup8nyGcAYfh0HVfC1ymfLI8zQ3OJW8xQ00FkOr+Dnd3Wg/HVUaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O41JOX+W2ueAYJbFVS4PBm3m2lJQwH9FNtrfLPFjLqg=;
 b=HDPw7jp4GllAGIyOpyT+71gW6JKJrN/y9DOBwUFdpL/R9ew0dDpHMUtXZj6fZ9mbnyfmxPHN/P0usdih9v1PUmFPIAGsd3Yo/YESJbes1inqo2o5R+IQZ4Y9HRUoRp2RWbFABfYYUSjH67d+tn6D5f0tH/BgQoRc0zgGErnm8yUGU3VdOtuWSQE0srgp5cCyWiDwhU8I5j55W/K77k3ku9EfiHUy8qPQIRmmzr4lOBedqx1z/c6M/5b00gvMdEiKET2fY2QHUMqMJfxFBXc5w0Dpi3/kiTxYfiR8IdUknRmjroMSVgugnkOoDIR045VnEiY33DMRWAts/XnS9fXa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1331.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 21 Aug
 2026 05:48:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 21 Aug 2026 05:48:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for
 StarFive JHB100
Thread-Topic: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver
 for StarFive JHB100
Thread-Index:
 AQHdL7tiZ0pkvi/tGkyyx2gmpMKsaramYUaAgABZA3CAADiYAIAAwDuQgAAQLgCAAD6oUA==
Date: Fri, 21 Aug 2026 05:48:36 +0000
Message-ID:
 <ZQ4PR01MB120284D84F7BBC14EA34D854F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
 <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
 <ZQ4PR01MB12025F1BFB7E3F897228AA40F2A42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <9fc113e5-e56c-4e9f-8b29-914f39503b0f@roeck-us.net>
 <ZQ4PR01MB1202A9B4F415BE121B6984B0F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5bbbdc8d-828d-4b99-9581-c89cffb7c67a@roeck-us.net>
In-Reply-To: <5bbbdc8d-828d-4b99-9581-c89cffb7c67a@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1331:EE_
x-ms-office365-filtering-correlation-id: 77345bf0-9b28-4eba-9c0e-08deff47d859
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|56012099006|6133799003|38070700021|4143699003|10067099003;
x-microsoft-antispam-message-info:
 M4AjzYgDfXX7+1fMegVr13upYwLqE2cFI01Q+WYaxBLu4XkP202mtzrNlhITev08TUjW3NfyEdgR+bwTFCLX0zeqJQhAkRLvGwc1bkr1IKOYIFYt/Y/Rfa3lOxIRwXwcarSJZOcMefv2piShBpUOD8QAFT8GKtqyIBu03bqblYr6Ysq3XixmNZwlkzK/q/zV1Z9SYGhfaA+A0Pftg7apaey9wZ5cQzPdDcy0RxPnD+K4HOHUQIYtq0s+Xd6m05ROOl7hZPtRBHy0HsbohfbknkLo3v40MO9VueJJ3Abzh6gkEeD/bpg9SWLg2G0+CYPXmih3VmWtgWXjqRo7m5Z5+r6irSZXEX4pSjHjpvayeIU7MkOPXkhPg6vAOTl1YdcMebnzW5zHfc+rxhERqYmNQ13lT3/GHUDwepBAh6NeigfkYtfs23IUKbJJ7AhjcQjxylHDGjenh7zqlwHc5XCBQavpHU6b0C54zd5T+nSunqGQEt5pciQxHRJB6WpBvr9EqcrHsijjXTHCVyjMtt253p/ZSQxqfflYT27wKgNxGASyn/Ia5UyPH4u3oyaLSEht
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(38070700021)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2NjUjVEakRCZnZVRi9rdUV3YlN3T2FpK3lSR3FKMVVGTjlPL2I2NUx6eHFP?=
 =?utf-8?B?ZVZheE52eU0zQzlyOWtJQXNhbXJJRVRTekIyNzVRNE43OHhRelgrT2pEb2dW?=
 =?utf-8?B?RmVCY3hpR2YvaWhsTTNyUUcrcnpTRGFzTnJtY2lLNWkyMXZianJlRWtTZDh0?=
 =?utf-8?B?K3JkT0MrNFNTS2xhUVA5Uk41MnlBQmliSkR0TEkrVlR0ZXVYUC94dlAyN0Q1?=
 =?utf-8?B?SktmaHkyRDB3czYvY1dvMDBCc2VOMlpLNUg1UXNoVXRmVms5OTloSkpObGRY?=
 =?utf-8?B?WkdDdlYxOWRUSzc3NXQ1alQrcjhEVGs0WDdGb1FmUWhFZE1VYVlDVlprakV2?=
 =?utf-8?B?WVdqa3V5V2h6NldaVkNXQUlibjYxVEtvWmo2dVpzQ3FEVCtHVkpISFFxeFBK?=
 =?utf-8?B?VHF1SzVYMHVaTVNyanI5dkVFaW9lWTVLK2JqeDBMOEVucDBsVGc2S0x4bVdD?=
 =?utf-8?B?N0NONWx4K09kOUJJcGdVS2w3Z1BLYlQrQXBjKzgwTFFxaXhZdncrSW5kKzM5?=
 =?utf-8?B?ZUJ0QjUxSkN1K2ZMNlZmYXNhTlM0NkxyRVAvRm5EL0xJMUt6UUJlR2RQbVJH?=
 =?utf-8?B?bWkreWY1d2RPZTcvNkxqVlRveEt2c2czQkZPRmwyT0hraVFPTDd2MTlhRHl0?=
 =?utf-8?B?cXp3RzBiUzQvY2xBNHI1QWVIN21DU1Y0dnRoNmE0RVhIdCtPaWgrVTZXUVc1?=
 =?utf-8?B?Z0pNU0lmaUZIM1M2Zm9BNEdGYzJhZUxsaS9VQ1QvZTF6c1hZYnFCdDF3NDFu?=
 =?utf-8?B?cWMxeEExUk5jUHFiNjdudzVKSFNaWG50T2U2WWZQRlVYb0VYZVNoVHppanVl?=
 =?utf-8?B?b1NkVGU0ZmRGMlFNQ1VTcWp3SHl2Vm4rUzJBODZXdHpoc01NUDloNHlTQkN3?=
 =?utf-8?B?NU84UWhqMTJvL3I0YWZXWUIvWURHL0VKY1dnSVFZRmFTcnorL3c2Z2R6UjNu?=
 =?utf-8?B?eS94VXdtQmt4ZDdGNGlCZVJnTks1VnhEQlpTTVJidThiZG1hakpQTkNMMjBW?=
 =?utf-8?B?dFJnRUdyVGlseHd0M3hxd0xlM3hyR2cvMUY1UmN2QU5Tcllzbjd2R29zV2Uy?=
 =?utf-8?B?QlNiSUdVQzdHWkZzcldjakVMNTBBdkNkS1NuWmJqVFNwZVh0OGd1bHk4VnVm?=
 =?utf-8?B?T2o3RnE0b2YvKzB3OVNYcHlKVzF4cWVkQWxYdmpYOCsxWWFVNlNuN1owZzVx?=
 =?utf-8?B?dnNhNkQ2VVVYNEFwVGtSanJpdVdlSjhRWG8wNUhyaTdldkRVUkxodzl6MXBk?=
 =?utf-8?B?cUpqQ0ZZd2NvVlpIMlVoVnd4ZVI1WUl3WTlWK0tRTzdNWVNoYVhhZE9ObXo0?=
 =?utf-8?B?SFhNOVJyNVIrRExJOXg4d1BOZys2RFhabWFMa2hOSTc3TkpKSGdoWGx4TUR2?=
 =?utf-8?B?OXpzdG15dVdMQmRZSmRjc1pGZHpkekMva29CNXZJZFZ6a3hqMS85SHlESDVl?=
 =?utf-8?B?UW9EdFgxb1VyOTMzWHlHVkpPeXNITmkrVEllcnRHT0xCcHg5blUyWStZWjJz?=
 =?utf-8?B?c2xObkQxWHhSeVVHQWJLN1IrMWRoYW1EQTcrUmRlTSt3NlA4OHRKVWNTckNo?=
 =?utf-8?B?N05MS2QxZ3ZVVDJ2TlpSVjlwL3I0SzJaeEcrMitEREJPUG1BZktDaDMwOVBh?=
 =?utf-8?B?YXRDRzBKVEk0cVlFTnQvT3QxNGladFd3STFmU1B3MjNta3ppMGtnV2xWekhp?=
 =?utf-8?B?ejBhTXQ2dUpPSk5DWmx0T29zSSszaDY0QnM4UU9OcGxXTmlZLytZZnMyN3Ey?=
 =?utf-8?B?UUp1eDlsdXkxY0RhUXdiZEVHbDN2Z0VybXZhL3N1MHhRS3R3ckJPOFZZeGo5?=
 =?utf-8?B?Skl2QTk4R1hxUys5ZnNqZktaR2FzWUt2T0RrdzFVeVczQmZLRFFHNE1sUzBZ?=
 =?utf-8?B?eU1ZMzhZN00xYkhGMzhrOEJKbi9ER0VFTUJqS1BLMHIxUjI2UFRXQU85S1VV?=
 =?utf-8?B?alJ2NUhZU09rbStlMUZmd0MrZVBZL3BvbXFaSUt2S09tdE1sUlMxVjlESmFH?=
 =?utf-8?B?T3RXUWljcmd1K3k1T29YZjUwb1BsZTJOWWUwQjE3R3ArTDlCMGVtU1hQMHVq?=
 =?utf-8?B?UTNRZndnNVk4MlFiK3FJQ0RWcTBWV3VQTC8vYmlxTGhYRXN3ZmdSRGhzQzUz?=
 =?utf-8?B?QUJlSkNPbUJDakpieDVRSGhJdVVWUHQwNnNVdXd0QWJjTm9nQlRGRG4vTDBL?=
 =?utf-8?B?U3p0cTNmNXFaSm9NaEZiUDI1UnIwV2lIRHVUUlh6S09WR2g1WlpuMUtaQnov?=
 =?utf-8?B?T25jU3dLUU1keURacjlSZFhNcytHQ2ZjWE55emJxaUZQRE00S3Q4QjVMMzY1?=
 =?utf-8?B?MUhzQkJiM1I0aFFRbE9nUU5KZG1CM1BuV29VZHdVYjl3ZFB1aTJoN2xKZGlt?=
 =?utf-8?Q?4g5xiQY+K+O/m+b4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77345bf0-9b28-4eba-9c0e-08deff47d859
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 05:48:37.0032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdiK5xPvp/rGIuZBMF32Y5hSxKkoTueg7rwwFJKbQAisEUO39ckBjj/3yvXGC3w4q4lDgp7OYq2PQ7fr0338hPWqPNH2gY+VA0wiU079B4uVmvHiBb5UbubOK4C2ZDz6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1331

SGksIEd1ZW50ZXINCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIDgvMjAvMjYgMTg6
MDYsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+IC4uLg0KPiANCj4gPj4gU28gaG93IGxvbmcg
ZG9lcyBpdCB0YWtlIHRvIGV4ZWN1dGUgdGhlICJzZW5zb3JzIiBjb21tYW5kIHdpdGggMTYNCj4g
Pj4gYWN0aXZlIGZhbnMgPw0KPiA+DQo+ID4gIyB0aW1lIHNlbnNvcnMNCj4gPiBzdGFyZml2ZV9m
YW5fdGFjaC1pc2EtMDAwMA0KPiA+IEFkYXB0ZXI6IElTQSBhZGFwdGVyDQo+ID4gZmFuMTogICAg
ICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuMjogICAgICAgICAgIEZBVUxU
ICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuMzogICAgICAgICAgIEZBVUxUICAobWluID0gIDMw
MCBSUE0pDQo+ID4gZmFuNDogICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4g
ZmFuNTogICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuNjogICAgICAg
ICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuNzogICAgICAgICAgIEZBVUxUICAo
bWluID0gIDMwMCBSUE0pDQo+ID4gZmFuODogICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBS
UE0pDQo+ID4gZmFuOTogICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFu
MTA6ICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuMTE6ICAgICAgICAg
IEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuMTI6ICAgICAgICAgIEZBVUxUICAobWlu
ID0gIDMwMCBSUE0pDQo+ID4gZmFuMTM6ICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0p
DQo+ID4gZmFuMTQ6ICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuMTU6
ICAgICAgICAgIEZBVUxUICAobWluID0gIDMwMCBSUE0pDQo+ID4gZmFuMTY6ICAgICAgIDE4MDAg
UlBNICAobWluID0gIDMwMCBSUE0pDQo+ID4NCj4gPg0KPiA+IHJlYWwgICAgMG00Ljg2NXMNCj4g
PiB1c2VyICAgIDBtMC4wMjNzDQo+ID4gc3lzICAgICAwbTAuMDAxcw0KPiA+DQo+IA0KPiBOb3Jt
YWxseSBJIHdvdWxkIHNheSB0aGlzIGlzIGEgbm8tZ28sIGJ1dCB0aGlzIGlzIHlvdXIgY2hpcCAo
YW5kLCBhcyB3ZSBzYXksIHlvdXINCj4gZnVuZXJhbCkuIEp1c3QgcGxlYXNlIGRvY3VtZW50IHRo
YXQgcmVhZGluZyB0aGUgZmFuIHN0YXR1cyB3aWxsIHRha2UgZm9yZXZlciBmb3INCj4gZGlzY29u
bmVjdGVkIGZhbnMuDQoNCk9rYXksIEknbGwgcHJvY2VlZCB3aXRoIHRoaXMgc29sdXRpb24gZm9y
IHRoZSB0aW1lIGJlaW5nLCBhbmQgSSBjYW4gcmV2aXNpdCBpdCBsYXRlcg0KdG8gZXhwbG9yZSBw
b3NzaWJsZSBpbXByb3ZlbWVudHMuIEkgd2lsbCBhbHNvIHJlY29yZCB0aGUgY3VycmVudCBzdGF0
dXMgaW4gdGhlIA0KZG9jdW1lbnRhdGlvbg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=
