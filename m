Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83E2BD0B;
	Sun, 29 Mar 2026 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804221; cv=fail; b=Pfb2rFxmBUOnv5bqvpxHYZTGoD2AZOsUL4kBOQFokDHzP0chr6iXqVYFOUpAIsl6kxhQhiYzTDLEekgll5nALO1um24Dje5bodUOwzlnV0aGC8wcxCijqruIpCPLwwZt+9SEDeUXlnv0iKEQJB4bIgJnLs2jkPjv2pAwbg/N0HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804221; c=relaxed/simple;
	bh=8iMm1yrk9tMfewomzs1Nj3rFArsXI7sBMwr+WunwNvw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fs2IB13l0GklgUgfIbJlwaKOuPBoPmRlVtWzspJZXFGs+QkQVIDIoZXK8nwwu3VJ+DELW7GQP+xN5TSbUdMSOAbklVRKgI7UIhOxN9nWa8RcDeKI4dD4Vw61451cOhj0k7J3EzkM8ZBAC5h9lHfKM2+eLUZ4pOx8km9/UEiRxA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=F66UmyQ5; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="F66UmyQ5"
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T92f9Q2035861;
	Sun, 29 Mar 2026 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=dCOKexVEMNBGCMfjINCAMo2M
	JBj+cDNmMxKJTGhKv3A=; b=F66UmyQ5eICFUYspdzjTYGYP/YKwBqstsKh6RcaZ
	tpjJgm32WNbs8oyJseprqkoTw9cilDQNQwn6cwXANQ+NyYR24G72o5tX3wVh8rUG
	S8g28gkpJKKbNfT+N17DoJm1YC+fV6IoqVWSPQ23O4KYs6id+zWuDua8zihfITMT
	Cm5+5byxsa5x9wp/mz5bclCiPuIxB18fwWloRk2Q76CmwanDZ3dW/lrPBlRlHNZ6
	nlvCs9YVJmwMI758OdVf7bOBUbEiBGUEwdQ6jUdvra7qB+BI1/5sa5NX5G/oGNnn
	xfvExUyiUxqzA5fnNVZHeWdBQg3XT3mu56vhsxlvbBwfuw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d6uj0v4ps-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 29 Mar 2026 17:09:58 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 9CD28801709;
	Sun, 29 Mar 2026 17:09:57 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:09:57 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 29 Mar 2026 05:09:57 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 29 Mar
 2026 05:09:39 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQXtba+ar9I+9KisNL6Jwl2E9tL5obG+zRkewIjJcuyKYaMGxjIjCMkhFRgt6gzQ503jWy7T8/TE2hE6ppPl80N91OTdhiU5OLCcX5kisuk+ttgaOneRNJGEhzaKGrnR7xWP/IY9gfV2jG0m3i4o1Ncv+j05Jco5b2ixluVWPnoFqZb3htD4X2yUjepljf7wDbPAUtkCNOuos6JTEzJqEIkXFhwTCRq4ziOJdecdmfn0Rv6ZCM9c2Ao2isAqBFDC/5vUrvhdemdEWuyJ6lU05mlV9Rzh6bIn8j1blJyAxj0h3JzrDkz1NpzrO6I3fORU8lOAkM2hgT4LFwOPWg5OKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCOKexVEMNBGCMfjINCAMo2MJBj+cDNmMxKJTGhKv3A=;
 b=GHvSUrmUftU6jyJjevFPSDmfOne3Y8SRn9Oex/080tJghm7TKQBmJxoBVeBtwCk4c/85qlVP4QOfmQ2j4n8JqmJ3P/yB4SsPOcHzFjk+wVXCtTPm3MfE6mgFFanc9qKFEWRio9a7xxgEBsO7kM34y6tgXU97M3XEA4z0lnx8Yn8BKUJqTDL/O46VzlLU+5vLSPT6tmh3Ey4SkhR2mXoE/KcR8zE4aiMGvRL4boQeXiNBPxVYaD7qAXQdc0D0m/CyZYHNAxMhrEaDHMZDniFVP2wsBTydtIFq5OPnRnQtuApY1Q4BLlSaqou5tLGR9XcgKAGDFPK5j+WG2oyyWcUvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ0PR84MB1992.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Sun, 29 Mar
 2026 17:09:35 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Sun, 29 Mar 2026
 17:09:35 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Delphine_CC_Chiu@Wiwynn.com"
	<Delphine_CC_Chiu@Wiwynn.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 0/4] hwmon: PMBus driver bug fixes
