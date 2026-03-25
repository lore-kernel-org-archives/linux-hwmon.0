Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D81DEFE0;
	Wed, 25 Mar 2026 05:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774415618; cv=fail; b=AeAwvu0VuoUOrbV+RhGWlvD6md/pRgz28ulQRbxT1YWDR2yQV2tuk111jjrJm5aRKBB1+gR+bDmxcuksYY22fYNKazdx3+Ae6ZbzJkUT+L3mS2cvv8QGE+IAKYlVJN4BaZkQyFzXs0QipE6Lk//hprMSrJ2qAY76MwgWy2KL31k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774415618; c=relaxed/simple;
	bh=sTBAQLvB/8VZGoLlvApmnDpkMir5St41aXSD5KECuUE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cjzlpMxaNcfjhPu3MN9gK757RNMC/w33NijqmdE5qV+1DR1irYzeoyZvtADAWov+BUFxWviLuyGPIoIq8xg5AorBByDRP/g5IIPAA3FQLsfjFSlSTPdsUNLKeHupY6EcNrgutmvc4EmztjeAOaP/Q5O4YlSbDdyY6/7WfAlQ05I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=btj/+TY6; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="btj/+TY6"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMDFAc2890142;
	Wed, 25 Mar 2026 05:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=MX+BgGbSD7iEcAwuh1RWbPZV
	C+YOwTzWGhxv2j4mJxo=; b=btj/+TY6DaCESFIRnU7lLcxa/Lti9TNSPOjB1dCX
	KDGX8PbdgY4aw/xfHczb/mqFZ8+abIRGGeapXFog/v5kf/zf/OMOVm9hUfAJo6pz
	bkEMmHm2Pyr2J7BV1YIgrO7BQqCqhVmuvxH8jXgWL98Kmt2eK3kQxLs8Tr0siBJk
	HPNOaTjYsrAaq7eC2Sz5vVNESwJGBQThOZvRWui37dRU5fzJyfQ4CbYh8KNywnOI
	D0mvBFpLY//pCl0mIXX9NKk2bF/KZ1p4h+X9zSitdUZl57hNfWEelgviFuR2b4pr
	Alx6NETjkNjwfRJtD9xE+AWuH8SoRQcsFK+seGEHzfXkhA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d4375ute0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 05:13:21 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 5F96ED1E3;
	Wed, 25 Mar 2026 05:13:20 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 24 Mar 2026 17:13:18 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 24 Mar 2026 17:13:18 -1200
Received: from SN1PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Mar
 2026 17:13:18 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R87X0t97e0tgFUWK08b2F4Er3+Hx2owRQdPha00ZbNMkIEjvppcFZwNhg6qlOkYe3kg5Z6OjGSKPEAUsoXVn6a3iB5DDg5tQy/QV45294QKSmjVn1cP0b0K/VgmgI8Db5esgfT+7+9x5FsJlAx03sfUaxq5kd/ML+PBeJYW95zl4wUSc6ObtTS2W14DdWpSSSJR2aq1RPtYqgrpXOyEudYNbcQ+ucoTAla16TNiMIL4ygR3UA5erJXPXsOn/Aanblixv0lExSd7p6mn4annqEGX2JOnNLEqCag2qTce9EwDoCEd1WqQiNf8cIyTeEU2K0jqgpCUahNf14/NHRMy3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX+BgGbSD7iEcAwuh1RWbPZVC+YOwTzWGhxv2j4mJxo=;
 b=Hl408a3CqWJztYiMck25VMiHnxATMieSSLnl1ZcI83vWWeKyTf0XbNYvyhmgN1hHyxyWiFfGPe3a8QM9wmPQZTDjU/0Vrh6xTkRPhSS3blm68y7r56KhLvciMO2qLVgOBRpn8HL2OKCqOtSxvd10Wq58WEPqkeeucaMaLqMtUE02aIIrvwZH4QLHwxy8NAFBCM9Sw/aEl9bhyaiPN7rxMZu/FuxuNFNwBUrSD7GLijeNbip9uuuh72an73aLFEXZLAxt9zDqUosndLBtwED9COADjgK87ODwqUPaBGdlwjconwL+u1Yd2Aofq29o9lprP1nJkhzZgjkP5t/h2+ZD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1398.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:49::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 05:13:13 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:13:06 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "Michael.Hennerich@analog.com"
	<Michael.Hennerich@analog.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2] hwmon: (adm1177) fix sysfs ABI violation and current unit
 conversion
