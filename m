Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A5390CBF;
	Tue, 21 Jul 2026 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784594685; cv=fail; b=apEfX33AuChh0DTJdTM32BySXXp8ophefgHmOEagLBdegbHAyP9/liC/Cq0V12tHY9DS2uoBpBi2E5LOmj5PNd8Dp8lyVSRb/5Bvaj82kp30yTiKrMeFWl5oizDxCjF2Ztw+FkYsZt+DlunKh0GE6r9/h2AveEkDMoCrE62a4zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784594685; c=relaxed/simple;
	bh=O+PYagsX4e5rlOWVn4HGyO3puyK47rsltYb2c7L4jA8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oJmd/DIi2W+RXHhkf4t1rCRPV3sTAmitc/U3xqzSZzN+Uc1zfjdx+VaeLL1woWpo/OUFR8CmHwhVUC5wqKEd/RcEnYJig8KNHynlWB6MVM7sB7WY8+hRrn3tJRwoOeDNvhakdhdMhgsH/kNiJnMlVT9NgW06t/52+SLj1p599Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Z+T88oW3; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Z+T88oW3"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCm1g3190060;
	Mon, 20 Jul 2026 20:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=zNqoN
	O6bG7fCO+ouKpZiyWOv9aNJb1nqCgDjcjwyZdw=; b=Z+T88oW3k51no3C5DgTqD
	hkUWc0rCek5kBfUG42Yr2xn4hZAneSMR9mmDYgbl2jNOZcKE/ABowWLEJx47pv/J
	U2yVbpvIAK5qPb9TIQJrlsKzJaATWSNiB0BWB5AWLr5zyx1YAKKOZ+wz+PiRCNs3
	/StUxqLD1oeDX5iK5Njo2pQAvgaeMhzUa7l0i82N4GP2VfpUKA1CyqjW5e9cNa6E
	FnXZ1RUx/am1RoFNu2jx1N/vzeqShTEcKC88KEuMEeUnxWmcWUTZG0qVb96Qgedd
	ZzXIfWEgiTadZrL5oE4HkCn8gp4IsxwUb/1DZsXEFB2lqEk8p6OkmLaEDvTVfAhn
	A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fgttgef10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 20:44:35 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atACVr3Iw54koO2459kZeweKS5ivqJFy/8+UErRP2C+KWEh7uZHbgy3LqRft+S7KeyHyWsdS6X7nnhK3bYG/FRDSLTLBEUkqInlAnNs6QR9QBUxBKvZXLEgsJl3OG16tjG90YrYO7BZFCZaEDQVouORpvSI03auclUgM5IGBFdKTh90uUti1WPq9aB3pUSazYbG9X3yRiuvfe4OdSseHuKXp76y0Fm4PXJjkRqdQJaF9qVrpnkVdkEMbjwn0qhvZ6YOt8jsj5tFl33WFp829MKwPN9b/ASbGY3/Grb7DX5uo8pER5IrzbxdO1RT/TToS0rZa+f8lisRvj4ODVu0I1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNqoNO6bG7fCO+ouKpZiyWOv9aNJb1nqCgDjcjwyZdw=;
 b=bPdCgY+ZPqDz9Q5s/zjU0Yl7srzd8bT6ayr1s7qTyWjdlC7CAZmC0fwhZ+1vV1X7sOJ2wjMFB3j/PjQa/dpW2zsIechqSm0xW8Q0ltCrIFM0nHui05bX4z+dWCD2Cnz+3VLo4ztd/PjDI9hKHk8pAmAAxvJMblmycPjKPPpaGJiCAFly0RswV9EOrxd3zaRDRKl8bPtNzCaLyWHgfpI7F+Mp6m/3dMvEg1uxF41f/CJvidBDAA1Yuqp2xb6USpKOrKVOKXKeUxNhLMC3Z0SpeRP/39l/GtKrq/DGMD24ZFK4z2PW/bPfTapHzH2iMo4+iAhJid4nI/Bk2KqQwI4gvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SJ0PR03MB6951.namprd03.prod.outlook.com (2603:10b6:a03:419::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 00:44:33 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 00:44:32 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Thread-Topic: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Thread-Index: AQHdF/YHYeVjYhUSnUWQiL0CSyRQHrZ1vdsAgAFe/FA=
Date: Tue, 21 Jul 2026 00:44:32 +0000
Message-ID:
 <PH0PR03MB6351B1AAD3F9422CA98B5CE3F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com>
 <20260720032145.B5A6C1F000E9@smtp.kernel.org>
In-Reply-To: <20260720032145.B5A6C1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SJ0PR03MB6951:EE_
x-ms-office365-filtering-correlation-id: cc9ba2dc-ae9a-4ed6-fe61-08dee6c13b32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4133799003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 0BNJcXFPpDFdjkeEyqpWxI3JAjXPW2j8Fmxk6k+LxeoTzxBfrNfgv/Lzb41rrkYcyMT4+82gDRv8HM9nHCySPOcxjQ3ckNfZfxNpyo8oA6UOQaXYDTs6fnvIkybxZi7hyN8dJ8AosjLOJxTltx4s8KXdIyAMrVH2hQFgt2uUs++Ni7bXp8wzzYltCsJUMmncrCGHO+TtDVsyaImx+CRmkf5+MN/eOSre3NZFXD6wD+erjDpciuQDTIk++SjcS/lxAeN8wE7S8PtJPx3pb2FvM4VoUvmqP4Mv6tYwMnkT0CqDXxI7swJsbZKOkeWn1TBmdhvIdbj2JJSAVPOiXHdV9KYed5OrTsi1slLF/QxQ9fagoO+/rJW+ENqscoQfN9ekRGATlwOf3C+lqFxqYICW9hCmEEWroYL6yYPyVx+lGUoRUYMNXdDLb7vAxLVcv9dIW7/c2BTgj/j5M2Axvh3OwG5TgHkVvVnldpvatVAnJe/yrKR85P5dCXyFaOoKFZrR/SMcOtL40jXhtRrIBSnQkEJeb1bxs3064UNbTbyLaeYaHySsF+oXb/hA86ZGbQbsjl5lNEHleMLkBKZ/dhhjx19phA+d2/BwmqkL9TSq5522x3iM+WvUpnqFKwoS1wymd/lptbsutrzxkFYZj8roT8qzAZRFk0RlsW4s57v43HM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4133799003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9mOegY0YMkTdP61lCPzKXB6PSx4+c/FTTLxGwf9dU5IYvQy+jDAoNb1rJEpG?=
 =?us-ascii?Q?5NORYDgCg4uLuGUyqYUi1dnahpK81FjzU+IXw6WQq9k2//fGUkS94vB1CX36?=
 =?us-ascii?Q?2egcNSyLYvV8jCikoLVPFv+DuCkaD/EQTjQQHQXYHPWfs6cJbq6im28qekIq?=
 =?us-ascii?Q?dWGoLNB7uGDX7tMutU4Z+fj9uXQEMkbqfZ3lsMokjTptl60bc9HkKIhRfL0N?=
 =?us-ascii?Q?Kq2ScT+eBD+zoPnJZVZ+EJBcDcv8CcZbzHQXWZ+Xr3FWoO+SFUqyURO5SO4g?=
 =?us-ascii?Q?LF3kUyS9N4A6FiTBv9KCcz7To8tW04P2EtT1SvH77O7+4So3fZrc2TYOHuPq?=
 =?us-ascii?Q?SBE/3/rtwBWpbY791eWdXD8vCLYiLqMTRohRboEi4UJ3gqFSLspkz2LfYVQx?=
 =?us-ascii?Q?4yWgbBOmfUe6J0KmLZlhhy2WYkhwRAU/990VEBx5ZF/ee7983meUfkT2J+3j?=
 =?us-ascii?Q?jbNMRLGF2BJggS8SQnadlZTI0p6xu7WEZvnyRYLgOI1WdTQa4podyPvR2R3q?=
 =?us-ascii?Q?qStXlAsMmCibu2ZO8eSmtMeQNA37U3KhmLXWr32qIjRR+/ewA5jwA+dxmhAW?=
 =?us-ascii?Q?J2CrvVyMS5rd4LFNbIwm+IpN1AO/4XiAPXm3lxSfqJSggaSx4XrBKipcoBW0?=
 =?us-ascii?Q?Ue/JGNAfdFpUBfbtgN5qfgDHEnTbHDEVGwO4rgkeZ+3N2Qbu/dhplWKzmsUI?=
 =?us-ascii?Q?GLJdbm/8WE2q1hx8h1PQUzmN1CzTAMy3vijOG53zNCN0bb358phrlDeZGL/e?=
 =?us-ascii?Q?+ZZXu21ijkArqsAK3dTDaYAFs/v27R99yLYkI2565xd+i7p9SqcgSbKsLxQL?=
 =?us-ascii?Q?tR0YGqAW9T3lxOjoAVKxdowWtzsJVRrL3guatHqRcuaJWu53Xh4djKP5Karz?=
 =?us-ascii?Q?WOLEpicoKRA3zFMbOZFLOC7TefGYnOx1p2/0f3vcsjhjaIUk+3NOc6rpJWwe?=
 =?us-ascii?Q?GcKSpabkJUDBtDeV4KQV5+jAex38k2DRg9VQ4dRaeVb3H2ekBoKNMW+UtPPR?=
 =?us-ascii?Q?bIqa4S45nnUQ4sgE2LhP0hJXfLhIN0X4oa1MV90mzFHjdFLOg/KiBBlTqThT?=
 =?us-ascii?Q?AeUwmFUnKcuhdMAp1jF/9IJEyPqRkASRch33lirsdEiBaW/MRyELOhtndBj1?=
 =?us-ascii?Q?euc69KfUhAh8f23S68HzZNlZYTYfHkpyKX9s6/+Z4//tJ4txfcZ4IEgwX+71?=
 =?us-ascii?Q?Tw1LEG0Ng3TDQTWm3o0FldnVMq6damVS9jbbChbd1x+esXtNJCHNykkwvcJM?=
 =?us-ascii?Q?0oKzCStJllySp6jIrlOeXklsJmiKo6LT7/VmjX06xa5juPgae4vCa7YfyGSO?=
 =?us-ascii?Q?GHkjvW70jSICiHbsIQdqBX+K0JJBO8JatbYmN1P+yFy5fUZ4NT/H/IM5W2cT?=
 =?us-ascii?Q?JhGUgtxQiVr+kD1ljXzHlwpu+c/HUQfF4TS24U5OSgYhiwh/yqfDpZiDNF29?=
 =?us-ascii?Q?xfGN73oc3fAAfX2x6XfCxslAj2VvCEIVHbIW3l25QqzZ1oOfZQkBhqEfz9ra?=
 =?us-ascii?Q?Kln+rTKCP13cAXXyTQCV+wrnnr/djwRwwJwrn0sz58wbypD6r5LAQnxJy3OF?=
 =?us-ascii?Q?b3puz8QL/gDECabJ7ggNRaZFNCsh5uQ0fV49OzWR0lg9Hk4wSQsCH7V+P2Y1?=
 =?us-ascii?Q?lUOze5c7k0OjI/RtEu/qH7h40BaROjsje4iKuZDDkP7hWtgDZssnZ0nVBN2y?=
 =?us-ascii?Q?qIUSoY08Rt9ctkCbTgi8sD0+rnLUgyRif3RzSMgVFvj3jxiDb3hMLUiqoEW+?=
 =?us-ascii?Q?TxuDXP87hNrJ/nPs9A4bZv9KY0w/Nqc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	DLVQRy20YknTsiIqCyBy0iiCKb9umTuqrkLy0JFiXGhUEoddM896Rur9XBmc63r36eTwVALugmE8TenAXCNnHgfObDKs5zQFvv8JYoiMQliMg3e8XAj5yK9YpTPyLZILQPBwKoenLOKNSAyZNLtmwNk4cZc5ZCooXW8l5iriqOs5A9OAcwOmnVl0GU7AoxIy0aB1krdNOFeP/Nk/mr7+iCB0zkHKqrtRMJUd0wnj7+IQkWGnTiZcRrITcHfg/xzfXCTFbv2rmKax2fsqfhOS0JcWDNcq2/ivU01ceK2p+dVlHvVZahzEPDbtkHIjmUpKbGrGWCjiuJrdmnCpWScHaQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9ba2dc-ae9a-4ed6-fe61-08dee6c13b32
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 00:44:32.9363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VglW3jYfZ7woRIqTKGOQrCKg0qQ7srzNMZg+9gtmqrk4Jc0LC7P9923J++ZHrBocbP98rdoarO540DabAi79Hswtapgv5iPC8RQqIpVq8mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6951
X-Proofpoint-ORIG-GUID: rF0KCM3FU66JkWma0QFqWU_Q3TH_Kw6-
X-Authority-Analysis: v=2.4 cv=DagnbPtW c=1 sm=1 tr=0 ts=6a5ec0f3 cx=c_pps
 a=x36oJTDjInEio3y4qvlK/w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=ghsNeOaGaNpaI2TWLiQA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAwNCBTYWx0ZWRfX+IlSOrhFEX6q
 ZIMzf7bN9WrhmQBxTS3d/787/H2OqZhf/sJrALN6ZnBeqmkpJ/knXwlUUyE6pMRQEg6OjB3K6ED
 ygWV3RPbqGhB4/Kh7oWYvEKnEd1KrkgSRyJIftPTCFU3HtKuJv7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAwNCBTYWx0ZWRfXyfD0MbDhHBld
 p2FWIcdldB5fzlpq9ThoP+Jz+h2L8sTOx9kNtIktF1sMKPca2EEWj1Y08sGGly0ruMOTa9guvuy
 aCQV6+VtFu/8JnZEpvpWT+3UAogbGuGyIHzdhBBXiG+3jZTkIeCD62aVU7AModCPtgCLewn7r7H
 tNdN94VQmnmD0bH9uNAVhMRAa4HrJz+prP7GKYGRM7JALMYUDb/1lsnQcxsw78NPX53P9VkWHcg
 eVFnIr9zCyj42Xffx3fl/u6yR1KotdL7esReeo10EiLX3JaJvvYAld2tesETIQ1SAL1TQVzc8SW
 CK+UwsKaPK07nVqkHMXH/ZexUljho+wsfc7B79v8SEkMnpFpZbq+6KcGAuQidWFqyrTgQGVo+hU
 GeeKPfGLXoECRbJXd02vVzNyQeBLqUrdyMKBPeDruBxTVCMcA6IklQ1vDidbSiekkrGqGuLtkXS
 QmwFr6qpHRPRrPNAhyA==
X-Proofpoint-GUID: rF0KCM3FU66JkWma0QFqWU_Q3TH_Kw6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210004



> -----Original Message-----
> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Monday, July 20, 2026 11:22 AM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> conor+dt@kernel.org; robh@kernel.org
> Subject: Re: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add
> max20830c and max20840c support
>=20
> [External]
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to
> consider:
> - [Medium] The max20830 driver will reject the newly added MAX20840C
> device during probe due to a hardcoded IC_DEVICE_ID check.
> --
>=20
> --- Patch [3]: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add
> max20830c and max20840c support --- commit
> b032b17e50351faefc688ad31e1428a3c641197a
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>=20
> dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c
> support
>=20
> This commit adds compatible strings for the MAX20830C and MAX20840C
> variants to the max20830 device tree binding, using a fallback to adi,max=
20830.
>=20
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > index 214adf1a3b9e9..b7d3b6152b582 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > +++
> b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > @@ -22,7 +22,13 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: adi,max20830
> > +    oneOf:
> > +      - const: adi,max20830
> > +      - items:
> > +          - enum:
> > +              - adi,max20830c
> > +              - adi,max20840c
>=20
> [Severity: Medium]
> Will the driver correctly probe for the 'adi,max20840c' variant?
>=20
> Looking at max20830_probe() in drivers/hwmon/pmbus/max20830.c, there is a
> hardcoded string comparison for the device ID:
>=20

Addressed in patch 4/4. Driver support for new variants is added in the nex=
t patch
in this series.

> drivers/hwmon/pmbus/max20830.c:max20830_probe() {
>     ...
>     if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
>         return dev_err_probe(&client->dev, -ENODEV,
>                      "Unsupported device: '%s'\n", buf);
>     ...
> }
>=20
> If a MAX20840C device is probed via the 'adi,max20830' fallback, it seems=
 the
> buffer will start with "MAX20840", causing this check to fail and return =
-
> ENODEV.
>=20
> Does the driver need to be updated to recognize this new device ID so it =
does
> not reject the device?
>=20
> > +          - const: adi,max20830
>=20
> --
> Sashiko AI review *
> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260720-dev-
> max20830c-v3-0-9d06d27d6da3@analog.com?part=3D3__;Iw!!A3Ni8CS0y2Y!9Y1-
> 8bG621IAS4vRsBACPsWZTRxOMjvl6GwpDV_aXAdZxqf91aj0gx9M_D5G-
> LpeIpdqqGP6DniI1ScWRRNswxG98cP105I$
