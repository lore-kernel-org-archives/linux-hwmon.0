Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECF43A6B99;
	Tue, 15 Sep 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490937; cv=fail; b=bawmouxxnzhxVxEo75pJSKspHMOlIx7UBweNCYJFeaJuo5P/szKFyPYC9vCoumQ+7YVqpiNN475sdFJmDkXJJZbWgUTl9/Nu8/v9Qkmi34J1nHRLU2SHLOXI5Y89Sm2PKnShcc5RXPj8XPD0Nm9tpNT8Hxke3NIASGycSk0NIcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490937; c=relaxed/simple;
	bh=UXDZVXCxPWHCLfx/PCS9AGSnCMdseziKnx5H67wVXuA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=m49fsiTnD1KiOVQf42x3ps54FvhAUcZ94kZLDX/00p4A7d4BNgxIdkpiveHz6ML8MbEv9VAgcbDHsNBy1u5YKubJz0S2r+9MjK+Fyl54hLiS5uAc3Utv6LsFYAkBgvbhpZEMhqSBlSuuzXbXIhF09LZ1tLtEQU0qsHacO6brlxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=MI+bE/vq; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="MI+bE/vq"
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FF7odu2706492;
	Tue, 15 Sep 2026 16:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=UXDZVXCxPWHCLfx/PCS9AGSn
	CMdseziKnx5H67wVXuA=; b=MI+bE/vqPVnbQi0R9dQFFYHronskqRJBEAlJ9K7j
	DvqsOl9AyUiOvqX9Q5nUcj4C3a4X2MPKvC52gMthHqAiW5P791ZL92nS0DCSSAxb
	XfgXQWMucN/J4TydS7BP8p//g8r0yo+ETwMT4beM3GIAjT1Yyl5U8tkQAai81M6v
	NTQOz3xA+eTnhd+L9DiYrGZMToekh22Wpb90CkzPYtLsMrdUaDt+H0PrDsNatGuU
	OUpskpUhJAtdd3U7tpxIv5PjQa7QwAg0lubULAnFGOTL3HmqSaKkNVEdy2SGPOV0
	VdHE0Z0Mo4LNPLVlu+GafjriQx6bgfO05fkBU1QF6f5JcA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4gq51w52np-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 16:48:34 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 56EFC800E94;
	Tue, 15 Sep 2026 16:48:34 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 15 Sep 2026 04:48:33 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 15 Sep 2026 04:48:32 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 15 Sep 2026 04:48:32 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 04:48:32 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKdEtzq6h5zWUp0DZS/Nl8R/WFwwILSHr0ur4bWOM5J/YZoZK/w5Ilnyll3D47ZeENzDBZAIocaejcDlc9iFzAoCJC22kpcq2d4uu681qPKbsenBvHID7na+Gi4k1RmHFdnAIY+hk5aovMkLs8IPq6s6NDXYwdLrZEr6r3PG1YJftOLqD8W++lGx+Q6tldJHnHLuDnpzxC7LG1dUHpQ+QpiDvSpGn9qGlUzPw+1uwQ9Y/w84dGoca2UD3IPWHB4Jt/2FZ5+kXE/K20BSlcCI7oPuel1wB61dlDJg97owYuEheln7mVB6w00vPPjv+tbHrwdSV/NDAY+ugOGfATZ8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXDZVXCxPWHCLfx/PCS9AGSnCMdseziKnx5H67wVXuA=;
 b=pYry3Y8YT6nRCeK04dk7fFtjD58qsGex6FNAZQFidAt5wpHCoQtGPVaXD6q/gjPsDEd7Qs6cy+QJJ0Hh+O4I+rs0xvEQzb+43wEyPIjFKiB5x8aPYA/fxFjp1MK/smq23qLqfoDOaSbSA/7YboQTp3u9FbIDcMEev304F6t1x4w1aOZDYrM0NvLs0O2SlupuIJI9PiiHsXl/r5tnzsPUMcXBBFT/iNuj5zmVfzNQobdis0cgPyJ6LLDY32wN/mfb1dvC+xyxGUkxuUeO3bSlWFoeAqUykpPG4Hi1KAB0EEBaH5Ga1v4B9Z9t5tRu1gkqtYmI6NwxO79TTcDRYvnX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV3PR84MB3580.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:48:30 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 16:48:30 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v2 0/3] hwmon: (pmbus/tps53679) Add TPS536C7