Thread-Topic: [PATCH 0/4] hwmon: PMBus driver bug fixes
Thread-Index: AQHcv57RThRa/YEEhUGANYmC9kkUXQ==
Date: Sun, 29 Mar 2026 17:09:34 +0000
Message-ID: <20260329170925.34581-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ0PR84MB1992:EE_
x-ms-office365-filtering-correlation-id: 35328ce0-5c76-4a71-38a3-08de8db5f3bb
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ezb22LddD4CAJc6s1W009GukpD4Fa/E5d1fMGahUoqggwpKXO4DqD5UgUOFh8xBKRhtcRcE8I1p+cW20UEVomsfYSc7VDI64/OZsX46irofW83aOcIggEYeFNVvHjZ1R0Dv2AGmlEVHWu9FOuulLAFoBK1O8/As456QH69hPIpKrckhagkcdbfVvjP877qJ9h31sLLlJQ48Ao0Xjrio+agYs56+wSHV6OOR7oKDzSNVeIl9Eg2keKSL9gFK76K2Uhi4X3JBcrx1+u4bu4elh94zYTfnFRluWHBBwiIuI9AjiDROj7MZ+O+IrA+quXoTMn8kcJO86nJIMsw5EOtL4PBve/AeU2qBNsQKG2cr+aCxE8qjQXmzGHgUCHc3Rzcthg0V/tK4wTNbEAd8nP+xUCaLfJNC7PQCYU4s4qf24fvVR+cXCU4G/ZDzu0IegHiGg1tx+J1+/MEaxnpDzMYgRjUYpWGUz9FHOCmw1Fj8xxHzH3U2xAeSbgJDgyy6YbK7N77U1T6whNOK9Bed5TZnJuvyJ9FpCUZo7hdgnGlFD/6ogewbeD/rjkJK0TAUfpOJIFyEAABx2CXPfeKLUHFQodEEc9FdfuSjE/j5gU1hPki9kxPpTtT2aqAGaduCeepW6UDfGHVdbVpiOFUruoAsxm9EoccYi86DH2EwKTxnxmE8UbWqOlV2JR0tm7VZmx3+0ZAyDGvgYZ/P8A06KnDuFnGR84J6zVurIyHYgnfmm0bNoXrHDloYa+BSlLrshPSDqTOddtw60vKcEbKzobbIAX0a0t347LXc2rR1fElNBg2I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JApyJxSm+MKZmdvG9YCcy7k0mF83COg/1CPMuEwzS7G0HJlrD+UFnbJcZo?=
 =?iso-8859-1?Q?sWcuXVYFXRYxL8C5qBjwz4muxvZy1Nml8nuhRaK8TEVlpuSB35NdweRzsz?=
 =?iso-8859-1?Q?PCX2uiRP9/XK81Bd3ChRDC3DvjAV7pkqZEV2d/maVosawP1VPReUHzW4Lx?=
 =?iso-8859-1?Q?BzPgsczMiYvgY08+IPY70/gTzg8Nk1dNkYg7Fq4qD5ZOSu9Cqaez8akrLE?=
 =?iso-8859-1?Q?0L3Lp5fvZKeDkWuCvrZD4/byeQ406Nzs5hrbW3Dhu6H0U7drJUixbzk169?=
 =?iso-8859-1?Q?HoEH48744GhV68EJF+y3z1CIn1lbapT2ifojqVMh1xcsRsmkI7QBGuTCzu?=
 =?iso-8859-1?Q?nRz/pSwv8bnt0QUlO711DsH5365YEAsWEabR14qTg7YyJWiqySMVU9QEN7?=
 =?iso-8859-1?Q?VAyAPzGtyoA7l6HxsZ0znpmIU7dLqO5hItijYpBPwvqlxPLGL2s3ZhATKt?=
 =?iso-8859-1?Q?V4NsH0ScuXEpjEZfbPo/+T+dCT6xX/47T2aRR/kCi8okr15W6KJHQDdji4?=
 =?iso-8859-1?Q?caql7VYroBea0k4JHu0oEhjol9oqKkCQoiDwvqqEKdpPrp1gxKaB++nh9W?=
 =?iso-8859-1?Q?CXbfzKn1huywQIaVJPxwgtN7L2IkLfnFLM/F2eg3ROdFkKUnVTkET5CDul?=
 =?iso-8859-1?Q?EsdPI8L1YPMstk8jxo1IxQ9CGv7hEind7guJl7viOIIfY3x84rIXlo8PR6?=
 =?iso-8859-1?Q?Y3bDl6HlLjY3Kg/aHwuF9p6qNChuQMXN2eCtVs2HE0+tdeKYWaAj8dU1ln?=
 =?iso-8859-1?Q?NmgBsvxHit3alvak/iR6w/PimkSCU1+RAldZ/bawlcIAWhRnA2K2VR7JFL?=
 =?iso-8859-1?Q?hdCArwaYfEeAyKJfYGGscBOh11wPimyeiNE9NqTcwt6ZBreG6X+j/KTbua?=
 =?iso-8859-1?Q?BR4Ny5s+YMYWoq4k16A3i1RtvHTPmbQtp5m9J2Oxrzf1f8re8FULKxu6hx?=
 =?iso-8859-1?Q?8RV8ra/ObOic1KpFg8FRdbw1WGDK3CEsUWdVIRUR56421R3JaGbMmaf5Cf?=
 =?iso-8859-1?Q?xJIGtr/RMhNa/x+hEs1K9+gjXNBGKVJ78xzgUWHnjrGOTb1XMyHkkbakIc?=
 =?iso-8859-1?Q?e0MGE+thxjSCWt+UXZSBuZ6mGJpET1iisIg1ObZg8lsE+jcTlIGQF9hvrf?=
 =?iso-8859-1?Q?Y8A/3zM5N2hWiAXbBr2K/c+UzCVHGShtMHD7lFpsd04HZdFi0D/VadQ5Gz?=
 =?iso-8859-1?Q?W45ryEaxgB99nik97cq98mAa/p10FwVtSecbo9Ig+XoEP4XfrIPQP8XNaq?=
 =?iso-8859-1?Q?X/CtNVl22meRidJCtEwiwsd9egnOzmQpMboqsUBHWwkjzbED+Vky/vgRMe?=
 =?iso-8859-1?Q?tGo6tMdSsHLW8/vOh0Fj47M5ZV77sztrzm7a3B9HDYD7qgGA5SSuBkMsA6?=
 =?iso-8859-1?Q?KGLBIuEA6FBsFEXQgoF2CgrNTeTRxCERzoRD43poHA5OT1Rc7o2UB66f27?=
 =?iso-8859-1?Q?48To2+fvRlUKwThQ02FYYaMKWagHQQgv5C6nL8WysDzl64TcB7isbOxOUj?=
 =?iso-8859-1?Q?t6HqcsxRRqB3PFShDUs7johChpykEiFgR49lTL/paYWOS9rjH6pLLB1PI+?=
 =?iso-8859-1?Q?dPGFkQmXfDnb/whKzmp8uRU0lOFF3g+x/f1luta1Nd7On2hhsNBaxu4sJL?=
 =?iso-8859-1?Q?XKTRxBllDr66qNvOxYBz3k/chU0EdU1XcuyezOmO+f7y00a0f2G2W6Gu5L?=
 =?iso-8859-1?Q?uetNsLs8Wf3zaQgN5wQPyRVxSl3/49HyBARZ5E/t0chn9bw7mh50xE8lCq?=
 =?iso-8859-1?Q?6n3fxPzS75QcnrMSbVKiy0OtLqr+NA/B8GJ8XELSDayw7q/Ei+ziSGTKTj?=
 =?iso-8859-1?Q?x8roCrCvUQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E6peXcCgyi0zf1uD/nxOYpk3W4sAyKBtqts9eQRjXUZXr1VsmVBAqdAWs/97orgwXxH/e2z0yArbDylHw9p84iXUfyFmSj+AHtFkyKO88zDnH7Btd5zygiPjT+JKd2BhPcBfOJRquabbFqaPDbzo06UUFW3K4gLqQWOkACgpI9E0BhyIlSjDebSdxPU2TNY0fPnVAoP9+pT8/95hR2WI9Rm4ppZOiakI1fuuvBLMnEUHEPNQ2zxLxYphGnu86VTS53MrevuJNUo2f2hvEdOc8LOST2J75CZqPk3KKnwcixE/AgASlFx+VEJZCLIlXWeQfNryFJc2xcBvjGCqtoDaSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35328ce0-5c76-4a71-38a3-08de8db5f3bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 17:09:35.0461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sBiy4CF4uvafkqMFqiPxgYea8qWQ/xkkMhkb2rerl3KMqu+r9rVORUyhEUdX5Jq/DKDVXe/9WEqjklPrMGV3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1992
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: UNEASgII5cMesT3lmc5NQuAZpilcknfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMyBTYWx0ZWRfX9127MBYEAxKx
 TwdcIvlaNISGQXtkKusfZwXDWDvS7hMxHM+WLPr2U3m3PVLI1bRFnrCdwNIqchdvNOeFBwxMfh2
 EqZGTtgc+znL6QVS825mzK1tgjhJ1pD5raYLTS9q12iHFRs0RCYaOh5jYeUSUChdXRspUE1fhoj
 Miwxyoaa7LlSYVMBXCnHXRXAjjdwJCla3q5Iwbj4Ji7NI37Z4tGUrolpRUrn6MLX0apl0VLecwL
 hyHsJ6GkivYIr4fTX/fn/XVqmevgcti5T24MM/9qKBk4KPeiVRgKK7B5hoj1Pj7P4kPnch9Y/Wy
 7abaZ575/QK++4fU5Zds1Nov71nLWw+jm8XJ6YasVCkwdc4oSUm8pCHjHpcz1M67fqZpTjZnlED
 iXEb8eNNo87Wk4njFaZfCsDDMVLkz3gw6W5BiiUoIlnKe/N8WaFqsVbRBrucL5dAtIR1S+zxlos
 H6f2T8/lFHgDt6vCB4g==
