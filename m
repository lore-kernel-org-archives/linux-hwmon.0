Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A4399D10;
	Mon, 29 Jun 2026 06:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715010; cv=fail; b=oR7IH+pI6xDvIzecJCzlNICp0o0IAYapsaWtDQG3u5fYJOv8fud7vCVv6SNwWFUr89E4z+Ys5Sx8rK8nw59J5rfjn60cxa8hnZ0Sra0X7scOS6SJTM4RQ6j50z7ie5SsxoF9UVTXu10QDx76Wpe3wF9jNr9LTWRRpote9Sc3Tfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715010; c=relaxed/simple;
	bh=3C7s3hI3YWuTnd/QB5k/iZY97DVc42zMd+5cwmiT7PY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cwxFmUbyORObpMNoWosCdJyn92BoHpAsvflX6+ppJW5wTvvXXi6KkCvB03Bqg9Zn1lkMm85k8TgXiw9PjtbpQBuBQq1oNRKGws4VJz5QproYuZQ198mlpgSyZybSI2VxOFmL7+z6N9fW1Gl1/4c4qdd7tfCvu12l+k3e4dyZvrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WCY2KnMM; arc=fail smtp.client-ip=52.101.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WCY2KnMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9go/yxndEJZ0+tHU3yTLaSw5r/8DVe3J3i/SikKFiXXVRke1OlPeNV3TZwtY5zipVQTsnsOf1nscLPeQj7ziQGHKQMW1tm/ew5FLuBx5bbctndUkoaiLVW5nV4+WcCntgeZIhNZXtITp5hHxOYOKu5db+I+0lbJitYx8rz1VGkidz69MebixxonRX3i+2MRju3t7dMrNjMyedIdCJN/YfmYfh2BlVrwzpIj/LX9CoOhx39bBcsQ7ctOfyVaCJI4K3Z/5yw47EoPhrIh7UqMK7Ox5aaaFocF6XU2nc+KiASSTBQ4fR+kinCfdZgoLrDmg0defg14oPu79W/XncAX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C7s3hI3YWuTnd/QB5k/iZY97DVc42zMd+5cwmiT7PY=;
 b=L+p4csb/loq7+6cx2iDTi8piGIaohllmxpHeEIg/Z6+MDhTmeuLgD3JjJolFnw3gn7GpIJ7exoiq+rYzMEc5+m0Y3tQ9a/ktc2MWsmDz3i8Y+vQWOBDs2k5pLcDO3DWpBG2hGOlyelKD/gSEg+6FcRew3NZJG68gLOJfBb18D0khegMtc8s6k6DS2iyiRaALk/w2fZ7UG39nU+nlhikrJOA58SVgP/nrJCLv916C/wjX6TKkSdZRLYQWpW2lR+HSWGX8XTrV9Ne49YlxKkrwjV2qwiZexJ3QyJvMmxZFP5dsfdL7M1KapTsSEXkZeqzJJPCxuTm8xeexW49eIno1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C7s3hI3YWuTnd/QB5k/iZY97DVc42zMd+5cwmiT7PY=;
 b=WCY2KnMMHo5RPAK1mVAhSMcOk530xa9P7l2ZK0nd8UkZPr7dhf2p6zuOChOm/lcv8v7Valz9+0i30llXWbs0OfOgSslD8GyYwRh5jSXo/FLN3edUK4ps2E6ioO2xHlfWhV3Wv4FlNEKcSqVsc5Y/bVqetq/EmNO79xOUHtrPD6kQz+HbwSNPsCxhFyJBKmS4AOmAORSxFG5KDCTPsa46dlbvQk2wo7wfulU3KJ1sHC0zutLX8N8r92EJrHaVfUqOK65E0NpgDhgtSZYuLcjwMyFrz69BwMyryGQgWK/u/UkJtvqvJGCItXaIrEa4+vKhEVY734syS3cTDvOCspTC2w==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SJ2PR03MB7330.namprd03.prod.outlook.com (2603:10b6:a03:562::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:36:35 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 06:36:35 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen
	<dinguyen@kernel.org>, "Rao, Mahesh" <mahesh.rao@altera.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: firmware: svc: add hwmon property
Thread-Topic: [PATCH 2/5] dt-bindings: firmware: svc: add hwmon property
Thread-Index: AQHc/891/Xq4wGq1dUibTWAU1rwo3LZKoMyAgAqC1gA=
Date: Mon, 29 Jun 2026 06:36:35 +0000
Message-ID: <44846bfd-3a04-4069-95cf-6ce047f668ed@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
 <20260622-straight-honest-cuttlefish-1a88fb@quoll>
In-Reply-To: <20260622-straight-honest-cuttlefish-1a88fb@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|SJ2PR03MB7330:EE_
x-ms-office365-filtering-correlation-id: 7bc30333-77e8-40fe-ac80-08ded5a8c3f7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|55112099003|3023799007|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 WG/wge22usTSbLSu/2NT817sIYQSC3nx5zKvIlKKQaTuqRwHwkWahu6iABXiraWOMt1cHtUC4rVJRvMnIyKRC27jk8AgrpjG3/luGffsEBKyEJ/CL/8PLwBnhSSB8ZNw1K0NQlq7b1/7pouVAOrsqQARwTZqZWACf/yMLdf0xLujqRP9fqdJcMCH+QJAtHyCtMYpkyLGwdD4f5P7zdxF5/9JamxCzPWAq+gipZTGB3vL9BlsOHiFpx1UhgtVsw3orS1kFw+bV7dCOK26eaRgbf0v8cpodAAGifh/J5VQLpvYbRdwTs1GEcez1FrhkRwwB3Ss2XimQAnRQyZtjlxYlVIbWh5+zsnhr6YekrGBJqP6HMb87BMfw0DcDM4rji/CkIPydZUCWutLCwobE2ARiNhfd3RWf2ncSDLS2evhnoOu9xMZis87X9IzcW44cwRILme13l8sjYjLKTinT6FgWSF6hAI6l/CWbIzufZce21YUPWe6jWjgzrgaUFAEefxG2LihxCX8xgZ4mw2z/Iw289001yvzSlY9fX4xzNIbiPLaY1ZzjZLQl7Qg0NPySVbpBtwefSbAOfQSyJgl9wENnEa+IWuj2uM/PEkKUnDYxYvNT0eUsfs+5i6VfMnq7qDxjivvVvnAFrVFVcfP1dYRVrPohlrMusuk1xnO7fjZFz0ENTsGPVZ8HL4hVf6msDMPyztKbC+kpMpV0ZdBfkQ1KZ0/yeiRWVZCrlZrCbGspck=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(55112099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVM0akkyRGtsQnNQUVNEWGJ4WEtBaVNkZWhTcE1MVUtsbXhWODRybkN0UlJR?=
 =?utf-8?B?Ny9wNXhmcVJ2TmZxK2JpWFFCa21zRWpKeEU1UlVtWXU2V1hienZvNWVDRHRK?=
 =?utf-8?B?ckdRd3BkK0hRakwxSHppbXRndEREaWRiZlhxNXltMThxV0ZISzA3TjZSVGgy?=
 =?utf-8?B?WkhFL3FFaVl1VDVJOXZwTktwS1RkWFh0T09LTGlEZ0EvUFp6cDgxZnBsa3lJ?=
 =?utf-8?B?Z08vVVZVV1Vsd2I5ZzBKQTB2OGxlNlZJQ3dneGFHaXRlbkJjSHZReGFTcFNZ?=
 =?utf-8?B?R3NLWHBkdmxaaG9pazBIZUlaZm43TnBtL1d2bk1CWjJQamlJWktZZWhnbmp6?=
 =?utf-8?B?Qzg3VjNXdlEyamVreVhoSzlsT1gvSWltQkxKTDF6dW9EaDBZRlZrWHArL1lj?=
 =?utf-8?B?SkJMWjNzRU9OR1psS2ZkdlJqdFJwYWswQ0l1bTJhbjhONEs4R2FVZ2pKK3dz?=
 =?utf-8?B?Yk5uK3VvQ1N5aERhUmx0bzZUUEc2N2RYVEJZWnFvTER4bHlaeTRUaWhTYWRU?=
 =?utf-8?B?dnNxTk9pTXRnNmd4bnAvY1ZXRlpsR3JvZEU4UU9jZDM3VXlKa2pkbDZyd1lq?=
 =?utf-8?B?N1Y2dWxEOFpVNCtWSE1Jb1hRS1BPYXprSmFUQXFrNDRYdkhUclpQUnNkVTFs?=
 =?utf-8?B?RnBiNHFkOVE2MGtaczcyMW5aYW1LUndnL2dueGlSTzYwSlFKU1JnZ0tpb0Fh?=
 =?utf-8?B?ZWZzb21WUloydlpJWGdjQTdIM2ZING45cElKamsxZmNIeTB3M2g5UWRLc1I1?=
 =?utf-8?B?ODBNb09oU2ZyTEFYMW51amdTVHBrdk5FMlZsbTU4cnlBWTBGV0UrRDBBMzJG?=
 =?utf-8?B?RmNmY0xFUkoxcTZSVWpNVFBxNnNmdEV3M0lidnVKNG1EY1d6WmNKaThqSThx?=
 =?utf-8?B?eTVqQmFYdHUwY0lQSzg4SGhRZGVIRXRNdG5KZ0IzMmJDK1FIZTBGaXBIdWZp?=
 =?utf-8?B?am5XTU5YVFgzTVNXakVBZktEa0xuNjNTakFLbzUyeXJuZldYbTJPYnJOM20x?=
 =?utf-8?B?ZXIrNEdUdGFuaFk0cG9JY2ZDNHIwa0Z1a2tFUHg3cVo2RUVzcnNOd1lqcVBK?=
 =?utf-8?B?OUwzV3YrTWpVTHZTOXpuRUd4QVJCZmx4SjFMenZqbllyNDhqVGlCUitoL1Zk?=
 =?utf-8?B?MkEwZFA5TDZkdDdJZ2hGaEJwNHlYMTgrZ1VhT2d4cG0yTkZjb1kvRHNLMnpT?=
 =?utf-8?B?VzU1S1g1eGRPbWpsaEJRbnNkMnY5bUxEME5Yd2RiY2VqVkhvek91bVNoaEFq?=
 =?utf-8?B?Vmp0Wk1vS0sxc1pHdmtFbTh1Z2tQMXgvRTEvRU5WTUdJR1QxT0RqN3pVR0ti?=
 =?utf-8?B?NG9xby8zdU5iMTg1L3hRK2YrTFJqRmZyaG1GV3ZVVjdpRkgwVXhmbWE5MkdF?=
 =?utf-8?B?VmhuRGJUZlBEcnA2YUl5WnN1WWJlQkRScDh1M1o4M1pKRTZuYzkvYnhWbXMy?=
 =?utf-8?B?Q2k4Z0srK0lrUEF0K1VUQXppa2tCTXAxMmtGUXdxWHJ2Tm02UXYxbGcraHhY?=
 =?utf-8?B?UjB5RXJOTjZlSG1XNldrT2RSSXQyUHY0ZkZRQ0hWOXowYTBTTkpZd2V4OVV4?=
 =?utf-8?B?TzlVc21OUlpJTGVUVlhIejZHMkFJd2ZQbjl6cVUxblNrNTFsUGxPVHFJa285?=
 =?utf-8?B?ZVdXVkNMeDlPR2lhNTJ6aWF4Vk5hZ2gvbGYzNDV0OU8rZE54ZWpTODN4UDA0?=
 =?utf-8?B?ejB0WVc1Znpma1Y2bStQVTNlbXpTVUJuK3pCaVp1SmN2NENzSC9kUUdML3Aw?=
 =?utf-8?B?VGsvVVB6UEVDYUJXZE1ZN1FERlhxTjhhWWdlOG8yMzYzMTdoOEhERDJ4THJH?=
 =?utf-8?B?MkhseHJuZFBaa1dySnp4ZGN3ME1JVko1R3hCQTJnVkVNa3ArbnVaa00vaUNm?=
 =?utf-8?B?SXl3ZGtrSTZjWnVrWFdwTzdCaVdtNGhvOElVenFXN3BXOTZxZmdyYWxhemNu?=
 =?utf-8?B?MlV0Sys0eEhkamlGTklubzgzN2ZKSy81MHRYeDdoS0EwUDdyZ2g1Vi9jQlVD?=
 =?utf-8?B?ZHlSSkJyYlduWW5BM3l0eCtoRkNVNlJONXZKOXQ1ZzFKNGR5S1JtZmk2T0Np?=
 =?utf-8?B?V2JvdWE4czVYNlpZWUpndjZNUFJCM0VyUFhzVWF5cmIwcEhXdENoSXkrSDZW?=
 =?utf-8?B?N2ZlQUFRaXRacUNxV0NxVnRzc0lLb3VBdkNEQ2hlcG8ybUlBQmEvMVU0ejhT?=
 =?utf-8?B?S0lvVjdXRlJBTDlGQ3dRT1FCNkpHYm5laXZIWHVwL2gxbzNWeFM0aFh5Z1k4?=
 =?utf-8?B?eEtibWxZSHlSSXRUM0EzMXd3akdNNjhBeE05U05kNVRrNlZBQ2tHbHJDSEll?=
 =?utf-8?B?OVQvRXJGaU5waW9zdmFwbEdvTzFFbjBPYi82Y1d6bFE3MmRTT3RJeVA2dDlu?=
 =?utf-8?Q?OLf6vcjdE6WhdEjc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB7DB6226916CC49BF4B21D988689631@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc30333-77e8-40fe-ac80-08ded5a8c3f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 06:36:35.1820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xBEKZymTjdsH84FJXxgAxITAOBeTaLpptJWiIBR6UWfLX+w+DlCSkqji7kMM9TS9PViC0CStanSIbqW5oVPDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7330

T24gMjIvNi8yMDI2IDEwOjA1IHBtLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiBG
cmksIEp1biAxOSwgMjAyNiBhdCAwMjozODo1M0FNIC0wNzAwLCB0emUueWVlLm5nQGFsdGVyYS5j
b20gd3JvdGU6DQo+PiBGcm9tOiBUemUgWWVlIE5nIDx0emUueWVlLm5nQGFsdGVyYS5jb20+DQo+
Pg0KPj4gQWx0ZXJhIFN0cmF0aXggMTAgU29DRlBHQSBzdXBwb3J0cyBoYXJkd2FyZSBtb25pdG9y
IGFjY2VzcyB0aHJvdWdoIHRoZQ0KPj4gc2VydmljZSBsYXllciBtYWlsYm94LiBBZGQgYW4gb3B0
aW9uYWwgaHdtb24gY2hpbGQgbm9kZSB0byB0aGUgc2VydmljZQ0KPj4gbGF5ZXIgYmluZGluZyBz
byBkZXZpY2UgdHJlZXMgY2FuIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSBtb25pdG9yLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IE5hemltIEFtaXJ1bCA8bXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxl
LmFzbWFkZUBhbHRlcmEuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogVHplIFllZSBOZyA8dHplLnll
ZS5uZ0BhbHRlcmEuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zp
cm13YXJlL2ludGVsLHN0cmF0aXgxMC1zdmMueWFtbCAgICAgfCA0ICsrKysNCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvaW50ZWwsc3RyYXRpeDEwLXN2Yy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ludGVsLHN0cmF0
aXgxMC1zdmMueWFtbA0KPj4gaW5kZXggYjQyY2ZhNzhiMjhiLi44NmZmZGIxMDEzMmYgMTAwNjQ0
DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvaW50
ZWwsc3RyYXRpeDEwLXN2Yy55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZmlybXdhcmUvaW50ZWwsc3RyYXRpeDEwLXN2Yy55YW1sDQo+PiBAQCAtNjIsNiAr
NjIsMTAgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICRyZWY6IC9zY2hlbWFzL2ZwZ2EvaW50ZWws
c3RyYXRpeDEwLXNvYy1mcGdhLW1nci55YW1sDQo+PiAgICAgICBkZXNjcmlwdGlvbjogT3B0aW9u
YWwgY2hpbGQgbm9kZSBmb3IgZnBnYSBtYW5hZ2VyIHRvIHBlcmZvcm0gZmFicmljIGNvbmZpZ3Vy
YXRpb24uDQo+PiAgIA0KPj4gKyAgaHdtb246DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL2h3bW9u
L2FsdHIsc3RyYXRpeDEwLWh3bW9uLnlhbWwNCj4gDQo+IFNvIGh3bW9uIGlzIGNvbXBsZXRlbHkg
ZmFrZSB3cmFwcGVyIG92ZXIgdHdvIG90aGVyIHdyYXBwZXJzLi4uIElmIGluDQo+IGRvdWJ0cywg
cGxlYXNlIHJlYWQgc2xpZGVzIGZyb20gRFRTMTAxIHByZXNlbnRhdGlvbnMgZnJvbSBPU1MsIGlu
Y2x1ZGluZw0KPiB0aGUgY2hhcHRlciBhYm91dCBMaW51eCBkcml2ZXIgZGVzaWduLg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCkhpIEtyenlzdG9mLA0KDQpUaGFua3Mg
Zm9yIHJldmlldy4NCllvdSBwb2ludGVkIG91dCB0aGF0IHRoZSBod21vbiBEVCBiaW5kaW5nIHdh
cyBub3QgYXBwcm9wcmlhdGUgYmVjYXVzZSANCnRoaXMgaXMgbm90IGEgZGlzY3JldGUgaGFyZHdh
cmUgYmxvY2sgd2l0aCBpdHMgb3duIE1NSU8vSVJRIHJlc291cmNlcy4gSSANCmFncmVlIHdpdGgg
dGhhdCBhc3Nlc3NtZW50Lg0KDQpJbiB2Miwgd2Ugd2lsbCByZW1vdmUgdGhlIGh3bW9uIGRldmlj
ZSB0cmVlIGJpbmRpbmcgZW50aXJlbHk6DQotIFRoZXJlIGlzIG5vIGNvbXBhdGlibGUgc3RyaW5n
IGZvciB0aGUgaHdtb24gZHJpdmVyLg0KLSBUaGVyZSBpcyBubyBod21vbiBjaGlsZCBub2RlIHVu
ZGVyIHRoZSBzZXJ2aWNlIGxheWVyIGluIERUUy4NCi0gc3RyYXRpeDEwLXN2YyByZWdpc3RlcnMg
YSBzb2NmcGdhLWh3bW9uIHBsYXRmb3JtIGRldmljZSB3aGVuIA0KQ09ORklHX1NFTlNPUlNfQUxU
RVJBX1NPQ0ZQR0FfSFdNT04gaXMgZW5hYmxlZCwgc2ltaWxhciB0byBob3cgaXQgDQphbHJlYWR5
IHJlZ2lzdGVycyBzdHJhdGl4MTAtcnN1Lg0KLSBUaGUgaHdtb24gZHJpdmVyIGJpbmRzIGJ5IHBs
YXRmb3JtIGRldmljZSBuYW1lIG9ubHkuDQotIFNlbnNvciBjaGFubmVscyBhcmUgc2VsZWN0ZWQg
ZnJvbSBoYXJkY29kZWQgdGFibGVzIGJhc2VkIG9uIHRoZSBwYXJlbnQgDQpzZXJ2aWNlIGxheWVy
IG9mX25vZGUgY29tcGF0aWJsZSAoaW50ZWwsc3RyYXRpeDEwLXN2YyBvciBpbnRlbCxhZ2lsZXgt
c3ZjKS4NCg0KVGhhbmtzLA0KVHplIFllZQ0K
