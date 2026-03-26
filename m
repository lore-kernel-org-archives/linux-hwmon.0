Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865133F37A;
	Thu, 26 Mar 2026 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566601; cv=fail; b=TKBievqNgKGDQ8LhuasS9n1d6OnSSXVLUXqJTPSnl2rrFyQAajva0uaw8hAs0QyCJ0Zsv5eNVa040TnW782BLokT6SMY14KXEf2Ia3hYoqselKwUywo0SzA5aMvDPTeHlEVuUrEpDzOdv9XglAjr/+LbwwdD3d1SQt2RRPy8oA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566601; c=relaxed/simple;
	bh=q10AOFc0nkKyvV9JxvaFH29AC9x446A3LLfZ9ZtrdBo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Bo+mpnboT+LtUF2fbj2ZFfv6U6YehY91VBiCs296GCfJWV8FWjtLI7gWyxhZ6AQjBr4+vNDQMY4LBz9CH2k+JwE+gi5tftk6qizdlIcQ9gpO+C4GNmWWxW8IF02ehkS8uDi6wXy324UTvbC1RX0RO01Xug5p9jr8QMTqMn9cdts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=YMjf1Zvx; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="YMjf1Zvx"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJTFRF1854928;
	Thu, 26 Mar 2026 22:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=0Vxd/6sqbPDbyIWsOApQOWcm
	sJL8W67aRXhZbRo8ZAo=; b=YMjf1ZvxHtvEgmHCYMimXKt+F9dYvMYXluQqVcXY
	MCCDoPbzArh1tkghHhtKqN79/7yzezIcED27t9KWPCQN8khpC6t2p5zAHfvYsa/U
	3bhkDX2ILBzERV0Bou/dBe39VN4TMpJJP/yOwPNcRCWKZ8JQF2ue9Jep5l9Wz16G
	Ve/nunifI7hH0IRFTE7rySmDVvaRvJsaEUoGhnpXbP7VOHDVFnqZKuVJ7lwCfz28
	IZYJqaL7FZfi6fo5Wvmn3XSZSOTLbBWWnfCDqRyamOAtjzVS1z4tnPgxFTwafzcX
	MPXn031xYU/+Www8zed875Klppslyf7n7+Q7N4FPq4Sonw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d56uhnqrf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 22:45:29 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 555192767E;
	Thu, 26 Mar 2026 22:45:28 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Mar 2026 10:45:21 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 26 Mar 2026 10:45:21 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 10:45:20 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsPRx7bKh57NhEf7ryLoPoEY3dw1W3/91HfxzYnqYZuVnP7R0P4d614C/FLyz2pO9JphDVQBkhAmvJ0ojFPgKKzXZd2fnEMx2LKihinawKCHvpIj5+Y+Xbha0pw3wrmi2sWezzJLuhMmlY8zMOsDNFaDhcotG9I0ykdRExmTSmRmE4c+AtpISwD03TtjQHIpRtjY43V/Ly13+d4ePmMOdXWnNR+p98KIR9ixoLBWtgG5SxbGdDtIaFjJY9y15e2eN+fnToJqscLizAqh9H6nQ0Z2qO1AGsTLw93ZBQglADiTdBPvBnE/An2cfx+6yv21vqq+4Xq8WHFJfDqVkVPDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vxd/6sqbPDbyIWsOApQOWcmsJL8W67aRXhZbRo8ZAo=;
 b=Zo/XSlUJ68ifGMHTqXp80Zd+ZBpTGYm3a3Q9IL7IBfrCfwydGUB7NvatpS868qyYlabZqIpv00y31JWQRf9RLbMI6mUtcG+U0ut//oNV4hm5wY2Z/GNoAR98axGIlle38yaYFz1Wxrw6IJOznpC3XQyrzBuMIFFgHN/mRsyjrbWAbUIwFIKsaExUCPvL72t4rltahg9G1TJwb7dB4mpLvQXY43KxcqeETmJP25jdc5J07yDfLUpPd+VLLcRXA/zx2+o1ZmQ+wVoy3dOtscUUJogR9xhcF4I4/H5OvnAdhDNdPEHPKwJXKMgOSHBPfe8NWTGLcx7RrBzaLVDIukPcSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV9PR84MB4031.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 22:45:19 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 22:45:18 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended sensor,
 and remove path
