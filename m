Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D527EFE9;
	Wed,  8 Apr 2026 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665894; cv=fail; b=sELPUyqCY5YLwc03xCc3WnwGKz2nlX8kz4dHudXY+LwDG18s8tHHeVed4C1MWyITFH1z36oFaloTvOqF7dkvCuki4JnbvlgUCWRer1ot0QdsPhm4c3+QrsnSWwby+ef5SXwptU+AFBdzQ7CoPhypG1JMnyAcd5f17JMsYTkBFN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665894; c=relaxed/simple;
	bh=V32CEfAzA561KaYeJUSGYaFq0s7ziTMRpx3u8HXI9lE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=B1158VfJ5187RJHTechdomreDGqONBn8rUAoCDJVj9NGyzb15zf/mW7SdSkELpXrDICoBDJquNXcJBHRgMy5NGohN/FVyK2bjv1dfTIY3O7KZeUM8apLXNMN5Ldx4XemMVdSwK8xwF1m4WGO86x06nZH79zwQJ5GXUR+4PHJJFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=VOPt8Iju; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="VOPt8Iju"
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638GO5Fa4026710;
	Wed, 8 Apr 2026 16:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=CVr9mzAbNSDMHGvBPT9JG+aM
	xovLqfk4wflSf3YXOio=; b=VOPt8IjulDAyV/cCkfQ5lcU1mBGB8tXm99kFZ7kY
	p2nNsV4yNXahd7eW6iIun5iPgptWm2RQow+OuZPuwHnvYOMYBY5f43M3zVusQfEp
	K5AXSQ+4PYPVSljb3hHaesQcit1ZPyDxph13x6UHnw/dj4OulgB6P9FYWAdOHUFE
	js4m4znoeWbC2xanKsThiubum7HySLUvXkY8OH/ajIKsSSxD+trr9Mq8rh2CX+ik
	0Q64BPEfyo7XRbzZ7vcJ4ywdXISSI4F12nh0coD97APudsRqJ2xoIusjdmhtKMff
	qniBm3g9WQ0KPlmyil9+KSCL28VSdhK8GXlJx2O/M57fmg==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ddnv2c12h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 16:31:09 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id A93AD801709;
	Wed,  8 Apr 2026 16:31:08 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Apr 2026 04:30:54 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 8 Apr 2026 04:30:54 -1200
Received: from DM2PR0701CU001.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Apr 2026 04:30:53 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibg3EWlJ78MRf8Ff9P+XPcpi6wPl0c0QW/OPuNy9ehIZWWibfro90BoS+HWfIfJpWdk6oX9fBa0YHydVqjPzV+7ETm+cfRnr18yAbxVB1O/YaZS0uQeOjG+KaRsck5nxMFYi/g5JMcYu7cM3CzhOdZ+E5aciVlas6atqCBq7xcFYTsvQFPVkKEeZ1gUYCfYviQmcsD9pWd0j/7AFP2Q/S8fvEp+u6w+asBHpT11bBBilTPTx5LcZNvbX5WXq/FDX2eHs5plgKU+10GEfOQgMhnNVCHbeu/AWqpxLwomzti4boVy0y19DFt9+jWMr94fViZA2j6Fil40wHuQro4qG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVr9mzAbNSDMHGvBPT9JG+aMxovLqfk4wflSf3YXOio=;
 b=SCwGHIYfZRZHEcNJZhWCWSrBnQDGe6GWKjsZGwZJ5gefp6Mjwqt7+evMu1gBoTtThVjLzkiSJZaShdfWp4Rn0IohvQApIYN5I2zsErdbvFD01r9fJb9wPd9UICTBzDvBGCxKh5sWOYpSMPygD+8zUdwdNxceKDGY0jMGZ0zDF3ZPE+/nmTX1ggJgcCpSnrILvyZrpbEA+g14mhXoeGcwYwH8kpRbymI0xFCzkXKsrQPa6X1/Qat9GGrciE6JXPJ7MYtQdS4XKh6lSRv+9hldzjumWRvULb/pocyz13owJ1nfM9eT8kz/z0W6zc7sFKjn8gx2U9Q/kNe6sZzS5dcMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV3PR84MB3528.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:218::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 16:30:51 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 16:30:51 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux@weissschuh.net"
	<linux@weissschuh.net>,
        "cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>,
        "mail@carsten-spiess.de" <mail@carsten-spiess.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v3 0/3] hwmon: Fix bugs in pt5161l, isl28022, and powerz