Thread-Topic: [PATCH v2] hwmon: (adm1177) fix sysfs ABI violation and current
 unit conversion
Thread-Index: AQHcvBYQB4hNk5+unU6fyT0Rgf1FYw==
Date: Wed, 25 Mar 2026 05:13:06 +0000
Message-ID: <20260325051246.28262-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1398:EE_
x-ms-office365-filtering-correlation-id: 55293a2d-84c9-4db7-d51b-08de8a2d32ed
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: DR4b6otj+rYQSEiZlonP5ERytUU8IKR3abxSZJ7fot52a35tWUuB27yKmUKBupdETdHg4fWWTKdKov0A/fXTdWjnFdRBUaMQ7Y/plSE967H46V130VPYTAFkBjXlfvbaHFndNE+mnPOWtvsmJVPHYP+VYETF6qp5+Nhz2ytajCQfN/PS3ySjoG99NgBVt8n5OkxwwT7gmOP1zAHtqu8NHVeNw0z+4hxgmTWfwM6PiRpw0tQsEcUj1SVcNHg5NrRObm6BhNJ1zZglgUpbjsoJfWwik0jcNq2vj5MJtfsjNYGX2+M0z7/W2/Gevjt2i1bf3PCUGDS6RsVEgjO3EcQV8AhzuShJ1f6j2gtFaiChgiDv2MEXH1Xo1mI4sUo7x8spcUIbsPSl23KwVFtQv3Eq1JdbZnTVP0EM/EeTchyrZXm5GZp9sGoy+Xcqtm/ScsnGxTL9NhEV5Rha/v1UP5NX6jlXkNoZ9Bdbw2HnxnwU+AKHIyUwzuxxq8eqBMPWM7DXyOdqMUTtBVQJefHg/NEBka0KgEWyMG+8iNoJKUhxWeoVTy1ogdpYNCt1FFDzN382tVFXd1gWvEkwOLO2+2v/47/yg4G8IgXma30Ts/2JeNr+l8YHgsKaiNXQKT7iMBMQolSSxH61DFvWw5KYTGu+GPiQ0nM7FTVMCZVYjAwfjjzKtuysboCRK1yg4qbH8jqBcH2SHpUXq0n05Z++ofroh2AykIluhOb8MJK+wt9rjDYKR7P63x4BbvlWa47Du4GFsL8248RIdKir8Ze/JJ+Ld9nm8dQgZRcrXg7UU5Qk3Ig=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SNyU5UVviXX33c57ANNsZOeMDX6g+HnAcDcV5bjnmQ34DCAdnHvDv+J/AP?=
 =?iso-8859-1?Q?nqAkDggU4GGCp8Z8n3WznB0pa00S0CjnuF3ASDlTJ25nP1Ew26YBJ6Lopr?=
 =?iso-8859-1?Q?jSD9VqJeQcnjlbUZkBByiuxKeW1RGdtPCLZ9u4sa3SyijMbTO9HIRLwTVe?=
 =?iso-8859-1?Q?lJ+gYaqXgYXBTwzQ4a8VQ61NEcc/DaMVxpN0ZYul32A5wwiuX5GgcwGNA8?=
 =?iso-8859-1?Q?DuSV85PVKSgcCsJrdm61ZCQTxYCWQ6TCBS5KukE/xL4tB1mK/kdzViwit4?=
 =?iso-8859-1?Q?i/Qwi/TZyD0TikjaWksbESMN1GPLA8hh2DtWuEXAtNBXSHa1YDCTzhgEv8?=
 =?iso-8859-1?Q?86Zy9eaBIIqeYSqTGxH9E9RsfcdW6t5BR5D8DB6MiPohr4OWt6CtDjKu4N?=
 =?iso-8859-1?Q?MhozcskZRwOP+MJ9VZHW9jWIs5qcDH+S84TxryJL2mc78Peo6OKCkz/sEf?=
 =?iso-8859-1?Q?zje7kI2LdeDaZjZGz5/nLGiNV1bfjM9hHU8jQ1X5z+qiaolmgPB/hLeSOX?=
 =?iso-8859-1?Q?tj2EiLH6+++XY+DiRYOlQrFMYH/Ik7CA/ukHCMxqtlIXFRnAb66Ct4qAyH?=
 =?iso-8859-1?Q?T7ZJwipANSGtAoWAjDknh3fLq9oRKdjq7LYFV2np0pFK3Z6dgC90ZgfMV1?=
 =?iso-8859-1?Q?68dR5bDd167cqrF+B6OWVwNUiwrkWnlTx3Z2neDb1wnAdPNAh9l+ard0GJ?=
 =?iso-8859-1?Q?+c4fUXTd9+H2tnLBpCLvg7Fm33SzIyUca+Ua/KRH3sNNOKdauWEnVbOf6b?=
 =?iso-8859-1?Q?MRwXVja0VCrpnXpvEhwENPHHjfonM+nTwpFvXvbEj7R3vESXym5uDVQ3Sw?=
 =?iso-8859-1?Q?YNOLHiWErRzxYWK8mTbuoYBGzwYAl/apKyK/w/WAel0Rc4YwxAeYOpRldk?=
 =?iso-8859-1?Q?a7ZL2VT21bVlXxzKeUc123WrBqiiqYe2ViDJKyglXDkZlBwMKBQDx6u0BJ?=
 =?iso-8859-1?Q?S2uurW7vAu8iZ6RDxEWrKtFh9RUBlZbVIFFO18GjQps6qpzZa5MqqT62s+?=
 =?iso-8859-1?Q?HD2J8D5oQ5D1Yu5Oo05KA4SGDbQ9MFq6duvhfkv5xrzeSwkJNsAluF0mC/?=
 =?iso-8859-1?Q?4BTmiW9f+G/cO/c4MAJvCPEgLNZC8WINB18r5h+JzSeq+zSeEXYGFFDiuV?=
 =?iso-8859-1?Q?KAD1lF2cNMKxa9c1i/TEWQosMrqgp+Qal+zGEcsLvkW6QaqibtOkrXHYri?=
 =?iso-8859-1?Q?m1CSK+iOb0gZwzxOT6vh1zxtXLT4PKHswJr9gfKYpGlpe/auhI9fb+tECt?=
 =?iso-8859-1?Q?5i3ZFtv/B0BtoYSugYikA7SNIUHxE6bVBDwr7Bn5Ow+NcjFM5JS2k6x4DZ?=
 =?iso-8859-1?Q?Vaade17JYb8vAmzT7uCKO4jFYxHb1S7s5/DIBoXTzyE/zNF98qGhbN+EP+?=
 =?iso-8859-1?Q?d6zktStIICVtrWQjL+lTTe7XGZogR+DU2iYGxuNxze4XQYQCHeMaQl13i3?=
 =?iso-8859-1?Q?IEV1RlUKO2kjlZURmRtVlrV52BsOT7jbMVmZLQ7455mBv/h7JN+4vOTxUL?=
 =?iso-8859-1?Q?4bX2tETG0LM/sY00ry25KDREVmCKTXQFBkUbZHTprep57P/8og7ORkML+k?=
 =?iso-8859-1?Q?T53I2bGaPUN9i172/w+tqOHk3cjjAQLFczN5uc94pxZXROYuQ2I6Q2djox?=
 =?iso-8859-1?Q?QPY2UEI2P1t9LA1Er5DQcu06wR3paWYFIhFT2EtwhUGkAaDh9swUWNrx/9?=
 =?iso-8859-1?Q?nb4CCkcOcC8VpOgh3hDO8bjVFLKzlGxYjcYJge3jHH5w4BFe9mbyyUaXRG?=
 =?iso-8859-1?Q?kmn47pw4RBA2/gl50RTbCakabPhlrsLPRh0tImzRS3Nxqs8glycBm3yluy?=
 =?iso-8859-1?Q?hXM14tEaZw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f91MNIf+hW/xgBgFnVZA/S91yER3x5xv4fOZwjIse+XUxWaFmseBE0usNblsoPfFHyYXNAfWdaDC+ssCH5WYx3IehD4R5sKIl3fS6EsqbL1XPZQyXnsZgt36wvlYxpRRHJzSg0KwhmqPAKtTKxA8nacTDOCoz5LVT3qhBTUtCj6oOT9DS1HPJ5iqaVGrm67k9VKJp7v3WE2ScCTorFblNCTdecGUoqFwke/U6qM7Zr2eBGfdwxwF+YKlwDdHv81WdFaNtASJAHJEJ4yZyliVwgnseOSLKvQ0puJN477TZERylwpdb7MoVRySiAko0N8F+bL76PSBLolD2o3CEPLz9w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55293a2d-84c9-4db7-d51b-08de8a2d32ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 05:13:06.5290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LO/SnDlgnPhBP/5SPBncMWCijOSEm4g4qTrUiv8suHacsjehul1Ja4p3ceSkGiuhLxq1J7G4UxHOmxRolT2EqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1398
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: iUFjp-GatcqIe3pRA8s4F52XJPblu56Z
X-Proofpoint-GUID: iUFjp-GatcqIe3pRA8s4F52XJPblu56Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzMiBTYWx0ZWRfXwRM8fwsqxQXd
 T6RCz38QmIh2awq8zdYBVzEHXeBcJulP15mUsqoMtXwzRPgzo835GtYg1WKhymXH6Y54K5+Kdwe
 VEuBZjlsn8vGi+7plyKWwSMO7h9tPXLDDlIyfeIPuOs1LrqnDC8CIJUEc0mi1Q3Rf4mIPo4YyIT
 9ya1B2EcOzG9umLhObbdzTgN3lB2gvWj1Hr4MIRiUHZTWo+NNoBUGjaGr1pChFMSq/Y18sg4kKy
 taL6Wqf2TKjKfWC36MxzAzr4vxqpfkJL6RAuKHeuK9HLXVahT2+uy83MCBzO69xCZgLEOZ//0nu
 oHzIPMu8NJwDnmkhYdb33nbR+bkshQlzvtD8t7EUr1qH8dxK97pbsYgBWI3n9d4CGwvPXebg0/j
 Gj1dgSNAPIYkJB3aPgvYLJuqVbRNJY45oGbsK0/59f8AhVUgGNC8OSd+XmXtA9sxNQUyTxXHBw7
 bw0FsJYFX7J9PWZ1a1A==