Thread-Topic: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Index: AQHcvXI4vvjQBfqWwkiz6FB1AZzrTg==
Date: Thu, 26 Mar 2026 22:45:18 +0000
Message-ID: <20260326224510.294619-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV9PR84MB4031:EE_
x-ms-office365-filtering-correlation-id: b4827881-4a7e-44d2-637b-08de8b895b08
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: +LbMZwZNdPKGo1wi391ZASSEP3r7u00qAniUeN/SfeEE+TV+FIytWjDznogimhlpR+12TY0JBHPzhvxJAL1qNl5BVmSYv9eyNCoQsBxuxtW2SQ1YD3eEfR2DQUjd5zpUjEYQn+mfl85lf9nPhAsXl84M5lGufulm9Yzl+kUELpPtaeNhBq83QZgLxd9MdkZeRIS5K92rbwNmkU/UwF3CrRSfbV8+PN0BWNvD/p+Z0CJyRCof1RHc9ZxhUcvAL6Tc31j28iGgPnveG5CTbcrdKW4MalL3Vxjj3TKpjrFHYcEniQ7ZSibrL2LzLGxAmOTrVvbxmfG1EoQyCRe8adbx+1Epqc+3vepszC9dvNKz60Rf5jLBQYyOxXoJpI/2c9s3WS6EjgvmjEjQdnrUksyT0DJsiTHjORp4qOlQt8YbTjh8HiFI3NCHMNodMSakS7v4cH+0p9AyfhhgT+jtEe21KbZRCxonTuuBG6XXp+KJl6AxkyAmxS5cGSLoz3LYIy50iDScRjH/tGyVTCXoRR4V0d3NKJB+9x8CA8S6aJBPZ6w26rmeoEX9kEC4QfQfbSEdbU30bmz3sndWdgU7hKGEsgrpAgZsoji/mj2hKTstKZ9Uvk8aR0JK9aExXRpCiH9IcTawIwDjeaDQ3YNbsJB3NW2DlrrCiYgWOX0ncG2SLuHP3oE4R88Ln2UgYGDo2fveK7bsInu4Tylj8pb12YFa7I0C/7jL4Gx1h7Cb2Vh0pQ94YccVuHoo7sCpoKM60N9FBsdHRka4W82rsvdf23R/dIUM+98ZSjOstkdxf3OBsjQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4Kap3RWDBpfiUtTpJ7l/XxvXOEOGYG9s0dXSdah+taztpknYBLChm6b7gh?=
 =?iso-8859-1?Q?JGF34TgtbpeIKOi3BmWV1otV+9PVsiA1/7PZk/rpw6+lFIdtP5EZAfXWeo?=
 =?iso-8859-1?Q?7OJSShfSmxQU1w4iazG9jbFfNA2W+4HHMpKfq7IUGugUJikrvw7Yr9KjJc?=
 =?iso-8859-1?Q?/pidkIxvgiHjN9pGYts17REEwYH56ojKrTawbEX0u1zEvNhlmYEYey90p8?=
 =?iso-8859-1?Q?FnqHvKfgBsrxeA6aycJMqEMLv7CqY0jfdSpLpaKn53BwiGd6vXoPDENet4?=
 =?iso-8859-1?Q?y5EGr1+XH3e4Nql5qiFui71uY8RjRWZTJ3RtcMOuOVcVUsSjl7URZ8upBX?=
 =?iso-8859-1?Q?g9rfFgRLGe6Rt04PLKqa7ZIVKSCHMtpjKgkOf2HhI2OWdCjswKbZOa2MUG?=
 =?iso-8859-1?Q?SHZbo0N+PIIwL848zYGTreTGCq2gURXW8xUlmigEsKYjzOPRgUOUQ9481A?=
 =?iso-8859-1?Q?BFI0+g0LYwDornhsOFDpCcT4lRYP3byRmaD2C+tdL/1UYHmoN5IyPUHo//?=
 =?iso-8859-1?Q?BwFN94sbHazhlLpzEF2OjaAjEKKJ8T8UUr5eSWEv/Mlx7rOAUovNPSIZvE?=
 =?iso-8859-1?Q?PAi/OhoukVdRxHpXbjdLaSYTF2AnXPfdItwcK9ZD+1RSrlFpRVZAH2aW8v?=
 =?iso-8859-1?Q?hXaRCdn6l91FYE6cbDfElnbXoWLt+5or5glSSNJuGdPF3Heqa/tuyOWT+O?=
 =?iso-8859-1?Q?sPaWpzr38ldZd6ZmngZfyP6z+MQq/DrVNY1pcb4nEaInCaKnXzXXQB3Bzs?=
 =?iso-8859-1?Q?GfseaK0kes08kXeMinaueAQalWuyynTePkq8TAwAQgiF/4i/05C9Fx5hYv?=
 =?iso-8859-1?Q?wTwDTWaKXOg3tyL8IPIXwKFoXBzLhjWvInj8ee33rs5i3TBQlaqUe9+6ZP?=
 =?iso-8859-1?Q?zVs5kBvsN1b8w7cksQxFoxcuerPpRvQea0azaSOZyL4pzwfDiiJ2X/pvqM?=
 =?iso-8859-1?Q?2cCn/OfFmLxe0qrs/uE4rS4pk/P6KPrLa0uPksjEu3NGspKmJiSINi1UT1?=
 =?iso-8859-1?Q?C/WqyRza4TGMljrnKeIhsujx/+OnNSvgSl79LiKA47Ze0eq09ZksHH/W9G?=
 =?iso-8859-1?Q?iOq7+v5CcdNcdkQ5qZ6RiTxJFV8hv3NXdPsWR6pBeFN8mbmItiv5Esdupp?=
 =?iso-8859-1?Q?no6SxCd4JqGYblNH+5Dsfn0FJM6OmqxxRFdF7sRn6/8H8TrDA+P1NyNo1G?=
 =?iso-8859-1?Q?93BtPOI44ju9v6qiNlpxHBlyN2O69/8ah5hMaOxdY7/uaYnzmJ1MFG90vx?=
 =?iso-8859-1?Q?qS0yd52yQpPexsd2AzujSkmLNlqhHGa9Ii2AJnwrPLiRtchpoJnZVk+msm?=
 =?iso-8859-1?Q?5+ol6bNQt39uLlSyEYipuDBN3K4yaLjPs2mamUslLoHkwq+KzHKEoMgC8v?=
 =?iso-8859-1?Q?nE2OHsY3lgbTkaksQN1XAjoZ8KjSDJ8zqQ2FrsUJJmivUXUGqT23Q7QZga?=
 =?iso-8859-1?Q?q42zVB4RAkmMATsg74QrlGZvZ0+X5z5wn6njTb0vYPdoKyg9rR41VuErRL?=
 =?iso-8859-1?Q?nQU7XIQ+Lio/kZvK/9WWCKwk/nYJ/Dy4y+9Tdb3/oNSYXYH+m/P93fK2km?=
 =?iso-8859-1?Q?Z/VZAR4bD+tW9qW54QLMJ2MWveKP0wBekSafMu9Tu9jkkqy4jCmnXgk/9v?=
 =?iso-8859-1?Q?B8eJ9PZU93fsXB/GLJbOc7XK7Q52cQpg0l49yNh71J6ZWRgYpj34wQV4vp?=
 =?iso-8859-1?Q?2yuqmwZao5Ksl/RU5SFIO5GCiW0LUPlFHjZFp3DyMd8eF1TUyUb4mrQowJ?=
 =?iso-8859-1?Q?0o7d2a0BO5GNLfKhliuELM7wiBo1mSSBofun4QcKn7IZh5CJ/lrU2pE4yI?=
 =?iso-8859-1?Q?xz5K2iUTeQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bYSDsIUUQGnVPC91D1UGvdJenQbTO6UKRkSOW68ygyQ8bH4tMSAOGQp1FSJg3K4yDVgG4TRhlYs+UG+jY4fxqec7eUbfLnLzmN8bo7knsj7Q5f1psXO8LraPaB8R2SbCpphIIMr7KtfjPxNtVx/ic0JxFn0E3jTyadqWQLF8w4o+S0lDHQfnnAcTsP9kmsw3ahlNW3eE9PmIxtFxQkyeP8yOkL6ve2olABaTASQN3elmP6z4KkS1YlI26mjiNZwg32Q3E/oM7RtrZAJa6aag8JqRFjACPj5vUSeE43fTaPo1pDX5KzW2rA04NDKK4fIoLuYH+nSz2k7i1gmg3KW2WQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4827881-4a7e-44d2-637b-08de8b895b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 22:45:18.6862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hGXHqfOU4VA3kzFS1gcQkFDg/JYYI2jLhT8wb2lqSIqSB2x+r0eBLqls0PDac/oRmE0AnsYvfqBpC+6lOlNwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR84MB4031
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: -FNjf97SUnaA05OjH9AROD62OZiJTg2V
X-Proofpoint-ORIG-GUID: -FNjf97SUnaA05OjH9AROD62OZiJTg2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2MiBTYWx0ZWRfX+J6OiCAN9R+u
 ZX2FKmThypmbtJkG/idjMUWhwvjMxX855JLb0PVnR1hn03skoDnKGSoz7bPqi2FDa8lOnRV08xY
 XORD1JrXzGDsIgIyV6Y48Me7he9uj3omo+SjKtaCpFI+wEKsB//zSU6ceUjBMrxAMM2/bOSXK65
 pDK4qTZk41LX1nwOvzvhJK73jX7DjdiY/EPuVmrXmfL37A1WjlC5BsE18EFe2CoTQfn7nkxRIkP
 yRjpKxjOEme+OezPNzPEj/K1zmMUfCUL9moBNw6kyj92OQMkufXN/Ls63HlZ5083tQxD2yA0u8b
 sGtBoiooUhj6TeVse+L3RYk0cEEVL2WARDENQQJzYzaftfWKdtDkTtwrdrpxPVFrghiJYQPkz50
 Zv+9TmLmwe93N3PyyL8d1OLmhPcPfYGwRAqTMOZkpjaZePr4TPH6mgHQVb/AVXnX7HXs1KKkdNc
 kfl/AXFD/iAgkpCwcYQ==
