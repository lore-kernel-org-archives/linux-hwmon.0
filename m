Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1A362153;
	Fri, 27 Mar 2026 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629045; cv=fail; b=Lz2ij0MMiIGyGGVBQTgzNHhk24medNZHaNHE15Al9zFZHQqpwvSA85Xq3iFHIMtyO4W0OWsAYKG8BdXb78QOgP7CPQFybRpdzJnisZmJ5JLF4slNKZkSScpZ+KbDX9D3/TjUGytPxe24Z+8bD8ghk2gkJWycqOV7U8zePP470QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629045; c=relaxed/simple;
	bh=Rmg2HU9t8I6V3qr2VKiv539I/aLno1zrs2f5o5CmGP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dmztAJYTCHrIxOnz0A3p5Hz12J7LPviFgzk31h3nqsdNn2xzJV4GfkANFb+vXOHbyD4SXF2TPmd203mSjOXAtlW4kny2aP1+Q2xCAbuhcHPGNHQKkkvFX8sJ1n8q5viTeB7OvwRq75+JTO4DSEWSp58MEJ7QlrsYQqOtDfD1cso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xWCLpRWA; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xWCLpRWA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNhfh0ZQcqC6xQ8Yivz+tWaYivUdSeSOf+k70+8qhntHTYz80CSf26r1ySOQ/s8sRKLqP7WNrVCECypAtnZWg64z8xi+i65RRX2+ERmsiBHPmaRdQDi+Ly+mginZnB5KNqSS4JddiCfFR5lGTH5fn8OgQ8W3wN4N2AhpPdzRgk5gva+KzVJX6LnFNFskzMHnH3ivUgpG4pF0JVX58hvjMQsEA+HXYfFafFLlvrJwcHsp1Tx8OUckbKnSD+ZBucwUo0p33LFpKXLd+eTISbB4cDtBo/ye2i/xsnxoGl68HMSYbUtc6fw5UE1q3VKKwgV8YXOzong2EXX2ghco3bBKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rmg2HU9t8I6V3qr2VKiv539I/aLno1zrs2f5o5CmGP8=;
 b=Ccp2FjG/HIyREniHRFKEWbVXjYOU+fNZGW2mX2naGkiGhi+pdwjUZAs1dYKRqGcbkwhUOCt5rw7ebuN0H/jcNI8NZQ6Ug9dy9gRmzBquA5xvBL/q3TL/VX8ND/gTfgdw2cOTOSZS9+vQQPv5i+7dpVU+MPwmTa8/tQ729QsU/M+/vZ7keWB4VykbjEYKc3v9sS8MhHJrA7BYXVwhrCOpmrucHSKGRelzuTr2cRclvPN120XRNXuEBkAOQ39FzMlpcQaYUugePD9PTSOK6JVOC5mOjZVw+qt+8Ga5pe335F8K2uhr5Ud4q++Dbls5t4DTx3+fIhNx8Kq3RMngom98Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rmg2HU9t8I6V3qr2VKiv539I/aLno1zrs2f5o5CmGP8=;
 b=xWCLpRWAe4J6ob5rYDRQ/2TbKMTQTYYQwEhsUmSCtWKNj40hgJhxngYf1aonPJ8kZPtTHZnAQJQG9Y2w8Kcjp23NKO5JxCqcla3CG2pUuKkeyJ2n6Vl5a6b2RPJITy2DdcS2jzzn2gwUTZ0xsPxDJZqG48krUfFj2TsiTV0Uk042YVe29dmVr3vs3nzShpGPTdGLNjGjNhvBUUjkrpDqnbEvIvYtitn+RAdv6B0inukwqhHo3KI1PcBF0ow+aWxTdsKbn2HuBkKhPYOId/E4cTfAKyEd9HZ/ByiSsY3J8XSznVb/J1/DUf/jqwmvBhJaNHOiZ60IPdgVCvb15/vGRA==
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 16:30:40 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%6]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 16:30:39 +0000
From: <Marius.Cristea@microchip.com>
To: <linux@roeck-us.net>
CC: <corbet@lwn.net>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-doc@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v8 2/2] hwmon: temperature: add support for EMC1812
Thread-Topic: [PATCH v8 2/2] hwmon: temperature: add support for EMC1812
Thread-Index: AQHcsJ1vdIMCbyiBy02Hi3DZ0aRfKrWzef0AgA8y3gA=
Date: Fri, 27 Mar 2026 16:30:39 +0000
Message-ID: <350d1d2bf73c11c2c311c4ae6bf1b8b423151113.camel@microchip.com>
References: <20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com>
	 <20260310-hw_mon-emc1812-v8-2-bc155727e0d2@microchip.com>
	 <f1e55e6e-a374-4b97-b1f3-706d627ebab5@roeck-us.net>
