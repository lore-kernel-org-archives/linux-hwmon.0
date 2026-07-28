Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F523BE636;
	Tue, 28 Jul 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221946; cv=fail; b=eSfVGG7VVYJal3LD1rK0jaAcGsGu8i1tGUjGV34FeSWB6UCLL1X/fQlQ8i5clSUjZynsOh2SP8Ael3hHPfEmJAenNtbY8Q7YjIZTgCL6aHK2ZEz3UCEwgmQhxG7EnbsBPmgwAiNcyOppJ1dweNKlJJv4XFcz61yK2Od47F249IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221946; c=relaxed/simple;
	bh=BJACJXBrtEsKp+6/FCq5amSt50QksHVKkIhx5AcpjX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oxYtS+SIhNXZFyPDIroZmb/UDDTvpKLpAVyTBMiVMvNOm3ocztJhv877a5pXiSKmTsKfnjWUOsgPnLBgCtEFZkSrHEWQLqiV3pFFfvvhFtQ/+Q/vBl6I0XFS0BxcL9U28GtanvXip4jgTWAeE4gEZXCeEtSKrIiVrMSGeMCT7h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=oW6c/02P; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="oW6c/02P"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3acWb2421692;
	Tue, 28 Jul 2026 02:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gzn4E
	TWF3DTCm+QrTMpowNkag3vtbfxsdfSr1vC5dqA=; b=oW6c/02PXQ+dRzSI4Opyu
	8JXQZKBHbnlMxtqbNPMeiYhtoyLGBjQJ3xtCvOgq6BWsreULzcy897BzVqFJD3Ux
	cWOhqiaOVZD8AiP/R8M/DcJsnAe3exX+776ac1Sua4nCQde2yj99YNcKiPd1AkxJ
	j0P9eB5sgqguxhRRgkCBjRwmTTw3BPultfYMslLNkW7f6bPXFn1ngrJJw1C/Jt9Q
	MAkpSxKXkfi4+Gr5FtvNEFQGgTbGfYeJamgsoV+0mN6vgrmOQgYSrgI6Fu3rDO1y
	jwSbWfj+5ZpNutCW1kQyUKmzDzOjcB439zn+76ew9cmtG4MjTgCyyld8eTaPecJt
	w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fmq03mccc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 02:58:48 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxI6PyDvFRasx6SiHFo/JJlKg80shCU5Eg0RJUGzwmQ3098pS96jgHpIF8EQ5v1gN0bsmEQ5utWh9zNfI8edPjEvGW8zUJIrGra/emZut9Sl9JQg/bB2iOrWvZIu0lnJlB83P5BeLoC9yiaIqj7azEAZnBDyo/REuR8iK5JRcqsFreG/n5c400PZY2am6g8fcDe+zIbJDJB6Pxu/YrTelFum1AZ5q6qcuwIHoVtNkSNW9GQt6rfMhEFAaFI47apnrZQXrj7c86plU7JJgXPoxjRJk9333AYsuM/XFK0Yd/3huKaMyGzktN3bRRHVTsERw9gIz8cT8odKKYnKIItMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzn4ETWF3DTCm+QrTMpowNkag3vtbfxsdfSr1vC5dqA=;
 b=g8K+hySyCXOATHVF/g2sjd4gnNfzPcDgRI7/rb6zMaBjKQ1sAczeDDE45wceQEzsU5oc7rniHwJHVhY+ZXWHHmil39Qb7IBTvShIjC8dTqVWykpIhBQSddVUkL33yddIX1E0eiR7kC4Yp+Uhq+a574TfNJM3MPC4Vw1b0Va0EZuPG7h3i1RIfDJPw5V8wJTayePpPr9AEGxmAaHU7AwwVALXAUht/m4lQATEevkOGlZtG1VHaIZhyy4Nj7gZO2FTTjRoOshXyRLE/SrIvf//9i0pCNKWfY614x+0P+xSZW0VcVoUrejxTqUrJ6gcEt/ddRvq7YmhwxtimerZEHIszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by DS4PR03MB8471.namprd03.prod.outlook.com (2603:10b6:8:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 06:58:46 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:58:46 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Topic: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Thread-Index: AQHdHkHk/3XB76thsE6nF0Lg9EJuILaCV3qAgAAFY1CAAA53AIAABuQw
Date: Tue, 28 Jul 2026 06:58:45 +0000
Message-ID:
 <PH0PR03MB63510057D496CBE8EBFAE246F1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
 <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
 <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <9559d319-4b44-45c2-ae13-f92099de4c89@roeck-us.net>
