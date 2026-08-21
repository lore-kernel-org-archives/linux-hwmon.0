Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2095.outbound.protection.partner.outlook.cn [139.219.146.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35D35CB87;
	Fri, 21 Aug 2026 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282406; cv=fail; b=sydJFEajxPmSB9JetoO4qqblUbu8bIs4TzeVJIOHR24L54y9zP4Bj5g4b2OVH6FcZRHV7zNUfF1apc4dSwp8J3/2wC0eSLajumQpcQlWCh4EjRSSQtQnmumDAbojcR5b+IosvMOh9g1EbfJl4EvSI+WEojw0S2TbQ0Zk3Y3OhRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282406; c=relaxed/simple;
	bh=/vwPkwi384H6rBB6IPu2n/ATEQb9TuBnCyGRPYL5wx4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kVssB39HTZKvriULh2Idun5u7pTuImEFVAWtWg4mTx/1CSNjsOaXeWxfGU7OQBfjOM25zd7m4oLtNJd7/p9lEQ8XRgcp0fQNPH1okINJevp00xJSVz4YEdg5UVpTde38VRZmOpV8u4Pin+/aBpz9qNULCk+MFlihfpZ8msLrz90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxPo7QpOnKOnI7yiEG88lKmlxhlBbfP/nESpPDTh73RP5M8Fntj32wuO/JLPXodmA21JUoAkjXgZ/UYYKEKd3rJ1R1OxUS6ur/Lp5pZ4V2I7w9RtmHfodFClytgJVkD9W4CXMSENKdQMZ+6E2CqV1+Hh+0G9rLoO+XfujVUcJ0+bYOfa10oyxEaGT5mZjA9N6BnozaTD34pqWbuMqbKELF32yIX0iWKfCFvoGRr/xP3hon4RrgDrdHvKv8uPTdQQznNWVIVnBsSeIBAIIzVWBjJmwVl/y5+tjLrg6p4uO4IGOK8RRLhfpzTN2WloFzbdUpqCOLuZoAqsuFCeyYfLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vwPkwi384H6rBB6IPu2n/ATEQb9TuBnCyGRPYL5wx4=;
 b=IrbH5BoxlWwDTIBNWyWehygFJ2oV5zd7eHL3oapcwwNfi2abi8on5oxCyX6+eUs7xf96vzQM989d5K96MWPa1joQPV2jPyaGVzHTiG9jmHRMMERljAjJFJobeUVRiDM23UvTvQ+hJlj+BfYcTlp4oFAMXpeel1hbnKOLfJ2wzMrI1hQC+2BOyKAbEn3b0QGdiaYJWsiIr8bdDLgXYTFdveBaQLxnOpBJqKXocWVAp4KCQ0CcmbHXD7bMTOraiD4ziJGJhPSyNHioXGCJTDpKjCx9c+A/OSvWbKRaZwCEmhOkmKDhxcr8/zM+ZbgPDw4JbSYhmtcK/tZ83C0m7ys2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1169.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 21 Aug
 2026 03:04:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 21 Aug 2026 03:04:25 +0000
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
 AQHdL7tiZ0pkvi/tGkyyx2gmpMKsaramYUaAgABZA3CAADiYAIAAwDuQgAAPc4CAABGEgA==
Date: Fri, 21 Aug 2026 03:04:25 +0000
Message-ID:
 <ZQ4PR01MB1202B514A3CA9039DD2F87ABF2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
 <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
 <ZQ4PR01MB12025F1BFB7E3F897228AA40F2A42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <9fc113e5-e56c-4e9f-8b29-914f39503b0f@roeck-us.net>
 <ZQ4PR01MB1202A9B4F415BE121B6984B0F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <86fb8015-cb78-4285-8a84-6ea617afb920@roeck-us.net>
In-Reply-To: <86fb8015-cb78-4285-8a84-6ea617afb920@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1169:EE_
x-ms-office365-filtering-correlation-id: 5a1116a4-1179-4891-d333-08deff30e899
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|6133799003|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 h5uS7ZW+dHUkEHKQ//fzLEcLeyLZDrbAdvIigRPRBTtiRsBcLmYPSu8gCHBcoJsxn92BJ/Wjci9fu0KK1TA6L9U1vSs+gVc+0Ro+LCMSHNJeBvMoKvT5pvThKoGuETjjZtTB8B4C2ZSziuYxSEDajbf9vdk5YDfPRmhy0cRn6eRUukxVb/OY5T03VtlOiX8Ugzy5TCJcuZez/gem8u5Fcir02c1uZt5/C22LZqLveEfd7KuCmbLTrASV93IHrHiIcCCd11V0GItEOBZ6BxZxs9DOCSoAsqVoKFfWctXGWHzQQ3LDkmQ5vUOd7wEwYN0Ngi1ydKhE7QRVHpfAD0dpMbxEcusnvcfePzvf72/39IQKxJL34Y66nyKj6acBe7S77aGKrjerJPcKtl2TZPR9k+waP0x3PXPMT5m+2AaToORKzh/384RPPQkl9FVyAP1svvGP4LODJftgSPdxbflnEz4K9tY19/c2hUYlpP9U52XCldahvYbLBcg7Ss9Tut20sWHaRQ85RlhUOys1FDZfpqeCH+8cFSPq9YqgpbtlN2AfscpiIIo0Vw2RXwJb0y9n
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlRnSU5RODVFWUpsR1dsVEtGTi9oR0hmeFZlTjRJWWtTSHFyMUNTOTZiVWV3?=
 =?utf-8?B?SXZDU01kR0QwN0NSdWV4ZDA5NWRlOWlTak9Qc1RrbzJXditkL3NqdVNyRndk?=
 =?utf-8?B?VzUveWJmZzhxdVlvQytYdFRXQlF3YlRhejVqcTREYVR3RlRmZHpJN0VmRG9u?=
 =?utf-8?B?Z1VKelNhOVBFd0RMaFJSdEF3OGpySXBtL1BSRXM2V1lhNVVRLzh1ZmwzQ20w?=
 =?utf-8?B?WndqbEUyZVgxRzR1ZWkxTnZNN25ndHo1bVJBU2xrRXY2WjRMQUdiM0pqNmJ3?=
 =?utf-8?B?Ymt6bVZ1ZGp1bmROOVpmUlpMY3FRUlFuY1ByTjFNQStzaFdON3BDK2s2RWtM?=
 =?utf-8?B?MXlwZ2lmQ256VEhrekVyL3Y0dHBiTXpvVTZtMWVJUXZzb3RaMlpYck4za1pG?=
 =?utf-8?B?UUdmNlVoalJzbEh5UnVBcTFVdThkUU10TGhRbVhyWXBuUStmd3JXMk1TM1FR?=
 =?utf-8?B?aEkwQ1lzNDcvMklFcFJZZnhDK1dxWG5tY2I2RWVNWGNoRVQ3eFl2SGlkYUNX?=
 =?utf-8?B?UkpPbWpXbVNaUkxqejN5UGVwZXZUbDA3bjlKc2hDTGpEMjRKbWpJalo2Unoy?=
 =?utf-8?B?OXMwVXVHSlMyYTNqc0djbmlrRXJNcXRIZ0xMOVU5ckJmRHFLVndmUW1CcUF4?=
 =?utf-8?B?ZGo3cjA3RFY4VFVZa0pHWlYwWGN3YjdIVXpxc0RBOXprNy9UbExUSytsK3hF?=
 =?utf-8?B?aGcxdkx5VCs3YU9OTmF3OWthbUh1MjdwVWJPakduaFJlcHN6NThvRHZKWFdZ?=
 =?utf-8?B?T01EWGg2dFdUSjdkWjN6ZUE3R1hEN0c3R0lxdjg0MFNTTU5kVnA4V3hQVWJL?=
 =?utf-8?B?SFVmQlhiVVJ0aDEvV3V2ckoyOWFhUzRMeXNYYXV2NUZ6eE5vTU0vUkJXdU1s?=
 =?utf-8?B?TlNycGgrSDZudzUvUXE4eWEreVdTcGM4RmRXQkRQVElxZjlLMmtlS24xb1dG?=
 =?utf-8?B?Q2d2eEZJZTRHNTRQT2NlRmJWcWVaRlNLaWJnQTdnQWwyWm0vMnBMdkVNRVFZ?=
 =?utf-8?B?VjRqOFQrMnZqcHplWUptdnRvUWZJTkNjREdaeVY4eTVuUzdJWTZ3M3hxU2s1?=
 =?utf-8?B?Vk43N21RQlh6M2hPNnNpMUhFZDVZREhxaDF4VlhPY3JtUlYyblFMSlNvWWU2?=
 =?utf-8?B?aDlQUzhsaFYrVkZMVCs1bWpERTVIbTRWSmh5WXNiS3VPZ3ZRNXZhQjZETjd2?=
 =?utf-8?B?RGhRUzFpRGRoTWFzTjNleWhyRTZUajJxWFZNMnlRRFJvZGtLRHQvSnJuZ2FJ?=
 =?utf-8?B?T3lHeDQ0R2IxRVBIalZhaHdJN0xYWHdVM0pLbXdlenBqbjBwL3hpR2JhTUJ1?=
 =?utf-8?B?RnZPUjlCbmlxR082Z2FSbVVscHQwY2ZxcFdQU2k0Vjd6WnMrZlV0eHJMM0hH?=
 =?utf-8?B?enB1NDVHa0Q5UWxrYUhCbDh4bWFTMWJTb1VNR2lHOXVLa0VDd3VYV3ROWmpD?=
 =?utf-8?B?djNBQ3hiODJTSFM4YjZIUXdHYWN3dGZnWDVqR0d0SGFpMnJtcGVlbHRDUGhp?=
 =?utf-8?B?Y1NKeFFxUVhlVi9kYkhwbHpNMzVVdzVOeFFha09iRy9rMEhZY1ZOZkFoWHlr?=
 =?utf-8?B?Wm9vZ0pId25hM3Z5OTNrbUtjcXhLdnJGVjFzcDRXRUVjUlhUZGRpbnAzT2Yy?=
 =?utf-8?B?alh2SU9FZEJ6Rm1LTjFNaGdBTUk2TGV5WmRmU2g3bGl1RXY4UWVmNlRDek9q?=
 =?utf-8?B?S3RmZ1lpZk12UmxGMzFBY2dFbFpvWm4xdHFHUU5RbkZJQXFOZE4rRWxKSDI4?=
 =?utf-8?B?NjY3MnJoWFVrQzhYMXptTUJNcEx2elgyR3Y1UlFOVWlYYzZKK3ZaSE9XZHc0?=
 =?utf-8?B?dEFrS2ZxRVNITC90WGZwS3gxZ2ZRd0RPeU9EcHEvdElCOFJBbmVGcU9yTjRZ?=
 =?utf-8?B?bnpXM2xTZGxDNzQrQ1J3VUtNWC9KOGhjTGdaWTBBMXExcGRvd0N6N3gzL2Rk?=
 =?utf-8?B?L0ptSTNOQXlENU5ISUVtbkRreDlPSzFacEFwRVFtV2RTYWYySSt3TUxoQWFM?=
 =?utf-8?B?dEJxVkFHaHN4eDJQck1jSy9XZ0dlTnJ3cVhvOVZxN2VSYUozZ2FZMnZEblo5?=
 =?utf-8?B?QXpUdXlGMFlQQnJzNzJ0L0U1M0tUUkEyUkx2SGhYcmtRUEhPWERjVmdUcWc1?=
 =?utf-8?B?enJpMWNhVjJMRlZPbTB6ajNxZUYxM0ZpSXY0SnJ4RnRrYlQ4TTYwS1JBUm9p?=
 =?utf-8?B?ZUNVbWxCQm9xRzh3OWRQODFRUFUwWUtTc2djd1U2T3F5TjZhOWU5d1BDQzhp?=
 =?utf-8?B?Q2hGRk1QN0xLN3RDK01UWTI5dVhUS2ErRCthRjBKTWg0NmhZMUpqcjk1UzFQ?=
 =?utf-8?B?ZXh1U1pvakZKUWwzQkp4eHk5TWlrdk9ydDJNa1pHTjI3WEFnbTVlZFQ4NlZ3?=
 =?utf-8?Q?TULNRv2s2jpPp/zc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1116a4-1179-4891-d333-08deff30e899
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 03:04:25.9019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAmh/P8GoIkNoEcf7X+AucXoIG27Z58fmAyJzc+dxZn6oU46hw00pJuWP84nVn2I9Jp/X4pegTVEo01MhoVyfTPrhcutNuDS2tZtFqMc/teLbsXCO+/PyoU07uLj31CI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1169

SGksIEd1ZW50ZXINCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIDgvMjAvMjYgMTg6
MDYsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gSGksIEd1ZW50ZXINCj4gPg0KPiA+IFRo
YW5rcyBmb3IgdGhlIHJldmlldy4NCj4gPg0KPiA+Pj4+IE9uIDgvMTkvMjYgMDI6MTYsIENoYW5n
aHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4+Pj4+IEFkZCBmYW4gdGFjaCBkcml2ZXIgZm9yIFN0YXJG
aXZlIEpIQjEwMCBTb0MuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBjb250cm9sbGVyIHN1cHBvcnRz
IHVwIHRvIDE2IGluZGVwZW5kZW50IGZhbiB0YWNob21ldGVyIGlucHV0cw0KPiA+Pj4+PiBhbmQg
cmVwb3J0cyBmYW4gc3BlZWQgaW4gUlBNIHRocm91Z2ggdGhlIGh3bW9uIHN5c2ZzIGludGVyZmFj
ZSwNCj4gPj4+Pj4gYWxvbmcgd2l0aCBzdGFsbCBhbmQgbG93LXNwZWVkIGFsYXJtcy4NCj4gPj4+
Pj4NCj4gPj4+Pj4gRm9yIHRoaXMgY29udHJvbGxlciwgdGhlIHNwZWNpYWwgY2xvY2sgYW5kIHJl
c2V0IG9wZXJhdGlvbiBzZXF1ZW5jZSBpczoNCj4gPj4+Pj4gICAgIHByb2JlOiBjbGtfcHJlcGFy
ZV9lbmFibGUoKSB0aGFuIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKQ0KPiA+Pj4+PiAgICAgcmVt
b3ZlOiBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSB0aGFuIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkN
Cj4gPj4+Pg0KPiA+Pj4+IHMvdGhhbi90aGVuLw0KPiA+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IENv
LWRldmVsb3BlZC1ieTogV2lsbGlhbSBRaXUgPHdpbGxpYW0ucWl1QHN0YXJmaXZldGVjaC5jb20+
DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2
ZXRlY2guY29tPg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nDQo+ID4+
Pj4+IDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+
PiAuLi4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiArc3RhdGljIGludCBzdGFyZml2ZV9mYW5fdGFjaF9o
d21vbl9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPj4+Pj4gKwkJCQkJZW51bSBod21vbl9z
ZW5zb3JfdHlwZXMgdHlwZSwgdTMyIGF0dHIsDQo+ID4+Pj4+ICsJCQkJCWludCBjaGFubmVsLCBs
b25nICp2YWwpDQo+ID4+Pj4+ICt7DQo+ID4+Pj4+ICsJc3RydWN0IHN0YXJmaXZlX2Zhbl90YWNo
X2RhdGEgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPj4+Pj4gKwlpbnQgcmV0ID0g
MDsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArCXN3aXRjaCAoYXR0cikgew0KPiA+Pj4+PiArCWNhc2Ug
aHdtb25fZmFuX2ZhdWx0Og0KPiA+Pj4+PiArCQlzY29wZWRfZ3VhcmQobXV0ZXgsICZwcml2LT5s
b2NrKSB7DQo+ID4+Pj4+ICsJCQlzY29wZWRfZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSwgJnByaXYt
PmlycV9sb2NrKSB7DQo+ID4+Pj4+ICsJCQkJd3JpdGVsKFNUQVJGSVZFX0ZBTl9UQUNIX1NUQUxM
X0lOVChjaGFubmVsKSwNCj4gPj4+Pj4gKwkJCQkgICAgICAgcHJpdi0+cmVncyArIFNUQVJGSVZF
X0ZBTl9UQUNIX1NUQVRVUyk7DQo+ID4+Pj4+ICsJCQkJLyogY2xlYXIgZmFuX3N0YWxsIGZpcnN0
ICovDQo+ID4+Pj4+ICsJCQkJcHJpdi0+ZmFuX3N0YWxsW2NoYW5uZWxdID0gMDsNCj4gPj4+Pj4g
KwkJCQlyZWluaXRfY29tcGxldGlvbigmcHJpdi0+Y29tcF9zdGFsbFtjaGFubmVsXSk7DQo+ID4+
Pj4+ICsJCQkJcHJpdi0+YXJtZWRfc3RhbGwgfD0gQklUKGNoYW5uZWwpOw0KPiA+Pj4+PiArCQkJ
fQ0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsJCQlzdGFyZml2ZV9mYW5fdGFjaF9jaF9zdGFsbF91bm1h
c2socHJpdiwgY2hhbm5lbCwgdHJ1ZSk7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwkJCS8qIFdhaXRp
bmcgZm9yIGhhcmR3YXJlIHRvIG1lYXN1cmUgKi8NCj4gPj4+Pj4gKw0KPiA+PiAJd2FpdF9mb3Jf
Y29tcGxldGlvbl90aW1lb3V0KCZwcml2LT5jb21wX3N0YWxsW2NoYW5uZWxdLA0KPiA+Pj4+PiAr
CQkJCQkJICAgIDIgKg0KPiA+Pj4+IFNUQVJGSVZFX0ZBTl9UQUNIX1RJTUVPVVRfSklGRklFUyk7
DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwkJCXN0YXJmaXZlX2Zhbl90YWNoX2NoX3N0YWxsX3VubWFz
ayhwcml2LCBjaGFubmVsLCBmYWxzZSk7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwkJCXNjb3BlZF9n
dWFyZChzcGlubG9ja19pcnFzYXZlLCAmcHJpdi0+aXJxX2xvY2spIHsNCj4gPj4+Pj4gKwkJCQlw
cml2LT5hcm1lZF9zdGFsbCAmPSB+QklUKGNoYW5uZWwpOw0KPiA+Pj4+PiArCQkJCSp2YWwgPSBw
cml2LT5mYW5fc3RhbGxbY2hhbm5lbF07DQo+ID4+Pj4+ICsJCQl9DQo+ID4+Pj4+ICsJCX0NCj4g
Pj4+Pj4gKw0KPiA+Pj4+DQo+ID4+Pj4gSSdkIHJlYWxseSBiZSBpbnRlcmVzdGVkIHRvIHNlZSBo
b3cgbG9uZyBpdCB0YWtlcyB0byByZWFkIHRoZSBhbGFybQ0KPiA+Pj4+IGFuZCBmYXVsdCBzdGF0
dXMgb2YgYWxsIGZhbnMuIEFuZCwgeWVzLCBTYXNoaWtvIGhhcyBhIHBvaW50OiB0aGUNCj4gPj4+
PiBhdHRyaWJ1dGVzIGFyZSBzdXBwb3J0ZWQgdG8gcmVwb3J0IGEgc3RpY2t5IHN0YXR1cywgbm90
IHNvbWV0aGluZw0KPiA+Pj4+IHRoYXQgaXMgY2FsY3VsYXRlZCBvbiB0aGUgZmx5LiBJcyB0aGlz
IGJhc2VkIG9uIHNvbWUgaGV1cmlzdGljcyA/IEkNCj4gPj4+PiBkb24ndCBjbGFpbSB0byB1bmRl
cnN0YW5kIGhvdyBmYXVsdCBhbmQgbWluX2FsYXJtIGFyZSBjYWxjdWxhdGVkLiBBDQo+ID4+Pj4g
Y29tbWVudCBpbiB0aGUgY29kZSBkZXNjcmliaW5nIGhvdyB0aGlzIHdvcmtzIHdvdWxkIGJlIGhl
bHBmdWwuDQo+ID4+Pg0KPiA+Pj4gVGhlcmUgaXMgbm8gcmVhbCBjYWxjdWxhdGlvbiBmb3IgZmF1
bHQgYW5kIG1pbl9hbGFybSwgdGhlIGhhcmR3YXJlDQo+ID4+PiBzaW1wbHkgY291bnRzIHRoZSBj
b3JyZXNwb25kaW5nIHB1bHNlcyB3aXRoaW4gYSBzcGVjaWZpZWQgdGltZQ0KPiA+Pj4gcGVyaW9k
IGFuZCByZXBvcnRzIHRoZSBjb3VudHMgdmlhIGludGVycnVwdCB3aGVuIHRoZSBjb3VudGluZyBw
ZXJpb2QNCj4gZXhwaXJlcy4NCj4gPj4+IEkgd2lsbCB0cnkgdG8gbW9kaWZ5IGl0IHNvIHRoYXQg
dGhlIHByZXZpb3VzIHN0YXRpc3RpY2FsIHJlc3VsdCBpcw0KPiA+Pj4gcmVjb3JkZWQsIGFuZCB3
aGVuIHJlYWRpbmcsIHRoZSBwcmV2aW91cyByZXN1bHQgaXMgcmV0dXJuZWQsICB0aHVzDQo+ID4+
IGVsaW1pbmF0aW5nIHRoZSBuZWVkIHRvIHdhaXQgZm9yIHRoZSBtZWFzdXJlbWVudC4NCj4gPj4+
DQo+ID4+DQo+ID4+IFNvIGhvdyBsb25nIGRvZXMgaXQgdGFrZSB0byBleGVjdXRlIHRoZSAic2Vu
c29ycyIgY29tbWFuZCB3aXRoIDE2DQo+ID4+IGFjdGl2ZSBmYW5zID8NCj4gPg0KPiA+ICMgdGlt
ZSBzZW5zb3JzDQo+ID4gc3RhcmZpdmVfZmFuX3RhY2gtaXNhLTAwMDANCj4gPiBBZGFwdGVyOiBJ
U0EgYWRhcHRlcg0KPiA+IGZhbjE6ICAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0K
PiA+IGZhbjI6ICAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjM6ICAg
ICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjQ6ICAgICAgICAgICBGQVVM
VCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjU6ICAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAz
MDAgUlBNKQ0KPiA+IGZhbjY6ICAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+
IGZhbjc6ICAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjg6ICAgICAg
ICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjk6ICAgICAgICAgICBGQVVMVCAg
KG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjEwOiAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAg
UlBNKQ0KPiA+IGZhbjExOiAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZh
bjEyOiAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjEzOiAgICAgICAg
ICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+IGZhbjE0OiAgICAgICAgICBGQVVMVCAgKG1p
biA9ICAzMDAgUlBNKQ0KPiA+IGZhbjE1OiAgICAgICAgICBGQVVMVCAgKG1pbiA9ICAzMDAgUlBN
KQ0KPiA+IGZhbjE2OiAgICAgICAxODAwIFJQTSAgKG1pbiA9ICAzMDAgUlBNKQ0KPiA+DQo+ID4N
Cj4gPiByZWFsICAgIDBtNC44NjVzDQo+ID4gdXNlciAgICAwbTAuMDIzcw0KPiA+IHN5cyAgICAg
MG0wLjAwMXMNCj4gPg0KPiA+DQo+ID4+IC4uLg0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsJZm9yIChp
bmRleCA9IDA7IGluZGV4IDwgY291bnQ7IGluZGV4KyspIHsNCj4gPj4+Pj4gKwkJdTggY2ggPSB0
YWNoX2NoW2luZGV4XTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArCQlpZiAoY2ggPj0gU1RBUkZJVkVf
RkFOX1RBQ0hfQ0gpIHsNCj4gPj4+Pj4gKwkJCWRldl93YXJuKHByaXYtPmRldiwgIkludmFsaWQg
dGFjaC1jaCAlZCwgc2tpcHBpbmdcbiIsIGNoKTsNCj4gPj4+Pj4gKwkJCWNvbnRpbnVlOw0KPiA+
Pj4+DQo+ID4+Pj4gVGhpcyBzaG91bGQgYWxzbyByZXR1cm4gYW4gZXJyb3IuIEFsc28sIHRoaXMg
aXMgdGhlIG9ubHkgdXNlIG9mDQo+ID4+Pj4gcHJpdi0+ZGV2LCBhbmQNCj4gPj4+PiBwcml2LT5k
ZXYgPT0gZGV2LiBwcml2LT5kZXYgaXMgdGhlcmVmb3JlIHVubmVjZXNzYXJ5Lg0KPiA+Pj4+DQo+
ID4+Pg0KPiA+Pj4gVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGF0IG91dC4gSSBub3RpY2VkIHRo
YXQgdGhlIGBzdHJ1Y3QgZGV2aWNlDQo+ID4+PiAqZGV2YCBwYXNzZWQgaW4gdGhlIGZ1bmN0aW9u
DQo+ID4+PiBzdGFyZml2ZV9mYW5fdGFjaF9jcmVhdGVfZmFuKCkgaXMgc29tZXdoYXQgcmVkdW5k
YW50LCBzbyBJIHBsYW4gdG8NCj4gPj4+IHJlbW92ZSBpdCBkaXJlY3RseSBhbmQga2VlcCBgcHJp
di0+ZGV2YCBpbnN0ZWFkLg0KPiA+Pg0KPiA+PiBKdXN0IGZvciB1c2UgaW4gdGhpcyBmdW5jdGlv
biA/IFdoeSA/IEl0IGlzIG5vdCB1c2VkIGFmdGVyIHByb2JlLg0KPiA+DQo+ID4gQWZ0ZXIgcHJv
YmUsIHByaXYtPmRldiBpcyBhbHNvIHVzZWQuIEluIHRoZQ0KPiA+IHN0YXJmaXZlX2Zhbl90YWNo
X2NyZWF0ZV9mYW4oKSBmdW5jdGlvbiwNCj4gPiBwcml2LT5kZXYgY2FuIGJlIHVzZWQgZGlyZWN0
bHkgYXMgd2VsbCwgc28gSSBwbGFuIHRvIHNpbXBseSByZW1vdmUgc3RydWN0DQo+IGRldmljZSAq
ZGV2Lg0KPiA+DQo+IA0KPiBBcmUgeW91IGNoZWNraW5nIGlmIEkgcGF5IGF0dGVudGlvbiA/IHN0
YXJmaXZlX2Zhbl90YWNoX2NyZWF0ZV9mYW4oKSBpcyBjYWxsZWQNCj4gZnJvbSB0aGUgcHJvYmUg
ZnVuY3Rpb24sIG5vdCAiYWZ0ZXIiIHByb2JlLg0KPiANCg0KU29ycnksIEkgaW5pdGlhbGx5IG1p
c3VuZGVyc3Rvb2QgeW91ciBwb2ludC4gWW91J3JlIHJpZ2h0LCBJIHJlLWV4YW1pbmVkIHRoZSBj
b2RlIA0KYW5kIHJlYWxpemVkIHRoYXQgcHJpdi0+ZGV2IGlzIG9ubHkgdXNlZCBpbiBzdGFyZml2
ZV9mYW5fdGFjaF9jcmVhdGVfZmFuKCkgZHVyaW5nIHByb2JlLCANCmFuZCBub3QgdXNlZCBhZnRl
ciBwcm9iZSBhdCBhbGwuIFNvIGl0J3MgaW5kZWVkIHVubmVjZXNzYXJ5Lg0KDQpJJ2xsIGZpeCBp
dCBhcyB5b3Ugc3VnZ2VzdGVkOg0KDQpSZW1vdmUgc3RydWN0IGRldmljZSAqZGV2IGZyb20gc3Ry
dWN0IHN0YXJmaXZlX2Zhbl90YWNoX2RhdGEuDQoNClJlbW92ZSBwcml2LT5kZXYgPSBkZXY7IGZy
b20gcHJvYmUuDQoNCktlZXAgdGhlIHN0cnVjdCBkZXZpY2UgKmRldiBwYXJhbWV0ZXIgaW4gc3Rh
cmZpdmVfZmFuX3RhY2hfY3JlYXRlX2ZhbigpIChwYXNzZWQgZnJvbSBwcm9iZSkgDQphbmQgdXNl
IGl0IGRpcmVjdGx5IGluc3RlYWQgb2YgcHJpdi0+ZGV2Lg0KDQpUaGFua3MgZm9yIHlvdXIgcGF0
aWVuY2UuDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg0K
