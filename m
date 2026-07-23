Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D93054E4;
	Thu, 23 Jul 2026 21:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842281; cv=fail; b=kjE1f1TzxL8djLT3jBMspCCKEJRcV82gcPAK0zlmU5jNxTK/ijad1E/S3Q5sbYpDA4ipTy3Nx9SHEXV6CDJQW+BQ/WVfYskbgrezvtmjesK2R/Dhgg4uHzkD8PKNtbeeKGk/10chp5+ceOYgOprAIQ6vHYvabfl12hSAwK/rTDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842281; c=relaxed/simple;
	bh=0OwzNxG2m9etlzn8ibygGkulxQNGN25P4zAvTAE7foc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KP9LyArqoKPDGZT0b6RLN1sd0SgtUwrrONdLol7q1eUFADT75nN/RyqToNBtDNjGEoHH9r06oAU9FClS8XpBWcaZo8H1DCoKrNHgBlCBwWujwAwTCGLcm9PuWgzGKsQ7VxH4KSky5V2noAmjNUBlL2g4+6I3JmSplj4maZ4NG9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=kCWXdbbk; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="kCWXdbbk"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLLisN281197;
	Thu, 23 Jul 2026 21:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=+l
	YpolpKlkih3XI5mruGXEEdCANp7vrVNhpwKVRWgmE=; b=kCWXdbbkCnoADLjY3O
	uSsB7DexoStshqew+BqfZuOUH4kv/qBXWhqW9rxpGne0whHDXNDnnFVYCbBvyYsr
	vH3mmZRY+tUNF0avNFWMtQpF078IWdXNiCDCMmJyOKMG0Y79bQS4egxOw10Sp6ne
	q4tjgbE9bv4PmL18aPkW+h/lplUn7cVfeRf6QzwQrRJ0fLYhMKHeDt3ozos9rimS
	Vtvj0WOoOjwvDdxx/Z5q0OKz0HUi+9PHnjGD6CJUCLk+7jdJ01OX2ojDKSnKf3Tw
	Km9NRcCqbe1QtfBydKBXx9YhOLpoDIQAp5qXFvluf/LzcNHCQmQsJbKZhihI8eOk
	PJeA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4fktt98494-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 21:31:00 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id D87DB80022B;
	Thu, 23 Jul 2026 21:30:59 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:30:43 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:30:43 -1200
Received: from BN1PR07CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 09:30:43 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK7/gUSjX+s5h/fT2iEzOasCZHbrJWhRE0upDkJjbnYmIv0wXKvs0Pvg/DUBzG/gNakTgexjCCxdFDBDMi2qIIhcrTxiryUuN9MLgJWCmd4RPiJ2zA3FuDjMxZHA4jIpyNpbOU4580m4791iEPV2YRrQBLzcfObTYoR74Fl4jiexk3nEq/tzc5MR4SZQGAhsY0XyDlrGnIMK1iQcgEASw4LHGrX0WSheTR7SynCFkif1kA4mJwneWMtHNZ6Fvmem7eem/TIg2sf0D1DlSrsuyhNMHpPg4650IxScYGH6sgRcoP1woZdpyzncWR0Rx36nykn54UyG5B5bBBk/ftLLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lYpolpKlkih3XI5mruGXEEdCANp7vrVNhpwKVRWgmE=;
 b=S7O9VRqh6bwxg6ricuvG2J/onKQZll0ChtptxDA/IVgLedqlWOJWcpt1iKZtI0tw2m3IwIzbvsNaG309wm0w4dpFfXuYU+gUcPtAiFVdAItyc4vOCS1QNeHz913BBaSKJ5f6dE1VLKhyylWVj3G0hDg3VFIs5HGTBP+sIRy8cSuJuFTJJaW+SE/4dOcKLvf4Eo6SLYU8LnnYMyb2UDyAjK18pfWhaGYA8BhS03VdqaU5EwHPbewn9gM8k87VvzMDcKq2aT60KWfcac16J5HMB2xNDzljwezF99yL+vZJM26YEgOnWMlw7dfPElxrl0DctE6XJLT/OaJE0CvA1ogj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by IA1PR84MB3082.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:3ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 21:30:39 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 21:30:39 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
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
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdGsJ2cSmLk2VFO0OlR+OxGumQZLZ7U/iAgABLYwA=
Date: Thu, 23 Jul 2026 21:30:39 +0000
Message-ID: <20260723213009.220862-1-sanman.pradhan@hpe.com>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-3-sanman.pradhan@hpe.com>
 <20260723170031.6C04A1F000E9@smtp.kernel.org>