Thread-Topic: [PATCH v2 0/3] hwmon: (pmbus/tps53679) Add TPS536C7
Thread-Index: AQHdRTIJkLwglEAayky0A5eEL3VsUQ==
Date: Tue, 15 Sep 2026 16:48:30 +0000
Message-ID: <20260915164823.160977-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV3PR84MB3580:EE_
x-ms-office365-filtering-correlation-id: 2ff6b292-fa73-40f9-70a4-08df13492c45
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|38070700021|56012099006|6133799003|18002099003|10067099003;
x-microsoft-antispam-message-info: 9RXzYRq+KH+qeayvGoUAKpsc+q8GGEYxO6DBpAdspNwnScV5+K3YmzyEVLWzvFY/di39MqttSRM8EzCAFr7327lCW9gMhFOTuPxmz8Ksx6/5VgEkqQzAeZc9IA9bO6LtqA9Jfy4PNGQGvEgPuNKybWzpWSylrwVZ4eEJ4g4+9Tk1Nv3j67dFWZ0wehB3Yq8zZOXsIv6i+5yEFk2w8ZCYoxo8MNKVhJrBP5rZ55JiYy2wrO2IVnf8UpcrWsDcROsRCbYiHV/N2g3GW/wBS53Lxr+Xl6g7BXci+YH2fbl7VV0DaM7nelghpoPZPyDTri/KMFJ6g+HoK7XloniME0yTkLmKpp3bgqSRmaDVJAwImmWKg6/XtRGVXGS0f5qTXB7GmXhac1o4Mr9dy8QS+BcXPTpu7cAI8wVqCuSaOspZgYWJwegv58mAa9zxNa/30AWW6WCWpedCaF/ec7PoqBYMN9ip1J/+VSslD3qc2fF9sGWMPvvb/QPkqP164+qdsZV2oh3ZwkDsh4ZioqahNY9AXgL9M/eyN1TZ9fVDqv69g1IlesjIhziWDYr44+Ffwthr/Uw8brR4MkllHtzJP6i9uRLv2PwEO3Jaj9s6ctZ/u1R/4WgQn8Ig8fcnHe0TRr5+BQb/MV06zLRI4EgcMKji7YwT2EEcrMtAOBiztaHzLI80oC9mdvT+nRJR+MSvoXUhzwfAofHJNQtRrvVrJWgzHkpgiKgGJ9skJMLA71onv6I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(38070700021)(56012099006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEE5SC9CTUR0RlRIaDh5L2NuUmZGbm4ydTdOZEZpdGlLT3BTc0J1eGlvT1l3?=
 =?utf-8?B?STNOUVEwdm53eDVCQ05qWGQrcnFGaXRaTWJGdkp3VzJad3BiSkExQWRPZW0v?=
 =?utf-8?B?elNyVElCYlJLckg3S3RJZjArVkpKaCtQWUlDMy81SUhJMWhyMjAvbWJVSHhz?=
 =?utf-8?B?OWFZaDVlNFVJUXBCR2tKdjRMR0tqbUFLTlA0NlZHVThHMDRaUkJRNklMc0c0?=
 =?utf-8?B?TW9TZENXQWtVVWEzNnozLzlTcFZ1L2VtVmVldkYvVDl6dzZuMmFWOHlzdWh2?=
 =?utf-8?B?NUwrRCt0cnQ3TFUwbmNHUzlUNVZnOWUrNzZaSXV4RWhRY3VpNFN1MVgySURk?=
 =?utf-8?B?b0orUDZVUTRWT0ticjdOekFDanFOaVRyV21DeTI5MDU4OEl0c29oeklja3JG?=
 =?utf-8?B?cENXZVBzMThXSlVBTnpTTTlVRGZaWFI0anVMSG5za3BHY0dQZDdOalBDUVR4?=
 =?utf-8?B?c2VSR3B3d3Q0THMzelJORTB6dFVOUC9JR0xTdjkyaUIvMGFYcjVyS2hPZlBm?=
 =?utf-8?B?NHdVL2JHZGdHQTU5OHRmYVRSZzRSUmU1TmtjVkpaREcxVWU2TG4zanZML2s4?=
 =?utf-8?B?Y2JWWXZxMUk0dm03NHoxclVtQ1VpU2hnNjRUOTJ6cHhUT3FaM0RtT2hTSUpG?=
 =?utf-8?B?a3ZEWlhXSzlacmpHTGtoNHZGSGF5S2NmYk9xdHloQVZ6UWpqTG9UYnI0NEVt?=
 =?utf-8?B?WGNsQWJCQVJ3cThXNmNtN0VuYy9FZWZHMjYxSld0YWZ2SUJyTEg2Ni9FazFX?=
 =?utf-8?B?dHgyTk9PSFdCeDVGeHk2bDhLaXE2aDFqZnhzWUxISEJvYm95QU5OdURCQWtO?=
 =?utf-8?B?a1Y4OXQvSlRrUXlTTkExMWNsYjdBN0JnSHpzdUc2Wno4Um94S3Z0QXNuMzdr?=
 =?utf-8?B?L25GUzZvVXR0YytnSnBYak96YUUxcHZQNTdib1RFQXlYdkFvU2pGSHNMMGd5?=
 =?utf-8?B?dm9QT0MyZGh6clMzQk5YLzl4aUt5K1dNSGJNT29vRnYwT1RzdnZWSGF3d1RW?=
 =?utf-8?B?dmdMQzN2Mng5WllzOTNvenJxSXYyQWlMNm14MCtheUZQTXp2b1J1TFpRdUll?=
 =?utf-8?B?SGlpTW5PWUZ6cU8rRndaU3RxRGNTWHBDdGNFNmJvYWpVcFJJblExVjRIU2Fo?=
 =?utf-8?B?LzBHUlYyYmxEcWFBaGZTVG9LbkJVZmJKV3FUcE5uTDdSVkZXVTBzOGc5WHYw?=
 =?utf-8?B?emFLRmo1akF0WW5wNmJBYU50SlNhYlUvc0dtK1VtcTMxZ1VCTmRFbjV4cHRi?=
 =?utf-8?B?ZmlVekpXTnFEOGYyNW81LzNwZGplaS9tOEpVV09QWDU5M0ZuQUh2Syt4akg3?=
 =?utf-8?B?YVV0enFFdDgrWjNibHlXSUl0UG9rbVVWQnFyRUNlWW8vczROQXJLUXhiRWFF?=
 =?utf-8?B?MEExdmFkb3ZDSml3M2RrNVJqd0N4eU96dE1LRVI1NzhuM3pTZ0toOWdtTStM?=
 =?utf-8?B?UnFoaHRPblhncDJlVi9vcitDa25IQXdWc0M1N2I1M2xldVFyemppaFFtNU9F?=
 =?utf-8?B?alFneEVuemZNTTZSZFhDajMwR1hMeDU0R3R1S05rbmRZYTVvYTQzSy9peEhK?=
 =?utf-8?B?c1EyWlRzUmM2TUN1WlMrdkwzblJFUVlwUXM3cWdvMy9GTG5sZ3NRb0ZkMnpz?=
 =?utf-8?B?WW9Eb2VnckdISkwrV1ZhaE5uNTduOEJDSU1WQjdlSGxYV1VQVGhkRHVNSWpj?=
 =?utf-8?B?K0Z1VHZBd1hZMTFCbDZCNkl0U0tHU1kzTUEzbkZzbkhQWEh0OGpxWTdQMGtj?=
 =?utf-8?B?eEZUWDRmMHBraW9kbm5nbFp4OVVLUXNvTEdXTk5naGZya2ZqOGNxY3RFYzVB?=
 =?utf-8?B?THBvRlQ5azZyVWdwOVJxcU9yWW92bEJ3dVk1aEo4c3ljZFVGV0ZjdnlrTXA0?=
 =?utf-8?B?Mi9lNExkQkhTTVUvMUJ1WVhxUVJxOWtVWUkvU2JSNDBDWU4zeUZzd2lNRkEr?=
 =?utf-8?B?V21LYk85MkJ5RC9OT2drSTRpRFhUdnZIaXVCOTVJczg5Wm9XbWM2SVo0aXhP?=
 =?utf-8?B?cjE0K2U2UkVmVDFGd2RKT01XeDhaQ2srcXRDY0FMOU1TRGRsSkZXZlpWVkFx?=
 =?utf-8?B?TFI0YjNoZDYzOTZzcFhOdU9CdHBpWGFQZFVqSldvR1VGWFVGdWhhdTVyQ3hn?=
 =?utf-8?B?ajRmeFd4clJ4WVR0Ull4YW03czNZcE4zWE9Eb0hKZ0RlZFloZnZLK05MUzB1?=
 =?utf-8?B?V09Ud3JmYVJDcGxDTmxSemlWa09pcHZkRk9YYjRvSUxjNXVYV0tqRVFFdkxX?=
 =?utf-8?B?ODdpRWY2OEZLdFB4ZjVvNVQ5ZmdObk9XbytuRGRJK0svU1dPazR6ejQ0dnI2?=
 =?utf-8?B?anU1RDh0Sk1tMm5wODZyb1hvZHd4cElJSE9LQ1VpTWF0eTFrbDFaUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2xHZn8ld+jzCAd0usdVYAjDj9dMwcI5TjEj42RetZnTlc9W3iop4w3wKMVadkN4dXq6i8iHthwQWdvJFPE5yRpgTh6Bbr4jnOB3q9alOOqAw1uYr8t+2zoYdJyrwOgB2CViTP+Cnj5bnT3fMGv0kMqiRRMS6h8bqYQBrAjyraOcPDMU3jxkPJz8WkErQQ5cfjSW0cgBHao+ir9SoDdkg2yk+P8efbyVPVUUl0sukv3P7coiJ1NHT1TK+qm9apmad2SyKlwwr8NrxDVGcNtztbSya7mIXC8/tYs198l1ap2gRc9oXlPc0EiDNivaUH9t7CMCBbvKKr4f6gtIIVqWhvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff6b292-fa73-40f9-70a4-08df13492c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 16:48:30.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xg2dYhAayNaD9GVMVAVAFLXJHoCWJ+um20VL/CTYwLszRRhq1MOaNfW4aMuSIpUzVFFlHGGBuWu+1wUJn/AHsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3580
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fJWsTpae c=1 sm=1 tr=0 ts=6aa976e3 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=OUXY8nFuAAAA:8 a=EO7-M4CBLjoC-5E71HEA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NSBTYWx0ZWRfX+wHX1W6Ex4EQ
 12MPKS70TYDyRpyTyPhLjemUM7beCWf13X+PtsXPRipRadgZMsckhTCYGuVpjj2AWo5RGJMUmTj
 wmW/cjc0RJZPor/j/I/GFfEGGtLK3II=
X-Proofpoint-ORIG-GUID: pvmD66gvF7bM4i4yZ5t94XQvg1G6I8jb
X-Proofpoint-GUID: 7lz4FHUbQYxqYuPzCgUXN2IxvPoKBnqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NSBTYWx0ZWRfX147m9fNFXwJV
 B55gbkVu6v9GJsD0AtaobaiIQmVih0nnrKq1W9pDQ1iO2YRVjce+Qy/pN1Las0404VUjpKBx2yB
 PMD657uldMflpcsL5X6isKr+pNMb6qR/3NQP+oLNSkasVkzXF9yVRB1Opac9zAeEKoDJIxL0YwO
 NJ+u+XNx+KsUAgcJ/9YAhuTpkK1yYy3wb1/1YM8WvmdmujRj08TbwCNuBseWTzs9qLhs5roiSpt
 okAuh6qR63/D+Co/h4A7svZWE+3nsPTsAsSohlawGp386Hplcdd6w7nAfzK+UR8qsOIHmCcVZTa
 bqDvcTnkjSMaSGINqC0KXvS+nP94E07zE+EpVfvEQER7saOA8Oa2YIFQ6ARaIBxVd6IS8prvTau
 izm7mTyE/WP/A7wtu0HXSmrB7o53Y1wF3PkOkdzkm3LQGRJ2jJXZcw9FVbsGxdr5QD30FzsRbTl
 NXJrAJ9UsCeNMY+Jhng==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150245

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzZDNyBpcyBh
IFRJIGR1YWwtY2hhbm5lbCBELUNBUCsgc3RlcC1kb3duIGNvbnRyb2xsZXIuIEl0cyB0d28KY2hh
bm5lbHMgYXJlIGRpc3RyaWJ1dGVkIGFjcm9zcyBhIGNvbmZpZ3VyYWJsZSBudW1iZXIgb2YgcGhh
c2VzIChOK00sCnVwIHRvIDEyIHRvdGFsKSwgYW5kIHdoZXRoZXIgY2hhbm5lbCBCIChQTUJ1cyBw
YWdlIDEpIGV4aXN0cyBkZXBlbmRzIG9uCnRoZSBwaGFzZSBjb25maWd1cmF0aW9uLCBzbyB0aGUg
cGFnZSBjb3VudCBpcyBkZXJpdmVkIGF0IHByb2JlIHRpbWUuCgpQYXRjaCAxIGZpeGVzIGEgcHJl
LWV4aXN0aW5nIFRQUzUzNjc2IGJ1ZyBpbiB0aGUgcGhhc2UtY29uZmlndXJhdGlvbgpwYXJzZXIg
KGl0IHRlc3RlZCB0aGUgZmlyaW5nLW9yZGVyIGJpdCBpbnN0ZWFkIG9mIHRoZSBQQUdFIGJpdCks
IHdoaWNoCm1pc2NvdW50cyBjaGFubmVsLUIgcGhhc2VzIG9uIGR1YWwtY2hhbm5lbCBwYXJ0czsg
aXQgaXMgYWxzbyBhCnByZXJlcXVpc2l0ZSBmb3IgcmV1c2luZyB0aGF0IHBhcnNlciBmb3IgVFBT
NTM2QzcuIFBhdGNoIDIgYWRkcyB0aGUKY29tcGF0aWJsZSBzdHJpbmcuIFBhdGNoIDMgYWRkcyB0
aGUgZHJpdmVyIHN1cHBvcnQgdmlhIGEgc2hhcmVkIGhlbHBlciwKZXhwb3NpbmcgYWdncmVnYXRl
IHBlci1jaGFubmVsIHRlbGVtZXRyeSBvbmx5IChUUFM1MzZDNyBjYW4gZXhjZWVkClBNQlVTX1BI
QVNFUywgc28gcGVyLXBoYXNlIHRlbGVtZXRyeSBpcyBub3QgcmVwb3J0ZWQpLgoKVGVzdGVkIG9u
IGEgVFBTNTM2QzcgaW4gYSBRRlg1MjMwIHVzaW5nIGEgTGludXggNS4xNSBiYWNrcG9ydCBvZiB0
aGlzCmRyaXZlcjsgdGhlIHBhcnQgd2FzIGNvbmZpZ3VyZWQgZm9yIGNoYW5uZWwgQSBvbmx5LiBD
QVBBQklMSVRZIHJlYWQgYmFjawoweGQwOyBibG9jayByZWFkcyBvZiBJQ19ERVZJQ0VfSUQgYW5k
IFVTRVJfREFUQV8wMyBmYWlsZWQgd2l0aCAtRUJBRE1TRwp3aGVuIFBFQyB3YXMgZW5hYmxlZCwg
d2hpbGUgdGhlIHNhbWUgcmVhZHMgd2l0aG91dCBQRUMgcmV0dXJuZWQgdGhlCmV4cGVjdGVkIDYt
IGFuZCAyNC1ieXRlIHBheWxvYWRzLCBhbmQgYnl0ZS93b3JkIHRlbGVtZXRyeSBrZXB0IHdvcmtp
bmcKd2l0aCBQRUMuIFRoZSBzZXJpZXMgaXRzZWxmIGlzIGJ1aWx0IGFuZCBjaGVja2VkIGFnYWlu
c3QgaHdtb24tbmV4dC4gVGhlCmR1YWwtY2hhbm5lbCAocGFnZSAxKSBwYXRoIGlzIGV4ZXJjaXNl
ZCBieSBpbnNwZWN0aW9uIG9ubHksIGFzIG5vIHN1Y2gKcGFydCB3YXMgYXZhaWxhYmxlLgoKTm90
ZTogU2VudGhpbCBNdW5peWFwcGFuLCBjcmVkaXRlZCBpbiBwYXRjaCAzLCBoYXMgbGVmdCB0aGUg
Y29tcGFueS4KCkNoYW5nZXMgaW4gdjI6Ci0gQ29ycmVjdCB0aGUgc3ViamVjdCBwcmVmaXggb24g
cGF0Y2ggMywgd2hpY2ggdjEgc2VudCBhcyAiW1BBVENIXSIKICBpbnN0ZWFkIG9mICJbUEFUQ0gg
My8zXSIuCi0gUGlja2VkIHVwIEFja2VkLWJ5IGZyb20gQ29ub3IgRG9vbGV5IG9uIHBhdGNoIDIK
ICBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCgpTYW5tYW4gUHJhZGhhbiAoMyk6CiAgaHdtb246IChw
bWJ1cy90cHM1MzY3OSkgRml4IFRQUzUzNjc2IHBoYXNlIHBhZ2UgZGVjb2RpbmcKICBkdC1iaW5k
aW5nczogdHJpdmlhbC1kZXZpY2VzOiBBZGQgVEkgVFBTNTM2QzcKICBod21vbjogKHBtYnVzL3Rw
czUzNjc5KSBBZGQgc3VwcG9ydCBmb3IgVFBTNTM2QzcKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy90cml2aWFsLWRldmljZXMueWFtbCAgfCAgIDIgKwogRG9jdW1lbnRhdGlvbi9od21vbi90cHM1
MzY3OS5yc3QgICAgICAgICAgICAgIHwgIDIzICsrKy0KIGRyaXZlcnMvaHdtb24vcG1idXMvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9od21vbi9wbWJ1cy90cHM1
MzY3OS5jICAgICAgICAgICAgICAgIHwgMTI4ICsrKysrKysrKysrKysrKystLQogNCBmaWxlcyBj
aGFuZ2VkLCAxMzYgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6
IDQ2ZmRlMTA3YjRlODgxZjE3OWJmMDJiY2E2OWQ4YTAwMjA1NjFiM2MKLS0gCjIuMzQuMQoK
