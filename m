Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8F2DF3DA;
	Tue, 30 Jun 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806856; cv=fail; b=ucKRt4/TwOkYAwS8+S7UcK9QXt3Q+51kafdX7OBqQBji47sCQJxqd02+IOEaw7fR9LZDeh5akXlWmjFO8XxWSCXcwyGFEn0hKGQTiaoharKUOkCSC33LfmtSxMi0JeodvVHratEDaBl9by8NbmRFeyfUI3FwyuDTbayzX/9HlDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806856; c=relaxed/simple;
	bh=Vq5fd1WlFu/AFb5pBpNRrPjouyxdov48qTjHHkH4gIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M4dH7e8UDEG06dM1ax9ukFUexZvFVLTxqV/mGn3IrkRz8NtTO99d+U4xbWbaml+VEoGf905z7tlnaF09xzhvzdOBQYNnlnLR6fYF7rXHrF95FIB14PlZZkCctn0VYubRD3sUqNBJybVHAfT5FTGZno5Ll9ahz8/JK+ddiKH8oag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=sbYLrfC7; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="sbYLrfC7"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5gOkx4162498;
	Tue, 30 Jun 2026 04:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Vq5fd
	1WlFu/AFb5pBpNRrPjouyxdov48qTjHHkH4gIQ=; b=sbYLrfC7TqGa3MFjB/OoX
	NHE9PpEshkQdcxTKxGs7EZ/tYLWRDaZT020qsel/zhqTZHo8UBGRs/Dn8kL0qC2Q
	TZzmPA3bb403gSVa+V4qPMe8yV/WLjLm3x28KDBI/GUD20V6LXDWF4WCpO7OZV++
	g77Z+LdPZFP1my5UXUWQrgi4RUFFaO8KxtZyUAHsrCae/EhiAPAV2A04IUCJQSDc
	LHrqfwK5yalGQyoAZHxvctlG5/8FkcFvAuMlSbcQ/jrHJkbYwag/bYo5qT0IfSK7
	qvRZ+XWF5v5vvKb9QxsmoloPRxvIuvTbrKockCrFt/kpxSCYYiK1SF9uAjs4ZPLE
	w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f4604sbak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 04:07:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSlp+JrSss178aMpZUPQcYADE/bag4MFy7Wk7yKXgwWCuG9rHj2sRLH3vE/O+zgzipl2QZ0P+ZzH794dWTntPhcLzIxoobxUPP62fziTTRCFO1EAAD8lgEEk2CBjU2XQUqiaXzFgDHmpXORJ4Ir/Rr1LJhFzMotV4gdAppNYBkp1FWdMsc2M6Vz/PI050ZYsALExibIpE0F1lf2lAdZIpvvYnTEae1QF/PLgUom24kYHIluqztPgy4MaD67DEhh+viTxjjd8oNx7J0w43Ecd7QuuzPJbfb8nP7oP3jewuc0gE+YirRukRbGKpE2EFUmFkT+ysmKz6KIavkJyyzHAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vq5fd1WlFu/AFb5pBpNRrPjouyxdov48qTjHHkH4gIQ=;
 b=MR3ST3Gd3AgglV9dtXajKhxzPw+Hkx7NQPe+2k0SaPcv+bTRPzvs1nafPvrkUv99QJmhy+cq1sOZC6GA0aosSzpQCnI2QAf6ICpyehPT8jGU/YDbkrbv3oz0bySvYPzP9ykEVkMXw6EYHqpTj80DP45C8Mrr+yZ0hNJ1CSxvDvImW3N6nGStYZlmSvz6Aq/TgwjnPbVk9ChNYKxvb8wzapHIJ4sjGdSidrLcHpaJOXGij6M6imAiB8YkxDkhN5iLP0+q2c8bRoINZ/bMzxSme9ezGv3LjwkjzR6rsoeI4NHqAKn4lx5vV4YwGQyffAIkWqAU7kR2DzgYnOM+beKFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7214.namprd03.prod.outlook.com (2603:10b6:a03:530::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:07:19 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:07:19 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
Thread-Topic: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
Thread-Index: AQHdCDrCfXjw7m2rKUWmKtVpV1zDdbZWswmAgAAG9wA=
Date: Tue, 30 Jun 2026 08:07:19 +0000
Message-ID:
 <PH0PR03MB63514D6ACDFF20DF4D1A4855F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
 <20260630-cuddly-quiet-jackdaw-b7ab3d@quoll>
In-Reply-To: <20260630-cuddly-quiet-jackdaw-b7ab3d@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7214:EE_
x-ms-office365-filtering-correlation-id: 2c9c96c5-048b-4025-d949-08ded67e9b30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|22082099003|4143699003|11063799006|18002099003|56012099006;
x-microsoft-antispam-message-info:
 yNYt+IsiEg8bv3QwS+LQvl91LeNtf+lw/NaxXBqDK4rOtv9qSZqMk2Zxvyuqxz/nvv0xMITcTXFKxqpKDPVJx7XD7QzWw1DbiOVFZA2EZQEeKNtFV9aVmp5AO0wjKPUSEjOGF544zK7ykG1O+WR2Gqw/Ukx8y4/vedhoztlzHPmVDxPX4LMWmn2D0jTN2TShlHiD4kl/JrMYw53f5npREPOX7gKKAj/LCjCOMCt3P5xMLQE3qr10SbEVRxLD/boFOWfIB4PeUJuTa3lmVJcM+7ElBUFaa3mVHPCuIWSuQr6QWrnu2N9M19ro+Vs6/TsBlWrrV88U/8I1ylxYOOeX8n1+cD0W8aieKZZPnk5TGKz9F1+lZS2kBV3cn/5NS2f6msTnoqf1vgJIQzPDQUSL5ZmBs6EC8pv+e33pzOn+HtUpJjxSSKO9Y1G3woFjqy0f70kI6ruY5Oju9QMuFooLHGYS3Q7Q252NpXpwA/OLBkjRP9/T3aW135ive/CjEg/1/rjMnfqyVHxYKenQfn8KcDWC5Lw6aavTWzXmK2GdBibjYxl/fk01IM+dn+jqNUpeWfMjhGZVIkfhAVGqT60TOLWmn6FyVveBjTrYqI7OyPdGOva3qlTar31slmHD1ulSSYnBu9zWs7bxeqggW7Y3sZM1AN+SzDQcSF708r6GSaaRP8dRlgpvMhsgCCec4jAhjo8Rtq2SLltKaffwH8flYoQqBGUmQL1pLYRdqRFdPLY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QtkBARiE432Y5CpTtwY+YmvjYzeF4w+dq6EcQOdqi+k2eTx7YfPe0RdPM7wk?=
 =?us-ascii?Q?2f7sBlNs/ywIsQ1Ppws6LvTQQu2wEXPayBBDA1gbnshgigPsV/hIHO0r9VmX?=
 =?us-ascii?Q?GUCC1SWxbCvGHLEGNAaoZifjvNYNtO7K1aQGSga7LiesHZg+qSkQvwxdGS7U?=
 =?us-ascii?Q?KSq1fqHnadqSgPK8oYifCa50TTCRPzaYO+qk6ip4flAdN3Gd3SMnHDOQPk+F?=
 =?us-ascii?Q?r9SBdn2lMFO86Eh0YA+tOzKdY6Lg1GWKIs/n4KE241IO5e2t1Pdrxn2GLmOO?=
 =?us-ascii?Q?rCgmyX3whMir5WyKhwnir+OMsk1BrLAPCQPzhdPZ0gtqZugzf/FCqdyDJeoa?=
 =?us-ascii?Q?6TPZKrkw79Nl8bRB5DJIkrnPy63BRBdx3M0Xm2yxSh0E3ABQIbzre/8diQcD?=
 =?us-ascii?Q?lDG2dMJJjZ0rtmSF+h+jcF049YrV/AkvAC+SwuPBmWH+mh55+Q7I3Acpz8mr?=
 =?us-ascii?Q?3ue5DDAG5aspOqUajb4HW+K/Cfn8cgs140iDXZEgsMFuHISU0y9MQLksQSbz?=
 =?us-ascii?Q?QFWRvfgZ3lX5knod1RaqgpoRchYlp8IAUybM1UlPbXEJAfj2WwHolXtVunXu?=
 =?us-ascii?Q?UcoRiIC8jNV6VSbC/e0/9BH0SIhQLjg0ILVE8x1+S7hyhWi6T1FNQrl4rJD0?=
 =?us-ascii?Q?4T4JBJaCw98yONYeWzPIAYU+y5fgf6caz9Vv29R6uUqDjtUy0c1HzEXfgk1Y?=
 =?us-ascii?Q?lBALIkHwdO0nc/mFaWty9wRaVetbm1pO79taR/blRr8Cw/gzZc3/rufr04HW?=
 =?us-ascii?Q?+vTkQP38Gbs3fRLvIE9XB0GHPQ1wpqKWbZIirRGCgrz+zvXkAhVN38LL1uRJ?=
 =?us-ascii?Q?gVXVGPrmx/FumOQHGYFRvsiDtWrkYFfIT4jB5N7gXTrg4NDMYA+idONWA9CB?=
 =?us-ascii?Q?D1cjMkODd67Aq/bGbEsMyBJPiVc2uU5v9k7HtiP+ohmpEAUhx0oScj5y8U6H?=
 =?us-ascii?Q?jLf5UGdraTdPsEtm3hg7i1OeeICgyoPafLfWKtUO5STMOmHflbTxkkdUwFOR?=
 =?us-ascii?Q?e1KNBUrp6QqLsG9HpBWD5+gdF0hRDaUGHDOJ4dHs8zYhdsmdYNu1fZSn2Nd2?=
 =?us-ascii?Q?QsDL+iNXXCYSfsBVJF9V53OeSMLOW8HLs/l6vpxJ396w+k9H0dg52/bu87SI?=
 =?us-ascii?Q?nHQLCGHgCI9QzS6hEg4XPrYs0r3Dm6QcaTuf+5LnqH/gTm3RmLAg20J0LH2t?=
 =?us-ascii?Q?KuhRTeM3qkrB8vxefB1IbNapG9FJ6TujGZyRjZFD1k2o7NSuHTkS1p575Umi?=
 =?us-ascii?Q?WCRtzlKMIpWU6JhqWZaS/KZiWB1BWU8fxDZw3uhAXWY+7v98vQ6ddGLGLRYw?=
 =?us-ascii?Q?Mqw7CdL62DeZyxAvJrllAYGWXugFA5WYgW3Y8kIb3mIqPIjMJ3RvDBjwbCMj?=
 =?us-ascii?Q?zBx1OYRKzfAQF6tl079L3oqS1OlFueO/S6I+jP+hV57I6S2RgYPhesj2A3YA?=
 =?us-ascii?Q?QWhSgBjm7p3z4pxF+CchPy5wsGcP8xUanRu8nbzM50QmYKgRaapJY6SoiigO?=
 =?us-ascii?Q?8qT0CjfVjJVSoDOfIx9JOsKZMP0fJWBH4oVC13nJ0IexZHgXqzfBqJFggct3?=
 =?us-ascii?Q?C9qxrz0AfHsYQ+qBAHGtZTCGSUQEGSpNdEIWcGHqa92QysAn4KJ+7huSVwFp?=
 =?us-ascii?Q?XXn7OYXnsmr0akO8OMTG0CEnqiq30gEhXLdhAAiLocCRsUTEOffqg2r4mzBY?=
 =?us-ascii?Q?hpoIMU0CnksvDMgLhskkgrwU7TcuhHTDUbfwIMiy8A/vaA0pFdqULLVonByA?=
 =?us-ascii?Q?/mRpEU2kSFuW2lQlq2O9AmorCfE9Acs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	eOOcU1uZ1/iXmRTSYJiNvOfBhER4vK8+ykpYfJ/OTJR15nHPizceMJ3opcgkCy1XakTCsWMqjMfe2NWhNmOp9IZJMnw1evbyFw0pju+VH+kNhz8Pb01cZ3wM0KZ2VVSctST/ukml9l/a0DukiAaisecCUKtOtqWXkbYNMpiquUJxyiR6wec1YjxsmDPAycKssfxmL5SJK1keE0S995XA+2chSoQiq/gZzgmkeC9ei+zeXAlY1lUYFOCFuITFDHfwb954ITCVEIQSHHsanbgI+y52pGEZeUky91NxYA7VZS29sxNBzDtDbcYYVul7AHxBVs7HQoMVrFo7W061WUf1zA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9c96c5-048b-4025-d949-08ded67e9b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:07:19.0800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDnPVDzRwcR4zb6b5hp6P7r3vzBh4S0cL0h3Zu6e7rkZYGBwi+xF9lBA7JnSIGBOrVa4sGRAYdDPaw4cPOf7TNXtkxz93rWAcS7EVxjEFA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7214
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX9rW+THtvUFM8
 61rz3D68e2JdNeitZPDeDrIqbZZPnNe9eVUMuOGCD2LUqQqknHXGMOJM9+7wdtInTZqO0IrxLC9
 T0zNlEiEFd4C5XI/mi7RHak1b6fsiFkJk1HSoA0aLvewqAfEJ1qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX4tXtMXrl8a9f
 PtZkgIYQIP3oIB2hiycmg57nZPHlu+eNf7wb+51kCd9SexgWQ2JqulL7/6ThOGm8mJX77Rkob5F
 kaWBv+lmAQxvSheM/NrJYmZ2RstDDBstVQBUeWBvn6sH5O4O9VhPc/kQPbuu5NJUwh2KgS56LyX
 RGu+JjSOGbzTXr0fCWguGk83pyulXe9PDC2SzFOdNpAegqBmAEp1pbEGI35xyVMKHVQM8rrrCmF
 Jo5Gy+x/FcUWtkISXdgTab7NF+cRurpZAbrg2NydEpABFPZuTYr3eDg43mM3JO5nX7GP+ppYuMP
 wiSPuPyhHSWRTirmrbdkNuCYs0w5d2o44PzoalYUVFAPWQKqcoJV/u+Eogu7ymV3B3RvOJGzKUN
 T0LtZsqcoDE1LZTD9PNJSij0Wwc1YSxzvKZWmSOGGQH9r83DRscXIfJnq2EFqlIAkXuLEU2I4A+
 90bt1RAWZtCGsZdu9vQ==
X-Authority-Analysis: v=2.4 cv=BMCDalQG c=1 sm=1 tr=0 ts=6a437939 cx=c_pps
 a=9kClBOisnrQnHM/oUG6sgA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=pqUg59u8bbk1vOif3ZgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: f5FU_yffz2oj4m5NbNoCZlLyiP0cU3EM
X-Proofpoint-GUID: f5FU_yffz2oj4m5NbNoCZlLyiP0cU3EM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300070

> [External]
>=20
> On Tue, Jun 30, 2026 at 10:46:43AM +0800, Alexis Czezar Torreno wrote:
> > Adding a missing entry for the MAX20830 EN (enable) pin.
>=20
> ... because? Device has it? Was missing?

Yes, device has it and I forgot to include it in the past.

>=20
> Make also the example complete.
>=20

Will do

Regards,
Alexis
