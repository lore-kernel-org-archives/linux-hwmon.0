Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A7386C1E;
	Wed, 16 Sep 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520292; cv=fail; b=QWHxo1BjMPGmQQKE0kt7hUfq4uERd3hlCMHxt2EorlZw7dy6+L3IzKSKYlm4XvMZ6fuFQGixirAkJ72S53wCJ4qa2NECJWWVI09CE6Rvh+1jCEIVvvoPuIeTkFQL9e9Q4y/cfQlmITWqSVsY9z6+NhOWP1wfT1Q4GIwtsBBnsdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520292; c=relaxed/simple;
	bh=Nppx/t30depvwuQflkF1afQCm+eVFjnDcpRJBQrDr7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h9MQWDvVZmc11YvK9hxFg81NoB4vGfoqsQsPodrd3tRTkATkqB508EDmYekeWt9h2i1ZHkbKbWllUu2Rh3jm2rKlnpBQkeoM2zBWGq0SZ9mvaSDVTwjJUds60bdbphECbVb6lfjBhYfLcLFHURRWuRlRwT/3tiYqPzcZxOI95KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiWquKUJD7e+aSfGMKf0oH/wGtFFZhcYyTreOQzCU71p4+ITosLn3XenqPr+sPIcb0X6Wt+jU6miHV/q0sJNCS7fJvKeCvX27X07fEC2+Jb2gihezJEzHV5sjaPi4eGMCNhDHayHAVzuwrcP2yfiJe+bbO5+07P4khVrEpXreoxbjka+U4a6252/HOGQ//KW3h8j98D2hjpXF5D/KWtE3+4DKlnUtQUDD74qxS6pxnEwcOwh03QbL8nJ0BFF9hcX4sV4f8/8I1lxQEkUfkzAulj16TxkOLEMMHIZ+hpTePb4YfTYiYGLOT2hAwRXl7RptmwSPPWlR8CGsprBX8sFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nppx/t30depvwuQflkF1afQCm+eVFjnDcpRJBQrDr7Q=;
 b=R64DivDVJWZQxo1rmOVoYV7IcnHlNwgYPOidZAtY2bBuBIrSht2aIM7q+Ju3f6qpEoLS7/xpBgQ7h6b1C4PfaRIzUtDnIHCOWqOFAu+ncafxqsDLGG0d4tyEUByvb48fX1Up9KsY7mxKLh7PSeYm+AChuRlJZwwJSOD/hsP5JlqmsrKXcseI4A/j8Ryk3cHRz2w+KbKiPw6Gptu0RiDNfG1KpHIQh9mnj7ow2vJB9nEeG0DqRqtPou2j8hSaVvcF/pxeT9GwRYEvhUZ5PBm+A4onfzf3TcQ3QLPMYUL9rvLgk+4iL0QAQPAgCxevaZlvNxHuxlzqqMIL23UhwrS8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1249.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 00:57:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0428.008; Wed, 16 Sep 2026 00:57:54 +0000
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
Thread-Index: AQHdO6kXA4sHfaC14U25FDUP6J6nyLbLGoOAgADY2xCAAAKHgIAEf5aA
Date: Wed, 16 Sep 2026 00:57:53 +0000
Message-ID:
 <ZQ4PR01MB1202537F45A6D33446A3E080F2B92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-7-changhuang.liang@starfivetech.com>
 <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
 <ZQ4PR01MB1202109A402BBFDAD908C08EF2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <eefdb261-49d7-42dd-9ec8-850789852bec@roeck-us.net>
