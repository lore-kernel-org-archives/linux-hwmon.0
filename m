Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8048242D62;
	Thu, 28 May 2026 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988109; cv=fail; b=Hn0Ixb5FpHADFdYTCCXGkS5xbQkzwjsXBxxrz5fsE67wPGZ+54zudTv2jrk8r2fAGu9W6JGoGOmIVgQ0FJEITSqnk0/O1N+huPcZy8TrbFinc+7rEYlACwFUGSM803xGe6DiRO5Fpd36dD6HqFQI3LKXWi98Bcvh+YPnzp+nULI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988109; c=relaxed/simple;
	bh=LTC2Hs8FRPNQXj3IL/JrFOBBL7cXr/3iyv7HkpAJD3Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A2BRxwWMjf7QZQacgbZ9KE8yFjGNCd9jrau0vfCh0xg8rX7rOx5LBKNUE2bsX1WBEvYUKcqkKNUZZpTSsicbT24pq8fj0UKNmiy9LnijkzW0JSFdlEgiWK2Q2qVBnmJRwrZP1RV06wIJo+CwCgTX3nnzdnXZTbf2FOhtiQTFAMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Oz6VVg8b; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Oz6VVg8b"
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SExJkh2351926;
	Thu, 28 May 2026 17:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=LT
	C2Hs8FRPNQXj3IL/JrFOBBL7cXr/3iyv7HkpAJD3Q=; b=Oz6VVg8bMSF7pZmUZk
	ETsxO34Kt5wHMqlUb9vqyApbhR55GmuL/PHithhlQnRj8zRQ6TzAvitqVp8LQ+oz
	hknKYwymZfayAxphsbJXXAqF+prXZAE4LX7HFRU8NWUzMn3khI1baZZjVWVOOXhT
	jR+P4uana4XVd718IZPGVNPCLSyU85ePUnj5EkzT8zAYuHkjyRB/4zjLvVKg0NKY
	3QhoZWgfapyELxu0qoJ+Yl0ub9/a7iZ0UEN4tFpNNOkZsVQyFEgFo7ZaBzPL9yRJ
	MBz7pm8x0eOsxDJGOzO6OcAaFnJNrpy+gyu/8XJP6NHeEWlXDLVlu6c54DGRFUgE
	KEPw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eeqy1a13n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 17:06:50 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 2104E800393;
	Thu, 28 May 2026 17:06:50 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 05:06:37 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 05:06:37 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 05:06:37 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ5dvYGORKNHX2CdKfcxXzbWXDNXZND10KbSxpOTb3AoGvKvsxNlzmwk8swpI7x+sQ4Ja/h7jmq4H1YFVw9JIPGOhXTeOjaMpvwgvOUAfBuXLTxWRIE6ysGfa4Op5E/wX226u1Nwb5imr6+T3Mgj9XJdmaHB1sUsYsndVcRgJsuwUo9BD8je5/PMDZ4NrFMpiBqLcx8auWUQKTs96zcxCxpqMPdDY1AvtkaWWOaLe20E8kHHWhEiWxQcpRuoiU7X+N8C2pAk4kGRj1V/CV4hdbrexynr+euKAN4JZEu5KlDZBIv56BV/vaSmV1U/IQGxp6J1GgTpgRJCVEHXn2piMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTC2Hs8FRPNQXj3IL/JrFOBBL7cXr/3iyv7HkpAJD3Q=;
 b=MTH8xWZNkVVhddUhr1dZn/F/K30JoL02LNJ9Yt+5nWMzs87PuMvsuS7OuyDCIBprxSweRR1URpEWitHTXOaRHR+Tb3+2BP3phfiBRPwJCNMzYBPsPrzCLn3bty4Yh+JougPYyCT6szSpAhNUrHVzbZsEzJMofrB/pQoxzpOT1t0AU2v71+ErfnOCjWWkDKXNMsCxTb0+4CZ0Cz4h3Okr15EQQaD7sF+2QJJ1UErHkW73kRNLui/q9r5pRNDX6guiD47AI7J8hDXOozkudU1p5ZGT7z4l90nSQ0yo1+xteIDLpfiVVfExCwIV53c4gWFbihfBe9gkRfClaOYEsd/stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3750.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:204::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:06:30 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:06:30 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "conor@kernel.org" <conor@kernel.org>
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
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Index: AQHc7ZTud9s8mAoGu0urhIKJwj0u/7Yh+DwAgAG1MwA=
Date: Thu, 28 May 2026 17:06:30 +0000
Message-ID: <20260528170618.85027-1-sanman.pradhan@hpe.com>
References: <20260527045409.9092-1-sanman.pradhan@hpe.com>
 <20260527045409.9092-2-sanman.pradhan@hpe.com>
 <20260527-exuberant-broadband-052c3526847f@spud>
