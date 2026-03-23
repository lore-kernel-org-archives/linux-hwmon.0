Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B012B143;
	Mon, 23 Mar 2026 00:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774225482; cv=fail; b=Ym2emx7h0+2Pph+AfkgrIUOLb8ePJOvenNdbGDzbKuTbgbq9px7Fvqm3WUGx9KJOxOJisBP4FBelvp0yvaVLcFvvk++a1tUOy4wr9MMZgBJXsDm3KYH9cyK3CUf31bNnp56gPg6KeuPVGBPPdlmh3lvQN7ocnB+TIdWsSDbUozs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774225482; c=relaxed/simple;
	bh=5VRzbj2QQCwVH/TZwAtjIw2NsqBl7b8vWIa4VulbrNY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Io3YRfa04rGEwPHI6QtGyYiwunHuYnp+AGjoNp8CZw0ixBuf97eq/sF+jAevkTFuthE1o137cvjZpKdWrycE3sycCDpR41jRoN3D6fTKcokn2LLwXa8AxOODG9TQiI3X2umi7a8G2O9Mg97FzIrzukpXpCZLgfudVrYPdI/zusM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=HYkX7Lms; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="HYkX7Lms"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLX8gW3333647;
	Mon, 23 Mar 2026 00:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=WxJk8YXWn8M/5PgSRMFCLqv2
	CFo1jFXxJhoY+a260Qg=; b=HYkX7LmsDr3njcNZIy3yH9kLsKDji26TLmIGguUb
	8WDdESYcvlNLHkM1I1lUWubCJymYJTUM9/P/SMP47Ah+LGn5PwcQC8KHAI+IWPMw
	wB95KPLg9TVIqcyFlk8AmahVTNK2r5L5Lgi0+qXXnFaZ85PFxC85QOEhvDgJb8wT
	quGxNJk0nUKe3zI9lvOPX4A5vCQf7PQ6rD1eTjez667mwnaeqvkqXf9FHTgsg2xh
	O9P/XmGSiPBJydsVgFQ9b89uvYZl8tekoop1WTlCVEv4/UVdsx+JEZaGJqaMdC3E
	3JWvtXcbFZ1yfJO2ktELEazn5Yq0DQqWPYn6c4cZTHLTFQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d1w91t0gq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 00:24:18 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id CCA03295D6;
	Mon, 23 Mar 2026 00:24:17 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 22 Mar 2026 12:24:17 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 22 Mar 2026 12:24:17 -1200
Received: from CO1PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 22 Mar
 2026 12:24:17 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGTULwKZZbtpxpPWkyKMCB702gcp4qw1ggLIWhYi+afYa0UyXvKf21NYb0QgytD1uUwTiAAUE8eJnAEVaNbNBgXIPow6gkoyMAhoDz8Jig/vNBY3ilhlwNjm5WlVmw96TUU2MZ0Yj6BcAo4DkEC1gvAYxJh9yluG27wckLl68khiAdlrM3O4gkqqHjnf+1Th7z3oprwAr5/VFUE8G1VOXVCJmfVeVpXPcUGlhAljFd/9V9pKkwFd3KEnFep4t/ErJNgAZgCXqg7nmjO8VuO7eLMVJuf+8e2ycJIA87obSlHdWy33rZXJS0bZzPvdyh7E74dh7f3neAtfJ/UUb9rtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxJk8YXWn8M/5PgSRMFCLqv2CFo1jFXxJhoY+a260Qg=;
 b=WQKQ9292Xxxhp/cuKl2rA2RQ1dXihRmch/khIxHMNX2ZMnGoW0GhXUSUlRSIJz+1s1nQ7fCmxIqNUdW9HpKrvKQ/KhhhwC666em2iaoEAyJGxBBJ0a80Eu7vLhrMK7BEPYgUvT1XYr9Id/EGwKhbbDHiNLBr3Fr/j3q5IV267Kx8p53JVlrc9q45uqVBHkClhFlxx4EMN6wLtRulEO8hY1woQMo3nKseKtX/C3915OVBlFriEau1s+KUYGGrGlNkTUpnLkbU4xSeQwG2TIdIcDy+YmH7JrBuHL27oOc50sDPAr8oVvFLroLA3Ux54jiaTzuDoDySzO2fqrpxrQyo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:203::11)
 by CYXPR84MB3741.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 00:24:09 +0000
