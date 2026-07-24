Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D23D9DDC;
	Fri, 24 Jul 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911812; cv=fail; b=rKOOvrfM+tikbOsFHB2pNEmfHiWtzQauM/Ruy8lCeWEWE4O1Nw8K+1gHuFCh5QiYZWMqEhdtAblM8dyYyP84OeaP7lrfihteFr7SGDv7otmaRdBh5CaQ+PSyzbZVdAKfhT2R9ksZTl2rlmtJQoIOcJA65Dv5ps+rXTtTRIQVV9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911812; c=relaxed/simple;
	bh=GvfrhTsxYCBonsoZK01jNlNUOMptFgMQfc+29ufH2bc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=B7EYbMtoBXjWkxdk6KsDSi27921ZQrxiF/jMdT8xYDoDKi2C2Iv8BPQNhqfw+kR7B3IljIuJ3jedVxdzyT05VV+0ISeAq5LoKuI5hOTbbj4Xaa3U2oEl1deWOexipcia2+GPcxkdtPnbE4g8WsqbT+9rMgJqQ/7rnUlTt2UF/hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=ZGfVq/LK; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="ZGfVq/LK"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbcs64142894;
	Fri, 24 Jul 2026 16:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=9zuDa/MTRSoTXVngTVYOAeL7
	/K5l+7j5aCL9OtHr5XA=; b=ZGfVq/LKDg4bR37L3Kh2BaIFovbXjfFhHGI7KIRk
	T69exucFUKGB71ih18hU+HhtZF9E3w39CSSzew4B7ZMrU+UIlYyRJtl/idf4Iy0S
	B82FJso6Gx65ZlA1v5zSwz2wgqfM7OFaWvWPvJN3pmKq+669uLLxyWWYcbN3vrnc
	nNRNAVnyvK8p8SmZJ1fgG1bZdTzHLd2PNU9X27WyoqKiRssu3H/LVzkeEL2VFoxO
	KfGamABDD8hNcb7tkC3ZOq03ZQghXN6u3zXJEXgPMnvEgacXVtNJPah4YbbrcsMj
	DIVY1IipsWxWT7JjZqd2JHJ668UU/DB/cz8euXJS6vZJfQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fm6rww0qn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 16:49:42 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 99C47805662;
	Fri, 24 Jul 2026 16:49:40 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:49:40 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 04:49:40 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 16:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYwvo9ZhBw0q4nUu+7BqEoZCWw22qrjFlPMVgtnumEDJMihmygvpm+OAnkT1ua84HYvZprY4f4xrBAv/wtZzf3nSYlR4Nv3yo4zDc5pOaij+enZbSnDCjtWLQWBaAM8CR6nOMYFB0oiu6crwBrIOoQ+Wq/zBZirKq1xxxaFPeF62t0BU2HL1I0nP1Ij96vb+agH7+dA+FuC2lS8888JToGjDm3Q0ngMqUaL+mQP+3qf973tlLpulZgMp8085AqKMczNf0CZlm/z3sisAelxeSsd/yRlJG5yhTj2kw40NPbHDhK1CQXDXBB5agCXqewoJ1gO5rurUq6ke7ODkVhNmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zuDa/MTRSoTXVngTVYOAeL7/K5l+7j5aCL9OtHr5XA=;
 b=Rq5ILd6cDFG/Sf/LrYqCFAXu+9qH2uzDKR4H/M7tJLwIPRCFVAdIwOfzDgk0Q5QcMapDOlCd0Z8BLLaOy8zYyt9n3ggJZYJo00dFh+gRsZGnEx8sVsjXPREuaeG2I3ENbExNPOxXgIplsWRbIKibn/h5qaCKAlo4fJnqU1rlaYxlISopjbqmIs7eMrVoW5S5giYHioeVV9fyYHC5NyV+zWUuhYt9AbArVIWu14kInPsEHVlVHy595Mw8UxjVYgBT+uUhlqwBBxTKaMYVo2eBxi+AhhE4a+jwhaRX5RRvutigFk0nP79HHxuIRdN92LpeHO5q/OoxLxLXPxkp/ejEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB1816.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:156::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:49:38 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 16:49:38 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v3 0/2] hwmon: (pmbus) Add Analog Devices MAX16545/MAX16550
 and Volterra VT7505 driver
