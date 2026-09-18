Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72033BB119;
	Fri, 18 Sep 2026 03:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700685; cv=fail; b=c8nrGNCNXbJuSyRj1WgxRJP4wmJDs446pN0YZpcVE5c346SgKSiLcio01q9OdJL7nEMN7bFbn4YPc8ExVzGdxu5014OTqn0n6hFGOZsrF5atUR+YORatdyrUebnJQ0f7EHPuV1lKn4jnzBv25qz5wXWWcWb+jqvNHm0CHlRl2X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700685; c=relaxed/simple;
	bh=ccgmjEs08SOXIr+bea4G/uvb3TEz08zW7L2O8KgevP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FiIUUTVwpyxHnxIP5tM19QcZp6ojSi9VvhyPvc5Q7HDx1+UIZv0VBPpMwnHBBvB4lzv3lLSmTBha3saPEmgx2HB6isvnMoNaIzxpEwhFbYHfAH57yZvh18pwu2treRXeSZh6jUiq8B+tBRbjeDGU3In9wnItwAWRYdw6l1t0ZVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyE4j+8MZczTLAWL58fZzoeFU3CDIrkZP5kwkwoS1fpqpc2XZSPA+xSyOqf066+uehtJ6PoiU88JTYb1KEJYD79iYomD8ljaIC+UoKNPl1HLwwUJSpsVmt3uWjGZZ8qS11SAC/y/+/wp5cKPH376YCfuseO+B/9TMHG0rpYK3uhTE44Myy5BEekqUAU3Q26WEKr66LNA9TOW+RbvPXTOJwQl+bqpMX8hjvytr+eYBq9ema5WtjVaSqPACNfDPj/SFCG2QwJFO6Yx73/ctpMRFW/AJQpcROn7hx08q0NrYUcC44PpOtFdqWdBU7daeX5HFEXShUY2Gn3uDYshpx56rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccgmjEs08SOXIr+bea4G/uvb3TEz08zW7L2O8KgevP8=;
 b=cf18iPShzkm7vc6boL4hN9o154oRxxgnflxOGJNcYxWcId9bjMLpoYNAiqfeCPB8vG2u6lvk5zBq0xNo7AZkWEQm1UJCXiUddWOGi232JWMvXy4In6GaPRQHTgOmSYY50c9Ou6P0tw1o4hC2+PW6+0pGcDAJFj8M8XCr12GyyYAOFjOi8xaWATZEilyNTyEKFTOMjS2G7IQqRznMEVKyjA9Vskxv/pn6i3pOFXi8UYe/+Gs4tHoyrs9BDsULM39W6hMGeJ6ldVB2yJHjllF9CMx7WSN8g3WTT6h75ntfjTvDI48ikvYgoEIyBD5v4mM2eZIkZFMHT+X0OkGnUsWrGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 02:33:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0428.008; Fri, 18 Sep 2026 02:33:04 +0000
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
Subject: Re: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdO6kWobiqEWs+306uaml9udyWb7bTVIYAgABgNtA=
Date: Fri, 18 Sep 2026 02:33:04 +0000
Message-ID:
 <ZQ4PR01MB120289848AF944E07783BDF4F2872@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-6-changhuang.liang@starfivetech.com>
 <cbb35e1947dba7d06896a9c66f35f8736a481215.camel@intel.com>
