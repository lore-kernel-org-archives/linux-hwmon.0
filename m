Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F203033CB;
	Fri, 29 May 2026 00:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780014007; cv=fail; b=PWPFcfk/1XdYE4dt58LQFiBCjbPXNpIrtZP1C+1/3DrFwnEhC7W6B7891cg8dJxckk7BOg30KMxoioOEo/tuSJGYge19pSpmA+Rb3YBntDY2wDZ1mzlwR/VqA9QXvP+r9g1faYi8AryNnu66BswRyFNSKELh5wMlm0ci/agHLZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780014007; c=relaxed/simple;
	bh=hmHBy9yT6RvhdK6fdh3thTTg1mKx328QR2oIfxIpLh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=erCVCvycWlfet8GMFrh9nvgQG/pefPSkuzBtMVkjlldRHPAB67paSxeUB/EOiCFRXOjGNI/l7Je//QajULHI8u1UzW5uuysLBwUO9X8xYF/RMV344CtttXpI5vmQvqqeJnSDPWpyYV7OQv7+LAyZdtIlXTpi+Iiear/BpFGhgfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=h8bvCh/c; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="h8bvCh/c"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0ADaf1589515;
	Fri, 29 May 2026 00:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=8f
	Gpc1ly4fGxxfvEzmLj9t0WKEa399QTd+C3TXbb9Uc=; b=h8bvCh/crji0urdYpB
	9e7+ygUDmKnt+pHzVctltdElBGavGleKAi5ZIAlWs1hyB77xzM0ILcsvRTIPg1AM
	ombrjfgilEXe0FHWMABw7A1ZtvueoIJWLygVDaz5TfeV6y3RlHnyXgyy3hl9VttP
	W2gmdKL7i1W6y25BkYSm6FzkHmKN/6PUH7mMnJBxYlVLuV6+lfR6HTGQ+mkeT6bQ
	lR2srouhSM7NxyDg0o0qAeWtMHHA/+PGoZdUHe/v85LEvROnaTi3Ktz4UwxG4dvh
	kW788qqWonFZ+Xr7nYuzRJ4S9AymfBWMZKaQX3V9Qpc61feExhquqbmW59cq1aKG
	HK2w==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eex7v156s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 00:19:49 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id B0EE413174;
	Fri, 29 May 2026 00:19:48 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 12:19:19 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 12:19:19 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 12:19:19 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMVGSCPNyhc00zi1iBBR9OUeicp30KO0DqCXl22pBm+B3Hv2vLp6ZSodZT/QuS/abxddtL+g0Yq/lQoFQePB8XUOfQGhoAgC8MIz3DSWBW6pTfWfbO/cx96HPSFw1zYhVffOUJhRAv1t1If1lI52L4tCiwHhheyPpK0DVYx9hrjygwiG6deY5MO3uWpvs7HDOwxoC6C1SEBLWegvH06JRnIdQbe+akfZl1HMl9OO8+hPiHHPnIs9fgr//+41p7BoC8Y2qFOxVQKrWPOBRUfPRgtvIK0fOU4XJMDEBFXfhwFiC0jatktLnPLRuRhclumyDF+Y8A+jEAqx76Z4GKeecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fGpc1ly4fGxxfvEzmLj9t0WKEa399QTd+C3TXbb9Uc=;
 b=wE9Y4ZQ3Cc7Sc3wXrn2QK2A0WyPwqFWkSolhSmmUKbqz5gWsALh2KRR7u7U+FOx/pTkzd4CCmJB+E9919XlRvZ7fpsqbvOT26/9w4TnVNW8WC9KSd3qLElCQF1v/Y3KVhWJEjZWOXLi3PelBdMaOAGbtkMihzuUalVHWkmBznK0pLlYpRJQl4piCWm19DaIWmZLdC31rUMHFKuDzCf6ZWKfwfbQbHy6HHtl6QnB0JEIvrP0cWOuPKJiLilt7hQ4w/dkKCueil8e9/7n3rfzroPfHZptLEYj2ENmCjnyurijsE7QM40QqT1gji3LNDx4Wpk/dNH+lE228VzH7lPSD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS7PR84MB3086.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:9d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.5; Fri, 29 May 2026
 00:19:17 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 00:19:17 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
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
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Topic: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Index: AQHc7wDJfwmZGPZ7PE6nEH25ZVYEfA==
Date: Fri, 29 May 2026 00:19:17 +0000
Message-ID: <20260529001903.625737-2-sanman.pradhan@hpe.com>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260529001903.625737-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS7PR84MB3086:EE_
x-ms-office365-filtering-correlation-id: 9a19ebc1-86bc-4e8b-92a8-08debd17ebc8
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|38070700021|3023799007|18002099003|56012099006;
x-microsoft-antispam-message-info: uRk/l1w/q6+U3KmxxzhtkZZy9ZOpubt8PzXvV9AjjcrlKv5c52AanxPUfwA7BJ583qJO31l2lQiiveHFA/xt6xQ/3T1/vVYi/2sY3ZwiZp8Y2Ln1h09W3Br/2HIH5aL4GZB/hsE2O2M+NSTvOL2AzKQzpLt18hpjII1j3WtqtcPRnWBRT/NSh3eHUmiRBY1/n9mVqO6fItIKajVnlHyM+SOQlhi1De9eYULnXvbGGIJRD6h5Yy2Yu7Ex2kp/YZ1LQtnvdo1xzKUBUDhRuxQsRa1KQh5K1szGApst4SnPAODOltLNxvq7DPod2ZsWpjktVIun3HHcgvpt0Jmpz2gFTYTS4kaTezJyvwnBm6/wwuRL5/wiO64hk0YxWC++/6t5R/bfVpgKh3k1JlhHU0gsXpKROUn2gn5YEeypXhDrdLa3KKI8jX82h4xBjC/JwQFusJk2tifvB3HbPTlO30E1aGNj22rmA8IFLVrfIfVJz5aqPizg+meOXHGyUdXP3tSd1jbpeejpJ+EzAN12tiSkwaOVNkDI1LdceXJ8kPf8weafeiCUW6Vf4/MERwLRaFA0DLdlQb9oM4+GjoXdzoH3B9oo8P9ZQGAItE7gjE/dEBcHIXBh90O/y3QYNQJn8C+aNfT/Zq9s7tXLLYMsySk4WCytk67wIgbaX2PTNJX8NctIfK6FF5caizDc7P0OQyF3wjlesVZMTqcK6+jD8x4K0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(38070700021)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NiEcCQEui+dhG/DPhrSSyLaGY3Gz858yAq5FBTa8z5Eqn8lg9z6W4xYZ3T?=
 =?iso-8859-1?Q?rIaEO/Ms4by9w2ABMh9mvcAWlB9J3SYR2OsOZ+3+we4ls7s94/EX0NEHrp?=
 =?iso-8859-1?Q?290Va+DbFevynhnyGWJ1GPMpailxCoUjdzLXTxBpE0SM8M+D6xZkrG9fbY?=
 =?iso-8859-1?Q?b2M0G3+dpu0c+BC1mFZHOibUHAdGcpixFOhvaofotZ3iuhDoiulSnh22VP?=
 =?iso-8859-1?Q?BhI1Ez9Wpgu/aO31FrhZDUqPucAicvg9QmOzzmglqSJAe/6oF0dEiAwB+i?=
 =?iso-8859-1?Q?r6bOdClV0+8PgHGuEkfXYpMWvz3nhClN7T2VS74P1NxVD5YLVgLfd2mGhQ?=
 =?iso-8859-1?Q?FgronBVuI2d54KY4PVsJCkfeHBwrktatfDhFV+78NZw6zu+OecNUA5kSe1?=
 =?iso-8859-1?Q?FaC2HwT0wbhzcZq/NhCJtDoTDDY+AA0ePqZ3yOeFIItDPfJY8P3D9exLAb?=
 =?iso-8859-1?Q?9mAs9TgcdfW6WE6xWg6KGt/L9ZzEwjEDLAsqeq6fNKvQguGb0zkZ8t3P/5?=
 =?iso-8859-1?Q?2ol8us9wEAYSlsdR+GlEgpw0QcK1kQU8QZaK8h9yQHpCRj2WpyrBsjyEiV?=
 =?iso-8859-1?Q?nLIInUcylfqxrIP+QPa+bAoVYO0XtATLBml5TPuPoIYmrSu5Q3i36IiD3C?=
 =?iso-8859-1?Q?+7DOXXOEXiHxJNRSEtP9uvzNSo94ILjmBNAI+4eFOi0omwraoytvdRhxDM?=
 =?iso-8859-1?Q?x1IoCkpHZWniE7ig988PGej/1LRbYjoPy4ZjtcibkTym0sWrXxxxOb5mzZ?=
 =?iso-8859-1?Q?f4KseQpMul2gWuebVXlV6LAf+OItN4WvjfR9iSMtxznENWtejKWHaSmZ5r?=
 =?iso-8859-1?Q?2uEfrITPhqPSz7dlx0zqF7JBKNU/mZyhV7m17Uko62CAlwibWVZd51P7BJ?=
 =?iso-8859-1?Q?j2H1drqIzIOXubVOZJJCk0cc46VZoo73bDpJoUAsdtRKyKrHh3/jqYe93c?=
 =?iso-8859-1?Q?ohJuRVwfiq5MBduOUqke/rkMkiP0FPte+MdKh65Q8ORbM8ocVLbsDIxf0s?=
 =?iso-8859-1?Q?u8+LRRIM2SpSUiSCqh+YDxf2RReT01pRmgIy1qFm4Xq0VYwavQPptFykYx?=
 =?iso-8859-1?Q?Vmle4rrwAvN1Zric89uEWL3tHYa8vKkJ6BaZ/KGEDRhmI2SBVjkrXceOLn?=
 =?iso-8859-1?Q?DbfMFyT/HynWg4uMmhdxg8eEh91ESIi/Qm73yY1xmllCfBRf07VQ5YWGEZ?=
 =?iso-8859-1?Q?HqAiH/47OpIB75CvwZWOJdxip0c/4OVPB2fIfOwc6C8GacI/QhqYrmyB5Y?=
 =?iso-8859-1?Q?hH4x0hh36c3Xv3JHaJFSdhSu4KssDZJpK2aeU5iEdwnA6lwD7tODW10IEm?=
 =?iso-8859-1?Q?TsI0DXdnXHirfjNhvF5VSb626mxG7UL9rQp7ZLLdW9i4iZFtGeW5cQT/8K?=
 =?iso-8859-1?Q?1oR8OqSID/g+zylQgJWcDetCtcVPq8S/uS5OOD48UcrEuDz/tEe+SyJj+m?=
 =?iso-8859-1?Q?aIKQ6iq/rJCbtJYEVCnmhHVJzTtM250bBvqvjCuzJRIo6nVUh+N8aIDAqK?=
 =?iso-8859-1?Q?y5RpuSXp7gco41E0WIQ6FIuVB6d0H8GOgskbkCEzX140zj6biN6guevXoJ?=
 =?iso-8859-1?Q?sXfQl+xxlyguROOYWWtcV4kcHxiADZI8eMOx26qKS05qpPA2ETgifMC6Xt?=
 =?iso-8859-1?Q?5zI4ABC/nCrJiKNOgINYbi9A03amAUo05sOLMV1CsCz5T8pO21HhMdBl9V?=
 =?iso-8859-1?Q?I68A7eyqyWvv074MLp0wLUKtiG19WKBujhkfSXDcqw3Edr+duKGtXIY6wo?=
 =?iso-8859-1?Q?laOc11eZzYYXI9K66s58O72hUtHRL0NDQ5VKmB16PGjJTRUtwrp8rGwdd7?=
 =?iso-8859-1?Q?UE0P7hLnpA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RXE48sd2AfpWY+A40f1qgb1IoACauUizXacjcLcBXcnImtVkFojoccCqDPcnmDIgS4pHDnfH+HixsbTZnn43qCWpVopzCNWkjJDvl7F6NDw6TSz0Wj/bBD3jbPb95rspWY9ELKd6f5FhLTcSwpZqCC3fI6QPK+JsCEPO1oHUNdE4/Y5Bbjkd6Pp/P/DQ0RBAsrP/Z/XSyPr1NB9r1MYtmi5i7fvCEGncU8oAnIOj9VDmdqLBP8wKM1K64y2bzInj2A9aNwHA7iKmQXyxgD3Tz+BX+Da/u5LknUFs7YuZNZB+w7WOA7S9+v6iEfsQpHlwraD5KUNIS/tcm67Bfs3Faw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a19ebc1-86bc-4e8b-92a8-08debd17ebc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 00:19:17.0646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ik9ejXJpVk2sCozZx5KC4HpP62cJQ4JqwHV5bechzPTK7DyDo1TMDTSOIbJwWG2mnKzjlrMhBlnc6DuLixfyQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR84MB3086
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=f5N4wuyM c=1 sm=1 tr=0 ts=6a18dba5 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=HxtRfhFi30CcAKtSzY8A:9
 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwMSBTYWx0ZWRfX//EIdFv+Duxl
 b5faQjPiMDnWCLgpnoiAlEuKeZVroHLMqaqjVEFtjHW7hrJRNMCji2kAhq6H5aL9TXUE/0Q3OC7
 sZ7RcxnlCUNYhOVTZplLM5cEyOjuq1UKhiyzyuXIAEINMBAqUPu/yPGnFQTGItR9oyZb/f8WIzk
 8YhBlk5KSgWgq1knd2gP1HSloB/PqHk1Co2y1gDniTvFLXBFlOzsHf74E7J+t7VFDV344dgdtGm
 7X6DP2HPZXX7XspbaMtEWQbCIIyVFpH3WvwR0+WFjkq0nyHB9EbKDfwO//gm4UgQa3EhjW/q/Cf
 GqJ2WV6VVSc6XUuNpxwABpfOCSx3u2T4Rpt5wv1vZpcix0F0Wjp/kKuGgh/5WLrPvz/+pYOs+rM
 ToBFY2W9kb7MbjsFMaZiZlrSvtNQ4KXsw3HbKZ1o1mpPuYDKOUHa9mzpYAM2fV/RDoMbIw+MyIu
 2BTN857jAv2wB6LY9xA==
