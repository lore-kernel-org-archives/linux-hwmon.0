Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20334D911;
	Mon,  6 Jul 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325093; cv=fail; b=PhjGx1sCtumR5Eg961fnU5eBxJG/HjUL8qEUuotscvY7rxvfugeGgFshEfWliiF0tzuCbKBH4kLbRoZ8cDyp7GlGvyGTKP+1ABvLjxEycNMoyZPsciM+m0V46Kl3UaDGfvf2okDW+cBSq6i9QIUwL/5iEyHobGWIFJw0ksD9CDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325093; c=relaxed/simple;
	bh=DeVhNNLQncgWuE0YrqPJChsx7qh3pAzqgsuwDTFIYl4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZnGXatZ8+w4gQ7S5hu1+ztbzd1vCBU4zXD+G0a1MqlkVN/hvM/01d2rjmiY13p2fJN/clfneazxoJABcsEgVnkIyCrN8sNJkOiJVibgApdJaVJV88kQsBU0SpJ11o0rnjI1IAyqrL84SZpyHEUTs2ZsrR4z+j7ZWlSpJAoDHjDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=cHgNAr3j; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="cHgNAr3j"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664r4xP3541002;
	Mon, 6 Jul 2026 03:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DeVhN
	NLQncgWuE0YrqPJChsx7qh3pAzqgsuwDTFIYl4=; b=cHgNAr3jIyYuEmrd6U71m
	8hB2vwWorLeo9yV1DKfETuJFo4d07nJ6PLYkrm2yRNby9SlJ2ahHjntlO+DCghNU
	rTRnbjMSjbzGrSRHyC6plZBJdzW8qX6cZr7AWzA5ELB41abRuWwltT7mJqxbfQqI
	v4nVUnoeZACIgG2ZEdCM4+o0EqmO2rvEkXrwkhQfAOPebIYgCy5SIgd5suV++2lN
	sKjb1w5KfS5KnwluvB6ytv9y8DLmbFAH3Pz86NovEB7eQkR40dxgwJAYybBvdQsA
	xzRmAEruSXAzxDQ28+ofpFPDF86R4tdkpWREws2hva5MNeX8+p9+ZG/fR2YdupAU
	w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f85qq0bgp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 03:13:08 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adf26XanBNJ2FwweF6YRLIPgeRVDQnE+hlUN4Ytkl8+yz9Q75YS6XeX9GpAnCrIvzmY8ZEMYCz75w5Ssl7F8MMU4z6FbBC58ez0qo2qRV1xHeIzGm+fgTOGUiA+5ZMtAChLTUeasdHxcOSi+YxL8waJJzRzBzEvqfSG5SMX/SwXUwWX3XL/PUNzWXK1AyYETRAAqpo9p/6b/EwVBv2N569kta310LWOJjW3X5hbIGuzr3eOsyVv3xtqriUiuGYcE45B2kQQYV4ZzYSelwgWgZxyTbwrwexsWOIu+XBZ6/QFctefR7PECpryW59+w+RpcySvjJh+GjwliepxNKi3V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeVhNNLQncgWuE0YrqPJChsx7qh3pAzqgsuwDTFIYl4=;
 b=PamWMt+obrT+SPMLVWjWuq3jBrOTnxQb+k6Ib/9kVdbVWV64Oux5t2sydB+ajLHPpckpkMeYKfmKNeg69FGJzXLlzeDqc/hQxBuvlQhJk5xsR04TUnLIGfi3oH4UM0ka3gde5DDe3tnqBWTt8heGNHv8QlUyJZ/xCoibX8ZVAGO0thqstzudBS9yuYWhkXC2MV5nKNXbJCzRXTr4U2y/C714S4Ux4qwK6PO7lYTf99RRcbCCjpDtQxeVqIV2QMylnbSKJtDH2QYXhbybsdbsb2Lfuf1pPFueaUFtII32G2aUzBL0Z+AGEUUa9rk9VOjBrC2+JuEz6NgRVlBJclUWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA1PR03MB989319.namprd03.prod.outlook.com (2603:10b6:806:4f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 07:13:06 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 07:13:06 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Thread-Topic: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Thread-Index: AQHdDOxxzu1e3Sp4mEyeW6BY1zw6brZgCpgAgAAEpoA=
Date: Mon, 6 Jul 2026 07:13:06 +0000
Message-ID:
 <PH0PR03MB6351C4B212D2CCBA3F1BF113F1F12@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
 <20260706-neat-perky-malamute-7518b7@quoll>
In-Reply-To: <20260706-neat-perky-malamute-7518b7@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA1PR03MB989319:EE_
x-ms-office365-filtering-correlation-id: 90d5cf35-623f-45b6-5998-08dedb2e06e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|38070700021|56012099006|11063799006|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 krowHQCOxTO3KFBB2m/Dcu48otLwuMqybWRbWov42q0pHyCaBVfmrJZ6TQwlBqWr3gRGGXNoa3e7aw6zBcMm/kT6ZXUHlaLjLZoQiGVjzAR6C4R4CzvQ7NdOz4gTFuR78K53TabqEnmH0xU/6ToJKLqaNPp5d9q6Isfui0E2vjeJXbGe2gm742KLMD4XjERVkLG+oFHvwU/HfX9YUl7kfoaIxd+vYgA+xAfmFvS67KWweF9UEQsAtJ4lJcvuA5C+1cndAxHHn7QZ3tZAJJKU8XaSmK66IAQzx60pOd9kf0FHgIPNqLT5P3X27HDAfDY4OefYhst33nGk5lab0WD/YxTicqR3XIclzVgI3U7Qa3YVF+bTto/fPcajrkbyGzlI4MIbRQ467gejqL3u/rT18CcS+nAvZD0YgYikPEgr0c2+3yyU1SUTZXZhz7FNaSZ8zip4EhvGRQK+3XbTKl/IkWYBtDxyhh2dJX7wZ5mNFQpcMm86wIWFi/QYLlwSm1oixn5PolO4vPIRUECbRKOZ40rvepHk2NjmX6pEymVM6gP1gDt1lzTy7XSIZUduxWNKyA80O4ecMs4mZEDeSc0jIkk18s0/l5U2e3Ci81CTlbCf9NQqdKa/IjjNu9JYKOc7vHN0XPbGKbT6oq3xX+MiBdyZbFCxZbyEbuxP7GxVNT9dcGMJmX8vKu2fTyzxrAXUtqjNonDYwhe5Ygj2mt5CaHzuugrk3TNlQCqLH5YLiG8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkJsYm02Yjl3NTAyQTVRRjBIcURqMWw3Rmh4RldmbGFzRG5hTHIvVjlEdTFL?=
 =?utf-8?B?TXdpUnBsUHRwTlRkWXY3NlZQa2E2RzZIVjNyMXR6b0dwTWRVZGZNUFZSZHpy?=
 =?utf-8?B?dnNJYXFGOG9jd0U4WmxzRnpla09ONnBML0ZWRnBoVks4eEJJMmFiZU5NM1d4?=
 =?utf-8?B?enp3RmxjMlVueFc4NTdMTFBha1RGeEhCNE03dytkdW1od1hxcDM4QmNZUUlh?=
 =?utf-8?B?T0Q0VTNlQ3BhTDJJdmQwMnVqUnZmZnRtTWNVd3h3ajdqY2ZpVDc1OEw0disx?=
 =?utf-8?B?ckhPa09EWlFmRDF1YWR4N2lHcThmeXhVdlVRb0xwdGdWOWhKRlkycWlMSnJS?=
 =?utf-8?B?aEdwcFduZkl0V3hHTkttNnlPMFZ1ejVVSmljd2RSemVGVE9HdlViYkxCN0dE?=
 =?utf-8?B?RjBPcmRTYS91QktBZXBBSFhuUFpNdWJTWFlleGJNT095OHkxaTNXVzNVdHB6?=
 =?utf-8?B?OVVkQllGdEEzTEdzaW9YZHlxM3JQZlZYNFpPSmpmbU93dHhTUnY2ZU9KYldJ?=
 =?utf-8?B?Um4yeU1acWZEN1hIdStRM1hxWXdrWDIxM0dkZFg5NjRoUkowMXB2dTdpdTdy?=
 =?utf-8?B?QUE1NVNBRkhkMzcyOENSYmF3eTRYc2MweFhDbWhQdDlncnEvR3NmL2xJQy9t?=
 =?utf-8?B?QWFEaC9NdlpVenl0UVdMb0FOTzlhKzFHajlmRzU4VS9HNmNxKzB1RHVoYklH?=
 =?utf-8?B?MklIT3MzWHJDUUwxa1IybHBaTXVaN2hJeTAxZGpkay9TbFhNdzJHa0NLQ2hl?=
 =?utf-8?B?RTdaVHIyUlFDRnVFUi9jVXpEdE1xdWZ1c1hjdTk1L0pCbnNsM1NiaDkxa1Z0?=
 =?utf-8?B?cjVwd3NIaEMvREtldU9jSDRNUmN6U1FwMndFZCtnaWhmMGwzTzZzOTFFN1J5?=
 =?utf-8?B?aXcxOXVEQ254Z2N3V0g5WHdOWDNwVE9KN0E0QjQ2dWNySkRGcUVzZTNtY1J4?=
 =?utf-8?B?MVJXMk0vQjNKYVlSOXA0T2d5SzFpYzZLTnBBT1ZZdERXR0tvOVVRQVBCRnBG?=
 =?utf-8?B?Z2lpN0RVK0g2SUJpNlJ2ZWJZK3FPcEo4M0U4Qy84anVlZUpIcjhEMGUzSmcx?=
 =?utf-8?B?S25YbGU5RDhZVWFFRUxYTXF0SmcxOUNzS3k4b3E1a2ZNNThrZUw5ZFAyWVF1?=
 =?utf-8?B?ZngzVlhpRW1Vc0M3RndKMi9MWXNQSU1kZnVrZ01WWm8zemgxcURraWxmZm1D?=
 =?utf-8?B?d1hwdE9ZZkM2K2RjNUtJaHJKLy95NFVQNXhDRmJkeVRzczhsTHAvT05UeEQ4?=
 =?utf-8?B?aXJGQlIxbWdielFuMXZoL2FacXh3UytGWGlUZG05VTVPbjJSeVNsejJ6NXc3?=
 =?utf-8?B?czZoUEl1YUYyYk5jTTM5Q3EyL05ZVklsQ2luaVEwSk5iL2ZjcUZESFNyN3g1?=
 =?utf-8?B?bWZkYk82c3J1TDJwcW82bGdTWUlyZ3p0UCtzamlRNWI4ZnNqeXRhenhFY3JE?=
 =?utf-8?B?dmpHYUNLWE1sWUZtZnA2NWYvdXpybVpYN0k0UnBGcGw1ckk4blNKU3JBTENF?=
 =?utf-8?B?SXFRby9tL1k4YkFpNU1TUTZ6L2ErbHZIQVFIYVZhYldiVkcwbG5PdUVCVWF5?=
 =?utf-8?B?bVU0dlZidldHOXNJdnh5YklRR0h5bjlrUlZweEU0QUxFTXk3UG9HNG1BSFVl?=
 =?utf-8?B?Z2t5Rms5N0NxbktGWVB5M0kyNm42OW1oWE9HWmVPcDcyYXgzQTVUVlFsZS9m?=
 =?utf-8?B?VXdjV1NEcmlLaFBKVnRueGxGczVVeHVUN3U1Uk8rUFhGSTVrUGxvcDlURmxQ?=
 =?utf-8?B?UnlDSVdtREgzMjArV0hnSS90R3loZU95T25saDBnWXdHVVlTT2lqQlZ6RFlJ?=
 =?utf-8?B?ZUs5Y0tuei9HazZaWitKcUJmS0lHM2Y1Q2lqaGtwUGNES1ViKythQ2dVd3R3?=
 =?utf-8?B?b1VJMDRNVjFuMzhIN2svTGM2c2ZJR2JXbnBZMitSVTVEN2ZiYmhzR29ZYWpB?=
 =?utf-8?B?aHN3S3ZqMkdYdEMyVmR0NHVwY2U4NzFTY2VzMWpqRkRBakR3Nld2ZTUvYmpn?=
 =?utf-8?B?a2xsNGNmUGUwWTNrdG9xQ2RUcm9GOFJPZ3dqbXlhTmJzeDNPSGVoNm5hZ1E4?=
 =?utf-8?B?ZE9wbkFtRi95ZlErY0hTd01WaWNpbmtsTEU2TWtZcW5hWC8yUzVwZmpVeklt?=
 =?utf-8?B?RjdzSElKVlFJTTdmTkNVZkp2SFNkOFBXSHFYdzJaeEtscTV1Zld5VXRhWnp5?=
 =?utf-8?B?QlZDckVzMGROeU1lc05QRXRjOE4rSXNmVFlJSnNHTHliTFB3WnZXQWIzcnpl?=
 =?utf-8?B?dm53OHo1K0xLWmVTTmRoL0lpSmJsNHN5TFY0MktvN0ZGMzU3YUJLempnU3Np?=
 =?utf-8?B?VlUveHZNM3pzRXNEaWlNV1V1RGF2NkhlNkMyWWlJQUF2OGw4dHVsK1kvcWFn?=
 =?utf-8?Q?ZZwJ2HKbcERlMl0E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sR06jQVX5tKSqs3TB0dJK8A61z44VkQlfekzUfXgY+LDH3LXNCBcU+dE4wqHzY1eyr60YtrzeP3sy3wHYkeuLHF1d+1WXaakMJg/QAVqXr8gn7404rGvkJfltu26AS9tLyIa6gqXU/cRtrcPajL8o6xC9u7uDutfrE732cTLubIYlyMXNE63wn4NwJWs9uKSAfqAxxZb07PoXOg6GzMM3YFz6DqugHHocxd6nQiJaBSAA9Tt9wpDAfecUevfUpGEKlh0RTbkq4WM4r6S5SD/SFBmIG2ycJFfW2BB7tAB2NPG8oUJg5otxBnU1uhJ5sWyF0uunWNN/7aCdm95vzMlOA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d5cf35-623f-45b6-5998-08dedb2e06e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 07:13:06.3072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cWDwHe6hNTWJr2Nfb/EZ8oCtZ4L8mvLCqmDIfohbBqcJw2xmNa2jvYpyKaR2u44wHfJtBiHWUnZTGVyqw0hNAE45r79dahEov5GyXp96Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989319
X-Proofpoint-GUID: 9YN68pW6-IgAeeid930bK0sbqRCTBFbk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX3RTuX07XIRIu
 BI0T1jLy8a30yGi/XgatL/SVKIr5W+9A0FDygt2WrBS9qCZfnGFQVr29ygCe0UmVa+i/HgZscBI
 4rFJjb2vc+OLD2fEEWaH6b9IMnsPPOSOxVD4KAy2Xz5GkTv0z4jd
X-Proofpoint-ORIG-GUID: 9YN68pW6-IgAeeid930bK0sbqRCTBFbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX1xbTXmIpGqsF
 BoeJaZaqE8Bok8vGM+Mzs766qGPI7mOF2qtWrgGnTE4aLUAAr1z/dpNZ36Wp7zMk8icvSpUMj85
 sDA3u/flS7fllKLTKF6BzYalVEprMSvW2LKkuxIhwNCFshaEXEPqR2+V4R8qwOs8pNomx0thLUM
 5lmHSx/Wh51Yo4c7KPhh5WVBXtK3yTnodUugpBxfC17nk0tyvxt9rerGQvClJ5TH+JinUSslylK
 V2U7L++aicoHTYAU/hm7LhNHh4kRKqW3JPZou3JHnje5fsXsOyYl10zDHGRX8bDqrXAOaU6Gv5v
 WZuS0x3gFJT2KZCxDhHGlYOdwcjppv1J9kr0mEu7WvNnakSFS6YzRQT1/TK/JPn3NGdvBBM/4fu
 ks//YLo8fFIqbita6xnP5uj14cVgJZ8R1cDZDNlhbX8AZ2ho82y7z/zeUDLreDrrWDQvl1js5B5
 OFwPKLr/xWt0EBBJ9CA==
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=6a4b5584 cx=c_pps
 a=bquUzJqYOqw1EpBvECFzMQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=gAnH3GRIAAAA:8 a=JCnp24ZLSXO5qFVWFJIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070

DQo+IE9uIE1vbiwgSnVsIDA2LCAyMDI2IGF0IDEwOjA4OjQxQU0gKzA4MDAsIEFsZXhpcyBDemV6
YXIgVG9ycmVubyB3cm90ZToNCj4gPiBBZGRpbmcgYW4gZW50cnkgZm9yIHRoZSBNQVgyMDgzMCBF
TiAoZW5hYmxlKSBwaW4uIFRoaXMgcGluIGV4aXN0IGJ1dA0KPiA+IHdhcyBub3QgaW5jbHVkZWQg
YmVmb3JlLiBBbHNvIGVkaXRlZCBleGFtcGxlcyBlbnRyeSB0byBiZSBtb3JlIGNvbXBsZXRlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGlzIEN6ZXphciBUb3JyZW5vIDxhbGV4aXNjemV6
YXIudG9ycmVub0BhbmFsb2cuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9od21vbi9wbWJ1cy9hZGksbWF4MjA4MzAueWFtbCAgICAgICAgIHwgMTENCj4gKysrKysr
KysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPg0KPiANCj4g
SG93IGRpZCB5b3UgYWRkcmVzcyBwcmV2aW91cyBmZWVkYmFjaz8NCj4gDQoNClJlZ2FyZGluZyB0
aGUgZW5hYmxlIHBpbiwgSSBhZGRlZCB0aGlzIHNpbmNlIEkga25vdyBiaW5kaW5ncyBsaWtlIGJl
aW5nIGNvbXBsZXRlDQphbmQgc2F3IHRoYXQgSSBkaWRuJ3QgYWRkIGl0IHRoZSBmaXJzdCB0aW1l
IEkgc3VibWl0dGVkIG1heDIwODMwLg0KSSBhZGRlZCBkcml2ZXIgY29kZSBmb3IgdGhlIGdwaW8g
YnV0IGxlYXJuZWQgdGhhdCBpdCB3YXNuJ3QgcmVhbGx5IGEgdXNlIGNhc2Ugc28NCkkgc2ltcGx5
IGRyb3BwZWQgdGhlIHBhdGNoIGZvciBpdC4gDQoNCkkgb25seSBhZGRlZCBhIGZldyB3b3JkcyBp
biB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGFuZCBhZGRlZCBtb3JlIGVudHJpZXMNCmluIHRoZSBl
eGFtcGxlIGZvciB2MiB0aGlzIHBhdGNoLiANCg0KUmVnYXJkcywNCkFsZXhpcw0K
