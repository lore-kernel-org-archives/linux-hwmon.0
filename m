Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F705199949;
	Sun, 19 Jul 2026 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784504494; cv=fail; b=utbmM98tU85RH1OxhH1w/zTbR76D6VLqE+9xazLg1RZkaMHIgLriXePE49Agml/+1IblyBhhlrHxYywbbCm+GlyQ6SHf97GSsJDYMHgXmvVGgMw0b/HCuAFqWWbue1gD+bO+5VYR5/lZ0BCnwK0/c1nRx8G7PUlROPZxSwQtMMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784504494; c=relaxed/simple;
	bh=g2VyaucXED4/DnJDLJAS9dqFnHMgLhRHVME0T2IXKu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LvelrSfOKNFtwpwvwuE1CyTUvyzpUVuzSHjTb4+ISlZ/u/JMjRFH7Kot/xDn+hJpf9hiSV2ESeovbci0+k5L6rRQfSDmBBYwd8+s92IX9HU2a6Yh4CqFr7Au11XGReSEsW0blByZpmf7PIPoEVK3B7tuwsr95PB+Xn06Rit6uII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=C+B1DYd5; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="C+B1DYd5"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKS0842974805;
	Sun, 19 Jul 2026 19:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=g2Vya
	ucXED4/DnJDLJAS9dqFnHMgLhRHVME0T2IXKu4=; b=C+B1DYd5ZKRFwqRg3lmfB
	aXtbeChy89QSEykrTYVjq2q+NSyjLregSXMN/zFD3QSEO0jPyicze+APA1LuVEX+
	WaBaO3PiDZzxNqYeeTCISbclF0j/5Ss4svYlVUqDoZ4bo1EBT4yBUhj5XvU6bKRq
	ZlTpgmTU56oz20srjT721YCrro8GzrVOXhjEiMIfzCORh58ZVLmp1dTAseWv30Zd
	Ilq2tzTQpgFRm6iyfZmmmcZvkZNEf0wwB1t/f9/9aaiC/lILc5/oYltKJe63bZRS
	UawDtSx064aK+HRdAmzwd0y1lFJ1SIpEVMA0QtuCQraWU4DKiJPA3dZpEnHFoeb7
	A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fg644bhdv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 19:41:26 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+IGqVGCwV+Yw2rjo0fZ2+xqMdN4nEORUJlxrsgHQDivm3bBsEE7HWoHMcKTrI0Y6SxisF/dkAhCwJFKSCv2xOZFGs+ltfHjYxG5vdwF9akYFgKeRW3XcHgC8v3X4fmJbCKwmU2HSUim8oUJZffiSxWG2UCtu1+GT4Zf/dUsxTS63AKef/lTaZ3dkLLWoZXoPmWDfhSVfJUu5Xe9w1obcK1h3je8bHOJlpdvcV+4es6pLgYkjubOYdNCAzPKvR2Rvqg4vGeNATnGRuaHrxrsHt7UoXHOJjYR7P/yijFN5zXtZNFcIdSulSufHD5JiVpkdPvkHelFqME/cFpj+7AYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2VyaucXED4/DnJDLJAS9dqFnHMgLhRHVME0T2IXKu4=;
 b=lEd9rnUad3otQw5iaFPrqPYI8fJEsXUfiUHWPyMLeWC/FdqDKRxiXeLIC5ANPTJvFUPx6Tq435jQbHF8+S0BbK4z5ByHcKTBLoOdszxOPteXHweUyaXMkzZkyzaEeTjeYCcQPmezR6jtN2jU8XPr49utcTFa5eOFzIoaH9g31mJqGzAF2Kt06Nzz9U+as1hs+vhXHmeBKr4YcWU695ApQEjuQiACQmm1xW7QD7wa+WILPLNB/TX5IiqSjOXlDsBCUhGjVQurLRSfyDZIWpvXSAU5BgsEgDcfsANKIexIGIwq9xTW+lrzg0e+1zjh3DWD58hnekE3qQuXHOXZkX4FXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CO1PR03MB7819.namprd03.prod.outlook.com (2603:10b6:303:276::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Sun, 19 Jul
 2026 23:41:23 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Sun, 19 Jul 2026
 23:41:23 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Thread-Topic: [PATCH 3/3] hwmon: (pmbus/max34440): Add support for MAX34452
Thread-Index: AQHdFP0OWkA6XrdSPkuMcXtWBIjg3LZv0v8AgAWwQbA=
Date: Sun, 19 Jul 2026 23:41:23 +0000
Message-ID:
 <PH0PR03MB6351A4A896BEF4D251CFA3F6F1C42@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-3-a941b27eaecb@analog.com>
 <20260716083834.9DFA01F000E9@smtp.kernel.org>
In-Reply-To: <20260716083834.9DFA01F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CO1PR03MB7819:EE_
x-ms-office365-filtering-correlation-id: 3e2b1972-4c2d-4bc0-926a-08dee5ef3e2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|4133799003|56012099006|11063799006|10067099003|4143699003|6133799003;
x-microsoft-antispam-message-info:
 uwNjjyoFxwAhw3GAGW46TI4kzhN6hTjkgAT2DO9Y8cfYJJZUMRHpIfgnTz2KbNU7gNQ76666kLfdYhxRpQf79TKzaQszr1zlbCbl9nI2wl8VIkTdFY/RKnUY1Uwa1ajzhY0JHj4VMwkObhuhbXn06VuFLPx90HP6Q2K+GfHbUfyYDUGkxiZgIe8bC0ZulzNOziuiPKhyh+2jLNoM/KlspqY5Ytmj52bISu0OQCBwLUW7sqgk/oEk4jixVIi3ERwGkaKMtuGIJqSyCm5Nb0BuodwYko1uj6MdUhO0v+/u2vhhSwgwnQVx02U2Gwz3mg10QfMKNNCkJaoOyfl/shtqiGwyyF14CVWlwsOCQFBJLeoFy/UDMvJ80Fx3fiwX1zCXl9+cC7octNguRASP2qfB6gqmEz4Un+CC5P7lkZKlocHieMU1rYXX6v4enQwvhpLJoMD5cy4sRE/+Mk/1bwldEKd4P5mgV5ZWaGvt+6EWbGfSVmAxoQy2COfobzt3VGwMUJBVjtBsba9J3S14nUwlfBTWaA2Jv/j1KYYTkejgB8os4w6+RFHEVlKSKXGgM+C6XSltOqZKXOHopS3KP+vly8cr5jCW+EXhFmtDiZscIH3dVcFQiaR5AJ/vAuH4PcCsKLyFy87EIdp5WXDjlejWmVX63N0WFib8yEg9ET55MZk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(4133799003)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTU0ajhRRnpsVTFTN1V1cDU1R0FpeTR5dFM4ZDJOUGJ6NS9KR3gwelV6cXpK?=
 =?utf-8?B?bHdhRUVObExjQzN3QzRJNFU4dTZta2JySmRtanV4SGpTQTZZV0gzcG40NVIy?=
 =?utf-8?B?RmJhMk4zRlBjVTZiVEc0dXB5SjVlZVBXazNCMXNXNVhpTEl5am9YanRmbFp6?=
 =?utf-8?B?UGhtUWlFWDRnMXEwZFIvTndDMG1hdWpRNG1NZWxCQ3ZlZTk3eDFoV081UnQz?=
 =?utf-8?B?Y3FLZC9rTDlEdC9qWW5YYzFRL3loT1hlQ25Vbk1SZSs2dFRiMGhQV3VSdEVP?=
 =?utf-8?B?M1FuWERUbnlGYUZwUG1qMmppdEhIbENNa1pEVVB1NGY2UFlzSUJuK3JPN1ZT?=
 =?utf-8?B?UkdiK3RJUTNkdUxOQXhRTFJSUjRXcEdvOENSVWhZcitPOWd3QnNQaHA4UVg3?=
 =?utf-8?B?Ni9UNWU5ZlQ4cGRhOXBvOEdWbFhNWkFDV0ZDY0xtcCt6OFpwOU5ZR2hzUU5X?=
 =?utf-8?B?VnNHR2JSYThjOURYVEN4Ym5Bc0hKQ2hSeG1CaVlZNjNvczZETExLUUxaTFRC?=
 =?utf-8?B?MlJJdlUrbkpBaFRQL2xyWlk4VURISXBYMVc2VlE1blhEY005YzViYllQK3lH?=
 =?utf-8?B?a3hPcmdTRWdhUjUzNXdvV01xSUx1STRKdG9zQVd0bEV1TE9nQis4YTJnY2Zi?=
 =?utf-8?B?VW1lWG9UZUxBWDJoWmwvRFd2ZzNianIrUWVYK1RoSjhMb1BTOWhyM2trbmJI?=
 =?utf-8?B?YnNOa3ltVGZkVk9hUnFpMmZDQmUwN1RkN0dlWW1UdnlzdHgvQXpnMVhzeG5x?=
 =?utf-8?B?WkJxcGtzYW84QzlMYzI5Q0FtMzBMWHRRNnZXeXZBZUtwMHVqQ3RCQk9YZHJP?=
 =?utf-8?B?VExSYy9PSGxnanFBSld5dS9GQ2Nwbkt0dWVza2lvMHgvVEZQeWU3Sm9jY3Vn?=
 =?utf-8?B?d09iMlB4M0U2N0lpWlI4Vi93TXFaQXhDUU9kczg1VUVLV2QzTVlHL21kQXNq?=
 =?utf-8?B?OFhlQ0ZxZENOTzFqYlUvZDZ4VEdyRTBMNkJ1NW4vMnJ5OVh6Qm56eVpWVTJr?=
 =?utf-8?B?dGdRQWFucU1GMTBRUlpVZVZwTHZvV29tdHlEWEtiZE5KVXR5VXRhdkJPY0E4?=
 =?utf-8?B?anRJZDFBNFk1REdDbG9DRGdqZDIramdGU0VQcDRPbXR1SjVKSk9vYjZERzJ6?=
 =?utf-8?B?MFEvZGFSVjFNV0ErRmR1Vi9HWnNhZkhkR2JyK04xVGNpNExrZ3l0am9aSGdL?=
 =?utf-8?B?WWNWTERpcXAxRVZpV2p5N2JRZnFRYjczMVJkUlgvT1dTcTdyV3BQclZNMVMr?=
 =?utf-8?B?VXdoNkp5L1hvazl1M0JESm4zNVQ0VGZPTVhYRG8yQTA1QTl4clQvalFTSlpO?=
 =?utf-8?B?SC9pTGJPNUxDZUF6a3ZVRmUrVktHQ3ZqNHVXdjQ0RzNVYTVRWTJmRUNMVVRT?=
 =?utf-8?B?UEcramYzM2xWbHZSck8vdUVXdExzT0RmVXROYVhqOXNtbjhiWjBxVHRNNC9Y?=
 =?utf-8?B?RmZIdDlzL3NNTmluN2FRWUdsZU52VE55WmRtUUthV2Y4WFRqcDQ4OGJuTXkx?=
 =?utf-8?B?VWJ6UitybGs0alZFcEtDSjlnY1NHTkM5dUFlZ0VEeVpHL1VWb0ViQnpDTjli?=
 =?utf-8?B?MHZtNklURFhBNGpqSFBmQVk3bnJaRnVBWDZpNjFkZlJQR2ZHc3VYb0pqYThs?=
 =?utf-8?B?c1l5RWRSTytxMWdITkxTTmExcUJCNUZNVTUrM2Ewa01PN2piaXMxWkFVbjdX?=
 =?utf-8?B?Z1lUREN0Qk1FV3dtOVBtVzlXVE5zbXg2cW0yOXM4OFlPR0xSNUVTaCs5NE1M?=
 =?utf-8?B?QldjUUE1N2R0UEJuMStxampmbW9qcDdYQm9uVlpaT29hQndxc0lERzVWMHls?=
 =?utf-8?B?RVZIVVpoWTVOMGlyMFJvUkdYUU95NGdQRm1ZNE45S1Npb3UreVo4NGdhZ1Rp?=
 =?utf-8?B?TG9KUnE2cjIrRHBoYVdIQXB4MTg4WEkzTUxvbDllV0xnTEx1aXdWWXRVazJZ?=
 =?utf-8?B?a0duWk1RQnNyRjlFQloyM3gxcVhkS3hhN0NjYkhGenl3d3ExS0JRZjdkWFo4?=
 =?utf-8?B?UmVIL0pzUU9hRlJNY2pRdVJRNVl5SE5tWm1LQVk4cDdlV1hoTVQvTTFlR3hu?=
 =?utf-8?B?c1grVmRNY3pSSFNjNitzMEk2TmJ4SmJscHBmZ2c0U1hETzZJSkFqdjVhNkxo?=
 =?utf-8?B?UHlvek5kc0dsWnpiRThLSWJUTFRoYVlvZ2Q4SHAvcHJYemMwMjU4WUZOZm1W?=
 =?utf-8?B?ZktabnZ6TW5SeHZmWm5ZalZsV3VEZ0xJaXJSTm9aSE5pcFJrMkZvTVFxZ1hl?=
 =?utf-8?B?RENaU2FBdDhQNzI3SkpCZzB2MC9uVURiQU9tU0xmVlR5U0syQ2Yrc2gzM205?=
 =?utf-8?B?NDd2Qm1ZZGNDNy8vRWN2RzdGSnFRWXM2Y1J0SWJ4YXhyeHFGRWhGT0dad0pS?=
 =?utf-8?Q?EGdSwZER0aIaXZ0A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	BQN32mxEg/rxhhaCve9uRVKRt3miFtmfcFmAEE+2oIvW4lpZ2L1Ea+7kQ+Of+ycUnjZzxbkIVV7prBf3gtojIW9Y+bQZwJIHRqns79Z743MQG+7cfpc8SR+BQw6UmWCuKoi+VjBxo73PCPDWwWEoQ1kji7N6LyVA4gDss49Vxs+aLDoY0DdrF2Q7ICaWSySAKhkLYGwWclW/laI9rPDj26+aaX7NqV+6fPQwrz/oepkOydCCG60bDeh/hzLptN/zzVYjExY8MJL9igyBsVd5ATriG3Ucvg0mgSG/T9jfY8o77tQuASYgieB/154ZWV2/AtpJ1tUdpCMMVqvS4RCl9Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2b1972-4c2d-4bc0-926a-08dee5ef3e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 23:41:23.5714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFLYGwH40I5c6vcQ7Kx9gMj2FG6FsmlkW6wp0DFT5SSAB3qcAveQOw8yI1P32z7H6hjwrT2XkeZFE5uajhf2WudxDoX/PxYvVLs1vLQks+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7819
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI2NiBTYWx0ZWRfX0aqSQwU3Yt00
 JotwNpseYvY6RLuA7/qAxfuFnRinVfbQcpRGQTNF6HB7xSvKl75iUCoXjzd1jNoTafiLAIc3Z0j
 RFduDngBiHtjrPpbQ8AWpnhkswCfqG2QhFEaRdQftAcmJLQU2OiG
X-Proofpoint-ORIG-GUID: etP1XsY5DpC-m68C-lq5KE_orHXEKvP6
X-Proofpoint-GUID: etP1XsY5DpC-m68C-lq5KE_orHXEKvP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI2NiBTYWx0ZWRfX8pF+LKsMBFCI
 VByGgvCP56SKWrFQ61xAPCbIFxiw5ilmCCWNCNaGE4V6gkBynXXsbJfhpfCTzFWyTPoVTEGMKjp
 HarWRWa5/hfutmem27NSLjz2oKV3Yrva6ulVIws+yCG+//+l9Wu22HTozDP0mN0xCFRnJUNhuhT
 6u9xprDmkqTsoM9wVmgFEU72Z5F+N9drfw9VR5xnWKQS1iWdGKwU8SX8DchSdxhkEb/jTq7Xq1V
 q6+XAKNz99kIGb58tyY3P7ijTuarfwHxlFW4Z70cDt3//eAhl5cGQCSf425lLZZmjBba/QMJSPe
 U5teLt0HxrXhOujBOcuVMoUN+QQMUgNR7Y+BRHwCd6epQSaOIBv1OCXAK13Uj6NLd4icpivn40q
 dWxgL4q1YZAOAZANPZjgzVthrjY2tNtDtnIT5A4+FwC/ukHk5YpLqoYkUWEcU1tMq+0stGNSTAm
 cKAVhVeuFUJ2dsiBknA==
X-Authority-Analysis: v=2.4 cv=McdcfZ/f c=1 sm=1 tr=0 ts=6a5d60a6 cx=c_pps
 a=7JMGdgN8pDCDbqlksaqmUg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=j0Z1TL4_C6CbRPK3a7YA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190266

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkg
MTYsIDIwMjYgNDozOSBQTQ0KPiBUbzogVG9ycmVubywgQWxleGlzIEN6ZXphciA8QWxleGlzQ3pl
emFyLlRvcnJlbm9AYW5hbG9nLmNvbT4NCj4gQ2M6IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gaHdtb246IChwbWJ1cy9tYXgzNDQ0MCk6IEFk
ZCBzdXBwb3J0IGZvcg0KPiBNQVgzNDQ1Mg0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3Rl
bnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIE1pc3NpbmcgdW5zdXBw
b3J0ZWQgcmVnaXN0ZXIgbWFza2luZyBjYXVzZXMgQ01MIGVycm9ycyBhbmQgQUxFUlQNCj4gcGlu
IGFzc2VydGlvbnMgZHVyaW5nIHByb2JlIGZvciBtYXgzNDQ1Mi4NCj4gLSBbTWVkaXVtXSBCcml0
dGxlIGhhcmR3YXJlIHJldmlzaW9uIGNoZWNrIGFzc3VtZXMgbWF4MzQ0NTIgd2lsbCBuZXZlciBy
ZWFjaA0KPiBNQVgzNDQ1MSdzIE5BNiByZXZpc2lvbiB0aHJlc2hvbGQsIHJpc2tpbmcgZnV0dXJl
IGhhcmR3YXJlIG1pc2NvbmZpZ3VyYXRpb24uDQo+IC0tDQo+IA0KPiAtLS0gUGF0Y2ggWzNdOiBb
UEFUQ0ggMy8zXSBod21vbjogKHBtYnVzL21heDM0NDQwKTogQWRkIHN1cHBvcnQgZm9yDQo+IE1B
WDM0NDUyIC0tLSBjb21taXQgMzU0NzQyNTBiNmMwZmRhY2IwOGMzZDcwZGUzZDExN2EwZjg3ZDBj
Mg0KPiBBdXRob3I6IENhcmxvcyBKb25lcyBKciA8Y2FybG9zanIuam9uZXNAYW5hbG9nLmNvbT4N
Cj4gDQo+IGh3bW9uOiAocG1idXMvbWF4MzQ0NDApOiBBZGQgc3VwcG9ydCBmb3IgTUFYMzQ0NTIN
Cj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIE1heGltIE1BWDM0NDUyIFBN
QnVzIDE2LUNoYW5uZWwgVi9JDQo+IE1vbml0b3IgYW5kIDEyLUNoYW5uZWwgU2VxdWVuY2VyL01h
cmdpbmVyLiBUaGUgZGV2aWNlIGlzIHNpbWlsYXIgdG8gdGhlDQo+IE1BWDM0NDUxIGFuZCBzaGFy
ZXMgdGhlIHNhbWUgY29uZmlndXJhdGlvbiBmdW5jdGlvbnMuDQo+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2h3bW9uL3BtYnVzL21heDM0NDQwLmMNCj4gPiBiL2RyaXZlcnMvaHdtb24vcG1i
dXMvbWF4MzQ0NDAuYyBpbmRleCAwMjQxMDlkZjI2ZGI1Li4yZTU3YWYwOWY0NzgwDQo+ID4gMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9tYXgzNDQ0MC5jDQo+ID4gKysrIGIv
ZHJpdmVycy9od21vbi9wbWJ1cy9tYXgzNDQ0MC5jDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IEBA
IC0xMTYsNiArMTE3LDEwIEBAIHN0YXRpYyBpbnQgbWF4MzQ0NDBfcmVhZF93b3JkX2RhdGEoc3Ry
dWN0DQo+IGkyY19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsDQo+ID4gIAkJCXJldHVybiAtRU5Y
SU87DQo+ID4gIAkJcmV0ID0gLUVOT0RBVEE7DQo+ID4gIAkJYnJlYWs7DQo+IA0KPiBbU2V2ZXJp
dHk6IEhpZ2hdDQo+IERvZXMgdGhlIHByZWNlZGluZyBzd2l0Y2ggY2FzZSBibG9jayAoZm9yIFBN
QlVTX1ZJTl9PVl9GQVVMVF9MSU1JVCwNCj4gUE1CVVNfTUZSX01BWF9URU1QXzEsIGV0Yy4pIGFs
c28gbmVlZCB0byBleGNsdWRlIG1heDM0NDUyLCBzaW1pbGFyIHRvDQo+IGhvdyBpdCBjdXJyZW50
bHkgZXhjbHVkZXMgbWF4MzQ0NTE/DQo+IA0KPiBCZWNhdXNlIG1heDM0NDUyIGVuYWJsZXMgUE1C
VVNfSEFWRV9URU1QIGFuZCBQTUJVU19IQVZFX0lPVVQsIHRoZQ0KPiBQTUJ1cyBjb3JlIHdpbGwg
ZHluYW1pY2FsbHkgcXVlcnkgbGltaXQgcmVnaXN0ZXJzIGR1cmluZyBwcm9iZS4gU2luY2UNCj4g
bWF4MzQ0NTIgaXNuJ3QgZXhjbHVkZWQgaW4gdGhhdCBwcmVjZWRpbmcgY2hlY2ssIGl0IHJldHVy
bnMgLUVOT0RBVEEgaW5zdGVhZA0KPiBvZiAtRU5YSU8uIFRoaXMgY2F1c2VzIHRoZSBjb3JlIHRv
IHBlcmZvcm0gcGh5c2ljYWwgSTJDIHJlYWRzIG9uIHVuc3VwcG9ydGVkDQo+IHJlZ2lzdGVycywg
d2hpY2ggY2FuIHRyaWdnZXIgQ01MIGVycm9ycyBhbmQgYXNzZXJ0IHRoZSBoYXJkd2FyZSBBTEVS
VCBwaW4gb24NCj4gdGhlIG1heDM0NDUyLg0KPiANCg0KR29vZCBjYXRjaCwgZm9yIGNvbnNpc3Rl
bmN5IG1heDM0NDUyIHNob3VsZCBiZSBleGNsdWRlZCB0b28uIFdpbGwgZml4IGluIG5leHQgdmVy
c2lvbg0KDQo+ID4gKwljYXNlIFBNQlVTX1ZPVVRfT1ZfV0FSTl9MSU1JVDoNCj4gPiArCQlpZiAo
ZGF0YS0+aWQgPT0gbWF4MzQ0NTIpDQo+ID4gKwkJCXJldHVybiAtRU5YSU87DQo+ID4gKwkJcmV0
dXJuIC1FTk9EQVRBOw0KPiA+ICAJY2FzZSBQTUJVU19WSVJUX1JFQURfVk9VVF9NSU46DQo+IA0K
PiBbIC4uLiBdDQo+IA0KPiA+IEBAIC0zNDAsNiArMzUxLDcgQEAgc3RhdGljIGludCBtYXgzNDQ1
MV9zZXRfc3VwcG9ydGVkX2Z1bmNzKHN0cnVjdA0KPiBpMmNfY2xpZW50ICpjbGllbnQsDQo+ID4g
IAlpZiAocnYgPCAwKQ0KPiA+ICAJCXJldHVybiBydjsNCj4gPg0KPiA+ICsJLyogTUFYMzQ0NTIn
cyBsYXRlc3QgTUZSX1JFViBpcyBvbmx5IGF0IDB4MDAwNCwgd2lsbCBza2lwIHRoaXMgcGFydA0K
PiA+ICsqLw0KPiA+ICAJaWYgKHJ2ID49IE1BWDM0NDUxRVROQTZfTUZSX1JFVikgew0KPiA+ICAJ
CW1heDM0NDUxX25hNiA9IHRydWU7DQo+ID4gIAkJZGF0YS0+aW5mby5mb3JtYXRbUFNDX1ZPTFRB
R0VfSU5dID0gZGlyZWN0Ow0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFdpbGwgdGhpcyBj
YXVzZSBpc3N1ZXMgaWYgYSBmdXR1cmUgbWF4MzQ0NTIgc2lsaWNvbiByZXZpc2lvbiBpbmNyZW1l
bnRzIGl0cw0KPiBNRlJfUkVWSVNJT04gdG8gMHgwMDEyIChNQVgzNDQ1MUVUTkE2X01GUl9SRVYp
IG9yIGhpZ2hlcj8NCj4gDQo+IFNpbmNlIHRoZSBjaGVjayByZWxpZXMgc29sZWx5IG9uIHRoZSBy
ZXZpc2lvbiBudW1iZXIgd2l0aG91dCBleHBsaWNpdGx5IHZlcmlmeWluZw0KPiBpZiB0aGUgZGV2
aWNlIElEIGlzIG1heDM0NDUxLCBhIGZ1dHVyZSBtYXgzNDQ1MiByZXZpc2lvbiBjb3VsZCBtaXN0
YWtlbmx5DQo+IHRyaWdnZXIgdGhpcyBNQVgzNDQ1MS1zcGVjaWZpYyBzaWxpY29uIHdvcmthcm91
bmQuIFRoaXMgd291bGQgdW5pbnRlbnRpb25hbGx5DQo+IGVuYWJsZSBWSU4vSUlOIGNoYW5uZWxz
IGFuZCBhbHRlciBJT1VUIHNjYWxlIGZhY3RvcnMuDQo+IA0KPiBDb3VsZCB3ZSBjaGVjayB0aGUg
ZGV2aWNlIElEIGV4cGxpY2l0bHkgaGVyZSB0byBwcmV2ZW50IHRoaXM/DQoNCkN1cnJlbnRseSBt
YXgzNDQ1MidzIG1mcl9yZXYgaXMgYXQgMHgwMDQsIGV2ZW4gaWYgZnV0dXJlIHJldmlzaW9ucyBl
eHBlY3RzIHRoZSANCnNhbWUgYmVoYXZpb3IgYXMgd2l0aCBtYXgzNDQ1MSwgSSBkbyBhZ3JlZSBp
dCBpcyBzYWZlciB0byBleHBsaWNpdGx5IGNoZWNrIA0KdGhlIElEIGZvciB0aGlzLiBXaWxsIGFk
ZCBuZXh0IHJldmlzaW9uLg0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vc2FzaGlrby5kZXYvKi9wYXRjaHNldC8y
MDI2MDcxNi0NCj4gbWF4MzQ0NTFfZml4ZXMtdjEtMC1hOTQxYjI3ZWFlY2JAYW5hbG9nLmNvbT9w
YXJ0PTNfXztJdyEhQTNOaThDUzB5MlkhLQ0KPiBMeUYxQVpTNTY5elhmZFlUbEtteXM4Y05XV0NO
NDVaX1lsS0xPMVNhV0EycGhpU3Q0NDQzOFdmN2NzZ0ZpUjJQRw0KPiA5MlVaZHhfU2lZSi1UbWts
VENpSHFHX3BPbWRLYyQNCg==
