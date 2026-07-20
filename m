Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6E39B95D
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551474; cv=fail; b=b01befS1WAC2UCN7iuqiRsC2TsHL1dwkej2Edlll6GcVScy+AowkN4V5OhWZINM6eJoxyZLpRe4aejTHauaVaWor4ToPeT/p9+7GegmhHA7rPcyRApZaotY55/pl4m0zDC7VG3s3a6v0Y2agrwormrnm/retmltsRUuwXpCCGN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551474; c=relaxed/simple;
	bh=+alMm4bf3UCMkUIOjNwvOrNpD/YIt1BwybJ/8+1icLY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fr7d8eqlCOgEegBvmYYH0s4nN6BgnDzMvUy6+zKyByWSc1L1bZYzyrpCgkxUDTUj/0hhjfYXknXgFKCzzagKs7r5zQTCGwUEUziSo0KrNvdm/IneWS+lejmbSb358X+fNZ+j35R3DXRW283BSX9nY3j40MKs0JZY5mxc8SN+YE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=w7ilKTGn; arc=fail smtp.client-ip=52.101.53.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="w7ilKTGn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tN7+Y+Js5H1Vu7hNiVGjPlO52fBl1SX0KmeQVpMmjkWJ74LtPHy4qFSa4YQHdyhc+4fnTk4wh7KIHxKjxRJlircPJz1mDFfOepQyPC498ynHAT6ERW6GIFDQ5B55O/Logtb7mJ19M7tRLkyRPLYwpPefwA/h3vxhbqq2TMOO++pNzWk/9wyONjGU9a+VR2jYJFBlQVGzGg8ojTKY/xQrM3JGdvukLNxWeGrbZRFBqSBUh+lCwitwbFtsPkiyNRuJRkHGcEExe9riw1ZtIxkiJRlKIzbF9IK0Ox5wLHaMTuUtwpHRfiaEOZXdfGZ/LCGoEqgTm5nL49OkrISoD88acg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+alMm4bf3UCMkUIOjNwvOrNpD/YIt1BwybJ/8+1icLY=;
 b=wMSMcQNjliFVlCP5qgU5yiWy1c57pT8vu7bDEjDL7OsrlG6lqY2souW0a1kFZKxh1mojCThCHv57bPWCcRZJ75y6y6ThYEZiEJlDbUrIJJlQhgwhrml4WqcgapaibEzA4TxXUysOu8kj7T76+fbRCJtrez8EQQB8Jdt4se1eErDfPSwcMMg8+sMwcnjiRibVO/01nRWDLsVruTxgpff/9WqgKToX6S60CuvHoE1oUZz2zFSehVPTgs09Xj3VLFp36o1MobBruADNQxI4QlgFMDhVIKjZjV+XL+hR7PfS20Ni4tciBU74WbftvjJ3XWefamwRuUrLQw+rEExbeVYTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+alMm4bf3UCMkUIOjNwvOrNpD/YIt1BwybJ/8+1icLY=;
 b=w7ilKTGnOXXgFt5boHVxVY8QDav3sGgI+7oN5FKM3fRZ4Dbd17voAZzwcFV7IS+Q6qeclU/vyiXqUuLxf4TzX5iUP015rxnfBuMzGe0/YQCuM+8gYpFcLs9M9FqoA9+TjP92mYYJ5GSn8B1eknxGBFsRVuJpEWhv7BPOjvcDOBMntRkWgQ+iU8m3VerbUIdYGTayfT9Qx8agSAZiLkNxcissRe0ZjeztHx2zNRSw3YBWXu0GllozrNJvfpG7ZLz29GtLE3uXXg88oiG+l0zIuqRDUFBXwmZ/LuxwPJLEC05EKTJGyaqLAHEYMeL6cYSHTaSd8J4niCS8zCyeS6q/Pw==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7727.namprd03.prod.outlook.com (2603:10b6:8:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 12:44:28 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 12:44:28 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Guenter Roeck <linux@roeck-us.net>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Thread-Topic: [PATCH v6 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Thread-Index: AQHdF/d07FvM+mtVEEKBY1VPko3f1rZ1wf8AgAAMggCAAIyQgA==
Date: Mon, 20 Jul 2026 12:44:28 +0000
Message-ID: <b8c78ad2-bcb2-43a7-8d53-0eaa80ff9b42@altera.com>
References: <cover.1784516953.git.tze.yee.ng@altera.com>
 <a686d2c3ef56a3ce28b059621a237259af314032.1784516953.git.tze.yee.ng@altera.com>
 <20260720033636.A08491F000E9@smtp.kernel.org>
 <f5189cb4-570e-4eb0-9152-759512d351d5@roeck-us.net>
In-Reply-To: <f5189cb4-570e-4eb0-9152-759512d351d5@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DS0PR03MB7727:EE_
x-ms-office365-filtering-correlation-id: c0e00065-e4f7-4f1c-9ebc-08dee65ca320
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|55112099003|3023799007;
x-microsoft-antispam-message-info:
 rN/UrhfBgO4blC1eyazTlUWpuAlCNnV/DBORgf2JGZnKadBrTcwnJYllhx4yKmL5tZA+H1cq/Sw7xChaC9ltr7teGm/krFcC5VxRniYgR+AXhBiPBu6gyNm7eRR7nO++Cop9XeAhASzWWOmBEU6jrGbeJuSmXZa46NZTDVHwvtvOgvbwZrAA7FDy1YtW1/7ax87q+ZV6AyjAB+ZXdI8NIImMtm0Mu6/Wk0WC0IWiRXWBGBS1cqU3V5uzWZd+XR8zMfYnTseZ0rm1lhNbFsfcyGjfc8bqBZoQc9xAj9fo+hQMlaU8BKK/hKannP1oFMXHog8HlxEHhZ/CFOoqX8Z4lQ7CB9kbWojSOjoSMtmBlwUkEYS9DFtyh66ooRI62Covoks9POk3gZdW77icdoWLe6yKStTfc6nVssdG1UAKhxIXoH3AsSh5P4dDQnF9YPGQNTfq9+DuXEOUclRs61kOSwmza9eao5gh7UqJkPSQ1HP2aeeX2N+e/u2fFhNLB6Lo1xH7ZCqqfGu2D2OTGGZvSkE0J6b++P7LLp5ry9UoU8431H1oZY5XUBFGcmFEINDZvfpYZTpoo9929D3QCV2V6im+m+q5WJgp4uOySVkZnCUVoC/NYwOVI91NbC/HuPvxUuCcED5VRifglpStkRJGkrWSnuxjXJXz3ny+7Og+DO+jgz+ohFchDm8xJS6LsTQNW1SZtHkHQkVZS6NHSbhntVNuQJHRnnAwzOLKSepqouU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(55112099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFU4cnFBTnI5USs5Tlk4SzJkdjZiT3NBN1hGQUpka0F6dlFwZUg0YThhN3Bs?=
 =?utf-8?B?Q1ZVd0VHZ3hGb2xNdTNZbHBFYWJtNldiSEszd0FseTNIeUdaaEZVMzE3NGx6?=
 =?utf-8?B?enBPVmN0dVdXeC9UNkhYcjhpQmtTUUJvY2VrcWsrVEFSRzFRaFEzZ3JwVEhO?=
 =?utf-8?B?eDJOU1J2b1pIdk1halVyRUhvRTBjMWJPUURFeTVWYTVVM2c2RDNYR0FJT3M2?=
 =?utf-8?B?VUg0THFNVjJ5K29xbFk3dnV1cU1ZVXFMUi9YT2pzTGpJSlNNTlpQYmx2Sk5P?=
 =?utf-8?B?Z2NGdEtOdU4xSmNXRUZpZ1g3bVVBcldYcWFOL1J2ZG9LR2FBeUs1dlU0QXZF?=
 =?utf-8?B?R3hTSDlRZU8vSVhXVkZLS2tYSFZZK25EcVU2WFA4UVloTml3VVFxZlpsYXZL?=
 =?utf-8?B?ZnJpcFpNNUg3RnQyblBxamI3Qi92WUQzZ2tWbGRZYzRHOGdMYmRCdSt6cUd3?=
 =?utf-8?B?RW1OaXY3eGl1Vi9YbGFFUEh1a2tGSlJBc3MvdGErOEgxeDV2cmZaSW11SVZR?=
 =?utf-8?B?K2dGOXVWZnFTcW92ci9CbXp6UHNYTDR3dEdiMHppR3B3SVNwQk5ONnZNak9W?=
 =?utf-8?B?Zjd2aG0xdUFBSWhrVldMN0paWnVEV0F3NHhHQUV5MjJRZXhwTzcwcjdWeW1T?=
 =?utf-8?B?NUJ4S0lKaTlpL25aMUJnNWVlMHlOVWVZWkRSY05tVXRiMFRHZUJJM2VoZGJ0?=
 =?utf-8?B?MzV1QXBCMEo3Ti81bzE2dm5SM2NkV3NXYXJuR2JaZW9MMVRUcExONFlCWkVG?=
 =?utf-8?B?S2JkTTdFTlZpUTIyYiswN3NxSWJJMU52SUM3M0E2YTk2c2RoUFp4cGFjL2V1?=
 =?utf-8?B?SXk1SkZWaFZHZnptdTBnK1VMdFVqYTBSdzBTaEJJQlNaY3VMVEdKbk9XYmdr?=
 =?utf-8?B?QVJialNGdjRyMWtuMEE0cjg5eHVWd0YxWWM0WWtXZCtvRUU4bHhYdzVtYmVF?=
 =?utf-8?B?VVllenR6KzNRamFTNDkvMXpMRjAxQ2d5aFlOLy9uc3NrdW5OSW9SK0l2V3V0?=
 =?utf-8?B?Y3BNWVR4QzZEWGdwRldXeFF6S283Vys1SlNiSEhWb1ZIRjR2QjZOSkxTQnZu?=
 =?utf-8?B?ZFFvUW94c2phc0UxRTE1bFFhN3ZJUlE3Z2Z1cVl1bGdzME45RzVVelhFaGF1?=
 =?utf-8?B?K1cvUm5SUDF2NDE0bklJU1RuSndqRmVXbE85eHd6RUtXNXluN09qM0hpdTFP?=
 =?utf-8?B?MFBKUmhFMnZUS25rZ1V2LzV5ZHVKcXc1a05ndUdBMmlFaFdQYUFSekplUEQ5?=
 =?utf-8?B?QzdoTFhaOW84TDUxdkQvRWNmQ2MrRzFNR2NMTm5TdmNabXViQWlPNkRYUStv?=
 =?utf-8?B?ZGJCZFd3a015ejY0ekYvKzlaVEQzZTBvRDVqZDRTWHByOXRTUjF3Q1JDMHpu?=
 =?utf-8?B?QzhUbDEyaXhJbk1GRmpEWjZpN2NPUjI1QWJnNmh3YWdkNDFMdlo0dDdIN1dW?=
 =?utf-8?B?T2M4MlRPcGlzWlNsUEZsQ3ozdmZiZnhqd3NGUllOTE8ydW9uNkF4NWZtblIw?=
 =?utf-8?B?SGNaNTJkRnE5RVkrVWYwT0kxTmJic0ZsTlNUby8wZEdnTVl0cW80dWtxa2I3?=
 =?utf-8?B?cVFtUXJ5SEdWWERoVEQxNFY5WGJhWjNDbjhlRTQxVTlVenBKd2VIY2FSN0Uv?=
 =?utf-8?B?bFdRRUpMdWpXbGJyWjlMVzNQTDNSZzU0RkZsdm1zWlhFSE5OV2NFOTBiaE5K?=
 =?utf-8?B?S0F1dzczSldIRkdWZWVWNUpBNkIxckFCbFJ5RjIydlRXV3pHMnNEYWtGaWts?=
 =?utf-8?B?RVZBajNYVGJ1aFJSRVF6aFJOZE1jLytnek1TWXJvSWRQWG5OZFE4Rm9IL1NN?=
 =?utf-8?B?bXFnZDlhMEZQWEU0cG5vNm50QzZBSG9kOWNJR0hUcjZwbzRBaktvTUxJb3Uz?=
 =?utf-8?B?Unp3MzhGOW00NmUxNlBxYmNlcWxGQlBRM2dvZ1UveUtaK3lTeTlLSmZaLzhz?=
 =?utf-8?B?Qm5DZlBQODd5akNKMlgwRVhUb2xjcWZSZDZOdS94T0ZCdHRjUzVLUndrOTU1?=
 =?utf-8?B?UllzZ3FWY1FFclg2bXkrODNlSnhLR1FuVmpoNzhSc2hjN3NNekJ5bG1TTThX?=
 =?utf-8?B?M3NFaDlvM2p3NU9BcENwa01zQ1ovZjNKSDJVYkFlWUJtNW5hVzdlZU9vRnVY?=
 =?utf-8?B?MDhmSlhMTFZEZGdyT0J2b0dhWDlTS0pjd2szaEltelRLUmVUWHkyV0Q4UzU3?=
 =?utf-8?B?dHNpM05xNk16Vkx3VXcwYWlGNHc4WWRWMVlFZ1B2UWFnOTZLMk5UZTFGN0J2?=
 =?utf-8?B?dCtPZHU5bzRIL2xuOUlyOVl5THJXZTBpaC90L0ZjcE1uQStlUW1VNWI3MnFM?=
 =?utf-8?B?THFrRXJTdmJpaEZXdDM1NzdoRW5UbXpqYUFpQWU2THNsU3BOcjJJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <256DBAF2FDE1ED40AF6D0F4C9C9D3A06@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e00065-e4f7-4f1c-9ebc-08dee65ca320
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 12:44:28.0986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y99TqSZQR5gVrhtgryar8Vy5DvlmN+au1e71iFqgqRNB7ERYi5d25qXphIFXacG+TI4Yfz68x+T33022Uph5DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7727

T24gMjAvNy8yMDI2IDEyOjIxIHBtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiA3LzE5LzI2
IDIwOjM2LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPj4gVGhhbmsgeW91IGZvciB5
b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwgDQo+
PiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4+IC0gW0hpZ2hdIE1pc3NpbmcgYnJlYWsgaW4gYXN5
bmMgcG9sbCBsb29wIGNhdXNlcyBzZXZlcmUga2VybmVsIGxvZyANCj4+IHNwYW0gYW5kIHVubmVj
ZXNzYXJ5IGJsb2NraW5nIG9uIGhhcmQgZXJyb3JzLg0KPj4gLSBbSGlnaF0gU3luY2hyb25vdXMg
cmVhZCB0aW1lb3V0cyBsZWF2ZSBzdGFsZSByZXF1ZXN0cyBpbiB0aGUgY2hhbm5lbCANCj4+IEZJ
Rk8sIGNhdXNpbmcgYWxsIHN1YnNlcXVlbnQgcmVhZHMgdG8gcHJvY2VzcyBzdGFsZSBkYXRhIGFu
ZCByZXR1cm4gDQo+PiBtaXNtYXRjaGVkIHNlbnNvciB2YWx1ZXMuDQo+PiAtLSANCj4+DQo+PiAt
LS0gUGF0Y2ggWzJdOiBbUEFUQ0ggdjYgMi8yXSBod21vbjogYWRkIEFsdGVyYSBTb0MgRlBHQSBo
YXJkd2FyZSANCj4+IG1vbml0b3JpbmcgZHJpdmVyIC0tLQ0KPj4gY29tbWl0IGFiNmMwYzBmOTVk
Mzg5MGQ3NTllMDRkOWQ5YWVjZDE1MWQ2NDA2ZmQNCj4+IEF1dGhvcjogVHplIFllZSBOZyA8dHpl
LnllZS5uZ0BhbHRlcmEuY29tPg0KPj4gU3ViamVjdDogaHdtb246IGFkZCBBbHRlcmEgU29DIEZQ
R0EgaGFyZHdhcmUgbW9uaXRvcmluZyBkcml2ZXINCj4+DQo+PiBUaGlzIGNvbW1pdCBhZGRzIGEg
aGFyZHdhcmUgbW9uaXRvcmluZyBkcml2ZXIgZm9yIEFsdGVyYSBTb0MgRlBHQSANCj4+IGRldmlj
ZXMgdXNpbmcNCj4+IHRoZSBTdHJhdGl4IDEwIHNlcnZpY2UgbGF5ZXIuDQo+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2h3bW9uL3NvY2ZwZ2EtaHdtb24uYyBiL2RyaXZlcnMvaHdtb24vc29j
ZnBnYS0gDQo+Pj4gaHdtb24uYw0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXgg
MDAwMDAwMDAwMDAwMC4uNzI0MTgyMDFiNjVkNg0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysg
Yi9kcml2ZXJzL2h3bW9uL3NvY2ZwZ2EtaHdtb24uYw0KPj4gWyAuLi4gXQ0KPj4+ICtzdGF0aWMg
aW50IHNvY2ZwZ2FfaHdtb25fYXN5bmNfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gaHdtb25fc2Vuc29yX3R5
cGVzIHR5cGUsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBzdHJhdGl4MTBfc3ZjX2NsaWVudF9tc2cgKm1zZykNCj4+PiArew0KPj4gWyAuLi4gXQ0K
Pj4+ICvCoMKgwqAgcmV0ID0gLUVUSU1FRE9VVDsNCj4+PiArwqDCoMKgIHdoaWxlICghdGltZV9h
ZnRlcihqaWZmaWVzLCBkZWFkbGluZSkpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0g
c3RyYXRpeDEwX3N2Y19hc3luY19wb2xsKHByaXYtPmNoYW4sIGhhbmRsZSwgJmRhdGEpOw0KPj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoc3RhdHVzID09IC1FQUdBSU4pIHsNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIkFzeW5jIG1lc3NhZ2UgaXMgc3RpbGwgaW4gcHJv
Z3Jlc3NcbiIpOw0KPiANCj4gVGhpcyBhbHNvIGNyZWF0ZXMgYSBsb3Qgb2Ygbm9pc2UgaWYgZGVi
dWdnaW5nIGlzIGFjdGl2ZS4gSSBkb24ndCBrbm93DQo+IGhvdyBsb25nIHRoZSBjb21tYW5kIHVz
dWFsbHkgdGFrZXMsIGJ1dCBpdCBkb2VzIHNlZW0gdG8gbWUgdGhhdCB0aGlzIGRlYnVnDQo+IG1l
c3NhZ2UgaXNuJ3QgcmVhbGx5IGhlbHBmdWwuDQo+IA0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9IGVs
c2UgaWYgKHN0YXR1cyA8IDApIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfYWxl
cnQoZGV2LCAiRmFpbGVkIHRvIHBvbGwgYXN5bmMgbWVzc2FnZTogJWRcbiIsIA0KPj4+IHN0YXR1
cyk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVUSU1FRE9VVDsNCj4+DQo+
PiBbU2V2ZXJpdHk6IEhpZ2hdDQo+PiBEb2VzIHRoaXMgbG9vcCBuZWVkIGEgYnJlYWsgc3RhdGVt
ZW50IGhlcmUgd2hlbiBzdGF0dXMgPCAwPw0KPj4NCj4+IElmIHN0cmF0aXgxMF9zdmNfYXN5bmNf
cG9sbCgpIHJldHVybnMgYSBoYXJkIGVycm9yLCB0aGUgY29kZSBzZXRzDQo+PiByZXQgPSAtRVRJ
TUVET1VUIGJ1dCBjb250aW51ZXMgdG8gbG9vcCBmb3IgdXAgdG8gMiBzZWNvbmRzLiBUaGlzIGNv
dWxkDQo+PiBmbG9vZCB0aGUga2VybmVsIGxvZyB3aXRoIGRldl9hbGVydCgpIG1lc3NhZ2VzIG9u
IGV2ZXJ5IDFtcyByZXRyeS4NCj4+DQo+IA0KPiBTYXNoaWtvIGhhcyBhIGdvb2QgcG9pbnQsIGVz
cGVjaWFsbHkgc2luY2UgdGhlIGZ1bmN0aW9uIHJldHVybnMNCj4gLUVJTlZBTCB3aGljaCwgaWYg
c2Vlbiwgc2VlbXMgdG8gYmXCoCBfcmVhbF8gaGFyZCBlcnJvciBhbmQgcmV0cnlpbmcNCj4gc2Vl
bXMgcG9pbnRsZXNzLiBBbHNvLCB3aHkgcmVwbGFjZSAtRUlOVkFMIHdpdGggLUVUSU1FRE9VVCA/
DQo+IFRoYXQgd291bGQgbmVlZCBhbiBleHBsYW5hdGlvbi4NCj4gDQo+IE9uIHRvcCBvZiB0aGF0
LCAicmV0ID0gLUVUSU1FRE9VVDsiIGlzIHBvaW50bGVzcyBoZXJlIHNpbmNlIHJldCBpcw0KPiBh
bHJlYWR5IHNldCB0byAtRVRJTUVET1VULg0KPiANCj4gT2gsIGFuZCB0aGUgY2FsbGVkIGNvZGUg
YWxyZWFkeSBkaXNwbGF5cyBhbiBlcnJvciBtZXNzYWdlIHVubGVzcw0KPiB0aGUgcGFyYW1ldGVy
cyBhcmUgYmFkLg0KPiANCg0KQWdyZWVkLiBJbiB2NyBJJ2xsIGJyZWFrIG91dCBvZiB0aGUgcG9s
bCBsb29wIG9uIGhhcmQgZXJyb3JzLCByZXR1cm4gdGhlIA0KcmVhbCBwb2xsIGVycm9yIGluc3Rl
YWQgb2YgLUVUSU1FRE9VVCwgZHJvcCB0aGUgcmVkdW5kYW50IGFsZXJ0IChTVkMgDQphbHJlYWR5
IGxvZ3MpIGFuZCByZW1vdmUgdGhlIC1FQUdBSU4gZGVidWcgcHJpbnQuDQoNCj4+PiArwqDCoMKg
wqDCoMKgwqAgfSBlbHNlIGlmIChzdGF0dXMgPT0gMCkgew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IDA7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgwqDCoMKgwqAgbXNsZWVwKEhXTU9OX1JFVFJZ
X1NMRUVQX01TKTsNCj4gDQo+IEkgd291bGQgc3VnZ2VzdCB0byB1c2UgdXNsZWVwX3JhbmdlKCku
DQo+IA0KDQpBZ3JlZWQuIEluIHY3IEknbGwgc3dpdGNoIHRoZSBzaG9ydCB3YWl0cyB0byB1c2xl
ZXBfcmFuZ2UoKS4NCg0KPj4+ICvCoMKgwqAgfQ0KPj4gWyAuLi4gXQ0KPj4+ICtzdGF0aWMgaW50
IHNvY2ZwZ2FfaHdtb25fc3luY19yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5
cGUsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc3Ry
YXRpeDEwX3N2Y19jbGllbnRfbXNnICptc2cpDQo+Pj4gK3sNCj4+IFsgLi4uIF0NCj4+PiArwqDC
oMKgIHJldCA9IHN0cmF0aXgxMF9zdmNfc2VuZChwcml2LT5jaGFuLCBtc2cpOw0KPj4+ICvCoMKg
wqAgaWYgKHJldCA8IDApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gc3RhdHVzX2RvbmU7DQo+
Pj4gKw0KPj4+ICvCoMKgwqAgcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZwcml2
LT5jb21wbGV0aW9uLCANCj4+PiBIV01PTl9USU1FT1VUKTsNCj4+PiArwqDCoMKgIGlmICghcmV0
KSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIocHJpdi0+Y2xpZW50LmRldiwgInRpbWVv
dXQgd2FpdGluZyBmb3IgU01DIGNhbGxcbiIpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAt
RVRJTUVET1VUOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIHN0YXR1c19kb25lOw0KPj4NCj4+
IFtTZXZlcml0eTogSGlnaF0NCj4+IElmIGEgdGltZW91dCBvY2N1cnMgaGVyZSwgY291bGQgdGhl
IHVuZnVsZmlsbGVkIHJlcXVlc3QgcmVtYWluIGluIHRoZQ0KPj4gU1ZDIGNoYW5uZWwncyBGSUZP
Pw0KPj4NCj4+IFdoZW4gdGhlIHRpbWVvdXQgaGl0cywgdGhpcyBwYXRoIGNhbGxzIHN0cmF0aXgx
MF9zdmNfZG9uZSgpIHdoaWNoIA0KPj4gc3RvcHMgdGhlDQo+PiB3b3JrZXIgdGhyZWFkLCBidXQg
aXQgZG9lc24ndCBhcHBlYXIgdG8gcmVtb3ZlIHRoZSByZXF1ZXN0IGZyb20gY2hhbi0gDQo+PiA+
c3ZjX2ZpZm8uDQo+Pg0KPj4gV291bGQgdGhlIG5leHQgc2Vuc29yIHJlYWQgZW5xdWV1ZSBhIG5l
dyByZXF1ZXN0IGFuZCByZWNlaXZlIHRoZSBzdGFsZSANCj4+IGRhdGENCj4+IGZyb20gdGhpcyB0
aW1lZC1vdXQgcmVxdWVzdCwgcGVybWFuZW50bHkgZGVzeW5jaHJvbml6aW5nIGFsbCBzdWJzZXF1
ZW50DQo+PiBzZW5zb3IgcmVhZGluZ3M/DQo+Pg0KPiANCj4gUGxlYXNlIGVpdGhlciBhZGRyZXNz
IG9yIGV4cGxhaW4gd2h5IGl0IGlzIG5vdCBhIHByb2JsZW0uDQo+IA0KPiBUaGFua3MsDQo+IEd1
ZW50ZXINCj4gDQoNClllcywgdGhhdCByYWNlIGlzIHJlYWwgaWYgdGhlIHdvcmtlciBleGl0cyB2
aWEga3RocmVhZF9zaG91bGRfc3RvcCgpIA0KYmVmb3JlIGRlcXVldWluZy4gc3RyYXRpeDEwX3N2
Y19kb25lKCkgc3RvcHMgdGhlIHRocmVhZCBidXQgZG9lcyBub3QgDQpmbHVzaCBzdmNfZmlmby4N
Cg0KRm9yIHRoaXMgZHJpdmVyIEkgd2lsbCBpbnZhbGlkYXRlIGFuIGluLWZsaWdodCB0cmFuc2Zl
ciBnZW5lcmF0aW9uIGFmdGVyIA0KYSB0aW1lb3V0IHNvIGEgbGF0ZS9zdGFsZSBjYWxsYmFjayBj
YW5ub3QgY29tcGxldGUgdGhlIG5leHQgcmVhZC4gQSANCnByb3BlciBGSUZPIGRyYWluIGluIHN0
cmF0aXgxMF9zdmNfZG9uZSgpIHdvdWxkIHN0aWxsIGJlIHVzZWZ1bCBhcyBhIA0KZm9sbG93LXVw
IGluIHRoZSBzZXJ2aWNlIGxheWVyLg0KDQo+Pj4gK8KgwqDCoCB9DQo+Pj4gKw0KPj4+ICvCoMKg
wqAgcmV0ID0gcHJpdi0+bGFzdF9lcnI7DQo+Pj4gKw0KPj4+ICtzdGF0dXNfZG9uZToNCj4+PiAr
wqDCoMKgIHN0cmF0aXgxMF9zdmNfZG9uZShwcml2LT5jaGFuKTsNCj4+PiArwqDCoMKgIHJldHVy
biByZXQ7DQo+Pj4gK30NCj4+DQo+IA0KDQo=
