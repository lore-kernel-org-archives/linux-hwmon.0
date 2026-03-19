Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52F37B3F5;
	Thu, 19 Mar 2026 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964312; cv=fail; b=UTCJUyP2+adaHe/Si8K6XGPpqEw1DKIqQFlZIY8mglCuFlLWsQsksnIKiY8ApBaRraKPp4xu/1bfrYa2Sd4kpTxjswkji0CT3SeZ9OZg8I3+khhUtIpO0LKy8rNpVN2Wx07yV2ky4VMq0f7NW4SqbxaJ305Bvy0cW2s3WA6W67w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964312; c=relaxed/simple;
	bh=VXbZ02RZHqFJe//CiDytPHEG2/eyfAUSsSY/DppODUc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DZaI9XSz1cwYcLCYns2NiKkm7aJ5mPkmA+TzPcpsRZfeAKJtiB56y/ZcfevHExtBDwlITImN9CFcKDSx2155c1HDgq0DfmaJO7IX68z5kejR9abbc6zbxeKpJN21i3F4/D6PJ8dNNMA3rVYRrIAxm4jVAi+i+aWmZTd//N+Rt0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=l7SIvS0u; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="l7SIvS0u"
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JKECoG859886;
	Thu, 19 Mar 2026 23:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=ehQ6NFHBHsClPnBhHJzqwJoE
	/7ihI6OKrTB9Us9x0IE=; b=l7SIvS0uTTIjl9gHunhgg03BzaUU/pMuNYiKPq8E
	jwR/JrhWrCPGttLLqjsRg8EO5oGJs8kUegt9rItMHfvedOjGYv7ucFt00P43SZrK
	ArHdDmAyCBfR5nCSZQz2jA+nx8Sv2tQZDo8DfIEpwj9y/NhG9fQ5sXfQVdlk746w
	0zGTp+JgbVN6AysIVlvbzHXPDY03FH+u2IxocJCK/MCH85y6FGr7DuNPKhR1DeD7
	S3hQZ1vc5gfn3gmUYSohqQetEhdnbV//DTC5SPL8sd7mDvwUIm8EKqkMSaBNxr+P
	WyMAw5fw2ojOnhGcZnp9oL/dOActRyIYi8pOxF8xIjvIaw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d0jgfpagn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 23:51:36 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 6010480163B;
	Thu, 19 Mar 2026 23:51:35 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 11:50:33 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 19 Mar 2026 11:50:33 -1200
Received: from CO1PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 11:50:33 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNE4N1uhDqPh+yySxsJtIPmxuMHIp3pjenQsxyqiYtkSTQol++f9kbXXcGm3sL3tRJMDq2IyIc6bVWyQF3r/+UTVtsYkgtb5xZ/Ar4fPt35UZvzROfUTLj22E+0rbdrlPTViys32LkXinJUGEmZ7UIHsMlQXBELcC6xICbRAZgqCdoP1lzhCOySe0lHTcybaTBDIIsfDU+3vJKUybSScKvAcZ43T6/ACRTe8MeEfUYsarXouLtLHOTjfNdnQfHPDO/+ZzXEfwp0LqJTpoY6bz+abfv86LE7mcVihUs8gnBnrkZdGfAT/ocsMfW77UPcUt24i8KA1uGffeIWZjweNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehQ6NFHBHsClPnBhHJzqwJoE/7ihI6OKrTB9Us9x0IE=;
 b=KRozLT1rTRgNzxPN9Acyh9+A2Bvc4jPy0jdzwkOJnKJxNOXr4dnchSUCeXsAMmuToN/BbDnL2i7QEnegINgB0F7jHedEYbVxv0IG7EdgD5woiL209YLuwdPgj6FmwqPTdX3UNHHs/d4PRTHFDjBkidAI/uTMS/drXgQLCkDGmJx2QPYlIwsiI3HOJ1OFaxIdzHZ3dRWDRTWK7wtoux2gOeaPqsHjB8/LB9hNyIo6BtJNKZWFNRskGEqCnXyPvGZJUH3mJorBf8WYJfL70O6b76SeV/J3lL6JDE1di2Coc3de4USHfynLxoRlc3uSwRbPuAOaXVgCRTqt+kFrjO23Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV3PR84MB3459.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Thu, 19 Mar
 2026 23:50:28 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 23:50:27 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 0/3] hwmon: (pmbus/max31785) refactor inter-access delay
 handling