X-Authority-Analysis: v=2.4 cv=TPxIilla c=1 sm=1 tr=0 ts=69c5b709 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=OUXY8nFuAAAA:8 a=ZF_kxDWqk9jQ6GxXvEIA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260162

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series addresses three bugs in the OCC hwmon driver=0A=
(drivers/hwmon/occ/):=0A=
=0A=
Patch 1 fixes a possible division by zero in occ_show_power_1()=0A=
when update_tag is zero. The power_sensor_1 code path divides the=0A=
accumulator by update_tag without checking for zero.=0A=
Commit 211186cae14d ("hwmon: (occ) Fix division by zero issue")=0A=
addressed this for occ_get_powr_avg() used by power_sensor_2=0A=
and power_sensor_a0, but the separate code path in occ_show_power_1()=0A=
was not covered. The fix reuses the existing occ_get_powr_avg()=0A=
helper which already handles the zero-sample case.=0A=
=0A=
Patch 2 adds a missing trailing newline in occ_show_extended() for=0A=
the EXTN_FLAG_SENSOR_ID case.=0A=
=0A=
Patch 3 reorders operations in p9_sbe_occ_remove() so that=0A=
occ_shutdown() is called before setting ctx->sbe to NULL. The=0A=
current order creates a window where a concurrent sysfs read=0A=
could see a NULL sbe pointer before the hwmon device is=0A=
unregistered.=0A=
=0A=
Sanman Pradhan (3):=0A=
  hwmon: (occ) Fix division by zero in occ_show_power_1()=0A=
  hwmon: (occ) Fix missing newline in occ_show_extended()=0A=
  hwmon: (occ) Fix potential NULL dereference in p9_sbe_occ_remove()=0A=
=0A=
 drivers/hwmon/occ/common.c | 20 ++++++++++----------=0A=
 drivers/hwmon/occ/p9_sbe.c |  2 +-=0A=
 2 files changed, 11 insertions(+), 11 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
