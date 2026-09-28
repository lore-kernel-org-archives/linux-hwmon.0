Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2133.outbound.protection.partner.outlook.cn [139.219.17.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2B94B66E7;
	Mon, 28 Sep 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596503; cv=fail; b=J7OkbYwQjcH9keYCqXGYXqWhm4D/objMjzrWhYNZ+df2+9oWki2pKJG1wAJ1YIh+vw11MFAEHSr9q7V+XMIbK4U1KFKuzbSfEyLIjAlltHF5QYALrF6cMyODIOU6masE4eckcOORKVkRHl0pygIBD1oKlmx1hs3cyxStKbxqLnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596503; c=relaxed/simple;
	bh=zKN+ejEROu2/+ft86Rxj1GQmm3X+wNku9LV7uZMeQ0k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=THszYnKZkAR7+NbEfezZglOAMijmK9/FFmTt52Fr4HWzLzP06qDME5KjlJuf6QmyAd0n26gyRO+XY8gNX/hVjpcRBJYz7SJQfTlF5mYM1rNG5kEJMqGhM2/YjpSyjVN4vacx7mOEGhe1ZfJ+ttGjgQBJBm16m+CUiyLDnfZ71To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abNOzD1X11NahSUE6G3y9AdgqXN3/J82mx0iUIXXtTkj/x2VoEtrtdqjODd4xIDL+2ma3UXeu1QahulE0kzHTNZBetR5CFYtMNfOY4f7HctlpuQETgTAqvnEgOZl/xbXqDScJsQcAQhk8+zehA4nb9U6kbK1YnNwNd8elkniaAzNR+tkXAH9TfjLiO6MWY9l7ro2C4DDpLmozeda9guXBpADRLieI8eXy3CN9CNRCBKEE1mUmrivcovXLKqnbx5cbrzVniXe1Q5xxPgPfvMHqdiY89dDZ70e3UcZcOaVCjboF/LMBW2X4SLpaC6207PvDZ0DF//FAiJowS+U4DnumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKN+ejEROu2/+ft86Rxj1GQmm3X+wNku9LV7uZMeQ0k=;
 b=j1Vae2+w0pPEVhIcBa0nbizclLvT3FTuzS59015g1HxF98ZInOO69XUYql5+JbK/nNVrAT25gFWcDm2LQEK+o2zGwdlduSj6s4qtYwGMGoYvLEySLTET8S+oajPPGC1GjQeyi/xjJKso0bo3fZa4DStUwNAFK0Y0bS384uVXb53i5iQowsi0jpYoPXsAn911cYcRBWrtUqwaaiXEOnYCiO3NlqVGrMwUq4pxDWMDZsmmI33U9D1ZoVXJX8SSv5r9Id7jhRDEIvb4TEJQkou1413b96p+rof2UnwguXxrOIs9msNOy1Icr9ozB8Ju/n/2XD5cXB8fAi7RHz8TU3Q6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1172.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:21:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:21:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>, Guenter Roeck
	<linux@roeck-us.net>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] peci: controller: Add StarFive JHB100 PECI driver
Thread-Topic: [PATCH v2 2/6] peci: controller: Add StarFive JHB100 PECI driver
Thread-Index: AQHdTx9yVO6tayjU+ESAABYvp2okZLbjpBYAgAACb7A=
Date: Mon, 28 Sep 2026 08:21:39 +0000
Message-ID:
 <ZQ4PR01MB1202B1DDFBCEDC16F7045139F28D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
	 <20260928075956.62298-3-changhuang.liang@starfivetech.com>
 <838cc8f7099bfc5ee1cac9d3aca7a87aa7dfd17d.camel@pengutronix.de>
