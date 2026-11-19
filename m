Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110446;
	b=VQe7iFN68XUXLtmU1c655yEfeFNkN1GF2Xwe7x6v/8ORmGTunJNbkmP5SfkgBv+/GMt6
	 /GbAqMjKn+vhRXYuj6I9ed8jLpAFyDoxlYEyU2IvBWfH6g2hAi/lAZSEznhF7xPK3Hl6E
	 lMC3GZLnd0Jk8m7DgHGueVTAk1x1ni/eam/JtaNYwoOo5TDni5BVMATa+ETuwE2iDgV7x
	 595ZoOHtfXPXSikTFo+QKqlKGrb/Kd2FRFowp9ZjfHn5D9u5MQkHlO5OLZsek7uXIh1da
	 6Lbx3tPuJqC2ybrLdLWxIMsZ75sbusMb03DQbJS5tDLdYaJHb1y3yqj3hg9RWUYsZCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110446;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VfF9VgGZVjJ2Wx8ULMfrYS+hUil3qnkku+/8PtL4EXs=;
	b=KsL64Bs1mePPUWZ0otc89FZWDGQ+C0yKIs2XnDKAYVjDQYspdzd83zr8xKM4kwhBUv0G
	 ryikycRKyjOWnDIzYkCPXFkekO/dc3NC7+iqI52ILWMStiES4XRVUR95wiy3Ek3JaiqgQ
	 m868V6BPJlXzhQwwycbFv2GMgYz7WHyFcMu3II/gqYJGAA45Eo0spUiaRFiJ7IxDSRrUb
	 yNTaRyvgSTvGofh3AkNxKXndhHlfqAvWdWY5/KrZ5GLmsBaFvPQnpDi1Mga4iGBy4UFDj
	 SMlfbkruGqHU/iGA8+fOOCfb9aGAHVBaL4I/pc+IyC38KrbhRytNC6+hmMbpZpE1U0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=siemens.com;
	dkim=pass header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=m5WKjxcU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.21
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE28606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=m5WKjxcU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK9w/r+RUo1UIBKmFHcHrlZ9RxJxDm5p6kC1MHZgCvdTeyv5BVQiSm/kAeHXUuIvfS1ECwFXQEBeKupvT3k2VsiCVnqCwK+MW94iO5Z1FFswFoFgPY2+h0vKQTtzXgNe8j5vTo7rua7WRFV6r3/cHBeeB9vHkXZGjGzfibyrr/cmo3Kbg/XIOG+0+iKjbkUZHSyILttZ+jzXnyxCHrgRh+00e5UhzzYXv5yNrJZenwa2gREGOLmgc6wNU7FOzoa1Ju2okJ78+RmYeDZjDxc5nhzIttGbc7TixiOLPVkm4zp2OP6JYpjh/ZlONClQlAWoZ//HLjukhN3RXFQCUIf6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfF9VgGZVjJ2Wx8ULMfrYS+hUil3qnkku+/8PtL4EXs=;
 b=ZoZQ0hA1uLaPtNMLG9foiBy5puU6L6SKSx4aowDGLvycDt35IHYErz+wBCR6e+vIsWH7ZkFOjqjQIAf/u1f56aNbBnWPE6TU6QOAFJyW8mJaMGN8ZgTA3dDrGLlWYXr9/QTBGy7i2F9YocWzX2qUrqZ/iM92/NTg80DO8HUj9mT+vxLmFsUG0MGe/TdOPxAjfEa34fcfdVavgDwSjUfTdrypH1WjB2fXSH1vIz0xI30nibFQIsYqtjxdX2RkDFNXwwC9yK6cU7qXM1+NZWvFBme+e/EVjlMc1sPiVqi0k12pcoJu96p2A+dLnY6XRwKEkt24qajWP+O3gGE3ecdkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfF9VgGZVjJ2Wx8ULMfrYS+hUil3qnkku+/8PtL4EXs=;
 b=m5WKjxcUR4/tnIG25Q+auaWOR3MYG6yMJ0nNvjJ7bEfbk/UnWWxRiwR0EtQi6zQ9EVlvTtKAYkj7SQO+nnJNJXVdj4q4uTnBENDcxj3ScyuW3XA0PCbxn7KlCCyWlWpPfrrdM1n3bXYGN/kWm97uj7sdRPQGAq/ES/HJ9TBcnQMigjJ824FhauUC52Nfn8Xa4O98/M8mQzPl/iVi44JScE+ti6xqTVb1eIbOnpbYlAjOZVCfQzF6BQlfDmdEeddH9WN7RIQtgSNiqYsYxhXBz/7/E9hu6+CyDBjkBIt9dGzE5jJmJ5uTcIMDc+Bxh/iNFzAqJ2AEY9n6cbsZOEXnlA==