Received: from LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fce6:5af1:e04e:caf6]) by LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fce6:5af1:e04e:caf6%4]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 00:24:08 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "iwona.winiarska@intel.com"
	<iwona.winiarska@intel.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/2] hwmon: (peci/cputemp) Fix temp*_crit_hyst  and
 cputemp_is_visible() bounds check
Thread-Topic: [PATCH 0/2] hwmon: (peci/cputemp) Fix temp*_crit_hyst  and
 cputemp_is_visible() bounds check
Thread-Index: AQHcultdaSvT9+I23kCZBn6vayl7kA==
Date: Mon, 23 Mar 2026 00:24:08 +0000
Message-ID: <20260323002352.93417-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR84MB3535:EE_|CYXPR84MB3741:EE_
x-ms-office365-filtering-correlation-id: 06f9b8ef-1374-47e6-1650-08de88727ffb
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: D7tIbn25oYX5GSJYdNl9US3MnHdIn4t3Y1Cf0jOIk7+V5HLCo3FEI21cv1SrML5g7LXgiGANEnbE64dAQLojAU84cfiHnyEQGKUnE1tDJhHD+C46qa2UhVphin4/R6Y1TT4q697ZmXiQmITCdLUWGrn+tRe9NsXurr/NrAujjmR0d13svKFq3bKy6AyZovnhHkV/JaZGkpD8kbgRtjej4ufc3oIShCTq2Y7zXmIYDmQCMmabeTiZYKGnKkk4sM4k7Qe14TNytDLc5DSE0dpp/zy6+Zb4iGqUQEmIkRYeLIaIEuzA8YaYHkEvnG1po8BNyuDlbX9kb0WG2jlJ/7QaaH4TXfzPLlXOTWoX6LHzpnDo3odKF96DXNmCLayOGQhw9WyFxL4cFzbV6GBNFAHpErRSo4c/LNu24skkgutexe0VL/M3Gw8TmysytZJ+xqA9cZNLQ0GEUH3MnlTjh4u7eYQVn9SNcOps9dNkUNNBhgSi0ptLBB8gqrk52T8B0Nw9FDT4Vwp5GA148gcSmzE+Qb3w/UvuoGpIXX9LLrMojxkcC4qBKifv/pnMzNE9QM/Id+NtBuqmWUm7Fl3gl1URBSzdsjVM8P0IKlCEIeaGaGRw2OrUh110OLP5WA+LbKDpxhYbmzjNpPV4mI+LBrCtBwAVK+igSuhFDxScEq2wbTNOgSrD/8LLLlB6VVNbNkspjIl5m3PoqbgwV/uyfoAa0qBJzfnMxsJX+hXcsn+nHhz9T0PHTfx9IZj/FyOg6a7ss/eToHmJCFZU0++vtEfGYJBTzgRGpCFKIXE96hzauQQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tgRG9bT3BedVsrPGel04KjpPznR1AL4u7kWJQiztpiQC2mVgvjHAbGDCtD?=
 =?iso-8859-1?Q?LGeV6bYDjd4VJ2bGYt88uSAjS147zrW3l+14gwP/9wPtG+AKX3/ypRGKP+?=
 =?iso-8859-1?Q?5/qRjvQsm3/ntE/IEWxT38IyLPoKlETUccOkH27MiCugJdEERNfuK66UaB?=
 =?iso-8859-1?Q?VT9rdN02QC3HPKYzQChEONsSoUOR0G3uayhI4yqyt7AZaIWEqro4sFCTPH?=
 =?iso-8859-1?Q?LRwqugorpHgSIA/P1YwY2w0NV15o/7WkdNh5BrBGT+Yo+zqYH1gRpWBoP8?=
 =?iso-8859-1?Q?egAb4sIie2y18YVG2a0bEhJbh6AeXB13QL+UaPAhZbW+3qgirx7uQdLIpv?=
 =?iso-8859-1?Q?BDneS7f+Xzyg5nUrwqL7RCJaGPTprNhkKxSaP9EQsVZqTtziI+6oSIUrly?=
 =?iso-8859-1?Q?d+ymWMXOhI2jYjP0MAoJgvj19uCVXM1oA9puUjeJndsse6RnhF4F1hvgut?=
 =?iso-8859-1?Q?teAp5foJr+DRIWR1idrAhQb5UB0/WgrPn/3Y+fofjqTjFNx/ixL8ihg6Fb?=
 =?iso-8859-1?Q?qblBy7yu1BDCe8zARnhc/827NNFaHMh2LApvLXaeHkF978id0LOcZSTPxe?=
 =?iso-8859-1?Q?nKxEXHTkAw1vVR4q/1IuhllQLihDmPeBJtQjd+HHweru6MzUCCBG9kKeFM?=
 =?iso-8859-1?Q?QJ0CTacqUNgFH4qEzcvrPQwVvoRcftATXc9v9s1EZ4Us31VudRbwDh0eMp?=
 =?iso-8859-1?Q?eQbNUon7nQgd764cWwYRWniUMgLQbHfExfbwhTJnJ30AdexzBfrRF8I96a?=
 =?iso-8859-1?Q?ldUigTzeEAHv3/aJLtKPrTHVt9hsllxihHYrQq7474yNf6kEtOCw4DtFSS?=
 =?iso-8859-1?Q?ixA4AN5OXKF6OEgCNOCOYW5Kzi4QRsWeKhUHOR8SI+dUudcuZV7Ia22oWn?=
 =?iso-8859-1?Q?sus67E4ZbSW7PDW1NiNbLQt7Bt19ky2ARhj4Icpcx/xBBfTRt1kboJartx?=
 =?iso-8859-1?Q?Bf1clh6akNGITwpOjrwgDibPA45ekis2sACqt6uhrvUNDCizwcKqk3Sswf?=
 =?iso-8859-1?Q?cuMP0ff2EOGdNzvGw+mBq2vkLZCoZbV8dch3AxB9dcDeOkzpctBqbAshUh?=
 =?iso-8859-1?Q?27QY2DhVyqkCkYgJnCrOYj8Kf2vyK+Ng2HTW3xVGBvAtQXPpYX5Qt5OsxW?=
 =?iso-8859-1?Q?p5B90t+OLcluOGrI0RHuUOsSNkKtSg0RczDQ40qOhbvkBndGKiI+vrnt17?=
 =?iso-8859-1?Q?k0ISqrWHmjtLBwk9bLSafbFGwq2b2VE1/wrKTOr0vBINPoKtTFJeP/1MpY?=
 =?iso-8859-1?Q?JfPdxjORmVRAewyr0ujgsnJosw7ib5MDJA68Cth1emyfMUqF2PFPCAX1xX?=
 =?iso-8859-1?Q?yr6Ps3Tk78HfOphMbVENaIuRiUUt02G59ps05x0cDPzAZJ+ROd9N9vbYcv?=
 =?iso-8859-1?Q?2uBsey35rs1NBAhGx3AZ/IpwxgifZu7NFUqWtcRtpdPHxnu2NWV5h4lGA0?=
 =?iso-8859-1?Q?AmOfQFpApQck0wLPqkQmhHOkYKJ/o0mbZklS2SBnvuepLkYIGVNlfM920I?=
 =?iso-8859-1?Q?ZdUjbW7thWaJ5M30TnHnmZ94lLEgq8wSLQwMBY4m0HhbhcSkXFmmSp4GJH?=
 =?iso-8859-1?Q?r+wMhLBFcJZi0/sb9ARHgIBWqMY7a8JT6M0AumtDMfKIAIl1+JhbRmoLoT?=
 =?iso-8859-1?Q?q7xgV36It1Uhxi7iCRSnuCAA2yyl/vdsekrcEk/gx6xpWNeMipbdpUr71F?=
 =?iso-8859-1?Q?spDuaGkRT7mqHoZDPaT0euAb61iU7peHwv2+E0WMWLxlLiMrBdNmuJRcHE?=
 =?iso-8859-1?Q?UtAoMf5v/YQ04gMOstCmhot780qZWZl0AcZdz0CPoPHGIM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F+oS/+39gqoKR8yE8KnSnwS98wKfLIXR0hLe2i15Z3JlltYgtFWUVyuuZj6Y1W8j1zvE5OJTnf3wuStxiLO+Pl0XrGgzpJuHDR9SEpjCqg64LFOeXFkkKuCyefJdnvm0mNPRnQG03we5KPFRccWAD+Eve3f0M3kKzoMotpB5aqUgJehrpObn2ACB67/Bx9XUgRMQkW8+731ZWipDbm6EhCpqfNtm1gctOe43bIPHo/k9MtRk33+8sGgq3qjUhzE5/bd4+KGHloPZrytG3qvbzjhgC5+m8qC5NrA0vW9v8j9YJdS/C6FLVAviwFvqZlXoKUpuGEXaGXSAHjkgglvk9Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f9b8ef-1374-47e6-1650-08de88727ffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 00:24:08.6800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B53L5X+ndYcA4MjbYWoFzNz4kQi4KtYdJou0tmc7s4EL6yel3585R82RNnVcV+9g4X86yeHGDhjblB60PN7Y4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3741
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: pKFP7r7_iqli-icdgOLd1cB_8x6v8TUL
X-Authority-Analysis: v=2.4 cv=e7gLiKp/ c=1 sm=1 tr=0 ts=69c08832 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=OhZxDaSulnRPHY_yxMAA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: pKFP7r7_iqli-icdgOLd1cB_8x6v8TUL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwMSBTYWx0ZWRfXx4fIw5HQYjDE
 cCnnqSGZIulZZwaTLWLBI8vhhkRfm8kAmj66+qHPhwO89cxxJw26akchtR4vA0dd40P0SOnPiIc
 uHkfjnOa+dQ9Pi4qZ1qvKwuFYCDFf/omhfF/KoFtZBGYaoxi20sNfc7oK62XYzrXbrEITM0vzrG
 h8xLPHvBFBPxgfF8KGMqUrryidF16yHgb4DQuKON04XuUPRReGHRpyctuAE6a6VtM2VoTiAmndE
 zh50y2NwoM3mAiCPNYX1ROc4CKoKsEp8+IccRn4iKij4LPOirUsnxJXFaLB7NiWkvgLmKtbORLr
 Pf+zYbduKcy+yyNtYHyxNJYWmUFr7YkeePfqEyeaNh1/NMOWRR4lDqLi0LvhLIzerbRWUKSg5g1
 O/Kca3YPOiErS0L568+DDYbKYHy+srarTaGuZZzZYwIflzHNlLe633YKWxvyoGZPWFodE8mDcOM
 Fvwhhp+zVjz0jQNrjOg==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230001

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Two fixes for the peci cputemp driver:=0A=
=0A=
1. Fix tempN_crit_hyst returning a delta instead of the absolute=0A=
   temperature required by the hwmon sysfs ABI.=0A=
2. Fix an off-by-one in cputemp_is_visible() so an invalid channel =0A=
   index is correctly rejected before indexing the core bitmap.=0A=
=0A=
Sanman Pradhan (2):=0A=
  hwmon: (peci/cputemp) Fix crit_hyst returning delta instead of=0A=
    absolute temperature=0A=
  hwmon: (peci/cputemp) Fix off-by-one in cputemp_is_visible()=0A=
=0A=
 Documentation/hwmon/peci-cputemp.rst | 10 ++++++----=0A=
 drivers/hwmon/peci/cputemp.c         |  4 ++--=0A=
 2 files changed, 8 insertions(+), 6 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
