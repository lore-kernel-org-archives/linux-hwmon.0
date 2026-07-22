Received: from mx0a-002e3702.pphosted.com (mx0a-002e3702.pphosted.com [148.163.133.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE75B361972;
	Wed, 22 Jul 2026 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737058; cv=fail; b=tfdj+AVqAcHhT34rNtR8ABBCiJBVxQ4ZqMnRf7g4OMOrlYE5hq/JQkm89D92Yh7umdQN7AGmn5NmUZztSD9pH/3WJgvwRV0r7Ayuw3ISHRzimHsxmOK6sqT98eA8z9UWWjmrkH10chuxqHhqc7uHVzpI1sv7DDlAiGWGtJa53FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737058; c=relaxed/simple;
	bh=wVsqjAa5fqjiPryFz3PfP6uo0HNwk0Yf3INBMBE7IMs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p6tjZEROuKW3QP3/IjLQ39Py2SE25Ea+hA0da+pR7lr0iNPA8ln8yzkww6AX9XcbyZQBquDiuzbw6vBkrDCI2UntJAgCyqqSgEFN7vfWNaEHcusLrm0Zl9DhqD2AXBm1c3dQg/awQ/yqBmyHyXd0N3b67PodL9nd/JVZ4T7Dufc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=f8DFaSm+; arc=fail smtp.client-ip=148.163.133.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="f8DFaSm+"
Received: from pps.filterd (m0171836.ppops.net [127.0.0.1])
	by mx0a-002e3702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDeMRS3553557;
	Wed, 22 Jul 2026 15:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppsBULK0520;
	 bh=wVsqjAa5fqjiPryFz3PfP6uo0HNwk0Yf3INBMBE7IMs=; b=f8DFaSm+8FI9
	TWEet0+jkJpSkdFIhqre9u+OAfEPr7YjORxgdr7T9YUSI0XeJ6PBM0+TqosfONIq
	heuNloUkmD3bmCpYkMgTUNYTUBvG3qKSqQSZcLiLK7VqGPQQIKERInik5EaC7Vbl
	S6S2jNFZESpUk+oJyd80mG8oWx9y1hk6RMJHNqy+5AbLtdXdMMM3KTcV90iJoLqg
	OzOslWDs6rH1GYW57pp3UFZ+wXZdcsWGsaj5Xz87Wax3iNJOojccEef5Jk+a0nO3
	cgDv6jwXTfN45yos4y1fOCEFiSk/bIoQYQiiQwPETnhy9YqAXtZjF1RsQ8eoWyUN
	iOgy11AWHw==
Received: from p1lg14884.dc01.its.hpecorp.net (p1lg14884.it.hpe.com [16.230.97.209])
	by mx0a-002e3702.pphosted.com (PPS) with ESMTPS id 4fg1pkvjuv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 15:03:43 +0000 (GMT)
Received: from p1lg14881.it.hpe.com (p1lg14881.dc01.its.hpecorp.net [16.230.19.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by p1lg14884.dc01.its.hpecorp.net (Postfix) with ESMTPS id 03A10817575;
	Wed, 22 Jul 2026 15:03:43 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 37BE8805662;
	Wed, 22 Jul 2026 15:03:42 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:03:40 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:03:40 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 03:03:40 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOD9o+ehDmAvTl4evyUa3tJgvQyGfUcCdHGL/gNwmDU0Gnck58m6t4JcP1+ygU2YZjHynklWGj3yT0f5TN5Rl+r+07kZiCsGtjMsJkH6a7HLcitGfoqcBHZSujicIWtvWK3ycyIlr0DDjq9jw0pAtVmII85Teb1O1Gi3HHFxBjbsxEUdntyH2OJl0Fi4e9x5dQ1D13vr+nQzZ3kS/BFs50gsjqS0+p11LU8Te4Pc/dhz+evzDI+P0DbuVHj0HOmGbkNGjQ/CavaDHBiHqO5MU56Yked/uDSZ7tNYdCGNvD0EPs2TrezQAXwv+FM31R457FPxdEJiqw/0gjnpNuZr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVsqjAa5fqjiPryFz3PfP6uo0HNwk0Yf3INBMBE7IMs=;
 b=o9OOkdbdUIdY6iWKBHYUfuk0NdoBIRW1Py7hZDnJmYveevmDIkqbaV5c4DkiG3jHbjjc6AJCzMz/R/NQDzlPjqSe9qjaZHqRyVZ7Xo7C8FYPuOs12dqOXQtvD2UvwgkMFm6ihX4zlrmOEcgMGiGu91ozwlJtFGgV9A7zvrX06M8Y57bVWKkR6h/+GsHszz2i/FT0nM+yJmd+KQoSSbnIixDMDGhlWQIW+XQNSHGPKX/SDW8L+GT2oW2zdQfGSLyjedna1MJPFRhnfre/sLCWws9YeIMxwLs3e/l25PBTDeCcL+Z4DLJfDqiedHb1T9ESr1WNQ6DFYjNAjQemfyKXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by BY1PR84MB3887.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:4b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 15:03:38 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 15:03:38 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdGetG+FiegzNR8UWUAh9SRcIYDw==
Date: Wed, 22 Jul 2026 15:03:37 +0000
Message-ID: <20260722150324.164799-2-sanman.pradhan@hpe.com>
References: <20260722150324.164799-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260722150324.164799-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|BY1PR84MB3887:EE_
x-ms-office365-filtering-correlation-id: 1ea131d0-900a-472c-233d-08dee80268fc
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|6133799003|56012099006|21046099003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: MsaCvSkfhYmGSvtqHrpNJcrwmfHrpbAWQnmlTlWRDbJHYFP2VWwHZmuyDoTZaVSkZeE6/1Ls5E4qrif1/SKI754Lga8NmXrsR5iLpF1QOtNV2kfNQv953aBGwwdhGYL5gmqTgr8KWitYM6H99DX+3b0B7R8Pr62p38B1ruh1aSOeu4MNaoHZcOUHs+XUFY0oADwiZgwQIXTgdJbUVj4EUl7+wHCGC4OVz9ApN8P7xWoO08IZ9Q5r4uteYbliCbEzhROnHhfLjA5fhQiZ1wAEah6Zdh4ektkJYLxx8ncKYggxN/dAL5x2GREhe9CIBhU1JBSI2D/j2P/ozazkgiGgFwwSB0VtCD5wVc0QEfO97tOLaT3HUGdkVGVfC2brW2/AEgNk+TyD1TFEIHA2pWZm8bymLlKEb1iLAAkNxfwV6kP7soPyvUwqd5GXvBWsK96VPe8TkRF4Qc+op4JtnEb+rY6fJIHfnjOsPC+WteH3nfeUClzZlGmrj3kXWxDewWslLj6POdeQ3DnQXQ38Whn4rd2qeWoNR41UBJeZfcwM1q6qNuqu7haRusw/IowMgreUJIxW6/s1gQzo3LXknSdxs4LFmMG0jLKKN/Jz5f71c5n8dnEy57Caw4EMzcMvspVcAtN0KJ9z+gPCcvHL8LVkVYHCxzPgtg+YIeENqCx/I9A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(6133799003)(56012099006)(21046099003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDRaMWw5QWhNcXd3RUI2MXlJdmszdGZrUUZwZ3BGcm10V1pEYXpqRDVPUTA1?=
 =?utf-8?B?VUFWUGp5TkRoOFFZeGZUR3JHQzVoK3d1L0FpZXoxWG1zVUlHMkQ5TjVSVDkr?=
 =?utf-8?B?V3lSc0M0azJob1N6dkRpdGt6MjZYaE5MV3ZWQjhRc3RHcmR0bzRrSnVmMmVU?=
 =?utf-8?B?MjJGOE1XY0hicHZUemMyM1JsV1pPVk82cXF2bkMwUEtvWnlJa3dDNUtyNi9V?=
 =?utf-8?B?QTQvK1FWUFZPeEpIamMvTVhsOW1GSVF0K1Jxa2RPR2huSzY2dGpmQm5JS0dm?=
 =?utf-8?B?N0xpM1liVmpZM1hZaUlhcDh4NVhuREVQV0cwVGoyazJLVnNBM2p0MHJGd2hW?=
 =?utf-8?B?UWJYMnVzVUZVaUhrNmhObmdLU2RzYUplZmlCRDV3MUttSHMveEI1cStaWnVY?=
 =?utf-8?B?eTVwMEVYSWZCd1Ruc1Q4b2NiOXBwR1pKS1dUSjJrd3ZYd1paeDJxZGR6N0VG?=
 =?utf-8?B?TWVTeHFjRHF6eFdZajRITjZCTlhybGZCVUhLVFFpbUV2TGkzQTloNzNWL2NI?=
 =?utf-8?B?SWFvbHM5SU8wcmcvMno5MXJGZzBFWUhPRWhJZlorb3pmNi9acTR1N1JHL1J2?=
 =?utf-8?B?YUdhSVVNSjFWbTJ2WUQzRGczVGdPaTBNNjBnYWZWWFROYU9ERmZOWFZPSk9v?=
 =?utf-8?B?RG85TzJEKzRKZkJtV3VOcTlmVFRrUDZxcUlGWVhCekgvY21Gc0F2dTNKT3JG?=
 =?utf-8?B?bG1QZW4rTzhtTGdSazRxWDhmcDN4RnlTcG9sMlBFUzBiMmpBYXhmZ2F6ekpT?=
 =?utf-8?B?TmNPb1RxT2x5MTlSWkc3RG4yMDg1ckpXUjJIR3gwYW02YmlnTi9sc3BXVWRX?=
 =?utf-8?B?Mzc1cGMwbjZ4L2NhSHlRRW4zSVNSM2FhdEZPSDV1a0EyeURqZkZZQ05adk85?=
 =?utf-8?B?TjQ5cEFUUDM0aXdScmdxZ3Z4UDJvS2VSa0RGVVBVTTJVcnNlNDFaZEtjN2Fz?=
 =?utf-8?B?Nk5WRkRXSndEWEhmaU9sZHRQVmtBcEU1T3hzZnhyRVJwU2dkZHNrbjBQdDVB?=
 =?utf-8?B?enpDZ2tBR2FLVXdaN2xBc1c1S1YwaC9tUTFlY09wR1I0bFNDQ1puOEZVNUNm?=
 =?utf-8?B?eVpiUTVDTkVad2FLLzEwbFd4MUZrck55ZTZIQi9KK3RSVFJNZjVPa3NweHlF?=
 =?utf-8?B?NmNEUWFqdlorNXQzbld0Ni9VUGNNZlUxbXczSmNCb3Nid3VzY3k4bWV4K3Y1?=
 =?utf-8?B?b0Q3emFNQjhaTXdaRVM2aWlYYUczUldsVGtKeXlJNFc1SnNJbHRxR0RIUzBG?=
 =?utf-8?B?OHh3WkJ0MDdLU0ZLb0RrQ3J5Vk9mQzBlb0RuRnN0Tm1aRFFsVGRtREJDL2g4?=
 =?utf-8?B?WTFwaHUrdFNWVlFPaEtWS1BxUHpJQ2h2MzNDeXRMckd1WmhXNFpORVBRNGdL?=
 =?utf-8?B?akhnTU4xR3QvVTBzNEZmaGtVSmRUNjgxeGFFZHF3dUVISklnQnRpNUorRW9D?=
 =?utf-8?B?Snl6dzNwNEhGRmpGNTFwamFIcnlQeDN4NHIrV1lxVFZuUFROSjFCWUlyOFg5?=
 =?utf-8?B?L2ZDM3FtbmpIM3ZFQTgyNEo4MTJ6UzZpM1IvSktHUW9yWGFnRmo5OE1RK1hj?=
 =?utf-8?B?U3Y2MzRMdGFxZm5uUXd4dVh4RC9sQ3F5MUVieDZ0Z3BpT0lTWVl4dG5OMktZ?=
 =?utf-8?B?NmVvL09rZUF0c0oyVnN4ZUI0THVENVNta3dncGdKTVhybEM0YmlISzZBVmhL?=
 =?utf-8?B?clh3S2U2Z0w0YmViWHBDQVpZNVhITFppdFE2cktLVklmT1V1SmNZQnJ4NHNQ?=
 =?utf-8?B?UVlLYWM5dkhmV2ZROC93TUxQbkRkN0k1UWZjL3IvR2FaUEExTVhoMk5lMVVq?=
 =?utf-8?B?dDRCaDgxeXA0eU5HcU9qSUZsYmtqaCtyelRGbk1MaG5NMkZvaVVqTkVhNkc2?=
 =?utf-8?B?c3hSdWkxS0pUamIyaXlGRHlJcVZ3akdMRFlrb3Y3dXJNTDZ0MGRPN0xqTFRz?=
 =?utf-8?B?ZnFJa3R1QWdwemN2aGZFT2xsMXNlSTE0ZUlncGZWUXo3RDZ6aGVhRTBlR3Fa?=
 =?utf-8?B?TmJKcGQ4aW51MjNnNXc1OElaNnRXQ0Vka1dXTWl1ZDQrL0VWaGdPdldUV1or?=
 =?utf-8?B?UGJkRkw3UWxuRnRSem0wOU1nVVNnSFFUbXlTQ0EyQUZja1V0NHV5NUtDR29w?=
 =?utf-8?B?bml2Y0FnSDlOV2p5a1dVQ0R3TmJ2T1ZyZEJ4ZHBTZUFseVkyeUtqa21BbnR6?=
 =?utf-8?B?QWl0bXpFMWdDQUdOOW9uZ1BjUGNDMEk5VU9Yc2xreHkrTHN1VDFocGw2enUx?=
 =?utf-8?B?MTBLSWExUWpWZEw1SmRrdXpORU81OXBHNE11L2pmNUZRTmZ4UFAwTXRUL00w?=
 =?utf-8?Q?HjXMRK74xR3R90CZVI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IwChjVqCfrGinbawDGWlYzFEqBbCAm2FV+VXSzYuYlViE87ufKLGzhuwBHFnr6rTTB9LZocGS3PABMBCQSKZVnVoRzxrqmKfhWxozT7qILI7+Gc6f8OukXQapc5wn5vTyIgpbl0PuISZmWbCQOCFo/ZpLau1TZpHOEjt9IyYDp9SjWfNrRTBn8pCWVKcGcsisfJl25yD0phPxS6TS00euH5xkaGnzztKIPL5a9zwWDDLL3DrvXkxKAjgTvkFuEypqUhoZvzZFdq8jJ51IAlFYpJD94U/oCRlSaU6H/1CctQEDc7XY8ntMHnu2LgJXCv+SOSZ3qGcVOf54dKH5qK4Sw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea131d0-900a-472c-233d-08dee80268fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 15:03:37.9121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxhQ02WLHaVWfS6zS4bKqxC36r5JcRluxgA2kE2HejVKxlmwc+4MjD7L3z1u0fiAtnAd2qjTH6qlPYbJhJSBLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR84MB3887
X-OriginatorOrg: hpe.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpBZGQgZGV2aWNlIHRy
ZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgQW5hbG9nIERldmljZXMgTUFYMTY1NDUg
YW5kCk1BWDE2NTUwLCBhbmQgdGhlIFZvbHRlcnJhIFZUNzUwNSBQTUJ1cyBjb250cm9sbGVycy4K
ClNpZ25lZC1vZmYtYnk6IFNhbm1hbiBQcmFkaGFuIDxwc2FubWFuQGp1bmlwZXIubmV0PgotLS0K
IC4uLi9iaW5kaW5ncy9od21vbi9wbWJ1cy9hZGksdnQ3NTA1LnlhbWwgICAgICB8IDgzICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3BtYnVz
L2FkaSx2dDc1MDUueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9od21vbi9wbWJ1cy9hZGksdnQ3NTA1LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaHdtb24vcG1idXMvYWRpLHZ0NzUwNS55YW1sCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMjg2Yzg4ZWI3YmU4Ci0tLSAvZGV2L251bGwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3BtYnVzL2FkaSx2dDc1
MDUueWFtbApAQCAtMCwwICsxLDgzIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2h3bW9uL3BtYnVzL2FkaSx2dDc1MDUueWFtbCMKKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRs
ZTogQW5hbG9nIERldmljZXMgTUFYMTY1NDUvTUFYMTY1NTAgYW5kIFZvbHRlcnJhIFZUNzUwNSBQ
TUJ1cyBjb250cm9sbGVycworCittYWludGFpbmVyczoKKyAgLSBTYW5tYW4gUHJhZGhhbiA8cHNh
bm1hbkBqdW5pcGVyLm5ldD4KKworZGVzY3JpcHRpb246IHwKKyAgVGhlIEFuYWxvZyBEZXZpY2Vz
IE1BWDE2NTQ1IGFuZCBNQVgxNjU1MCwgYW5kIHRoZSBWb2x0ZXJyYSBWVDc1MDUsIGFyZSBQTUJ1
cworICBjb250cm9sbGVycyB0aGF0IHByb3ZpZGUgaW5wdXQvb3V0cHV0IHZvbHRhZ2UsIGlucHV0
L291dHB1dCBjdXJyZW50LAorICBpbnB1dCBwb3dlciBhbmQgdGVtcGVyYXR1cmUgbW9uaXRvcmlu
ZyBvdmVyIHRoZSBQTUJ1cyBpbnRlcmZhY2UuCisKKyAgVGhlIE1BWDE2NTQ1IHVzZXMgdGhlIHNh
bWUgcHJvZ3JhbW1pbmcgbW9kZWwgYXMgdGhlIFZUNzUwNS4KKworICBEYXRhc2hlZXRzOgorICBo
dHRwczovL3d3dy5hbmFsb2cuY29tL21lZGlhL2VuL3RlY2huaWNhbC1kb2N1bWVudGF0aW9uL2Rh
dGEtc2hlZXRzL21heDE2NTQ1Yi1tYXgxNjU0NWMucGRmCisgIGh0dHBzOi8vd3d3LmFuYWxvZy5j
b20vbWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24vZGF0YS1zaGVldHMvbWF4MTY1NTAu
cGRmCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgb25lT2Y6CisgICAgICAtIGVu
dW06CisgICAgICAgICAgLSBhZGksbWF4MTY1NTAKKyAgICAgICAgICAtIGFkaSx2dDc1MDUKKyAg
ICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBjb25zdDogYWRpLG1heDE2NTQ1CisgICAgICAgICAg
LSBjb25zdDogYWRpLHZ0NzUwNQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGFkaSxy
bG9hZC1vaG1zOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgUmVzaXN0YW5jZSBpbiBvaG1zIG9m
IHRoZSBleHRlcm5hbCBjdXJyZW50LXJlcG9ydCByZXNpc3RvciBjb25uZWN0ZWQKKyAgICAgIGJl
dHdlZW4gdGhlIElMT0FEIHBpbiBhbmQgZ3JvdW5kLiBJdCBpcyB1c2VkIHRvIHNjYWxlIHRoZSBy
ZXBvcnRlZAorICAgICAgaW5wdXQgYW5kIG91dHB1dCBjdXJyZW50IGFuZCBwb3dlci4KKyAgICBt
aW5pbXVtOiAxCisgICAgZGVmYXVsdDogNDc1MAorCisgIGFkaSxvY3Atc2V2ZXJlLWZpbHRlcjoK
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBk
ZXNjcmlwdGlvbjoKKyAgICAgIERlZ2xpdGNoIHRpbWUgYXBwbGllZCB0byB0aGUgc2V2ZXJlIG92
ZXJjdXJyZW50LXByb3RlY3Rpb24gY29tcGFyYXRvciwKKyAgICAgIHByb2dyYW1tZWQgaW50byB0
aGUgTUZSX0NPTkZJR1sxNToxNF0gZmllbGQuIFRoZSBNQVgxNjU1MCBhbmQgVlQ3NTA1CisgICAg
ICBleHBvc2UgdGhpcyBmaWVsZDsgaXQgZGVjb2RlcyBhcyAwID0gMCB1cywgMSA9IDEgdXMsIDIg
PSAyIHVzIGFuZAorICAgICAgMyA9IDEwIHVzLiBPbiB0aGUgTUFYMTY1NDUgdGhlIHNldmVyZSBv
dmVyY3VycmVudCBkZWxheSBpcyBmaXhlZCBhbmQKKyAgICAgIHRoZXNlIGJpdHMgYXJlIHJlc2Vy
dmVkLgorICAgIGVudW06IFswLCAxLCAyLCAzXQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxl
CisgIC0gcmVnCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCithbGxPZjoKKyAgIyBU
aGUgc2V2ZXJlIE9DUCBkZWdsaXRjaCBmaWx0ZXIgaXMgZml4ZWQgb24gdGhlIE1BWDE2NTQ1LCBz
byB0aGUgcHJvcGVydHkKKyAgIyBpcyBvbmx5IHZhbGlkIGZvciB0aGUgTUFYMTY1NTAgYW5kIFZU
NzUwNS4KKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIGNvbXBhdGlibGU6Cisg
ICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogYWRpLG1heDE2NTQ1CisgICAg
dGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIGFkaSxvY3Atc2V2ZXJlLWZpbHRlcjog
ZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIGkyYyB7CisgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICByZWd1bGF0
b3JANDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksdnQ3NTA1IjsKKyAgICAgICAg
ICAgIHJlZyA9IDwweDQwPjsKKyAgICAgICAgICAgIGFkaSxybG9hZC1vaG1zID0gPDQ3NTA+Owor
ICAgICAgICB9OworICAgIH07Ci0tIAoyLjM0LjEKCg==
