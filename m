Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB7414435;
	Fri, 18 Sep 2026 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719841; cv=fail; b=duuz4/MDeim9rj0MZznbUFPwk+n5xj+s9IvxA216WEyzRwwFiBiiu5t56nvlcIpfhe3TDAgBPpwCbRfX1urOQHplMx5mqILtBfE8cRNfBKyvDNVyCGbdCPRO/3oopFTZ2zSb7DpnVvYOlDc8vKNADgxqb9/4qQd2lmiSTmCsu4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719841; c=relaxed/simple;
	bh=j593/wqCKLy7eD1ljY7ksbEBxtrGcnrDRxniw9xOdkc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CFpYNujLduylr25e+TbRGNWX7Ky3tTh/RbwYqjDOqcu4nVadlJpdREOBNBlGhN5oy28QxWfXrX/ngjVH4Jm2UMQQqYrMCl7c1gDFkm7lf/jZW/SRhosjNm2AVVDGMTMcg/Be4ehY3quQqPcQa+EefUZ4D1lfMvm7UUV/z745zuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) by NT0PR01MB1343.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 05:49:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKRN7GfRd3gChjOpskRa2lMS/mPm3usT5ow5M95WKCYNR90rA5dq8QT/rYZave7bYjCTbuYpKTDLOPcsOszS4+xj4kVABBYODNQPKrTg6DJYz/6ZceZgzGzWdCOFdKHS9drb3FUXNsRD/x+d93qaO/qZMzXb0sgiWjOuj65sVYFz/DxTg+Rxre2urlS0NkmLjrX7w3rDrV5pb/Loea6SZ4TzAuo1KLSQdEO1hhLSDKWewZVnkInx9eXnBpmiIzVqUXS1eQq0WN9WVZiBZw3RUZGyFkaoRkx/yCVE9VkEfMsMxy6LyVqTu2CV9tIdko3bEYwPUpn8/51p6fPSqFSAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j593/wqCKLy7eD1ljY7ksbEBxtrGcnrDRxniw9xOdkc=;
 b=l9HRSr26owN79cXa69oSP9mczUtDtDA6q4pZ+l3/iGUQoQkMceCf8DT9hWMPZZxyUyCIebruDJP2E+46uVncgpPU3kaNU9/T5FAIyX9k7Jq/a+PS1t4mRZuh9fJNQAxPeK+jc3wJzQZvPIDvBQ/p5TT4C8TPTRz6E9F0F2oVtyQnq/ahlsLgvlltfndcRUn+SheXiqiioDsEAk/yOP6gpWiSOPpUN3I5yTRalPTjARwbKrG1YgXDvUKfnAQfVfRw7fJeJaN7DPFz22kwRFig0z+NHQEGmZOxmC5hWyt03iwGcsSfBLY5YugbfKP5Ali/+KBKqIrHiGrh7ngYGRxKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 02:32:09 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0428.008; Fri, 18 Sep 2026 02:32:08 +0000
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
Subject: Re: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry condition
Thread-Topic: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry
 condition
Thread-Index: AQHdO6kVHu1CwGrH7Ui5uBhCEJmWXbbTVFOAgABgJ4A=
Date: Fri, 18 Sep 2026 02:32:08 +0000
Message-ID:
 <ZQ4PR01MB1202D279CB9BEA89EC779500F2872@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-4-changhuang.liang@starfivetech.com>
 <47a9f001f9c0f9e2be2254289c5ba3f7d64cef05.camel@intel.com>