In-Reply-To: <cbb35e1947dba7d06896a9c66f35f8736a481215.camel@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_
x-ms-office365-filtering-correlation-id: fc260361-471a-49e0-bb10-08df152d2a93
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|6133799003|22082099003|18002099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 jxr/wVcGGgs/Elj3t1Pv7JAc9a7oTrY32WMUTb2j5VGUgEKyX/YnFsozHWc82Fhp9kzFBD8vELqGJ60I1tY+XT8gRTdBcamn7qXvQnZbVY1WCNXkAm7elJbcZaTEuKZ9B7drnPA/NUI0u53EGbevuMlr5Rj7VvTSnF0cJt+1W4sCDwxsmDc+7VV2o0Vac1ErYWFIZtPQsT6J9cSA02Yx4QC6jUrRY9wyFJdx+AbIAQF0q2GfGqCHlaC9WWaABoB9eD23f7dwPqVJEvBmLbkXpwLV2Ndl45H6GWJc529fDmgcZDPpMjr3GrdSbYc4jgKhgN6KrP6hrdx1UBhJF2eBog/BI2NcpwW3g+rGmHtrW9jsTkdHC3u6kjH/0HWQ/w5rEFH3tE7uH4llUIn3AFgFdRDGEK5vjIbQ0YSHjKzXSDXVffGWFgZD8ZNFBlim/yvIkc1Ntv57j8lx1m2cPTqJeko06Uas4AhOcyNbxxRlHR+Kbqw3BYRjXWkXgeliSJd1wJlydzBOKl2Y9HZS0XBqTfB1Sv++BOcK9bN58uwSVVOn5OpfZZOBK+fc/AlSwTeN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2tPTThhQzlzMHhtRjI4K2FmVGZDaW53MG1xdDRzL1RNaVQ5OUxRaDJqZys1?=
 =?utf-8?B?SFErTGRDcWs4bGorUldFa2l1S3JrQ1lBOGRJdEc0ZFRxaDZuQTdzOE1PVkVK?=
 =?utf-8?B?MFBTU3hiQ09TWTZYUjViYjI3TzlzdThkUTlkbmJxd3lrN2VScmg1WGd2bE56?=
 =?utf-8?B?RHNyUnJWSVduMDNEaThyTFgyMkRwcUFoUXJoS2xTZVFWaVZiV3JNTkN0UWlh?=
 =?utf-8?B?TVJ3TjdmaG5UU1RlOU9FSi8vOGhDd2xJNU5BUGJRUTZONzQ4QnZmNkpGT1k4?=
 =?utf-8?B?YW9uaFpLbFBYQUh4dWhtOFhCeThwRndtTjdTSjNDaysyT0FnNGdMV29iMjVx?=
 =?utf-8?B?MGtYbkR5N1hVamRYSERtaENISlRNVzRVT3BqZUlxZU1hSGZ1K3BiWFFlUy8v?=
 =?utf-8?B?REsyQ1NFQjNrcHIvRGFUcUtBZUF0NWVNSzlrMjYrYVBZbjRkWGVkd1FHSkQ4?=
 =?utf-8?B?SzBWU3kwTmVTZEtHT28vYWh5WDUyQjMwbXFZckV5MWI5dlVnK0srdEhvLzFE?=
 =?utf-8?B?Sks1VHJlanN4YStiVVFXRG9kRlUwaXZ2a0FzVkNjU3p6cXZFWUNmakllTzZG?=
 =?utf-8?B?U3JPZjkzdkg4WG9TQnVXUE13VWZ0WHhScUxoTDcrZmFiNUVMYTNEK0tMczU5?=
 =?utf-8?B?TDJqcThJVlhqNzY3V1JDTnpMeC9TcmEzMEVpdkNEVzZHM21BVjR3K2wxSFdZ?=
 =?utf-8?B?NDg2QXNIL2VLQjByWVlrVVBFdWdjaThXVjBnMGFiaUdMNEtKWittaTBiL2lL?=
 =?utf-8?B?SjFDaGRUY242WlREREFiWEd0cVRMRXNUUmlQNVN2azk5R1RLT3BybDUyTjky?=
 =?utf-8?B?ejRqWjNNYndIZnBKOFJhQjVqeEpucVJjYkNqU2dzTTUvQ0NMeFdiQWRDOUdy?=
 =?utf-8?B?N2YxWlBWOFNuRVgzMFZoUVFLcnd0bTNvSjd0K2JrR2h5VWNtSVBTWmlELzY0?=
 =?utf-8?B?OHB0Wmh6TkpEZGpjZmlGcWRSNHlwY1V5NDY0bVh0V3c5OXJJOTU0enRRT0RE?=
 =?utf-8?B?MVBNWlk4RE1vMDRSaURrYTFHRDliZ1cxVHZVOWVNNjJUejF2R0dMUVdYVk1S?=
 =?utf-8?B?WlFibkl4M2dFK0IxelJ0N0VLTFRsOXNpa3V2T0szVncvcjIwQWNLdk45UlBk?=
 =?utf-8?B?TVVyMWNQVnJZMXd2YmlYOG45MTRTSmdZTEZnZUliZXF1VG9kMjRQcGRXRXpM?=
 =?utf-8?B?TVNZMkRIMkd4dk5EOU5Eeko5TUsralRCMExqWHE4UFlGdSs3YlN5NW1qYTBF?=
 =?utf-8?B?QWQ5ZXJJeWp4dEtlaGNOUmpmS1hPMFY5eE1PQ2JMZUdYdks3bDBWVlJ2bERU?=
 =?utf-8?B?cFgyYk90d1F6NTBYRmxxV3RvWkR3M3RmYkhCaGFmUnVuVC81NmdQdFpBM3hq?=
 =?utf-8?B?Smxnenh2QU9ET0FrOVhtSWFNWTBTM1pLUDhibE1IY1AweGd2S1l3UlRocmNL?=
 =?utf-8?B?bHFYODBjWFBFZG10SmdvWHY5dHA0NXRIQnN3NHNJaXBLK3RLYUhsbjZsSitJ?=
 =?utf-8?B?bm9nSDd2RytUWm9JT05JVHBoS0RQL1RzbzY5YWlxcHYrZmpad2JjVm52M2Fu?=
 =?utf-8?B?RVVqKzJLNzVIWHdSckZKSlBSNmJ5TU1nYUVTSE1OdUpXenFCSW03dElvNHQw?=
 =?utf-8?B?YkV0dElxa1d3ZkxobWZZWVdSd3NBTWx6RVdqWmVpZFFUUVdTaWdxWHRIL0J4?=
 =?utf-8?B?QjF3TGxKLzNXbkNxSXJhQ0pBZTQ5KzFxelRpVkFnc1NFTmhmMVJIeWh3MkMz?=
 =?utf-8?B?ZkZOY2w2MC9GQnJnZlVSOUt5bm96NHI1cDJPdWl4d3hsMlBrci9MK0NQVFFN?=
 =?utf-8?B?RFZVajF4dHZDZ3laQmw5bzhQcnBrbG1ESXQ5ZkZTWExtNUhJNEpZQlZpZU50?=
 =?utf-8?B?bVlvRG05TG4wYWV2UUJDKzJYdjIvUUF0QUhWL3R5MFRCcTJpRWpEZ3lIczlo?=
 =?utf-8?B?Z21wMWMwZTV2azNSb09OQVZYdjN6bTRWM21vTldyR0xSalhDdDJDYzRHYkNU?=
 =?utf-8?B?WGhjZHEyQlJwNzFLVkNZbnJBc0l5MGxOUTJkZm1xb1RqaEMxLzZDR3pZZkZV?=
 =?utf-8?B?NTg5dEo2d0RyOEpQczI5TkdYd3dvRExFU2lEY0FieXFzdExoZzBubGlwT2J2?=
 =?utf-8?B?OTIraVhFakdGdzNMK1AvbnhDV3BON0FrSkg0OHlCcWZZMVliaTB3c3c3dTdB?=
 =?utf-8?B?bDZObVp6ZkxtdWkzVGNiOVo0UG5hSHZuL0JQUkNnejNndEJSdTFLZjRGMkFV?=
 =?utf-8?B?enhmaWR6RzBxbFh1MVhoL2owMDA0STFrYmhqNE94UjBQOXQreWt5QytMTHZ4?=
 =?utf-8?B?dytDZit5QjIvcFhWWWR4OEdCSE85Y1FLR0Q1aGJhRHNLTHU4d3NOazFxY0lx?=
 =?utf-8?Q?HJqIf6SqKwyAq7Zc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc260361-471a-49e0-bb10-08df152d2a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 02:33:04.1233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TLJqd5v/ynQyj5GXFNxqg29ls4reZPKySAE9/pg86eqvQUxFT417J8vqPBu8xl2X004Dj+EKDFvBPs2SgC6APhNSxxAZ0DFwG+n3nk/lmG/TwFz4jMP75ge9ALuj1XR8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330

