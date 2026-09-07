Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2133.outbound.protection.partner.outlook.cn [139.219.146.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95365448393;
	Mon,  7 Sep 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773143; cv=fail; b=SbF66pNHAk9UXRFPndV8I2K4pZ5Zj8XEV1Gzoatds+cGbRdSFWwXmsAKZdlfCQmsgZ5Did1BF9kx7M8RsXIlyMHksAbMFL2OxYVMPbl9bOoNdpUpCgiDrWfnUuFHzBfYk8Ze/xaC8YHzr09FS91igJ4U4yT27U2+MOlt6wnZ/eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773143; c=relaxed/simple;
	bh=CiVEviNFOo7rde+xyED8EWDMQjBAqexkokxe9G1+Cww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rdGOnIgV+FQZJQo6oy9tqz8GYnPyWLBm9GTa0zW76pCJIrJoJQXz0MoMVGNaOaI/vmvnyP9YQQGQE/o9zVMAcWgGsYLNLopVn19Addzc4OwghK23nrn8Ao+eDORVd43bW3/di1p1FcLwd7emq25vggDhExI+H480MxbXRbjgl0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkctB3BEYsC+aG/GyBNyMjNiO30zCLkxc92U8W3l/tlS+uwvjukMaXNf8unZmy9/uc6WENXa+Vx9dHpLxUAzS9ISwZYNabm+IZaId9jk0BnoN/bS1q7q65q8UkpmXeJAcitAD3BhXqD9neeR0sLW5YwZTbTmnvzNJRv07FLZM82m1sjYj+ZyLpnl3+XYk8h9awZe8+81qqvRjrw1l/5Tev3ViX6zmSJXyqs5jrVo6JdLlNyL+h/AsB4/+rJ2w1qJ3H43/Zmgq9ZBenpb3uUp04cvUPi0rkv6pLWo1j17ZiL7glxICOmZF5EX+kX5JUa7GWhHhRItEz88e7mTX4PJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiVEviNFOo7rde+xyED8EWDMQjBAqexkokxe9G1+Cww=;
 b=ekzvhTcSL5we7jTkYQNeZpA5X4yU+HMkmRGAj++CRKdeBdhrLvfrwYX4Gi+BXdfsM7TkZXiL55r7C+Bk5knKY5vVpXU8tYIfpL4dNAl3gDmaNkkWpCV7+m82k3YrBcNVkZSE/5b4w3qyIPVc80HzAaPelgWAvBP7LicuyTjBMMIBYpjSpra/gRmogslNgaUpmRPBiDUOUfD853q7hD7JOmA5el0T8Tkxs2R34u92yZmB2solLwJM/PeH6L4GuPdZcby8E/foTA/ZRksGkaXll02aoWf3iOAkqjLn5/b+tNeu+O2LbGt+vm4/9d+QQAsM6Myj1vU77fzDtqqGoxT2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Mon, 7 Sep
 2026 02:51:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 7 Sep 2026 02:51:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Thread-Index: AQHdOB2pWGWmLpoNUE2Go4xzfaaD97a4XHIAgACUoYCAAJPygIAAXoiAgAiT2BA=
Date: Mon, 7 Sep 2026 02:51:44 +0000
Message-ID:
 <ZQ4PR01MB1202328B1B28955A0C6DF44DF2B22@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
 <20260831-dominion-data-c8b6f691dd5b@spud>
 <ZQ4PR01MB12023835F6083F45484E1ED3F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260901-contrite-cathouse-f50c63af6323@spud>
 <4cc20c64-bd95-4689-81b3-3f01d9c3bc8e@roeck-us.net>
In-Reply-To: <4cc20c64-bd95-4689-81b3-3f01d9c3bc8e@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
x-ms-office365-filtering-correlation-id: acbff189-d4f2-461f-1232-08df0c8af3d9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|3023799007|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 gj69jv1GVu6vlVnhMHuvWIdKqZzPFUfKcn8PUyZ9rOacNDdMcYRWL/oeCCPLKOJpNrVdspxWV7I4cTMrpPXO7zFt743zCLntoxokAva8gXQmWpsU8EPPwubHjjKAkqYCkPIIGPZAXE3AqBkmwm523fiLhHqLFMIi2jVASUVwMk97DJmmGcHtqPbtUfHwwzirTpFk1NSa190iJtsixEjiaR2DkOMvnDbp6a2mHEI2Zp9dssFCn53EVAPreSRuM+s+iK9iT2wo5ShiQX/v1fPDM8KmXqpgcb//DdoIUtKw9brainldI6AnHXoOG6B/SToGqNlIxGoyHBiajCg61BNmBzjmwDUaWmaUWVTQt+jJZXeMQ8Ge23G00zWkfds5NiR3QujoAC4cQX4WtcF1x+uhOzJpGjlP5tjECjlNUKBi2yPkAFlZBcSuYeWDjidH40HaS3DvIStHCWYiPGAuQun9ADDyLfHlRC1+3z1J7HSGTvQHzgvbGPkSKqyGI70o7Q06d1o8bnae8t4OcCoSCcMPPlr5D2gT/sesREM62sqZxAy39mBdKZAgIMn6laWqAYFp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eU9NZ1lub1d2OFVUMXRzV1Q4WExiYXFPdmdHamdiMW1Fa2xiK3k4UlRNZGR0?=
 =?utf-8?B?cXV3WkpvbG5oRk9jcEEvUmFWUVBDeVh0Qm15eHlIOEZFWjJpbTREUktVZ1lH?=
 =?utf-8?B?OHRUaVg3UE5scDNUaVBvNmZ2NkNGVHM2ZnpPaHB3M2dRMlhXYzRCN2RiZk9l?=
 =?utf-8?B?dmNobWdTdSt4NTQ0MG1tOHVYa08zbjlaUmhPTlNPMlBwVllRa2U3M0xZTmdh?=
 =?utf-8?B?dzMrbVFUamtCRHZFV2c3a1hWZ3BjL1NyUk1GWTZTYzRoNFJZZlQrRU84dXNr?=
 =?utf-8?B?K0ZLeGRVNlUxcklZU1M2UmpBbXVaNzBZRC8xNk1TdnBDVmlWaHRVV0V1N2tV?=
 =?utf-8?B?UWMxd0dTb1FXZzY2VnFUMEw1b0Zsb2RzTzlXK3RGaldaN2FWV0VDQW11bTFa?=
 =?utf-8?B?OENZbklhbFhqQmRGK3JQQTRvNzU3TWlGczlyYmM3ZDVaY0pXYnRkRWIrc3p0?=
 =?utf-8?B?Vnl4bVRWNFRPbDZPTTBLeDVxMndHTFNPYndRcTR0TVZBcWdkTXVJby9CS3lz?=
 =?utf-8?B?TkFZd25yS3U1VzhqMmhtVk1sVFMrOGx1VWFIcUtYWFFMSy9naUtXd2hoVTBI?=
 =?utf-8?B?MXh6T3VEMEtWVjhQcS9Bd3poWkxxRGs3ZEpSYjBtdHN0NEIyTFZLRHRqbEZl?=
 =?utf-8?B?cU8waWQ0a0FaSmdFeUJKMzBsbUYzeTdCTWlwaGJTOWE4YTkyMzd2eGZMOS9k?=
 =?utf-8?B?U2pKN2YvVzRFQjMyTGFodXFmZ21WTk5hdm1kcWhFejZiZVZEWDh3SWlXYXd5?=
 =?utf-8?B?aG9KZDhuTnFvOThRb3ZzclRjMXdnRi9tS2IzRnB4S0djY3dEWVRmN2xiZmxz?=
 =?utf-8?B?bmIzWXE1d2hjQ1hvZGxjeDlEQXpsUEpYVkwyV1ZOM2lmUlU0M1g0OGJES0c3?=
 =?utf-8?B?UW9UVmZrRjVEQ3BCcWhoYmFQNFFOWURNVzladHByZkk1RXl0UWJIMjgwRFla?=
 =?utf-8?B?M3JLTGJnQkRZSEJqRzBwbkd6cCtrNm5RZTBGYVNaek9oMWszcjJBLzBlS2FD?=
 =?utf-8?B?Vys1ekF3SnRvZEdWaGJ5QmE0UUl5ZjkvakxTenJxQTlXSk5YL2pOL1Frckln?=
 =?utf-8?B?cnJPR2RsaGcvdE1na2JBZExZWXVua1hhM0F5WncvcS9GMmZqWWtKMkpaZnYw?=
 =?utf-8?B?K0xIbmkyazRURXpJaVRCMjdqZGdyWXoxa2c1bEVwVGkwNEM0M3FHKzY3cVRC?=
 =?utf-8?B?cWZJMDJDV3N4T1pYck1lSDI4R2xseHRmQ0UrT1pBQjRsVzFWRGlyZC9ETmth?=
 =?utf-8?B?dzIwVFF5bDh5TzNPeTBueEtUWmU2TW5uODRSOStyVjQ3WEw3V3dXTWtoNVo1?=
 =?utf-8?B?NkVEZGNhUzljNGNFQzJLajNRUUJaWUJWcHpUWUgydFlsOGUvL2YyRUZsZXJX?=
 =?utf-8?B?UzEzM0pIYmdMK3VFTmxqSDVLVkg5V2d3djdXc0J4a3hKMHRqVSs0TUsxK29t?=
 =?utf-8?B?QmV1QnV5c2lnbkhKYjhCNWJlZHQ1SGlHZm1wR2tPQm9XN1lpZ3V1NVpPVExp?=
 =?utf-8?B?SEFjUEdsbzlrTjE1Y2VLQzh4OFhRUENFRlBLbXNkcEFjMEZXai9KbjZ6MndU?=
 =?utf-8?B?WWxOL3drTFBVSVQ5MDIyVmZQdFp2YjZxSElmM3RyZFhLUzdCTjRiRWVnQTha?=
 =?utf-8?B?YU54R1FlcU5IWDZlQTE1NnJyUWx2dmxZaHFDVzFQWERZSjFyNUpQK1RpZFBI?=
 =?utf-8?B?NWRmSjZ0bEo1eUd0R04rUjU0NWJCQnM0UXN1TDJRWGNPUVMreU8rYi9YNy8w?=
 =?utf-8?B?VHFFWFZSR0xwOHRKOHZ6a1YraXBWdk9MR2VQTU5HOVIvNGZGd28zbW8zKys2?=
 =?utf-8?B?VlcwL3RQc3JBa0xXZ3Mza0FLd0RuWHFTSDdhVUg5ZG1xSytHWVdMZ2h1S0JF?=
 =?utf-8?B?SmcwUTFJTnBBYkhiYUVtWHk5b0Z5Y0tDMUorSVlaQlc0Q1F5b2FLanZ1R2hS?=
 =?utf-8?B?ZHpBK1JWeW5XVzA3VHgwNWNsdU1Uc3dVYysxek5QU0NtQUxZR3NtZzJyc0Fz?=
 =?utf-8?B?WGt1TTNDY0JIMmtqdkxZd2FpZ0V5emlSZ3Vmb1dIbk1ENS9TUUFSUmx1Ync5?=
 =?utf-8?B?TDlBL2RTN21pcXlXbXRhblN1UjdxZkd6enhUcXRhalk4Rk52TjNxZDZMdUpV?=
 =?utf-8?B?RDgxSWlrSlJyWktZaE1jYUNHVDhkVGh3Yi9aeFNheFRmMVNXZ2NDU050K0RZ?=
 =?utf-8?B?UWxpWGpEa3NibTNlOGl6TWdjVDRyWUxUYUdxcUJpTG9PcVQ3cHJScUhOMnpM?=
 =?utf-8?B?R2ltNXVCcnJlekJFVElZam8wUE5nYjYyOFN6VkZJc0R4VTljN2xOZ2lONDVV?=
 =?utf-8?B?ZHhWaDM0SWVmamRwbUpUSyt6azB2ZGpNZWQycXNFS05PNUNOMnZNVmNwTWI2?=
 =?utf-8?Q?6pxlQsFAOH0jDTlk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: acbff189-d4f2-461f-1232-08df0c8af3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 02:51:44.5884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTPdjTSnL8+om9gFMxiRDWwQ3sqHdJE2MeMBfry5lv9tGMAu9pvxQ4aisKf8O6EMYzGVngM1BfpCdbANA1pwa2pbm9XB6AVzfWaade6br9a6Wwayth7YTN0yUXhtUUFE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

SGksIEd1ZW50ZXIsIENvbm9yDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBPbiA5LzEv
MjYgMDM6MTQsIENvbm9yIERvb2xleSB3cm90ZToNCj4gPiBPbiBUdWUsIFNlcCAwMSwgMjAyNiBh
dCAwMToyNDozOUFNICswMDAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+Pj4gT24gU2F0
LCBBdWcgMjksIDIwMjYgYXQgMDY6MTk6NDBQTSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90
ZToNCj4gPj4+PiArcGF0dGVyblByb3BlcnRpZXM6DQo+ID4+Pj4gKyAgIl5mYW5AWzAtOWEtZl0r
JCI6DQo+ID4+Pj4gKyAgICAkcmVmOiBmYW4tY29tbW9uLnlhbWwjDQo+ID4+Pj4gKyAgICB1bmV2
YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4+Pj4gKw0KPiA+Pj4+ICsgICAgcHJvcGVydGll
czoNCj4gPj4+PiArICAgICAgcmVnOg0KPiA+Pj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+
Pj4+ICsgICAgICAgICAgUFdNIGNoYW5uZWwgaW5kZXguIFRoZSBkcml2ZXIgYWxsb3dzIHR3byBm
YW5zIHRvIHNoYXJlDQo+ID4+Pj4gKyB0aGUNCj4gPj4+IHNhbWUNCj4gPj4+PiArICAgICAgICAg
IFBXTSBjaGFubmVsLCBvciBlYWNoIGZhbiB0byB1c2UgYSBkZWRpY2F0ZWQgY2hhbm5lbC4NCj4g
Pj4+DQo+ID4+PiBEb2Vzbid0IG1hdHRlciB3aGF0IHRoZSBkcml2ZXIgY2FuIGRvLCB0aGUgZGVz
Y3JpcHRpb24gc2hvdWxkDQo+ID4+PiBkZXNjcmliZSB3aGF0IHRoZSBoYXJkd2FyZSBzdXBwb3J0
cy4NCj4gPj4+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQNCj4gPj4+IERvZXMgdGhpcyBmYW4t
dGFjaCBjb250cm9sbGVyIHByb3ZpZGUgdGhlIFBXTXM/DQo+ID4+PiBJZiBzbyAoYWx0aG91Z2gg
R3VlbnRlciBtYXkgY29ycmVjdCBtZSksIEkgdGhpbmsgdGhlIGZhbi10YWNoDQo+ID4+PiBjb250
cm9sbGVyIG5lZWRzIHRvIGJlLg0KPiA+Pj4NCj4gPj4+IElmIHlvdSBkb24ndCBkbyB0aGF0LCBJ
IHRoaW5rIHlvdSdyZSBnb2luZyB0byBydW4gaW50byBwcm9ibGVtcyB3aXRoDQo+ID4+PiBoYXZp
bmcgbXVsdGlwbGUgbm9kZXMgd2l0aCB0aGUgc2FtZSB1bml0IGFkZHJlc3Mgd2hlbiB0d28gZmFu
cyBzaGFyZSBhDQo+IHB3bT8NCj4gPj4+DQo+ID4+PiBJIHRoaW5rIHdoYXQgeW91J3JlIHN1cHBv
c2VkIHRvIGRvIGlzIGRyb3AgInJlZyIgYW5kIHJlcGxhY2UgaXQgd2l0aA0KPiA+Pj4gInB3bXMi
LCBidXQgb25jZSBhZ2FpbiBHdWVudGVyIG1heSBjb3JyZWN0IG1lIHRoZXJlLg0KPiA+Pj4gZS5n
LiBhc3BlZWQsZzYtcHdtLXRhY2gueWFtbA0KPiA+Pj4NCj4gPj4NCj4gPj4gUGVyaGFwcyBJIGNh
biByZWZlciB0byBhc3BlZWQsZzYtcHdtLXRhY2gueWFtbCBhbmQgY2hhbmdlDQo+ID4+ICJeZmFu
QFswLTlhLWZdKyQiIHRvICJeZmFuLVswLTldKyQiLCB3aGljaCB3b3VsZCByZW1vdmUgdGhlIHJl
Zw0KPiA+PiBwcm9wZXJ0eS4gSW4gZmFjdCwgdGhlIGRyaXZlciBkb2VzIG5vdCB1c2UgcmVnIGVp
dGhlci4NCj4gPj4NCj4gPj4gT3VyIGZhbi10YWNoIGNvbnRyb2xsZXIgZG9lcyBub3QgaW5jbHVk
ZSBQV00uIFRoZSBKSEIxMDAgU29DIHdpbGwNCj4gPj4gaGF2ZSBhIHNlcGFyYXRlIFBXTSBjb250
cm9sbGVyLiAoVGhpcyBjb250cm9sbGVyIHVzZXMgdGhlIHNhbWUgSVAgYXMNCj4gPj4gdGhlIEpI
NzExMCBTb0MsIGJ1dCB0aGVyZSBhcmUgc29tZSBkaWZmZXJlbmNlcyBpbiBkcml2ZXINCj4gPj4g
aW1wbGVtZW50YXRpb24uKQ0KPiA+Pg0KPiA+PiBUaGUgSkhCMTAwIGhhcyA4IFBXTSBjaGFubmVs
cyBhbmQgMTYgZmFuIHRhY2ggY2hhbm5lbHMuDQo+ID4+DQo+ID4+IFNvIGN1cnJlbnRseSB3ZSBl
eHBlY3QgdGhlIERldmljZSBUcmVlIHRvIGJlIGNvbmZpZ3VyZWQgbGlrZSB0aGlzOg0KPiA+Pg0K
PiA+PiAJcHdtMDogcHdtIHsNCj4gPj4gCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEwMC1w
d20iOw0KPiA+PiAJfTsNCj4gPj4NCj4gPg0KPiA+Pg0KPiA+PiAJZmFuMDogcHdtLWZhbjAgew0K
PiA+PiAJCWNvbXBhdGlibGUgPSAicHdtLWZhbiI7DQo+ID4+IAkJcHdtcyA9IDwmcHdtMCAwIDQw
MDAwIDA+Ow0KPiA+PiAJfTsNCj4gPg0KPiA+Pg0KPiA+PiBmYW4tY29udHJvbGxlciB7DQo+ID4+
IAljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEwMC1mYW4tdGFjaCI7DQo+ID4+DQo+ID4+IAlm
YW5AMCB7DQo+ID4+IAkJdGFjaC1jaCA9IDwweDA+LCA8MHg4PjsNCj4gPj4gCX07DQo+ID4NCj4g
PiBUcnVuY2F0aW5nIHRoaXMgZm9yIHJlYWRhYmlsaXR5LCBidXQgaXQgbG9va3Mgd3JvbmcgdG8g
bWUuIEhvdyBkb2VzDQo+ID4gdGhlIGZlZWRiYWNrIGxvb3Agd29yayBoZXJlIHdoZW4gdGhlcmUn
cyBubyB3YXkgdG8gZGV0ZXJtaW5lIHdoaWNoIGZhbg0KPiA+IGlzIGNvbm5lY3RlZCB0byBhIHRh
Y2ggY2hhbm5lbD8gVGhlIHVuaXQgYWRkcmVzcyBvZiB0aGUgY2hpbGQgbm9kZXMNCj4gPiBoYXMg
bm8gZHQgZW5mb3JjZWQgZ3VhcmFudGVlIHRvIGxpbmUgdXAgd2l0aCBub2RlIG5hbWVzIG9mIHRo
ZSBmYW5zIG9yDQo+ID4gcHdtIGluZGljZXMuDQo+IA0KPiBOb3JtYWxseSAoZm9yIG90aGVyIGZh
biBjb250cm9sbGVycykgdGhlIGZhbiB3b3VsZCBoYXZlIGEgdGFyZ2V0IHNwZWVkLg0KPiBUaGUg
Y29udHJvbGxlciBtZWFzdXJlcyB0aGUgc3BlZWQgYW5kIGFkanVzdHMgcHdtIG91dHB1dCB2YWx1
ZXMgdW50aWwgdGhlDQo+IGZhbiBzcGVlZCBtYXRjaGVzIHRoZSBleHBlY3RlZCB2YWx1ZS4gVGhl
IGNvbnRyb2xsZXIgbmVlZHMgdG8ga25vdyB0aGUNCj4gYXNzb2NpYXRpb24gYmV0d2VlbiB0YWNo
b21ldGVyIGlucHV0IGFuZCBwd20gb3V0cHV0IGZvciB0aGlzIHRvIHdvcmsuDQo+IFR5cGljYWxs
eSAoZm9yIGNsYXNzaWMgZmFuIGNvbnRyb2xsZXJzKSB0aGF0IGFzc29jaWF0aW9uIGlzIHN0YXRp
Yy4NCj4gSW4gdGhlIEFzcGVlZCBHNiBmYW4gY29udHJvbGxlciBpdCBpcyBkeW5hbWljL2NvbmZp
Z3VyYWJsZS4NCj4gDQo+IEkgdGhvdWdodCB0aGlzIGlzIHRoZSBjYXNlIGhlcmUgYXMgd2VsbCwg
YnV0IEkgaGF2ZSBubyBpZGVhIGlmIHRoYXQgaXMgY29ycmVjdCAob3IgaWYNCj4gdGhlcmUgaXMg
YSBjaGlwLWludGVybmFsIGZlZWRiYWNrIGxvb3AgdG8gc3RhcnQgd2l0aCkuDQoNCkhlcmUgaXMg
c29tZSBpbmZvcm1hdGlvbiBJIGZvdW5kIGFib3V0IGZhbiB0YWNoIGFuZCBQV00gY29udHJvbC4g
SXQgbG9va3MgbGlrZSB0aGVzZSANCnR3byBkZXZpY2VzIGFyZSBtYW5hZ2VkIHRocm91Z2ggYW4g
YXBwbGljYXRpb24uDQoNCkRvIHlvdSBoYXZlIGFueSBuZXcgc3VnZ2VzdGlvbnMgZm9yIG1vZGlm
aWNhdGlvbnM/DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250
cm9sL2Jsb2IvbWFzdGVyL1JFQURNRS5tZA0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoN
Cg==