Received: from VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:84::20)
 by PA1PR10MB8979.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 17:47:20 +0000
Received: from VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::11f8:23f:fe2d:c421]) by VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::11f8:23f:fe2d:c421%6]) with mapi id 15.21.0662.000; Thu, 19 Nov 2026
 17:47:20 +0000
From: "Niedermayr, Benedikt" <benedikt.niedermayr@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Thread-Topic: [PATCH v3 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Thread-Index: AQHdeEoeEVhiViNndEKZMISHYNGVQ7c1q3eA
Date: Thu, 19 Nov 2026 17:47:19 +0000
Message-ID: <2a54299e-3fb0-41d1-a419-aac8fa2b51da@siemens.com>
References: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
 <20261119164708.1280862-2-benedikt.niedermayr@siemens.com>
 <2616c71b-f352-48f6-96cd-98291012a616@roeck-us.net>
In-Reply-To: <2616c71b-f352-48f6-96cd-98291012a616@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB2368:EE_|PA1PR10MB8979:EE_
x-ms-office365-filtering-correlation-id: f9ade0e1-c015-407e-e726-08df466528ed
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|261009223027099003|55112099003|11063799006|56012099006|4143699003|261026121527099003|261021123027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 A6T50gb4SSfB5X/tqf9oQUQ01MuuP34C/2mvsI26bNETcOcWPx+zhkWXD31ztcggrn9g7/9CmLa34f3UdLCuf25SsG5kqqS2ILVTp7PPt+U4uJkPUT3kXvT5OPXrEKK3DT6aLE0O+Y546aBW1SOL0uCON+M4ZLnFj+baXgqSjjwN9AROuP64bnEg6N+8VJuyeum5pkYri8c9uUe93rYg+brACGheGJJ6xKeaVbqei2d8rirKZrLMJqKXNaCJ3ZlTFWXnaUGkU6OOl/Lz5+Tmw88cEKSO3NjU/+RUqqn1xjKB/DOIqadSogxN1Uwy2zVWVJ9l4ztUTrXISPMz9nlvoRFwViNHMGYFaOpIftwgVTutCT+BsktQkr/rvaHt5cSTiTiP4yj6MX2Bvr+5HXd3PqpW5A4g//fO7pIzDef1oX5fbtioIP6fFdmCb/oT43Kmum+03fnRsH/KHznxSxbvC5Q+P7xTSrLzOlJCJiTAVNBiOr6WlIdTFIYukSKcohbfpGnGks8o12UO8bhAwe1mScqxW3BRKer/W+ZX2wsxGdetT+VoVXfT5IHxdcB7flQaungAc86gjQPgJKbYnyBA6FV5ABelnDsj7M+q7scjnQ2SYQ6h6thsBPBHnThF6BdJIZZ+3H10xHRfhzJ8WjV4AHzugoRMpd+g8z4nv3m6tXE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(261009223027099003)(55112099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261021123027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHRma1VDZW10c0hTelVLN2I2NjFQSDV5T1VLQmxiM3ZpdGpOYzhvRWNFTTli?=
 =?utf-8?B?NTdnQ09wVHE0RnJCemk2a3k4RS9wNFJvZFBORFozd256V0JoMWQ5R0Vvc1M2?=
 =?utf-8?B?LzBoY3VqNnpmT05RVWpOR21NSStXVHljZTA1U3d5MjdRajZqS3UvTTA1bXp2?=
 =?utf-8?B?RlQ0clp6RUZZZWhEK3paSHZFZDRGRmJ2dEovaWxrMkw1aGg3ajhja0lUOUd5?=
 =?utf-8?B?Yi91MDZFZkxjZ1V0d1NhV3hOc3hlZ255ZHU3TzM5TG84RDRyQnAyclhnbU5i?=
 =?utf-8?B?SWRVZEJ5bGZMY2t4SXcvQ2wveGt0WDB0VmxKa0cxMExBZUFCT0dDUFFrSE92?=
 =?utf-8?B?VEJ5c0lScXV0OGxOQTdHNTdyamFTOVVUemt4WFd3d1NFeFNvZDBLT1VGdCtI?=
 =?utf-8?B?TnA3bE9UZSszbGN3bTYzaEFtT3ZNUjlNNkFSeEhpaUhrYlM5WnBjNnZsSUVN?=
 =?utf-8?B?T2pYUmFFVFpJWWVDc1E5NWVCTTVnK2MrQUZnckp2Y2FUNGhwTjdvekN3cWFo?=
 =?utf-8?B?aDNkT05VWGhFQ0tFdmh0SkZYNGZQMzRWcWJ6Rk9NS0szUWNPOEozc3VWYk1v?=
 =?utf-8?B?UnAzcDI2cEF5M2JqTm4wRzhwUnljMVYzZStoQnZ2aTZQTFZ4UGxnemFvNEVF?=
 =?utf-8?B?RzI4MU9oZjQzN2pYN1NyNVNUdHNvZHlCNmNlMElrTlpqQ3A0aUxQdFRiNmhC?=
 =?utf-8?B?UllwMXE5SWJ6WFN3cEFvbC9SbmNkS0NnNWY5Q3E4QTBrNDVyb1c0cXhVaStR?=
 =?utf-8?B?ckViMGo5RVg3WDRjdGxVYUlWWlV6S2M5eFR1U3NSMHh6Y0V6Sk90OE11WDlH?=
 =?utf-8?B?anhTaVhqelFVYmRsV294RVpyckovKzJLRVpWUVpydGtjT1E2K0JqNklIeVE4?=
 =?utf-8?B?YkpIcHpsVG1lR0pFNXJKeVpDZWxSQnA4ZEd4Yjh6dWdVV1JrTXhVRkJ6Sjk4?=
 =?utf-8?B?SDRmMmF5azg5aSswRnhNcHJUZFZQYWd5MExYVStSMnRnZWVUQlNJNFhJc3M5?=
 =?utf-8?B?dlY4SDN5eFhsL0J5VWZBMmJVcVlIbUdaOFJXRGpreVFBdTBOYlp4bHhjUVBp?=
 =?utf-8?B?WGpIYmhQOHJYN2k0MCtEblUxajhMZWFScHlrUExoUmROanltbGR1OHNhYVB6?=
 =?utf-8?B?eXh4VFJWNG4wclJPSTdtajZxSEJaMGJ1WnRaOFJSVm55enY0N3FCcm41WVpT?=
 =?utf-8?B?VnQvdlVPZEgyUGRVK1dJeWhVSUJMdWUvb1FYOXAwU3pjcFZNaW1kQUdtS04w?=
 =?utf-8?B?OWh4bS9JWTRFS0RFNmtta2JyYUFzRFVYUldvYVlrdlRRV3pJazZ2d2NFclNO?=
 =?utf-8?B?bkx2cHY1U2JQeS9hNGszWmNHUGp2ZUN2RGhqdUlsdzQwOWdOa3ZnbmFYN1BJ?=
 =?utf-8?B?elE0N293NG5UcnJ1bngvdHFkWkN3WTZ0N2VWNlVLMW5rTmkvQmRVTTRxaTNX?=
 =?utf-8?B?dmd5ekVSNDFnNUFHRm1qYzRjRDNKcm5zZjQvb3ZGdDZEMFh0T3dtNVpuOXB6?=
 =?utf-8?B?NjNXOTA2Y3ZjNnBuSDFSZDI3OUd3R0liNGhSNysxOWN0WGc1Sys0eW80a216?=
 =?utf-8?B?MURUVVlhNnA4aGRpcVhGTTQraEQ4NlFUNVRMbUxkUkt3aEdkYXdNNGJLMXFQ?=
 =?utf-8?B?czZWVDh1SXUrbzE5Sm8vaHYycVlpWFFQWTNFUkx1OEw4TmVpdGhHdWZIaTFs?=
 =?utf-8?B?NUJKak51Z3ptWU9qRlF4QzEzUXcvSHZuZFdUVEhwZTAyeHAzRm0ySXdULzNC?=
 =?utf-8?B?YWNNZTNpZEdVU1U3VVRMeWVqUWZsUnJTSDVQbDQ3SDAxZmh6VjR5dC9sb2lO?=
 =?utf-8?B?dzRPR3I1bG54cnVsUFhuL2pEaXYyQWNHSUY4MVozUThvMkEwdU0ydExjWU5G?=
 =?utf-8?B?bjVsaEtIdmtZcTcrcmVtcXlETFJKN2grT3YxeS9ZR0hDWFhCNnYyRDF1MndV?=
 =?utf-8?B?Y1lhQ3RuNFhteTRWQ2Z3S0VjbzMwRjVFZXZ5Y2VHZGIwdUdzMFdqVmpHcHcz?=
 =?utf-8?B?SHlCMHBsQUpLZnBMd2s5eTdWMEVTMURIYStLa2REc3BEM1FmeXRueHJrOVFF?=
 =?utf-8?B?R21nc3JqaS9xQlZycVJndHhhM3F4WnBWQjM4YTIyS1NJa01YaDkrL3RqSFBB?=
 =?utf-8?B?M0luR2hJZlp6TnRWTHBVY2VNRjA0VWYrVmVBMzMzVTloazdIMzZJc2FYZzNV?=
 =?utf-8?B?bTZQZW10Q1hQYXBrb2pYUENsM3BRdUM0b2NTWTBDb21GQlMwbmZTM0kxclgz?=
 =?utf-8?B?UjJXbitUQUJHcEhUSFpvWGZnaHVOM3hnOGFZQnM5cXpYRVVxUjBYRnZjWTVU?=
 =?utf-8?B?YUJsdHVkc3FCcU5HQmNEU2VFNWtQQjJOK2M3bndac2dZQmZlVWlhR2lNay9l?=
 =?utf-8?Q?iQbwS+xxIagG8TOE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFDB91DB82E4024C98BBF3EB811A30AE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB2368.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ade0e1-c015-407e-e726-08df466528ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 17:47:20.1420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJn/DuFcJA0gVfJLVWSkmSZfLhi3S8GUO799G0HFgS/pnx3VuEVHWteY9EWaIcvVADVXvRJ3YWbU8MQsiPougxa58P3G2aVGSi6Sq6WK/DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8979

T24gMTEvMTkvMjYgMTg6MTksIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIFRodSwgTm92IDE5
LCAyMDI2IGF0IDA1OjQ3OjA3UE0gKzAxMDAsIEJlbmVkaWt0IE5pZWRlcm1heXIgd3JvdGU6DQo+
PiBBZGQgYSBoYXJkd2FyZSBtb25pdG9yaW5nIGRyaXZlciBmb3IgdGhlIGVtYmVkZGVkIGNvbnRy
b2xsZXIgb24NCj4+IFNpZW1lbnMgU0lNQVRJQyBJUEMgQlgtNTRBIHN5c3RlbXMuDQo+Pg0KPj4g
VGhlIGRyaXZlciBiaW5kcyB0byBBQ1BJIGRldmljZXMgd2l0aCBISUQgcHJlZml4ICIxMTBBIiB3
aGljaCBpcw0KPj4gY3VycmVudGx5IGEgcmVnaXN0ZXJlZCBQQ0kgSUQgZm9yIFNpZW1lbnMgWzFd
Lg0KPj4NCj4+IExvb2tpbmcgYXQgRGVsbCwgSFAsIExlbm92byBhbmQgQVNVUyB0aGlzIHNlZW1z
IHRvIGJlIGEgY29tbW9uIHBhdHRlcm4NCj4+IHdoZXJlIHZlbmRvcnMgZGVmaW5lIGN1c3RvbSBB
Q1BJIHRhYmxlcyBmb3IgcGxhdGZvcm0tc3BlY2lmaWMgZmVhdHVyZXMNCj4+IHRoYXQgYXJlIG5v
dCBjb3ZlcmVkIGJ5IHN0YW5kYXJkIEFDUEkgdGFibGVzICh1c2VkIGJ5IHRoZSBBQ1BJIEVDDQo+
PiBkcml2ZXIgYXQgZHJpdmVycy9hY3BpL2VjLmMpLg0KPj4NCj4+IFsxXSBodHRwczovL2FkbWlu
LnBjaS1pZHMudWN3LmN6L3JlYWQvUEMvMTEwYQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEJlbmVk
aWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+DQo+IA0KPiBD
SEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzDQo+ICM0MjY6IEZJ
TEU6IGRyaXZlcnMvaHdtb24vc2ltYXRpYy1pcGMtZWMtc2Vuc29ycy5jOjI2NjoNCj4gK3N0YXRp
YyBpbnQgc2ltYXRpY19pcGNfZWNfZmFuX3JlYWRfc3RyaW5nKHN0cnVjdCBzaW1hdGljX2lwY19l
Y19mYW4gKmZhbiwgdTMyIGF0dHIsDQo+ICsJCQkJCSBjb25zdCBjaGFyICoqc3RyKQ0KPiANCj4g
Q0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcw0KPiAjNDc5OiBG
SUxFOiBkcml2ZXJzL2h3bW9uL3NpbWF0aWMtaXBjLWVjLXNlbnNvcnMuYzozMTk6DQo+ICtzdGF0
aWMgdW1vZGVfdCBzaW1hdGljX2lwY19lY19pc192aXNpYmxlKGNvbnN0IHZvaWQgKmRydmRhdGEs
IGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cGUsDQo+ICsJCQkJCXUzMiBhdHRyLCBpbnQgY2hh
bm5lbCkNCj4gDQo+IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVz
aXMNCj4gIzUyMDogRklMRTogZHJpdmVycy9od21vbi9zaW1hdGljLWlwYy1lYy1zZW5zb3JzLmM6
MzYwOg0KPiArc3RhdGljIGludCBzaW1hdGljX2lwY19lY19yZWFkX3N0cmluZyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cGUsDQo+ICsJCQkJICAgICB1MzIg
YXR0ciwgaW50IGNoYW5uZWwsIGNvbnN0IGNoYXIgKipzdHIpDQo+IA0KPiBDSEVDSzogQWxpZ25t
ZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzDQo+ICM1MzY6IEZJTEU6IGRyaXZlcnMv
aHdtb24vc2ltYXRpYy1pcGMtZWMtc2Vuc29ycy5jOjM3NjoNCj4gK3N0YXRpYyBpbnQgc2ltYXRp
Y19pcGNfZWNfd3JpdGUoc3RydWN0IGRldmljZSAqZGV2LCBlbnVtIGh3bW9uX3NlbnNvcl90eXBl
cyB0eXBlLA0KPiArCQkJICAgICAgIHUzMiBhdHRyLCBpbnQgY2hhbm5lbCwgbG9uZyB2YWwpDQo+
IA0KPiBQbGVhc2UgZm9sbG93IERvY3VtZW50YXRpb24vaHdtb24vc3VibWl0dGluZy1wYXRjaGVz
LnJzdC4NCg0KQWhocnJyLi4uIG1pc3NlZCAiLS1zdHJpY3QiLg0KDQpGaXhlZC4gU2VlIHY0Lg0K
DQpCUiwNCkJlbmVkaWt0DQo+IA0KPiBUaGFua3MsDQo+IEd1ZW50ZXINCg0K