Thread-Topic: [PATCH v3 0/2] hwmon: (pmbus) Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505 driver
Thread-Index: AQHdG4xqz8/jf7ewVU2FOBGs4bIdag==
Date: Fri, 24 Jul 2026 16:49:38 +0000
Message-ID: <20260724164919.247162-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB1816:EE_
x-ms-office365-filtering-correlation-id: c88e46ed-2c18-48d3-90b4-08dee9a38cb7
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|6133799003|18002099003|38070700021|3023799007|56012099006|10067099003;
x-microsoft-antispam-message-info: 4berP8ncrniO1OzFcJZ4vI5tyGjyo9R5BN+66RpPxXnjtsrG4OIws1K8gUZwjj5IOQqPI415VJpMbwm30RTleBx0MOJNMETr8ZdkgQkPc1qfGzZvyKQYVB/6+jYbtZonEyof7ISwr5qm6teTKFoCXrJueBt97u5iRgqnkgR1MTQXl4abEvdcxKh9V1lA8Phki7CTlozRXy1wuDZIFWIbD2ZPl348OefUys85U4T281scMK5c5VanoOVSzU2+fgUwHfnpAE4YwPflSGXy7oRIn/zJF8FihoVMun/c1fhzyirWTVR5Uci44oJslcdH89SpI8jHqCgzVo4AusFoHMgmcbiauX0OchpT1g6o+S+WhcPpuihzOtJbRBxPSQk2r0ya0JtF3FsxzjkKWQt1Vy5FzcuQBcXddpcJgN54Mz6035DEtnhrxvycSv7MHpf115Li+lltZUK6EcAPJWkCK5eN93KRDXpepce6teURVGJ/7l+FJhmCkeIjottKq2cuW3NMTvOszHHSw/lqsFZWGQFO8/IGVKwJZOZ+qxitqa8ARLmKvorGj65uohBTPIAt9LH06X4WX+2dKZOTQ3yGImwepjEIeZb4OiSNG9m7/GSbMo5qDCx/ZMzYcph1c3Te3z2KaJKjjlVQSzZOqbyJLCkuyzttooOkhE9qI+32p8ABGpCIzQs2YgP1bVyqgSl05647BmUPqgggC07lWihg1gpAIB5Ex/QYYNnD1eQ+SFVHX7M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(38070700021)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NXetrVzNIHFAEYiFgM6a/JLbqUr8HfstVD1M0SHniFA3yzpbkBIYyJBQgr?=
 =?iso-8859-1?Q?wfRPUAPTyyzQDJwfRcUhJ+MzivRqfO0po4yCMsmawzEAq6Gp+kGsNxBLyV?=
 =?iso-8859-1?Q?K5dfucFWQiwNTAAi3y/UqzCGilnlaU2tYodE1Nkf8cWkRNXXMz6AIwnT1x?=
 =?iso-8859-1?Q?ztRpzIv2Fb09eGwC4wlBDSQQfQW3EAEeKi7+3a+t/93yWbHlVcqOcaDrA5?=
 =?iso-8859-1?Q?Orr1m5CYsnJ0oMWPfOWd8YqMHMQDKn3AuFoY+Wm8XLKUuS2DoK4ozeMfUY?=
 =?iso-8859-1?Q?aQWW/8fN3994F2xQYGgnQvyyujlZfuP7bOHnhlkPD1odsY4SSW+t+fR/04?=
 =?iso-8859-1?Q?1gAIb/EvtKI2eOdDVtF1A7u8wJ88HMqiNbwuKF738feaHnfO/aJkblX5ez?=
 =?iso-8859-1?Q?wGo84fhbqcUcZTSXFIaR5tUx44xfWWZ0hT9rk4VpjCagk65kxlQ1sCmIjJ?=
 =?iso-8859-1?Q?4npyErdNuFFGxD2TukZrXhIiumjoiEw0uD6+ZXp+4RJ5v6tvWs33mPm0ve?=
 =?iso-8859-1?Q?58S1HSd7iuAeyms+/DHTXv8+8aqhHsGImmYIEvyyc8+xc1X7UcydGtkoFz?=
 =?iso-8859-1?Q?x6TVX0avzOPO0cRAz2daKcxrryyn0xIIx+hrs92/5+Y+G8JIFDXNVcJeA3?=
 =?iso-8859-1?Q?nJ6U6Rd/+izeS5ccUBiAZJIg1s/CKF9XklCTiS2dQ6AcoefhE+uNuHGLhj?=
 =?iso-8859-1?Q?lOIOAAwLHx8wATXMDIZ7mzxTTcr6vvLpP4XcTqMqXkMZ/56rtd0ce7X+Pk?=
 =?iso-8859-1?Q?r0kboENlzd4j09oYps0b35vsyP6SQ6Y5rMRjSg/qyo1wOGsFAPqcDPtR5L?=
 =?iso-8859-1?Q?AsZWNVaxz3+ATxX3hYUw7jnGd6F1SilK9LWPuHLG5lHHe75+QzNT7HtTK3?=
 =?iso-8859-1?Q?XtlQKLqq83RvSG57keKchHJZ9UOshiErn2ZIQtQ7iG6hb8J318rkn9XtEh?=
 =?iso-8859-1?Q?6qJCwZDNZvi0cUCdqm6F3PeVUaJVFW+kqbwFAQcswM1FVVFjw+n4/34IOo?=
 =?iso-8859-1?Q?cZjfCS+nXs5ieKU8TNPsOzsI3m2HMIL/KdsmbHBkPuYMW9IixlAnamDnvs?=
 =?iso-8859-1?Q?qLRDVs0hNqlstSWMnDh6tMzerhscR7WrUL6z3IO27TvMqBs1W6pLsSo3pw?=
 =?iso-8859-1?Q?OpEyiV76g0s5cnS6VI7Ztx5tCJi4tu7sYkY9QkFzHEc+iqLDKyKu0/XCv9?=
 =?iso-8859-1?Q?UPV6BhqND24X567y+ubMe9SCupyM9VOX35eR2eQQf3HGftPNg20tYAGzhW?=
 =?iso-8859-1?Q?URiXMZHuUwfGZjARIFZuyREMosP4PVxRhnT5ii3dCFGvw2gsNcooPfWxkH?=
 =?iso-8859-1?Q?Drupd3OofJA5ztsW239iwklsy1t9U1TsOTZBKhMbrSLn/8TNOocw3mTLke?=
 =?iso-8859-1?Q?QbQ3SI7vCtReYuX2MD3k6mpzMhMiEcENS91i7rbtJevrOYmA4zIzaI7mmJ?=
 =?iso-8859-1?Q?xxxGti4Bg2jkx9aiph3B9gBN8HXf0xpWUua4eveDauOUxLIXE4lU75Gxu7?=
 =?iso-8859-1?Q?x7e6V4d+jb1dD68QZ1TES7gHm/p7iwaMeqicUzNBvBy6/B48fa+1vElhOJ?=
 =?iso-8859-1?Q?6hMqcLxhh06WFPZzfAdgWoGHQahGpIpuI+ZCaJay3h77fDWLqOe2SSCUFk?=
 =?iso-8859-1?Q?/jQgw8ghRfcYz9CIhS6sGQI/M2GduImyPSWrhysyUN/hsNA4YjDDt/S3rq?=
 =?iso-8859-1?Q?byO1qGm0eVrH/auPdiM0JT2rx5a+3cImfkNO0mfhmTdh4ym4Ly71bj76ep?=
 =?iso-8859-1?Q?3DffjP20XO8XPjh3RFtNGilbQiZAi937dqM1V2NC5oVtA1DsNgawWATrC0?=
 =?iso-8859-1?Q?QABr9FJ5GQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: imlm2nzDAeirpugQ9Q+GWTwMc1i6B1+OsXHoFAt08wDWLoQzBFpk2SgdBfgrU3bfAZumFEcCZzSBNwiVqzLljoC5oaivF7LtrZtK5+VhaZImmQq8swaH2dws7ALGgfWUIKGspghU4ue/QUc9l8/OSJnyMRxQDt+GYRsi3NtaTQ5UEfbalhPOScSNElasACmAaqDwjRK7h5PhjQUlXU7TIIbx+SvLVatrMf/XQ31Dx1263LmUJH6hBl9p27JyZIBNZ47t7QZX4dtQmQ1x8I0pQRf5pXjJKDydRlH93Fu6YhvHorEDMGF9VYehnCQqPI6aWGR54z5HbBf60fB70SEK3w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c88e46ed-2c18-48d3-90b4-08dee9a38cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 16:49:38.2411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gbta8KwaTN6rMV5IBRa+gi1B/iPIfs1MSKYr+zVpIbB3DdEeYFnwkd83ijWSV6ucyFAllqwQxIqIdYQXCTHRuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1816
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: EGVsMZfFOp7GEMCXyioSlH3U934FP2kg
X-Authority-Analysis: v=2.4 cv=XLwAjwhE c=1 sm=1 tr=0 ts=6a6397a7 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=sXUdujponYPtaW3b1fsA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX+LuqeknF+BeK
 FgZFoxqK6DIwVhLM0+dD64G4oCI4hEg7oboWdUYDjtSjmi6l718eBZn+zlUix9fCSvWyTTL76vX
 A32y5OPOl1c5K6PaMceE94uwtSCgQhe1Quxa/7tkMWPYCHXAFoqCvK07XCBnEKn4gH/qf7cfDW4
 7EnUr3TQgp8z9YzdoxKpVAUL6FSiBiVMc09s6WX34SfhCi99sPWoBazg7jg6yLFpfI7uZ2lXFl9
 FXi35jP/q5P8dk2DKFPc3g0kFp6qKkO30UljqANhfdKK4R1AOL92TVqiCnSV5C9SBzaqDnmzcmJ
 Kt/ALBRD+ziGmgFovFr6OBBrFr8JrGMghgt2LpnJtXooqkNoo/2uSYhcqlgEZsrvxRYFD5CPnyu
 6FEZN4tTuMenSjU04/0Etf5rlLK3nVQlkyLLEgRb6QjuQ+f72+PuTCm70eZis9vnj9HPdcdrTGd
 5paAp6r9q5twj37BAJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfXwvENj2x7zKtS
 iUfy+tyaKjJK0wjnITldrJfl1Me1s5ALOjb92XAqWMGEf49Yn+j0jR26Xm8OE+9DIwn7WWKpSig
 p9IX4U/23vJxDgDG1ObecLM+/h1L59A=