In-Reply-To: <47a9f001f9c0f9e2be2254289c5ba3f7d64cef05.camel@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_|NT0PR01MB1343:EE_
x-ms-office365-filtering-correlation-id: 70de36ad-1fbc-43f9-c260-08df152d097d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|22082099003|18002099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 9po94E2c1OBW+gewL+cuXZFqy0k06xdYqH46r0+SqC0y+Zjra7G+MXil8Q+HwjzpjnGJE19n4FrXT7EEt7SaWsS+IitnD0x40s/nVJOHkYPBnXsxEQkTjoCojVqwzI4yiphq/ZH+VRiD6Bgk8OLzcWdyqUpld1mIX9We+/C0VgQ26e4HtR7R8lqEL8qAx5kCJJ3uz6+w73be3dlrvMlZZ54uVHzAREIo4uUdFd81tiQNwBQvurxVn9oleTfUMeQSGXbrOjXRQlZAajLBpyuaLSmuB5/qVNOBSkP28X4eD0d0be3lJlKHmBsNPHjdnBvusMWe3q+o2BoeFyIChiNKmqbwGzUIf1CFH7nzcm7mAyymfVfDoJRFmVCqrh42BrbrJslEgBcvdaDilrwZCQdIUa7DG6tQa0KgKFkGhKrAAPliVAv5739pSzYMP8teDzXAnelQ5IMFMJJlyoHONU2InO7T378C2rBxabUWTVoRDMBv0NqjcJSA5fy2QWjfPJJhsXtZ4WaukD/Uxj1FJxHLT03KzN+GFFp3sjuGUeZEzCjZ8NzuErwZhIAHET1zTs4F
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlZRM0RjMWJLc0ZNMjBtQXNzcDNkM3IvY2t3eHBqL2xVc01yK1IzV3Y5YzlV?=
 =?utf-8?B?QlNzMHpKQkpsbGVmL0VoK0JsVDVtZlhnK2tVcG1jMlcxNkJBZlBSV29FZEpk?=
 =?utf-8?B?VnBuQmF6Y0F2S2RwODVVV1FEckFXNUl4dmFVVlBtd3JIb1BCVUJiKy9LZ3Nu?=
 =?utf-8?B?dVcrN0ZtMzZST2tNWXBqV1J6dUhlV2pnazV2dDZINFJWRWNqeG1pOXdNcGpY?=
 =?utf-8?B?aVd5dzVjNkVoUzZXWG1sOTB4VmNFYjZPWFJXYTdZc0FOZGw5c3BBUmUvQy92?=
 =?utf-8?B?OGhyazlkZVZ6ZUc2V0VHbXRJbnFDUnNpd2VIRHJFbDZmZVFaTHVia3hReEM1?=
 =?utf-8?B?bUltREpIdVBXemZndk04QktyMjUzR3JvMkNvWlp5WEljNS9WYVdNLzdSU3Vt?=
 =?utf-8?B?ZHRwbDl6UHF2REdkMXNwMjJPUTJKM2pmWTQvbitLaCtqTmZtQW9lRFpKUHVI?=
 =?utf-8?B?ejNKNjFUenpEaWtIZzduaUp4UUdkN3hTTDNycGtFbUlWeTVrc1B2cGVmVG53?=
 =?utf-8?B?OVZxZDh6SndnRGNsYkw5cEtBZlZtU2FYaUd2YVVHMCtUdDIwNEdZLzdzc1NU?=
 =?utf-8?B?RjVpMVBpU1lQaStXUW5JVXRSYStCampNNE9hUHhCRnNrWnZDb05aekxsbzE3?=
 =?utf-8?B?WU9aak4vSWYyLzYzbXdIbXNJSVFIc2lycGMrQzljMTVIUnJNcHBoYUd2cS9l?=
 =?utf-8?B?dkV2S3BNdlFoUXBWeS91eXRaa3hiZkMrUko1N2tZSkRtV1ltVGFQc0VUeGQv?=
 =?utf-8?B?dE41T2FNemhhbURDQUZOYnZEU2JaSDZoSkVMYXpnNHBnZzBVeTFuZnZhNDk1?=
 =?utf-8?B?dXlLMnhqYzEwRzRCZ3VmOExCN21RQ0ZldHFuejVXVUhSNjlvNE12NmtWS1I5?=
 =?utf-8?B?dkdLTHdPMG02RnFTTm15V1J5Mi9CblBkejBVc1RPWmZHSmVZSzU5VGlQVU15?=
 =?utf-8?B?dDhYK2Uyb1N1alEwa1NiSytlMXZmbmxuc3JSWExVMHROZUFUc2ZSRGFBM1c5?=
 =?utf-8?B?TWFtaGVBei8zT3BGVEdGd1FSczV6WXRBVlV4b2xEdkh3bzBMUjQwS09KeUQ5?=
 =?utf-8?B?ZXBVTUdPelplWWkwRzRLOGl2K3lEWlBzajNNNXUxQjdkdWJuaXREa2N0Y0Vr?=
 =?utf-8?B?cW5KRGdLWEhmd3MvQ1dtdHA1VDZocmt2d0NkUDNSKzJia2N4b0d6UjFHQVF4?=
 =?utf-8?B?MXBaTDJuSXhFYitjQlV5MTFDd29uQjdGMHdlcG1LcUtUZXJkYkVSMjFTYjVV?=
 =?utf-8?B?aTZXbmFJZFRKMUNqVVh0YW9jZ1ZCemYvNmhGdmpyZ3FjSTA0TkoyOXdLTmxW?=
 =?utf-8?B?NW9saGYxWnFMa25Fdm5RY2lRZWJPc2JsaS9LMitkR0JyWnpkdjVhTUs1WDVp?=
 =?utf-8?B?Q0dkUnJqVmFWd21pRERmalpGREFUVk5PR255d3YvT0drTFU5N24vMFhVYThr?=
 =?utf-8?B?bWZNdlEvVWhxZnZmdnc0eDRyRjk1M3VORzFiS01CaVBWQmdXa2llODlkQ1pN?=
 =?utf-8?B?Wi8wMnpodTl6K0p2QzRJNEF6cWd6WjUzNURPOTUyeGYxYjAyUnZyd3RRc3dW?=
 =?utf-8?B?SDNjWjBKaVV5aHJTdGVkT1J6ZU9lL2lOa1RoZWw2b3pUWVFQeUtTekJ2NTZl?=
 =?utf-8?B?WnBndHl1bWt2amxHYm1iU0tmd3pjbTJJaXpzZldLa1pSZjV3NjhNeUhxQ1pz?=
 =?utf-8?B?c254clpTRlA5UnA5QURIVDBuZm5LU0ZIWWJQT1hqd2RRbjIwY01Nd1FZZTdn?=
 =?utf-8?B?NzBiTEFVWCtibFVsVVVxMEdZNURTeGM2MjhxQzZ1TXVFb0Y0emZ4aytlenht?=
 =?utf-8?B?djdNRDFZYXhMMVdKYWxKZ01ZY1pZOXUxTUNwZE9mbTk4czhscHZpQ0tTb2dy?=
 =?utf-8?B?RHlOazVvODlxRS9hWDd3a2NKOVNheW04cXZRWWZKdzVHQ2l4OFM1VnZFb3RZ?=
 =?utf-8?B?bU5rc3VWWW83OE1PemE1SWxvMEhVcC95UkpRQnFsa0lHMWQ5SGZxMTREd1Nv?=
 =?utf-8?B?UkJkTmRBTUJPUCtpeENlR01MMGNMTGQ1TW1UWFhFb3psZFJFOTZSbGl2TmZk?=
 =?utf-8?B?MmV4aEpHaWN1aWNxVGttQWw0emEyS0VOOHgrQ2k4TVZBWFdpM1V5S3JqS0tB?=
 =?utf-8?B?b09FSFRoV2pSMUZ2aTZZWUFFc21FdmZhV1FGRUFRUkVqTlZldGk5S21RRGxW?=
 =?utf-8?B?MXVjZmY0anBJL1oxelYvUmIzeHkxWGRHR1BPSGpiemI0bHlRcndxaFBtN2tS?=
 =?utf-8?B?RkhXRTFvdjY4YklFb1Nyc01PeTkrdDJjUnJtNlZzdWtoQ2ZHMVhqelJUd0k5?=
 =?utf-8?B?Ykpic3AvOXdncDVVdnE1WkFwVHZOYjZuUmxHS3YrckNOZDVXK2l5TmcyOS9k?=
 =?utf-8?Q?1dCIQAGw8xBYdg1Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 70de36ad-1fbc-43f9-c260-08df152d097d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 02:32:08.6513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMp+gAm6LuPafHAo1AFR8m7P3a9+qrHUSKHPEbdkGmq/3O5R6GJQne36tfjnZ5Zu2oOzkqTJ16YHLec2t8vXielf2JuEnC1b9KBsiLkg5VA4xmOLbK5PhJcwPma5j6/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330