In-Reply-To: <9559d319-4b44-45c2-ae13-f92099de4c89@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|DS4PR03MB8471:EE_
x-ms-office365-filtering-correlation-id: a4095280-814a-491c-32d9-08deec75ab2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 ahIkXhEpX598Bq/63dGNf8h7aTccb4JTMbPpcX8w2DeCA6NFvmDH92Wt4+rd22n3kAIMrPFs3CF5OAHFRwogsJSFzWGjHFJbMf8KWVno/Wfp7vP2n9uSVGN8yi+/jKQN1gycaZ3bxkrlSsYeRQHnMMoDbaxIyHMKwW0dPLAuvsGM9Ncc9L3Q40jhWOtXt8tA1KGQPUQuPll9WZ6Q6LL5GKbs0ehaKBI+CoaPEet34AmJZhNTG51Wzl7jwb9tbZmU7Op5lgPzKaHjSuku3JQk5CfVOEvuzbx304gwhkUR/R0BuyViFcrPeYPhRX4mkhCY3YQ1sIkcrh/Lv4KkqBc9Pbvy8CDL6gLQjb12e02NmUm9MdPVWBZBDMVfeXP2EahphnMx7FxBu4DvRs5dCBTGxN1So9VEniO76dEkV25WTG5dcR1c1o0d781xsU21xN5yWhpzXISGc0hNrriAUrp0QUGu1H4FT857OCGUqW1cMIZxBi85jiWD0Tnz+MaL178AHSo312iWK2YUUEbtMowTr5ATqJi+qSO/BBgZXa1aFGTC/OO2kkKVM9r4ZQfniA+YFhf/opg2UKDXV3Fcegy4sysUatwLbwm2JqzGG8jTQLEE9zI1e93/V24nfoJOCGZUPMe+sIV3IcCop7cAYqf2raSKd4j12klOnqOsysITlp07NzKJ3t2X5/drKbljSLtRv2bDn0cTcBXHFQ/Pj79jCDbzpBEMuKqSwgZ7QHmQlok=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p6gZbfXDPINnPqBqobkf18CjUcFbc4wEyWRQi2gOutmYBTCE4xoaTJEqzqUt?=
 =?us-ascii?Q?+tn+N/hrFMjC3BdrXpUTOdN2m9D+37LN0VYpZCKr3A6mu5JdFCW4ovYCoBNa?=
 =?us-ascii?Q?mVqOyYC2bA8ZuQzfM1i4wobkMQFJYVcBlHGYEwVoOX9AOFTUJmGyuiRiA2ta?=
 =?us-ascii?Q?u0BUHye8hqAD3qJ0PrKtaad32/N3yy517Jj/6hNaQxYpcOmtQGXifZn1F+I8?=
 =?us-ascii?Q?uz13DrBBI8E02GIoZ+aItrjFRWVlHEDw9G8E8XZySAEFxgxJ4kROCCsY/Jj/?=
 =?us-ascii?Q?eog7mSlNmd+pVeabLXxGSIwpdPo45d2yPHyJPG1RD0CWaDfPO4kH69NLALOw?=
 =?us-ascii?Q?dmT/N4zCITbN7QDp4/qwADsJEh2Q47JBI7HPn9uV1jX6ffoyj5FR1hxhGsgE?=
 =?us-ascii?Q?ACzNMBkpbFosmrqqTzUGCP1C7hxUES/59fcGAmDyLTaQhqJZwYD3JkYFnqWd?=
 =?us-ascii?Q?DFNJT072SAOyXOeatO5fmEi2q6dsRgqQ8YwvWU7AGyBefCdfESkGtddHQ0lx?=
 =?us-ascii?Q?gvXjJ342PwrH3AZXHu4b7KCFzEG/qnpOfuzK0BXHMV8GxRfm0C8WmnhFf8Xz?=
 =?us-ascii?Q?aO6F7L7A7XL0HWonTE5r67Z+3P3YkubM/HTunopunvBy0TwcBqpjMbhD0lOr?=
 =?us-ascii?Q?ei8Ko9Hu2ViuXqT0U4AVyc9P507k6sFcETf3T2JEfI36CKaZPir1Otv8eh1c?=
 =?us-ascii?Q?/F0HGL1LCTXIRUauFUJp//TMD7tLwgQ8H9X1nvAK6EVY9gASae+/3zEwg0D+?=
 =?us-ascii?Q?3CTNBrxXiungoe27lflDTHxfH9DCvw+t0M4Q/TDWPbFkdBzxLKMrmDDKLl+v?=
 =?us-ascii?Q?nEKUk45zXOpV/9X5+lIh3vjs48O0/GtA7Pw88ZzULnphtXsA3qHAe3hSy6oz?=
 =?us-ascii?Q?TeW7cQTYUKFBSq4TLlbxeTsBR6fvbcE5VmUPrKZkeb1fBVWRF5tuX2RUSgd8?=
 =?us-ascii?Q?wWdknAHUjbQ9wpF/7gpAnPaDQxpKaDz2iuqZI6cS2ax09KTC0Lwe9SRQv85o?=
 =?us-ascii?Q?5Lk4KgVyLobdztMCavoEqBeBc4JpiNfaATjtuntNWJi5ICBKk0fcTwOCU9Yf?=
 =?us-ascii?Q?n7WMO20i+WEj38eXLKtvZzw5/JGuGPq+gt0uIRyFQwKz3EY0Fjk6mw7ziJ8F?=
 =?us-ascii?Q?XqPotfGquMdXp6mftYsIAxQNRmXr5b3Klm8/D1u9g87Vpi/9oUpgwyRhwOFh?=
 =?us-ascii?Q?mZhmuRk2vsFjLlCnjDzd5gF2Fl4zNqI6YN3sPlpeJCrKmLjEtJbzE3Or2kfx?=
 =?us-ascii?Q?yIN31Gvre3LFWl+nAGnPeMn/poUpvkDKV7NbUYCBrEpK25hkIudh2KsQL0dC?=
 =?us-ascii?Q?NOrWg8MQ5w/9cdrqdVAA/shUPPm3fjJzIWOBeBYVy1Z9rNEMrlFKvxvpfNQm?=
 =?us-ascii?Q?kkFU0wtrsBwLObI7i76hg1Ic1PH+t8aCr9pIw7N2pgcJyA+SLNBiouAxLedZ?=
 =?us-ascii?Q?evU3RsH0MHRxm2unpu9rfIalaqgeSaWzMt2zOgrCPJbE9LGgGShlh+iflTq3?=
 =?us-ascii?Q?8i9Pxd1N6T09bFKF2tsdan7BWZ18jeLA6u5yzHwAuLi2CPPA3/YHgU5D7+xW?=
 =?us-ascii?Q?Nr+PlUg6AwteCMuNxqxe/sDk1WK5wWi5jFIfczJlhpmRkX4js5TnkfNKoAiZ?=
 =?us-ascii?Q?72jZvm865/ab85lZBdR8iD/IARfw4q/k9w10N6uGW31ZcBFUMxPmoPAxrGP5?=
 =?us-ascii?Q?pb07Ez5Tr/gOQIDmEf/Q16YshEydZF8vM1G7vmIOTIPz7sbczwtvxdxWdSdp?=
 =?us-ascii?Q?rB62CbB8o+Nj7wi3IbfZu5qWrbHozEU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mNWMCb3dDQX+zIood+oqjtBU82U8+UDHDkkOf0IX7euo/5PjlsY6SW9S7xdBY8nDntu4JZBbISFW2amLjLAbXSKjQ0bI6Tydwl5uMaT33hrEbGBWcPrYOpr4q1aE1L83I9GXGSKc3C9XO3egCMiXdG6YhFXXklrjY4Vnz9PJAcnrNLoJs5QaQPYDYK1n/OwtTTiTUkDHoEvzKoaqdRv/ojfeiaXfRYaaEoXo7QnsJWsXqa3oNoOvPQnjzGTlAY/GFBl5vOPqmalqnEtYpsZNXInSRlVfzgItb8sd+6HA9dKjuc89Opl56LqdmBOVSXZ+aMEtJNNKe9H5dCA1C72u4A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4095280-814a-491c-32d9-08deec75ab2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 06:58:46.0009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /U4GeqNRteTq9rH3cJGoN0gK5mqTjZDVnEsDzIhQfY0lRFHHZ5XGcfDxbBeDjgKxbhNQKkqRRrZspqsYnmHvJqwHqfc1z1+cgEC6fmWDuBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8471
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX5bIYL929Ht0G
 Z2jM8+zKM20rmfZMyffzr7+0p8wdj83GRfskIDWNpWNyD95YYGB3YpvlrjIlD+ZNOotYHlytu5p
 v7ZNgNthYlvjLmISnhw1R4IH8g9vMVhy9ShjUgbyWrqC8OupsYEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX5A6k0h0ZZ4Uc
 w4H5hEcW09ZlJrNfAfVstPS7ZJkixKgIAiqeT5932goZmoedg9yzcNF0Di2cQweUZl8il5biFW/
 D/1X2ZYBczKv6UTLuUQOq6/GvpHQjkjLQK/SkaINDKzOfUqDF+nZZTkHv0IuWTaRdjY65U3k0Du
 L7YDNmfFsIE+UUsOVPDSoUVv/fOCGYrA7T6103CSp+JhdBk9RIIaLk3TYMuQJn0LpaOcPheqj95
 BCBBxexFNVUyB3c0y17aEVulguy5QhU77jZlyGcX///Sr19GnsnUA2bVm6qQb1SOZL0LedTmgq6
 DmUGCGik2Wnj/F5aCLLkpeQXr27n/zpFJSo6NWrhVDbloxMzCRgPdU43cqCzvdUT91KMGjohy7F
 dFO7PR3gnpm/6gFAsIWEAHYxAG69Ah9BNDiiT07Yds+Y1NYsH6OCvbhYBVUVFsRRvHKtrlH7s7f
 sSfYqg6xAAAXgUA/rDA==