In-Reply-To: <838cc8f7099bfc5ee1cac9d3aca7a87aa7dfd17d.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1172:EE_
x-ms-office365-filtering-correlation-id: 09d54236-f099-46e8-05ce-08df1d39856c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|56012099006|4143699003|10067099003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 oVCMkvqOmofvzsZj1vaxT9hRw1zLBtehzCsZR4iIwyo+rqgjoj1apH1uOxIPaBRfd7fcKFlJvffzEOiECDGmL3BvWuDdpk5GDG8gQlgjsNxBdzpxTpjsh52GrKRZZ3iShTc+oFksuWDMQaQtVXZU7lwJ9D3Tpktuou2UEGcQaSL0TsotMVhUl5SRmy12S4Ry2jo+YapSLKgaEpzWrKzc8tRujHVp9GfhoZy+rwqhAVdlML6cvjY+y3GqEVFNMpaTS/5tVyOaaMBs+gKbCH+Lxt3BNwUpm0owpcfTqJqOeixdwl6hRcfX2fHl4SBw+sPPZBb+ECdbujMk9tNRhF7hQ0xv4xZfwSqq2qoodK/hVeeVaZ1fr+stq65+lxcfoCg0VBwkrAVBaGCXZcqqPDfzXe7V0ucaOkfWxmD710NsnfZSPy4gJzMeb7Y3DAEBRE9RRmeLXL9MW+WcqRBYq6hv0xSc+Oxgrxx/0T3LMeUSXxCUEt2ta0Qt9FUWZoOsC0EVlYX5Wf4erg6Vo6l5zWX1gPEAvG7Asbww1tN+Ec6FC019bOxFb0Yqbr9biohk53Gk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUVlWHAvWWJXbkpLSC9RTVVkbThnSWJEZDMrL3Jvb21WdHhzWHF5ZUdhRTI4?=
 =?utf-8?B?U053dGNlaXd6akhQOFdaYWROM1VBZlE2RkRWY3R6QWlKdXk2OEJKYk9DN0RQ?=
 =?utf-8?B?VHRZRXVZNGJJS0gwc3RVNXM2SHZaT21HRWJtUVpwb3VKc2wyTklmZmhEQkpS?=
 =?utf-8?B?RHg0NXUyZUtGNkdyUS90OWw1ZW0wanJRZHZQYWJNY2g3UmpmelRISGtVTWJj?=
 =?utf-8?B?ZnBVSmhXbk5XcU00VllFUmNnWnl3bWQ1NXNmZlpDRVZDSkRGKzdLWXhrd1Ba?=
 =?utf-8?B?S3pvQTZreVJpRFhIQWMrSlpQTUFCQWh2WXFvMXp4WTA0OG1aRnlXL3I0S2dF?=
 =?utf-8?B?S1lQVUxDbHNxTVV1dXhFN1JPbk5pTW5YcFhNSmtEdjB1UDZhZ1ZUMjRmV2dI?=
 =?utf-8?B?aWxGREFwVVd4bnd2TEhENjJPay9LT2JkN1Q1Zk1YSG1ReUVjMG1KalJENmNp?=
 =?utf-8?B?bTdPS3QrbWR6QnUzSWJrek5aZllDREZlZnpLV0VqaEhGRlRJZDBGbk1iSHll?=
 =?utf-8?B?aXBXK0M0cngwb3RBSWpod2FIYk1vMlFYdUdyMHNvc0N5cE41b2FkWE5lTmJs?=
 =?utf-8?B?cjNza0F4VGJ5MnlUOGZ1bUtwRFFzZ2Z6cndWenE1WG0yS0s4U3dxVkZBdm83?=
 =?utf-8?B?MldBNnVMb0xERzBjU2xCL25Kc0xHRFVtNTlMbHpndUFKUHFscFpQciszeVA4?=
 =?utf-8?B?SGhUZjdaU090cE9WWTg3UUJXRTBsUDhsZ1llK25BL2Y4eklvL1R6RU1vZC9T?=
 =?utf-8?B?TTQrVFl5OFAveW93L3JEVmgvOXdSbjUyRTNCZWFWcERlbFp6ZzQ3b1U1ZEly?=
 =?utf-8?B?RHIzeEtYeG1XLzhMelA1ZTRDQmljM1kyZVBiQTV5bG9iL1JlQmJ3WTRuVDBi?=
 =?utf-8?B?OGZsbmpXZDJwVHY4TzZ6eHBaR1BZWVFKVW0yZU5tUVo3RDhHYzBUeXBaUTVa?=
 =?utf-8?B?TzdhdTlQRG1FQ3UrLzlkbTFDaU92OHBFa2lTZW5hbnFKQUhJdDFhR3pxMm1P?=
 =?utf-8?B?OThQQWIreHVOSjhPQlB1cVBLdnFQR1hNbUR4Y0QwM0VSenBmeUZ2NWJiWnAy?=
 =?utf-8?B?VXVYeDQ2N2Y5ZGhHVnVTSTh0WGhXMjJNSHdhN3EzYnZhdUVYT25VTVJmVk16?=
 =?utf-8?B?Y2dPTjdVTVR2MXFTbEI1QUdrc1VFaE9YWmJ3N2NVSDU3Q2VSU0FnNVg1RFJX?=
 =?utf-8?B?MEgzZjN0UFc5akJHSlVLT1B1OTJlelVoMnZVeEZwOFVwUjkwcWdaMTg2NExa?=
 =?utf-8?B?RFpLM3UyUzhOQ3JjeGpTUGFyM0ZhQnEvcDVvQnpMUkpZa2w2M1ExczBhSUsy?=
 =?utf-8?B?dkIxeEc0TDNIR0FLRHhvOTd0UEpqS3VJU3lDNWtBZEk3cXRBMTF6Q1NVaERP?=
 =?utf-8?B?MFdkcDNrNWVFemVOWVM0YVRUSHdlVEl6ZitTeVpia3RYOXdXeDdhTDNOOEJt?=
 =?utf-8?B?OFZCNDRoQWNkamJySE1IZjJQU0tBUjdFWHpZaE1jM1pSWkJ1elV2SllxZlAw?=
 =?utf-8?B?cTNCZlNaLzZpcFRsQ2VadGVGMURjTVl0RnowaFJ4VUM0S09sNExpcUcrWVpt?=
 =?utf-8?B?c2FCV3dyZVNxcUFFWi9PTENsVFZ6YlZpeTZ2OUVYK0s4UXhqK0d4NmFqNFE1?=
 =?utf-8?B?ZVo2UFl4cnJLQjM2SVhvdndmTUwxOHpHNWd0ZGhZanhrLzZJSEtWam5nNjFu?=
 =?utf-8?B?MjdlRVgrWllIbjdvSFFnZTNsazlCQkVVR09UeloreW5pUmtrN3JGOWVjSEMx?=
 =?utf-8?B?OVpaNjlCcFB2MDNwNzVUK2dSU0M1SXBiVmFRMVY2Sy9qS0VrRXN4a252azhP?=
 =?utf-8?B?b0xqcGo4a0Vvc2tFdUNBckdQc0hscnQ3dGt4bFBXcWxOOG1PTUxnTkVMdDQ4?=
 =?utf-8?B?TFFiUWVhRHVsOEZNd0RiMm9xYWYwNXZROEUySmR1TDRQYysxTWlTOVdOTmU0?=
 =?utf-8?B?d1ZVM2NyRldSQndoNW1JcDR5QnhxQ1BhSkpPOERDRDdub3BXYlBYeGZTVndm?=
 =?utf-8?B?WnZSVGdzL3ZKc2ZoL2tWTmMwNERrUU5hWWF6czFCSWYwbWxLelNCcUYzeS9s?=
 =?utf-8?B?Y2c3WDFnK1Z3WUJUeFlxM3luSy9ZS2Njb2NVcGVJelhCVXBxTTFWWWZUWFNR?=
 =?utf-8?B?LzBEazQya05rcmNRT0lxeGkxSm9NN2ZZdGVwK2dGMTRFMjdRQWxlUEF4b1A2?=
 =?utf-8?B?ekMxSVNnUmVacUVISlh4VGdkY0lJeXhIRGtTSEVQeWlTWHpzeGhzWVN3Rmxh?=
 =?utf-8?B?T1U4dWxTcE9RQ3podW5lUHYxcGhiamxoSFBFdXhDcm8yZzlheFFuRXlTS1pv?=
 =?utf-8?B?cUYrMSsvU0p3NHljK2s5ZGFQMFlLb0lhMDdiNlprLzB1SVoxOHB6RVNlNWU5?=
 =?utf-8?Q?BPy7mc3WaGWS8bTM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d54236-f099-46e8-05ce-08df1d39856c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 08:21:39.8545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ov0Tt2XakD8oN6x3Fuf4Yk/Y1+0934xd/AoscqGeRrxCZyWAYhXbpySpWgZmXVrv+eVnfkRUCGmC5xz95Epx3CKTsVsGTgu5aCU25ol0Ib4n8UCTi0uWfjCass9rHtYO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1172

SGksIFBoaWxsaXBwDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBPbiBNbywgMjAyNi0w
OS0yOCBhdCAwMDo1OSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBBZGQgUEVD
SSBjb250cm9sbGVyIGRyaXZlciBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQy4gVGhlIGRyaXZlcg0K
PiA+IHN1cHBvcnRzIFBFQ0kgcHJvdG9jb2wgY29tbXVuaWNhdGlvbiBmb3IgQ1BVIHRoZXJtYWwg
bWFuYWdlbWVudC4NCj4gPg0KPiA+IEZvciB0aGlzIGNvbnRyb2xsZXIsIHRoZSBzcGVjaWFsIGNs
b2NrIGFuZCByZXNldCBvcGVyYXRpb24gc2VxdWVuY2UgaXM6DQo+ID4gICBwcm9iZTogY2xrX3By
ZXBhcmVfZW5hYmxlKCkgdGhlbiByZXNldF9jb250cm9sX2RlYXNzZXJ0KCkNCj4gPiAgIHJlbW92
ZTogY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgdGhlbiByZXNldF9jb250cm9sX2Fzc2VydCgpDQo+
ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IE1hc29uIEh1byA8bWFzb24uaHVvQHN0YXJmaXZldGVj
aC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFzb24gSHVvIDxtYXNvbi5odW9Ac3RhcmZpdmV0
ZWNoLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5n
LmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArDQo+ID4gIGRyaXZlcnMvcGVjaS9jb250cm9s
bGVyL0tjb25maWcgICAgICAgICB8ICAxNyArKw0KPiA+ICBkcml2ZXJzL3BlY2kvY29udHJvbGxl
ci9NYWtlZmlsZSAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9w
ZWNpLXN0YXJmaXZlLmMgfCAzNzYNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
NCBmaWxlcyBjaGFuZ2VkLCA0MDIgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1zdGFyZml2ZS5jDQo+ID4NCj4gWy4uLl0N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1zdGFyZml2ZS5j
DQo+ID4gYi9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLXN0YXJmaXZlLmMNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjAwNGNiMjdhNzc0DQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2kt
c3RhcmZpdmUuYw0KPiA+IEBAIC0wLDAgKzEsMzc2IEBADQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBp
bnQgc3RhcmZpdmVfcGVjaV9pbml0X2Nsa19yc3Qoc3RydWN0IHN0YXJmaXZlX3BlY2kgKnByaXYp
IHsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcHJpdi0+Y2xrID0gZGV2bV9jbGtfZ2V0
KHByaXYtPmRldiwgTlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJSKHByaXYtPmNsaykpDQo+ID4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUocHJpdi0+ZGV2LCBQVFJfRVJSKHByaXYtPmNsayksDQo+ID4g
KwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IHBlY2kgY2xvY2tcbiIpOw0KPiA+ICsNCj4gPiArCXBy
aXYtPnJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQocHJpdi0+ZGV2LCBOVUxMKTsNCj4gDQo+
IFBsZWFzZSB1c2UgZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoKSBkaXJlY3RseS4N
Cg0KT2theSwgSSdsbCB1cGRhdGUgdGhpcy4NCg0KPiA+ICsJaWYgKElTX0VSUihwcml2LT5yc3Qp
KQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKHByaXYtPmRldiwgUFRSX0VSUihwcml2LT5y
c3QpLA0KPiA+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCByZXNldCBjb250cm9sXG4iKTsNCj4g
PiArDQo+ID4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+Y2xrKTsNCj4gPiArCWlm
IChyZXQpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUocHJpdi0+ZGV2LCByZXQsDQo+ID4g
KwkJCQkgICAgICJGYWlsZWQgdG8gZW5hYmxlIHBlY2kgY2xvY2tcbiIpOw0KPiA+ICsNCj4gPiAr
CXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cnN0KTsNCj4gPiArCWlmIChyZXQp
IHsNCj4gPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Y2xrKTsNCj4gPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShwcml2LT5kZXYsIHJldCwNCj4gPiArCQkJCSAgICAgIkZhaWxlZCB0
byBkZWFzc2VydCByZXNldCBjb250cm9sXG4iKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1
cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHByaXYtPmRldiwNCj4gc3RhcmZpdmVfcGVjaV9j
bGtfcmVzZXRfcmVsZWFzZSwNCj4gPiArCQkJCQlwcml2KTsNCj4gDQo+IFRoaXMgY291bGQgYmUg
c2ltcGxpZmllZCB3aXRoIGRldm1fY2xrX2dldF9lbmFibGVkKCkgYW5kDQo+IGRldm1fcmVzZXRf
Y29udHJvbF9nZXRfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKS4NCg0KVGhpcyBjb250cm9sbGVyIGhh
cyBhIHNwZWNpYWwgY2xvY2sgcmVzZXQgc2VxdWVuY2UsIGFuZCB1c2luZyB0aGlzIA0Kc2ltcGxp
ZmllZCB2ZXJzaW9uIGRvZXNuJ3Qgc2VlbSB0byBtZWV0IHRoZSByZXF1aXJlbWVudHMuDQoNCnBy
b2JlOiBjbGtfcHJlcGFyZV9lbmFibGUoKSB0aGVuIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKQ0K
cmVtb3ZlOiBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSB0aGVuIHJlc2V0X2NvbnRyb2xfYXNzZXJ0
KCkNCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K
