Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B88149C6F;
	Fri, 17 Apr 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776387912; cv=fail; b=sLOcOxmYtMMV+HJmLN6K+R6ItBqQ1oEfnRuD8EHCOPayFqYsHIpFWvE0WGAfdtowDggZ+ne/M1iSYHtefgd5UbbhFtS7gAX263TWmIGHN9gua3bfFovQTm+Yv4V0OnEVKTFQlvl1SKaFrlABrOFeWY6xdkDtLcA9/Nrq8YzHlQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776387912; c=relaxed/simple;
	bh=A+yo2+tLSn/BbCQ5X3dO2HhP7Z+40R6xtmwn9e6hiJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nOrq04x+FD4n162fP9Q/+IGTcISnW0ngLhzAgZ9he9WNPxkKCQ2y3jAJ9E6ramBIECKD0g1V3zzpyt0LlmDweZipF46K38Rk7kLnHYsPeCy/J92TnoBvyexsFb8Y9bAb7kzxdo40IXprfKTRLjBCNTU4Vdg4c3a4BhpmlrI3Z0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UHOCRlCt; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UHOCRlCt"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0q5ki435755;
	Thu, 16 Apr 2026 21:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=A+yo2
	+tLSn/BbCQ5X3dO2HhP7Z+40R6xtmwn9e6hiJ8=; b=UHOCRlCtmu0YQvWGauRIy
	NQft0JtDUQYzyWcjrcgNzfXleyeScrUsetZCwsYDTlOzV7B81e0E/lDwxLnEfVJZ
	zBX5RzKf1jMDxtbd5vFhghjUO/1Wu8lr/S2svmiywaqm99d+DWiPvIHPfbz6gYX4
	99pbSQ0W0EGxYBNW0rTAnHIX+xOa5CUq/K1vQmaJ6BNbH1TOEVJ2RaRK4RxwFj5c
	rXHnOjmlEsvAYYsMpRAfvRkdnuwUCSA2arsYjE6oMEVYdljzzu9H0qVhxbHKZsMI
	nK2gdKwe5S5R8Y6YLbLW3wJl7O/8sWERbWu1Uvt0AT70QovA8GeMSL/T0tRvRlGT
	g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4djv6s3nca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 21:04:42 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5uKnHwHy3lWU0/YOcsjjdChxuREAefg4jQ7UzOiib3YhWbO+yal9ZTUCGXrsqotFBeWdwTs+pfIfHp2GMt/D10JDhBI015ONVIWJnzCdTERJJJkEhF2YFX4B7BODsrW6+bvvEtZJbPV3hsxOY8KPyQcntKc8Epi69u8Fm+sEXEv3TpaJ9kbens2b8NNdTAOKLDfN9VhU4leAlO9MQvdSBWyiICocXiVOnvLAiAZipMPaoNDZMSniMas4kNnbQc8WnfZaHFfXOTk8r5ETtYj1LDtMqhPXG5LTGvTsmMV9jLr2PCfFXsSDgXv/4kbVvtqDvaOZDZJ2iXcj3U9MUeO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+yo2+tLSn/BbCQ5X3dO2HhP7Z+40R6xtmwn9e6hiJ8=;
 b=H8Grij532ME+OID5g1jjM7YDwuMe2w9m47xgRSFpuoau0ofusg+HOwBO4cgMyU4Wm8s83trwt2OrARCDEM8AJ0rMGoIJ+tCcEV0x2j0dbb/CuH6SjflKJLo+AqFv8UQXTs/Az/g/yA1v/Dt2/5Cu7whDesnwnNViPv1p8wEgmz2Mbtjawz+Stgjd1uu0TvDxqy1qAV7ziFUfTKALKd/yP8GPCo+mw85I9frFrA/c3Km/cVhuApWOlibW6Yb4ZdwO9ovocVZtxUAee8MrR/DUwX2ozFw2Ad2ZYsO8IyOHETDpeyvytOZzMacrNCPVJ4X/Lq9UvlXoBdG+cnnQlBv1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CO1PR03MB5667.namprd03.prod.outlook.com (2603:10b6:303:95::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 01:04:39 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%6]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 01:04:39 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Conor Dooley <conor@kernel.org>, Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Thread-Index: AQHczXcJ0nOdZqqKtk+vtpI0M6ZlMLXh1uKAgAAkYYCAADpzgIAAM80A