In-Reply-To: <20260723170031.6C04A1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|IA1PR84MB3082:EE_
x-ms-office365-filtering-correlation-id: e882dce6-bbb7-4712-7204-08dee901a442
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|6133799003|56012099006|38070700021|4143699003|10067099003|5023799004|18002099003|22082099003;
x-microsoft-antispam-message-info: e52bsLrcOPnDzpCfMtkGdwRRo/bpCnVN/a9MITF5XpEsVeYY4VrMjw6qoFNPj23RdklV6B7wtiJnHpew+0K2r2ouUPJPIkuf2mh//UxfcjsSLIrPiKTnRa6S06kbnLtZxcf9HGtiK6Vf/oR2AMKWheRcnxC/l7WfwuCgwDQJCTd15BRCYeEpus+WiPlfCW2W3GUBMWXUR70HVsQmXA45tPaLMGcdirGHXAIrHUeI5QmHuIwIpDYCzGHB7WDWUmF29XcAK6Y6K6qTu/obPOQnw8wwXpjVskkCk5aEhlM77bRdMa8r1Z2Rs2ykshOg4yGWJNwZgDlxgNbd9eV4kb10W/FrLn73a+S+YtfOrOd+CrMRMY95rEKn6dURbDpK6YM2o8GDg1m+fh6eFL4xUViy7phK4uSpGGOcgD/3FGf5Ceps3mRpVdq9ezZDYEfggqhA8b7m3pfZksnbpSZo6b+xhK9BaXn41l8mQnx4wP+qrGam09DwNl1mFhrsRbgyEiEHcbSzihTXQPMkBis23VkPNWd8PWyjHfypyaWMsHr2McWGXe1a1ODsJtgnq9qa2gblbFJuRUq+nUY4aGuF4zhJPtm55bTL8p4ksYoHpU9uZr2oIZpJBwA6JNKTpU9awxcOlDUPazfCYA7n1A2jGKYBICgTMjAQ0MSz/IpdCSPMu15U9Q2dA1PRjZ8KFJ1vMQ+/eD3NjHO5dXHTTe/6MkMSrVrgJ71jA7SlX8zHjcxst6M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(6133799003)(56012099006)(38070700021)(4143699003)(10067099003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wegIC44gFkF/VLv02e1gkHMVSc1avEjUt7Yx+QO8AJmUZ/NufUZo953j8U?=
 =?iso-8859-1?Q?dDagmgXvy8WsfDAelDjeGibOgcYiczbrn67eGyYHR8rCZbEjd75VE4+eQL?=
 =?iso-8859-1?Q?OwYoWgrujR1FjFmbdYQQ8mfYKI3x9gxvErEPA5mWaUaeqSre2BsA8WZmDH?=
 =?iso-8859-1?Q?IqLSv+Krx1kPdsvYkIapj1Ia0ADFc+fTr1QaYifM01MLKDxzYCKBfIxOq7?=
 =?iso-8859-1?Q?Qc1zFC4D73RoBFMODvXljOdD2AzIt/1Hs8FeUvy10/lB9gbvJcZb1UzIzQ?=
 =?iso-8859-1?Q?3FWc5pNKTzDwGl8ek8cjXl+peqB0CwxgWbrhrrQ2q0uBwJDr2dOflmW2Li?=
 =?iso-8859-1?Q?wwaXvf7OiZ1MwgHDnRRTcp0pHjHU8Z9ZaNIMph53pdwpm5onXgV1HHWpQf?=
 =?iso-8859-1?Q?l3lTiEGCzjAHbq1sPQlpe6pwGVDyQW3pJ6uG9OkCht/bFDH7vUOsfkPbhm?=
 =?iso-8859-1?Q?V4Lmho1Qwx9m4O3rCymKhGcz+v2TZsq3I3HImu5/1vu5UOsgnOif8c9B1b?=
 =?iso-8859-1?Q?uF4Su4fa77UBARGndR4FVsHBbyPrf8Ubgfk3Xs9+c6olXuNBa6hs75oxr9?=
 =?iso-8859-1?Q?bh0/YD94wsYpQcX4T6TNHICleZJbB928fSy3wPzUozROJv7+n2pSQPG+HN?=
 =?iso-8859-1?Q?AIQDzbOxaW4ElXUxMwEG9/lG7hYNc/ojIeSNL1NbBrVJpUEcRjkJLOoddI?=
 =?iso-8859-1?Q?wIdLR/lGjgUq2YQGSZHgrLlRIZdSUWb0+fQnNZu7krkUTEwPy8sYh6LQ59?=
 =?iso-8859-1?Q?mR10QqfRD+dKsc7o7T3mnTwZJ5TOOEFnfnZ2akH7xyPWehfCXy6PH11flk?=
 =?iso-8859-1?Q?kUCXbduKAhCtPiS9IDxKxz9P6DY5WXVnyf+7+h8+06WY5/Lpt86QJzMOlh?=
 =?iso-8859-1?Q?Ug8IGXOEEo2vQBgX0JKmrLaKsAMVJW19tjKzpVZu8kOw1PrFyAuUgWYw8Q?=
 =?iso-8859-1?Q?b4bITPU2wN4+tHXTTlbC+pYt7I2n7U81cEIv4pL1MFwa8/STW0mdVlgpmf?=
 =?iso-8859-1?Q?SVhRCA7V1gzFGG1WKKom/6Ks8USmAvLBnUzXgDWW+UcVQAdeWUtt0TvDvx?=
 =?iso-8859-1?Q?vWQJMOoCljc3dDf48T4JZxDPRIw8r/2FC97KJNWvPPdkoXvpxPtdDcUBU1?=
 =?iso-8859-1?Q?bV3INGoWxR007fRFzrX55i6NS7in0zTYvQauxS3KCaZz8PIc2aCQOPFUz2?=
 =?iso-8859-1?Q?Sxqz7fA0Q+ghQDM2dRYZBNii9kaJvjVFq9YWtrkoIPoc93wtU6Z79B3OWP?=
 =?iso-8859-1?Q?5JYmbPWamon0FFSVF9BzJiw/DKQUnZDF2rH/Lcr/sNufOdXzZldVcIMLeT?=
 =?iso-8859-1?Q?n9GUOoUNRY/UH9FoyuDT3Yd3bGId93LjFQzz785Md4awLiHjdrRicSxt7C?=
 =?iso-8859-1?Q?Gu/6SdP5p8fpVe1aGwqMJ2kJUECGHuknSd06v2/YpHzb5lO5XKYyPSGU0A?=
 =?iso-8859-1?Q?FrrajYr2xk0UfNuDBnN1dMBAFPGWawLUfPq0R9PXpojfqnSE0lJUqWBSXB?=
 =?iso-8859-1?Q?RXf1z214vZwVa+hx4AoGymiKX6c0crc4YRzX/H2nnDOw88ku6K5KVss+f4?=
 =?iso-8859-1?Q?wzS4sWAQXFfEBc/EG1NlqdU0oTJMSXeYFdDe57LSi2I1rtJHbObc0X8yQu?=
 =?iso-8859-1?Q?rRHVu/i6vT/U4iQavaWsltmXRvspSzfqQ+3kozyrI2pM3Arcvz8KiOKVvJ?=
 =?iso-8859-1?Q?ojZr0xHZkXQ+7+wPo3ZvKuODDYBus67xn2KT3miKmFauS6ksNgUCaZVnYO?=
 =?iso-8859-1?Q?H3PkQ6LoFogFpQfqQcTiYM+qDAn1sp4b0X3amHyxXwnRbXul+y21bLEn3S?=
 =?iso-8859-1?Q?XoaBXW/zqA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Bk03VJl4FbCTCjsgooPu2nFGWlOn4uxtq/cTL1ABPsJDlsB7VdsQKD+C1YuCO5RB6TugUT5wdCv8Pr2+Si+60Uktf/NMTP4kmLKk+aXJt9ZLHTzmvIb98I6t5ShbBAEggNgVjp3cRuk0t/yo+RBoX5qeRKs2yCCSZK4fmj7MxIBmM32J2XVmXOMwN27XsV3ooZ90R7ykhwcCqgV7fS1MJvSoVZxndCWqiHS5wzoKHHP4JDILxzV7XrwINstxefDKLrKexBYs2rZ12GBF5/5+/tVX+s3kdGfbV/rhJ4RFn6IN28x8quzFrJijX+xOvacW3/v53UpX3A4Nmpr8OO91/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e882dce6-bbb7-4712-7204-08dee901a442
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 21:30:39.2636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2I1EpJG7F/pf1hde379a47KWnqqzVXGNYJRqeGhHkKjH3AHYfsnFAB9pNR9fmX18K2l4M7l82VzdVG57HmYjtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR84MB3082
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a628814 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=4yh5QfEVMFX3V31hkz8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: XO-PgwicT5IXw_Et_nUO3RoikMTJ5NMZ
X-Proofpoint-ORIG-GUID: 3UzHc5ISLrfaFCanOiwBK-fSm2kT7gZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfXzZwDI3SbWjp/
 yFBzFeK22/SX5J9tGAAK+zDtN4MctSQHyEeHIQJ8PE+R8C8ardGkKbCU1Gjp5Xum9c0JRpbsPrc
 tb+yB8+Abei7IGA+4cp48FSWQ79j57Z2C6oUvUbNE/TPtD3qfto/MHUcjgESEGmxOaGZq0qdNdr
 0fAs25rmuKYE9meE9VwcbQJY9hNlA/WH0QjQs3st/zCJAFl4kucWxXnUsPMtXdozzc8W0+zFTuH
 TodXOuEUf0+b8t0/Rfj2f4Yy7tKkQ/jF2OuvW/9B/QhbVrba57APaJNoNdhK0W2HZNqb8lIprVR
 Z3xU/BoVhvsGNhxSxB/EfzSyqe1iLEMtk18aAu4LfL5NuiRHOI9tpbjTgDGeAvon3ENGGf7Fqql
 RaQdUNnTf4g3BwrZoDuKClEOcer+e5AFACKzxEp/v34I9Bv4XmDXXzeYzSRUrQmW6BDqkUJBKMv
 wpPmfNYcztwRQUUmY1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX+NrS4w+7VsWe
 cm4zV/3zDkmLuaHOa0AyWZuTxXZdHScyKvTOyY1+IcMl1GK4W60EEJvdLyO3W8kBPFfV7j3aMI2
 oKCXU0T1QnhV25fAe7e+5AKKOYY1te4=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230209

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
On Thu, Jul 23, 2026 at 17:00:21 +0000, sashiko-bot@kernel.org wrote:=0A=
> > +static const struct i2c_device_id vt7505_id[] =3D {=0A=
> > +	{ "max16545", vt7505 },=0A=
> > +	{ "max16550", max16550 },=0A=
> > +	{ "vt7505", vt7505 },=0A=
> > +	{ }=0A=
> > +};=0A=
>=0A=
> [Severity: Low]=0A=
> Could these array entries be updated to use named (designated) initialize=
rs?=0A=
> The I2C subsystem guidelines recommend using named initializers for array=
s of=0A=
> type struct i2c_device_id to maintain uniformity and prevent field=0A=
> misalignment.=0A=
=0A=
Thanks for the suggestion. I think the current initialization is valid=0A=
across existing drivers for i2c_device_id.=0A=
=0A=
Since this looks like more of a style change, I can incorporate the=0A=
designated initializers if another revision of the series becomes necessary=
.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