X-Authority-Analysis: v=2.4 cv=EvXfbCcA c=1 sm=1 tr=0 ts=69c36ef1 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=w74Ln4rD2WEPIE-XTYcA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250032

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The adm1177 driver exposes the current alert threshold through=0A=
hwmon_curr_max_alarm. This violates the hwmon sysfs ABI, where=0A=
*_alarm attributes are read-only status flags and writable thresholds=0A=
must use currN_max.=0A=
=0A=
The driver also stores the threshold internally in microamps, while=0A=
currN_max is defined in milliamps. Convert the threshold accordingly=0A=
on both the read and write paths.=0A=
=0A=
Widen the cached threshold and related calculations to 64 bits so=0A=
that small shunt resistor values do not cause truncation or overflow.=0A=
Also use 64-bit arithmetic for the mA/uA conversions, clamp writes=0A=
to the range the hardware can represent, and propagate failures from=0A=
adm1177_write_alert_thr() instead of silently ignoring them.=0A=
=0A=
Update the hwmon documentation to reflect the attribute rename and=0A=
the correct units returned by the driver.=0A=
=0A=
Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and =
Digital Power Monitor driver")=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v2:=0A=
- Widen alert_threshold_ua to u64 throughout; use div_u64() and=0A=
  (u64) casts to prevent overflow on read, write, and probe paths.=0A=