Thread-Topic: [PATCH v4 0/3] hwmon: (pmbus/max31785) refactor inter-access
 delay handling
Thread-Index: AQHct/sp9RLaqxQbTUy81xxuayRg1g==
Date: Thu, 19 Mar 2026 23:50:27 +0000
Message-ID: <20260319234945.151487-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV3PR84MB3459:EE_
x-ms-office365-filtering-correlation-id: 8be96f93-c972-42ef-1a44-08de86124c1a
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: f+PaG2Fg7Jmc4cW0TMe2t4mHn7Np6XqU+zB9nxVfPNgEHQrPd32NiggERb9wvrHmaLaE9KOi5OG84HA2ZjCJMkED00ICZPDEClWFRGaL777LQv2+d3Fu7N50S5FwUKlL6vp2cEXiLL2rvIuu21SI39emhmDYHTAvWJMVo4eRxT7j40fGp9cqzwHe6zCstUgcE95NFaDQhdUJj57lzwNwtMubk0ruzqXRdzTdZuNk3P89lnsmYUw33TjTpxXdbioe9C2JRheIHf/bpJ4LNx/ChapmTvpHKltG94wKUEoR51Xzeug2+fKAMHUO4pSB2NkuJCTsl28ZgEpQj1iRkf8QpisnSgPxYEyH6PWsPV8hQaJI/mrjxEEyknwY82nOScYXKmQzpcI8LeOjdMzk/3Z+4UvNheXDijhBa/JigM74Efw7ke0jWCAnZsmsLt54gSXULNaced+vQ1ZEIgLLy/GBtGWPG4B7+qg7l8zPj9GhEdMmX/HKGnxePDjcj7hHjKgrRavCcCNIdB+goy2IAJQONxYFfzj4ZDIcvM15xXliNHslqeSXgtVo9OW91qgbe2Pz2pEDnct+mc9SMP9RMbtDIli9S1HBZ9yVX+PBCuXtBblO1HEnl1jlHJvAAw+U6MuSPY9Gg35/4G4Iexqv5T6OxdCA/48aPCyOJnUz8gkCbCBwtFYn73SCld89PUUjnzNWLJodgf4LgMalHe1dYC0T49qWiKh+DMczwDML88dg7aJ6sukubqRgDMS1l2PwpHiVk9Wxy2PGmIqqSWF4EiPtpZhYL4oC60RKykTVplKobWg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fPTOcw6CbKUhFxTiSUc0e3CcWWkxWOuTNCElcRNKGsxatYsN99tUhHs6ei?=
 =?iso-8859-1?Q?yUpnIvknp6z6bQLNZlsjbUAm6SFKy/LPCwdX+7WC/ACAqovjyk67oSdmKC?=
 =?iso-8859-1?Q?UdoLiJ31NV2YEJyXgKg847FZ/OgFcS1A55jY2m0PGVKGhdr4PM5Yu2HT3x?=
 =?iso-8859-1?Q?v9HzM5lV3W8Ska9Ut7zK4csRy4f4dDJvDHk+IYLF+SjTg7hWV0yOPZRQQt?=
 =?iso-8859-1?Q?5LiAhzrQzH1QA6yO3B6DWuiRzUeU8to2217vrA0X8hhn1L5docdJR+PbFx?=
 =?iso-8859-1?Q?gRR08VoS7P+ZE2c7xtv/PxKgtnuqkZj5YBbWOS2ykwYjC8CNFgUmW0b2jd?=
 =?iso-8859-1?Q?aN6kI7Rh7PsNP7AY6Veg4tdixI1Si+l69EBlM9dEr0Sv9AJdr6wgKbTn2a?=
 =?iso-8859-1?Q?lVU9nR1r0259WTwVSEuJ47Df63DXmUYXtL6eU4Pq1e09jmbw989t0I8xyK?=
 =?iso-8859-1?Q?7JvySiypRgsUlaR2P/g39/GYRiWjqOWTgVNmr9ib3sS3f7EcHm543kBtp+?=
 =?iso-8859-1?Q?DSPFZjGLbpA53r478xOX4Zhl/sPkEPDFDPh1sYyc4ZF8YNeH+/r7B4Fzsk?=
 =?iso-8859-1?Q?J0qZdFC79+tFemvUq57GZCta3KMY9qKmb0u26EordmgesDe2r8pFuVlHCF?=
 =?iso-8859-1?Q?A95YIfDxLrOqA/QNME1rN9N+PhKXD/wlVO94eH78Qlujq6dqJ2fldzQ9wF?=
 =?iso-8859-1?Q?aowVzOr3w5rUIV8FaQ9yvS4TS9rH7CDU/y8K5E2uS4HQx639Xscz03N83P?=
 =?iso-8859-1?Q?EW892hglspqqO3jr5UqaVJKu6YL1s/yINgIXWzhBR8CMhQATE3sbX6T/nF?=
 =?iso-8859-1?Q?ef/vxKwSTdAruaoolwPeUP639R5JtAJXv7m/8N4mM+fjNsLZuvnENUEbg1?=
 =?iso-8859-1?Q?3MEqzw7OJIOyeCKYTdE6RhyLRk3GgqPfcYsCwPnl2PbdtBI9b3266PXOst?=
 =?iso-8859-1?Q?eNvV/f0Oy8gP5qP9h7fKu9Kh8Sfv/XWS9lA1/v6Y9TxemrsQaiqJmpBglA?=
 =?iso-8859-1?Q?eCUf8zn16IEUhRQdtl3zzKcQGYp4Pcy14vXIabEWk2LPOmMY7skI8FVC2b?=
 =?iso-8859-1?Q?3PVL5NIorFkIFrB/q7eJ0Mn06sPUa8SOUQNRUL9RLABd25FCkCUA2KsCrB?=
 =?iso-8859-1?Q?OfPuGcnShEmPrr9p2lxIv1FXppmvBuVoxpW9fLnrZXfRbYln1uFdMe80Yu?=
 =?iso-8859-1?Q?5tRjvEAwvZjfQdLlfSxlA3Od+aAAhLocG9mkpuxZJUiWh0tThHliYwU4k5?=
 =?iso-8859-1?Q?GhmplxWRCyxR2LlmVNsv4GDwPwsHWnTWRrPqeH9JqYnz9vgfowH2zeM+OL?=
 =?iso-8859-1?Q?l/GYN9xXbE4gJH6VQ2LJIC7f2uko7vBbgwbSVialIeE2IJ/g8OKuKD2FJu?=
 =?iso-8859-1?Q?eWuiedhWKUlH3hhVDg8GqfJPDYYThkY9TRcGHE3pQjBSyrt3jeLmGHEfXJ?=
 =?iso-8859-1?Q?Rl0nAK7iEeTXSeJjVYs5vhH0tu0fcMPMXlVtHsY1se6gWnmWnYaBT0pk7q?=
 =?iso-8859-1?Q?Fp4h1JoObLCdSEWdCcTpSTmCRVvxvMOHtp6ivyx0Xlkog7KaIZV7rhOquU?=
 =?iso-8859-1?Q?0nqfA1qvm74FuIhgd/mMPsJJBGAvVYGZc9h0h7t5bDcTwCOGMVbFjvuw/d?=
 =?iso-8859-1?Q?91vrTb5HoyWhlfLqC6zU0ubZQ8GEqBeN0IxYHC4ipDffuAouh2OwyoF3xI?=
 =?iso-8859-1?Q?MtHWwhVpdWzFNevAmqIFusHKMTa44kqrvc5+AwicN5wAf5XzPLxrc69Nro?=
 =?iso-8859-1?Q?wbXqQSTPlWAeg3n+ieRBi3ySRhqoS1EighBAmbSmVm8/IQYTukv0tD5Juw?=
 =?iso-8859-1?Q?A3WUnWb3+A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vEmxQxXua30fXBFYrx+avFg05dG3J4DRY2hnlTFMuYTYoq7tAjlod+LFbd83IPTV0jvClhLKv4Q5XZTfNd9gm788TAtFecKs7juTDIsnjBeud8XAZMBs6W4rhvm/xz8ggpQquc8Ejpo3oGk3EqKYDatwdUk33MVjs1NSUPU+jmfbmkTau/SLY1PY5DUTs+m20tHyrPTYJ/H0AS104n/2CrDVaYADYyeV/cK57PmYUtYyuhal21Cjep1pg8R8KLTVO7WQ90kU6bvRzjxJtsV9RF6ObTyyygc/HVJhkBarJUjsZLJLSF5ZeT9eDByQJ7NorlJ5UVjHHmuG92dxazbgRQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be96f93-c972-42ef-1a44-08de86124c1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:50:27.7066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUYs1gZr+8y9YVxN41Wjg5YOuMYUL8sYKhJ6vfWLAzkd/FvjSjsUdli/OY6YGIygSDmOIz7gY59cabHs1+m4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3459
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 17WO0SNfEi045Mb7vlWAfk02ZYbkGa7e
X-Proofpoint-ORIG-GUID: 17WO0SNfEi045Mb7vlWAfk02ZYbkGa7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE5MiBTYWx0ZWRfXyQh/rc6ZJ0uY
 OhxFWFK0xRI5VgozNeF0ukrSEG9kxKRMyxVsIQVgCQl/Bz4RafadCg5G8Ful//3LQ1OYyQCeUcG
 QYdGxGlKmFTF6Nqq1Wh6ZmZF9/dg8ke82GpDwTDzH+6Bp3LafyvJZppOVcVpSeld/ZSh/tsgCAk
 hRPyGTQonrwlkXlCGOgqkzVSrzb80j8dfBN04rdKuEu/elDj+XCPSqGJhHBgPiTHC0vhQaQOWdH
 8KGzrIK89JSM6CVBA/vi6UO9d7/ftOblsrBadQ5y2vfaKIE8RZt5o/T+0BuHYlvvd6xhBPnzaiV
 /vKkO3zkUez/mxpWSnj9VewrPvCkp8yGZwKRxU/qZRZNkH2QHZ9rHu6LFxnATC+pH0AzBouA+6L
 0OaQsnIfipZrpRy6CBeTj6j/wBnfTJizk8B8QKVJFmV5soZMkKECW7HLZjlTrvKNMTDP/E8efCk
 m5GRIWxblt9NRfG7FXw==