X-Authority-Analysis: v=2.4 cv=ZMfaWH7b c=1 sm=1 tr=0 ts=69c95ce6 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22
 a=OUXY8nFuAAAA:8 a=abaf_ieQ-ywuUfrM4xAA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: UNEASgII5cMesT3lmc5NQuAZpilcknfe
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290133

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Four bug fixes found during a code audit of drivers/hwmon/pmbus/:=0A=
=0A=
 1. tps53679: Prevent out-of-bounds stack read when block read returns=0A=
    zero bytes.=0A=
=0A=
 2. tps53679: Use binary-safe comparison and logging for PMBUS_IC_DEVICE_ID=
;=0A=
    distinguish short reads (-EIO) from wrong device IDs (-ENODEV).=0A=
=0A=
 3. pxe1610: Propagate page-select write failure instead of silently=0A=
    proceeding with an indeterminate register page.=0A=
=0A=
 4. ltc4286: Add missing PMBUS namespace import to silence modpost=0A=
    warnings.=0A=
=0A=
Sanman Pradhan (4):=0A=
  hwmon: (tps53679) Fix array access with zero-length block read=0A=
  hwmon: (tps53679) Fix device ID comparison and printing in=0A=
    tps53676_identify()=0A=
  hwmon: (pxe1610) Check return value of page-select write in probe=0A=
  hwmon: (ltc4286) Add missing MODULE_IMPORT_NS("PMBUS")=0A=
=0A=
 drivers/hwmon/pmbus/ltc4286.c  |  1 +=0A=
 drivers/hwmon/pmbus/pxe1610.c  |  5 ++++-=0A=
 drivers/hwmon/pmbus/tps53679.c | 14 +++++++++-----=0A=
 3 files changed, 14 insertions(+), 6 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