In-Reply-To: <f1e55e6e-a374-4b97-b1f3-706d627ebab5@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6005:EE_|MN0PR11MB6277:EE_
x-ms-office365-filtering-correlation-id: 1d4a609c-c8c1-45cf-8ac9-08de8c1e2ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 4ueurpZVvA4t/eo0JtYQzKi4g5MJ29zAdh7MHvMId+bEhn7dCWp0ipN6w7RxLtHmuoCxmDe3enYK7PhBuLZxbBKMcSbkBF0zumdmN2iSuwC2KXm/CfZP/r5jv6uP2yD2lq/akVVETgLRudWxxt0C3cI+Zf/qJb2Bu0O+XlsAwlmHNfVrw9gvLo30tNC7kmBGI0uN8sshgYo2s2+K1rV6Hx1NEOzz7JEQo9lm0YFnOksKfzkTuE7rsSkEegpqiTXAz+grGu6u9SrLeeCX4ZREahYUv8ykzYJmKUJqdUR015xxMdrvxNoSZIvQBpaVYFmgulHRN49XH3dvhFKJoLRXt3UAaBntbBIqtxa6k3SDnXU7fH0Tjll3yTOFxjed7qUg1xNyA6/ULuO4bWt0QuBvyVGi7oXGyqc695j8i28qO2n6nJ4ZcwM5Vu2YQ7NNCDiOwmmyCeiEfmFaDjvvYsx4ZHLnYRcd16DbB44dvrurNcUZyluxKKZGb/lV6HRUYd9sObRyiRiDZewKcXVHQA/hNMRyR9Ibn3nf5K/NHXZ+fRAFsZCWUmJHQwbE7bxMgzZSWx4XnVafiPS3NsKrp6ShPB4zNffomHI/XKLpkooyUNr+tHoViqzBO2t/SobnzlePU4QwvH1X+9betua9rshdYfqjQTB44CJtdFg8SKwpIrviUR0Zi5FQjpyS9qx8AJbPf1r4GIglXEpPiaVOVLOBziU6x6xPqI/6NX0OAYwp6X5SzlNcsmxufh88zzBGBnCts8rLC3pndfoiQfKk54eZuc9DR+B1q2m5Y9+xJckAUq0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THB2QjNVd29PdDJYM2p1bHJpSDR2clc0UUxwWTBENTNTVXNWRXEyZVBjZSty?=
 =?utf-8?B?MVZrK0hIWFAxTHd3a3plMFpGa1RoeVM5NVI4VHNubDJCU2NUNnNueEp2L3VH?=
 =?utf-8?B?SXVKeGd6a09RU2pUZm1SSm52LzlWWXZYcWNnVEYrR1lmQlhyT3lsRzNuTXdE?=
 =?utf-8?B?bE0yQ2JNUzV4b01LaTNVMlBwN2ZCOHVKRVlXKzJpTEFIVW9Hb3VQMStkVVN5?=
 =?utf-8?B?LzBwK3RmclpDUldFVmhCQmRoSmZhUDhhVWpjQWNxY1FJRjdvU3o0c3U2MGE4?=
 =?utf-8?B?QXBKUXJsMmh4eXh3c0Y4VWwyd3lHSklaclRFanNRTytoa0Y5M0RxQTVmV1hC?=
 =?utf-8?B?YmVkTVVEcGtkY3BKVngzcjV5Qkcrcjlqa1FMZjI0bFd5OUpOV0FPMzBPWmFG?=
 =?utf-8?B?TE1FM216WnVpNENuQ2wybzFvdUxjcTE1empLYVR3WTVEdU0rMHpjQlJUTVkx?=
 =?utf-8?B?dldJdlFwaTc2SzNPN01qTGxkNXFaUDdEMGdRQnYvaWh4Q1NVYVYzajNnMkhv?=
 =?utf-8?B?T0FBUkVNbVRjenRJeTgrQVlwUC9IeUE3Uk9BZGxMWXNQY1JpbkVwVGJvejJi?=
 =?utf-8?B?dTJibWF5eDNTYWVwdWxOWk1maTcyeU5WSkNUVnR5TmtrbndGK1FoUXVQSFpE?=
 =?utf-8?B?NHV6cU9BZkRzbmJQQ1BLaXNrVHhOTVo4cjFJU2UvbS91N1VpQVoyN254V25H?=
 =?utf-8?B?S29OQjUwSzVWSGFMSHlZYnpTVnZjbW8vaXMxZlRPMFI5VHIxWXV0QWR1am1J?=
 =?utf-8?B?NVh5My9GRkN1K2pGcXhZZElaSVJNanhaSkRPVVViKzVOaWwzNzloUWRmeFQ1?=
 =?utf-8?B?Qk9tNWgvaUNyZ0hiRms3bEVtWllUc0JsZWF6endlbElkNVRiUVhpb1hMSmVU?=
 =?utf-8?B?M2oybWd4a1R0Zk8rVDhocytwTG9PbnNmUHlza1lpWXoyaGhBei9ZeG5RVTVF?=
 =?utf-8?B?Zzk4WEJOSkhOKyszcTRyMlRuUWJBQUw5YUg2TS95Z0Q1NVdxOWNuU3BDR1pR?=
 =?utf-8?B?VHNwUWFJaWZmd2sxcldBbEVQZzl4aUh2MGh2bmRGUG1PNTB3cU5hZXVoeXdR?=
 =?utf-8?B?ajh6MGNQaFdNeTVYUWVwRWFadzJrb3h1RTUzQWlLaW5saFhoK0RUMklVSVBh?=
 =?utf-8?B?UlNDSkhhS01oSzQ4d2JaZ0Q1OTVLRVZMQUJsZW5YanNOYlA1c1Q4K1JneURB?=
 =?utf-8?B?TEYrT2VWaGovVy9rREhiNE93TlNOdUJ3cnFVb2Q4bjFJK2ZMd3JvdGx0NTk1?=
 =?utf-8?B?N1NiODBzMmlGTVdPakxjZzU5clFSNk5ZdmF5Y2duODk0clFLWGFGMWtFeHlu?=
 =?utf-8?B?WGF4akxpellueDhpakt5enIrQjJHRkJoY1Q0ZTNybFE4RHlHRzlIUXo4eWl3?=
 =?utf-8?B?ai81RXBxRFlxN1V1cWl6UFZCODNUOWt4RGhIdWlrWlJLOUNDZ3dtRUNUSWZk?=
 =?utf-8?B?WEdQTEdhMVhibmRJbUMvbUhWcnhZQkZHTXREZWFFcjY5NlFWM01uTTJ3cks1?=
 =?utf-8?B?OS8ybHhKSjZnbGVwVE5ZSW45ck05bzc3NG9CRzlVM0FpcHRaVUxsUEcxdVpL?=
 =?utf-8?B?RTIvNkQrdnR1SVZLc1pOWEQ3ZmppbG9SUUwzYyszdzJYYUY5a0tVQmZBMm80?=
 =?utf-8?B?WjdBVzhkWTdJZ1BXYVRPd2Z6Y3JhVVRQd284OVpWRjhubG5TNktiZGdYbHVJ?=
 =?utf-8?B?VHdkU1pCWnpJK1I5VXZvS3VzMUhxMWY4a3dPdWVTQmVhOXUwSVFwRkE3bmV0?=
 =?utf-8?B?RjF4Y1U2ZXUzWEppS3psSVFIVW4zQnkwR1ZGZHJZK1Q0Mis2c1d3MFpadnRq?=
 =?utf-8?B?M0QvVmgwRElKbGVWUXEvSEpLR2pGT0NzWHZqV1pyRlVlbVJMcVhJZ1hsUWVa?=
 =?utf-8?B?VisvWVo5bGE1YzlZSm1obDBHMmQvMkFWdTQ0UEdFaFhacGVZOXA4Y25xSGN5?=
 =?utf-8?B?c2dlcW5kMDM0WlRsVmhKZ1FTcXRxRFZkZkxYR2lmaHV5bWtBY0NqY3ZqT1Qr?=
 =?utf-8?B?VnAycHNXc1B1VTJYb2JTbFp3NHZKU3EwZnJlSjFKaEpVTkhOM1FMZENWUFln?=
 =?utf-8?B?aWhJT2ZpYU1LMzJEanI5RHM1dkxZcFNNNlp5WVBUYUkwdStCTDgxK1Zib2Q5?=
 =?utf-8?B?M0ZCZVpoOVhDMW1KTm96MFNBS1FtamgxM2pydVBRUURGOXQ3TkFnUFhLL1Iz?=
 =?utf-8?B?YWlyVTFnOE1WT0lpV1lkNE9IazhoeHBKc3d1MXNsNjZwcXJ3UU1ERHN1Z2JO?=
 =?utf-8?B?RUwycWowRkIySlVGcEZLSnRtTFpwVURPTXFkc2tDdHVTVU43ZmlmNGFrQzEr?=
 =?utf-8?B?dkhxQldTVGhUNWRIbjd5SHFHUVBBVHdBamRQYmdBWXRmV2ljN3R0MXZqWEo4?=
 =?utf-8?Q?T7+KqbnbPCigfc6M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1B898B08FCC844DBBC56A937CF0DC26@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4a609c-c8c1-45cf-8ac9-08de8c1e2ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 16:30:39.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0hLVC9kdLw7JxYGWOUT1ail3WhODthSzdiPZrMZ4U26qO7/NflDpBVqeYBIY3/1mHwvRGPAJ5fzDgVsKxX0ma7Bx6bexQqNWeqwTRZTo7as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277

