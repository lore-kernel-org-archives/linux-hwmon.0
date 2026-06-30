Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8A283C89;
	Tue, 30 Jun 2026 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806846; cv=fail; b=utnAU3jPTr8CmrSc3ZfDXYfVoS6AiTQz6esmV/2XBYPdGgmgcyW05967ok51clzVKnwS2fwIPWKpH1I7wR1NuoxCoL6yYaA4GBTsxfLOWE05IUV4xTadGzX85x1Dw0avbYS8xyPGsvwo2iRHLOSRbgxtpCXv3e3HM22GUyDEtfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806846; c=relaxed/simple;
	bh=DHQssAil02VEmy8cFJS6v8Elz4NhoJ857koFAloCbaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s/eeCg/qEUs/hn6NMsWimUcqViYMDB3wCnD5d8q7BBfqBPyeP/svwVj5cHZY/c1ud5Oy3ohDT8QEg+TRf3/9ccMUnx8nEmDzNI61Icdv2UidBIarpr33r2Gnqusmz8pv+2LsJQM5mwtszjFo4dRgkWORw9GGC8sE7Qf+M1vWKkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=PutUmcJp; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="PutUmcJp"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5jxWW4137353;
	Tue, 30 Jun 2026 04:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=YIBfv
	NWBnl5tIlHnwh4LEKBc/KL6a7H4eOPoUf/fjBc=; b=PutUmcJpcKew5o06tmmTL
	WuEx86nvowuKNZe+8r/lj8U07uIXSwqVSjwbr6EnwAsPaysR0FrvaIZ7f+UQzwZV
	r9Hbz1rPMaZ2nWY3kBxnSTw4voyZwdlMBys5a4olAOVb8iXm48mNnpe0sGSttiNC
	lJS4PRRXAHlMT6+eWGVapXxP+06wtGNTJrfmTV0k2TIAL3TVtDXQTMC9BV/2sTfk
	IGlWfdOXbhEo+MBxagiWaVY2n+NwghjaDE29fVErku0jwmJWBagToqwIqHlXtmvx
	yuJKR9llR4RLRr8ZU3824YPMXKB15IQbDhxxX3or8NNG7PN+br6MIS0fKI0wAlz1
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f3sav4nsv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 04:07:11 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqRDq72M8fHoC8JmsJ0DdztWibyr2N1dlwPrdLMOWr3E2KroVJyeMaR7zXxN+Mp+fGJNWYcY8J4z2M5rrBMs6iF7mg8Nv1znuLuOtHCyeJv6Bx4xMduUdUKzllVZp+pdlcImsVx+ZuH3ZET3K6TbtIWw6CsjDq6iI7r/63D+LeF6NEWwH+OgPxpyMearNzkGPAFj8KU2uB7Pfapb9LneuKFd++7VB0oRe5RxG8kZgmgNXlMbN1Pf+AkEVVaLJCpjUu0N/MlXjP0jUCkl2us9RyxF5Q45ZJrIWD6JR1BOwhv6gIWuz0XRqMK9PYZCWXPGwZTvcuIZKHLr7ykQzT5goA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIBfvNWBnl5tIlHnwh4LEKBc/KL6a7H4eOPoUf/fjBc=;
 b=H0LcK3RHbKdQYa1E+EbeuAVi/VmucMe2R7KKUDm8QD0zEJsVJtOUAeUbPFFsHu1IW/Cprz02qlHc4RBuOVhSxoYeEE5OuGQh4NJNyjp0X++gEtFPBK1Lwl0O+X6w3URqSt874IWgZ+PvLUpQy5/6jOMMeKT+x7FDuxOHo+e14tZpb5ILY4l5QxmatxdOvmUdlIO9+C+uqfOuHH1GF9KRNEE5yvw+O4B/JPtsWnnWUx6ipT39mkN+nDQRi4dN1zjUpGAlTp1mJmfJI+Nm0hdgk3sddolNZ2TSH6aMxyBFc9sck4yCes8rIU9phRDG7ABVxjDp7RhpiZghglLYUb5wDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7214.namprd03.prod.outlook.com (2603:10b6:a03:530::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:07:07 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:07:07 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 2/6] hwmon: (pmbus/max20830): add support for enable GPIO