In-Reply-To: <eefdb261-49d7-42dd-9ec8-850789852bec@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1249:EE_
x-ms-office365-filtering-correlation-id: 65389338-5270-417c-07dc-08df138d8a47
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|38070700021|6133799003|3023799007|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5saHXZfNL2IMj4PCf9is1mi8uPXF/Ai7xkdlsYodd8LWvskHAiOmznQPXDK+5H5yTIWlq1CJLLdEdY0jNCdU3oQVziXQlJ3n0V16n821LKohdM5D/2uylG73KVsPBxkBkysUZu4sqE4+BEAgxrUAq22vKe/rMgZV0Pp8y91Z0sJIl+Ftj4K7F3Dbtc6OaWx7DzYPITfNBTpAKy4OQRcL9aPhzuiDGKcfCMAJRHVI1QmhT4pBSkQ0zKAuVN3DmxIrtk5JxJhVOM0+Dn9cJNpPf/QCu8iaSJ4xRXZHiW+oBX8tVGS/9QfYFFbGsYatbTf6WF13cPB3LXhakzUr10Bl1EP6MqO8G1twwxFop3tYwNbJ7RhQcNIk9Qxjq450WkL6qVbAqunnNXojzxXFOtGRihhThxL6/3f1xv+ZCi36+dlMM8Xhur1AcNOlADnhWRfQsJ6IHpemHDJTyinz8Ymb8nL/Gls+SqymW6RB8iCoGrZ8mJFukJyR8TGsLHzO8FrWP0X6pd0P3kNU4WltxWQl+ZqWo+CCpKFMsCifT8iMAX0AuRBgtomime3ZMLyXUMwb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(38070700021)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1NDUDV2OW1pL2g2U1JHcCt2ZFFWcjYweUVWdHBMaExmdmRlQ0lVK2hZMVVB?=
 =?utf-8?B?WTk0c0pLNXlOQkcyVDVoYnE2bTltWFY1QkZDY1p4U3dnWWpTNmh1SGhlZXpU?=
 =?utf-8?B?TUQ3ZDIzL1ZpM1hVM3gwc0FESlBEUWNobHBLSzZrWk1tU0dqcUUya3oyeDRa?=
 =?utf-8?B?QVFMajgzRFpjTzVVNHZsVXdINTgrM2J5enErQUZOY3ZWempEd29MejRMN0ZZ?=
 =?utf-8?B?a3k2QUpETHI5cWM4dTdscGFtT0VYTmNueTZDT2ZyQVh4c25oZjJ1SGtNaHR1?=
 =?utf-8?B?UlFaNjRHL0oxSlhtWGQwWXJXM3hSbVpQeTBqbVluU21xekpybXpMRzI0bnlG?=
 =?utf-8?B?aTd3dDNCWEttUFcwNXRYclZvNElqNnhnaEo3WnJTTHBSd0dRLzhRaHJLMTZB?=
 =?utf-8?B?dkpFZU5XZ3ErT2pBRWE3d1I1ckNRZmdSMFNXUm9oVlQ3em8rMjMyRWg5eGFC?=
 =?utf-8?B?bE15Vjd5WXFmMzFBei9SN3lESkN0S3ZRU1ZHMGRvZXNWV1dETHljamJzMkdv?=
 =?utf-8?B?Y3JsYXBPcEhHa2x3UWYzK3BIell1QWlSdDN4cTUvaXRLalJKb2hScGQyRE4v?=
 =?utf-8?B?TzBuanVCRGJUdzV1eTFmci9XZGIwT3FOcC9iNFliRHphUW9MdHNMRXdWaUdr?=
 =?utf-8?B?RzhTSUQvU2grZkYwSHVUeHQ1WW1oWDJVZHIwaW1SSG56bXJxaWVsbWUvR2hC?=
 =?utf-8?B?YzFRdEtqQURjQXRyY0RUZ0F6UVp0d2NML0JHQTM3dUM0bGFqbTlRbUVacEov?=
 =?utf-8?B?c3gwUmY2NXFqcDVjMUdhYTlRMUpyUWhJdThXYnRwVm56T3UzRDFYTVdHeUxx?=
 =?utf-8?B?VFJoMXVuU1hudGlFdEt1LzEvMWVyL09PYTBmc0pWWnphT1crVmlqU1ZUazFm?=
 =?utf-8?B?MkpPSUIwajh1RnM3MFFPZlZncFNHRUJjbFFNRkVhbEx1eVNsNlZENVBicy9Y?=
 =?utf-8?B?N3VLTU5ZZmF3RXlGN3p5bXJIZWZXT0R0bS9ZNmdTSkRnTFJadmF2NUMrd2ZT?=
 =?utf-8?B?TEJYTDd2YmpSVlNzblU4cnByN0x4cFdackVFWjN4aHlFa1VFWXdLS0ljVnBm?=
 =?utf-8?B?OFBEdGFrNEpjekhVOEQyZXFMeWcvNGUyWmVYSGFlRXlyYjluSnpIdk5Iak9B?=
 =?utf-8?B?a0FQbnZEc0ZNcmhYeUF0U3B0UEo1d1Ntb1lRVGFSL2QrNW9KWEdOSGNjZzFZ?=
 =?utf-8?B?SlQ5T0dyOXFyNkswdjZKRzNIa0pUV1hKakY0Wlk3ZTFmaDhmMmhKWHp2Zml2?=
 =?utf-8?B?ZmVKdFZPYkhlbk9pbWZuRDZZeEZ0bzlaZUdjQ05KVERoa1hEV1h6Z3hET3JG?=
 =?utf-8?B?MTl5Kzl0MjdYSVp2MmxjUldhRWZEaFJqUnkxbWFZV0ZHeENWRElTNHFxei94?=
 =?utf-8?B?cFg3MG9sUkdZRElmdmNWKzYydUp3N0E4NUg1Q0FmUWxYQW1SQlk4ZmhUYWph?=
 =?utf-8?B?MWd0S2g1TEp5M29VZVVHdFh3ZU0zaXBZaFMxemNRMUtMSnM3TStOQ0FSL24y?=
 =?utf-8?B?MFFHTHMyQ3ZoWlNHOFo4RkY1aEhpazE5U0FmTWJGSHJ6V3AvN2JKOXd3WWU4?=
 =?utf-8?B?WVd6OW1oZEhCTkV4MTZuL0xadUIvQ1R1S3Nyb3RUTXFkSEpUM3duQy80ZlhW?=
 =?utf-8?B?aS8yeU9wbDFCaGdybHRQZlg3VWJ4endpWWNGSmp4MVN4TVB3SXFHL1BhS0JF?=
 =?utf-8?B?SEc1aWNZMGdoV0xxSzNaQnM3R1o2VEVvSHR6VEtheHB0M0xPZjZpakozbFlv?=
 =?utf-8?B?aHY1Z3duYXdXbE5DV3EvOVEwUmREK0xhc2F1UG9hNTNsajAwRE5MQlhUQ0w1?=
 =?utf-8?B?TXhpaXMxMzhIMjZzWnliYWdJWDhrcWlWK3hpTFp3V2JLeVZNV2VhSjZ0c0xJ?=
 =?utf-8?B?OVVBejg5RXM5UzZkODZMU1BLQ3JYZ3pKUEdQUGRrMDUwR1I3UEtoc0YzOVEz?=
 =?utf-8?B?VDF4eFNWVEtjQ1JHWEIxOTMzL2dJUytIRWpSd2xxMDZ3TXBuYkVmTUk5OXh5?=
 =?utf-8?B?RW1WY1kwR2VCN0pUNGd1RjVrdmdhVUxWSUEzUndqUUdsckVzRWg3TS9EQkFv?=
 =?utf-8?B?NS81N2s5MkV5OU8xczhvSFR3VStkMFRtZWNtU2lUZ0FITWdyajkzSUt3T0tj?=
 =?utf-8?B?VCtjVU5qWlIyTWQrVGJCVWNNRDRmdlBzTm1KZEQrdVBGMVVnTnJKR05JT2NV?=
 =?utf-8?B?cHk5eEdDbGwwMDVESmhnSTBBdEFHQkIzZFdReEhDbERCUGlkZnhzam1rQUp6?=
 =?utf-8?B?a1NDNTAxMTJScU5ISEw3QWdsKy9lbm9Zd3ZMdjd3aHY2T0pmc1ZLTlc4NjRn?=
 =?utf-8?B?Q3BjdXlDMlpkdlJtZlpxR3VIUDdxRGgyN3AwQTB3VkE5VUxDOTErWngraWdW?=
 =?utf-8?Q?xBCLX4nRkWmQecJ4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 65389338-5270-417c-07dc-08df138d8a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 00:57:54.0029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: upVovY4EL7ZCdKCSiIYr0hfD94UaqzZycQRfIyXoEK/Yb2+sqQYcg5VLgBQzWB6YfbhXyhpgD+r/QapEi5HPolv+q1rfYvOqVWOp7UyUsSPGkufBbNoWKjsJGqn4SUnf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1249