X-Proofpoint-GUID: 0aBnIxbI5Xb_aYEGY0mkf9hTIK_-_IDO
X-Proofpoint-ORIG-GUID: 0aBnIxbI5Xb_aYEGY0mkf9hTIK_-_IDO
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290001

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add devicetree binding documentation for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator with PMBus interface.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v3:=0A=
  - Drop "maxim,max20860a" and keep only "adi,max20860a"=0A=
v2:=0A=
  - Added allOf regulator.yaml reference and unevaluatedProperties=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 45 +++++++++++++++++++=0A=
 1 file changed, 45 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
new file mode 100644=0A=
index 000000000000..dd238265d462=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
@@ -0,0 +1,45 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: Analog Devices MAX20860A Step-Down Converter=0A=
+=0A=
+maintainers:=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+description: |=0A=
+  The MAX20860A is a fully integrated step-down DC-DC switching regulator=
=0A=
+  with PMBus interface for monitoring input/output voltage, output current=
=0A=
+  and temperature.=0A=
+=0A=
+  Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+allOf:=0A=
+  - $ref: /schemas/regulator/regulator.yaml#=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    const: adi,max20860a=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+unevaluatedProperties: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        regulator@40 {=0A=
+            compatible =3D "adi,max20860a";=0A=
+            reg =3D <0x40>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
