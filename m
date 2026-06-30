Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6D304BB2;
	Tue, 30 Jun 2026 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806850; cv=fail; b=Yj56mjVE+/1CpldpBDH7qMM+HSiUdTqtuUklYJytyDOvaYKTVvZMNnkDvRdpksMH4fbsThUyS+YGhYjZ3OxlBEy1s2tkVtYWQGUpP2q1YNP/QnDsy0v1U0JafUYih6dP+hL5r3M5wQqTaYl/KWzHA284XN1d2IJKCr99LWCd3DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806850; c=relaxed/simple;
	bh=Glsok6QyIORLf+92SpD4X7iwe2s8OpLlmlEdc47XATw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AlXXyqlO+qJNs3H1ebb5v8rRKcMw1AClh5GzuR1B+hhJYiJXgnln812FCiM7ALqDci4MAFgjBrsuFiedDR+kUhehxPIQaKWuU+ZCke73Jn9v/zHmEZz0/B7malxKcKbMcj8mey+8WC3oUMIjMAH4pZ+jtUEiF9q/ugqXsSnz0Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AqGgIeW8; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AqGgIeW8"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6JsM6077837;
	Tue, 30 Jun 2026 04:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Glsok
	6QyIORLf+92SpD4X7iwe2s8OpLlmlEdc47XATw=; b=AqGgIeW8OBD24RZYTyHk+
	ZW+ie5Ub13W4ju8jCwyws/QLXcDTlo4WPHVbL9Wi5f293x7luRGQC4Sy5kXoMKo6
	cYAQNWHC2Z5lmiyjxrsXhEqo6Bg1N1lVdolhMmxo674VH4LUpsVHhqhAoE+pyotS
	dkcs2vhlZplvSIHC8DEL8gMPb4/SMDKV5cQP8v5575lIhp4aRSIKQ5ESgJdXpf7y
	GTRpbj63qsX28GXDa8thPovCFmf93BTdnKP4Kddn3PodYhdpfckxApDvV/2f0ITx
	u3fXB+KPgGuiIP8k9WiZmKB3B9WPVEnRx+64KssKVQJndGt9dvfF/K1Z6alXI6Ki
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f48eh8mpm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 04:07:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRnGov5BbBb1s94gfsNdL70GorQJ5tt5XaFz+Q00ATqVl3HtSnwZLOs9CuVnLF4kirVxf2qYu2mRNXfLxBNyG65ajhNnWvzZlExQC9yYFCrvM7U5hFh9YNehW03l6qFH+Rty4eStQvJ/SUD71PHlBkcLFSBdOPlNP7sKyNiJaQCfotsKxB3zoEnbgtHlHc41kAfgH+JSYG4Lsa6EKk+F9MBM0RM/hfGaErues0ROW1mSfaLMQKXe8oqXaAakB4Jdhp9gdpOTo/7zT1n5eD9ttE7R8PIxcDtqYj0v+ET3XLH5EGk5QLYC8VlteTFs9mdLKWbhtqhaA7YP30uxzgrubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Glsok6QyIORLf+92SpD4X7iwe2s8OpLlmlEdc47XATw=;
 b=vgvjcwbNueDkh7CxLyIdwKrZRUwggLlSOw++zd4WwCrQfFQagUXjst6J2hTQ9sDT+/WtoL+l3YPHUnULl8gvOsd8WWqOpDjUMWGerzJXIQ+9dLl5FvfCZdfp/fiZmvtkEojGavT5APuQy/jw4X+g3P5dQ9CLTxcGMh2ncdlAb04HqRGTF4PdEgfsXG9ZAd5BPmEoD0brTu66yoXQF+I1vZwnOGkj07aSHkE2nycKg8rttNcp7SJ168amPFgHbzAzVyGgVhNuKNjWP4UXBvvnQr6xeDo+jqO3BROIq/XgGKcDNWUcsaVACla4oV5dh2QPZqR2M1tCY6YB7jGQp8mPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7214.namprd03.prod.outlook.com (2603:10b6:a03:530::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:07:13 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:07:13 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Thread-Topic: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
Thread-Index: AQHdCDrVZiwchKg3IUms2bCkbJ1VqLZWiGmAgAAvexA=
Date: Tue, 30 Jun 2026 08:07:13 +0000
Message-ID:
 <PH0PR03MB6351C114AA65A11F2E133B8EF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
 <d306dab2-efcb-4626-b480-c4e8779cdeed@roeck-us.net>
In-Reply-To: <d306dab2-efcb-4626-b480-c4e8779cdeed@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7214:EE_
x-ms-office365-filtering-correlation-id: 189baa3b-0a98-4ae8-69bc-08ded67e97e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|22082099003|4143699003|11063799006|18002099003|3023799007|56012099006;
x-microsoft-antispam-message-info:
 +TEbgA7X1nlEH3GJ3qJ65si6EFzcIpxtgy3L7+JLgGWBMT4nnoZz/DxD0H+OYmbHvM2o8UTJDr80Ri5/SPU/JWlforKgZ1pbtk/5yp4Vmo6GqLOB/Wj9Yx2pHrGCrXgh/oV8JiQlaviUX2xS34BmEX0RP/qqEAQFGWvIqen3Ua74Zsqi5R3QtbyfV1Nprgu0xDtmTrMsqNHFVs+QjpevpFmNus4HJvSMkWZ6Yf4XunaFWCEQCmny00C0JA5EZsDFcg1ausFnH73CalQP99bC1FNDWe+HhGuEWJIidEUL5eq/CxcnsRyyvB6TQFwK5dNz/XE6mVuGaR50glro2RZaHlhRlvhmD/p0UospvbX7xAGF0xSBPBZRYYtH/c+P4qlnBMS+LmPspFobGwWC6Gi54OKd6CYYMQ2PgzlAj7Ctvud2lf367oAgCt4Te+YHQT+pqne+v+hlkdqjpGw8a6bJjLIPYsDna7KOJnrQ66t11gQpEmansAA/xFtJxeFLmQPVV6AY2KCHh4AMsQlFQZw/XmpXcC2EXwfwS/9KqNhn7ZSTDoa7fIVJHSK03hllqZO68Zw4filhcnSxBjG5BAUvVYl+U5L6fUJnCFiUj0gR0UT3/kkiRBw3RmIgyqVPVNZbcHVyE0AG2u7X5kHc73IdhQThtfOUlqMK57tPwHZweOkfZjhDqu3i7kLiuGbRYKcTTJWf4xZRWjFcGAoCNLmeKPsIoOENYCQFjf8avYFXP7M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(22082099003)(4143699003)(11063799006)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w1FSW9vm2vvOxvL7wRPREaFCE+Hzb0vcEjzx4PKy3On/jHdLvRTPK33hui?=
 =?iso-8859-1?Q?DdOSRcMhAPG9D2FV0cJq7iRWW/FnSmkfZVv2Mr14FajcKwRSIwA1/P+c6y?=
 =?iso-8859-1?Q?pMnm1h+dDwZFeqJ5cu7ryr95od0rsDd+5scIzDLv4mQzVf1UPg6STdcnZO?=
 =?iso-8859-1?Q?Vqs1DWT0zo8i8SB1lXvsbP4KArGSo9DDNTsdEdutb+1+vyjuo5ASeZdtSH?=
 =?iso-8859-1?Q?BZ61d8mpW5aMvxpoRZRXruBYqsXa4Gmuxap5Aif/vOnrk9gNSDWmfzzcdq?=
 =?iso-8859-1?Q?lVD7tcH2Ad9POpp5SJUCb3L5cpXqICNbsQTyYz3O11A7ED02/+EWT2b4sz?=
 =?iso-8859-1?Q?nBEp8oYwAGCYQaOrawXLfPmICQ/x4mxui7WbUV6fQmXCFXt46nlLh8IMbL?=
 =?iso-8859-1?Q?wVF0wSBgMPJ3sMeHuOEVGwwVt/77UjFUi+UCyX6m7djg6Xuyy3EYvqdWsE?=
 =?iso-8859-1?Q?C5cIeXJzN2nVvW/BkJxxANsOUPWn58CCkp3iHwaAOB8mqNIHrdfO5mnYhZ?=
 =?iso-8859-1?Q?+LH74H0np7uD70cmw3R69OtpIns/3GpDrHvpcgHXQesITRFpfXsEO/xNo6?=
 =?iso-8859-1?Q?TnfDudI5mXMciTPfHj+SnuOrPm8ow89sWkQXIgccIYAJ0I88HACdBqDUXf?=
 =?iso-8859-1?Q?kOwZElToly3Mms4RiCTt07de/gCIoDsBiyNQYluuTlHPQM0awCLwWDVK9B?=
 =?iso-8859-1?Q?2UN+iKrCS5SA5yoR8W8U7ddCY0oQkoWoaW91/jf8Wqlbd66NyaNhSWaeXe?=
 =?iso-8859-1?Q?tDQlg0YvD1ot0VpgcL3AMkZSVBCQUWTkbkg7E4J7qLUb7u7CkAoQME7yRL?=
 =?iso-8859-1?Q?jYg/C8S2stSmoacjIbFkFghbDp7GkJoB32sfjoY8jm5wXipVnB/WCIJYCj?=
 =?iso-8859-1?Q?mSyCTvnvg7wXWuKw06DKYi3CkHBkqDk9Ww1ccXe69tBc0Jp6dD8iB6iWUM?=
 =?iso-8859-1?Q?XwK0bBj8M36zTcRJC5HhNRoj2Hop6LWSFGDSJbFbOkGYwDmQxkrjvFAuCg?=
 =?iso-8859-1?Q?r1RlXcoWpAZCAT3VbgXfyg51zW8GQZVyX9yQ6TvoVGvo8BOeaqsubFTBrS?=
 =?iso-8859-1?Q?VHgpakBBaYK/uxyOKMIRONkjBXjS9e14REWAnDlwVLfjAdSzxtQO86UHYU?=
 =?iso-8859-1?Q?NQ2dq391puNbSBM2YA6x1jhTVM3APhcK3howF/1LDn+Ss8+W7jlPZQ9gal?=
 =?iso-8859-1?Q?oQxw4BToGgVNeeOLd4axmWMHBpxliY22t16m547+kLYn7WB1s8/uPDmlTM?=
 =?iso-8859-1?Q?W5pFtuE+U/o/xGWpBL+M3dslyO6ilnIQqT+HxaqtcnnvnFf9+i/dyBB8QZ?=
 =?iso-8859-1?Q?zMpxbcT/5NPIituAcxPZZ/W86994LJ7C++ty4xMEBOfZW8UPZVBl4CQqj6?=
 =?iso-8859-1?Q?sCG0MxGcYizurTdRZyHlNe6gzVukBYmdVDOlEsX2rJ+pWvEUEKBfJCMVVd?=
 =?iso-8859-1?Q?lPRFBfvc0QHcSSK9oLZuRAGpxmh2QVb2XS8fBTQIiKs5M650pboulWlTka?=
 =?iso-8859-1?Q?lNfw6wYREPx0LINBtHXrbwIqwIRmym/ccVCYd9VHXCKAmpQ+oXXfMWMfAL?=
 =?iso-8859-1?Q?7GvHLGqDeqS+MdAi0X8aW33a1bpaa/LRv2M5UjRyU0acqMXS+NURHBrDwD?=
 =?iso-8859-1?Q?8HBNAoyg+wpD5eLuYY3Q2tTMIS8neb2W1APmXo7HJUeORRYlR7N7UOrr5S?=
 =?iso-8859-1?Q?Cl/1ScIDeuNqydWAq8kMKEgLKa2V7G2Zaixxy02Hu91FXsYnCeZCjXn09x?=
 =?iso-8859-1?Q?/ydZXkIviYmo4AiqGH27yM5LYbXe0ewtirmUDwjMCF6Qquo+HqWa1IOoDe?=
 =?iso-8859-1?Q?0XEKc/0TpkGhNELVpc2KQP15qua6CO4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	FyN9S4odQIiYoGPJIv2cfKqjqJbjX2INnp6844adzjE9yzY0HnVl0GR99Rt4XRGAeFDIXAQ41l2CM+t0PPN+12osuNBKuy3FTNMzu00wzLUj44jDbyAGL1KKflbF1gfMTJSFvKPQ7AxdDMgMAgy/Tdv7nWKpdij4t31zQEOeYf23rtKpllDbQVEH65Y/HG25T0lIffGvjmseJW3xD/Ru5mus3nO/vAKsHlu0tSChh9Ggc8kmsvgqxkt1+ajW95KqnLS21GwcoYKiu3IPMizkApKJtagpEeS5tBvKMVIeKwxONmuB76I7OgyrvN/5Qm9ySGiVQpx88bBFgKedKoXx1g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189baa3b-0a98-4ae8-69bc-08ded67e97e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:07:13.5418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YybAS2Su6uB//H4SsNRhiBTCxtHTCl+USJ8AVjUt7ZRZVmr/DTl4SG6Gt7UZTMgDiy8Gq3cIM33T2atu55fFYMbl9BBr3jcCdP3Udw8zt9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7214
X-Proofpoint-ORIG-GUID: PFE2odALHceBYT8PCMXI_-J-7qpQF9_v
X-Authority-Analysis: v=2.4 cv=O/sJeh9W c=1 sm=1 tr=0 ts=6a437933 cx=c_pps
 a=M+4CHf8fKMkYOwSYEMZyZQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=b7x3xL-TFd480C0f3qwA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: PFE2odALHceBYT8PCMXI_-J-7qpQF9_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfXyQMXELsnZFyF
 7WX4xmVgPFB8GjSzetc6DiR3IDhN2hoLNpqugUqYK2mXw0xe/NXCz0hQk+Xg9hTVmpAFj6131Z/
 ti9zQWyit7KQEHg0g2ar1tDG81E2CJoPHQ9uAfqW6wmPRBuAIVkVg9XIJ4nhecIU9cPSV9dQfv0
 KI8Zuro+lZduz/tymJGMzTUbixrMOo7nN8FR0xumE9BDK0vmMGd5GFt8RomZBrKDxyXrQGvncwo
 a/p/SIJmoKN14QpcO2v+ad/rVfOK4YkLwhWnXAwz+JCv9ghezLfTKBtrnOI8O8D/NXVgZB2um4U
 BAbcwT+iJMxeo20Mfq+A69ForZuaUW5XyQb1WitaI/t6KZGJiGXh8AIhkcf85nFB37ERBUE39bR
 2ru26U4hyltBZOyoPDu1rN6Vt0HylyiqGllJzr99Nl2OOP5e9xOzmDDUQngudO/91G6A28174/x
 tzhB/31NmMxnOoIF1Rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX4am9tMXsx+kQ
 vwcTXMb53EnFIU6vwZB7g+AywtKwxg16P4ohYq59MScuIwEwSqmHlt4aI7mWvL3sQjixjZcJlf8
 jFVn3Xu/MdBLO82zRtkSuJbMOD8rQ7uI/H+MWQE9v0zNCmO1mgFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300070


> [External]
>=20
> On 6/29/26 19:46, Alexis Czezar Torreno wrote:
> > Implement support for external voltage divider scaling using the
> > adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
> >
> > When the desired output voltage exceeds VREF, a resistor divider
> > (RFB1 and RFB2) is used to scale down the feedback voltage. The driver
> > reads these resistor values from device tree and applies the scaling
> > formula: VOUT_actual =3D VOUT_measured =D7 (1 + RFB1/RFB2)
> >
> > The properties are optional. If not specified, the driver assumes no
> > voltage divider is present and reports the raw VOUT reading.
> >
>=20
> This will require a detailed explanation why only PMBUS_READ_VOUT would
> require scaling but not any of the other vout related commands.
>=20
> Guenter

Will add it.
For reference, the device only has 3 vout related commands. The other 2
is referred to a feedback/reference voltage rather than a scaled output val=
ue.
Hence only read_vout has scaling.

Regards,
Alexis