SGksIEl3b25hDQoNCj4gT24gVGh1LCAyMDI2LTA5LTAzIGF0IDA2OjM0IC0wNzAwLCBDaGFuZ2h1
YW5nIExpYW5nIHdyb3RlOg0KPiA+IEFkZCBHcmFuaXRlIFJhcGlkcyAoR05SKSBDUFUgc3VwcG9y
dCB0byB0aGUgUEVDSSBjcHV0ZW1wIGRyaXZlci4gVGhlDQo+ID4gR05SIHBsYXRmb3JtIGRvZXMg
bm90IHN1cHBvcnQgdGhlIGNvcmUgbWFzayBzY2FuIHZpYSBQQ0kgbG9jYWwgcmVhZCwNCj4gPiBz
byBoYW5kbGUgdGhpcyBjYXNlIGV4cGxpY2l0bHkgYnkgcmV0dXJuaW5nIC1FUEVSTSBhbmQgc2tp
cHBpbmcgdGhlDQo+ID4gY29yZSBtYXNrIGluaXRpYWxpemF0aW9uLg0KPiA+DQo+ID4gRGVmaW5l
IG5ldyBjcHVfaW5mbyBzdHJ1Y3R1cmUgZm9yIEdOUiB3aXRoIG1pbmltdW0gUEVDSSByZXZpc2lv
biAweDQwDQo+ID4gYW5kDQo+IA0KPiBQRUNJIHJldmlzaW9uIGZvciBHTlIgaXMgNC4yLg0KDQpX
aWxsIGZpeC4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQoNCg==