X-Proofpoint-ORIG-GUID: kxeYZujUOFT1zYn2WweyuwnlU_4JvDSy
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240150

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series adds a PMBus driver for the Analog Devices MAX16545 and=0A=
MAX16550, and the Volterra VT7505 controllers.=0A=
=0A=
The driver reports input and output voltage, input and output current,=0A=
input power, and temperature over PMBus. All sensors use the direct data=0A=
format. Peak input voltage, output voltage, output current, input power=0A=
and temperature readings are exposed and can be reset.=0A=
=0A=
The MAX16545 uses the same programming model as the VT7505 and is=0A=
described with a fallback compatible.=0A=
=0A=
The current and power scaling depend on the external current-report=0A=
resistor on the ILOAD pin, which can be specified with the=0A=
"adi,rload-ohms" device tree property. On the MAX16550 and VT7505, the=0A=
severe overcurrent-protection deglitch time can optionally be programmed=0A=
with the "adi,ocp-severe-filter-us" property; on the MAX16545 that delay=0A=
is fixed, so the property is rejected for that part.=0A=
=0A=
The driver was tested on Juniper PTX hardware.=0A=
=0A=
Changes in v3:=0A=
- dt-bindings: clarify that adi,rload-ohms is the ILOAD telemetry=0A=
  resistor, not a current-path shunt; note that the severe-OCP filter=0A=
  retains the existing hardware setting when omitted, and add it to the=0A=
  example; move additionalProperties after the allOf block.=0A=