X-Proofpoint-ORIG-GUID: z-NZTgdqaKX-CvwKmgIVuqd3TNKU0W9-
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a685328 cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=yRhnxOh0HhkFvnTlQv4A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: z-NZTgdqaKX-CvwKmgIVuqd3TNKU0W9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060

>=20
> >>
> >> Are those chips still not published ? I find MAX20840T, but no "C" var=
iants.
> >> And MAX20840T presumably has an I2C device ID of "MAX20840", not
> >> "MAX20840C".
> >>
> >> I also noticed that MAX20810 and MAX20815 seem to be register
> compatible.
> >>
> >
> > I believe so yes, they aren't yet.
> >
>=20
> I just hope they are really compatible, and that the device ID strings re=
ally
> include the "C". The "T" variants seem to have no T in the device ID stri=
ng,
> making it a bit odd that it was (or will be) added for the C variants.
>=20

Yeah the T is weird, but I did test the C variants and they do reply the 'c=
' char.

> > Actually MAX20810/815 and a few more are next in line after this. A
> > different person is handling it, but they're waiting on how this patche=
s go.
> >
>=20
> You are making yourself more work than necessary. Knowing that there are
> more chips coming, the sequence of strcmp() is not really that desirable
> anymore.
> It might make sense to create an array with all chips supported by the dr=
iver
> instead of adding up strcmp sequences. That would make it much easier to =
add
> support for new variants.
>=20
> There also seems to be a MAX20830T. Does it actually make sense to list t=
he
> variants (C/T) in the first place ?
>=20

