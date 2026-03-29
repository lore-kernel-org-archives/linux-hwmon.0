Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACEF38239A;
	Sun, 29 Mar 2026 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804223; cv=fail; b=BxmizeNWNvfZmwQj4C3LHsJXrwfgslRiODfwy6bRNPkLVdFjT17KLF3tfd/JiNSxveTvsyOep62Zs/BdRzW4Fx9pgim5ElXj/Y+aXs8yo06luYA0UPEaAlggKGsmptnPJat9hES9p119KVlektTX1KpqgruHcB622/6KOdrEenA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804223; c=relaxed/simple;
	bh=6c+cA21eOZiuonyYq/4iL2QR6k218QxyDCKGd9pULxI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EaDPlbFxHBi8ogrPVrqbiUl1DN4Q2b7ouR9jyzJN7p2YuYkQYbXZalQNO2lORathXl9J2t0aGxrjQh9NDfbga6WabeTM7kEg27MYqhGbSXuQINVsrrTAk0IfnN8BrcKMIpi70EBv2OrjPJt+nsmOfhrCnrl3CR6jsh5fKpYgMbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=NxictZIs; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="NxictZIs"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TA3LKF2410180;
	Sun, 29 Mar 2026 17:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Vk
	VREVLVPLvYMxqaXwCNZXzV+KVp5ZtEmzMqDBGhzv4=; b=NxictZIsRJZmfCqUqK
	/Q6UVqi1Pevw0Idu/eoZd12XU5XSOSFblKVi2f9Vb3N8jJun7/uizApASPWK2XZz
	JwMsvyq0oDjKiaefAbXQX53wF4pTfi3EFq3n7Zh7b3b8u9jeSHmUTPoeKmXdSfIm
	m4HN0FABoyh5aq95/RlT2tjj/oaXEWl/vnYCao9m7DMP+wN/sVixTTJpv58Ezx8b
	qLaSDyDtdcwCpgabRDG5h9xPkRf7IYHL4td4LUc1zdbX5Yk5bS237ISKrFhY9Qf6
	/iIQLn5UjESSfZZtJ1VQptrAAeg5xMVaBBo4YeetFnhrAr52nnsY38Uq3xdmmZUE
	S2yA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d716j28y5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 29 Mar 2026 17:10:05 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 4F46CD1E9;
	Sun, 29 Mar 2026 17:10:05 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:10:05 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 29 Mar 2026 05:09:59 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 29 Mar 2026 05:09:59 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 29 Mar
 2026 05:09:58 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlPNkocwUP7LQQFVdy9NP1GuUCHuWjsnT/KI9/tqhgiVKCXwGjRKhbmhnuIPv/38ZJr3A3XFXS8aIujG4viHtTyn5vBZ1IkQoZ9Ew1u65NBNWCzz/B681bh7aHyTvc2iLjHjDJ+sxnL2CkPRb9m4v5yKjlF2UT5fkxT2XfzwE1II+GArAD+qTwbCcqr6e52jDAmjjg2HT68AqLYM5v+85Bl29NCNpgJCtaR3vAr+s8svTFurngpTkwtSMThklogPUmWArEjW2kfvM8zjXahsYYTFsCttKN5X8jEaeFqGe6h07ATcCGjDfOhrxhY68zY9HxF0NmLfnwPO/vD1golMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkVREVLVPLvYMxqaXwCNZXzV+KVp5ZtEmzMqDBGhzv4=;
 b=dTF5dmJ9NHgAIMADgUFbpaicePZ6Zf0SM96dboMCojP6OGfVHFgXYoEGO0xXirVx52XnZ11ZHlKcB9pijoSevgWJc1rnlS4+Jw4pdN5DBmbm7voNFY/Klnt3iYl5e9J+qIsZW08JADqKANGdbP0K3x+fv4h6LyYXXEYYO083VZyeDo+qqQuvi85OVgeD+4VWDi/5FkXLIU4esI/yWj5ON4Dy1xxe61RjDCISl5Bp5GFYffdjX5iwBv6qkw58owj46pB80CMXs3FqHjDGFbCNWMqx/r18+QBPLj0oItC5cyoNgZ5vQV1fxN7w8a/dqo6UGDJy/apWTW2Dsp4jrN3keA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ0PR84MB1992.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Sun, 29 Mar
 2026 17:09:49 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Sun, 29 Mar 2026
 17:09:49 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Delphine_CC_Chiu@Wiwynn.com"
	<Delphine_CC_Chiu@Wiwynn.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 3/4] hwmon: (pxe1610) Check return value of page-select write
 in probe
