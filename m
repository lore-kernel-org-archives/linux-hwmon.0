Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A8379EE2
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Jul 2026 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096077; cv=fail; b=lbI+3dI1Dw/e+Wy2oGjyN4vRKyoU4sLGhnvhXm82Ywp1RQErI9BnMSVvvcDPWsR9gQjBOXdDZUwVykz+o+LaFzsrWZmoi5SJUf+fe7z3JZ1noJKTr07+aPM8bHEy/Ies5pgxyYzMChmfw5B+gC/0kOBVDJMoItYcisImmP9CM+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096077; c=relaxed/simple;
	bh=NsFRjyga4bZxxiRNDufIXIDel+xkjwNCsCMXDe2KyeM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dab8yB+PI3z5wfGA0cxXigAQtiOJn8x+QK25P6qmLSPDUxiY/HW0v7rVKTH88NrhhASKC6QHl+Vd+7VB8FcwFaq1C8g545/zBzam/TD9Fe0LGgyDB0SfU+xgFiQkcnkgZRKwlj56jxBBN/3/o8lKpHS6Yrb8pY5P4tKryjaEQNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Por0SfQs; arc=fail smtp.client-ip=52.101.52.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Por0SfQs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw95QEbNpea6uvRDAG/MpGItAv6N3IaNGUDjBkCpz9up+sUy0yNRWFlI/ZogQ7V2s4nf8d4CBC6d5q06XtzqvxBBSlZvzIDsolgFQ9BXfqb23xkas1TzJcxcrfwUaQ6zcM/4xUlgj6KFn8AgU9L3pCNQKi6Ics/CQhY5sJZLQ0XYtvBkKOUuWcuqxOX6IoePG+cvmTmH4wOqn9X+mjlxd+tvQ9hj0qReoVJ3ocK/LQcgZd4bIKR6mrlvSls343snIOVwPHe2r9Aczi0QqR7MsypVHPAIinK/F0km/GHs2+6377kBCDL+yRohiNP6nLOZ4lz6Ex0MVEQc9WCrJlaREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsFRjyga4bZxxiRNDufIXIDel+xkjwNCsCMXDe2KyeM=;
 b=wqsAH4mPJeYOm/47YSiITeOSU07SDLdGP7Qkq49K2BL6kQ+klaV7UPbxu7HDpkCLdRLNbX/nAhSGwXwYAxVDLIT03HNLIOXs4AfyNDSF8Qtk4SdOaKzv3YU0KhQhdF7/fmkWRKoqHKRySeWXf0/bvWUIrVKe1n4rXLbpNSxUCLtQrxJW0YigghE891SX5IQZApa7skMNhF5sDJFtNzf5shBgFyo7xO6oZQiD5Vgo/zHN3EEFYWix9Yk8tfHpSyddx4nR4CFjO6QheniX3lGWLMbVDmmn9KG7O/Eq/cHN3M/q27i4jFYUGTMjieuzzMW8pMDs/7Q27rDNeEjUeFtO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsFRjyga4bZxxiRNDufIXIDel+xkjwNCsCMXDe2KyeM=;
 b=Por0SfQsOcUBY2+Vp2bjiv1CUQip4n4qHJZi1MD1rtKSe2Im6/cJ/h5xBy1eToWD3eLLr39Ex9npysZkwv6GSwRrgctU6OXSfHkx9KglrWlUO3nqxtkxnb3Luq507nO6aMH6gWPmrYerw3FKP7AntuX7sGog37NNHKOdNiepP1/89cOpQPo7+2XH5jaF4hrgI8Pb4q8KpXfI+Y1Z2KhrhxvvaBYv9lORa6o+cFl2ZiKbGe3D8gDtUJXOOoFxhn4dg/MBD2tsT6jA9oaVXSfKWbesl8nHLdH1a21cwPq/TRnCuFGxBQRpdD7G2zmgySAroTkzWNc9hxwsNCOsu0VaLg==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CH2PR03MB5365.namprd03.prod.outlook.com (2603:10b6:610:a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 06:14:31 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 06:14:31 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Topic: [PATCH v4 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Index: AQHdD4GYMYJNrM00kEquf4KtKxYD+rZk5viAgAk8aQA=
Date: Wed, 15 Jul 2026 06:14:31 +0000
Message-ID: <252b3609-8afb-482a-b7c9-9cf8be7488ed@altera.com>
References: <20260709090153.21675-1-tze.yee.ng@altera.com>
 <20260709090153.21675-2-tze.yee.ng@altera.com>
 <20260709091157.9D4E11F000E9@smtp.kernel.org>
In-Reply-To: <20260709091157.9D4E11F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|CH2PR03MB5365:EE_
x-ms-office365-filtering-correlation-id: 80828a7e-a0db-42c5-3f6e-08dee23855b0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|18002099003|55112099003|22082099003|6133799003|3023799007|4143699003|5023799004|11063799006|56012099006;
x-microsoft-antispam-message-info:
 ucUhAEhWJWztDhbFKrFowDhmn4443FuNRCnf/OMPHGx6fQDFo6CfyuSpf+HDtcNdP+5hv9pW8IKAuoX37mNEeTI0qvUn0lIIJJB9H54RgJq7LvhP18XCSanePx6QHbso2RlvttVhfuVowfvAFFAdgKMfxWBOgZXNAGEIp4NakpuywnKRNkieSwGy59B0cvwQyotiRMAMaDMo1Nf+sRB8oXh2qZxz9KX43uOLQvWZPunxR3WzVXXHtVOjAzlBRAFGDOZ4AcsLckpkGp00+WBoJbpnNtCoAnByNEVyGQDHdpUq0VUR//Rwiq9tTaD7O6wUXqVEfaTWrhBJwyfsSwEb3xBoO0DD9HJtYvpBjSWemAdjDzpkG1Dl87AeKsguP3TYWBvW+5KRz1jz0u02tqyNxJKCjbNndsXdemEMo9G1DgdubkKTn+xNG8INavloMJZwv1+exF+ZpcdS/S0vtWx6Iqfc7xyAzjv78e0L7tRYyM/j/BAAgaYsr1OTkB0ELjwzIAJ7cCHyPvQvelIqsdqCP/mF9O6da4xdohEFrEj6XKm+oFV0VxsWl2MgSCsQ6h0ppJUhxdqEvhUXd4bKNQ8kik/ikkKxIoiwROilKFYZcawcLfaMMu9xvT/MZ5fualnrXiJAiDsNs/1nHvFQ5uCOQFNwio7+9MyNvCcmY8u8MmVG4zG+7raa+g2OYRWgC/KwNM2m1c1jqhB42/KRuLnfMnZjceRGVDXhtQRL/42bJjY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(18002099003)(55112099003)(22082099003)(6133799003)(3023799007)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlJPeVM5VnRzdThZTmpwNFNpOVFxTzNTNnh1TG1Oend2YXRHSE5DR0hIYWNJ?=
 =?utf-8?B?MTFraUJEQThjb3NxNDErRkNqRlEyeklIV3JrMXVwZDdPQWRJdXk4ZlA3UFFk?=
 =?utf-8?B?WDROaDF3U3JNc3dOT0E0aloySVJyLzNPVDJuOEVvMXMvOXV4eDB4VGkrUzdU?=
 =?utf-8?B?dElXMmpzM2RRNkxRYjVqTGNERlpzNmN4SHdBUUtiYndmcWlNUzdmOVZ4Qkxw?=
 =?utf-8?B?aEs1R1c2WHgrekpQREV1eEJBR1dlKzhiNFJtMVRFYXBTTllueUhuSGI5Lzd6?=
 =?utf-8?B?VXBjR3g3TktPWnNaWDJseVRrTDdmempsTnVydUVMc2pqZ0NRNDl2eVdZODVU?=
 =?utf-8?B?WVIxT2t6V09tK2tuWnh6dkJscDFnUmdwZHRFNDBaZlZKWXN6bkJSUG9MR2l5?=
 =?utf-8?B?dzI2WGhGZ29qRHNVUDNVY09sRFg5VHpxTFA1N0xZVkhoMDZvOG9jUlBySytx?=
 =?utf-8?B?bkMzQUlDUVdqYTRsZTJoeVU0WHFTNTBuZVloVTNYNjE1OTVOU2F0Qit5N3JS?=
 =?utf-8?B?c3BNLzdjNHJyV0loUnA4Nzltb2gxc1U0d1ZwT254d2VMc2xGcnlONSt1WlBI?=
 =?utf-8?B?ZmNsTXp1V1JrNlJhUUs4VWI2bXpRQldEa1RRUDcrQnJlbU14d0xMZjhneEll?=
 =?utf-8?B?Rk5NQ3o3WUFraVRZMW1wdnpzdzRaOVg3dFA2U2lTZUpJOEF3bmFtWDBVZ0po?=
 =?utf-8?B?VmpYTURaTlJQOFFxT28reEJJM3UzOVQxOWpIVXhpVUNaQlQzWE1nYWN3Z29h?=
 =?utf-8?B?cGZEZEJOelVRSjhLaDNrbzdXZjVITVpTN2lGMEthckdidDZqMEtkZFVTWmFn?=
 =?utf-8?B?WnlENG5BRkJhTFhQbllqSjczZU1BcmJDOHo0d1EvRHk4bjhwK01CL3YrVFBG?=
 =?utf-8?B?WWFVcXRhYWtyc0swR2hRTVBzaUtiNHgza0JLUktpYTJhT3piekNGRkxuemls?=
 =?utf-8?B?NCtocCt6OHBTREZrdThIRi9FREc2ODRLYTJnWnpjOVpSNUtZSDVLZ0lNaUk5?=
 =?utf-8?B?TmRUZnQ3S2NWSHhkZGMwLzM5R2N5TTNlTUVqcmZBelpycU9mcURob0R5K0Vs?=
 =?utf-8?B?TE1RL2VZc0czc1BXSzRMOE9hY1RkTzIvOUFNWko3VERKdklnTDBEVkJDZGE0?=
 =?utf-8?B?ZFZLYVlsTWllNGYwTnVlNUR1cUVSa2FlMWhaWGcvRzRzbFdJb1FNOEdMQkFY?=
 =?utf-8?B?emZ2TXBkdTZBSHlQWW15MmdBNkJOeEhuWmxQWlhzd3ZsL09uZm5SL3E1Y1R1?=
 =?utf-8?B?VzRaWDJEUVpCWFVwcys5dVdsbDBWZVVrcjNGamNTM2lkcjJLZGRVWVltaitL?=
 =?utf-8?B?emxsRHFjTUlYUElaTUs2ejI4bGdnejlzK0xPdVpOZ1EvZFlvU1pGaUJick1z?=
 =?utf-8?B?OGVpM1lzS3MwQTFEak5wRU04MzZEM09nZ3c1dHp4dlJqdFJzV0lpNHdxa3FT?=
 =?utf-8?B?UmFMbDZ5cURzZ0l4dDFqQTRDZW9oT0pxcnBaTFpPY1YwRnUzaHkrK3RLRC9u?=
 =?utf-8?B?bkwvVlU1YWg1a0NMT3F2MGpyZGRrcnBTMzBRcHJnU2NXWXJ4a1RUakZMTkRW?=
 =?utf-8?B?MmVra1Y1UEZneDRPUHE2MkpPOUN6K2laRkRYZjFqV2I2cno5cHQyUHVvY0Q4?=
 =?utf-8?B?YUdyYzRMYm5KNytrNWprc1UyZXFvMnRJcmIxTHRFWGhyVlZhcFFhemtNOWJS?=
 =?utf-8?B?NCtlUzBWelBZK1lXVXBiaHAyelVYVTBIWEZkV2dIS2wySjl6d2tmM2V6OTIx?=
 =?utf-8?B?RXorNEppZjNEeFNFOW03amhIM01DUkMzUXI3ZlFWMDNLWUV3blpwN21sd0JB?=
 =?utf-8?B?TEhaMHYwK3JSSnZFd0RPLzJ3RG83Vytpc1BUdjZQenZqNVFScGR3Um00emFT?=
 =?utf-8?B?aWVrUW52aFBzK1RXekRCaHlXbkR4QWFqeW1BWkRTQjRlRWliTXlmK2Z6WEwv?=
 =?utf-8?B?dmJpMkhkOWVraUJBQm1GdWh5N0U5bkNOb3ZxRTBpYW1XeUlGL3Bmb0NwVHlr?=
 =?utf-8?B?OXdNMnhneUs1WkVsMnFFM1h5dmwralhtY0ZzWlIzV2JLbTdSN3dYcGVDQnFJ?=
 =?utf-8?B?ZThxTEM3bU9HRGNtVy9aY2pRMGZmVitXejVvdVZFbXlNb1ZNNmJyTTFhOStD?=
 =?utf-8?B?OFdKTzZWR0p0czBEaWJ5M29pWjF6MzFWUXJReHVXTFE5K0FVSldSSHZUU2NM?=
 =?utf-8?B?QTducjFZQTMvL1BFeU4ydUVTMEpIMk1scm9mb3plM01YT2c4V3VHdzNzc3BG?=
 =?utf-8?B?WHB2Y0ZqT09zdVpkZ0c1QzJxS0RaVmd5ekFoV0FtMHp5OWFjM0c4aFNxZ01Y?=
 =?utf-8?B?SmVKZ09INlZJVVFtQ2dyVEE3SWxyemZNc3Rha3QvS1NxTmJRclc3NG1Ec3Bn?=
 =?utf-8?Q?nA5AV2kj0Enkjn6E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1DDDB96074F7F4283184CEA5891C771@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80828a7e-a0db-42c5-3f6e-08dee23855b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 06:14:31.6402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zysAIFTrr4JQfwD08cjzAJUO/yBD2hUSzJF+4tZj/JtxZR7JXULrD5SjFYc64tDzsBzw9/2FeRlC26zV8HCsow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5365

T24gOS83LzIwMjYgNToxMSBwbSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBw
b3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IA0KPiBQcmUtZXhpc3RpbmcgaXNzdWVz
Og0KPiAtIFtIaWdoXSBUaGUgZHJpdmVyIHJlbW92YWwgc2VxdWVuY2UgaW5jb3JyZWN0bHkgZGVz
dHJveXMgdGhlIGFzeW5jIHRyYW5zYWN0aW9uIGJhY2tlbmQgYmVmb3JlIHVucmVnaXN0ZXJpbmcg
dGhlIGNoaWxkIGNsaWVudCBkZXZpY2VzLCBsZWFkaW5nIHRvIHBvdGVudGlhbCBVc2UtQWZ0ZXIt
RnJlZSBhbmQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlcy4NCg0KVGhlIGZpeCBpcyBpbXBsZW1l
bnRlZCBpbiBzZXBhcmF0ZSBwYXRjaDogDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9kaW5ndXllbi9saW51eC5naXQvY29tbWl0Lz9oPXNvY2ZwZ2Ffc3Zj
X2ZpeGVzX2Zvcl92Ny4yJmlkPWJiYTg1Mzc1Zjg3NTFkNmM5NDkwMzYyNjliNTI5Y2RjYjJhMmVk
OGYNCg0KSW4gdjUsIHdlIHdpbGwgcmViYXNlIG9uIGRpbmd1eWVuL3NvY2ZwZ2Ffc3ZjX2ZpeGVz
X2Zvcl92Ny4yIHRvIHBpY2sgdXAgDQp0aGlzIGZpeC4NCg0KPiAtIFtIaWdoXSBpZGFfYWxsb2Nf
bWF4KCkgaXMgY2FsbGVkIHdpdGggYW4gaW5jbHVzaXZlIG1heGltdW0gb2YgMTYsIHdoaWNoIG92
ZXJmbG93cyB0aGUgNC1iaXQgYml0ZmllbGRzIGZvciBjbGllbnQgYW5kIGpvYiBJRHMuDQoNCkFn
cmVlZC4gaWRhX2FsbG9jX21heCgpIHdpdGggbWF4IDE2IGlzIGluY2x1c2l2ZSwgYnV0IHRoZSBq
b2IgYW5kIGNsaWVudA0KSURzIGFyZSBwYWNrZWQgaW50byA0LWJpdCBmaWVsZHMgKFNUUkFUSVgx
MF9KT0JfRklFTEQgLw0KU1RSQVRJWDEwX0NMSUVOVF9GSUVMRCksIHNvIGFsbG9jYXRpbmcgSUQg
MTYgdHJ1bmNhdGVzIHRvIDAgYW5kIGNhbg0KY29ycnVwdCBpZGFfZnJlZSgpLg0KDQpXZSBwbGFu
IHRvIGZpeCB0aGlzIGluIHRoZSBzYW1lIHNlcGFyYXRlIHN0cmF0aXgxMC1zdmMgc2VyaWVzIGJ5
IA0KbGltaXRpbmcgaWRhX2FsbG9jX21heCgpIHRvIDE1IGZvciBib3RoIGpvYiBhbmQgY2xpZW50
IElEIHBvb2xzLg0KDQo+IC0tDQo+IA0KPiAtLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjQgMS8yXSBm
aXJtd2FyZTogc3RyYXRpeDEwLXN2YzogYWRkIGFzeW5jIEhXTU9OIHJlYWQgY29tbWFuZHMgYW5k
IHJlZ2lzdGVyIHNvY2ZwZ2EtaHdtb24gZGV2aWNlIC0tLQ0KPiBjb21taXQgNTI1ZDEwNDg3YTYw
ZjFkODRjMTcxMjczNzg5OTBhNGE2MTFjODg4MQ0KPiBBdXRob3I6IFR6ZSBZZWUgTmcgPHR6ZS55
ZWUubmdAYWx0ZXJhLmNvbT4NCj4gDQo+IGZpcm13YXJlOiBzdHJhdGl4MTAtc3ZjOiBhZGQgYXN5
bmMgSFdNT04gcmVhZCBjb21tYW5kcyBhbmQgcmVnaXN0ZXIgc29jZnBnYS1od21vbiBkZXZpY2UN
Cj4gICAgICANCj4gVGhpcyBjb21taXQgYWRkcyBhc3luY2hyb25vdXMgU3RyYXRpeCAxMCBzZXJ2
aWNlIGxheWVyIHN1cHBvcnQgZm9yIGhhcmR3YXJlDQo+IG1vbml0b3IgdGVtcGVyYXR1cmUgYW5k
IHZvbHRhZ2UgcmVhZCBjb21tYW5kcy4gSXQgYWxzbyByZWdpc3RlcnMgYQ0KPiBzb2NmcGdhLWh3
bW9uIHBsYXRmb3JtIGRldmljZSBmcm9tIHRoZSBzZXJ2aWNlIGxheWVyIGRyaXZlciB3aGVuIGhh
cmR3YXJlDQo+IG1vbml0b3Igc3VwcG9ydCBpcyBlbmFibGVkLg0KPiANCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Zpcm13YXJlL3N0cmF0aXgxMC1zdmMuYyBiL2RyaXZlcnMvZmlybXdhcmUvc3Ry
YXRpeDEwLXN2Yy5jDQo+PiBpbmRleCBjMjRjYTU4MjMwNzhmLi43MTZiNThmNWE2MTcwIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9zdHJhdGl4MTAtc3ZjLmMNCj4+ICsrKyBiL2Ry
aXZlcnMvZmlybXdhcmUvc3RyYXRpeDEwLXN2Yy5jDQo+IFsgLi4uIF0NCj4+IEBAIC0xMzI5LDYg
KzEzMzIsMTQgQEAgaW50IHN0cmF0aXgxMF9zdmNfYXN5bmNfc2VuZChzdHJ1Y3Qgc3RyYXRpeDEw
X3N2Y19jaGFuICpjaGFuLCB2b2lkICptc2csDQo+PiAgIAkJYXJncy5hMCA9IElOVEVMX1NJUF9T
TUNfQVNZTkNfUlNVX05PVElGWTsNCj4+ICAgCQlhcmdzLmEyID0gcF9tc2ctPmFyZ1swXTsNCj4+
ICAgCQlicmVhazsNCj4+ICsJY2FzZSBDT01NQU5EX0hXTU9OX1JFQURURU1QOg0KPj4gKwkJYXJn
cy5hMCA9IElOVEVMX1NJUF9TTUNfQVNZTkNfSFdNT05fUkVBRFRFTVA7DQo+PiArCQlhcmdzLmEy
ID0gcF9tc2ctPmFyZ1swXTsNCj4+ICsJCWJyZWFrOw0KPj4gKwljYXNlIENPTU1BTkRfSFdNT05f
UkVBRFZPTFQ6DQo+PiArCQlhcmdzLmEwID0gSU5URUxfU0lQX1NNQ19BU1lOQ19IV01PTl9SRUFE
Vk9MVDsNCj4+ICsJCWFyZ3MuYTIgPSBwX21zZy0+YXJnWzBdOw0KPj4gKwkJYnJlYWs7DQo+PiAg
IAlkZWZhdWx0Og0KPj4gICAJCWRldl9lcnIoY3RybC0+ZGV2LCAiSW52YWxpZCBjb21tYW5kICwl
ZFxuIiwgcF9tc2ctPmNvbW1hbmQpOw0KPj4gICAJCXJldCA9IC1FSU5WQUw7DQo+IA0KPiBbU2V2
ZXJpdHk6IEhpZ2hdDQo+IFRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUgYW5kIHdhcyBub3Qg
aW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcw0KPiB0aGUgam9iIElEIGFsbG9jYXRp
b24gZWFybGllciBpbiBzdHJhdGl4MTBfc3ZjX2FzeW5jX3NlbmQoKSB3cmFwIGFyb3VuZCB3aGVu
DQo+IGFzc2lnbmluZyB0aGUgbWF4aW11bSBJRD8NCj4gDQo+IEluIHN0cmF0aXgxMF9zdmNfYXN5
bmNfc2VuZCgpOg0KPiAJcmV0ID0gaWRhX2FsbG9jX21heCgmYWNoYW4tPmpvYl9pZF9wb29sLCBN
QVhfU0RNX0pPQl9JRFMsDQo+IAkJCSAgICBHRlBfS0VSTkVMKTsNCj4gDQo+IGlkYV9hbGxvY19t
YXgoKSBjYW4gYWxsb2NhdGUgYW4gSUQgdXAgdG8gTUFYX1NETV9KT0JfSURTICgxNikgaW5jbHVz
aXZlLg0KPiBCZWNhdXNlIGJvdGggdGhlIGpvYiBJRCBhbmQgY2xpZW50IElEIGFyZSBzdG9yZWQg
aW4gNC1iaXQgYml0ZmllbGRzLA0KPiBhbGxvY2F0aW5nIElEIDE2ICgweDEwKSB3aWxsIGJlIHRy
dW5jYXRlZCB0byAwIHdoZW4gcGFja2VkLg0KPiANCj4gV2hlbiB0aGUgdHJhbnNhY3Rpb24gY29t
cGxldGVzLCBpZGFfZnJlZSgpIHdvdWxkIHJlY2VpdmUgSUQgMCBpbnN0ZWFkIG9mIDE2LA0KPiB3
aGljaCBjb3VsZCB1bmV4cGVjdGVkbHkgZnJlZSBhbiBhY3RpdmUgam9iJ3MgSUQgd2hpbGUgSUQg
MTYgaXMgbGVha2VkLg0KPiBBIHNpbWlsYXIgaXNzdWUgYXBwZWFycyBpbiBzdHJhdGl4MTBfc3Zj
X2FkZF9hc3luY19jbGllbnQoKSB3aXRoDQo+IE1BWF9TRE1fQ0xJRU5UX0lEUy4NCj4gDQo+IFsg
Li4uIF0NCj4+IEBAIC0yMDUwLDYgKzIwODcsOSBAQCBzdGF0aWMgdm9pZCBzdHJhdGl4MTBfc3Zj
X2Rydl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgDQo+PiAgIAlv
Zl9wbGF0Zm9ybV9kZXBvcHVsYXRlKGN0cmwtPmRldik7DQo+PiAgIA0KPj4gKwlpZiAoc3ZjLT5z
dHJhdGl4MTBfc3ZjX2h3bW9uKQ0KPj4gKwkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoc3Zj
LT5zdHJhdGl4MTBfc3ZjX2h3bW9uKTsNCj4+ICsNCj4+ICAgCXBsYXRmb3JtX2RldmljZV91bnJl
Z2lzdGVyKHN2Yy0+c3RyYXRpeDEwX3N2Y19yc3UpOw0KPj4gICANCj4+ICAgCWZvciAoaSA9IDA7
IGkgPCBTVkNfTlVNX0NIQU5ORUw7IGkrKykgew0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBU
aGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlIGFuZCB3YXMgbm90IGludHJvZHVjZWQgYnkgdGhp
cyBwYXRjaCwgYnV0IGRvZXMNCj4gdGhpcyBkcml2ZXIgcmVtb3ZhbCBzZXF1ZW5jZSBkZXN0cm95
IHRoZSBhc3luYyB0cmFuc2FjdGlvbiBiYWNrZW5kIGJlZm9yZQ0KPiB1bnJlZ2lzdGVyaW5nIHRo
ZSBjaGlsZCBkZXZpY2VzPw0KPiANCj4gTG9va2luZyBhdCBzdHJhdGl4MTBfc3ZjX2Rydl9yZW1v
dmUoKToNCj4gDQo+IAlzdHJhdGl4MTBfc3ZjX2FzeW5jX2V4aXQoY3RybCk7DQo+IAlvZl9wbGF0
Zm9ybV9kZXBvcHVsYXRlKGN0cmwtPmRldik7DQo+IAlpZiAoc3ZjLT5zdHJhdGl4MTBfc3ZjX2h3
bW9uKQ0KPiAJCXBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKHN2Yy0+c3RyYXRpeDEwX3N2Y19o
d21vbik7DQo+IAlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcihzdmMtPnN0cmF0aXgxMF9zdmNf
cnN1KTsNCj4gDQo+IEJlY2F1c2Ugc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkgaXMgY2FsbGVk
IGZpcnN0LCBpdCBmcmVlcyBhbGwgYWN0aXZlDQo+IHRyYW5zYWN0aW9uIGhhbmRsZXJzIGFuZCBz
ZXRzIGFjdHJsLT5pbnZva2VfZm4gdG8gTlVMTC4gSG93ZXZlciwgdGhlIGNoaWxkDQo+IGRldmlj
ZXMgKHNvY2ZwZ2EtaHdtb24sIHN0cmF0aXgxMC1yc3UpIGFyZSBzdGlsbCByZWdpc3RlcmVkIGFu
ZCBjb3VsZCBpbml0aWF0ZQ0KPiBvciBwb2xsIHJlcXVlc3RzIGR1cmluZyB0aGlzIHdpbmRvdy4N
Cj4gDQo+IENvdWxkIGNvbmN1cnJlbnQgYWNjZXNzZXMgdG8gdGhlIGNoaWxkIGRldmljZXMgdHJp
Z2dlciBhIHVzZS1hZnRlci1mcmVlIG9uDQo+IGhhbmRsZXItPm5leHQgb3IgYSBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2Ugb24gYWN0cmwtPmludm9rZV9mbj8NCj4gDQoNCg==