- Update Documentation/hwmon/adm1177.rst for the attribute rename=0A=
  and correct unit descriptions.=0A=
=0A=
v1:=0A=
- Rename hwmon_curr_max_alarm to hwmon_curr_max; add uA-to-mA and=0A=
  mA-to-uA conversions with clamp_val on write path.=0A=
- Propagate adm1177_write_alert_thr() return value on sysfs write;=0A=
  add linux/math64.h and linux/minmax.h includes.=0A=
---=0A=
 Documentation/hwmon/adm1177.rst |  8 ++---=0A=
 drivers/hwmon/adm1177.c         | 54 +++++++++++++++++++--------------=0A=
 2 files changed, 35 insertions(+), 27 deletions(-)=0A=
=0A=
diff --git a/Documentation/hwmon/adm1177.rst b/Documentation/hwmon/adm1177.=
rst=0A=
index 1c85a2af92bf7..375f6d6e03a7d 100644=0A=
--- a/Documentation/hwmon/adm1177.rst=0A=
+++ b/Documentation/hwmon/adm1177.rst=0A=
@@ -27,10 +27,10 @@ for details.=0A=
 Sysfs entries=0A=
 -------------=0A=
 =0A=
-The following attributes are supported. Current maxim attribute=0A=
+The following attributes are supported. Current maximum attribute=0A=
 is read-write, all other attributes are read-only.=0A=
 =0A=