Thread-Topic: [PATCH 2/6] hwmon: (pmbus/max20830): add support for enable GPIO
Thread-Index: AQHdCDrFNFmMqEG6cUO+DYOwrkyHK7ZWdpkAgAA9qdA=
Date: Tue, 30 Jun 2026 08:07:07 +0000
Message-ID:
 <PH0PR03MB63510091968618FF5D6A5CDEF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
 <836b833e-e503-4cbb-92f7-3574f3fb430f@roeck-us.net>
In-Reply-To: <836b833e-e503-4cbb-92f7-3574f3fb430f@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7214:EE_
x-ms-office365-filtering-correlation-id: 8a87380d-2cac-4a61-905c-08ded67e9433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|22082099003|4143699003|11063799006|18002099003|3023799007|56012099006;
x-microsoft-antispam-message-info:
 R0myUn5VBX5RlZqpYVl0S4gA2ELFmOlkLU2UVVW+3ztwdvRCIfLenXHpyxQw6U1KmPIE9c4BEK6ibHkH9H55XhzRcsVcltZ7w4aA9+toIR4WyLkrhIGwXs4iE2gMG1sYU8FLREDk3iDwOlruVZ568Rhqnp8uGLSmfVRYzjqDb6UY23jF8YB2YzAsmtNdlz6ex8BvqJ7pm2qqPAWkP3aG758wU9JMLoOH0uCpzyCTgIqfNey5YWAzPY4BJQra5oBFinX9+aygH47lX17QHmUchLHPeRqMMmZ0msdmMdIWA95b1dZs9EY1scKYKn7NBWM925n2m/BXlIcH/SUJ46cJQ0xOONL58DndEBYV3V6Do6bH6PBlrdn7fEkjRzrlIvUCc0ciKetLILke5GpighC6L4Z3Fd4dMRNKAWdOY10XDDVTEvwQ7CPm8OVQNHtK8baceBMIBHbnJRpeYodrJwBgUSHjZgrd1c0dNDHIZxYLsugxF5TWta4Iqtrnsy2kLvK7lS+L6qemtHRPQm2DhGqBMc2fNLd4mAI+9Gxzwq6t7Euj7GfyjPnDPVl/J+BSWIGrUNm5UOGEqx4P+7guvQw198UO8/nJBV6MTy9gKIjW4O6JKCKPagcYDUi6E68i4ZZdAbeWltWqyJVKy2ESg/+kGoF21XPpw7JYxmAd6p538+O/HxeJWN61/9qyULTHaTsTBau0eEFCt5k7NDJuxqa1zUneTKWIq+dGe8+g4u8AZpE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(22082099003)(4143699003)(11063799006)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dqe27yUi8qALq3hpBs8om3Ik43H63wDF/c8MMiuk20qoFOLEZnmW5uQa+j/m?=
 =?us-ascii?Q?GkiVrd0lcuqz8g45gCzUNNDav95Np3H7fD0MRDsIrHoOw3mvFD6IAI/P32CS?=
 =?us-ascii?Q?NScy1Cehh14istqsQIJidwQcWgNiFJq77qW95X4Z1PD8x3LY7QsG2juV90xl?=
 =?us-ascii?Q?a6dWWSDSjHE5JkOHOW+t0439OIPIL3aHbePb6lJfVegacdFFKzAODQK0aAqn?=
 =?us-ascii?Q?79i1Zz9aEibfCrrJ94Cp/fvEi+6Vz1XtwHkzVP5YrEtLK0cECSX/c73Q2Azq?=
 =?us-ascii?Q?bMumAL0CNylSe6psfP292Fm0RCy/JrWdWsN1PpcSyVA5Uc+fYQ3VV6zax7i3?=
 =?us-ascii?Q?9DlXKbhBaZI4vwwdqE2Ppi0TiLFn7RUVRp9TC3EOPgkLupZTp3p2BqLiug1d?=
 =?us-ascii?Q?VZNOBDriu5JzprPB7JYg+/vUcHsyxurMIK9qtRohfmw306rqt4C9TRIp8y8b?=
 =?us-ascii?Q?QZt6QZGl962pE+kMmeUWpABk5V1AFxyf7gZFVXDIjmldn0NQN8XNwzlNO0wO?=
 =?us-ascii?Q?m/JaPAWqwXaHn/T6yTRttro6ZhmSsmTZbVvP8V8UyQSyzPm85KAMb4EXnsEg?=
 =?us-ascii?Q?bU15zCKyA1aXgWcLUXFxNiqtYtSABT0q6P4kcH/IGI4uTzOPl1JL8riNvDFP?=
 =?us-ascii?Q?MSJj/vfa30zNAWmrRixScUPatKSePtdDypqn5AKH5QzBZu7rDmWSxdlNslMN?=
 =?us-ascii?Q?9ARgAOeqjJdd4ilxxfv72omd8IicB/LzxiPY94gCJLjCqODdU1XboG9t3EqY?=
 =?us-ascii?Q?+aiuGz0S2CoRZlwWWKJJhNm8//I5m3ikYZ4mAN5X8KjSrPVc9HTyE4dHrjtx?=
 =?us-ascii?Q?DvWOemMrIkjTCAtULJiCXPdvbYyMDJIcdLpMF9KkhWYkwAMaiB7Y5YvlQ09s?=
 =?us-ascii?Q?3+omAy4xHEGddaLplvlxPmy66W3cZ9VfLfO+b8qeWjgo+z6kKg2XUxEJ3ki9?=
 =?us-ascii?Q?CTi5sPVIzbv+HZqMs1EYEWFNzzA7E8vTBJaFv+E2lJHjY0QBeuaVCCVIuCrI?=
 =?us-ascii?Q?6nLkF01rkebUdgP1vrMThTyjzN7biMTXwNLHUzTImR3Hk+mmaUQ3POhFNDVA?=
 =?us-ascii?Q?j8jwSA6AGAwJzJrPlWZY1F31nLEC7t5j6MPd75Cb0ndHNYPtBKh2IIOdAQVX?=
 =?us-ascii?Q?NYJnv93S+KYIYkeT0YquC4OnEZTtWzjbnyZ3VM3adfg8PB1cl+CCsFrTRX4J?=
 =?us-ascii?Q?mKToCwm1hgN9/FY6F5BbU0ZgLf7u1o52kkzRHrkP/T4Oz/LJ086NiNrvekBA?=
 =?us-ascii?Q?Uc8MpYeMPzhl8JtXKl7TsNRGH+eDlS2fXsuV0lOu6bVAB7kRMd7Te8+cA+/A?=
 =?us-ascii?Q?ZlsCeAkYaWhuwgZAF2JToXF0s2i/my2mFAs6/KDtpUkg2NIzS33xo7uj2StH?=
 =?us-ascii?Q?x11Xj6ybdn9kgX5eQF+Qmh3hGoUcvzWHkywfTnlVaZk1Pa1SroX099vFDLqN?=
 =?us-ascii?Q?AX6m9+uyi5WOKT+QTAGSuFXx+SOw75kF0tNUcXXPRlUMc8HhyScPJoUwpGAh?=
 =?us-ascii?Q?tCJVt8ikr+/70SftSsVtVOkfV91mjH+7I9qohMgGzT9IMr2Yr283enWiycYT?=
 =?us-ascii?Q?4cIkCzGGVXpV1Y0pHZ86ORHRXQb8f/0zTUH58gXtp2l/GZ2BMACVpd0ESVs6?=
 =?us-ascii?Q?T1+YI3DP1QtyxwB4K2lsZ2kfw3JjkKvzwKxKQ0OlbtMhVKOiz8wRMZJjI6So?=
 =?us-ascii?Q?yR2l0JIrWcj6ST5vr/lIZSCqn6pubj1odEC0vDJnz0FL1DzKM9BpNVJxWiZs?=
 =?us-ascii?Q?AKyEanHxxGfDCA9mOochM5Fo6L663fU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	l23csbVrOf3nBJLIuLY8Zdr5DYZrQzavbNZbllNxDmR9bAi+F95NqvcMffyk3SBPxT1/AwQcZ3gBYi5C59aKLLslWAamWhjIG8txp51TQsMFcW4RXjWMSNVOnSvCucdUVUbjNBb+HLB2Q0TpRBVH7UgZfdAXhxMSbhXAGMDWOCnvon58kLU32c/MqetJqrCq8KAiYB8dMXgjn1fIRI6ZwMD07eD6Xu1Qh8RVY0+jjAV8m7Jk0oOdmJVyB2ttXEwhWIa5KaRHvM3oLHfnWJP7KuIgjahXjOQMYUlA3MSWVcMcNfNp5BhkyxHTvDMMG8fxy1q7qrwHkWB3A8EQz+yl7Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a87380d-2cac-4a61-905c-08ded67e9433
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:07:07.3702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRRx7cgPg9TSoTvVgU8oz0c8YhJihGyl6IaG1BeWtwOtmjAOoPBxHcILgCcCrLkVYKQrvEYPOMYkB4sn1GLzJCk2sfYhO0+SZXqvzLW5b4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7214
X-Authority-Analysis: v=2.4 cv=avWCzyZV c=1 sm=1 tr=0 ts=6a437930 cx=c_pps
 a=bIHOvEVewOWTfzx0yc51bg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=3EgtezLPOjzPrvgHJgoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: GwWEX5Kezo1XLEEi13nZtKewVwwFu8zU