X-OriginatorOrg: starfivetech.com

SGksIEl3b25hDQoNCj4gT24gVGh1LCAyMDI2LTA5LTAzIGF0IDA2OjM0IC0wNzAwLCBDaGFuZ2h1
YW5nIExpYW5nIHdyb3RlOg0KPiA+IFNvbWUgUEVDSSBjbGllbnQgZGV2aWNlcyBtYXkgcmV0dXJu
IGNvbXBsZXRpb24gY29kZSAweDgzDQo+IChDTURfVElNRU9VVCkNCj4gPiB1bmRlciBjZXJ0YWlu
IGNvbmRpdGlvbnMsIHdoaWNoIGlzIG5vdCBjdXJyZW50bHkgaGFuZGxlZCBieSB0aGUgZHJpdmVy
Lg0KPiANCj4gVGhpcyBjb21wbGV0aW9uIGNvZGUgbWVhbnMgdGhhdCBhIGNvbW1hbmQgcmVzcG9u
c2UgaXMgaW4gcHJvZ3Jlc3MuDQo+IEl0IHdhc24ndCBkZWZpbmVkIG9uIG9sZGVyIHBsYXRmb3Jt
cy4NCj4gDQo+ID4NCj4gPiBBZGQgUEVDSV9DQ19DTURfVElNRU9VVCBkZWZpbml0aW9uIGFuZCBt
YXAgaXQgdG8gLUVBR0FJTiBzbyB0aGF0IHRoZQ0KPiANCj4gVGhlIGRlZmluaXRpb24gbmFtZSBz
aG91bGQgYmUgbW9yZSByZWxhdGVkIHRvIHRoZSBleGFjdCBDQyBtZWFuaW5nLCBlLmcuDQo+IFBF
Q0lfQ0NfUkVTUF9JTl9QUk9HUkVTUz8NCg0KV2lsbCB1cGRhdGUuDQoNCkJlc3QgUmVnYXJkcywN
CkNoYW5naHVhbmcNCg0KDQo=
