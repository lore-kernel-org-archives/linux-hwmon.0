Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2103.outbound.protection.partner.outlook.cn [139.219.146.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5A8632B;
	Sun, 13 Sep 2026 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273371; cv=fail; b=Kjv9hbSYEyZGl7fr8OFSw84Om32r1RBwyadw/hW+W6HhCc/nv4cBe65C/2eSXgzF8MadGhPYfCJ/LLLDWMv3ETFokuy4yWRBGMBtL1FDAZzyK2qkK7aB15bNjOmpY05DJNslJsGYf8s3xKKEytiPA9+SHjSLw1QQgplGW5kE+co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273371; c=relaxed/simple;
	bh=jHtEQ+//XEfHTTEZkpbaYnFUCY8kYkvdovg+EEuAQNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T32hI5aFN6U2artuIwNDZpoSwXGfcbkQ40lfNWpcFx/N8GkjfuhzYjv3ZCRWcpYn2PJO8HSbqLxsiIthE2qI2mUmUDwsfK0RuxH1y6dRPsZ4sdqZpjFTFfq26Dp4xEmscRELGefAO/gObcWiIYXDu7poEEdD39eD0UJ7bg3Y9zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQnTvwpNHbHlksHbHZUivPRHTlDNxHBSd6+37RUoMkFDyE2vutwwsbUiivdKy5BIuQ0o9K3JL+Y5xt9wfHZKlDVSbL19Dxg8RhVg4LzLYOZvlfZ5UtSws+M44NZCcTTzi1etevOYNUeOq77YwMo/rrGY7kwL5Jst9irI9cqFtKf06CCK+SAtizOC9ew78R0/2BG8IZywmzyyVeGXLsr4cZr0P0Umk/7qX0ayojbPzL32pDHCgVrmlY6JhBJl92jFC5IE/uJZ71ZjvbXQ9rousoh+Q9bkR3lyShMtD2Sv1zEdp8sKZnV/Gs0sOsKt4gCzyfEr33KvCG/DJ4ao4nAebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHtEQ+//XEfHTTEZkpbaYnFUCY8kYkvdovg+EEuAQNk=;
 b=k0mU1bS6txJqutffNKLXS7Wa+nu9BmvG+Hy9f5VfsZJw/mG5cbwzFAs0nWQTGEGVUmodN2A05ZFWdLF1asEIogsNz/E3Zma7EDIJuxU/dV/aw61VlRiwGQtU4IgC2ZomkLeDdr+X7cWQz+00DfcLbp5LQ7hGBBrRTrsck0nyduTMGLivmLEpAwAu1BJLbgdU1xhbBFlyqTK/f2GcYW8Qbxgc6qzzR8E1epZJ5war9A25wWw/fEQo7oImfq70Op13NrVvtM0mclVqGXFNcL3DT/lboYO+4z+YvOe2sEJt8vlosf+5hftV7/zGUkSL9+gRphVfpOyW6cB/mV53Vqf0Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1169.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sun, 13 Sep
 2026 04:07:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0406.007; Sun, 13 Sep 2026 04:07:10 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Topic: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Thread-Index: AQHdO6kXA4sHfaC14U25FDUP6J6nyLbLGoOAgADY2xA=
Date: Sun, 13 Sep 2026 04:07:10 +0000
Message-ID:
 <ZQ4PR01MB1202109A402BBFDAD908C08EF2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-7-changhuang.liang@starfivetech.com>
 <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
In-Reply-To: <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1169:EE_
x-ms-office365-filtering-correlation-id: 850a3e9a-370d-4533-d2dd-08df114c7bc7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|4143699003|6133799003|56012099006|3023799007|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 LdrF/I594g74Xq6XjTC8H1xOtxAGsdD1ntNvMT7ZXfwI734w2wpvwC4bsIHXwAsfSEiJ/ZyH2rVfmATO03Z49qIDUOsllBtxfv8ROJzxd7zjQE049csxd7/7g+3Zq1GT5BX2ojKXGUwjbpMWe5U4U6KbONoXIoCjG586qvmyxAMvknx1JSx3OCQf1dDOOqgYeU38uSxcPbyjq45k4Zc6wyWi0CFyzBQrqSMYEWXIZRcudd0CoGd1Cuy9C3C5aZrdlz/mMtMvyR/HX5Jr0m5f4gbIjAiJTQxn51a3OiCBdrQx0eYtzv7OMnJQ5ZM84s6PymK2iDbYCq0UK5qg/x8lDXyIaQBj93+yrN74g+QvgYUJrfla4866EiRiAdS3tRIJi9zU3f2/UgAlNxVsgR9cZzeu54K0o0ldOtfzGhmxH45V44R/QpLS4xHft3decv74ykiLmSwNcZ/SANfROsJomv/FIe+MuJTqlO8gKEYvQkJfrCrilU9JgjCpuPXeJ48FI+9zcEybJII3hRS3fDQIAve2f2iZBcbihCcv7u3u403zo14fnw3oosGk2yfNlFB0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(4143699003)(6133799003)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmRxWGJ2QVdZbFc3YysxYTBUNFNVYVNtaWovQ2NBaWVBUUtMaUIreExvbGpk?=
 =?utf-8?B?djczNGxSOVU5d3phK3JXQTJzSnZzT0JibU1aNEpFWnhMck1rcGJkRlB6a0Nw?=
 =?utf-8?B?MCtuaUsxdURyR0F2QjFlbllOQi8ydDdFVHh6Wm4zZVF3cGNMUExYQUZnYk1y?=
 =?utf-8?B?S0o3cGt1djlaZjdzVXNpWW5UV0F4K0lJdG92K0JPUmwyMVhOd04zb0NPREl5?=
 =?utf-8?B?anVyeCtiNUZsbnVXczFrNGpsSVBGa1BqMXBBNjhyZ3RZbmR5ejMrdkFPZ0Iz?=
 =?utf-8?B?b29IcnhxOVdLYnlzblM1R0tRdnNWZTE4WEFzR3Z2UjFXZUFoQmRYOVgwK1BZ?=
 =?utf-8?B?Zzc4anJVTWYxSG5ZbksxempzMGd5NmE5bDdUVEp6d2R2Wk5DaDhnZXQ1Y24y?=
 =?utf-8?B?Q3hpY3UvcmVFZnNVYWpQVHBzdUhXZFB4UXRaTk92Um5pWHp6U2hRZHYzWDFa?=
 =?utf-8?B?UlhNZEJVMndxNFgyWDhBOGwwa0ZmQWdxYlBEWWZkb1ppR29oVE5GYlptRlh3?=
 =?utf-8?B?ZWQra2gvYkNTRXRnRWJndzhVK0FiQXVMOHNMWitVV0NzUHpRelFDNld1d3Qr?=
 =?utf-8?B?STJFS1JCNHhqN3hWejlqejMwM1NRMzlTSUsxRWJPdlhwL0dGdkJPenhJYnEy?=
 =?utf-8?B?bkU5VndnaDVsd0FjMmZPKzV3azlFWmcxV3d3WmFPaDRHbXJ1Z2t4NlhqQnBu?=
 =?utf-8?B?djNRbDVrMER1WUQ5SW1tK3pjaDl2L04yUGx5R2l0eHlZR3p6dGR0K3JyYlhU?=
 =?utf-8?B?a3NaT0l6b0V6SWtDNGhDTEhWMWcwK25KdWkyUHJvS2RrdUpwaTV2bVo3Nksz?=
 =?utf-8?B?R0g3UXg2VTYyUSt4WXkzc0dWSW82RlRJVENnUk1NdXpvMVk2MUl0cGI1MVBy?=
 =?utf-8?B?QWIzVUVvaUpHRWVxamtOdVJKVVlsbncvMlIraFNKdUExOVIwbDZSZmUydi95?=
 =?utf-8?B?d1RsbldSQ2srVlhVTXlsOTR5andVUFBEMzh0R1QwTHpVd3k4RnRZdHlKekNt?=
 =?utf-8?B?cVZZK3BQc3ZtZ0twUERNcXByZUY1WStBVFhmc3U1VlpMUzdTV3NoZ0lpR2tF?=
 =?utf-8?B?dUZkRlpmY082cnUvTytITG5XeUt5Y1Jzb2FlbXkxUzQvaFV1Q2owUTJUKzlU?=
 =?utf-8?B?RUxGOFBvenNQcDJiN1p4aUVTS3NPNXNlMjhXWDZqdlhCSTFKbG1DczIzVVVz?=
 =?utf-8?B?aC8yRXA1bTc1SExpbFhzTStLRG5Vd3FzSEMrNUM2eEZhcERFWDdaeWoyUEVE?=
 =?utf-8?B?c2MwRVZEaXhVQ1F3Y3VHZi85dnY0Sjk1OSszY0JFanZQc3dqdjNLUFpKWVhh?=
 =?utf-8?B?RjJEZDVVajFKejVnZXc0TGNONExZZTNjWjlNSml3QXBTMXRjbGtOcUNuTUhr?=
 =?utf-8?B?SStkMWN1d1dZeU5RR00wMXhXYmpwTWUxQStNeXRDKzRXVnpJTlkzMmxaNHdD?=
 =?utf-8?B?S1JyWHgvK29FTGptNVlCWlc1cEdqQkl3MVR3c2hOeC90SmdsS3dJd05RdCt2?=
 =?utf-8?B?OURnbktUK0RiRkI1anhvaG5XNk5JZmhmV21odFc1bGc1VytqTCt1ZjYvQjdP?=
 =?utf-8?B?SWlMbXJBT0ZleHdzUnd0TVgzY3NldmF6SDdEL005TlY4RDE1U3FyNWcwZ0Q5?=
 =?utf-8?B?dUw1SCtoL293NHhtcW5DeHAxRGVyL0x4Q2c2VHRNbkx4TFFYNDhiTVJ1WWNI?=
 =?utf-8?B?NU55cFl5SzEwREJuQ2ZYRmVwQmUyUjhMS1hpbTZRQW1iWEU2VnhaVVpYQ1Bn?=
 =?utf-8?B?R2w0dGNRY1RVVXQ5UlMrOUkrbExPODRpNGs2eXAwOVpnc2pqbzJzUHZyV3V1?=
 =?utf-8?B?bmQ0ZzR2dE9TTGg5MGhHSk1FZmYwRUhiVUVCSWVIYTZiUGN1SXF4RE0zZ3pw?=
 =?utf-8?B?NytRSGZUOFQ5NmNnVm5STVVVWk1BQURIalg5MGJnd25jV3NHRTBkVU9qam0x?=
 =?utf-8?B?cGFic2dETFB6b0c1UkIvTnEyMDFyRlBUQjZjMU1wQXRXMm50L01VU0Exd0Ey?=
 =?utf-8?B?UGZMVVJDY1VCRW9yenNicUYxcUhJTVhXRDNja2hEZi9Cc09yTkhyYUpnV1BT?=
 =?utf-8?B?T2lqY0ZwdDArTmVNN1IwVm5QWldZTFh1cG1IdmNQZUVHeWpFUjdLZTVwNjNY?=
 =?utf-8?B?YXlJSTM2U01HV21GN2VQeWQzck1IczFMUERlTFQ3bkdnUktSZVAvV1JHM0kr?=
 =?utf-8?B?eGordHlnL1dJTC9HZkEweW9QcE5nWU9vTkQvdzJHMlg0R3JHMTBBNEgwaEJJ?=
 =?utf-8?B?UnI5cVFGWk96eDlWSHlobzhOS3VkMkNKemFTWFZma2JVV0d6bEJlZ05FRk0x?=
 =?utf-8?B?TnNBaUxWWW5ERU4yS1dJWkVhY3BuL044R1BONmlFVGhUWkcwNlM4bWd0dnpG?=
 =?utf-8?Q?A7WCmoRMC8Dhdc1s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 850a3e9a-370d-4533-d2dd-08df114c7bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2026 04:07:10.1212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbxrNmJp3bP5JghFY96Q5raUk/zg5/tRBQUZi547S6K+kFp2MaLLSVzkiZfe5Sk72t1qJvOUlYzj0d9wfc68St+hsX41UAVh7KECwreAGP7ZNEzVCJrpGZbERtfZSU3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1169

SGksIEd1ZW50ZXINCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIDkvMy8yNiAwNjoz
NCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgR3Jhbml0ZSBS
YXBpZHMgKEdOUikgcGxhdGZvcm0gaW4gUEVDSSBESU1NIHRlbXBlcmF0dXJlDQo+ID4gbW9uaXRv
cmluZyBkcml2ZXIuDQo+ID4NCj4gPiBUaGUgR05SIHBsYXRmb3JtIGhhcyBkaWZmZXJlbnQgRElN
TSB0b3BvbG9neSBmcm9tIHByZXZpb3VzDQo+ID4gZ2VuZXJhdGlvbnMsIHdpdGggMTIgY2hhbm5l
bCByYW5rcyAoQ0hBTl9SQU5LX01BWF9PTl9HTlIpIGFuZCAyDQo+IERJTU0NCj4gPiBpbmRleGVz
IHBlciBjaGFubmVsLiBEZWZpbmUgdGhlc2UgbmV3IGNvbnN0YW50cyBhbmQgdXBkYXRlDQo+ID4g
Q0hBTl9SQU5LX01BWCB0byB1c2UgdGhlIEdOUiB2YWx1ZSBzaW5jZSBpdCByZXByZXNlbnRzIHRo
ZSBtYXhpbXVtDQo+ID4gYWNyb3NzIGFsbCBzdXBwb3J0ZWQgcGxhdGZvcm1zLg0KPiA+DQo+ID4g
SSBhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IGRpZmZlcnMgZnJvbSBwcmV2aW91cyBtb2RlbHMsIGJ1
dCBvbiBHTlIsDQo+ID4gcmVxdWVzdHMgdG8gcmVhZCBESU1NIHRlbXBlcmF0dXJlIHRocmVzaG9s
ZHMgKERJTU1fVEVNUF9NQVgvDQo+ID4gRElNTV9URU1QX0NSSVQpIHZpYSBQRUNJIGFyZSByZWpl
Y3RlZCB3aXRoIGNvbXBsZXRpb24gY29kZSAweDkwDQo+ID4gKGludmFsaWQgcmVxdWVzdCkuIFRv
IGhhbmRsZSB0aGlzLCB0aGUgcmVhZF90aHJlc2hvbGRzIGNhbGxiYWNrIGlzIG5vdA0KPiA+IGRl
ZmluZWQgZm9yIEdOUiwgYW5kIHRoZSB2aXNpYmlsaXR5IGxvZ2ljIGlzIHVwZGF0ZWQgdG8gc2tp
cCBleHBvc2luZw0KPiA+IHRoZSBtYXggYW5kIGNyaXQgdGVtcGVyYXR1cmUgYXR0cmlidXRlcyB3
aGVuIHRocmVzaG9sZHMgYXJlIG5vdA0KPiA+IHN1cHBvcnRlZC4NCj4gPg0KPiANCj4gQXJlIHlv
dSBzdXJlIHRoaXMgZG9lc24ndCBqdXN0IHJlcXVpcmUgZGlmZmVyZW50IHBhcmFtZXRlciBjb252
ZXJzaW9uIHdoZW4NCj4gY2FsbGluZyBwZWNpX3BjaV9sb2NhbF9yZWFkKCkgPyBUaGUgdHJhbnNs
YXRpb24gZnJvbSBkaW1tX29yZGVyIGFuZA0KPiBjaGFuX3JhbmsgdG8gdGhlIHJlZ2lzdGVyIG51
bWJlciBzZWVtcyB0byBiZSBkaWZmZXJlbnQgZm9yIGVhY2ggYXJjaGl0ZWN0dXJlLg0KPiANCg0K
WWVzLCBkaWZmZXJlbnQgbW9kZWxzIGhhdmUgZGlmZmVyZW50IGNvbmZpZ3VyYXRpb24gcGFyYW1l
dGVycy4gVGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGEgcmVmZXJlbmNlIGZvciB0aGlzIHBhcnQu
DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vY3AtaG0tb3BlbmJtYy1vcGYtYW1pL2xpbnV4L2NvbW1p
dC9mODUxYTc5MTQzNTU2ZjBjMTM4NjE3ZDY4ZTkyNDA3MTQzNGQ4YmI3DQoNCkhvd2V2ZXIsIGFm
dGVyIG15IGFjdHVhbCB0ZXN0aW5nLCBJIGZvdW5kIHRoYXQgdGhpcyBsb2dpYyB3b3VsZCBhbHdh
eXMgZ2V0IGFuIGludmFsaWQgcmVxdWVzdCwgY2F1c2luZyBpdCB0byBmYWxsIA0KdGhyb3VnaCB0
byB0aGUgc3RhdGVtZW50IGJlbG93Og0KLyogVXNlIGRlZmF1bHQgb3IgcHJldmlvdXMgdmFsdWUg
Ki8sIA0KDQphbmQgaW4gdGhlIGVuZCwgaXQgYWN0dWFsbHkgbmV2ZXIgb2J0YWluZWQgdmFsaWQg
ZGF0YSBmcm9tIHRoZSBwZWNpIGNsaWVudC4NCg0KU28gaW4gbXkgY3VycmVudCB0ZXN0IGVudmly
b25tZW50LCBJJ2xsIHRlbXBvcmFyaWx5IHJlZ2FyZCB0aGlzIHBhcnQgYXMgZGVhZCBjb2RlIGFu
ZCBub3QgaW5jbHVkZSBpdCBpbiB0aGlzIHNlcmllcy4gDQpJdCB3b3VsZCBiZSBncmVhdCBpZiBJ
d29uYSBjb3VsZCBoZWxwIGNvbmZpcm0gdGhpcy4gVGhpcyBhbHNvIG5lZWRzIHRvIGJlIGltcHJv
dmVkIGxhdGVyIGJ5IHNvbWVvbmUgd2hvIA0KdW5kZXJzdGFuZHMgdGhpcyBDUFUgbW9kZWwgYmV0
dGVyLg0KDQo+ID4gVGhlIG1pbmltdW0gUEVDSSByZXZpc2lvbiByZXF1aXJlZCBmb3IgR05SIGlz
IDB4NDAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1
YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2h3bW9u
L3BlY2kvZGltbXRlbXAuYyB8IDM2DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BlY2kvZGltbXRlbXAuYw0K
PiA+IGIvZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMgaW5kZXggYmQzZTg3MTVkZmVjLi45
ZTk4ZWZmZWI5MjgNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2h3bW9uL3BlY2kvZGlt
bXRlbXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaHdtb24vcGVjaS9kaW1tdGVtcC5jDQo+ID4gQEAg
LTM0LDggKzM0LDEwIEBADQo+ID4gICAjZGVmaW5lIERJTU1fSURYX01BWF9PTl9TUFIJMg0KPiA+
ICAgI2RlZmluZSBDSEFOX1JBTktfTUFYX09OX0VNUgk4DQo+ID4gICAjZGVmaW5lIERJTU1fSURY
X01BWF9PTl9FTVIJMg0KPiA+ICsjZGVmaW5lIENIQU5fUkFOS19NQVhfT05fR05SCTEyDQo+ID4g
KyNkZWZpbmUgRElNTV9JRFhfTUFYX09OX0dOUgkyDQo+ID4NCj4gPiAtI2RlZmluZSBDSEFOX1JB
TktfTUFYCQlDSEFOX1JBTktfTUFYX09OX0hTWA0KPiA+ICsjZGVmaW5lIENIQU5fUkFOS19NQVgJ
CUNIQU5fUkFOS19NQVhfT05fR05SDQo+ID4gICAjZGVmaW5lIERJTU1fSURYX01BWAkJRElNTV9J
RFhfTUFYX09OX0hTWA0KPiA+ICAgI2RlZmluZSBESU1NX05VTVNfTUFYCQkoQ0hBTl9SQU5LX01B
WCAqDQo+IERJTU1fSURYX01BWCkNCj4gPg0KPiA+IEBAIC0xMjUsNiArMTI3LDkgQEAgc3RhdGlj
IGludCB1cGRhdGVfdGhyZXNob2xkcyhzdHJ1Y3QgcGVjaV9kaW1tdGVtcA0KPiAqcHJpdiwgaW50
IGRpbW1fbm8pDQo+ID4gICAJaWYNCj4gKCFwZWNpX3NlbnNvcl9uZWVkX3VwZGF0ZSgmcHJpdi0+
ZGltbVtkaW1tX25vXS50aHJlc2hvbGRzLnN0YXRlKSkNCj4gPiAgIAkJcmV0dXJuIDA7DQo+ID4N
Cj4gPiArCWlmICghcHJpdi0+Z2VuX2luZm8tPnJlYWRfdGhyZXNob2xkcykNCj4gPiArCQlyZXR1
cm4gLUVPUE5PVFNVUFA7DQo+ID4gKw0KPiANCj4gVGhpcyBjaGVjayBpcyB1bm5lY2Vzc2FyeTog
VGhlIGF0dHJpYnV0ZXMgYXJlIG1hcmtlZCBhcyBub3QgdmlzaWJsZSBpZg0KPiByZWFkX3RocmVz
aG9sZHMgaXMgTlVMTCwgYW5kIHRoaXMgY29kZSB3aWxsIG5ldmVyIGJlIGNhbGxlZC4NCg0KV2ls
bCBkcm9wIGl0Lg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=