Thread-Topic: [PATCH v3 0/3] hwmon: Fix bugs in pt5161l, isl28022, and powerz
Thread-Index: AQHcx3UQ0NUeuopueE2J5RvxfIVXPw==
Date: Wed, 8 Apr 2026 16:30:51 +0000
Message-ID: <20260408163029.353777-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV3PR84MB3528:EE_
x-ms-office365-filtering-correlation-id: bfebf2d9-df1e-4267-de07-08de958c3308
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|38070700021|18002099003;
x-microsoft-antispam-message-info: LK/Af7M7PVpB+WVFcGTqFlR0t4y5KZ0WGTEtgCfAh+6JgHWs9zyGS9MbQ+xegA0c092DMRvkS902YsyIUAMeLJT8z3pvqsfcQ8DyKFyOBx4WLNkH7cP23PLH5xqu2pTW/hhI7GSqP++nqy3eKtiITCXVBUng3ERb+b8N0fE0R2f5uy9ofkcC4eDJoOYeI9u2IJIOL/7ad7FJHra/dA39G2ykQPHSIj0MCV/2ZEFpK8oQUT0MDPYgdeFMJMpwbxn/oR7OMwTdMnUMN5gNYJeM94ZA9Aeb+WCL/3XpJbB6JYm3fVziixiY3Qs6wnBOseHieZVsI24fF5QPBCWjz570uvHPSoxMFbwiRwhba5Me7VWX9aglzT5c1ZH7BFmUSyAwYyzqozJJ+vKBF0NzxF+//DFRWSwMS9mM5cLl33WaGRUucx/ZFrTwYzq1N6zkNJJIANKb06pyXG2AIWXHwoJEaI1uFrojIKyZLfzOTnkxBhPYuPMOpfH2WbdnKnqQTSGj4c0794seuXlEid4PIToT1VRa2MdMwcRZh2pW5t5swpGbAamGeEo5NwuKciNMP40Ar3Q1UlcAW1zk05C8NQcWQrGAb4PYGAS8hoD6pjalO0JYLQnsMXRtp2Kh4Raj22Jg7IOac1lJK9EATdDxjXvxgLyt3V9ufR70RrxLOk/rSzGUhRDC2yDH+ZM0tH1b4QKO21kT5w/qK4NlTVsH1T5/wCymcU5Mb7nf9RADJKF0LWMpwYD4bjTeE9LDdolW/JEza0KGIsSenay+EeAF4/iBO7JdkGP+rDT4SPuqFV3b5Fo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3UOpecWUrFSAnLE1aaOLcC578k9YA9TAMpcLgQa3jqd8fXLXWDxLq34Js7?=
 =?iso-8859-1?Q?3UmPJ0zqGayMkcroOCU/1fm2YY0BLSn9Wbe+T5HLWQwa/TSDCoBZCkIs37?=
 =?iso-8859-1?Q?4O8NicBmh5qcy9kLfd0XSrkofckGmX1EYsNbX761NlpDgf1Q4s7aC628PE?=
 =?iso-8859-1?Q?49xJ1RrDWB658LR/ysUJQAQ0LNdpQZahW3sOvI8Bxx/nSUw7HEj9xY9PJV?=
 =?iso-8859-1?Q?72t7MChK7ivR2p0LUSv/xa5mL5pThb2Y79S5IV9obtZchKpCz/1NKUSk6Y?=
 =?iso-8859-1?Q?YRn5BAXbeGACO0IYpDB4ko7o495vxN3zkUiUFelXPn1us9uBAyTsLPkPVu?=
 =?iso-8859-1?Q?SMnfRyrDMtcRC5brYKrIfdyAkRyOLqDXL7amfxk4ZEcGkAlWf8gUB6MMZP?=
 =?iso-8859-1?Q?hxVI9C1S65A5xFtkiloYE15Ot8XekBupkqtRBvClCXC/FV2aem6t+VjBqM?=
 =?iso-8859-1?Q?vM6eMxPANOUn6ioIvgyO5PQPWct3ViMOrwLrKcS/5RFFVVMsWR3K/pOOwy?=
 =?iso-8859-1?Q?9e1UDUhGX2+dGWKP7vipLJAUxxx3yOVDlaSDOvULcpL7AGxuCTGPuUGsjW?=
 =?iso-8859-1?Q?JflRiIMvyXVbknmP9s+g1orjMLQ72kQuXhjUBmaVdsI1Mu9Zl3FbCs14sE?=
 =?iso-8859-1?Q?xnnImVumjPVSX9l9/73w0UJyJv5C6EZWVYbheykGZB+9Py9rvhYqj/p2hO?=
 =?iso-8859-1?Q?UnF/24IBTIy52bMMRljEzsK0GuhsZ5RbIyxyg7sO6RL3FTy5LVdilUHoQr?=
 =?iso-8859-1?Q?sGmLZEzKdSvZN788B3rMJgrLCqUnxCQObjIdbCI29/9XedjeNhes2zCKhx?=
 =?iso-8859-1?Q?qFf528vcQK3SIu30oUcTO+CMEYsF9ujM1mbiro6Z700aSF4Zs03SqIVeNY?=
 =?iso-8859-1?Q?/qj1nfhxUoATDops6HkYZKWQs4/sfNZ0MlJnFcweJ/ujXT3lXnd3FdIMg5?=
 =?iso-8859-1?Q?Cthk4eHRqZowD17Mld/u6c1R4fFVeL6LPC+g6EbhWSacO4zOhpmhz4PPpG?=
 =?iso-8859-1?Q?oK6WFD7DHRnTj5+JgnLYTenkbAxZVZsOFZk21XOZhkLhnma9dr13+bCWTo?=
 =?iso-8859-1?Q?Y4ZPOI+4lW06Rorp/NTsh9tDADslG3S18O2zeQOTPbUVq7JQLY9H1GeU2z?=
 =?iso-8859-1?Q?rbaZQaGeRstkSxOiFYYP0kGemDL3CVY4GwxAtv9nXIA9TmnEeQbygh25uU?=
 =?iso-8859-1?Q?LpBVbFfQdCAlwbYduChoFAalzVDxnN7Gf96n/+50NwikV1E01ZfgQ7uwOi?=
 =?iso-8859-1?Q?21vtjI6lnX5PDR69klkcSBq87hmLlWt39VONbEF6KObzKzbvXiWNCFwP89?=
 =?iso-8859-1?Q?Lk17bcte95ajfs8jrPwgnhTr3cn2KqQAQDi6YZhgjLqVbNEioc61oT0uqd?=
 =?iso-8859-1?Q?OS8floVAd2Zv32+zRG2jEc90xAhAt5R+oRkda8jD+sipSykTIRQ0jbkuja?=
 =?iso-8859-1?Q?SL4zjg9COsSBHmTcbrvIzf4fFvRLljeyOIyZBhTIUJekwrTMoHAXTbmIk9?=
 =?iso-8859-1?Q?fZ6GutiSJyKGJ2bfaVhJgt2EotjDKe85J1UoV6zn45/KLWh8N0GcuGzBum?=
 =?iso-8859-1?Q?G8hP9hu5m1u/+1cNnSKf4xiPmECXO3nS48qkGocZMkYNpRG6fTf/noBtfX?=
 =?iso-8859-1?Q?y8yhb4CqBBF4sMIs3xEkWHFx34+lndfeyq/+dG1QXm1eowVW5jg7yqARHz?=
 =?iso-8859-1?Q?4b9XJcN+tfwC9g3y3jPzDqp7Ew5SJUBSV9GE9w9vaf9OVpMmXDgynY6VSw?=
 =?iso-8859-1?Q?H/86ASJNoArFEefRAlADvl6BZr3AfUbCsTr98bCytPnTyjhUA7qNMX6iNv?=
 =?iso-8859-1?Q?yCx7gR5jBA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Mj4vTLfKH4OTQMXsEj1BHkPup1hSKv6cLQKwgTvgG1r/KLurwTbAeDC2Ag0Aw75zuMpAevVJvLn4mYk4G2q7JDc7dMTSlOfvCkGXNKwq2gD4TEVXOXjA/MsF3nmI8CIYAhKT/c4epnGBHBnGMeyXZsPPQ2XgGr+0pC1C2y9Zrp0C9riQWq7EZV7aGSlrFGUAeYcUH2AgUyigxAhyJNTYJtY45GSYSQ1p2cfW4eQXPaSOBdRNvKGgsHXJ0OVRZg4jl3Zn22Ea5dDv4BHiG4wi1bgN9JQF+G1duV/trsURatSv7ClVW/jZdyR7zuwvsJnu6bQGCpkznCass4w3t5lGSw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bfebf2d9-df1e-4267-de07-08de958c3308
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 16:30:51.7082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yPLScGUVvLJ2ZFnvzfmQSbLwhboz0a8ohJ6u4svNyFV7hBzp6BSQEp5cp8WjotLb0FmBLY3tfAqXsWwn2kJMrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3528
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=bIsm5v+Z c=1 sm=1 tr=0 ts=69d682cd cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22
 a=OUXY8nFuAAAA:8 a=2hCOJFToQB7gaj_t5jQA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: a3xp5OlmTpUqgSA2eZXHKIUgSdCPqSHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE1MyBTYWx0ZWRfX6/dNC0BGKjn2
 vDdt0+iTEeR6UQsFABDX59d6Bg/0ueng8pbOQ5JQvKRJAPH6R93rAxBY/epdgZ7uOUtnQvGT0CG
 4yD4+SZs//C94dGXhley0Os8In/3TxzSJmi+/r97+Wlo1xLkfA5E1eu5ZeVgyfx06Yd9UlhC/LB
 Nf8aXu8Sn0ubQzs006tBwrHWBgDK+rJGX+tcQ5y3fL4zYpmEA+Ppq4+Lz6EYXdZasNsDmxTBHoJ
 sF5vseD204TyADdzggjYvjOdoqyvx1QyK2SjzwiqeNKA/23RFN2QborUevUNxE1EH0XLM+3gpS0
 KjwXNw9MwgdEVLDKszKdi3qSjZuS7IJEHFzKhJi7CKMDwK91YS8drxVn2B/2eRrGdGERqFlXAYC
 JMeXlGqYdFSZ3kYH+MOKvdQIiM9uo5Htk6QWUlA7vKUutXH84oYoXSRg3Rg5E9qm4voVpMTGO6j
 Oo2CgmCG/aJgwVZvwzA==
