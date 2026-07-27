Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC33BBFB1;
	Mon, 27 Jul 2026 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134533; cv=fail; b=calTJqc1Xto/c1eIPFIY6Si+YnIgbfv56SnTT7r5Lg+/2YEuTHh0W2wNEl0v7zk9MuejMc1/LnYTbt/DHHmxmOM/vgvMGT5UOnL9nXJCkiSb1g3Ug4WLRu3X4p19Y773baErxVAQxNIMG7CvtqvGiA1HU4LjVJUM20AjI5XPXHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134533; c=relaxed/simple;
	bh=pD1BxlnofWzSHz1qRpvxWVoQN7zHzVwsh3vwLYu3i84=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oNdNcy4Z2cW+1+oWG072Cs8QsQ98UnBCU3yLHrBfNUtHgK2Vk/Pxx2wMoUOoVtjEZYIh3kJLkypwz82TrQ36HnCDkYGxUGfmwHMRTCAgjDZLx2tU+M6dGC5+drmTlJcw442t7+JRvHV6SXb4/UTzsHwsA9YdcR0nYiqwoxBbZZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VfPMvGIU; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VfPMvGIU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM2kksguPneB1gGDSuKoTLNPQMirXPEp5b7/J79G3sO83XwK6vH28dVc/wJ6nDBzk833y46koj6bh8HpVzOPCm/uRKYG/u3TZ24a0OQE3FtYItS7FkTclZWPyUKRw5LH+6Fd3B4XsVQR2R1GBHrZV2ZOuw0Z9TmV56c5sqCd2ViychZoi2C6CV/COuYihfWw/MCP8HbVnVeU5p7j7sA8tBnvp/r31Rsfcxar1ZaPIz61gbn9s811OBm1ZGSjlqlyiLzQi67sMzTOugMuUtT65M2/kdRyBkgiHvnUUrkaGS5BYMPlRx2g6rAegVhN8AekMYAAExrNPSk8uwzRYzq77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD1BxlnofWzSHz1qRpvxWVoQN7zHzVwsh3vwLYu3i84=;
 b=G/yBrs3ArL2lk3MeE+IOrEx2HUREeDhPw1jMLqIO/RlLlA1wbAQzEdywT1WPERly1CYczsvlBmUAKE/doUeFx4hyI6qjxfXQTUG5HxnbNy2bHUygWV5pyej8+dmBGjTfOPu1xpvFJ76MhEpVGMzQJ35tPJSMPHsuZzwYiylALlWmVHSqjxbG3viJimdlLq9kXOF9Z7h1B+HQfFj/z1vRjTWvIlItUPAPB9UzVy6tJuYhjo69+dwvxWFQEdHWxWrxC7jXtB1KQo9U8zk34i66lWBijVgXQxow0WFRX9DV3VE+2Gv9ul8ybaHFHlFjqBUqW3pG0boxX1HOA6ZBshh9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD1BxlnofWzSHz1qRpvxWVoQN7zHzVwsh3vwLYu3i84=;
 b=VfPMvGIUXlw1i5Zzt3uuY26bjqJnOcc9Y/1DXfb+O8eIANSiN9cfwPFUModIm1Kb0iZnDN6niNF5Yxl0nFe5Qyjpsi3Tl4TYZk5l+xMPUeHNHOOqLaWGkyuqsdhbvMKGPMocpcB2Xi9pb+j4KXh9s+eiboefEEsaYbEt0hU6tUwtYisbkEJg8ENEirK6JF7/XI1oFg/gjLTpuAYyZJeeklw6evZOrC8iSEKoGufrIxYU6RmLIa0EuIHCkTpgSiRM9F21oA0CZ2/hYdycXW0znYxZLv6/glAs9q9ndkzoJGXeOR1gsisVqfHOu9VCIa8GvsV2hi+/gcghpkzmlx7E+w==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5097.namprd03.prod.outlook.com (2603:10b6:5:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 06:42:07 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 06:42:07 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Guenter Roeck <linux@roeck-us.net>, Dinh Nguyen <dinguyen@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Topic: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Thread-Index: AQHdGmjNirwO6WBuQkCvMCv3Khdj+7Z6oCmAgAZRG4A=
Date: Mon, 27 Jul 2026 06:42:07 +0000
Message-ID: <3350cd23-6a0c-4f8e-8de8-d6e26aa82d7d@altera.com>
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
 <20260723061418.423A81F000E9@smtp.kernel.org>
In-Reply-To: <20260723061418.423A81F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5097:EE_
x-ms-office365-filtering-correlation-id: d48d3ec2-8151-4ccc-0daa-08deebaa2d95
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|6133799003|4143699003|11063799006|5023799004|56012099006|10067099003|3023799007|22082099003|55112099003|18002099003;
x-microsoft-antispam-message-info:
 DEODwj/3P1j0xtHQx9r0HmKQ0aEglaqBTz8L2fpCAfe7CJWz6aRbCmhVaPSrYYrYNX5oA8RGndBUq+BgSCldMZ0jLCsQuZzlOGgvw/8fPqQsQTgEAyZ4xt74NZqEGQy6iXMYbKvlgaJqIn/DKNMccceAyWNkMQnW781IbKhAFMi8HvqDr3enllxBRMzydNLNQngNmTtsE5P7Bsn+jLvjrP6KTYgH/uTJ+8a0T0DMercXfWCFT/gESYbQ2gyg0Mdth+Ryb1FUBNFwlXmVDfT8Q1nlu13GuuQn9FgYEL3VUshD3BiqQgloKfvF05GzNp+lk16CmTq/QgqNND+DIcevFHzF14XvnkSD2lKHSrlXEtmpPeYpyYTrGARW5YhqNxw5XzbHpUPCuoLMenvyG06HhvmQBEtahPAs8+oJAGPYBSOB43mUO9BfROhMQ9ybh3CU/zpmpQlgCEaFdf0Op3ipdpkWjejQFU4cjA9iJjiyjKnDlb/pfZyxMZxdLlYyrUJqFABuBdzT0d4HsIXnlgeBS4k2lrNy9yQKS5ProFw5zhvbixhbUXQUrj8+jDyjU1cX3Wz8k4RGQUmLBEYf6RyJuHFDwMx3QGAfIHHv3oc0BxEdQKR46yNr7Z5N04pHhnOlpATY3ecAfZAou49k2UQj5LKE+01Mn79wNRH4gCUYjm4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(6133799003)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(3023799007)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFROY2UzY1NCeUczQUVZY1BWbEdWRnFVNjcycS9EN2FIMnJxSmRlb2JWcWFs?=
 =?utf-8?B?akI5SkNLNDREM092ZlIyWEtMT3FRdUhKNVhkSTJPcUFaaDZNYkpMei9Sb0ti?=
 =?utf-8?B?dXVKSFlSWk5BRjVMajNJbWRrTzFmRU1QRUVkZytzdUl5amZSN2Y0dFV1QjYx?=
 =?utf-8?B?VE9kcC9aL1hhM25CRGI2WnVBWVVnTGhEV1dudEEwSks5Vlg4L25hS1U0dVVU?=
 =?utf-8?B?ZmptRGlvT1M5ZVUwOVhGUUZLK3lxRkJEdUNlOWFab0tUSm45bXQyd3BHRUNa?=
 =?utf-8?B?Z2RFZTRTUWd4K1BFcUkwdDFaQkhyRUxkZDNxOEFYYlJrdjVWY0NOSmVEOHZS?=
 =?utf-8?B?UXZHeG1ibnhIQldWUVVZbDBXak1FYmorTllTMVNta09UcE9lM1dUQ2svYzRq?=
 =?utf-8?B?UkZ1Qnc1SFE5ZDdTaHM5NFpzTHdRYzhoeWtWM2ZpU0xYVm9EY3NMclZBdzJ4?=
 =?utf-8?B?cFNNY0ZJUDRQN3VlL0QrdDNsVGd6UGpGOVVYeUxDYy9HUmZGOHp5RUdqRnZj?=
 =?utf-8?B?eGsrbm9XbzJLejJGcHdZOHQzSU4rcDZaNHVSeWt4Nkx1VldEL1ExMXZDeXh5?=
 =?utf-8?B?SkI1MmxQUy9IbDNOVW0veC9sZmhsNndiOTlyN1ZMZWhEalBhZVlOQUpidTRP?=
 =?utf-8?B?OHRqSVdnQnlQTE02TlkwWnpZZGpzeWxneVFCVEh4ZjVFT3FlSkVmalJ6bU9J?=
 =?utf-8?B?OXdzbzRFRVNGNC9jaWM2TE9iVTh6dVpQZk51MkN4N1d2MG5yNnRqSGRhbTFx?=
 =?utf-8?B?OEdSanJhaDJnbHRxYzhTR1VZS1paTHFWSjl3aU5kQ3R6K3F3VzZmcTFNSFZP?=
 =?utf-8?B?b0p3aTRNa1JUUkRhYUJXZlVmeDJ0VlRWSEJTdVF5WW9LWGdhcHczdEZEODlj?=
 =?utf-8?B?czhlWmlINEZhamtrTXMrY1d5enNydnhtNXdnRU5tSmJibGttTXpTZjZXckU1?=
 =?utf-8?B?cVVYNFdZVUJQaHVOaDRJTTNrU2J0eW1OM0hoeUlqNUNrNUI4TExVRWNyUkFG?=
 =?utf-8?B?NHlaOEdMNTEzM3p5NEVTNWNUWTV5RDQwbVZUM2dZQk5VWDBleVV2NTNnT1VP?=
 =?utf-8?B?Z1AyMU1DSkdUZHMxV3ppRjV6WUdxYzlHTzNoOGJoZ3RqanVvTHF3QVBVQVUy?=
 =?utf-8?B?aktmOTdqK1ZndW5rNjdDSTBGNGNsdC9wak1RVEs5R2txZlV3TFBXcmhrMzFO?=
 =?utf-8?B?a25vOXN0N3VOMXArRERsdGVXckc1R0lKcWhjaGYvWHIwdlZ2a2dSb1hIa3NG?=
 =?utf-8?B?MnNvMU5MV3A5RHZFRUdtSFhhOHhMeGNFa0Z2QW9DcWxUVDVmSTFDMXowS0VQ?=
 =?utf-8?B?aWRRY2xLYURLNjgrYWNDMDIyR3Erci9WUnhuUEFkN2YxV3dwOGRPTmVsYXNz?=
 =?utf-8?B?RVdhTW9HZHJRbGE5NUE4dmJydWxuV1p1d2FkblhZanZKVllnZjl4Q2VGeTV0?=
 =?utf-8?B?N3BJeGduVEpUaXZIRlVSWk5wRGRnSTRUWFVqamp2UG9LcjhGWnJHMEFwdThW?=
 =?utf-8?B?UnJQeFpxOUJiVmJwUE1obUE3T2Q4Z1Z4QkxPem9wcVBXOTJucFh1bjFTclkr?=
 =?utf-8?B?YU5tYm0xU0NKdzNlQjdPalRLamJGK01JWGxZdVlQWG8rcW9Ccy83ZDJOeVZ6?=
 =?utf-8?B?cHJSL1VJZ2kvYUFSYUc3OUsybEdwcUlYakNEd0xQMlFQVFdZNVgyZkp0WTM3?=
 =?utf-8?B?R2R1Z2YxVWg0V1RTWEFqbEF4VGZkci8zaWgyc1plQnJnalphMmRaS01YeldF?=
 =?utf-8?B?b0lMbVlpL3IvOVRHODByV2wyNG42c3R5WGJTcmpWRkN0Z3lTdk9LM1cwaEFH?=
 =?utf-8?B?RTBMeEJ3Tm8vNVd6bTVQM0ZFd204d3NEN0R4VzJIaEdCcDNYQWNkZm4rWTV6?=
 =?utf-8?B?ZmZrWEtUWnNscWdOMW5uVnlSUUxDNEFiY3h1aHZWRTcrYklHSDV0RGxhdStx?=
 =?utf-8?B?RVg3VkNsNjZDUTFvRTZJTHJaTHdCc2lhd1hCcGVnUVQ4Zlo2cWM1RldLZ240?=
 =?utf-8?B?bm8wbWljTCt5cnVwZ05IbURHVi9QUzNraURQcVBJV3RlMGtlSHg5cWliRE9k?=
 =?utf-8?B?cmEzdlQ0bXV4WjQvRFYwMTR4OCtPcWN0cVNjT0o2LzMyNG9aRGVtandIZUxI?=
 =?utf-8?B?Uk5od1E5cHh2emYvUWtEWGR6VHA3TWFCa0dJSHRwQ0NuTm9IemdSVmZtbjZX?=
 =?utf-8?B?NUJhWlBpdEQ1TThvalR2UHJhVE5tb2tWK0dSTlE0b1pjNDNQQk05KzU1U29s?=
 =?utf-8?B?M1FQZEZWTlIxaCtKSjc4N2RtMHJjcy9PR3NzUnRWWW8zeng1c3VZTy9JMDJr?=
 =?utf-8?B?V1BLaWVHVXFvaW5HQmdMUUxNWEVBZ2JRYU5xK0NQN0xSUmRUZXZ3Z0hJZkdq?=
 =?utf-8?Q?uskh7F5XgnznFdm8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A31162EF9E9F247AE6FF9765BCF1CC1@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d48d3ec2-8151-4ccc-0daa-08deebaa2d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 06:42:07.4367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PB1iKrr3LC31+/THaZYZOCQBaPUfM1LZfIIA7O3j94riBijrdV2fXBx1dOrvCoRtQMdloV80YPGXnlRyG9kDGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5097

T24gMjMvNy8yMDI2IDI6MTQgcG0sIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiANCj4gTmV3IGlzc3VlczoNCj4gLSBb
TWVkaXVtXSBIYXJkd2FyZSBtb25pdG9yaW5nIGZ1bmN0aW9uYWxpdHkgaXMgaW1wcm9wZXJseSBy
ZWdpc3RlcmVkIGFzIGEgcGxhdGZvcm0gZGV2aWNlIGluc3RlYWQgb2YgYW4gYXV4aWxpYXJ5IGRl
dmljZS4NCj4gDQoNCkknbGwga2VlcCB0aGUgcGxhdGZvcm0gZGV2aWNlIHJlZ2lzdHJhdGlvbiBm
b3IgdGhpcyBzZXJpZXMuIEnigJltDQpoYXBweSB0byBsb29rIGF0IGNvbnZlcnRpbmcgc29jZnBn
YS1od21vbiB0byBhbiBhdXhpbGlhcnkgZGV2aWNlIGluIGENCmZvbGxvdy11cCBpZiBwcmVmZXJy
ZWQuDQoNCj4gUHJlLWV4aXN0aW5nIGlzc3VlczoNCj4gLSBbSGlnaF0gUHJlLWV4aXN0aW5nIFVz
ZS1BZnRlci1GcmVlIHJhY2UgY29uZGl0aW9uIGR1cmluZyBtb2R1bGUgcmVtb3ZhbCBkdWUgdG8g
aW1wcm9wZXIgdGVhcmRvd24gb3JkZXJpbmcgb2YgY2hpbGQgZGV2aWNlcy4NCg0KSXQgaXMgZml4
ZWQgaW4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC82NjMwYTE1NjhmMTYyZDk0NTVlMDU4
MGY3Y2NhZGMyNjJkYjQ3MThlLjE3ODQwMDcyNzUuZ2l0LmFkcmlhbi5oby55aW4ubmdAYWx0ZXJh
LmNvbS8NCg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFsxXTogW1BBVENIIHY4IDEvMl0gZmlybXdh
cmU6IHN0cmF0aXgxMC1zdmM6IGFkZCBhc3luYyBIV01PTiByZWFkIGNvbW1hbmRzIGFuZCByZWdp
c3RlciBzb2NmcGdhLWh3bW9uIGRldmljZSAtLS0NCj4gY29tbWl0IDViYTJlNGZiMTU1ZjA3NGRl
NTY4MjgwYWVlZGU4MTg4M2Y4NzkyNGUNCj4gQXV0aG9yOiBUemUgWWVlIE5nIDx0emUueWVlLm5n
QGFsdGVyYS5jb20+DQo+IA0KPiBmaXJtd2FyZTogc3RyYXRpeDEwLXN2YzogYWRkIGFzeW5jIEhX
TU9OIHJlYWQgY29tbWFuZHMgYW5kIHJlZ2lzdGVyIHNvY2ZwZ2EtaHdtb24gZGV2aWNlDQo+IA0K
PiBBZGQgYXN5bmNocm9ub3VzIFN0cmF0aXggMTAgc2VydmljZSBsYXllciBzdXBwb3J0IGZvciBo
YXJkd2FyZSBtb25pdG9yDQo+IHRlbXBlcmF0dXJlIGFuZCB2b2x0YWdlIHJlYWQgY29tbWFuZHMu
IFJlZ2lzdGVyIGEgc29jZnBnYS1od21vbiBwbGF0Zm9ybQ0KPiBkZXZpY2UgZnJvbSB0aGUgc2Vy
dmljZSBsYXllciBkcml2ZXIgd2hlbiBoYXJkd2FyZSBtb25pdG9yIHN1cHBvcnQgaXMgZW5hYmxl
ZC4NCj4gDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9zdHJhdGl4MTAtc3ZjLmMg
Yi9kcml2ZXJzL2Zpcm13YXJlL3N0cmF0aXgxMC1zdmMuYw0KPj4gaW5kZXggYzI0Y2E1ODIzMDc4
Zi4uZmMzOGFmZWQ1YjdmZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvc3RyYXRp
eDEwLXN2Yy5jDQo+PiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3N0cmF0aXgxMC1zdmMuYw0KPiAN
Cj4gWyAuLi4gXQ0KPiANCj4+IEBAIC0yMDEzLDE2ICsyMDI4LDM4IEBAIHN0YXRpYyBpbnQgc3Ry
YXRpeDEwX3N2Y19kcnZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAg
CWlmIChyZXQpDQo+PiAgIAkJZ290byBlcnJfcHV0X2RldmljZTsNCj4+ICAgDQo+PiArCWlmIChJ
U19FTkFCTEVEKENPTkZJR19TRU5TT1JTX0FMVEVSQV9TT0NGUEdBX0hXTU9OKSkgew0KPj4gKwkJ
c3ZjLT5zdHJhdGl4MTBfc3ZjX2h3bW9uID0NCj4+ICsJCQlwbGF0Zm9ybV9kZXZpY2VfYWxsb2Mo
U09DRlBHQV9IV01PTiwgMCk7DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gQWNjb3JkaW5n
IHRvIHRoZSBoYXJkd2FyZSBtb25pdG9yaW5nIHN1YnN5c3RlbSBndWlkZWxpbmVzLCBpZiB0aGUg
bWFpbg0KPiBmdW5jdGlvbmFsaXR5IG9mIGEgY2hpcCBpcyBub3QgaGFyZHdhcmUgbW9uaXRvcmlu
ZywgaXRzIHNlY29uZGFyeSBoYXJkd2FyZQ0KPiBtb25pdG9yaW5nIGZ1bmN0aW9uYWxpdHkgc2hv
dWxkIGJlIGltcGxlbWVudGVkIGFzIGFuIGF1eGlsaWFyeSBkZXZpY2UgZHJpdmVyLg0KPiANCj4g
U2luY2UgdGhlIHByaW1hcnkgcHVycG9zZSBvZiB0aGlzIG1vZHVsZSBpcyB0aGUgZmlybXdhcmUg
c2VydmljZSBsYXllciwNCj4gZG9lcyByZWdpc3RlcmluZyB0aGUgaGFyZHdhcmUgbW9uaXRvcmlu
ZyBmdW5jdGlvbmFsaXR5IGFzIGEgcGxhdGZvcm0gZGV2aWNlDQo+IHZpb2xhdGUgdGhlIHN1YnN5
c3RlbSBBUEkgbGF5ZXJpbmc/IENvdWxkIHRoaXMgYmUgaW1wbGVtZW50ZWQgdmlhIHRoZQ0KPiBh
dXhpbGlhcnkgYnVzIGluc3RlYWQgb2YgdXNpbmcgcGxhdGZvcm1fZGV2aWNlX2FsbG9jKCk/DQo+
IA0KPj4gKwkJaWYgKCFzdmMtPnN0cmF0aXgxMF9zdmNfaHdtb24pIHsNCj4+ICsJCQlkZXZfZXJy
KGRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSAlcyBkZXZpY2VcbiIsDQo+PiArCQkJCVNPQ0ZQR0Ff
SFdNT04pOw0KPj4gKwkJfSBlbHNlIHsNCj4+ICsJCQlzdmMtPnN0cmF0aXgxMF9zdmNfaHdtb24t
PmRldi5wYXJlbnQgPSBkZXY7DQo+PiArDQo+PiArCQkJcmV0ID0gcGxhdGZvcm1fZGV2aWNlX2Fk
ZChzdmMtPnN0cmF0aXgxMF9zdmNfaHdtb24pOw0KPj4gKwkJCWlmIChyZXQpIHsNCj4+ICsJCQkJ
ZGV2X2VycihkZXYsICJmYWlsZWQgdG8gYWRkICVzIGRldmljZTogJWRcbiIsDQo+PiArCQkJCQlT
T0NGUEdBX0hXTU9OLCByZXQpOw0KPj4gKwkJCQlwbGF0Zm9ybV9kZXZpY2VfcHV0KHN2Yy0+c3Ry
YXRpeDEwX3N2Y19od21vbik7DQo+PiArCQkJCXN2Yy0+c3RyYXRpeDEwX3N2Y19od21vbiA9IE5V
TEw7DQo+PiArCQkJfQ0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArDQo+PiAgIAlyZXQgPSBvZl9wbGF0
Zm9ybV9kZWZhdWx0X3BvcHVsYXRlKGRldl9vZl9ub2RlKGRldiksIE5VTEwsIGRldik7DQo+IA0K
PiBbIC4uLiBdDQo+IA0KPj4gQEAgLTIwNDYsNiArMjA4Myw5IEBAIHN0YXRpYyB2b2lkIHN0cmF0
aXgxMF9zdmNfZHJ2X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJ
c3RydWN0IHN0cmF0aXgxMF9zdmNfY29udHJvbGxlciAqY3RybCA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOw0KPj4gICAJc3RydWN0IHN0cmF0aXgxMF9zdmMgKnN2YyA9IGN0cmwtPnN2YzsN
Cj4+ICAgDQo+PiArCWlmIChzdmMtPnN0cmF0aXgxMF9zdmNfaHdtb24pDQo+PiArCQlwbGF0Zm9y
bV9kZXZpY2VfdW5yZWdpc3RlcihzdmMtPnN0cmF0aXgxMF9zdmNfaHdtb24pOw0KPj4gKw0KPj4g
ICAJc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KGN0cmwpOw0KPj4gICANCj4+ICAgCW9mX3BsYXRm
b3JtX2RlcG9wdWxhdGUoY3RybC0+ZGV2KTsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhp
cyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhpcyB0ZWFyZG93biBvcmRlciBj
cmVhdGUgYQ0KPiB1c2UtYWZ0ZXItZnJlZSByYWNlIGNvbmRpdGlvbiBkdXJpbmcgbW9kdWxlIHJl
bW92YWw/DQo+IA0KPiBUaGUgc3RyYXRpeDEwX3N2Y19kcnZfcmVtb3ZlKCkgZnVuY3Rpb24gY2Fs
bHMgc3RyYXRpeDEwX3N2Y19hc3luY19leGl0KCkNCj4gYmVmb3JlIHVucmVnaXN0ZXJpbmcgdGhl
IHJlbWFpbmluZyBPRiBjaGlsZCBkZXZpY2VzIGFuZCB0aGUgUlNVIGNoaWxkIGRldmljZS4NCj4g
VGhlIGFzeW5jIGV4aXQgZnVuY3Rpb24gZGVzdHJveXMgdGhlIGFzeW5jIHN0cnVjdHVyZXMgYW5k
IGZyZWVzIHRoZQ0KPiBhc3luY2hyb25vdXMgY2hhbm5lbHMgYW5kIGhhbmRsZXJzLg0KPiANCj4g
SWYgdXNlcnNwYWNlIGNvbmN1cnJlbnRseSBhY2Nlc3NlcyBzeXNmcyBhdHRyaWJ1dGVzIGZvciB0
aGUgY2hpbGQgZGV2aWNlcw0KPiB3aGlsZSB0aGUgbW9kdWxlIHVubG9hZHMsIGNvdWxkIGl0IGlu
dm9rZSBzdHJhdGl4MTBfc3ZjX2FzeW5jX3NlbmQoKQ0KPiBvciBzdHJhdGl4MTBfc3ZjX2FzeW5j
X3BvbGwoKSBhZnRlciB0aGUgYXN5bmMgY2hhbm5lbHMgaGF2ZSBiZWVuIGZyZWVkPw0KPiANCj4g
Rm9yIGV4YW1wbGUsIHN0cmF0aXgxMF9zdmNfYXN5bmNfc2VuZCgpIHBlcmZvcm1zIGxvY2tsZXNz
IHJlYWRzIG9mIGFjaGFuOg0KPiANCj4gc3RyYXRpeDEwX3N2Y19hc3luY19zZW5kKCkgew0KPiAJ
Li4uDQo+IAlhY2hhbiA9IGNoYW4tPmFzeW5jX2NoYW47DQo+IAljdHJsID0gY2hhbi0+Y3RybDsN
Cj4gCWFjdHJsID0gJmN0cmwtPmFjdHJsOw0KPiANCj4gCWlmICghYWN0cmwtPmluaXRpYWxpemVk
KSB7DQo+IAkuLi4NCj4gfQ0KPiANCj4gV291bGQgdGhpcyBsZWFkIHRvIG1lbW9yeSBjb3JydXB0
aW9uIGlmIHRoZSBzdHJ1Y3R1cmVzIGFyZSBhbHJlYWR5IGRlYWxsb2NhdGVkPw0KPiBTaG91bGQg
dGhlIGNoaWxkIGRldmljZXMgYmUgZnVsbHkgdW5yZWdpc3RlcmVkIGJlZm9yZSBjYWxsaW5nDQo+
IHN0cmF0aXgxMF9zdmNfYXN5bmNfZXhpdCgpIHRvIGVuc3VyZSBubyBjb25jdXJyZW50IGFjY2Vz
c2VzIGFyZSBwb3NzaWJsZT8NCj4gDQoNCg==