Thread-Topic: [PATCH 3/4] hwmon: (pxe1610) Check return value of page-select
 write in probe
Thread-Index: AQHcv57ZqifkkczCREOjPYiI3MPLnw==
Date: Sun, 29 Mar 2026 17:09:48 +0000
Message-ID: <20260329170925.34581-4-sanman.pradhan@hpe.com>
References: <20260329170925.34581-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260329170925.34581-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ0PR84MB1992:EE_
x-ms-office365-filtering-correlation-id: 2eb01e2f-091b-44f2-dbb3-08de8db5fc06
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 01AhYNWrv8OxwIphjnyiAMF4HSEMfdu14iV5LYyudqFD38bx0miyGzHDLSoUvwdXHbrCWVvdpemJuJ4heHZfZZ5ruYID0ARw9keoD8OfYtE4UtPF11+UYHG4wYsc8+FWS03N9OE0RVqffrjt3Vzh075t6t+fjeeULW9Im4soLxLN3CsXWwd0p4v2VpQpnXX0cqMJr3pYshkOeQmgA4YcdmWvEYKmBXixcHJEPp39ktKe2XYmcHBII1B5T5erB3Xg3qS0TsuHi22YAlYhjsRJi8+PEEExoy0JVl56etW2g6Ct1rPxXMxHnSxv3r4PuZpDlRPUm4VHX0gEcTas8AhHWO5m3J97wDpiYefVV/epjJAPtIgbkZdVerworMgwkHrEoTEARVGvWdcTS4M1w4o6blcBvfXt0XujD3fahnMPNMAdAF9Oi+waXmxoTGfg2PgWIeGQPFZMdIDvy/n5AR9t3fDs7riMDBEE2aLXbLsfBTx0Tyv1WQk0fNJm5NY8n3XPqvda1ZajmS3cvjMCGquClsvL+WBGGkygEwJQIi2wYmFTDdMn1zOllRe9f6JVnPqTMx5GfEm7DMTcjGgenHuaHf1xxydICuFSXh7XNfJbiPc+AFwfoIWh96VIPJSHmuY+7AMM3iCBp2JlFc4jHFoYKsqpw2JOya1Mz7kdiQU78Tqf+ISp9EEAPjnGteJMlXbkQz155dNQXAdU8bR4q4pulVm0MG5GctgzIcMdA5fy95QuNS1UxYUvrKl728RUliyLphfr8Yc2u5gq/ROueVo7NpTRz0lrseZlyPJ09QnR8O8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mqNZftjP+bxwdguXQUBZgneAJ1q3oEoQUc9domKxDzSLhPEH2eGf0L8qwB?=
 =?iso-8859-1?Q?ikD4X56Vfu88haOX+VE6QhsOFWa9OU6Qa3kV7svECQ8BC8oxGb41hd3Wjf?=
 =?iso-8859-1?Q?MnZfHBXUhygcj7Yc4uj4Qby5jvXA5oLA2v6cd2a/ag9DCZHYWhCOYvH1M8?=
 =?iso-8859-1?Q?Cbn5VvsuJ1oBeloIt+srMCZLr8trtajBsivBzYIql2n3gNomTWAP5mgoUs?=
 =?iso-8859-1?Q?w8IV+IM52f4Nm+HyHBBhPpKM9rRq2e7uKa3UNg0YVXkBeHroD9QmfB78hC?=
 =?iso-8859-1?Q?U08TOok5vm3V0Ks6PjUyC+xhyuL41FeX9pIKvgrptMv7QyJ/uT+G/yCc5E?=
 =?iso-8859-1?Q?WBxdVLsJONRc1O5NPd7w/pPPtF9dvlgocUz4R1PdiwHFeVC/0GF7FIO4zc?=
 =?iso-8859-1?Q?Ubo1KFcN5S+rOTSLeuwwDkH8lVPVN8YW/Pv6FAkZJXV/sniPZ4LgIAKf4W?=
 =?iso-8859-1?Q?igGXq8y7P9M/CEqvKtAkZPTC6/cBS170uUqI+JAfNDRUrpUuwnQTvA4W7r?=
 =?iso-8859-1?Q?xqMIq8e+xu/V2KeeXOuTvT0uBmq+xyw8ZF1flClWwAHhSLUPcoMHfQ3YJt?=
 =?iso-8859-1?Q?GYKwJHhlD+eJYG+pZfCa7ncipeob4Zn1Lw9W8ZRp6qy4savqCPA0nyWDLS?=
 =?iso-8859-1?Q?u0Np60CIBd+ZH/nHU7eYcI4jQkRAulJhSzJ+UlGiLPnsRqjSOJVrE5lfkS?=
 =?iso-8859-1?Q?HdNAzYCznAVcIYXYvgZ+5B1Wn69w4NbCUzby/lLfgpkDUNUVCYNgeY7clF?=
 =?iso-8859-1?Q?1O5HBHno7fhRY1UXWnuNV/f4I3S6gVuDMr0w1NFHnBGdhzcc2QwQPxaEAV?=
 =?iso-8859-1?Q?3VnnojIsGsOpHTzp4urSkmi0nW/6k7cbwnmgrca0kzWN6LVaMRGyFTTpuH?=
 =?iso-8859-1?Q?rszode1s4sinYDOuGE8DtfgeEa6h3AvAiRDZXK2N/mwBcGU/k9L2FMtk1w?=
 =?iso-8859-1?Q?vcKsJw3YYXW6HTWjmZr7OLGy5BqvS63erkhqeVcgc79OyPV3I3sjxD0s7W?=
 =?iso-8859-1?Q?zP66UKjl3eP2DGkCMoY+mAcx50ifaNDQj59d0uHWj5oq/z82LOCkdI5oAG?=
 =?iso-8859-1?Q?GKISnd/cYbpX4CmwsPB8mle29FwwBLkHs6uUZoGKHQ+Ls9lznq7h38XSwn?=
 =?iso-8859-1?Q?39lBDN3/ayxcPpYARcbELDDrAHLqKzS0IlGFTiFAaGN4UswR3ZoSSSLGaR?=
 =?iso-8859-1?Q?u4NZo0GWmEo/7lSFwmyNjO2PkGm//nrMhK04jrGuPzsC44pM53s5nalSKZ?=
 =?iso-8859-1?Q?KtlLzfZIkFW8C70Q/KDlNKJuxW5mMpIW2RuXrmmZ2o6mDO9w+lFh76MTS3?=
 =?iso-8859-1?Q?jTbIEq5dYmF6egYtTiMKi0PgXIvF+i2Ky0zbXdjH1HNOqQAbErZAiVc3xr?=
 =?iso-8859-1?Q?Vr4ma4qOTianmRvmKcWe5SBRsPBZ6h0Z6tEmLPwjQagM8KuJ1k598m7IdF?=
 =?iso-8859-1?Q?jQ08zvUjpEOCcSvLajpA7hcymETGKLCW20y2bCcbdnEs75x8ZC9ZB4Gygy?=
 =?iso-8859-1?Q?XDzmSEvPSNeJpmJIx5Jhsh7kENM999lfT1vG1SZi75UAxJB/+Txy/K9U8U?=
 =?iso-8859-1?Q?IQLOmy6HU/sfwyeUFutSJ4QCWEVnWZpnshuFwF2Drao6eXVR+WMD2E1Ugx?=
 =?iso-8859-1?Q?9bKdYd++Zg3RZqJNZ6p9sgG3riwezu8cHfPOYcgpSbhA+Wv/gSO/f4IDuM?=
 =?iso-8859-1?Q?V5gSosMOtAwSvV3U9xuETSydOguGXIkHH+Bueqvo3QUtVPuLyAPXSyrVC7?=
 =?iso-8859-1?Q?P49ahAujMr1lC5iny3SDfsXvz5rOl1Gde2M+RopTw1gZkRLO72c4xzFEBi?=
 =?iso-8859-1?Q?+mrXw9GaPQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Re3FnxfuNc21wnjQJmhtZ4B/441wcG94Bx08JgGKHhO3zyPa9OlU7iI+6ek9b6qUmDxa8ws2qZj2FH5qVhwPYCbDcWomPg91g3wRi+V9BHM6Bzmw6P+O9xLZIIl5hO/hSXixO3aqSKJk7zjk7f6gscuUcmMVGs3vaT9aBIMDsw21IwZXu5HKEteF8+GMr0mnFN2x+cDolkH/9cSpKZVscTxDoHUb96QZ+ON1y+wUBVFnzB2U9f3oNKBWN+Ip/ZSEguHloIG9PHcAlA87oUyUR//cBZRjb7DLLXnSrfTlmAfrB59MGyUnplNhP4LchYOxbUzT4sfOMfK4oHvhswzj5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb01e2f-091b-44f2-dbb3-08de8db5fc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 17:09:48.9797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjP5YhtWsVEkaiSRhwu/dbwGTuM+Apw7DNrmQlbeQYKrJ+P+wN2xzfBv1c5elNvOK9ZpM8rNkuMnlJdfSC3T3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1992
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMyBTYWx0ZWRfXzXHa1zRT4BDv
 Amk8OcPpJD4b0/u5cV5mCnW8p4TjhAfa2u1uHGLqf4h1Vo86YTc9qxMHxtZjzVaLmaA0aR0KV7E
 A4jWe4GeeQFnyTL/CSPiLzMz5wKVjRSaT8E3sKgCnAhbXZSj8ERqbrMOX4pdjt6KRaSEEyU2qZo
 uenQLi1MOKwh6BoKRwoxYJDFU3NGGCKzzDwafYWBn94rXdvdUxRdI8dVwYknefl/GyCC0AOHVZ2
 ECJRsyKKDxlwnN2wsSF19XuWaMVI7Stm408mQDkdc7P+1AIdF3+5dMzuWJsRjekjAV4ls/oQHSq
 ek9IjL1avBj1LaGDhPryVC+J7iQ71ViJ8GBU4OzqvEH9BqpIlhLrmcj8fLvgSz484LxDkw5vFo9
 anQCVGDzeIvZMfUdzqgkXkVq+hhLRZE98IbWfq4T/88CWEA3HRji7D4LWVj0Lr7OQLnMRwjjMuC
 uyCVdcnO6vRCZHIlK6A==