X-Proofpoint-GUID: a3xp5OlmTpUqgSA2eZXHKIUgSdCPqSHj
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080153

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series fixes bugs in drivers/hwmon=0A=
=0A=
1. pt5161l: Undersized stack buffer for SMBus block read, and=0A=
   unexpected positive return when retries are exhausted=0A=
2. isl28022: Integer overflow in power calculation on 32-bit=0A=
3. powerz: Use-after-free race on USB disconnect, and signal=0A=
   handling bug in completion wait=0A=
=0A=
Changes since v2:=0A=
- Patch 2/3 (isl28022): Use min()/div_u64() one-liner instead of=0A=
  clamp_val() + tmp variable, per review feedback.=0A=
  Add overflow justification to commit message.=0A=
- Patches 1/3 and 3/3: No changes.=0A=
=0A=
Changes since v1:=0A=
- Patch 1/3 (pt5161l): Also fix unexpected positive return when=0A=
  retries are exhausted due to length mismatch.=0A=
- Patch 2/3 (isl28022): Switch from s64/div_s64() to u64/div_u64()=0A=
  since power is inherently non-negative.=0A=
- Patch 3/3 (powerz): Also fix signal handling in=0A=
  wait_for_completion_interruptible_timeout(). Return -ENODEV=0A=
  instead of -EIO on disconnected device.=0A=
=0A=
Sanman Pradhan (3):=0A=
  hwmon: (pt5161l) Fix bugs in pt5161l_read_block_data()=0A=
  hwmon: (isl28022) Fix integer overflow in power calculation on 32-bit=0A=
  hwmon: (powerz) Fix use-after-free and signal handling on USB=0A=
    disconnect=0A=
=0A=
 drivers/hwmon/isl28022.c |  5 +++--=0A=
 drivers/hwmon/powerz.c   | 18 +++++++++++++-----=0A=
 drivers/hwmon/pt5161l.c  |  4 ++--=0A=
 3 files changed, 18 insertions(+), 9 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
