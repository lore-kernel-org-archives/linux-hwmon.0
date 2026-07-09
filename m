Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4293E5EC0
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586735; cv=fail; b=RDIEU04jvPL+DnDIWmdViieju0Zc3bvJhD1jgo+MAQwzzqybKacUBu/EeF29SAgS3MnB8mbFp4hRZHpp+zrsnIM49zppS+BsbaLVHLyWc/fmfyB/7uP4fyaCf2XFiF6KzBrSsa7ToBi2cQ+YPbymrHGy9nYu0JgIyqjhPuvWnTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586735; c=relaxed/simple;
	bh=0V0f+vmtOFP0U24QTjh5kfS8mTeLDwpkxp6SIJeiXaQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I6R6QR0EjGb5FxD1xbJ2y2II/3C5uWXYOxseTYV4lGjmePhFlqgQ0eFZaSjSHocFGcBF07i7PKJ3BG5AvurIpm7uvpcjlgaFxJuqyeHB29k05UI/NzZdCLZ6wSuEGgZFChV37FHy5Cph8gpaCQ1IXewqXEgtq/ljELZS17g/lQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=O8xECLqZ; arc=fail smtp.client-ip=40.107.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="O8xECLqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3FcCplk8m4T5qAR+XOjaMuI2b7bzhXtM6Lz90aWWf8gfwqw34ub7MXIpPu4ZJBpGkO2mZ/mQD9Fac9H3tiWw/aykSl6GARN2zCMzX6TKvA87FMbvIEe2HsPP+NwP+/Urc++I8f7+5b9xxrbtvIQp54aLFp2W6lWEHWjgIT81G11ua4n6yb+c3xWuZKxVG2rcZRkaCg5wpv0SzWURD8BbuDSlgsutoTi93a1EbzjLPI9QZITpycOzBr7SYseVJKBacIndybU922T9mM+F0hCQdQKCTU7zqm8Ql5GW+wXn5Dn+VNDKq5OnpGf09r31VZyGI9mKi37gv5AGoTExWSjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0V0f+vmtOFP0U24QTjh5kfS8mTeLDwpkxp6SIJeiXaQ=;
 b=p/bGtAJEOrcegDaMNHLUZLRK9zJ6Qn/ZbjDJf7wF+Kj0tPlv4LvKbX1doWjCQ0BpkCeNMvYEQ9vmjJMbDYpX27zfhHgdT7lBaVGdbA4v7+I+ILIDFA3OsS+sffP50yxqxKZz8eqmtZd+r/2k5Hi7NCzM65NcIpWXEE2QHIf+Y/QNliMMwq0SBS0PdYmP3uxBZ7O2UL8la9wp1naQTSTnGNRzyajS6i+9WVRq6rEzP1hm0uTZ3ymVzj2SOM0A1JvE8imUAR60DK9RnSfSKU+m3G89oxXdnzUHBeretwybFmVPYD7SRG5D8bG75yTiVh2g3SNtLO2MjxbBqmfmqPn2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V0f+vmtOFP0U24QTjh5kfS8mTeLDwpkxp6SIJeiXaQ=;
 b=O8xECLqZvlXuZtiHvjSS2wdQWDKNGme85zs64Ky++e/8j87zs0EpjQQIR8EayXGRCdSQVGQakOYKmZtTWUfiEMnEkEcO4YrEdtxJZ59WBL+WnXwtUTUog26fOLDtE41txHuXRyaCu8WLxGioRG09NOko0Gx++TJc5qjbRoMjvKC9JZAcibr8dWRpG1BKlNXO9tYqGyKT1MqQCtmueXym82Va59gbUaL75aauR+aWs9feZdf2P+zqmLAifz9IlcrB+YpfieHC5Y9TXDroHugtJTqAkoRxwhJlHUCWVZHW2D6Fi8pbxEkqYPuUo6S1u02TFI9fmidwPVPPabd/O+cs4Q==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5356.namprd03.prod.outlook.com (2603:10b6:5:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 08:45:32 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 08:45:32 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Topic: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Index: AQHdCsMyOWRAcnirSkSm/kzKwBPvFLZbc8qAgAS72YCAAFO5AIAEZbaA
Date: Thu, 9 Jul 2026 08:45:32 +0000
Message-ID: <6c1a1b96-47a1-465d-8c44-91067251c134@altera.com>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
 <af1e81827ba72ea901686619bd66dd810f3c8b02.1783062999.git.tze.yee.ng@altera.com>
 <20260703081925.C9CAB1F000E9@smtp.kernel.org>
 <24a16e2d-205c-4340-87c4-2fe5b57c4791@altera.com>
 <cd6460b2-7f53-4ac6-8f68-172e7853f63f@kernel.org>
In-Reply-To: <cd6460b2-7f53-4ac6-8f68-172e7853f63f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5356:EE_
x-ms-office365-filtering-correlation-id: dc9a55f9-ea16-4967-d7fa-08dedd966fa9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|3023799007|6133799003|38070700021|18002099003|22082099003|4143699003|11063799006|5023799004|56012099006|55112099003;
x-microsoft-antispam-message-info:
 XC32McWvSjNxEGD3YT4PyyAsYmJCdAg74jIWLG1Nr5FPNSYd/oecHKBLETBlJrCrihZM0dvnBy7cVR/eV2XLKkavQiYP5TB005Lyxe0iS5/8gwlvwy5zAasCa4YEJuYbSKECtUPYTfI9VMd2A9UxFX3nOzKgR/Lx5b3mKvTGYHBujLthx16s7LSUsHzO7dBuVo6fvmE50hWz7faTghtXrsrNqueAzDD2MQmeuEV0V6bobzhk5kVwwLYHzpw/YiUfkvTA/PFp9vukiqGSWAFNhs6xyP5YJ8Lai3A2hL1/+ItIyXW8v7f8qKMNONjw96FfCUVHC7zMQrGL8Jhq1a7hTuD+ftmwLx6z8j75lg761hmsym6Pe2HxryuH1reUCyITJcT16YFYTTBpPt84hLpsvpPLdd4XER0bjzPUUCfAJAwZYb26qOodR6jzGod2/CQIk3FN7CDB3o3FOZohSH7yym8VUY6S6bjXGjH3IyTWkE7E3YQEiCxC8aNBywt8etJ2arPt924OFFsIY5mBgi3U0kwDObfoOpQwQ5Nm7sCak0D3uD9EG3MPbAnTRErkNjpSpHRKTfVa6k9sjaSSaGkI1deLQrCobCXgEOFmbNo3Eq/WbZn/BRzq+9PpEziCr9DXwAFKV6vxeuMXdh2JiHW3Ygb0cag6p5GFMTnJ8GMrx4EgTshHFKiS/wMBh0K3k+49HfXnZURUJ86XuXzOnF1RlM3AZOY1fI6qssRNlAVS1s8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(6133799003)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(56012099006)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmFJM20va2o1TjJOYjdjcllvcXJZWUIwWmY2YTlHa1BiVUpPSHR2KzFYNVVn?=
 =?utf-8?B?V0FySXhiMzI4UWJsYk56K29hZVpEWStuRm9iTlVEN3M1TEVhLzRtUUVaUEpj?=
 =?utf-8?B?RGZMQXB1YXNJS0o0R3YrcWtXanlhRzRQZmtoVHFSUlVrbXpFZzljYTZxY0Qr?=
 =?utf-8?B?alMwV3dSRXd2czR2MWRYNVQ0TVRhbnRTdjZwYktYQzNyNG1IU2VsWFlad1Zz?=
 =?utf-8?B?Sk4xczlyOGlCYTBwUHhmZnd6R0R5MkpNSFNEdm9zWHNHOUEvUmtDYUJyL3hM?=
 =?utf-8?B?Si96L1dnZ1BBTlZ6WEdmUTBmbkZzN3hEbDF4Y1F6aVNRbzZvWEVUTXgrS09M?=
 =?utf-8?B?M0EwYzBlVEh5U0xNaCtoYnQxd3dmaWdWU21GdVZYbHMwY00wYnZWNWNZdWFx?=
 =?utf-8?B?ZGZCanZ5YS96SHVSYitiQjZDMUwzMXUyVFAxb0NiNGY5Qmk0emZjL2xUeWRm?=
 =?utf-8?B?dVAzS1pTSVpxd1kvVnFZQ2lyM05YL1lUTlg2SU5yRzFqQ0QxZUt2Q3NRVklK?=
 =?utf-8?B?blFVTUFCdk5yZ0ExU1lKYmdHZzJORkRtL2R3Rm43TTNzM01DQmllQVZ6OVNL?=
 =?utf-8?B?dUdrOTIxNTJQVHIzVHhxZ3lNM015OVVUVzBMTlF6aW1WSk5uK3h5ZDNoSVgv?=
 =?utf-8?B?Uk5tdmZNTTIrenpFcFlvVHJTaHJVL2tualJnZjM2d1dJYVNkeVplbXNkRDU3?=
 =?utf-8?B?RzdKbXZGOWhFZUo3TDVwVCtvdXlRQWZ2V3JUeWlwUUd6OHQ5YWZuRU5EcGhl?=
 =?utf-8?B?N3ZacE1SZ2ZWcVhiR3YwL1FGKytMbW9sYTJKVnl0UFkzMXhFTWtBNUZvc1Vl?=
 =?utf-8?B?STRKYTJHVW1UU0tzQjBGUGhlZDhGcm5POEJuNmNudnUwT0UyZmIxNDFUajcx?=
 =?utf-8?B?enYvMkRTY1NGR3l4Tjl5RGhWY1VVUUR2UkJTYnB0aTh2T1JWbVFkaHgyUzdQ?=
 =?utf-8?B?a1R4S1FJWFY2Nm1BM3V0M3N0SFB4QWJoUmRmbVg4Y05wcEJUZUpLdVBidk5M?=
 =?utf-8?B?a2x6NC9ZRVU5Umh6RFZrR2w5UjA5WFpEYWxnM3c2Y3BpMWpuV2lscThzRlFm?=
 =?utf-8?B?MDJwTVk4bVZheWQyVmlVTXhPKzVIem8vdTZWMHJ5ZXY1Ri9FdmNSZ2NHamEy?=
 =?utf-8?B?Q0dXL2ZHb3JmUklFdDI1VDdVa1dRcnNoaityajduN3UxSGVtd0RqN3MwdVBN?=
 =?utf-8?B?QXEwTjVEazlWaHI5YmlCN2ZjZTQwQTJWVDgyWm14OFV2Y21kWDgxMFhESSt4?=
 =?utf-8?B?clR2L2VPelZ1cEQ4YmMrSjZrNDRzekJkYnJEakdtaDEyY1lCMjdoRG51aUQ2?=
 =?utf-8?B?THZSR1I0ek9hMWNvQkcyWHZjQWRQb0g4VTJlQWJidkg2SFA1enFqaUVIL0dQ?=
 =?utf-8?B?aVY0eG44Zytxd3FOYXkzVGxZZ0FhUlA1NS9FWDJFYWRERHhqcUEzVm5CTUVT?=
 =?utf-8?B?T3NZWVVYWDNjVjZtYUdoRjd4aEtIYjVEYU92ZC9wZW1vMmc2NDRteXIwclQz?=
 =?utf-8?B?aUsrWnFmS1h3MGk3L3JUS2o2SGhicVh5VnBPb1daY3cwc1d1NDJZWVh2VGEx?=
 =?utf-8?B?MjdxTGlhTytUdEV2UEZuazhuZ2ZkK0hsV0hMQjhoNXE2Vjc3MDQyMVVyWG5Y?=
 =?utf-8?B?WnVKK3MybGlzZmVTZVNHVVYvZElPL2dpN3dBODFWdmxFeVMvUXpkU1BlMDBt?=
 =?utf-8?B?L1Q1Vmo2MUZ6L2pmNlZ4MzF3K1RyTFp5WUlxQUdvMXdRU2FjZUJQWXJUMnph?=
 =?utf-8?B?dUlZeWZCSmdTU3FDRlZhYmxSai9IM1RCMkhGc0FFN21iNG1rRXdkTEVTdmZr?=
 =?utf-8?B?N2c3RUpCdmpHZWZuU25xSERrcmw5N1FyZzlINzVVeU5STGtvMTdhK0NHVmx2?=
 =?utf-8?B?TXg3anRuV2doMjlIcWRPc3FzT0Yydnl6MXZuZXpubHQ2Z1JzTWg1Z05FL200?=
 =?utf-8?B?dERPR2pXcFkwZTNqWlpEZytNK3grVzRMSG5adStuVHhKUVFSTVBnRkJYZUZN?=
 =?utf-8?B?SWN0QjNzSlRaODA2QzhXbEt1TTM5bzJ1TldYMjZyNkFJQmZ0ZDhEREd2K0Nk?=
 =?utf-8?B?aVVpVUtBTmh3djY5NmFZMkNYNmdYeGlXZmhJWGQ0bXRSNC9JZ0hUT2ZSWXVw?=
 =?utf-8?B?TGZjMWZWQjhZN3prUTREVGlXQlJ0NGpucEJLM3lpNmZ2OW43dkptNnNkQUFW?=
 =?utf-8?B?bHdRUVdCYXl3ajg2Z3VaTitkaVU4eEhzWE9ndTNlMURWY2wxRGljR0RBVVEr?=
 =?utf-8?B?elZYUisvS3pkdW83UXN0VGFUUndmTnBiN1F3ek1SUHI2WUZHQzZwcnE1RmRa?=
 =?utf-8?B?S1h5OXhMUmoreVh6Q2NzajBSeTJDZFcwQXR2OEp5MVNFcTdjYzdWMEUrczNp?=
 =?utf-8?Q?VdauqpHS5Cqcx6xM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA036154858945448C4D0514CCD2A363@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9a55f9-ea16-4967-d7fa-08dedd966fa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 08:45:32.1137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ps0Bd9VysZ0yvYZ2h9rmoE35eRaS0L9W3kgxJnaN7iCkSC6AogEcCafVp76vMFk4jUOpP07eKAYxd+ZdsHarxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356

T24gNi83LzIwMjYgOTozNiBwbSwgRGluaCBOZ3V5ZW4gd3JvdGU6DQo+IA0KPiANCj4gT24gNy82
LzI2IDAzOjM2LCBORywgVFpFIFlFRSB3cm90ZToNCj4+IE9uIDMvNy8yMDI2IDQ6MTkgcG0sIHNh
c2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+Pj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRy
aWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgDQo+Pj4gaXNzdWUo
cykgdG8gY29uc2lkZXI6DQo+Pj4NCj4+PiBQcmUtZXhpc3RpbmcgaXNzdWVzOg0KPj4+IC0gW0hp
Z2hdIFRoZSBhc3luYyBzZXJ2aWNlIGxheWVyIGlzIHRvcm4gZG93biBiZWZvcmUgdGhlIGNoaWxk
IA0KPj4+IHBsYXRmb3JtIGRldmljZXMgKEhXTU9OIGFuZCBSU1UpIGFyZSB1bnJlZ2lzdGVyZWQs
IGxlYWRpbmcgdG8gYSBVc2UtIA0KPj4+IEFmdGVyLUZyZWUgYW5kIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBpZiBhIGNvbmN1cnJlbnQgYXN5bmMgY2FsbCBpcyANCj4+PiBtYWRlLg0KPj4+IC0t
IA0KPj4+DQo+Pj4gY29tbWl0IDJjNjMxN2E3YWVmODk0MjhlNjE2ZWE4MzU0ZmFiMTU3YjI3ZmYz
NWYNCj4+PiBBdXRob3I6IFR6ZSBZZWUgTmcgPHR6ZS55ZWUubmdAYWx0ZXJhLmNvbT4NCj4+Pg0K
Pj4+IGZpcm13YXJlOiBzdHJhdGl4MTAtc3ZjOiBhZGQgYXN5bmMgSFdNT04gcmVhZCBjb21tYW5k
cyBhbmQgcmVnaXN0ZXIgDQo+Pj4gc29jZnBnYS1od21vbiBkZXZpY2UNCj4+Pg0KPj4+IEFkZCBh
c3luY2hyb25vdXMgU3RyYXRpeCAxMCBzZXJ2aWNlIGxheWVyIHN1cHBvcnQgZm9yIGhhcmR3YXJl
IG1vbml0b3INCj4+PiB0ZW1wZXJhdHVyZSBhbmQgdm9sdGFnZSByZWFkIGNvbW1hbmRzLiBSZWdp
c3RlciBhIHNvY2ZwZ2EtaHdtb24gcGxhdGZvcm0NCj4+PiBkZXZpY2Ugd2hlbiBoYXJkd2FyZSBt
b25pdG9yIHN1cHBvcnQgaXMgZW5hYmxlZC4NCj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9maXJtd2FyZS9zdHJhdGl4MTAtc3ZjLmMgYi9kcml2ZXJzL2Zpcm13YXJlLyANCj4+Pj4gc3Ry
YXRpeDEwLXN2Yy5jDQo+Pj4+IGluZGV4IGMyNGNhNTgyMzA3OGYuLjcxNmI1OGY1YTYxNzAgMTAw
NjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvc3RyYXRpeDEwLXN2Yy5jDQo+Pj4+ICsr
KyBiL2RyaXZlcnMvZmlybXdhcmUvc3RyYXRpeDEwLXN2Yy5jDQo+Pj4NCj4+PiBbIC4uLiBdDQo+
Pj4NCj4+Pj4gQEAgLTIwNTAsNiArMjA4Nyw5IEBAIHN0YXRpYyB2b2lkIHN0cmF0aXgxMF9zdmNf
ZHJ2X3JlbW92ZShzdHJ1Y3QgDQo+Pj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+Pj4gwqDC
oMKgwqDCoMKgIG9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoY3RybC0+ZGV2KTsNCj4+Pj4gK8KgwqDC
oCBpZiAoc3ZjLT5zdHJhdGl4MTBfc3ZjX2h3bW9uKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcGxh
dGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoc3ZjLT5zdHJhdGl4MTBfc3ZjX2h3bW9uKTsNCj4+Pj4g
Kw0KPj4+DQo+Pj4gW1NldmVyaXR5OiBIaWdoXQ0KPj4+IFRoaXMgaXMgYSBwcmUtZXhpc3Rpbmcg
aXNzdWUsIGJ1dCBkb2VzIHVucmVnaXN0ZXJpbmcgdGhlIGNoaWxkIA0KPj4+IGRldmljZXMgaGVy
ZQ0KPj4+IGludHJvZHVjZSBhIHJhY2UgY29uZGl0aW9uIHdpdGggbW9kdWxlIHJlbW92YWw/DQo+
Pj4NCj4+PiBJbiBzdHJhdGl4MTBfc3ZjX2Rydl9yZW1vdmUoKSwgd2UgdGVhciBkb3duIHRoZSBh
c3luYyBzZXJ2aWNlIGxheWVyIA0KPj4+IGJlZm9yZQ0KPj4+IHRoZSBjaGlsZCBkZXZpY2VzIGFy
ZSB1bnJlZ2lzdGVyZWQ6DQo+Pj4NCj4+PiDCoMKgwqDCoHN0cmF0aXgxMF9zdmNfYXN5bmNfZXhp
dChjdHJsKTsNCj4+PiDCoMKgwqDCoG9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoY3RybC0+ZGV2KTsN
Cj4+PiDCoMKgwqDCoGlmIChzdmMtPnN0cmF0aXgxMF9zdmNfaHdtb24pDQo+Pj4gwqDCoMKgwqDC
oMKgwqAgcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoc3ZjLT5zdHJhdGl4MTBfc3ZjX2h3bW9u
KTsNCj4+Pg0KPj4+IElmIGEgc3lzZnMgcmVhZCBmb3IgdGhlIGh3bW9uIGRldmljZSAoZS5nLiwg
dGVtcDFfaW5wdXQpIHJhY2VzIHdpdGggDQo+Pj4gbW9kdWxlDQo+Pj4gdW5sb2FkLCBjb3VsZCBp
dCBwcm9jZWVkIHRvIHN0cmF0aXgxMF9zdmNfYXN5bmNfc2VuZCgpIGJlY2F1c2UgdGhlIA0KPj4+
IGRldmljZQ0KPj4+IGlzIG5vdCB5ZXQgdW5yZWdpc3RlcmVkPw0KPj4+DQo+Pj4gSWYgc28sIGl0
IGxvb2tzIGxpa2Ugc3RyYXRpeDEwX3N2Y19hc3luY19zZW5kKCkgd2lsbCBkZXJlZmVyZW5jZSB0
aGUgDQo+Pj4gYWNoYW4NCj4+PiBzdHJ1Y3R1cmUgdGhhdCB3YXMgYWxyZWFkeSBmcmVlZDoNCj4+
Pg0KPj4+IMKgwqDCoMKgcmV0ID0gaWRhX2FsbG9jX21heCgmYWNoYW4tPmpvYl9pZF9wb29sLCBN
QVhfU0RNX0pPQl9JRFMsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9L
RVJORUwpOw0KPj4+DQo+Pj4gQW5kIGxhdGVyIGF0dGVtcHQgYSBOVUxMIHBvaW50ZXIgZGVyZWZl
cmVuY2UsIGFzIGFjdHJsLT5pbnZva2VfZm4gd2FzIA0KPj4+IHNldA0KPj4+IHRvIE5VTEwgYnkg
c3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCk6DQo+Pj4NCj4+PiDCoMKgwqDCoGFjdHJsLT5pbnZv
a2VfZm4oYWN0cmwsICZhcmdzLCAmcmVzKTsNCj4+Pg0KPj4+IFNob3VsZCB0aGUgY2hpbGQgcGxh
dGZvcm0gZGV2aWNlcyBiZSB1bnJlZ2lzdGVyZWQgYmVmb3JlDQo+Pj4gc3RyYXRpeDEwX3N2Y19h
c3luY19leGl0KCkgaXMgY2FsbGVkPw0KPj4+DQo+Pj4+IMKgwqDCoMKgwqDCoCBwbGF0Zm9ybV9k
ZXZpY2VfdW5yZWdpc3RlcihzdmMtPnN0cmF0aXgxMF9zdmNfcnN1KTsNCj4+Pj4gwqDCoMKgwqDC
oMKgIGZvciAoaSA9IDA7IGkgPCBTVkNfTlVNX0NIQU5ORUw7IGkrKykgew0KPj4+DQo+Pg0KPj4g
SGksDQo+Pg0KPj4gQWdyZWVkIHdpdGggU2FzaGlrbydzIGNvbW1lbnQuIEluIHN0cmF0aXgxMF9z
dmNfZHJ2X3JlbW92ZSgpLA0KPj4gc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkgY3VycmVudGx5
IHJ1bnMgYmVmb3JlIHRoZSBod21vbiBhbmQgUlNVDQo+PiBwbGF0Zm9ybSBkZXZpY2VzIGFyZSB1
bnJlZ2lzdGVyZWQuIEEgY29uY3VycmVudCBzeXNmcyByZWFkIGNvdWxkIHN0aWxsDQo+PiByZWFj
aCBzdHJhdGl4MTBfc3ZjX2FzeW5jX3NlbmQoKSBhbmQgdXNlIHJlc291cmNlcyBhbHJlYWR5IHRv
cm4gZG93biBieQ0KPj4gc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkuDQo+Pg0KPj4gVGhpcyBv
cmRlcmluZyBwcmVkYXRlcyB0aGUgaHdtb24gcmVnaXN0cmF0aW9uIGluIHRoaXMgc2VyaWVzOyBS
U1UNCj4+IGZvbGxvd3MgdGhlIHNhbWUgcGF0dGVybiB0b2RheS4gVGhlIGZpeCB3b3VsZCBiZSB0
byB1bnJlZ2lzdGVyIGNoaWxkDQo+PiBwbGF0Zm9ybSBkZXZpY2VzIChhbmQgZGVwb3B1bGF0ZSkg
YmVmb3JlIGNhbGxpbmcgDQo+PiBzdHJhdGl4MTBfc3ZjX2FzeW5jX2V4aXQoKS4NCj4+DQo+PiBX
ZSBjYW4gaW5jbHVkZSB0aGF0IHJlb3JkZXIgaW4gdGhpcyBzZXJpZXMsIG9yIHNlbmQgaXQgYXMg
YSBzZXBhcmF0ZQ0KPj4gc3RyYXRpeDEwLXN2YyBmaXguDQo+Pg0KPiANCj4gUGxlYXNlIHNlbmQg
dGhhdCBhcyBhIHNlcGFyYXRlIGZpeC4NCj4gDQo+IFRoYW5rcywNCj4gRGluaA0KDQpIaSBEaW5o
LA0KDQpTdXJlLCB3ZSB3aWxsIHNlbmQgdGhlIGZpeCBpbiBhIHNlcGFyYXRlIHBhdGNoIHNlcmll
cy4NCg0KVGhhbmtzLA0KVHplIFllZQ0K