X-Proofpoint-GUID: GwWEX5Kezo1XLEEi13nZtKewVwwFu8zU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX7q/prrktPlLz
 vxW0XhN57UbGkx4Vun+LfGmttMvHhlev033posz0QVvjRytUljwc+wnX/P2yiIqTKGw8f7QHwYu
 WyRlaPG1YY8DJWhzyQa32h8h1IaCDnd1AaJgTbK4zI/v+ec7aGXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX2wxMd25XLw8k
 eQmRLWi1SegfEJtVTmFXOdXTvWKQWXyPi0+I7Zfmdibf7n+a5mzmNPVIap9sgS0Zsgql+yO2NFd
 rycxxs/jWHYiW5+/6d9oX/q6nOyFYaAfXAb6/BVUm95OOHIzzQX7XTry2jr/AxfTG8RgnZny+ld
 x4quinJ7jJuHdGCBBOztfrjXxqXudUMDBk7EORP93X7y3X1iINBuQPScdHmIlhNwWV0yAte6FBx
 yQ8pmXFGwfWxbd/oTZucctYADB7422bhG/fhJJacZPwjCpswNufPlsGQuGp7WuYeWvZ4d0rRRki
 jnXaLWfB/8xnUalIVHJ0s7wFr/XIAm4LINGp/HxV+m83T5G8SDsXtDV28AuzmXWcHhCpzLLyH3w
 Wxs2iqJ3iowk9MhwVU9L1TyyeUg3zu0BSXKAW3Lz2uyinLkc1IPayg4vrOAFG0b30u4+ELeeg3h
 braxtoy+Q9mYh2tF7KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300070

> > +	enable_gpio =3D devm_gpiod_get_optional(&client->dev, "enable",
> GPIOD_OUT_HIGH);
> > +	if (IS_ERR(enable_gpio))
> > +		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
> > +				     "Failed to get enable GPIO\n");
> > +
>=20
> The above code gets the gpio reference, and then it doesn't do anything w=
ith it.
> What exactly is the point of this exercise ? Where is the chip actually e=
nabled ?
>=20
> Do you have an actual customer with such a set-up or is this "just in cas=
e" ?
> Have you tested this code to ensure that the chip is actually enabled in =
this
> setup ?
>=20
> If there is indeed a use case where a customer indeed connects the enable=
 pin
> to a gpio output, wouldn't that same customer also want to connect the
> "pgood" output to a gpio pin ? And what about the LDOIN pin ? Shouldn't t=
hat
> be connected to a power supply ?
>=20

You're right. I initially just wanted to add the enable pin in the bindings=
, I might've
thought I need to do something to the driver code too. Which is unnecessary=
...
I will be removing this patch 2/6.

Regards,
Alexis