X-Authority-Analysis: v=2.4 cv=e4ULiKp/ c=1 sm=1 tr=0 ts=69bc8c08 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22
 a=OUXY8nFuAAAA:8 a=_Gc5KHBavwxTq9zUEiQA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190192

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This v4 series addresses the review feedback regarding 32-bit atomicity=0A=
of the inter-access delay timestamp and resolves the email address mismatch=
=0A=
identified in the v3 submission.=0A=
=0A=
To prevent torn reads/writes of the 64-bit next_access_backoff timestamp=0A=
on 32-bit architectures, this series now includes a prerequisite patch=0A=
adding a spinlock in struct pmbus_data to protect accesses to that field.=
=0A=
=0A=
Changes in v4:=0A=
- Introduced a new patch (1/3) to protect 64-bit next_access_backoff=0A=
  accesses with a spinlock, avoiding torn reads/writes on 32-bit =0A=
  systems.=0A=
- Updated the export patch (2/3) so pmbus_wait() and pmbus_update_ts()=0A=
  use that protection when accessing next_access_backoff.=0A=
- Standardized all commits and signatures on psanman@juniper.net to =0A=
  resolve the From/SOB mismatch.=0A=
=0A=
Changes in v3:=0A=
- Dropped the u16 -> u8 wrapper type fix (already applied upstream).=0A=
- Fixed a comment style nit in max31785_read_long_data().=0A=
- Added an explicit max31785_wait() before pmbus_do_probe() to ensure=0A=
  proper timing spacing during the handover to the PMBus core.=0A=
=0A=
Changes in v2:=0A=
- Export pmbus_wait() and pmbus_update_ts() from the core.=0A=
- Use core timing helpers in max31785 to replace local usleep_range() =0A=
  boilerplate and private timing state.=0A=
=0A=
Sanman Pradhan (3):=0A=
  hwmon: (pmbus) add spinlock to protect 64-bit timestamp=0A=
  hwmon: (pmbus) export pmbus_wait and pmbus_update_ts=0A=
  hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses=0A=
=0A=
 drivers/hwmon/pmbus/max31785.c   | 191 ++++++++++---------------------=0A=
 drivers/hwmon/pmbus/pmbus.h      |   9 ++=0A=
 drivers/hwmon/pmbus/pmbus_core.c |  29 +++--=0A=
 3 files changed, 87 insertions(+), 142 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=
