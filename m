Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749E20C029;
	Mon, 20 Jul 2026 03:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518114; cv=fail; b=OcOufpICY5BTba+BMTRzjazpzqx4hjw9CAqjhFiAoxofZVVJoQmNHIfqMarcWAaEERmnK04vlw6R4byyFpL1qZVydi+C7e3Bj1NDNRh22MYqnjy7KNF78mOlAQ2lD5UyvJxJbq7wLW+5w9qXSVAXyhUW7Hgl7UZBjGnNFRq/Bxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518114; c=relaxed/simple;
	bh=wy/TCK+hcny+w9KO+6FoJGPas07hdl0hym0NkAwKGq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G7hTJdtQ4rcNBrOFEylCguv4gEH2zQ5iJ2ZJlA2Hm5UjPyqyvSSoNaOHeorxGi/Ra9J4COeHnubyYOB9XiOzLWWBJ/E8jc6+LG0nJ96AIy8VglKn44tHZIc8UehNqDl+6n7Mo8o9wUZt+k0gVtDXT68bL3u2J8jgt2SWQZurL28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RLMztcfA; arc=fail smtp.client-ip=52.101.85.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RLMztcfA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHZQZe4aJB48I49iEf15h/Et8VloGiD8AxwuxJWi3qVxwEUHQyMuakW4FqoLTsa8LCZbG/FjIfM1+Dt5A0gSVof0kww4fWqczWK7TehJmKDANvgDPz5ZxKVJ/2wqcOLda9qJTCKvS+/HZfwZoj+N4qOsEOgWhs2Rlsm5OAta1AZWOg+uEo1oWwMMtdt5mso8D0tBkx9d799xYb6o+FYlqTAIJdQRa3gZ/MsR3vpMeQwUGxPc6s8IMGKpUshAi6pgddc3Crv9xx2n45tW1NNl3uvjug4vqY7tySQJs9CSYSEuKdl880po6jBCLs3CyiiGR7n0uVBluH+AgqaLLxmYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy/TCK+hcny+w9KO+6FoJGPas07hdl0hym0NkAwKGq0=;
 b=hYb6PmDDT4Y+t1j3FkymVMYd0DC8zBfqUGAUdD83lYbhfwrTXT4rn1zVHI9ny+ZAPFPVKIXvWM18HRoPM0bSqKnp3YsLa/F/mAHeme7glYPiVHCh04f1iHRuvgWtYhLRI51cSTJOu8eOoq4pzce//SiwezhR01QyRkFT07FQRXBVGlHnytDijlwid+Zq0WgF7GFN4cmCQ+OLTnIE4ndYKDNqPRJUkG2DGBngbrOUxAXwlBpGZqbY9JpjGa7O4NMxpklD4FwudUZB+QG1BvwWNSB5k1EOSlensIZ3DHsIizinRMOpt2igcwt3DomOT2/Dp03QHOwLAZNTGD1M1ZkYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy/TCK+hcny+w9KO+6FoJGPas07hdl0hym0NkAwKGq0=;
 b=RLMztcfAVXTBxHEBPr7jmK6kCyrM/Rr8Qrd3LfLpktubrBCT1N3jKOdbbf+/HMmhgb5OD7M0FE1pc8qlgJWc9TLBYrZDRvIAUOBXAR6f4z55P3m6o7S/TxYMY1FkeuvuTYPf4LaykUXLELn0BbQsZp/386uQpOT0Xz71kSO2lL5q/xputyR8JqDfhrBD/HuiVdaFDIzkEHvgfyCTMh9ruJdpIYKWCKLTMOQjlySL4cT0jPjp7kIFgRZo3FQXsdhADZDOaZ2rTgajhdGDXyDSNOvkztBT3P+2ItD/0Y+p5anBY9fwUCaSroCH6UsDato5mi/Tx82CZFPCYCxTz3zy1w==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CHXPR03MB989197.namprd03.prod.outlook.com (2603:10b6:610:2f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 03:28:30 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 03:28:30 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Dinh Nguyen <dinguyen@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Topic: [PATCH v5 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Index: AQHdFCMpApnOQ972T0m2KogAE4X3LbZ08lEAgADVEoA=
Date: Mon, 20 Jul 2026 03:28:30 +0000
Message-ID: <a6ff3145-26e1-4f3a-b219-f5c797f2d947@altera.com>
References: <cover.1784096224.git.tze.yee.ng@altera.com>
 <66493aed36c36718ab90d4792d04948d3926d377.1784096224.git.tze.yee.ng@altera.com>
 <d7f375cc-40dd-4b0a-8117-28ceca9b0059@roeck-us.net>
In-Reply-To: <d7f375cc-40dd-4b0a-8117-28ceca9b0059@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|CHXPR03MB989197:EE_
x-ms-office365-filtering-correlation-id: 53eebbfb-e0a5-4980-0ce8-08dee60ef891
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|3023799007|56012099006|11063799006|55112099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 e/fKuwv2NaXlH3REkZAMo0AFc3NphuCBWxDY6lY9wnQ9o1Pd/bMAmUSnzmMRC3w2asVh7GWc+OKL06VIGgzYw/HK88zW9DHccHJ7imsZudYXwi+XYv27RXJ2jaJIAGyKI406Yv4iHjDMehsQeFP0gS9RPSJdcd1o5yLFGAk+WnY/lGxuTMU+9m7o0C5fCo3Kvs5JRAIoG88mkitsSn+2XQHXjMMZGUjL8v0KIf08a7HQ/RnTI8Mcw0qzORUG4MNr9vhDm9b0Pwr735pA0cgCMIVZS9uprMIdnmmgiqQtMh2yygI1Tph29EacE9dW8Zl3WK0xzbjEHRaDBvhee12uNMUPZlnv+Ihz8W5WsvmVZSHDMtpqb/VMc4SIC7jATDz5Tvkim+44U79p+lBGNNhq+8RaRoVR7zHNxwMbqKmJJkwAzcazL3tWsTn0hbztrdZPZd5WwLwwrwD3q0/yGu/2pKKBy56/9nSmp5Sv3wNan7+W4IW1uppa1S6J2lR6ilYyAXUvG56Uo9AkD/gA6npcmi6KDzZv8LiDu6rIrc7kAcdXomCMqCEfIu/2QErvE7tYBAAoEHCqAbcO1h+auNVRF0YhZPZKNswB8b9jtXWhoO3zfdR+omQZ+s8fiE6lQnuKjgpFS5ueq+oBZ+u1P4v5axSviGrJplwZZJ6IK4ql1dW/hiQBhZ7hiqOhS/maboP/0VxEHHoZJ9cA65WAejvFIP0BOhDoVhPfjyYY7XZXhMo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(3023799007)(56012099006)(11063799006)(55112099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2x6NXVyM1BZVU13VTNDQ0hhanpnQ29LakgvWHdGUHIvY2pWRVQxaklXa2Mr?=
 =?utf-8?B?VnZJUGhNWldmS1gyamRsUzZ5K1R4d1EzTGZ5Z3hadHJMU3BmQ2VicDBRYWFz?=
 =?utf-8?B?alhVUWo2N1dHWXlQODBkUEZwaTBLdUhWWW1icGYxbXgyOGxJK3RvaGgwN1dY?=
 =?utf-8?B?OUxyTW1MOUVRaCtlL01KZVBvTmN4VUZseUNnY3VNbHJQWU9lNjFHMW9KQm42?=
 =?utf-8?B?SEFVSFh1RkROc0JJc3BKclpRYmh0eXRKclhlalZia0JGRmM0OGRlbU9mcUQv?=
 =?utf-8?B?cW9FekRHY1hSaDBGZENFd0RMODBGRXcza1FReXNyYnYwdjdQNG9BZmlTVUtG?=
 =?utf-8?B?UkthQVdrd3dxNmdKQ1NqcWU0WDI3THZBdmV3K29sWVljMFFNbkluVWZ4SHJu?=
 =?utf-8?B?cWd0TTJnNXhTY2d3WTN2TlB5TFJ6ZkxWM25DQUQyTmVneXkxZnh3c2hwdjk1?=
 =?utf-8?B?OTNTTHIyNFVBamNSOTJ3eis5aXFLaXpJSVF0c3ZwUkZwWG1VYUd2bWRHd2lv?=
 =?utf-8?B?Y3ZaSFZGaFBWNm9ld1ZUYldkM0k1eDlQQ2tjSUQxaEI0N2twS3ZxK0RmWDNV?=
 =?utf-8?B?SUU3SDY2dEx6Rm5nV3lVK2pQMEpLK0dEeTRBTTUwWUhKMUNvK0ZSbTZ6c1o3?=
 =?utf-8?B?M0lEeUhhK0RWU0hydHlmRVltWEg1MTNQcThXb2g0UVdHKzh1VHE5VUsyT3pT?=
 =?utf-8?B?bndQWjR3bzJDQVByVHprV29pQXc2dFFjdU9hd3UrRGNZdHhGai9DUHBjbDQz?=
 =?utf-8?B?a3kzUG5TU0dRVkhkOFNBZE9UYkxZMkNPalZrMllaWXhYdXVRR2ptZ1VkVzhm?=
 =?utf-8?B?L0NLaFc5THZoWmFDd05rUHRaZllJNEhpT0EwRkVPaUs0enl3bWExZDVQSW1Q?=
 =?utf-8?B?RFQ4a0pyMHBrdU16ajFuQmVxQkV4UDhwZlNtcStvMWp4RmlBK3VQVFBrcTFp?=
 =?utf-8?B?OXhMTUkrb3prYm9XTUZsQ2J0Vldma2hDc2wxZVoxY0NrS0VsNzc3Y214Sk1F?=
 =?utf-8?B?TmtQSFBxVm1CenVMejdWZmtKQlVPcjgyY0NvSkRvUUpJb2xNcCtCM0ZwRE1I?=
 =?utf-8?B?RTNKeS9FUHVDM1pseko4eXNDVmNXUWFjdDVrS1VaZGNtWjdVa0VXbzNab0Fm?=
 =?utf-8?B?YWVjdWI0c0FKMXZSZGNSNC9vYUtsejdWZzZBME5wd1E0aVJFb1Q2VDBjZ09B?=
 =?utf-8?B?ODJleVZjTGNTVm90aFFMOHNPLytDTy9jZjg0TDdmM0NvZ1U5VW5hTUtzZC9u?=
 =?utf-8?B?YXIxQytYSkJyeHFha2doZEhvd2NyOWlLTnhPWWVHbkcvREhsSG80Z1J2WEdu?=
 =?utf-8?B?YjZCUjJhd05uNXFCRUpEUFJPSG5Hd3hqaTRtK2QwQXRPV29lSmlsMllJajFZ?=
 =?utf-8?B?ckkyTVRvelhmK2FNeW9LcVFTRlN2RWJINndxelo1bnlHdm1MYXN6NE1EUGFw?=
 =?utf-8?B?WVdOSTNXVitJSTg2VjRFb2hlS2dkc3pKMFVRL2VQaG8wMW9kM3dQeWlUUmg3?=
 =?utf-8?B?d0JLKzVJYWgyZkw0allKTkdubFM4TDlJVSt0bi9CdDZlNzJqcC9GZnNUSG41?=
 =?utf-8?B?ck5oYTRtNUhya0lRa2syenhzN3RCYU51Q1VPb3NJZSszSE8yNUw2WTdWQWN1?=
 =?utf-8?B?SEhlRVh3dXN4MnRubzdFKzEzRVRkSHFQTlZEZ2RDdHVxQmEyd1dKNXo0STI3?=
 =?utf-8?B?N2NRSzlXUVA0TTFGL2s2ZlBpdnFJUHpJa3pJNjFoNTdTSUowalNtRTdEMllw?=
 =?utf-8?B?Rnp1SUZmb29ka0diclZFWm5ScHl1RGlxYWRQb2FEcmttayt4Zk9TM2dORExT?=
 =?utf-8?B?KzZuRlh5OFhvRWRtZlFRM0hSOEUwQkJyWUhrdWlSRSs3RndFd3dBMVU1MnBp?=
 =?utf-8?B?RzZTSGxuZE5rZDRFc0NxUEtucnI1TS9qQnQ4c2lkLzVPV3VaeHJreWRKKzJE?=
 =?utf-8?B?SzFPT0NGRk9SQytVNXhZUFJkczlLb1kwNWhVM3B1Nk9TOFY2MUtNbWxydTJh?=
 =?utf-8?B?MWxEYkVYYUF5eXJQRHp6bDlvb1ljanNFQ0lCc2NjYkFhalk5bjJLU0J3UjJY?=
 =?utf-8?B?OXFVaE12ZEJtUE5ZMW5wc0ZVYTd0QXo2MUludnY2WnI0WTlQazdnZDZWQmtp?=
 =?utf-8?B?dVNKMk1hb0p3RmFBK3V1cm8yOEF3VUNXUnYwU3FWUmN5ckYybU5NRXd3MHgr?=
 =?utf-8?B?RkdqZEt4YWdjNnMwRlVrMWNtZ2NGNDBpM2cyYnBIdWx1Q1pqZ1BueHNwekky?=
 =?utf-8?B?NmU0aDhLR29qSlFjcXhDd0NWeCtDbWpRajJLcFRLbkhqQ29HdnFoNVE3ZVNq?=
 =?utf-8?B?bFdnSDYxblFybTg2NE5tUDRnQ2RaWUJzRS92QktQeE9vV3lZQ2tvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3745B555A3D634EB8B618422296E8EF@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 53eebbfb-e0a5-4980-0ce8-08dee60ef891
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 03:28:30.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaMWH3hv8u+S62Y0VrX1d7m+0RaC1560PQcoADKUeF//PuZjY8+T5xdBtTnKBcLhStnvebNgGOlRn95kf/kJjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR03MB989197

T24gMTkvNy8yMDI2IDEwOjQ1IHBtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiBUdWUsIEp1
bCAxNCwgMjAyNiBhdCAxMToyODowMVBNIC0wNzAwLCB0emUueWVlLm5nQGFsdGVyYS5jb20gd3Jv
dGU6DQo+PiBGcm9tOiBUemUgWWVlIE5nIDx0emUueWVlLm5nQGFsdGVyYS5jb20+DQo+Pg0KPj4g
QWRkIGFzeW5jaHJvbm91cyBTdHJhdGl4IDEwIHNlcnZpY2UgbGF5ZXIgc3VwcG9ydCBmb3IgaGFy
ZHdhcmUgbW9uaXRvcg0KPj4gdGVtcGVyYXR1cmUgYW5kIHZvbHRhZ2UgcmVhZCBjb21tYW5kcyBp
biBzdHJhdGl4MTBfc3ZjX2FzeW5jX3NlbmQoKSBhbmQNCj4+IHN0cmF0aXgxMF9zdmNfYXN5bmNf
cHJlcGFyZV9yZXNwb25zZSgpLg0KPj4NCj4+IFJlZ2lzdGVyIGEgc29jZnBnYS1od21vbiBwbGF0
Zm9ybSBkZXZpY2UgZnJvbSB0aGUgc2VydmljZSBsYXllciBkcml2ZXINCj4+IHdoZW4gaGFyZHdh
cmUgbW9uaXRvciBzdXBwb3J0IGlzIGVuYWJsZWQsIHNpbWlsYXIgdG8gdGhlIFJTVSBkZXZpY2Uu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTmF6aW0gQW1pcnVsIDxtdWhhbW1hZC5uYXppbS5hbWly
dWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUemUgWWVlIE5n
IDx0emUueWVlLm5nQGFsdGVyYS5jb20+DQo+IA0KPiBUaGlzIHZlcnNpb24gb2YgdGhlIHNlcmll
cyBkb2VzIG5vdCBhcHBseSB0byB0aGUgbWFpbmxpbmUga2VybmVsLiBQbGVhc2UgcmViYXNlDQo+
IGFuZCByZXN1Ym1pdC4NCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KDQpIaSBHdWVudGVyLA0K
DQpJJ3ZlIHN1Ym1pdHRlZCB2NiB3aXRoIHJlYmFzZSBvbiB0b3J2YWxkcy9tYXN0ZXIgKGdpdmVu
IOKAnExpbnV4IDcuMi1yYzTigJ0pLg0KDQp2NiAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9jb3Zlci4xNzg0NTE2OTUzLmdpdC50emUueWVlLm5nQGFsdGVyYS5jb20vDQoNClRoYW5rcywN
ClR6ZSBZZWUNCg==