Date: Fri, 17 Apr 2026 01:04:39 +0000
Message-ID:
 <PH0PR03MB635166088B7C473CF59F17D1F1202@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
 <20260416-diaphragm-corrode-494560404ed4@spud>
 <84a5154f-1139-425e-94ae-31d7e662cd0e@roeck-us.net>
 <20260416-scoring-secluding-c7a7235b181a@spud>
In-Reply-To: <20260416-scoring-secluding-c7a7235b181a@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CO1PR03MB5667:EE_
x-ms-office365-filtering-correlation-id: 610e688a-0a30-40f4-e488-08de9c1d4d36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|20046099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 mxzhCvsxDkcLeP95HVViLNaDrdpqyC6sYu4px/CHbEWw+8X8oq2DAoUlm+v5e/eLiANedOG5Fl9BH/Kt4vRjLF+qlQqpkM3A3cCo3/e02SHoCR5un1DN8pUKoOI1JMdI+qTI8uzys62EiE4lldY44SbV/nN7frs9GBtZCN/EbdyhOwNTbX4XGYNrdRaNeh/8BMn1FtcHNOj0C72PVVjkVyFHguqT29M2r8lmAkzGIJ1iVR6Fu6Np6GsaIGJtUS8EYb84OBuoqxP67HvrYlsRIHEVPIJ4Ozzaybsl48KS3YBYTEpSCM9jrkE0KhQ/TD3N+FhaajdSiOukm4HoyBOW0799wsWYenvxYRnXd/uV2wdwXmHIv3hUc1SbMxG++p3hvDtb02zicjfLIjDdDqKtEzHo2ItC5WdoVLC1Vd+W+15WHd4I/mr//yEMpscW8xN3ORf5rNX2WzL7j0aXumRHFMslxdTdKCfI2X8nPhg2zCUjEnQ0rspr44iz9mxcWtfD+MfmMj35GlaAHmpAvZ7GbH/Z+baKpf0SS2ioVTkBG0mZw7nD5WBTWeg9XdeDnTzX63Nwf6DrNIwB7rBj4A2mwuZId2+ZNRiuuW8YH/7I9dUAbtEve4uqT+xu9qXLnSPVTOPWcKj+FVMAsl8Xy8iIbFFyZAlT5+LsgUgXEsWCVCkIx1AHPrCEPLoQ15LsYAk5OJ5xi9LOZsDSujiMwF/T6pCJbDvD7oqri5Fh0TDpeZqZGXf/X4vznPSD738JbyjvY9ux4NS8jZvvhRxLVI6TW3LBqJ6KLnkeJXDiXzBFPl0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(20046099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8hCvKIQZZDEf6Kwr7mkvOAg9ekLzuYDaS2ZQrPvT3Gn8dZ3AbopWOgJfg6Pn?=
 =?us-ascii?Q?G540KTebD9lpmlzI9moRa2hnYDFcdBQZV48lvDFOEyho7irTukYJyRgS2EMz?=
 =?us-ascii?Q?xxHWmo1fh/OkFCxiojpN4MPya7FcWpa484B4SiZbqo+SplBI+JWnCFKhhNMw?=
 =?us-ascii?Q?UQ79DlEX7DHaHr5UYYHiLBqRN0ZWPofet4aHoCzzVxA8m+v/T3bIbSyr74Kx?=
 =?us-ascii?Q?io16cerVdNhM+mA/8+ikc1Sqbdco9u9cCqo+C9/rhxHzN+lIxlp3Y9RfTLOy?=
 =?us-ascii?Q?i5qmSTymoIMM4OI8aE1hEl6CbgVohiDMUEPZKIOy52Q2v6XcrmiJaLC2ARIW?=
 =?us-ascii?Q?1NW8ab/5NpchCP1fYwb5P0CIJvGlGuoztcp46eOwMsQF6iWstvAM5YxsQsD9?=
 =?us-ascii?Q?STvSwKJV+atFTMFThKBBBW3m76BO1AsCtb+DfIWOqnh4XUqkOVFpDxM0RF7R?=
 =?us-ascii?Q?Ihcl9hZsSsFbsGy6u0Fwj5gRVx1G0LNDtRymN1YEu4O3pIxD7vRZ7bVlfIzw?=
 =?us-ascii?Q?DMVNOfRuRjqOplzrRqduDGQMZsSrPY+AFmIWxn3FWwWcuoPmEFMBKxC8YhsF?=
 =?us-ascii?Q?TJ7XCU342hci0q0vFQ0X3bpWd2tVJ4HwL2S0NYSUCEol3J3aI7Kn4oMT6ndR?=
 =?us-ascii?Q?yclxKqbB99GXkxJZExIpmlm7qabF91+oawKkc4lm6sSbVdFa5lzcxRnYGsEG?=
 =?us-ascii?Q?jZl8U42qiBtNtiQ+ZPGtae2jKhTAo5/nsZDw7uPx5chuuZxBsoKpAlaAnCol?=
 =?us-ascii?Q?pgDTD1HGmVQWOb2dAsCdSfzVfCCTx1FUMoj5kVswG3Hz1gMtrUxjwRKQQLwZ?=
 =?us-ascii?Q?CtUdIVBXdrm8WnzHf4JCHq6wnncfIIYjFry3hm0Cy59fBqx8SjElEXbbqiDs?=
 =?us-ascii?Q?KuPuzkgeuO1op7FYF19ZvMJGeTLspxTpSJVo3yUgkJ4ZDb7gjpAic+oQyM13?=
 =?us-ascii?Q?mql+J/1PVpTq4eOC+C+fM5jYF9NXLVTvzb4DhJS/5fY3BUrWN0YduiQ8qKJD?=
 =?us-ascii?Q?USxngA+0UBTtlrY5oi+oHjc6hy9bDe/cIA8yJ+fXRp+0a602a0hd3VKkaDNp?=
 =?us-ascii?Q?WQ9r/kTa/DFfUCCGOs7QBo4vI5ZOVxie4NolDhRx3ZqGXok5DYSrrSzkXGA8?=
 =?us-ascii?Q?AyV5XqkZOMQ+WrJyZDqlaqsErZCaw0n39Vqiq6c+/P3eqFRbft+Z7S7QveF1?=
 =?us-ascii?Q?YDU+Uh/0UHW0NSqcquaLdpNojAisW5EKJBJidRZQPMgiJKC5DpJB9Usz5reb?=
 =?us-ascii?Q?k5zJxoAQOGhj8L8lyuHaohf+tHaG2RkxJ5IrwUq9fWOGRvPh9Y7xRzEryvwk?=
 =?us-ascii?Q?Ko6GKLuH2bmB+ZgHnRQ/BEV7EICnPzZT5fRtwn6C+y97bqB3S36tSC8VEMS6?=
 =?us-ascii?Q?JPabQ4BuuId0H8+NCZN2guz6hyY2W6/Hwv3dIKYQ9KBs46wUNBfHO5+US4dk?=
 =?us-ascii?Q?S2fQzyGO8vvsmNI3zG/JvcuH37huCH0AeBUY5rn8JcG1/utEEttLz+kVKuz9?=
 =?us-ascii?Q?3G49gYS3celjpV0XRnKeMXhUBPnPNNjWKstds2P8BSnmDU1XZxXHJWQNV0dF?=
 =?us-ascii?Q?zPXVgWzmH6x57o+8k5ws1u0yU6bE7qTAzNAg1KwLDpRZvmZm6k1h2cA4YSQw?=
 =?us-ascii?Q?oEhBtKl5wTfqAzYRxaXdfQLy/9zZh07VNc0I2DEe9XucvAEEecGG7xYUVnIC?=
 =?us-ascii?Q?DJxqVXmsbwrEaL0+FRSASe/6XWb5FtwHLwSqxwIdjzf+zsa3d4HTglq6Eqnr?=
 =?us-ascii?Q?tnehBwxhuToYbRE4EAPzR9yyo48NVzA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	q132qIvqd9D/hl263muudcg2kYGFrGohTqGSXIR/qdttkjF1Zfal94IiVzKvZTDfR2bp2d1U02LmpkBKDRRf9gM4oCOYejM/Vr1v9fJSBg65XXVLQOZJXtMxW8H9/C+ZozB6EbKItl8bWCqLg5ba6t/+OYIaNgxCkS250K3h0Q4iclotrImUDfD1ll5yyAbN95pfQ+afiJMT5AUHe3KGXs2skWH8AKDRVeDG8z/lYs81O68TL4C7bGOcdLerVkJi7wyteyn9jTJARKlRsV0aovNhmIrSPbFXKlPV+7GJfN5g7vjU/wYI3VxMSsJVPabSdkPSZk5Q3UQ4Uvj+R/3ulA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610e688a-0a30-40f4-e488-08de9c1d4d36
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 01:04:39.6485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ue3ftqv7WsolcYaegsL8J97//SfxwRFd6wU41vwXn3z1dhp+EfdotoOuJuuoTANJSBtiqUEiTD/GtDp7SwUu9E+nFzts6MT4/EFgyq5OUN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5667
X-Proofpoint-ORIG-GUID: BzCq4c4QGIteJ1a2CSZ5lg60u8m_sz_m
X-Authority-Analysis: v=2.4 cv=VvQTxe2n c=1 sm=1 tr=0 ts=69e1872a cx=c_pps
 a=+iTzTTZpyf9i2pLb45wEOw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=Fp3gelk4GgGrfRNaFxMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDAwOCBTYWx0ZWRfXwEAAncly9ACf
 X2YznzY9LqGanuJk31FamlS1kFZ8y3stL68vEZe6BfqTk0DZv5lmtGc1iU0D2RKADoEi/EgoIa/
 zNjsztd9erKBxkTKIA5PPLcK/tlby4MBUu9DW0BnTIAV4QO5x5neo/w2snOGj07uzf/yniajz+J
 HtOa7gcoGBwkTSRWSd2AEDZ5dRKfFl4Zj/aOKxK3IT4wBR6Q4mJNefKIU1G1uf4RUDngwoqW7IC
 kAsXT++oYfB+hI131aiv1lrok+yDHZaRwWdgc5dN0dT1izxMiI5938vKlOkxy2Z1I9dBcKr8tIa
 gUwGnA6PDkTL6Ifuc6ooJuS33wI1CnSjfPja9ni+/inryy1zCF4R1izXkajbltoQqQuOHeSZoPA
 OTP3TMco9irnlELuM2l5XJ39jFVTJQEP0tlq0alx67LY8CVC2QH8JY1lbMbBBieCn2MLSNsUqZo
 Xep6DPYzBjuyHXVensQ==
X-Proofpoint-GUID: BzCq4c4QGIteJ1a2CSZ5lg60u8m_sz_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170008


> > >
> > > On the previous version, you got an LLM comment about not having the
> > > interrupts property amongst other things.
> > > I think the other things got implemented, but I didn't see any reply
> > > to the bot about that?

I wasn't sure if it was that type of bot. I'll try replying on the other pa=
tch review.
I just added a note in the cover letter change log about the lacking smbale=
rt.=20

> > > I think the answer is that it shouldn't because the pin it
> > > referenced doesn't exist, but when looking at the schematic I have
> > > to wonder if
> >
> > I had to look this up in the datasheet. A SMBus chip with no alert pin
> > is a bit odd, but you are correct.
> >
> > > there should be an interrupts property for dealing with "pgood"?
> > >
> > FWIW, I have never seen that. Normally such pins are used to take
> > devices out of reset.
>=20
> It's an output on this device seemingly. I don't care if the driver ignor=
es it, but
> for completeness (and we like completeness with
> bindings) I think it should be documented as an interrupt or gpio.

Alright, I'll add it as an interrupt: optional power-good signal

Regards,
Alexis
