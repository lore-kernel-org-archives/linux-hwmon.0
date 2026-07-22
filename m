Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6C3B47D0;
	Wed, 22 Jul 2026 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705891; cv=fail; b=eoLHiR4se30VTE/IHNHhfg1BYVRIF3h9gxfSrlx8YoZErHboGaeQ3cZ1rq43am0WlRVIfkwWp4yF3Pth8JjfMR5wJYLiv++JoSy7TSwvg5qcVaVe5vJL23E6pSumhTd8KHrlkEQ6ZG8xfq/s5d1FU2wDhubDyuYdP1nt1qlP1C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705891; c=relaxed/simple;
	bh=z+/EHGXpOXCNvJuxqTjnpNM27u3GIbFnshoSUGMQGuI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WfZkeWYRBOXip7W1pqbrl1JK0X7+H/tBRcAHsqga1fGyzV1BxJQhg9jXeUYFBwW4Y9sOgfwQq4R1AJvvIUkrbvUWPDZW9Rj8RLt7GFQUucLlzO7yXZMYJQk+nwVU9WnCdEWojE66bVgKH9yb8LSNzfjlO7asdl8H/sxjfhHCsE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=fyYM8tIy; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="fyYM8tIy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMQpFG81jq1DGr4MJt+mLW/V2nK16jQrpqnkPvxh5G9ECLozs3PdG/a/iqm3vhpS10pHOaj9yByPkJPQ9UYTRzU+VqeFfPSFRGQwNVB8NhhkoVgmIagOD61Xb43XP6dJrayUuLjRSQLy5njjcBCRaenx2pHHsMtbmjC5rkZQ6KN8Qpch3p1CyHCDNFgzAU2P8N5ZLdckTS0aGCWX+W38qlpArVhkVodUPXc7YpeKpIQWQMIBC3dGEH+YHPpeodmQU1ktWCJPeqv/hdC1Wv7cr04pGwMxxea2jiAHWUC3CujKgpYn76kIW74PFD1zAhuUrmujVlRanJKwDRvArauPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+/EHGXpOXCNvJuxqTjnpNM27u3GIbFnshoSUGMQGuI=;
 b=w0xfNtAeN5sE5SrbXXvH6FerYHSn7Y7b+uLu7TY9BkIcIEYGl9jSxA25tnTL51LhxMKlJmCUqKjcO7IkyFo6VVifZb/psdXBtGW7DqTEk791afOMY3XEoKfJwkg/vb45LXOxXEovtL1qXKtYceNGqsSnYtlHvQo6KIqp1761Z2jOQA3q7MoM9eUdlrvxnfSY+kgJun4SeFN4DeRxg11iNaW4YDv+ZpOsnYxb42Hy8yj6E/m8b00fK6rorcaRPuNGkqfWxp2DQzaBuHG0Yc+w/mzwRmA8k4FSjYlE4glElDOSJH3iNQiX1DaYdvLyE7qjTTc590Sj56D/Ww4Ecb4nTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+/EHGXpOXCNvJuxqTjnpNM27u3GIbFnshoSUGMQGuI=;
 b=fyYM8tIyB4hbAuKzOyC/IQEsj9y8r1dzvomGMSxgTNzXckkv9y1VzswU2YDHMLpDLPLCDBBxi9lJ5NaJAo9SsJh5Sus9LEq8/6Mn7xE3sR9wBUqeHmKuFOeBwb3MVw4nKulng+CLrinvs+srI5wu7sqrJgJyVExJ1AWlRRH+J9yHmTEM3pd8TYu94YKd+lDP4+aiMBvn1jvajwXaAxgA+2Zn2KUsuclJUzwSX0DiybPVn3+1CTm/Bgui10b5qWdVsY7ehzaA5T2NK8pHQJw4xSqqvRiOQGxjCWSUmt9ANYZUayCdBAGu7kRWvIa6O4srUQF6hr9TyPWJ6PMqoG5IEg==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM4PR03MB6032.namprd03.prod.outlook.com (2603:10b6:5:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 07:38:07 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 07:38:07 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Guenter Roeck <linux@roeck-us.net>, Dinh Nguyen <dinguyen@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Thread-Topic: [PATCH v7 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Thread-Index: AQHdGLcqZw5prJYKyESINAKW1FaqHLZ3SuUAgAHdv4A=
Date: Wed, 22 Jul 2026 07:38:07 +0000
Message-ID: <fc7b576c-6e83-45c9-aeb4-49f02113fdd0@altera.com>
References: <cover.1784599864.git.tze.yee.ng@altera.com>
 <c8f4fbc1d8c3b1d161c94f66feb2ebbc038dab6d.1784599864.git.tze.yee.ng@altera.com>
 <2c99fa33-515b-46f7-b2b8-b7a2b9dcbd84@roeck-us.net>
In-Reply-To: <2c99fa33-515b-46f7-b2b8-b7a2b9dcbd84@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DM4PR03MB6032:EE_
x-ms-office365-filtering-correlation-id: 409943d3-0648-4c3a-17e1-08dee7c42c57
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|55112099003|38070700021|22082099003|18002099003|5023799004|11063799006|4143699003|56012099006|10067099003|6133799003;
x-microsoft-antispam-message-info:
 BiYW5QN2A1e/2yxMPmlYnvVSH2KvsnTNxz0jGqxPF1T5VnO1raqfNlYAQpn+fbVfSFCy+gSUOVxu4DVRmMkr1qMdAa+CKsmTXp6nY46fHAr2m3McIP8ICqTaWM8PVrR2lkedqCZMZ7RMOqS4MFiJzicWxT2HTH5x9hG9nPgqHS7NkjY0j3/taMx2TtWsUeA3sOf4mH4tPfKYDVnKlC387kO5agJKor/672g2nvGxSrLM7XjCV3m/+Qcq/1KcVUnG7BttbiNT/Vdcb9FfP5RJcTCbi5LPOkKzUlOrvD6gQeUeOegpLhmnzD6myuICmH95gbdZExrsXs3J75yULnX//gMNILUlb/h0vt18OADHLJFQyUGVHvqDy7MMAPMixxitR+JtT05wf/fWv3UV5nh6lq2p5sPBHF8+KZ/gLN9/AlCmCRZEsIstAEsJxH/s180AP1cQ3wtXWNyDzZ5pRnFA+xYdHPH0GVxLX/0ec0zl5IaB9euHckXQRxHwldMltLPOTwTY0eBRs7mE3LI6jI/TqM+a/n1DaOmRrvNDsJJtL8BMdjTx+GcfhOn+XOWBcmPHDrtXzLhhH2w3anaxAIJCew3WEeUu7DhqyNLdQMcd0uzgVUPIDDWGjYjG1lbvDsncs6mylHksL/BCen4Qwp9iE465BB9xYiAZf7Dh/dRzynKZolb66m7B7vVAEiNkbx5eQoN2LYgRYwLbPfinZIFF2rbh++ohPlagMHLkOFyO/T0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(55112099003)(38070700021)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnpYOU00SFhiazB6dzhIVGNnSnNmR1lwK2o4Y1dQb04yUXRmNWRTN2dzRWhw?=
 =?utf-8?B?ZjIxYUdBNjJMaUFqbURHR1hyL2JSL1U2OVRrbjl5YUJWSmt0RVdPZXoyL1JC?=
 =?utf-8?B?NlQycnBqWnViaWgvMEVCQlhIYWc3dEpJUnE2VVZwUC9RRllLUE1kMTgyZGFr?=
 =?utf-8?B?OHFHaGJyWGo4YmJGRzlKZUtJNU55ZlRwUmJrOFBQd21HTFgzOUFiMFVhVms5?=
 =?utf-8?B?cjFKMkZlaTZybDBaSDlsekZRemZORFRKNUJkbHFNaWY2Q3ZuZk8wT3hjZVNt?=
 =?utf-8?B?dE9iS0RpUSttVCtRZWw0QnJKNlhEeHJtWktsUmFwVUhQZVpQOG8wZ3VXUVFH?=
 =?utf-8?B?WG15TG5jNXg2UGtsNkJKbEsvWE9VcHhKb0tmL25BdUhuaUVmUTlRSmNzNFht?=
 =?utf-8?B?WHRMamhhQ04xOG94c1MwcDdZVWl5a2VURDcxZ2tJbm1CRFZsaTlJWHJHbEhK?=
 =?utf-8?B?SjZKWjRqM0lSVWhOcDNGaDBmSmh0SVFJRWNHb3dQM2NjbGdjaW4wNlEwSFdD?=
 =?utf-8?B?REFQcWtkaXRJRWU4ekd0bjJoYXUvTG9KMGhzRVo3SkhnSzlJOUFldHB5aXZa?=
 =?utf-8?B?cy9HOUgvcE9FSFdWa2daSTlmRW12eU5ETUt2dWoxSkl1Wm4xM3RkUEtXbnBn?=
 =?utf-8?B?enlCMXRxRlRTTHFXU2ExbCtLQ1pEbXYxbGV2VlNxcTlaSkpoa0s2Y3pPTitt?=
 =?utf-8?B?UzlNSCtIRWo0eUxrQ2tOWjJhRzU4UFdpT2xDNmgwSFZrMHgvZnhYY1piWTFv?=
 =?utf-8?B?K3RFNjdMbHRWOEdUMnhpMmxPdHRWckNwWXhnUml3bTV6Qy91T3g4MFNlQzF6?=
 =?utf-8?B?VTlVZVExVUNWNmdKVXE3cmxrdlJ1K0Y0cG02SDFMT1pQV3d2VHZBa2ZQZHlM?=
 =?utf-8?B?NndUYnNqTmI4cDBnT3ZIRjdTaTJNYXphTEZSVnNGckJ4MU5jc3FkODVTeDd3?=
 =?utf-8?B?RGI3WFFxcWpCKzExWnp1M3J1cmNnVVpLOUIzNFNXYXZNcHpNdzEwaEpFcWVQ?=
 =?utf-8?B?U3BzVXA0Q0N5NDlBTjRSajNyanYxZFZRc1ByZEJLYlRZSENKa1NCeVUrUlBu?=
 =?utf-8?B?dk5RYm9BZ3NMYlZ5RS9kM0liTFVKTElNNVBEamZqREc0dnNuMnVBcXZvT0FJ?=
 =?utf-8?B?RTFodFhiMU92ekxLdkVJT3hpTXlTWnNsWVlONVZxV29ENGtOSGtKYXZ4UDdF?=
 =?utf-8?B?WThMM0R6T0VhNHJXMkRuMHYzbUFyQTU5OHZ4cTRCTE9kVkU1QzVMcHBDY1NC?=
 =?utf-8?B?bEtqWFpGVzcrU0dnNWJNK0diais1Nk9XaytZalRLcFM5NHlVeEJTbWtYdWtl?=
 =?utf-8?B?SWhHeUtteEh4bWszTGpxMDlXS0FXMm9aTTE4T1A3dlNBaWl5RGxFSGFkcDIy?=
 =?utf-8?B?WFYxdXpyN0prWWlwalF5NFpveHR5M0I5VHdxRlJ3Sy9tT3pLUEpEeHFsZlhw?=
 =?utf-8?B?OVYxajB2MXI2MUxTeDNwSlk5aGVaSkJSZ3c4cFkvU2FvNWhMN3laVG1sTUxY?=
 =?utf-8?B?Q2hORHlxK1dFSmZYNjBBcnJIVDR2dW1QbkY1VnZ5NXVSRTR2UXFrc0JWaEFz?=
 =?utf-8?B?dEVWM0V3am1rblV0VjRaaHNvZ21qQzVQcjhIWW1QSGNRNTNHakRBMjkra2RW?=
 =?utf-8?B?bEVjZU9kRlhnQk5iQ01ja1U1dVYwYThnQlZmdDY0cWlNendQREZUZCtScnNh?=
 =?utf-8?B?NnN3RmI5TkdtYkNTSVlsK3E4YmkzQTJ4R1ZEa0pOZm44cTB1eEQxUk5QT2hL?=
 =?utf-8?B?OS80SVIwc0llMW1YemtkZW94eElaSk1sR0c2bXliWGxYKzlCRnBxMFd6SnR1?=
 =?utf-8?B?THhyOGI0blF3Nkh5RjR3TWF2dXM5UTFLRXhhdkM1RXJTbDhNSnpqZVl1L3Vr?=
 =?utf-8?B?RDhuOU1NTk9XRjl1U2dQdG10UC9SdHJrM3NZUkQzbGpKUFY5RUM1NDNQQTdR?=
 =?utf-8?B?TVJJTDhKSkZjRURJd0ZERElabUJNSWhQZzhUbVZEcks5ZlNHOWFZT0xMZjFB?=
 =?utf-8?B?b0tZRjZybytZNVJLZlAvVzdaNDFoMzBpaXVEdU5jZmJ3dG9rYythMlYvZUJB?=
 =?utf-8?B?dWRjZXNrcnFFZ0wzMGsrbWZwYXFUTWdwLzBJdkJlSVJQeUdNSm50aCtSckUv?=
 =?utf-8?B?NUduQjRDRU9kMzhuUUtoYjhtZ05qSWN0Zlkvd1dBV0RGNHY3dThtUWd0NldT?=
 =?utf-8?B?S3dITzM4Kzlmdndka2Z6TTM1MC9Mc3hBdnpJVEZuVS9nWTA5WjE3U1oraFpj?=
 =?utf-8?B?YUdJb241UThxck9keWh3b3I3VXN3NzR5OExrTHNTZ0NQWDA2UEtFOEg1OGNk?=
 =?utf-8?B?U25zSVoxTldHQWtXanExT0lTM0w2RW1LNysvaXJZcjl5Z0hDYU5GYm41ZUUx?=
 =?utf-8?Q?dKY8+HB+R4p+ex1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08D4650C4561004A942B519950F36531@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 409943d3-0648-4c3a-17e1-08dee7c42c57
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 07:38:07.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlTuOqFh/YUVBsw8v8bxyGOPCRxkjgdf4aXG5t+wMvKPBCjsj8Vt/pN3qpAY8RB4OFRAY8cuNTs5mRnQJiMe1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032

T24gMjEvNy8yMDI2IDExOjA4IGFtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiA3LzIwLzI2
IDE5OjE4LCB0emUueWVlLm5nQGFsdGVyYS5jb20gd3JvdGU6DQo+PiBGcm9tOiBUemUgWWVlIE5n
IDx0emUueWVlLm5nQGFsdGVyYS5jb20+DQo+Pg0KPj4gQWRkIGEgaGFyZHdhcmUgbW9uaXRvciBk
cml2ZXIgZm9yIEFsdGVyYSBTb0MgRlBHQSBkZXZpY2VzIHVzaW5nIHRoZQ0KPj4gU3RyYXRpeCAx
MCBzZXJ2aWNlIGxheWVyLiBTZW5zb3IgY2hhbm5lbHMgYXJlIHNlbGVjdGVkIGJhc2VkIG9uIHRo
ZQ0KPj4gc2VydmljZSBsYXllciBjb21wYXRpYmxlIHN0cmluZy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBOYXppbSBBbWlydWwgDQo+PiA8bXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFzbWFk
ZUBhbHRlcmEuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogVHplIFllZSBOZyA8dHplLnllZS5uZ0Bh
bHRlcmEuY29tPg0KPj4gLS0tDQo+IC4uLg0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgc29jZnBnYV9o
d21vbl9zeW5jX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBlLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc3RyYXRpeDEwX3N2Y19j
bGllbnRfbXNnICptc2cpDQo+PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3Qgc29jZnBnYV9od21vbl9w
cml2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+PiArwqDCoMKgIGludCByZXQ7DQo+
PiArDQo+PiArwqDCoMKgIHJlaW5pdF9jb21wbGV0aW9uKCZwcml2LT5jb21wbGV0aW9uKTsNCj4+
ICsNCj4+ICvCoMKgwqAgaWYgKHR5cGUgPT0gaHdtb25fdGVtcCkNCj4+ICvCoMKgwqDCoMKgwqDC
oCBwcml2LT5jbGllbnQucmVjZWl2ZV9jYiA9IHNvY2ZwZ2FfaHdtb25fcmVhZHRlbXBfY2I7DQo+
PiArwqDCoMKgIGVsc2UNCj4+ICvCoMKgwqDCoMKgwqDCoCBwcml2LT5jbGllbnQucmVjZWl2ZV9j
YiA9IHNvY2ZwZ2FfaHdtb25fcmVhZHZvbHRfY2I7DQo+PiArDQo+PiArwqDCoMKgIHJldCA9IHN0
cmF0aXgxMF9zdmNfc2VuZChwcml2LT5jaGFuLCBtc2cpOw0KPj4gK8KgwqDCoCBpZiAocmV0IDwg
MCkNCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIHN0YXR1c19kb25lOw0KPj4gKw0KPj4gK8KgwqDC
oCByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJnByaXYtPmNvbXBsZXRpb24sIEhX
TU9OX1RJTUVPVVQpOw0KPj4gK8KgwqDCoCBpZiAoIXJldCkgew0KPj4gK8KgwqDCoMKgwqDCoMKg
IGRldl9lcnIocHJpdi0+Y2xpZW50LmRldiwgInRpbWVvdXQgd2FpdGluZyBmb3IgU01DIGNhbGxc
biIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHN0cmF0
aXgxMF9zdmNfZG9uZSgpIHN0b3BzIHRoZSB3b3JrZXIgYnV0IGRvZXMgbm90IGZsdXNoDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoCAqIHN2Y19maWZvLiBXYWl0IGZvciB0aGUgb3V0c3RhbmRpbmcgY2Fs
bGJhY2sgYmVmb3JlIHN0b3BwaW5nDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHNvIGEgbGVmdG92
ZXIgcmVxdWVzdCBjYW5ub3QgY29tcGxldGUgYSBsYXRlciBzZW5zb3IgcmVhZC4NCj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogRGlzY2FyZCB0aGUgbGF0ZSByZXN1bHQgYW5kIHN0aWxsIHJlcG9ydCAt
RVRJTUVET1VULg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCB3
YWl0X2Zvcl9jb21wbGV0aW9uKCZwcml2LT5jb21wbGV0aW9uKTsNCj4gDQo+IEp1c3QgbGlrZSBT
YXNoaWtvLCBJIGFtIHB1enpsZWQgYW5kIGRvIG5vdCB1bmRlcnN0YW5kIHRoaXMgY29kZS4NCj4g
DQo+IEd1ZW50ZXINCj4gDQoNCkhpIEd1ZW50ZXIsDQoNCkFwb2xvZ2llcywgdGhlcmUgc2hvdWxk
bid0IGJlIGFub3RoZXIgd2FpdF9mb3JfY29tcGxldGlvbiBpZiB0aW1lb3V0LiANClRoZSBuZXcg
YWRkZWQgd2FpdF9mb3JfY29tcGxldGlvbigmcHJpdi0+Y29tcGxldGlvbikgd2lsbCBiZSBkcm9w
cGVkIGluIHY4Lg0KDQpSZWdhcmRpbmcgdGhlIEZJRk8gY29uY2Vybjogd2hpbGUgc3ZjX25vcm1h
bF90b19zZWN1cmVfdGhyZWFkIGlzDQpydW5uaW5nIGl0IGRlcXVldWVzIGVhY2ggcmVxdWVzdCBh
bmQgaXNzdWVzIHRoZSBTTUMgYmVmb3JlIHRoZSBjbGllbnQNCnRpbWVvdXQgaW4gdGhlIG5vcm1h
bCBjYXNlLCBzbyB0aGVyZSBzaG91bGQgYmUgbm8gbGVmdG92ZXIgZW50cnkgYWZ0ZXINCmEgc3Vj
Y2Vzc2Z1bCBvciBmYWlsZWQgdHJhbnNhY3Rpb24gdGhhdCBpbnZva2VkIHJlY2VpdmVfY2IuDQoN
ClRoZSByZW1haW5pbmcgY2F2ZWF0IGlzIGlmIHRoZSB3b3JrZXIgZXhpdHMgdmlhIGt0aHJlYWRf
c2hvdWxkX3N0b3AoKQ0KKGZyb20gc3RyYXRpeDEwX3N2Y19kb25lKCkpIGJlZm9yZSBkZXF1ZXVp
bmc6IHN2Y19maWZvIGlzIHRpZWQgdG8gdGhlDQpjaGFubmVsLCBub3QgdGhlIHRocmVhZCwgYW5k
IHN0cmF0aXgxMF9zdmNfZG9uZSgpIGRvZXMgbm90IGZsdXNoIGl0LCBzbw0KYSBxdWV1ZWQgcmVx
dWVzdCBjYW4gcmVtYWluIGFuZCBiZSBwcm9jZXNzZWQgYnkgdGhlIG5leHQgdGhyZWFkIHN0YXJ0
ZWQNCm9uIGEgbGF0ZXIgc3RyYXRpeDEwX3N2Y19zZW5kKCkuIFdlIHBsYW4gdG8gYWRkcmVzcyB0
aGF0IHdpdGggYSBGSUZPDQpmbHVzaCBpbiB0aGUgU1ZDIGRyaXZlciBpbiBhIHNlcGFyYXRlIHNl
cmllcy4NCg0KVGhhbmtzLA0KVHplIFllZQ0KDQoNCg==