SGkgR3VlbnRoZXIsDQoNCiAgIFRoYW5rcyBmb3IgdGhlIHJldmlldywgcGxlYXNlIHNlZSBteSBj
b21tZW50cyBiZWxvdzoNCg0KLi4uDQoNCj4gDQo+IA0KPiANCj4gDQo+ID4gK3N0YXRpYyBpbnQg
ZW1jMTgxMl9pbml0KHN0cnVjdCBlbWMxODEyX2RhdGEgKnByaXYpDQo+ID4gK3sNCj4gPiArwqDC
oMKgwqAgaW50IHJldDsNCj4gPiArwqDCoMKgwqAgdTggdmFsOw0KPiA+ICsNCj4gPiArwqDCoMKg
wqAgLyoNCj4gPiArwqDCoMKgwqDCoCAqIFNldCBkZWZhdWx0IHZhbHVlcyBpbiByZWdpc3RlcnMu
IEFQREQsIFJFQ0QxMiBhbmQgUkVDRDM0DQo+ID4gYXJlIGFjdGl2ZQ0KPiA+ICvCoMKgwqDCoMKg
ICogb24gMC4gU2V0IEFMRVJUIHBpbiB0byBiZSBpbiBjb21wYXJhdG9yIG1vZGUuDQo+ID4gK8Kg
wqDCoMKgwqAgKiBTZXQgdGhlIGRldmljZSB0byBiZSBpbiBSdW4gKEFjdGl2ZSkgc3RhdGUgYW5k
IGNvbnZlcnRpbmcNCj4gPiBvbiBhbGwNCj4gPiArwqDCoMKgwqDCoCAqIGNoYW5uZWxzLg0KPiA+
ICvCoMKgwqDCoMKgICogRG9uJ3QgY2hhbmdlIGNvbnZlcnNpb24gcmF0ZS4gQWZ0ZXIgcmVzZXQs
IGRlZmF1bHQgaXMgNA0KPiA+IGNvbnZlcnNpb25zL3NlY29uZHMuDQo+ID4gK8KgwqDCoMKgwqAg
KiBUaGUgdGVtcGVyYXR1cmUgbWVhc3VyZW1lbnQgcmFuZ2UgaXMgLTY0wrBDIHRvICsxOTEuODc1
wrBDLg0KPiA+ICvCoMKgwqDCoMKgICovDQo+ID4gK8KgwqDCoMKgIHZhbCA9IEZJRUxEX1BSRVAo
RU1DMTgxMl9DRkdfTVNLQUwsIDEpIHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklFTERf
UFJFUChFTUMxODEyX0NGR19SUywgMCkgfA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBGSUVM
RF9QUkVQKEVNQzE4MTJfQ0ZHX0FUVEhNLCAxKSB8DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
IEZJRUxEX1BSRVAoRU1DMTgxMl9DRkdfUkVDRDEyLCAhcHJpdi0+cmVjZDEyX2VuKSB8DQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX1BSRVAoRU1DMTgxMl9DRkdfUkVDRDM0LCAhcHJp
di0+cmVjZDM0X2VuKSB8DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIEZJRUxEX1BSRVAoRU1D
MTgxMl9DRkdfUkFOR0UsIDEpIHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklFTERfUFJF
UChFTUMxODEyX0NGR19EQV9FTkEsIDApIHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklF
TERfUFJFUChFTUMxODEyX0NGR19BUERELCAhcHJpdi0+YXBkZF9lbik7DQo+ID4gKw0KPiANCj4g
SSBhc3N1bWUgaXQgaXMgb24gcHVycG9zZSB0aGF0IHRoZSBkZWZhdWx0cyBmb3IgRU1DMTgxMl9D
RkdfUkVDRDEyDQo+IGFuZA0KPiBFTUMxODEyX0NGR19SRUNEMzQgZGV2aWF0ZSBmcm9tIHRoZSBj
aGlwIGRlZmF1bHQgKGNoaXA6IGVuYWJsZWQ7DQo+IGRyaXZlcjoNCj4gZGlzYWJsZWQpLg0KPiAN
Cg0KWWVzLCBFTUMxODEyX0NGR19BVFRITSB3YXMgc2V0IGluIG9yZGVyIGZvciB0aGUgYWxlcnRz
IHRvIGJlIGNsZWFyDQphdXRvbWF0aWNhbHkgd2hlbiB0aGUgbGltaXRzIGdvZXMgYmFjayB0byBu
b3JtYWwuDQoNClRoZSBFTUMxODEyX0NGR19SQU5HRSBpcyBzZXQgdG8gZXh0ZW5kZWQgcmFuZ2Ug
aW4gb3JkZXIgdG8gYmUgYWJsZSB0bw0KbWVhc3VyZSBmcm9tIHRoZSAtNjQgdG8gMTkxLDg3NSBk
ZWdyZWUgQ2Vsc2l1cy4NCg0KVGhlIEVNQzE4MTJfQ0ZHX01TS0FMIGNvdWxkIGJlIGxlZnQgYXQg
dGhlICJyZXNldCIsIHNvIEkgd2lsbCBjaGFuZ2UgaXQNCnRvIDAuDQoNClRoZSBFTUMxODEyX0NG
R19SRUNEMTIgYW5kIEVNQzE4MTJfQ0ZHX1JFQ0QzNCB3aWxsIGJlIHNldCBiYXNlZCBvbiB0aGUN
CmRldmljZSB0cmVlIHNldHRpbmcgYW5kIGlzIHJlbGF0ZWQgdG8gdGhlIGhhcmR3YXJlIGFuZCBp
ZiB0aGUgc3lzdGVtDQpkZXNpZ25lciB3YW50cyB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgcmVz
aXN0YW5jZSBlcnJvciBjb3JyZWN0aW9uLg0KDQoNCj4gPiArwqDCoMKgwqAgcmV0ID0gcmVnbWFw
X3dyaXRlKHByaXYtPnJlZ21hcCwgRU1DMTgxMl9DRkdfQUREUiwgdmFsKTsNCj4gPiArwqDCoMKg
wqAgaWYgKHJldCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
ID4gKw0KPiA+ICvCoMKgwqDCoCByZXQgPSByZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBFTUMx
ODEyX1RIUk1fSFlTX0FERFIsDQo+ID4gMHgwQSk7DQo+ID4gK8KgwqDCoMKgIGlmIChyZXQpDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArwqDC
oMKgwqAgcmV0ID0gcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgRU1DMTgxMl9DT05TRUNfQUxF
UlRfQUREUiwNCj4gPiAweDcwKTsNCj4gPiArwqDCoMKgwqAgaWYgKHJldCkNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoCByZXQg
PSByZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBFTUMxODEyX0ZJTFRFUl9TRUxfQUREUiwgMCk7
DQo+ID4gK8KgwqDCoMKgIGlmIChyZXQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqAgcmV0ID0gcmVnbWFwX3dyaXRlKHByaXYt
PnJlZ21hcCwgRU1DMTgxMl9IT1RURVNUX0NGR19BRERSLA0KPiA+IDApOw0KPiA+ICvCoMKgwqDC
oCBpZiAocmV0KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4g
PiArDQo+ID4gK8KgwqDCoMKgIC8qIEVuYWJsZXMgdGhlIGJldGEgY29tcGVuc2F0aW9uIGZhY3Rv
ciBhdXRvLWRldGVjdGlvbg0KPiA+IGZ1bmN0aW9uIGZvciBiZXRhMSBhbmQgYmV0YTIgKi8NCj4g
PiArwqDCoMKgwqAgcmV0ID0gcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwNCj4gPiBFTUMxODEy
X0VYVDFfQkVUQV9DT05GSUdfQUREUiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBFTUMxODEyX0JFVEFfTE9DS19WQUwpOw0KPiA+ICvCoMKgwqDC
oCBpZiAocmV0KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4g
PiArDQo+ID4gK8KgwqDCoMKgIHJldCA9IHJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsDQo+ID4g
RU1DMTgxMl9FWFQyX0JFVEFfQ09ORklHX0FERFIsDQo+IA0KPiBBSSByZXZpZXcgdGhpbmtzIHRo
YXQgdGhpcyByZWdpc3RlciBvbmx5IGV4aXN0cyBvbiBFTUMxODEyLiBJIGRvbid0DQo+IGZpbmQg
dGhhdCBkZXRhaWwgaW4gdGhlIGRhdGFzaGVldCwgYnV0IGl0IGlzIG9kZCB0aGF0IHRoZXJlIGFy
ZSB0d28NCj4gcmVnaXN0ZXJzDQo+IHdpdGggc3VwcG9zZWRseSB0aGUgc2FtZSBmdW5jdGlvbmFs
aXR5Lg0KPiANCj4gDQoNCkFsbCBkZXZpY2VzICJoYXZlIiB0aGUgRU1DMTgxMl9FWFQyX0JFVEFf
Q09ORklHIHJlZ2lzdGVyIChJIG1lYW4gaWYgeW91DQphcmUgd3JpdGluZyBzb21ldGhpbmcgdG8g
aXQsIHRoZXJlIHdpbGwgYmUgbm8gTkFLIG9uIHRoZSBpMmMgYnVzLCBidXQNCnRoZSB2YWx1ZSBy
ZWFkIGJhY2sgd2lsbCBiZSAiMCIgZm9yIHRoZSBkZXZpY2VzIHRoYXQgaGFzIHRoZSByZWdpc3Rl
cg0Kbm90IHdyaXRhYmxlKS4NCkVNQzE4MTIgaGF2aW5nIG9ubHkgb25lIGV4dGVybmFsIGNoYW5u
ZWwsIHdpbGwgbm90IGhhdmUgdGhlDQpFTUMxODEyX0VYVDJfQkVUQV9DT05GSUcgd3JpdGFibGUu
DQoNCg0KUmVnYXJkcywNCk1hcml1cw0KDQo=
