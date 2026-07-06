Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F93AE6F7
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327020; cv=fail; b=K2tKzfg70jvC2FmT/S3XXPWv6mPArDOFSvaL1vIXHvrQsh/fy2SoLIZ7rgpqyQlPbQMNuP8GwbiVGSfzKD2+W4R908M4cZinoFZq0xw9bFE7+RhntHhx9AeeCpZiKmKbFHJZDyMDYKPBkXjZjpGQs+f4zD1PnIsPgOmRvkLx1+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327020; c=relaxed/simple;
	bh=vFP31tsqTD5wb+AsIdT9GFBwPfbaAE0tegk0C28q/bw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lvg+vG/82SClnRIr9fljpWzKW5K6FLqDIdK1IOF9cXeDVAmzWd4+FnQcuNFtFrOKFYp61euhXlr9g2Z8wJ71s8s/ZaJeWZogtXErZDkvDWMf1pCRVHHddxcsqzwiC94jSy2n17FCi+N2shfa55M59tJhbz/aJv6EDHXgqj3lSyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=oPZv85TN; arc=fail smtp.client-ip=52.101.62.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="oPZv85TN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjB72l0CDItQRlzk0lSsuiDG3AWq/uk7iAX7JmJsesXbQNclsfEaZmCngxtUbRROLfqIRYILozT/7nOcsDpYSsf99b0HAYUJ0mghUKaCQoyYW4PaIX5PeKZjwLndXSljBzq1vPrMGHoWW7O7nRkfbvJtALjRd1QHF1NVJZ9jdCNKtNK1WqyXvU8wC0PIdlrC9leTw4+W9jt3nuKGYB2hvv/CEhY4m+U/jSaFOBZ39djeQp6OFi6GUbVXmA3Xq1h6m6mAJR4PmhQKYuHgIHjUCG47z9BAoXwX5/gp+H34nTWiZ43Oh5cNBuZH8SVBvhsVEVxlAetxP2CP7ViR2Blr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFP31tsqTD5wb+AsIdT9GFBwPfbaAE0tegk0C28q/bw=;
 b=oFTbyBPFr870lhjCGsYpTsv8jS68Obo0hr5jxPIz1V2YTExGcUsvJhIs5PXQj9L3+LMyBXX/lZUgdlNjJDQL2bMGQZjsS9om5XMvlspopRG6NXfzNgvN/RwThdPj2QB4p5N69nPHn5Rdc5dhksiFPUCRGS4z5knsVczoyy7psj19g5rkfitZqG+OVDqy5KSgGu9xE9iXyIRerHhVAfqO2vdgzix8alVYPntgiLBwuZoDDWLp+38O6zPWEDY8FguP5giQHOr9Ra758C5LLJqFBYNRXLNZjIPe+JflU8MsfJQoVKA8KDW3R6fThJvH8xjc8n5uxbfP0DvvQJsuzXGpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFP31tsqTD5wb+AsIdT9GFBwPfbaAE0tegk0C28q/bw=;
 b=oPZv85TNCaCS9qgMMmcp0/bpR8wGdyYmHP/fw5td3JAeCcYkCpa/iYrJSb50+7QzCFniE2IZtf2htHZhqAwLKlRoZP5D6kTtfYdSxcuoJ3QcTDDYUtb0fSQc/oSUA1wFHV2Y2olC5dQea14hVHuSMnf2r4XTsFRrpYHtPHy3R56Az+WQ6CvItOz4iQSIMR9xbdJl4LYPAxMGOfdXRkyz3ccR4BeObq7yqz58UUXbN3aKFh6jTfgiZ53Z147/wK5rrqh14KucL6ir7mJhaRFtin2gHeg4bFxZVwPGslumjVL734tfnktyBueXKZCmIwzOVGPU0BhjfopYa8VnnDJnyA==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DSWPR03MB989142.namprd03.prod.outlook.com (2603:10b6:8:361::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 6 Jul
 2026 08:36:47 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 08:36:47 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Topic: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Index: AQHdCsMyOWRAcnirSkSm/kzKwBPvFLZbc8qAgAS72YA=
Date: Mon, 6 Jul 2026 08:36:47 +0000
Message-ID: <24a16e2d-205c-4340-87c4-2fe5b57c4791@altera.com>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
 <af1e81827ba72ea901686619bd66dd810f3c8b02.1783062999.git.tze.yee.ng@altera.com>
 <20260703081925.C9CAB1F000E9@smtp.kernel.org>
In-Reply-To: <20260703081925.C9CAB1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DSWPR03MB989142:EE_
x-ms-office365-filtering-correlation-id: 0fb7a7fb-3326-4fce-4edf-08dedb39b7bd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|55112099003|3023799007|4143699003|6133799003|38070700021|11063799006|5023799004|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 TANagsUOYfO0QS7ZvPONrJ0iso0ZfK3HVYFElTaad/PKIsfijOBZECLPJnYyAYD4Aucv84sfrwHXRH5Sp2pgdnwcWxp424b2cVonb4ob3nPRKvBwQBLMQnr/0OjruNdwo9mtwn3viDAU1ZQi7hzAdJulgn7sATGoH0zpPPIfNcvfpu916mv64KMQK5pUAZnaKg4UVJSMukXfea5/MyhBrlx2bmYLczvyoEKSS/0iMfH7nl+30QaVHrRHRFSaozL8EJI+4z4KyxM8epzR1sLAzNZZeqoydKy1a2n6KnANAnzZWhxMeFjRVfwhvzpaR8e54H/9VDm/RnZyoBCOpXoN96iefJQofcS7tts2mfHdqKqKYwuTgRYHGqwaVayk66OSOWxg//JnCe9QNm17faecWYCjVUuCnNlvxK6/bx+U0HRs25C43tOJfkjU4AhhXwBKmjoAFZD9c+DOTTnWXP/vAi7FRsoN2D46Md67HA3TNSs2UNHvSaylkZljjljwJHePacJNvmgYjVEVMZMxbp5BZW+eJBG5mbJRkGsq8rkrwuksJBSLHjI6b4bgIXPsbw9PEuCxAcR4UDrvt1D8B13Sems9PLL/Peo0u62QwFnScc/sfMZaDrBlSu4/Kvdy3tgwZ0+zUWWkTsDFRyQUJsv8VT1dLydNJEE5w9FI0MYCCyejI8cRLsAWBkSWSEhdWF1JCRAaCyWRSUo3GlAzLOyUMI/nysEYYFR75B0L8Sdv2l0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(55112099003)(3023799007)(4143699003)(6133799003)(38070700021)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmlNREFudEQrOWhOUGhkQi9mUlRvWlVmbEsyYXZKOURkU29EdHNGOWV1Wmxm?=
 =?utf-8?B?L0w0dzRENTU2WlFNcitqQ0REMTFhTFpKL3dKRHF1TTUvWVBsNUdlZDRZS0pu?=
 =?utf-8?B?ckNNWXBjKzNPZEpRNFllc2YyTVBhUkdLckMxTjJEcHJ1ZGJQeHFRVXNxRWdz?=
 =?utf-8?B?ZDluZkY2ZURxSFVCR3ZCSVRlSFA0V2VmT2Z5OEJEekErMWNjZlc1RGlLdUxC?=
 =?utf-8?B?dnpscVN6SlRJeVpBMDFDOXVkRDVPSGhwbEhSWEJZL21EWHdmUFAzRUNiSFNo?=
 =?utf-8?B?UDVKQ0JWK1o5aEZycGg4SDJzRVB4THdXcFRzalZWRy9IY05aUVZxYkgrVStw?=
 =?utf-8?B?ZHdHdTdVRGp1SDlySDFpRG04RlJjZ0xHZ0ZYZCtsWWlNRGwzNm9mVzRCSis1?=
 =?utf-8?B?R1hNYmJxcmxzVzllQUlaWFVMSTVPVnE0ZlBJekdjc3JLY1FpeUdkbVkwalNR?=
 =?utf-8?B?QXFZVjZ6VWt1ZlBiYnNtb25uT215MzYwem5aY3lDekJGYmZIYUtGSEZXbGJX?=
 =?utf-8?B?dVpXYlF6MDU3YkZGZUdwVisyU3VReDVXY2dVbnJ3L2Y2QjA5RnJ4VTV0aUEy?=
 =?utf-8?B?Wk9zR3ZuaVJDMThkYlJKWHM4ZkFvSVNTNjZvZDlQNFNrS1N4K3VUTGx0NEJD?=
 =?utf-8?B?cmNoL3ovSUIva0loYjA5a0lqeDhzcGtCY2ZMazJBMlhVdVFNUExEOFdtSmI0?=
 =?utf-8?B?ZW1qemNWVlhrOWNyZVRlNXNPL09WRjVWWDJCMjVHcDkrTjRnckFBdGpjYk93?=
 =?utf-8?B?VTNRd21ORlZVVytmRmFad3ZRNU5vZy81QzA3ZlByQjVVSlNCZ0owYmhGSnpm?=
 =?utf-8?B?Vnk1Z2RnSVFET2ZtWk5ramRjY2VFT0QvRTcyQzUrUHF5OXJwanQ4RDFFWDVW?=
 =?utf-8?B?aEs4T2lBRHZ3ZzZ0c2JPZEx0ZElIcTl0SjF5TjZXYnplY2FZTU9TcEZQRmtO?=
 =?utf-8?B?ZlRpMXg5SXFwNDdoR0hFVWRNYVhidGZhUi81emV6KzZZTXp2V2FPNkVUOWpx?=
 =?utf-8?B?NVNnYWFpc3oxOCs5ZWhYVXlJWEJEYjc2QWxNTFhsYVRESmNvMWNPcnlVeFlI?=
 =?utf-8?B?QzhRYTZxTXBpVVBETWovNVMyVStQZzQ4K29SOW9lZ1l4RTR5TnI3MW8wUEZP?=
 =?utf-8?B?Qi9RZnRMbUd5RjlXdmxpUHJsR21vL2FGZGV1UlpQbSt2VlVhSEQ4Tjd5Y1dm?=
 =?utf-8?B?dVk1Zm5sQmREa2laczExNG54NFJKUHMxUUgzdzQ0cERxQUY1ekd0V3ZzQmEv?=
 =?utf-8?B?YklqL3dtQW03SWlBc1FENjhiRmhRLzV3S1VtU0NjU2t0c1RsaXl3NTZydXlB?=
 =?utf-8?B?cmdoMnJqK2VYeWFXU2FneEd2cXBESXh6dTVncnAxbGhyOW0rYXFUaEJpY0JS?=
 =?utf-8?B?ei9IUjV0N3dmVk5JL1h0dlcvdXNSYklUK0JFSGc0WXNSNEdadHBuT1VvVXN6?=
 =?utf-8?B?aHh0eUhpREVpNGhZZUtFaW8vNitYeTQweDJkRFpoVE1TR0krQ3ZqRkNWb29M?=
 =?utf-8?B?cVg0QlN0dHh3RnY4dy9PeUNHN1hTZ1V2d0ZlMnlMaGRkSnpDQmY2UGFnMmNU?=
 =?utf-8?B?bVovY1QvUG9TdWxIQ3NJNjBLWHljWXdRVkNIQ2U5aTBycFFtRnRzSEpTNUNh?=
 =?utf-8?B?RXRWYUxVMGF4Mm9QM2lQajFaU2txclUzeFNLdXUrOTRSZVJxSjg1ZlJPbS94?=
 =?utf-8?B?RlpDTWxLcWZtQ1ZCbUdiMys4ZDQyTVhhVHJJd3BiMU9xRzR5SUYrT3c4N0VP?=
 =?utf-8?B?UXczSE4ySHhIclczTzBlUzdaanV6d2RPUnFVZVc1RnZMZHE4Qkx4bDFsTjJ6?=
 =?utf-8?B?bkNGV0N4dC9DQ1M2cW84K3NLR1ZJc1VmQXVvNTdHNEcyUWV5MW1YaUwxRWFn?=
 =?utf-8?B?akR3SEs0bS9FbUo4NCtpVm5ySE12bmxTcVNmbEZ4OTVsTmFFOFV5UDRhTmpa?=
 =?utf-8?B?RmJBYzYzVzRtOW15SmpDUW9GR1p1LzdQQ1o3NE5XOUlqK0J1RWVlTk1hdUNY?=
 =?utf-8?B?SGFNU1VDdlgwZGpnYVpCTHNvMHYvMVJLWlhEYWtPRmlFZFJ6R21ud1hKQ1ZF?=
 =?utf-8?B?RFl4cHJWM1laZ3V6K3ZKM2FFNVdoVVZVWVN3a0h3NHhCUDlCNSsrdEM4aHlu?=
 =?utf-8?B?aUhxTVV4NzNLVGxvNmRGVFhIOVQxSWNwOVhkTXkwd1pxcEYzM1hvZ014aXd4?=
 =?utf-8?B?VjZtWEtpMWJLaFBoMmFvTk5LVEZiMXZINndqYXdrbUoybW40VVU4OFZldlhI?=
 =?utf-8?B?aXJ6MkdEcXQrOTU2dDArWmpsNGlEeE1OSk9HNTZHMXF2YnN6OGhSbGdpUmpF?=
 =?utf-8?B?S0ZKUHV6ZmdlUGxuMFlDYjhVNE1nZnBkaG5ZOUtSUGpxaExGMmFlL2Zmdnhq?=
 =?utf-8?Q?zoIPLLQ0jLbSActI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <181711C2D8AAC74DBCD15BFADD35933D@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb7a7fb-3326-4fce-4edf-08dedb39b7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 08:36:47.5024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TT4VCR1fddm9q+khN5Ckievqyv1VT1NgSU2N0MUqpJkfTF0vswIlz+nSjLsPqlIqFXWZzwvHZ0MyiQewdYMD1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989142

T24gMy83LzIwMjYgNDoxOSBwbSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBw
b3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IA0KPiBQcmUtZXhpc3RpbmcgaXNzdWVz
Og0KPiAtIFtIaWdoXSBUaGUgYXN5bmMgc2VydmljZSBsYXllciBpcyB0b3JuIGRvd24gYmVmb3Jl
IHRoZSBjaGlsZCBwbGF0Zm9ybSBkZXZpY2VzIChIV01PTiBhbmQgUlNVKSBhcmUgdW5yZWdpc3Rl
cmVkLCBsZWFkaW5nIHRvIGEgVXNlLUFmdGVyLUZyZWUgYW5kIE5VTEwgcG9pbnRlciBkZXJlZmVy
ZW5jZSBpZiBhIGNvbmN1cnJlbnQgYXN5bmMgY2FsbCBpcyBtYWRlLg0KPiAtLQ0KPiANCj4gY29t
bWl0IDJjNjMxN2E3YWVmODk0MjhlNjE2ZWE4MzU0ZmFiMTU3YjI3ZmYzNWYNCj4gQXV0aG9yOiBU
emUgWWVlIE5nIDx0emUueWVlLm5nQGFsdGVyYS5jb20+DQo+IA0KPiBmaXJtd2FyZTogc3RyYXRp
eDEwLXN2YzogYWRkIGFzeW5jIEhXTU9OIHJlYWQgY29tbWFuZHMgYW5kIHJlZ2lzdGVyIHNvY2Zw
Z2EtaHdtb24gZGV2aWNlDQo+IA0KPiBBZGQgYXN5bmNocm9ub3VzIFN0cmF0aXggMTAgc2Vydmlj
ZSBsYXllciBzdXBwb3J0IGZvciBoYXJkd2FyZSBtb25pdG9yDQo+IHRlbXBlcmF0dXJlIGFuZCB2
b2x0YWdlIHJlYWQgY29tbWFuZHMuIFJlZ2lzdGVyIGEgc29jZnBnYS1od21vbiBwbGF0Zm9ybQ0K
PiBkZXZpY2Ugd2hlbiBoYXJkd2FyZSBtb25pdG9yIHN1cHBvcnQgaXMgZW5hYmxlZC4NCj4gDQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9zdHJhdGl4MTAtc3ZjLmMgYi9kcml2ZXJz
L2Zpcm13YXJlL3N0cmF0aXgxMC1zdmMuYw0KPj4gaW5kZXggYzI0Y2E1ODIzMDc4Zi4uNzE2YjU4
ZjVhNjE3MCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvc3RyYXRpeDEwLXN2Yy5j
DQo+PiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3N0cmF0aXgxMC1zdmMuYw0KPiANCj4gWyAuLi4g
XQ0KPiANCj4+IEBAIC0yMDUwLDYgKzIwODcsOSBAQCBzdGF0aWMgdm9pZCBzdHJhdGl4MTBfc3Zj
X2Rydl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgDQo+PiAgIAlv
Zl9wbGF0Zm9ybV9kZXBvcHVsYXRlKGN0cmwtPmRldik7DQo+PiAgIA0KPj4gKwlpZiAoc3ZjLT5z
dHJhdGl4MTBfc3ZjX2h3bW9uKQ0KPj4gKwkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoc3Zj
LT5zdHJhdGl4MTBfc3ZjX2h3bW9uKTsNCj4+ICsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4g
VGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdW5yZWdpc3RlcmluZyB0aGUg
Y2hpbGQgZGV2aWNlcyBoZXJlDQo+IGludHJvZHVjZSBhIHJhY2UgY29uZGl0aW9uIHdpdGggbW9k
dWxlIHJlbW92YWw/DQo+IA0KPiBJbiBzdHJhdGl4MTBfc3ZjX2Rydl9yZW1vdmUoKSwgd2UgdGVh
ciBkb3duIHRoZSBhc3luYyBzZXJ2aWNlIGxheWVyIGJlZm9yZQ0KPiB0aGUgY2hpbGQgZGV2aWNl
cyBhcmUgdW5yZWdpc3RlcmVkOg0KPiANCj4gCXN0cmF0aXgxMF9zdmNfYXN5bmNfZXhpdChjdHJs
KTsNCj4gCW9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoY3RybC0+ZGV2KTsNCj4gCWlmIChzdmMtPnN0
cmF0aXgxMF9zdmNfaHdtb24pDQo+IAkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoc3ZjLT5z
dHJhdGl4MTBfc3ZjX2h3bW9uKTsNCj4gDQo+IElmIGEgc3lzZnMgcmVhZCBmb3IgdGhlIGh3bW9u
IGRldmljZSAoZS5nLiwgdGVtcDFfaW5wdXQpIHJhY2VzIHdpdGggbW9kdWxlDQo+IHVubG9hZCwg
Y291bGQgaXQgcHJvY2VlZCB0byBzdHJhdGl4MTBfc3ZjX2FzeW5jX3NlbmQoKSBiZWNhdXNlIHRo
ZSBkZXZpY2UNCj4gaXMgbm90IHlldCB1bnJlZ2lzdGVyZWQ/DQo+IA0KPiBJZiBzbywgaXQgbG9v
a3MgbGlrZSBzdHJhdGl4MTBfc3ZjX2FzeW5jX3NlbmQoKSB3aWxsIGRlcmVmZXJlbmNlIHRoZSBh
Y2hhbg0KPiBzdHJ1Y3R1cmUgdGhhdCB3YXMgYWxyZWFkeSBmcmVlZDoNCj4gDQo+IAlyZXQgPSBp
ZGFfYWxsb2NfbWF4KCZhY2hhbi0+am9iX2lkX3Bvb2wsIE1BWF9TRE1fSk9CX0lEUywNCj4gCQkJ
ICAgIEdGUF9LRVJORUwpOw0KPiANCj4gQW5kIGxhdGVyIGF0dGVtcHQgYSBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UsIGFzIGFjdHJsLT5pbnZva2VfZm4gd2FzIHNldA0KPiB0byBOVUxMIGJ5IHN0
cmF0aXgxMF9zdmNfYXN5bmNfZXhpdCgpOg0KPiANCj4gCWFjdHJsLT5pbnZva2VfZm4oYWN0cmws
ICZhcmdzLCAmcmVzKTsNCj4gDQo+IFNob3VsZCB0aGUgY2hpbGQgcGxhdGZvcm0gZGV2aWNlcyBi
ZSB1bnJlZ2lzdGVyZWQgYmVmb3JlDQo+IHN0cmF0aXgxMF9zdmNfYXN5bmNfZXhpdCgpIGlzIGNh
bGxlZD8NCj4gDQo+PiAgIAlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcihzdmMtPnN0cmF0aXgx
MF9zdmNfcnN1KTsNCj4+ICAgDQo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgU1ZDX05VTV9DSEFOTkVM
OyBpKyspIHsNCj4gDQoNCkhpLA0KDQpBZ3JlZWQgd2l0aCBTYXNoaWtvJ3MgY29tbWVudC4gSW4g
c3RyYXRpeDEwX3N2Y19kcnZfcmVtb3ZlKCksIA0Kc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkg
Y3VycmVudGx5IHJ1bnMgYmVmb3JlIHRoZSBod21vbiBhbmQgUlNVIA0KcGxhdGZvcm0gZGV2aWNl
cyBhcmUgdW5yZWdpc3RlcmVkLiBBIGNvbmN1cnJlbnQgc3lzZnMgcmVhZCBjb3VsZCBzdGlsbCAN
CnJlYWNoIHN0cmF0aXgxMF9zdmNfYXN5bmNfc2VuZCgpIGFuZCB1c2UgcmVzb3VyY2VzIGFscmVh
ZHkgdG9ybiBkb3duIGJ5IA0Kc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkuDQoNClRoaXMgb3Jk
ZXJpbmcgcHJlZGF0ZXMgdGhlIGh3bW9uIHJlZ2lzdHJhdGlvbiBpbiB0aGlzIHNlcmllczsgUlNV
IA0KZm9sbG93cyB0aGUgc2FtZSBwYXR0ZXJuIHRvZGF5LiBUaGUgZml4IHdvdWxkIGJlIHRvIHVu
cmVnaXN0ZXIgY2hpbGQgDQpwbGF0Zm9ybSBkZXZpY2VzIChhbmQgZGVwb3B1bGF0ZSkgYmVmb3Jl
IGNhbGxpbmcgc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkuDQoNCldlIGNhbiBpbmNsdWRlIHRo
YXQgcmVvcmRlciBpbiB0aGlzIHNlcmllcywgb3Igc2VuZCBpdCBhcyBhIHNlcGFyYXRlIA0Kc3Ry
YXRpeDEwLXN2YyBmaXguDQoNCkxldCB1cyBrbm93IHlvdXIgcHJlZmVyZW5jZS4NCg0KVGhhbmtz
LA0KVHplIFllZQ0K