X-Proofpoint-ORIG-GUID: HLMQMTOpavJ3LMNGRtb1IhDo_J9g0ks8
X-Authority-Analysis: v=2.4 cv=DIuCIiNb c=1 sm=1 tr=0 ts=69c95cee cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=I2HXvSVKOc2IUxaNvNYA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: HLMQMTOpavJ3LMNGRtb1IhDo_J9g0ks8
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290133

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
pxe1610_probe() writes PMBUS_PAGE to select page 0 but does not check=0A=
the return value. If the write fails, subsequent register reads operate=0A=
on an indeterminate page, leading to silent misconfiguration.=0A=
=0A=
Check the return value and propagate the error using dev_err_probe(),=0A=
which also handles -EPROBE_DEFER correctly without log spam.=0A=
=0A=
Fixes: 28ccdfd11344 ("hwmon: (pmbus) Add Infineon PXE1610 VR driver")=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 drivers/hwmon/pmbus/pxe1610.c | 5 ++++-=0A=
 1 file changed, 4 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c=
=0A=
index 6a4a978eca7e..24c1f961c766 100644=0A=
--- a/drivers/hwmon/pmbus/pxe1610.c=0A=
+++ b/drivers/hwmon/pmbus/pxe1610.c=0A=
@@ -104,7 +104,10 @@ static int pxe1610_probe(struct i2c_client *client)=0A=
 	 * By default this device doesn't boot to page 0, so set page 0=0A=
 	 * to access all pmbus registers.=0A=
 	 */=0A=
-	i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);=0A=
+	ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "Failed to set page 0\n");=0A=
 =0A=
 	/* Read Manufacturer id */=0A=
 	ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);=0A=
-- =0A=
2.34.1=0A=
=0A=