Will think about how to make to scale the code when adding newer variants.

I may not know enough how important variants are when supporting them, the
C variant seems to be a package difference and the ID string.

> >>> Signed-off-by: Alexis Czezar Torreno
> >>> <alexisczezar.torreno@analog.com>
> >>> ---
> >>>    Documentation/hwmon/max20830.rst | 27 ++++++++++++++++++++++----
> -
> >>>    drivers/hwmon/pmbus/max20830.c   | 27 ++++++++++++++-------------
> >>>    2 files changed, 36 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/Documentation/hwmon/max20830.rst
> >>> b/Documentation/hwmon/max20830.rst
> >>> index
> >>>
> >>
> 936e409dcc5c0898dde27d782308d4a7e1357e73..b850f3b6e40d1f1d0cec944be
> >> 40a
> >>> f02265aced59 100644
> >>> --- a/Documentation/hwmon/max20830.rst
> >>> +++ b/Documentation/hwmon/max20830.rst
> >>> @@ -13,6 +13,22 @@ Supported chips:
> >>>
> >>>        Datasheet:
> >>> https://www.analog.com/media/en/technical-documentation/data-sheets/
> >>> ma
> >>> x20830.pdf
> >>>
> >>> +  * Analog Devices MAX20830C
> >>> +
> >>> +    Prefix: 'max20830c'
> >>> +
> >>> +    Addresses scanned: -
> >>> +
> >>> +    Datasheet:
> >>> +
> >>> +  * Analog Devices MAX20840C
> >>> +
> >>> +    Prefix: 'max20840c'
> >>> +
> >>> +    Addresses scanned: -
> >>> +
> >>> +    Datasheet:
> >>> +
> >>>    Author:
> >>>
> >>>      - Alexis Czezar Torreno <alexisczezar.torreno@analog.com> @@
> >>> -21,12 +37,13 @@ Author:
> >>>    Description
> >>>    -----------
> >>>
> >>> -This driver supports hardware monitoring for Analog Devices
> >>> MAX20830 -Step-Down Switching Regulator with PMBus Interface.
> >>> +This driver supports hardware monitoring for Analog Devices
> >>> +MAX20830, MAX20830C and MAX20840C. These are Step-Down Switching
> >>> +Regulator
> >> with PMBus Interface.
> >>>
> >>> -The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC
> >>> switching -regulator. Through the PMBus interface, the device can
> >>> monitor input/output -voltages, output current and temperature.
> >>> +MAX20830, and MAX20830C are 2.7V to 16V, 30A fully integrated
> >>> +step-down DC-DC switching regulators. MAX20840C is similar but can
> >>> +reach 40A. Through the PMBus interface, these devices can monitor
> >>> +input/output voltages, output current and temperature.
> >>>
> >>>    The driver is a client driver to the core PMBus driver. Please see
> >>>    Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> >>> diff --git a/drivers/hwmon/pmbus/max20830.c
> >>> b/drivers/hwmon/pmbus/max20830.c index
> >>>
> >>
> 7c1e94c43ac4e5d1b4f69dc77b02e424a674e908..029733a377123ae6a861841d
> >> b4a4
> >>> 0dd540f1149e 100644
> >>> --- a/drivers/hwmon/pmbus/max20830.c
> >>> +++ b/drivers/hwmon/pmbus/max20830.c
> >>> @@ -99,13 +99,12 @@ static int max20830_probe(struct i2c_client
> *client)
> >>>    	 * which do not support SMBus block reads.
> >>>    	 */
> >>>    	if (i2c_check_functionality(client->adapter,
> >> I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
> >>> -		/* Reads 9 Data bytes from MAX20830 */
> >>>    		ret =3D i2c_smbus_read_block_data(client,
> >> PMBUS_IC_DEVICE_ID, buf);
> >>>    		if (ret < 0)
> >>>    			return dev_err_probe(&client->dev, ret,
> >>>    					     "Failed to read IC_DEVICE_ID\n");
> >>>    	} else {
> >>> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> >>> +		/* Reads 1 length byte + data bytes */
> >>>    		ret =3D i2c_smbus_read_i2c_block_data(client,
> >> PMBUS_IC_DEVICE_ID,
> >>>
> >> MAX20830_IC_DEVICE_ID_LENGTH + 1,
> >>>    						    buf);
> >>> @@ -121,26 +120,28 @@ static int max20830_probe(struct i2c_client
> >> *client)
> >>>    		ret =3D ret - 1;
> >>>    	}
> >>>
> >>> -	/*
> >>> -	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
> >>> -	 * Return value should at least be 9 bytes of data.
> >>> -	 */
> >>> +	/* Verify we read the expected number of bytes */
> >>>    	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
> >>>    		return dev_err_probe(&client->dev, -ENODEV,
> >>> -				     "IC_DEVICE_ID too short: expected at least
> >> 9 bytes, got %d\n",
> >>> -				     ret);
> >>> +				     "IC_DEVICE_ID too short: expected %d
> >> bytes, got %d\n",
> >>> +				     MAX20830_IC_DEVICE_ID_LENGTH, ret);
> >>> +
> >>> +	/* Null-terminate the string */
> >>> +	buf[ret] =3D '\0';
> >>>
> >>> -	/* 9 bytes of data, buf[0]-buf[7] =3D "MAX20830", buf[8] =3D '\0' *=
/
> >>> -	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] =3D '\0';
> >>> -	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
> >>> +	/* Verify the device ID matches what we expect */
> >>> +	if ((strcmp(buf, "MAX20830") && strcmp(buf, "MAX20830C") &&
> >>> +	    strcmp(buf, "MAX20840C")))
> >>>    		return dev_err_probe(&client->dev, -ENODEV,
> >>> -				     "Unsupported device: '%s'\n", buf);
> >>> +				     "Unsupported device: '%*pE'\n", ret, buf);
> >>>
> >>>    	return pmbus_do_probe(client, &data->info);
> >>>    }
> >>>
> >>>    static const struct i2c_device_id max20830_id[] =3D {
> >>> -	{"max20830"},
> >>> +	{ "max20830" },
> >>> +	{ "max20830c" },
> >>> +	{ "max20840c" },
> >>
> >> I don't think that is needed or warranted, given that there is no
> >> matching devicetree node.
> >>
> >
> > I see, will remove.
>=20
> Same for the prefix string in the documentation. You might want to mentio=
n the
> supported chips, though, in both the configuration and Kconfig. In Kconfi=
g, that
> could be a generic such as "MAX20830 and compatible chips", or list the b=
ase
> variants, such as "MAX20830, MAX20840 and variants".
>=20

Ok will double check this.