SGksIEd1ZW50ZXINCg0KPiBPbiA5LzEyLzI2IDIxOjA3LCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiA+IEhpLCBHdWVudGVyDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4N
Cj4gPj4gT24gOS8zLzI2IDA2OjM0LCBDaGFuZ2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+Pj4gQWRk
IHN1cHBvcnQgZm9yIEdyYW5pdGUgUmFwaWRzIChHTlIpIHBsYXRmb3JtIGluIFBFQ0kgRElNTQ0K
PiA+Pj4gdGVtcGVyYXR1cmUgbW9uaXRvcmluZyBkcml2ZXIuDQo+ID4+Pg0KPiA+Pj4gVGhlIEdO
UiBwbGF0Zm9ybSBoYXMgZGlmZmVyZW50IERJTU0gdG9wb2xvZ3kgZnJvbSBwcmV2aW91cw0KPiA+
Pj4gZ2VuZXJhdGlvbnMsIHdpdGggMTIgY2hhbm5lbCByYW5rcyAoQ0hBTl9SQU5LX01BWF9PTl9H
TlIpIGFuZCAyDQo+ID4+IERJTU0NCj4gPj4+IGluZGV4ZXMgcGVyIGNoYW5uZWwuIERlZmluZSB0
aGVzZSBuZXcgY29uc3RhbnRzIGFuZCB1cGRhdGUNCj4gPj4+IENIQU5fUkFOS19NQVggdG8gdXNl
IHRoZSBHTlIgdmFsdWUgc2luY2UgaXQgcmVwcmVzZW50cyB0aGUNCj4gbWF4aW11bQ0KPiA+Pj4g
YWNyb3NzIGFsbCBzdXBwb3J0ZWQgcGxhdGZvcm1zLg0KPiA+Pj4NCj4gPj4+IEkgYW0gbm90IHN1
cmUgd2hldGhlciBpdCBkaWZmZXJzIGZyb20gcHJldmlvdXMgbW9kZWxzLCBidXQgb24gR05SLA0K
PiA+Pj4gcmVxdWVzdHMgdG8gcmVhZCBESU1NIHRlbXBlcmF0dXJlIHRocmVzaG9sZHMgKERJTU1f
VEVNUF9NQVgvDQo+ID4+PiBESU1NX1RFTVBfQ1JJVCkgdmlhIFBFQ0kgYXJlIHJlamVjdGVkIHdp
dGggY29tcGxldGlvbiBjb2RlIDB4OTANCj4gPj4+IChpbnZhbGlkIHJlcXVlc3QpLiBUbyBoYW5k
bGUgdGhpcywgdGhlIHJlYWRfdGhyZXNob2xkcyBjYWxsYmFjayBpcw0KPiA+Pj4gbm90IGRlZmlu
ZWQgZm9yIEdOUiwgYW5kIHRoZSB2aXNpYmlsaXR5IGxvZ2ljIGlzIHVwZGF0ZWQgdG8gc2tpcA0K
PiA+Pj4gZXhwb3NpbmcgdGhlIG1heCBhbmQgY3JpdCB0ZW1wZXJhdHVyZSBhdHRyaWJ1dGVzIHdo
ZW4gdGhyZXNob2xkcyBhcmUNCj4gPj4+IG5vdCBzdXBwb3J0ZWQuDQo+ID4+Pg0KPiA+Pg0KPiA+
PiBBcmUgeW91IHN1cmUgdGhpcyBkb2Vzbid0IGp1c3QgcmVxdWlyZSBkaWZmZXJlbnQgcGFyYW1l
dGVyIGNvbnZlcnNpb24NCj4gPj4gd2hlbiBjYWxsaW5nIHBlY2lfcGNpX2xvY2FsX3JlYWQoKSA/
IFRoZSB0cmFuc2xhdGlvbiBmcm9tIGRpbW1fb3JkZXINCj4gPj4gYW5kIGNoYW5fcmFuayB0byB0
aGUgcmVnaXN0ZXIgbnVtYmVyIHNlZW1zIHRvIGJlIGRpZmZlcmVudCBmb3IgZWFjaA0KPiBhcmNo
aXRlY3R1cmUuDQo+ID4+DQo+ID4NCj4gPiBZZXMsIGRpZmZlcmVudCBtb2RlbHMgaGF2ZSBkaWZm
ZXJlbnQgY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzLiBUaGUgZm9sbG93aW5nDQo+IGNvbW1pdCBo
YXMgYSByZWZlcmVuY2UgZm9yIHRoaXMgcGFydC4NCj4gPg0KPiA+DQo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9vY3AtaG0tb3BlbmJtYy1vcGYtYW1pL2xpbnV4L2NvbW1pdC9mODUxYTc5MTQzNTU2Zg0K
PiAwDQo+ID4gYzEzODYxN2Q2OGU5MjQwNzE0MzRkOGJiNw0KPiA+DQo+ID4gSG93ZXZlciwgYWZ0
ZXIgbXkgYWN0dWFsIHRlc3RpbmcsIEkgZm91bmQgdGhhdCB0aGlzIGxvZ2ljIHdvdWxkIGFsd2F5
cw0KPiA+IGdldCBhbiBpbnZhbGlkIHJlcXVlc3QsIGNhdXNpbmcgaXQgdG8gZmFsbCB0aHJvdWdo
IHRvIHRoZSBzdGF0ZW1lbnQgYmVsb3c6DQo+ID4gLyogVXNlIGRlZmF1bHQgb3IgcHJldmlvdXMg
dmFsdWUgKi8sDQo+ID4NCj4gPiBhbmQgaW4gdGhlIGVuZCwgaXQgYWN0dWFsbHkgbmV2ZXIgb2J0
YWluZWQgdmFsaWQgZGF0YSBmcm9tIHRoZSBwZWNpIGNsaWVudC4NCj4gPg0KPiA+IFNvIGluIG15
IGN1cnJlbnQgdGVzdCBlbnZpcm9ubWVudCwgSSdsbCB0ZW1wb3JhcmlseSByZWdhcmQgdGhpcyBw
YXJ0IGFzIGRlYWQNCj4gY29kZSBhbmQgbm90IGluY2x1ZGUgaXQgaW4gdGhpcyBzZXJpZXMuDQo+
ID4gSXQgd291bGQgYmUgZ3JlYXQgaWYgSXdvbmEgY291bGQgaGVscCBjb25maXJtIHRoaXMuIFRo
aXMgYWxzbyBuZWVkcyB0bw0KPiA+IGJlIGltcHJvdmVkIGxhdGVyIGJ5IHNvbWVvbmUgd2hvIHVu
ZGVyc3RhbmRzIHRoaXMgQ1BVIG1vZGVsIGJldHRlci4NCj4gPg0KPiANCj4gSSB0aGluayBpdCB3
b3VsZCBiZSB1c2VmdWwgdG8gY2xhcmlmeSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB0aGlz
IGlzIG5vdCBhDQo+IHBsYXRmb3JtIGxpbWl0YXRpb24gYnV0IGEgZHJpdmVyIGxpbWl0YXRpb24u
DQo+IEFzIGN1cmVudGx5IHdyaXR0ZW4sIHRoZSBjb21taXQgbWVzc2FnZXMgZm9yIHRoaXMgYW5k
IHRoZSBwcmV2aW91cyBwYXRjaA0KPiBzdWdnZXN0IHRoYXQgdGhlIHBsYXRmb3JtIGRvZXMgbm90
IHN1cHBvcnQgaXQsIHdoaWNoIGJhc2VkIG9uIHRoZSBhdmFpbGFibGUNCj4gaW5mb3JtYXRpb24g
aXMgaW5jb3JyZWN0OiBUaGUgcHJvYmxlbSBpcyAob3IgYXBwZWFycyB0byBiZSkgdGhhdCBpdCBp
cyB1bmtub3duDQo+IGhvdyB0byBleHRyYWN0IHRoZSBpbmZvcm1hdGlvbiwgbm90IHRoYXQgaXQg
aXNuJ3Qgc3VwcG9ydGVkIGJ5IHRoZSBwbGF0Zm9ybS4NCg0KT2theSwgSSdsbCB1cGRhdGUgdGhp
cyBjb21taXQgbWVzc2FnZS4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQoNCg==