-in0_input		Measured voltage in microvolts.=0A=
+in0_input		Measured voltage in millivolts.=0A=
 =0A=
-curr1_input		Measured current in microamperes.=0A=
-curr1_max_alarm		Overcurrent alarm in microamperes.=0A=
+curr1_input		Measured current in milliamperes.=0A=
+curr1_max		Overcurrent shutdown threshold in milliamperes.=0A=
diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c=0A=
index 8b2c965480e3f..7888afe8dafd6 100644=0A=
--- a/drivers/hwmon/adm1177.c=0A=
+++ b/drivers/hwmon/adm1177.c=0A=
@@ -10,6 +10,8 @@=0A=
 #include <linux/hwmon.h>=0A=
 #include <linux/i2c.h>=0A=
 #include <linux/init.h>=0A=
+#include <linux/math64.h>=0A=
+#include <linux/minmax.h>=0A=
 #include <linux/module.h>=0A=
 #include <linux/regulator/consumer.h>=0A=
 =0A=
@@ -33,7 +35,7 @@=0A=
 struct adm1177_state {=0A=
 	struct i2c_client	*client;=0A=
 	u32			r_sense_uohm;=0A=
-	u32			alert_threshold_ua;=0A=
+	u64			alert_threshold_ua;=0A=
 	bool			vrange_high;=0A=
 };=0A=
 =0A=