- driver: use per-device match data instead of an enum (no zero-valued=0A=
  match data), derive the temperature coefficients and severe-OCP filter=0A=
  support from it, add an explicit adi,max16545 match entry, and replace=0A=
  the SPDX-FileCopyrightText tag with a plain copyright line.=0A=
=0A=
Changes in v2:=0A=
- dt-bindings: represent the severe-OCP deglitch filter in microseconds=0A=
  (renamed to adi,ocp-severe-filter-us, values 0/1/2/10).=0A=
- driver: map the microsecond value to the MFR_CONFIG[15:14] field.=0A=
=0A=
=0A=
=0A=
Georgi Vlaev (1):=0A=
  hwmon: (pmbus/vt7505) Add driver for Analog Devices MAX16545/MAX16550=0A=
    and Volterra VT7505=0A=
=0A=
Sanman Pradhan (1):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX16545/MAX16550 and=0A=
    Volterra VT7505=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,vt7505.yaml      |  84 ++++++=0A=
 Documentation/hwmon/index.rst                 |   1 +=0A=
 Documentation/hwmon/vt7505.rst                |  89 ++++++=0A=
 MAINTAINERS                                   |   8 +=0A=
 drivers/hwmon/pmbus/Kconfig                   |   9 +=0A=
 drivers/hwmon/pmbus/Makefile                  |   1 +=0A=
 drivers/hwmon/pmbus/vt7505.c                  | 284 ++++++++++++++++++=0A=
 7 files changed, 476 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt750=
5.yaml=0A=
 create mode 100644 Documentation/hwmon/vt7505.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/vt7505.c=0A=
=0A=
=0A=
base-commit: fa8ff8bde9207509f90adacc157b208ee732adad=0A=
-- =0A=
2.34.1=0A=
=0A=
