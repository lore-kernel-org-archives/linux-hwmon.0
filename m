Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E684E2222AA;
	Tue, 30 Jun 2026 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806841; cv=fail; b=Uz/eXk92fPEu+exXBxIRHngfF5SILBqiYXnRy18SUaFtBxKsRVEBM2L3+cJrO+S7+bhPpfu23l2Mep1uDYs6/MH07VbcZHiKvOCT8jE4qQv6nREPG1KZSA77+SJHv5PrBiEBkOP6lhbA1A3ggbAkhWrI33x0AfhljQisp0hEm4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806841; c=relaxed/simple;
	bh=4qSNp9umrf+Cos8cNOc+2/rpOLPcRfpHfOy/nrTlbFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RS/FNCQPxwD/EY0ryguPeVyI2jidMsj/p1P8+weQd1x6xjzp1mckjcf29X9Ml8qs50rci/Peavjr1pW9MHR8+lbjRqnOuSNV2U5UWmcnQoQwKQI6RvxpN5uyTe8ch90D3SGLSfi40cGZQt6pNHY+z+Ux7tQv1qZ2TbIbdtIUkqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=szjTYgUE; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="szjTYgUE"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5gSpT4162621;
	Tue, 30 Jun 2026 04:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=3SXZa
	1ytJhUHT1M7XYtSMODdF0WTdpE1LKswWrgLe2c=; b=szjTYgUEvMUt03Ssr2QMo
	76szvJKdnl+EYY2OFGbZxlM5QTZcLExZYw2VRuf5sUK1K92Nep0ASX+o5UuLZyDT
	aEXRdjzJtkrpewMcITgDPssqPQjBnCWPXOfBO9anYyzsQiKAts5mqBEqx3Mi1F+3
	xhZyVSCQRSgi+bGoRPyNsKIXaeeV5FagSo1ejwnf82u1ZHiVMBMJnLsM5odv780X
	Up7f/QtNZoM9KB1+KwWQnxVbYF7Se6zKe273Df3I8JTTQa1/7n88Vw6SAuGsgxGy
	L2l9y6auDY2juIXRO5/ga6zFdCbKDeL6WpmSRiRlD1gOekU9rwV0GHUMvEuJAxCX
	w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f4604sb8a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 04:07:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSN+qETkAe7R77cTg/uPeQA0EXXfuIY8doZmHVss/sST7QvjcsAAQeQqIBVKp8kYztRBgRVQqTfXfYIgM1eO1WPjXrEBPTdfoI1D/o7Ow7znrdCy+LtfG2SXCLBF0geTOailaeg3UPti/figUXkfWC8G4bYfJ516NjKliXX1qVhnRtl+Bh6pGErwHnUDg2memfnDT8DtocaXgpR2hStDx8cXYTvJDKVr6QJKJ/AWx1u5Zkqmq5/+FtE6EJE90oAHXSgDN/2kptSHb9DorMCHA8mSYfXUVWl4KmiUBxJ2Zrb0xEkgaqunBqivvyqvgfKdXv1jfiokYy0bbUPr4w5/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SXZa1ytJhUHT1M7XYtSMODdF0WTdpE1LKswWrgLe2c=;
 b=M+3oaaR/nWsf7sR7jyP7XcVafp88yxtNjq+Wobp+fdMurgDUAcYtd5tj4E0mg0YC57LDLIbW44nYcL4E3qWbB8VP4nqeTIJoRAxGFu1t/ZjAHbfN+9SJD65QAWC1L3jxEeTdNgNYKQhh4jOh7upEikBOa9wn2x6XxszGDzsm7zts3j3CyVdouhYWTkloHJ6vMmlwPEoCcJp+FhPNNb9Py5NrbN6OE4zIhaxVnnve6G7Jd+zHWwSWzLyVVwtNqI5ELZfOhVHavEQX8e5RmB1KFwrGl+pe2xsY0ROQc8T08WFH9TJzXKPP/O6UKnlUlxslP1qucwesjuQlvLkL1OitWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7214.namprd03.prod.outlook.com (2603:10b6:a03:530::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:07:02 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:07:02 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Topic: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Index: AQHdCDrPjQujEK8MeUujhrP1WqLJTLZWdMEAgABEj/A=
Date: Tue, 30 Jun 2026 08:07:02 +0000
Message-ID:
 <PH0PR03MB63514C57CA17984F0B6FEEC8F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
 <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
In-Reply-To: <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7214:EE_
x-ms-office365-filtering-correlation-id: 996268e8-d28d-4390-839b-08ded67e915d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|22082099003|4143699003|11063799006|18002099003|56012099006;
x-microsoft-antispam-message-info:
 2msSqgBV0qQAyYJZU7qgBayAjeFgZRXdsigb8WwTL36i/ndUlOg8HSP9OFboffXzGZzTlzMlEL+8ozW3ysV0OiWZfB5DwmxnLK6RnCjYfjxA3m8c6GbXlj0+XrooB6cRUiDjDXSrvfl3YQ7WZLehIVtvJnwlsRspVYGZqLz0ZC1XcjPnsAdQYK5aveb1WNvFavhjYaofxkXaLFCQO6LGTdAJ2D/PuAOvBjCplxGEz0D5XP+bVMaKQI5emTzFhKrUP7VaHj7DxMjwacgdR8DJ0QOiglijm4Y960ndfM4aQgPzOjkESis6hGtsfbbjZ7gnfRpRK2dF7ZJdNVxkCF3nBq3A5i+SV7sc3sJpKmuEnWMKNEx+lOQqAhwb9BYtI9OtcF+KdKZ8KQ0VewaWuwOF1bOGhKsmmzKdHmQn3CVUbYnE8lcbjjCetAa7LgxiorXq8xBIw8hyLOIh/yyGZd7LLlS9xI9QwQyulzNKhdagwF2OunRP6ylaikVevXja7nT4oRsjWtjlo6/EynEu/6i1V4/E1g/ei8q86HKS6oDIWtRHiz5WhY6SpuM23BRMgkiLaNoSZlzfaBiTCV2gYABjaRe23te+9soM3jAQt1wSSZ+zHyH+0rGjruZW9KubbyHRlzdeKtsh/pP5PcGV41ZkilDnmyu6ABl+zKzoen6io0rhZYk+jmUCgojUjcAerLso+I5PCzSwrcUHIPjYbFvHJomwAmUL0TBBGMGB/hY9f8g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KD+wksj03XRqXIXey8/hP2KcW8AQWVM9U5ZMHLI3XwyK1xR0egYE47lQrGtK?=
 =?us-ascii?Q?4TR5vTaAqZss145EnqmgqvQg0eReINRtECzbV+G4t9yMdJsMKWxuvbxxeOiS?=
 =?us-ascii?Q?u8vzWNBXPqYhU/tewUUznmwJgiIkvadICfsjUkQVufK+AFQM7bWRB81E9jiE?=
 =?us-ascii?Q?er+hEaMJa1GpCJpEhwLg+NUcGn41xGtvQEdM+2EVOzAo9H8f/Ai+hJJ4UGny?=
 =?us-ascii?Q?KPuearsPIudnu5QOfiS/SuEEWgRQJNbhr1R4b1KxgOXZJ26detNyiWBGEVAy?=
 =?us-ascii?Q?UTHKzBM5n/bff+dIy2oYagTUIyEWN6Iw7/5w1EBgItrNTl/4LNkUAIhTvxlq?=
 =?us-ascii?Q?1l4N34cPUg5yTXXQsqBlK7qbC6lxRcvT5X46aOU4Y4+dssEtr4P8knUNEgOi?=
 =?us-ascii?Q?uaxeMA3fdeErBsu+A6P59qgRKO1jRy1ISSgPYVyGIcpp2Ll6zko+Fpcz9ov1?=
 =?us-ascii?Q?ZS9NJj8dd39egjihUHoIEtRHVnVH70D+r6t3mTZ7TyluYmRyeAZVLk6q0SBH?=
 =?us-ascii?Q?x0BMWrZVJnHyXYXjO1CRcnCJj6OFkRM26B56mgxGofAw8R0nKIRqlzYBp/L6?=
 =?us-ascii?Q?n3g0vyopr59ieXu6xkd/tMVNEQUWCiTO3cXamgLqLq/XFamCK9Q0HKIIh86F?=
 =?us-ascii?Q?iWPF1MnbQ21cy0k99zJbbQ9PByJwTBiUyCB8YLSiANpyj5IcJBhTokF5y7xB?=
 =?us-ascii?Q?vwf9jACHwnNLeTVEIs5PVr/xuaUogtZ4J6bFAVt77RWD087OWtBFrVvUdxuo?=
 =?us-ascii?Q?kVGiskg2vB2by1s49gSUes+/ud+v3aikM3X9qm/fIClecNVMQhZCBc4fGv5k?=
 =?us-ascii?Q?rQMD4chuuhudZyouuCU9BKDYAK3qY1lTLDGuM31KAPe6Et8JCU5Aal+bB8rj?=
 =?us-ascii?Q?814vSUnUJnJLrQF4EoCUZy4w3crlqQ8WqfZtkjBw6LtXjQVf4bpoqfxFCaZG?=
 =?us-ascii?Q?nhnUBymq+80sVrrlKlUcB0I3cHKP7KgZQuM9ute7hyap+g4E49/PsCP7GKeI?=
 =?us-ascii?Q?CGUlS24RQpjBng81trxyPhzRFmgKZTpTx86s9J+mNwP5oAXtsrQRJW2i7GpW?=
 =?us-ascii?Q?RwBZlMg8j2RCuQQNArRYicwqIfGHkDGJ2kzyMOKRmims1oklpzS9ug5ExrGJ?=
 =?us-ascii?Q?7NApjtkvEzfGRuipIMzrWAQfgYy3IHzQnECcv9fmcjVyqYTMCaeyjJpqDkjX?=
 =?us-ascii?Q?NlQ0x07j2MTM4gAwkpJIE/DrcWyOBkN68dNLEycokJAznWHkN5XHy7ci3fiN?=
 =?us-ascii?Q?uWyvzM9K2ovUd4NPIE8UwxpJjDu6ICXIIUxEQRq650FbDIp7DWHy4OXctVWm?=
 =?us-ascii?Q?mQ9DkjfnjeI3V1rvScf0x6LqJEO7igJqvxxQiRzXN3Rw/g8xReGIxADaCTC3?=
 =?us-ascii?Q?DtME4HZ9Xz8pPIBe6DzZjTxl9mk9zZ1Qam/JXX143wclj8gc4p6RiEGnUkjJ?=
 =?us-ascii?Q?X/hFPpv+Kxh4aBaXK6YQg7PLbOlaS9DW8sSrcOP6VfhgQDeafXOeKJJRVLmH?=
 =?us-ascii?Q?sHlHdyCv/hoatbxZVi1ltkVXqMLQ8NOdSY/N1j/+KT0sjuosyNrUpx/naLu/?=
 =?us-ascii?Q?rVo4wjaCy7qovSyFwE65ILsOXhv5IPGRfrtKl7Kxn5NDmJRBpP4VGXZdgR23?=
 =?us-ascii?Q?aQtAgXP2vdStndjGmw7nTzYfgKSoPXl6qz2YjOhdGitJhmDg6fBq7P+4kKsw?=
 =?us-ascii?Q?CG0dP9qP0emcm62zFYU144qjXlteJfjC3FWTK2YSsG2S65GwFTF6W8PyJyVY?=
 =?us-ascii?Q?Pscr3XMggy/2/e3IEVRTgrjrf/V2XK4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	O3MKlSxeu1iu7SGL8aIhROjebP+oytQj3r6m/Eamib8hAqT1mHXtA8pL76zD3OwK8Qvbd2oKIVIdY9lpwrL1Lr4UixAZpk/XeB/EEgHDuP2urD2XvVVbzWXJaxJ5BVxhxkO2h5lYJSIzvqVQutUGHRaXbnHdd4wnrqWS5ItzbesOQ6CmpNjjKJEBBzkxTBHpxvTiGb83Mw5zeAAF1ZcQA2R7FDFlILLtl4VVg7oDfyEtommrV+hNjNPOpF8ZSP3BSkxz3LOG8ba82UI8r5vOTBf2JSnO5TboSdi1WOqcf7fj7DYch9P0ub1q/OBO6w2f4peBpYwENXYUTdAoZ4H0zQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996268e8-d28d-4390-839b-08ded67e915d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:07:02.5839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQ7SXUHl6HyqherLbyIznlsa1tmUB9G0cSMM/FUOf08Az57oB3xcBJNZRZb4tf4EVqYpZ+vskmhWdQ4QkH168VGnrCGpJSH+FqbNu5T8zu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7214
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX3Yvv3vkHqY+9
 OiJDClYxFrXrHKhaODXnvclnUqbpLOfyMycraLxEeuAbnTTmyKjU890yyJsvN/Pujpc/wpMZ45a
 JGouWvdyAwhSIasmMG3Itfbbk0kTXF63gjEyByePqsZG0f5ZKvKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3MCBTYWx0ZWRfX+svQB5SxYU+G
 5IIlF9nAceqfWyVz7kYc7BcDgSeJ26hyOiBuCseIFi3CqrcSCmZPZDWqrnKavjlE1C2YhQmoypx
 5vJj9apmFrxd82Exvw7Us39R/nZCput4rycOJ8ZrYgDYWQdsn8j+4Rsof/B5/bjX8iDg4M2412j
 6y+opMRDMR5njrBa8/27FS3VH+XCJCdM9QEPTMffCyO1rahq1dvlWqoWy28eYG0Mg2QgqP4zjNx
 PKNQsnOrjq3MBl361/j9r5Zj9+UOVHbTUXIs4ZKQ1KPhwiFJ/tZQSnbSCDDTZyZnjcL4FwZqm3p
 YhN64S9rqH9D3129K5K1cKx6sFpU+CiixZ1pEZdhYKfAOAG6uvAzcScCno37Z7+mEKDOECCulnp
 p9J/9Q5bYodFRS/6IpiFiowXpbEq/ialuDZPOXhBIrOpIWBjQOJE4v6BEw/Qaz/gNNUJLSIjmuh
 lSKeOnlez3ULTfBxn4A==
X-Authority-Analysis: v=2.4 cv=BMCDalQG c=1 sm=1 tr=0 ts=6a437929 cx=c_pps
 a=huIvVN+S9WGU6koxVvae6w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=P2IJGS_-wxdQfiGR8TUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: yperXxrm6R-wxACOyyPeEZPX2xE-2YWh
X-Proofpoint-GUID: yperXxrm6R-wxACOyyPeEZPX2xE-2YWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300070


> >
> >   static const struct of_device_id max20830_of_match[] =3D {
> > -	{ .compatible =3D "adi,max20830" },
> > +	{ .compatible =3D "adi,max20830", .data =3D &max20830_chip },
> > +	{ .compatible =3D "adi,max20830c", .data =3D &max20830c_chip },
> > +	{ .compatible =3D "adi,max20840c", .data =3D &max20840c_chip },
>=20
> "adi,max20830" is a fallback for the other two chips, but that is not how=
 the
> code is implemented.
>=20

I may be inclined to just not use fallback as it seems to be more complicat=
ed
and a bit unnecessary. There's also other devices that may be added on top
of this so it lessens the complexity. Will edit the bindings regarding this=
.

Regards,
Alexis
