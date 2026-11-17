Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794911997;
	b=yP//KI0pM+BV4n41b8WpKvU+usFnkz1nOZ2emb3/QZk8+a/I/fSYM8ofN/K59CGKIPfq
	 yu/1KH0+yvJqWiR/wnVs0QPl2/LDxdEQm8phcYtMprLbBzv5wOpGYjQIAez9jNEohh6TT
	 nImxIc6hndmKQCCjPmcR8wMKuqYssGLJtfXel4xxNg65jO8dkG2RdE7R0q3A4GLHbOWvL
	 IcjJVb6/sK8PrsBaHEJHMZ9Us4KBktxwGSgMhbetnK7qqUa+0lPU7E8lYr1IKLp3kTm0R
	 Z1ZCN0jZKcYxHvBn9XWkBqmQmFLLiZwkcpi+CfoI2ts/fKxgyA3BYAkUTqGXCZVAIsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911997;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eFQ0/FhxVPZzoAFD75Gk7hQ3Z10tK5eIgjBYGrGf8HA=;
	b=hPqrzq0x08yJH0CSn5591RmT1su1B2i4CWaCvTuMptlHrc6kwrKIj0ZlZHDczOeIZ5jF
	 T26dPcjoClS9q9hRVA+5bXYPekFctfdcEa3IXqia6htn12jKIJUi1hRLAPUPHZhrcZAY5
	 8sOgwyX8uVz2vxROFU8cAieHysCJ9V1DblKVA+JSVrcFiSgvRqH0/xlXLig2UwBa4NMgS
	 34hNv3teoPgmrdbNcqf9/8ZkOyCVB16DCnVUW9UCumJszxcVMmEyScFAtoUGGBPP1ROBv
	 nvYaP/K4ya0dHbIc2SEA0L7UdIMUkW+8I83atizdATzNBVo37DQTEEhGnyPoBURxQsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=OUWczIVp;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=al8eE6av;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EEB606A31C;
	Tue, 17 Nov 2026 10:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1EEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=OUWczIVp;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=al8eE6av
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAM1Ln3801505;
	Tue, 17 Nov 2026 05:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=eFQ0/FhxVPZzoAFD75Gk7hQ3Z10tK5eIgjBYGrGf8HA=; b=OUWczIV
	piAZeioavsnnXYIn1vdE58/oYzgbILcCwjowPBqdQavF2AJ6V8TNZwwowrKQaviS
	+GvA/kT8waj9m2NVEgE1M2Lc7Hmyk0vWmXoeXNC9j6Y2PFVfVLL2V7Mg7dg1heP5
	FHY53iC3n4FYwsjTPPnU0196D0OvgGzh5oGvrm5pzHL3EeIw/jJtLrIQrU+DxfGc
	pfRFDXX8rJDMbmOvNNikutvpJ3q+Lji+JWOOF27O+Grgu5ZThogOPmfBx1y6hyqH
	m5RI7wGUS5Zmtxc8XF5TuwTuUagRQaYUDQzaX6hpGuSjDHNeIupi1n6Tyr2ZlfIl
	u32oJ88nSl+chXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=eFQ0/
	FhxVPZzoAFD75Gk7hQ3Z10tK5eIgjBYGrGf8HA=; b=al8eE6avB6gADDUyj95Z5
	IzauEcmKe6Jp6MOdw6ZDMcSKTZQ8t7ZNoG2hjylx2y8/g65i7qnJgeTj7riIdYTj
	0KmN783TXpfjyUSr2/hvGel13SHCdxuyzLy3vzUPlOnND/wId6yP8EbTc3RCsjgN
	ssTH3A5A2E7lkBHQKSe0xT8tjey7Q8l85ZyYCtEJXPWgSSyTqgInS8/LU5wiPXlB
	/QpoNBTdG4M/MIYvmhxT9D9W4JoaazNjdF5PJaeewK8o+Q09ipGUVmuABFoI0OSL
	sTh5hySglJkMQ4/Xtn6SN7ewmoQpwYCu3oWZRrjqcoehotOGV1QwS5lDdwTYrR3Y
	A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4j0n4183fd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 05:39:28 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPbJTpZwEqtlRRotDzS+6C5mjvti/UHfG86DtQmu7M05gHe+ijyTBpv/aEEXLIKALlEHo8PiAkk/bB67EIlayP/VcVMJkPU3Ie9CCO/SEMtUIzN+CsKBRFRgQRjA+WyCHCZ0R+rGSsHc5P0Ux0GjokizrTOW2pHlyxWxJuwelybTH0ujIGNZjBAVXEwJAUVO1MzcwYDgzgs0qiy7qM5oDAfr7cQGJAdAVcofphB6LifC46d/7ou5oUuXqOZtNKq+t+lyUzEW0p1QbHzsDuGVi9rYkcbRVs08i9NbtBECzL2yCIqwIdMD0aktQsjBJ+WHnxt238zDN662uoyfw142dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFQ0/FhxVPZzoAFD75Gk7hQ3Z10tK5eIgjBYGrGf8HA=;
 b=eyQ3qbA+UhRURE1iCxNtB/gR/OBkm5BHo03BqHh7wvUboMn1mrz7QEwzWHUzE/XtGk0yK4SvZg3e6QWSNtF2xTrh6zAYjeBuPAC2vEyGaxWjIh6U0AyclrkoFWJZOqRJH68TDCize1Rr6qAh+KScJK3cRUV8AoHuXlI5ltGdioLfjkmLsgoNFaPohrOxyT6cE7m+mQi0ahN/95AKOK1lMAA/M/1VaY1cafKzHZuIYcsY9zn7Ttq7Pm1fkUpl3pnL9nGgePgxIDK4kmLqKJo4Nh+cSAo4HeYgXJzQ9KhpdP8gNsC+C8CPN1+0D2FXkC/OQMiqgoVO97266/HihptsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by MN2PR03MB5070.namprd03.prod.outlook.com (2603:10b6:208:1a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:39:24 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:39:24 +0000
From: "De guzman, Christopher" <christopher.deguzman@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Thread-Topic: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Thread-Index: AQHdcPp/HAnD6oWY60mgLoC0B4k40rcnFnwAgAarXACABFRkQA==
Date: Tue, 17 Nov 2026 10:39:24 +0000
Message-ID:
 <DS7PR03MB8265ED174812E879836607A5ED7B2@DS7PR03MB8265.namprd03.prod.outlook.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
 <sashiko-outbox-206843@kernel.org>
 <73c31a61-9176-49ac-84c6-90f9e17a02e2@roeck-us.net>
In-Reply-To: <73c31a61-9176-49ac-84c6-90f9e17a02e2@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR03MB8265:EE_|MN2PR03MB5070:EE_
x-ms-office365-filtering-correlation-id: 668281c7-d563-4365-cf77-08df44970c6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 enhIvcCCirj1tp1s3bC3clGBQQn16u2pqgor/3wds+XBdaDKE3QdoSodu8N3LI+8hXen21U/crNDZfCrAfZcTHLGYCHuyPjMzVBoYB9qxyQJl25R/n0kEwoW3HBM4+V5eGYUF9ZJQVp4dLgTBxETF+Sons1rG3B/RVuNNn8CYl7vEuYTTqAMzR1aXmz4xvBJtuZlyNzpe7LKHdNKNys0n0BusQM7Dv6JPvyFFJ+KpHKSmxc+gorJqD4Ks3LJb4Agq5sLD8chAcpPariaSVskO3SvsedI7/DgbkZ9a1/j66bvrB5uT26HaLTU3KNUbas9KA7+EvsEkzATelNl7fAJRKn8mxjAMVsN1sEKik7ErH0CvgA84joikgnDv2pwou+rzinR4xF4tAjaJL/CSDgqR0Cfxc6Pd/6rQYb1BH7MPWXbcdzJmKFPcHDGbZPsb+DLzBMERpgs20uX+rehzh8db/4OYNM0UJ0ETX1eqczLFCSoXphTOm2wdtV00WTdLHtApdfiuqYeQhjakIeP7OJPAPtSR0Ex1/oTxCp75X6DofqqLxgCETfFKch5iu3m+2k6PF1DOqSYl0WoAUjcKeXFRXCNmQ6RHzNGhoSj2eHcRH07q0Qy7rhy0EdAZWGNVWxNai1CrV8p8kZWPUHNbsDMLohzrsQGittB505DKE0a0ioNeIVIRA9+UNWAYPH/y+p2kOYK0RceTs7aUwY95YH4mRZKMWn6RFRJFK75KfHtnxk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0lyUGFVdzRZbTNGY2tmbkNORWJaUi9FTi9vWTRaTHBpeG1CM3hlNFZHcEU5?=
 =?utf-8?B?NzNLQWR4azRnL0JHRmFDN0hzbE1yTVZYYS9pQWVJa2NKczJNOUtzbk56TUEz?=
 =?utf-8?B?cjJEdDBFTS9HU3hZTkw4NWJ6aVI0RzI3NzYyT0FORERXb0RJSjZWWmxBTDR2?=
 =?utf-8?B?aU5PMjBIQTNid3c1N1NKTlNaWGQ1UFhSOE1wS25WS2ZRRjcvR0l5QU9CMEJC?=
 =?utf-8?B?dVN0UlpQZUd0N0RybEZXdktSU0U5cTVyY1V3dVN6Ync1eC8zRWZXdDRVNWs5?=
 =?utf-8?B?OFZxRGRmMmw4WUlCUGhzTEhTdGdhRGtHL1dIc0VzWGh0aDNURWtKbHZ5OWNL?=
 =?utf-8?B?c0c1NSt3cnYxVXNWYm9OeXNZQkhQeFhZSTlIdW83T1piS1hWcGZlbjREc3d6?=
 =?utf-8?B?Rm9zU2FZWVhGZDJFazhsY3JydHQ4SkpUQllnNFF6Snh5QmduTmUzUE85elhM?=
 =?utf-8?B?Uzc4VDdTQnpBNWlNZ2RYQmVqR2VibmxldkkvT0V5Z3lvZjBkMDhmMnRPOHpY?=
 =?utf-8?B?dkFrM0JRTEcvNG03ZXRpYzhXT3plNGxUeFVJRENkaHlVclRUNU9TNTdEZ3o2?=
 =?utf-8?B?aVBKa0FDRlJyN05GeERCbk5tZkFhWmhJTEpuakppcTgvU0M2eVYyTUhiMkxG?=
 =?utf-8?B?K1hSckE0UTJWSEhncFVvWlZtSjdhZmtYLzlUVXZSR0NWODdjMFh2SkJaN05t?=
 =?utf-8?B?eWE5Z3BWWEEvdDZUSmdTNXN4VW05U0NhY25kU0c1cGRtbVczQk1vZmNId1FB?=
 =?utf-8?B?TnZBYnNCRmtwYzhHMXVIWXhHa1pISTZEMjBNanBlYlB1d3ljMm50MkJxV3Vt?=
 =?utf-8?B?cjZhRkFjaU9xUU5kUWZtZEJvOVlpRmVwUyt3QzYyM0kwSHJHdlNDVWtDSzZF?=
 =?utf-8?B?TnloMXZqdDAvOXdpZjFCamRFbGF4UTg2STNsY0xOZ3MxdWVOUmFXeGNmNW9v?=
 =?utf-8?B?VHNoaGVyV3V3SzM3MVpxVFgreXBmbkErOVZRM21MOFZWdTdoNm4vTkZhV2FE?=
 =?utf-8?B?TVFzcUVHbVJlWHdDMzhyQUg3WUJWR0N1VWYwaWYzYno0SzREUXdYL2NGU1hr?=
 =?utf-8?B?MVFLK0pVQy9ZbGtTa0NCdWR5S3cvUUtRdysxQ3ZhVUZoeDIvTlBKWHJVVytl?=
 =?utf-8?B?aXJlMlJXS2hheDBmYmJFVXU4b3YwQlkvNnBTSVF2VWFwUHVwY1VSTThYOEZT?=
 =?utf-8?B?ZWM3b0NtZEdUei96QWkwTlkzU2hLd2xtWHdPdE5sWHV1bW9DNTl5cXQ0MW5v?=
 =?utf-8?B?U1hRSmJOWXhKVHZLM0hzOFVEZC9MNHpJd2FEdzFmaGpqOW04TWVJTTdtWCtz?=
 =?utf-8?B?ZEhNRlozWThiSTNwL05yU2RSUHdtYU9SQ25lOFNSZUIybzVQUHZ4cWEzWU16?=
 =?utf-8?B?eTl1cWNoaWpNdzVFaGxYaHpWWDJzSnJQcHk3SWM2YXJudWk0M0ZMZHpSSEZF?=
 =?utf-8?B?M2dRWnJRYXhkTG0zQ3hYNU8vTVkxemZ6T1RzOW9UcFdGMjloT080Zmp1d3NE?=
 =?utf-8?B?dEFNNW42ajBkUjJLYTNISUduRTBiVjFwTDhVMThzaitaN2dwUXN3ekNQZlRq?=
 =?utf-8?B?R2k0TFVRVTl5YXJ6bEdsd09SckJIM3pWYWFEQzg2aUtkak1IOWN2ejhsTUZq?=
 =?utf-8?B?S3J1cFNOUlZadFBFMjBsRC9TOWtVRFNzVzh5MHJQd3hlcWlXcFhyaThvOFJP?=
 =?utf-8?B?Yjk0MGtlVkF1UWxmZm1NQ0srbFNBeTNXQjJFZkVDNnQ0ejM4cm1QNlRCUE8v?=
 =?utf-8?B?RE9Fd3J2bE83VDFBclEzZjlmZzBzaVdHSlRwTXdsemViNzM1UU55TjIwQURY?=
 =?utf-8?B?Wjhuem5yME5KQlJmV2R5aTNlNkdnYmJaZ2x6eGZ2MlR2dm1HWXZpdlU4a3g1?=
 =?utf-8?B?TVFGZEIvZWVYbHJuQUsxSHM5dVhQWXFZZTMrQkFiR0Rvbm5RcUZvSGZiWURE?=
 =?utf-8?B?dU42SnpsMDByUFFjZ1EybVFKSWZEelNMZHdIN2VoRjFwMXh5dE1ra1BqUXNW?=
 =?utf-8?B?UkhoaVl5NjlCMDdoOTA0V29GSytXVkwvdHE2bjNVb2dhVUdEUGJpc1ROTGY4?=
 =?utf-8?B?NnV0L3RHV2E5bEYyTTVySmZ2UUozZnJpcStXVnlVQ0MwNjBHQStYczBZOG13?=
 =?utf-8?B?NXhhWnVwWmN0cEF3ZGg1d0NhbFRQY0xucDJacmxINjA2K2hiSU56MHRNSnVq?=
 =?utf-8?B?eXBRUTBMVmFFbStueklZSG5ZVlpsV2x1K2VPNEd2b3NkZFhNSU1Ub3BGcyti?=
 =?utf-8?B?VzV5MU51TjFSaldTK3c1eGdSdXU1R25tYnhIbmFxMHVrbjFQS3ZYN3htTGNL?=
 =?utf-8?B?b3ZZTTAyTDlZKzBlWWs0dXhrbXFrcWdseUV1TG5HV2pWaFN0WXNQUnl5Q3lo?=
 =?utf-8?Q?/WwgYCvjtzHc49rU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	UcgQr/cYxc7ZoFRKh/VUEQbYlFYT6+LYqC6znzS5qFjNfYiv2d5FvA0uayEsi63lgSRgTLNa4MwMZfbReHbyAt7V7HRMwW3Xfw7KS9t5REpJLzxEpDZEEzR/Qd+3PBVLJI1hipBjfJIb2NNyTiUSuZpzoUcr5TpG3hc7chPRly7rZnol4InmOmGlAV5etwdot1PodevANWfB8YJjuG1cwoubYKm+kCOOzxrlNVVXDGzZiaT+FqsiWeXOdBjtdjUU7uBCK/FaaWusdnxBkxuKzQQiy9Y6hWzsyqOXul9qKWPlE/5fzpq6z3q81wFKkVcoVIQgSnOh2DA+dhATuI6H1w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668281c7-d563-4365-cf77-08df44970c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 10:39:24.9066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5EweZLS7K6ySSToSEC6MfD3+lPc4O964O5PsZj9iLH+V+CKPCvng766n4mvXEV6VjPyvfx6l9uKLTppPJ3E+1vK2pqZTFSBkUQ9OLttxE34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5070
X-Proofpoint-ORIG-GUID: bdQFbwKCzdr5C3igHVkQQO0PRImHAVao
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6afc2ee0 cx=c_pps
 a=GeWWyO5P+zJVL7v3m8oIig==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=_jlGtV7tAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=OwbNZDD_IeHdDoBna4gA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX6HFwvVEUsAZM
 3F2sU4paTs8yoVHv4LdyAPSMKSQrvBBtD2f230su0ioCZ7zZvxz2O48Ur1vm2UDgUHNkGgz4zTT
 xEKIPr6LI7tZ8xVhuvAKmVAL35/O0njBb6MOM/3zPB4jVqj+2ksFrRYu41sT/Nh/PUtu7BVm7Wp
 kXYwF1d7hH0zlrNFQlmOnF2dbSLMP0rz0WeP1H2Wht2jCrw/pJ6QNAQCeK67VvoA/fN9W4I7r/N
 0jhamWZmoRASMi7Egw5GfHhU2wjxITtmLtvF5qHKXucu17uAqMdEfinFZWzdGwGF/aTb7YYNJRt
 1nsvjpoVaK8PhBDeq9BqAL1AZPgYRZnR737BmQCWf37pikBCKa6OIjLzhMq51IbGGGGOjITIcvk
 tvKbwOPjTEJjfci35+K8dPtZJtKvoI0NEwGG7dBolMaDUer/SLawciKaCy192lKnQHM8jWAttY4
 CtOaCKPBnVwsn18Eq1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX5VdAbirOSNHJ
 MKzSO62RYr1vh1JH75A2XwIShDMaX0490BvR5ljnAyu9eZgcOhSNAQQngGc2a82GWZVHkLY2Mku
 7vKu0yawqIy2ASgB1qACsJzxVcs9Wzi3iklkEjFg0jFAjvoGFdFM
X-Proofpoint-GUID: bdQFbwKCzdr5C3igHVkQQO0PRImHAVao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+DQo+IFNlbnQ6IFN1bmRheSwgTm92ZW1iZXIgMTUsIDIwMjYgMTI6MDUg
QU0NCj4gVG86IHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY7IERlIGd1em1hbiwgQ2hy
aXN0b3BoZXINCj4gPGNocmlzdG9waGVyLmRlZ3V6bWFuQGFuYWxvZy5jb20+DQo+IENjOiBsaW51
eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBy
b2JoQGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzRdIGh3bW9uOiAocG1idXMvbHRjMjk3OCkgQWRkIHN1cHBvcnQgZm9yIExUNzE3NQ0K
PiBhbmQgTFQ3MTc2UA0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24gMTEvMTAvMjYgMDI6MTQs
IHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNv
bnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gPiBpc3N1
ZSB0byBjb25zaWRlcjoNCj4gPiAtIFtNZWRpdW1dIGh3bW9uOiAocG1idXMvbHRjMjk3OCkgSUVF
RS03NTQgcGVha3MgY29tcGFyZWQgYXMNCj4gTElORUFSMTEgaW4NCj4gPiAgICBsdGNfZ2V0X21h
eCgpDQo+ID4gLS0NCj4gPg0KPiA+IGNvbW1pdCAyMDFjMDllN2YwNmVhZDJkNjJlNDIzY2JhMDBh
NTM2ZGRlMDY3MTU5DQo+ID4gQXV0aG9yOiBDaHJpc3RvcGhlciBkZSBHdXptYW4gPGNocmlzdG9w
aGVyLmRlZ3V6bWFuQGFuYWxvZy5jb20+DQo+ID4NCj4gPiBod21vbjogKHBtYnVzL2x0YzI5Nzgp
IEFkZCBzdXBwb3J0IGZvciBMVDcxNzUgYW5kIExUNzE3NlANCj4gPg0KPiA+IFRoaXMgY29tbWl0
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIExUNzE3NSBhbmQgTFQ3MTc2UCBQTUJ1cyBidWNrDQo+ID4g
cmVndWxhdG9ycyBhbmQgbWF0Y2hlcyBQTUJVU19JQ19ERVZJQ0VfSUQgc3RyaW5ncyBhZ2FpbnN0
IGx0YzI5NzhfaWRbXQ0KPiA+IGZvciB0aGUgTFQ3MTcwIGZhbWlseS4NCj4gPg0KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9sdGMyOTc4LmMNCj4gPj4gYi9kcml2ZXJzL2h3
bW9uL3BtYnVzL2x0YzI5NzguYyBpbmRleCBhZWE3YjZjOTNlNzRiLi44ODhkYjMyMTNhMDFlDQo+
ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL2x0YzI5NzguYw0KPiA+
PiArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL2x0YzI5NzguYw0KPiA+IFsgLi4uIF0NCj4gPj4g
QEAgLTc2Miw2ICs3NjMsOCBAQCBzdGF0aWMgaW50IGx0YzI5NzhfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkNCj4gPj4gICAJc3dpdGNoIChkYXRhLT5pZCkgew0KPiA+PiAgIAljYXNl
IGx0NzE3MDoNCj4gPj4gICAJY2FzZSBsdDcxNzE6DQo+ID4+ICsJY2FzZSBsdDcxNzU6DQo+ID4+
ICsJY2FzZSBsdDcxNzZwOg0KPiA+PiAgIAkJZGF0YS0+ZmVhdHVyZXMgfD0gRkVBVF9DTEVBUl9Q
RUFLUyB8DQo+IEZFQVRfTkVFRFNfUE9MTElORzsNCj4gPj4gICAJCWluZm8tPnJlYWRfd29yZF9k
YXRhID0gbHRjMzg4M19yZWFkX3dvcmRfZGF0YTsNCj4gPj4gICAJCWluZm8tPnBhZ2VzID0gTFRD
Mzg4M19OVU1fUEFHRVM7DQo+ID4NCj4gPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gPiBEb2VzIHJv
dXRpbmcgbHQ3MTc1IGFuZCBsdDcxNzZwIChhbG9uZyB3aXRoIGx0NzE3MCBhbmQgbHQ3MTcxKSB0
aHJvdWdoDQo+ID4gbHRjMzg4M19yZWFkX3dvcmRfZGF0YSgpIGNvcnJ1cHQgcGVhayByZWFkaW5n
cyB3aGVuIHRoZSBkYXRhIGZvcm1hdCBpcw0KPiA+IGllZWU3NTQ/DQo+ID4NCj4gPiBsdGMzODgz
X3JlYWRfd29yZF9kYXRhKCkgLT4gbHRjMzg4MF9yZWFkX3dvcmRfZGF0YSgpIC0+DQo+ID4gbHRj
Mjk3OF9yZWFkX3dvcmRfZGF0YV9jb21tb24oKSByZWFkcyBQTUJVU19WSVJUX1JFQURfSU9VVF9N
QVgsDQo+ID4gUE1CVVNfVklSVF9SRUFEX1ZJTl9NQVgsIGFuZCBQTUJVU19WSVJUX1JFQURfVEVN
UF9NQVggdmlhDQo+IGx0Y19nZXRfbWF4KCk6DQo+ID4NCj4gPiBkcml2ZXJzL2h3bW9uL3BtYnVz
L2x0YzI5NzguYzpsdGNfZ2V0X21heCgpIHsNCj4gPiAgICAgIC4uLg0KPiA+IAlyZXQgPSBsdGNf
cmVhZF93b3JkX2RhdGEoY2xpZW50LCBwYWdlLCAweGZmLCByZWcpOw0KPiA+IAlpZiAocmV0ID49
IDApIHsNCj4gPiAJCWlmIChsaW4xMV90b192YWwocmV0KSA+IGxpbjExX3RvX3ZhbCgqcG1heCkp
DQo+ID4gCQkJKnBtYXggPSByZXQ7DQo+ID4gCQlyZXQgPSAqcG1heDsNCj4gPiAJfQ0KPiA+ICAg
ICAgLi4uDQo+ID4gfQ0KPiA+DQo+ID4gbGluMTFfdG9fdmFsKCkgdHJlYXRzIGJpdCAxMCBhcyB0
aGUgdHdvJ3MtY29tcGxlbWVudCBtYW50aXNzYSBzaWduIGJpdC4NCj4gPiBJbiBJRUVFLTc1NCBi
aW5hcnkxNiwgYml0IDEwIGlzIHRoZSBsZWFzdC1zaWduaWZpY2FudCBiaXQgb2YgdGhlDQo+ID4g
Ymlhc2VkIGV4cG9uZW50LCBzbyBwb3NpdGl2ZSB2YWx1ZXMgd2l0aCBhbiBvZGQgYmlhc2VkIGV4
cG9uZW50IChzdWNoDQo+ID4gYXMgdGVtcGVyYXR1cmVzIGluIFs2NCwgMTI4KSBDIG9yIHZvbHRh
Z2VzIGluIFsxNiwgMzIpIFYpIGRlY29kZSBhcw0KPiA+IG5lZ2F0aXZlIGFuZCBhcmUgZGlzY2Fy
ZGVkIGluIGZhdm9yIG9mIHNtYWxsZXIgcmVhZGluZ3Mgd2l0aCBhbiBldmVuDQo+ID4gYmlhc2Vk
IGV4cG9uZW50Lg0KPiA+DQo+IA0KPiBJIGhhdmUgbm90IGhlYXJkIGJhY2sgZnJvbSB0aGUgYXV0
aG9yLiBXaXRob3V0IGxvb2tpbmcgaW50byBkZXRhaWxzIG15c2VsZiwgSQ0KPiBhc3N1bWUgdGhh
dCB0aGUgcHJvYmxlbSBpcyByZWFsIGFuZCB3aWxsIG5lZWQgdG8gYmUgYWRkcmVzc2VkLg0KPiAN
Cj4gVGhhbmtzLA0KPiBHdWVudGVyDQoNCkhpIEd1ZW50ZXIsDQpTb3JyeSBmb3IgdGhlIGRlbGF5
IGluIG15IHJlc3BvbnNlLiBUaGUgaXNzdWUgaXMgcmVhbC4gVGhlIExUNzE3MCBmYW1pbHkNCnJl
cG9ydHMgSUVFRS03NTQgdmFsdWVzIGJ1dCB0aGUgcGVhayB0cmFja2luZyBpbiBsdGNfZ2V0X21h
eCgpLw0KbHRjX2dldF9taW4oKSBjb21hcHJlcyB0aGVtIGFzIExJTkVBUjExLiBJIHdpbGwgYWRk
IGEgZml4IGZvciB0aGlzIGFzIGENCnNlcGFyYXRlIHBhdGNoLg0KDQpUaGFuayB5b3UsDQpDaHJp
cw0KDQo=