@@ -48,7 +50,7 @@ static int adm1177_write_cmd(struct adm1177_state *st, u8=
 cmd)=0A=
 }=0A=
 =0A=
 static int adm1177_write_alert_thr(struct adm1177_state *st,=0A=
-				   u32 alert_threshold_ua)=0A=
+				   u64 alert_threshold_ua)=0A=
 {=0A=
 	u64 val;=0A=
 	int ret;=0A=
@@ -91,8 +93,8 @@ static int adm1177_read(struct device *dev, enum hwmon_se=
nsor_types type,=0A=
 			*val =3D div_u64((105840000ull * dummy),=0A=
 				       4096 * st->r_sense_uohm);=0A=
 			return 0;=0A=
-		case hwmon_curr_max_alarm:=0A=
-			*val =3D st->alert_threshold_ua;=0A=
+		case hwmon_curr_max:=0A=
+			*val =3D div_u64(st->alert_threshold_ua, 1000);=0A=
 			return 0;=0A=
 		default:=0A=
 			return -EOPNOTSUPP;=0A=
@@ -126,9 +128,10 @@ static int adm1177_write(struct device *dev, enum hwmo=
n_sensor_types type,=0A=
 	switch (type) {=0A=
 	case hwmon_curr:=0A=
 		switch (attr) {=0A=
-		case hwmon_curr_max_alarm:=0A=
-			adm1177_write_alert_thr(st, val);=0A=
-			return 0;=0A=
+		case hwmon_curr_max:=0A=
+			val =3D clamp_val(val, 0,=0A=
+					div_u64(105840000ULL, st->r_sense_uohm));=0A=
+			return adm1177_write_alert_thr(st, (u64)val * 1000);=0A=
 		default:=0A=
 			return -EOPNOTSUPP;=0A=
 		}=0A=
@@ -156,7 +159,7 @@ static umode_t adm1177_is_visible(const void *data,=0A=
 			if (st->r_sense_uohm)=0A=
 				return 0444;=0A=
 			return 0;=0A=
-		case hwmon_curr_max_alarm:=0A=
+		case hwmon_curr_max:=0A=
 			if (st->r_sense_uohm)=0A=
 				return 0644;=0A=
 			return 0;=0A=
@@ -170,7 +173,7 @@ static umode_t adm1177_is_visible(const void *data,=0A=
 =0A=
 static const struct hwmon_channel_info * const adm1177_info[] =3D {=0A=
 	HWMON_CHANNEL_INFO(curr,=0A=
-			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),=0A=
+			   HWMON_C_INPUT | HWMON_C_MAX),=0A=
 	HWMON_CHANNEL_INFO(in,=0A=
 			   HWMON_I_INPUT),=0A=
 	NULL=0A=
@@ -192,7 +195,8 @@ static int adm1177_probe(struct i2c_client *client)=0A=
 	struct device *dev =3D &client->dev;=0A=
 	struct device *hwmon_dev;=0A=
 	struct adm1177_state *st;=0A=
-	u32 alert_threshold_ua;=0A=
+	u64 alert_threshold_ua;=0A=
+	u32 prop;=0A=
 	int ret;=0A=
 =0A=
 	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);=0A=
@@ -208,22 +212,26 @@ static int adm1177_probe(struct i2c_client *client)=
=0A=
 	if (device_property_read_u32(dev, "shunt-resistor-micro-ohms",=0A=
 				     &st->r_sense_uohm))=0A=
 		st->r_sense_uohm =3D 0;=0A=
-	if (device_property_read_u32(dev, "adi,shutdown-threshold-microamp",=0A=
-				     &alert_threshold_ua)) {=0A=
-		if (st->r_sense_uohm)=0A=
-			/*=0A=
-			 * set maximum default value from datasheet based on=0A=
-			 * shunt-resistor=0A=
-			 */=0A=
-			alert_threshold_ua =3D div_u64(105840000000,=0A=
-						     st->r_sense_uohm);=0A=
-		else=0A=
-			alert_threshold_ua =3D 0;=0A=
+	if (!device_property_read_u32(dev, "adi,shutdown-threshold-microamp",=0A=
+				      &prop)) {=0A=
+		alert_threshold_ua =3D prop;=0A=
+	} else if (st->r_sense_uohm) {=0A=
+		/*=0A=
+		 * set maximum default value from datasheet based on=0A=
+		 * shunt-resistor=0A=
+		 */=0A=
+		alert_threshold_ua =3D div_u64(105840000000ULL,=0A=
+					     st->r_sense_uohm);=0A=
+	} else {=0A=
+		alert_threshold_ua =3D 0;=0A=
 	}=0A=
 	st->vrange_high =3D device_property_read_bool(dev,=0A=
 						    "adi,vrange-high-enable");=0A=
-	if (alert_threshold_ua && st->r_sense_uohm)=0A=
-		adm1177_write_alert_thr(st, alert_threshold_ua);=0A=
+	if (alert_threshold_ua && st->r_sense_uohm) {=0A=
+		ret =3D adm1177_write_alert_thr(st, alert_threshold_ua);=0A=
+		if (ret)=0A=
+			return ret;=0A=
+	}=0A=
 =0A=
 	ret =3D adm1177_write_cmd(st, ADM1177_CMD_V_CONT |=0A=
 				    ADM1177_CMD_I_CONT |=0A=
-- =0A=
2.34.1=0A=
=0A=