In-Reply-To: <20260527-exuberant-broadband-052c3526847f@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3750:EE_
x-ms-office365-filtering-correlation-id: f3538cb4-f5bf-47c9-c7dc-08debcdb7658
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info: JWbrYo7VjheGgNMpm0bdv0Eb3ZRAvYoBlINWAbxA85wuJOza1TfraQc7X2weKBxSqQleBau5EvvDqeKMfR2uH0CXEARfibGFdZj/wAkMaF3UMwCISaa4QcitOPZuADTomJHBs/kUtwTeF67TpdOOA+DeZnEdlYwCXlX2xSbdTQ2E4x/e5z9q/jQ456+SaeVk56RGO6d+j35xhoOh0m79N0aKjHFM/Am/13hoVp9U2K8z63gQvL+EwISYoYGWPSEDgw/UIT491DtHVi3rT5lsajucRpzL9rcFKOCcDE2EdUAjEUBk8iVtE9Dhc446CyCwe81g6geArqMUH0CReZJ7YhNKgJPTNDOu52nNxFtJfyoBboeNe++2yOUmsSfgP2wyzWl0wHjR84+Afzil4b2hzgyeE2W8pE6qfAlh2QcwwJqwkyx6ymJOJ1qTS9A99NAHDVHi67yyE8s68gBNflyK54wcN0jIIgbfc+Dq4zzMKCsEzRGHEzJfpoD+6/fkRsrJ8EQ+mVSXRXGcVXxXj2//n9Ircrqbjf8h3dmlwFgwcRGfo8TXG5a4psdggL76uPC/QT0K8opkxXt6Ril5Nx8KakY5FkGmQtcKByi60A2KQBOpcZvVi4QOA38gNuC5osFKehvwGuFOVck9fVptjHGk+wX0HpLRCvZ0KHKbL8qKofVj5losjKbOBJ0ys+CHhbBUyDnVECeIvSY5nfdp4ywD3vB6MWhm9A8/X99tc8M5KAvXNq1r33LfOP8j5KGhbOjd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BHwF6yOMtalmr8g18dV0aQ6gztIV9h1f7f5zbO/OHrRfXBCLA+rUAqejd9?=
 =?iso-8859-1?Q?Z5mZdJOa/XpdtvyTOLI7b3/NJUWxbTuhpYscg6J8JOyuYPJ4oU3YBfjERs?=
 =?iso-8859-1?Q?2CJDiyyQKslyUnWuaW4FYrpWmBdHBR73+0O9pqAXa4zQ/+QMsZFpoDFNzV?=
 =?iso-8859-1?Q?pGRm6LAM2OcqVPPKl7CM8EHdWHcGioNMO86YGgiarn+hdz4dvXwi6oGeyO?=
 =?iso-8859-1?Q?XX5SmdS00xqBGBmQM3ik3C3lY1aKYgdSd3X8N5rqaiRpe5UGFLTc7sG8s0?=
 =?iso-8859-1?Q?sW09qFXzTizW4cnl7ROpTD+Qki2BJ4T1abBmOWSXKMo/lFcM/wGV/pmc1v?=
 =?iso-8859-1?Q?j9e1DkZUdbeogIya3e13f5vX1LQJyJTSR9/WDspkSlIh+M6lEixfBjT/S4?=
 =?iso-8859-1?Q?0hy3n0AWY2dofAKyqsS6ik1np3QwYMdJLTeWYu7hxDe4GyJHUH9EGY4mY2?=
 =?iso-8859-1?Q?IWmesO/bVFDoXCIXRG+PhyNpni4rJLXCPOQtNBBolm1AfLi2pxlt1fQklX?=
 =?iso-8859-1?Q?tLib6fJPL6Fl9AvjA6D7m7hMozTZtqxzJ2WeG2+CgRC2figj4xYknNGOZI?=
 =?iso-8859-1?Q?Jp1Q4ztPNElzkIflQ2Mvi6ZGEgDiSjte/JAIXFE9cm2OrB4+KA7hGbI3LU?=
 =?iso-8859-1?Q?o8wzk7/f0S4aPQ8BKmlOPtskBMPMcrEI/mMYBr3Piq1FbdSZd8HiP492gH?=
 =?iso-8859-1?Q?Vbwp4o/E/rkVvOdczCBen2iaVqztwlxG3oo18P8G+kcg+AXt6qf8XN51d/?=
 =?iso-8859-1?Q?9Pybcq7zCYbgHnW1WUPdRL6CJB1Dyjl5+QnpZDF0L+mWpbBKXyFyTvs5TI?=
 =?iso-8859-1?Q?Nny7bv63uGmt1L3/Bp6OTETy3reKx9bXbHvoLLWWDIItPdnN29t1OWdlAy?=
 =?iso-8859-1?Q?h/cSEW2n9cCuO46fCiKp2Eb03xBj7DzRGfRK7gme5rgICT36cb9CxS27Yy?=
 =?iso-8859-1?Q?zwECQ0nJWrDCZUBBwQce1jvM1nw2CfF54yQuzbgZNHuVDY8EaQh5OijG78?=
 =?iso-8859-1?Q?BZjAG02/kGXe+4Ljk5tkRX8i01ihMSJcanA948EkpQUmVzyH/jK1j+lqxd?=
 =?iso-8859-1?Q?F7qf92+iUmIbxy/Ypq1qeqkuxnwFYXREILgkuwkQlO8ff6zayQlBbFkEHp?=
 =?iso-8859-1?Q?VUDthvLmDIol7OXoA6JgYjV+1mElnb0WRG2pirYpXiwSibmEPsW+NqPYdK?=
 =?iso-8859-1?Q?9gm59ksPVCc4RLZggzEnk1Beh8zmjeJoiKilVTyGei5l4QoFJnaCcHaSQD?=
 =?iso-8859-1?Q?VV/HhW4EsE8mKJsJD0K7U2uo6bmXNIHndKMdq0h3zcdbEXnQA+cC2scD12?=
 =?iso-8859-1?Q?Q0kPskIObr56oaPwlnqQLUpigmGfUKfEfx7I2eMC6PaL0QmSv6IFNPBH2i?=
 =?iso-8859-1?Q?leq0liFroKfK/GaKoEHI3vI1qTNPecbs6GaJr4u7QJB+ugOWsDTsrEhk1b?=
 =?iso-8859-1?Q?7WFeDO3kJPlMkUwu4f5meIABVNZGfqzt922rtE0PConRtIe8UuTSNq6u9g?=
 =?iso-8859-1?Q?TDx7UAVLrzgA7IjO8CVf6irAahWihNGVbtH3EFT/26Cl5NQj4fy03SFSz3?=
 =?iso-8859-1?Q?327N55x9ULP4YoXtnIzAkJk0KgULmRkXYylSk95XW8hZfj1gKCYIJL/CZ1?=
 =?iso-8859-1?Q?z1SHF9AAtjQCQ1+0yhQBPPjrF9R0NKUm21iJ4RvMCoYfEmiCwS/4a4kjll?=
 =?iso-8859-1?Q?Jf57abdftMPGufbAUSjza3IFQAXU1WQT0i3+2AtbrSOAEOQySE8sV2+lUB?=
 =?iso-8859-1?Q?USE1kHasYY59WSg+knY4x8GpjQ5AsGk+0piTvd4rYfJU0kWJQqos+mKEmT?=
 =?iso-8859-1?Q?8TiGX/5USA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JtLY130LbmAAOhHxdT/DFrS37naaraNi0rPYSTNUrEMlc8ie2XrLkBGrRINWP/QM7B6OpHDGqQQvHNryzNa7hQYg+IJXc93Lv3BdiHA/5Kse4eYZBY5ZX5QLh+c9PTXGCM0xozCiqUPE8Sy78yCtAkhq8Zhu7hi4gPLd1WXMe1I1Svi1tth+7OsUBLAA8tBO7aNEcx8nGsyWZNy7hOTgRLWHOF6r91+EVV2YmH3YTvZGHtmxPGc64cKrUzqGbGRWi9rd0U/AWgLSAL7o3K1jIi5fgcfwfB3bUvHXa8Cne20vSPqKeuukYPDebSpIIu7D2+MI13UXVCt3doxsKut2xw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f3538cb4-f5bf-47c9-c7dc-08debcdb7658
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 17:06:30.1990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmYmxqId/s8QtPEuEebSRawHoumE4hElc9PpoWpXxyvHzV4P43H5WdcvqGkUwfEEKg9Esjui3QmdKUEtoymwSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3750
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: GjfeIsIS3FD8cLZXlfX7ZCMU2EWFKFMw
X-Proofpoint-GUID: GjfeIsIS3FD8cLZXlfX7ZCMU2EWFKFMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3MyBTYWx0ZWRfXxgtC60bhcJjz
 MtTVSDGH+76Ut3U+bMbiFSII5oSxanPBousCpdTzz0ASgmnUqxvBAX/u7oVHv7DQFiB+bFnrpHP
 Ysml1yybJ2nYzQajoNp8lxH9wECxUGUimOa/sUY6P0kZgdH4UQkWHbVOu4w86fC5sNtP88zKV8/
 O/pKtPQ1a2XVeznb2G10c7va0M52VxO/fHXoyOa4Wm16uN0U4fUIfXLdu6kNVRFcBdh8N4CYilK
 +x7hTSXdfuYCBJVn33BOronAzgI6cCgOXvAVrx2GBZ6KvNLyirCEVIw83tv8Z9+foahtiaiBXgs
 pENSYNHLHx6vxWLmb0gNGjpLCWYArsSrEG9ebhSmQtZ5mnKTyUxWQTfEsPmcHmQrDRhROqg/+I6
 ifShengydmba5LafNiKBHhEkUhObiFlgHglvEnx24k7RumYI/LgKSVt1nDig/cMzGOtQbqAAQlW
 H64HNtPKUuy24K4EMWA==
X-Authority-Analysis: v=2.4 cv=auSCzyZV c=1 sm=1 tr=0 ts=6a18762a cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ModqzXLkJJ0tFyq98apW:22
 a=OUXY8nFuAAAA:8 a=r4Q9GoSq2Y8VwEYKSMEA:9 a=wPNLvfGTeEIA:10 a=q5mp2vxMLvQA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280173

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Thanks Conor for the review. Will fix in v2, will add an allOf reference=0A=
to regulator.yaml and switch to unevaluatedProperties: false, will follow=
=0A=
the same pattern as adi,max20830.yaml, if that's ok.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
