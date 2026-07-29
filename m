Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D123EA97;
	Wed, 29 Jul 2026 00:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284785; cv=fail; b=IB5W5zsOGx669Fls8E/e7vqaFgiWF49n7k2fgtiGzU26eGUM2DbjKcYq2RkA1Pa8mFJuYdbrBPEoOj5mYWSc5oFFdZQ5wHVRFuhkw5hzt2HO4A8u/Pew6wx2PcX5sCLTbTVXWRnrkzTVUDbq/XMf+4dD4NBbxQYE1B5fDk841TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284785; c=relaxed/simple;
	bh=R5s35Dsh9iP1i+RtWIkqCmP3hdK+faGrl7pX2btWtkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I/E4qUWOZTIie0dNJBnMkrw/5AHdNrCzp9fW0h6jJMkfuTVRKWlszd+kcU4t56gvoKkzMQ4TSryOsThM6yOLkEPu9s1KICHTxguBcLPl24DUSkbhDOL5Ltra+7utKlzKqRvHWsIH4cymjIWG34ap3fh/2F2EusbVW6f4SCuyIMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jtLl0P2i; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jtLl0P2i"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL4Xaf4019074;
	Tue, 28 Jul 2026 20:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=R5s35
	Dsh9iP1i+RtWIkqCmP3hdK+faGrl7pX2btWtkI=; b=jtLl0P2iofpZUQqw7OKEh
	m/+PQ1NIRuaOHCK8n535sapMEiXBPL6VUtMv8NTXzd4h9DBIPDB67MlPuzOrh5Ks
	/Ch/1+O61I4coExdHrDbo/rJnAJZ077ATvU261rxx0vHKfGux8lTbQDhS8pFVcXt
	vSx7MXpeyjhb4dMzRgRhmeZ9q9V9DfQuP0HSP6f64/78iQo65w8fI/a84yiDEvqN
	VVfS2f4rhaFjEP87c6eQZvxIBL6zxl5k/MEhsgpt4wZW8PD5kliOM2mzSB/ANc7v
	HuqW04MbR8I6Il3rkCgcaeiVATkXT/FC1rPRHwT/8gxGykwsfGqlxMpSe26+wlIV
	A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fq18ds7uy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 20:25:53 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZjfrJHjvPxGxbktNmTuiEjkEPXQoXxNYtK31QQaQltqr4Uyg5kdOABr0Yt0BgzMBqM4QcStnkHQIp/p8ubB+QACIadOh7gvhHaiUuZA3hwRCey0USMZ24dzTU2GLfRo1F5WJgrngz8h0mAoW4EczFEDmuYoo40qmNENQp1BG+CtFODpTx2st8gX1pR4odcZAeGjgsVpcbgEVH2vpNUqWvwzLK7qMqpUinRcVzJA2Ahqf7IDcQKiXey7nEcdk34qg/vF0MRtdU8Q0NavG6UCFhgZNA3An6BAupki/xXmagsnixlUcjilViJo7LYXZnhSi3JSFpMyPvZgdIjI8RwPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5s35Dsh9iP1i+RtWIkqCmP3hdK+faGrl7pX2btWtkI=;
 b=qcznBhU3xn12YaOIzM7ouPIYT3khqvo64ZM9r1BzbVWjzuJE4XX7GpNzKJg5QbsMBa0l1FMW18MJ32qUgKJUD9A0eeBkAcHxINMqT6PXGH4yrBvy5bMTSTwkOjRDSJnWrjlGLVbXYfhqOfUVV4LDBMbh9eE/n+5IjVcnZlXpKUg9u4Eo29+eNM8iN5k6Rg84Gjz8HyUk7pyzGP7eFzcaJqLzX041sz8GoyUYuoRtW4TxFq7to7ZBFNtn+vx16qvacm6uSef6MPAg/S5DOC+6EkoisbB+W9J2Ue4H8pAXwVLSttfT8t/ZRPUA8LnFep0NtmSqL/2of5tXBaMjkagQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA1PR03MB6385.namprd03.prod.outlook.com (2603:10b6:806:1c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 00:25:50 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 00:25:50 +0000
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
Thread-Index:
 AQHdHkHk/3XB76thsE6nF0Lg9EJuILaCV3qAgAAFY1CAAA53AIAABuQwgACLHACAAKTrcA==
Date: Wed, 29 Jul 2026 00:25:50 +0000
Message-ID:
 <PH0PR03MB635177B2B6831AFFAA2C30D6F1CA2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
 <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
 <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <9559d319-4b44-45c2-ae13-f92099de4c89@roeck-us.net>
 <PH0PR03MB63510057D496CBE8EBFAE246F1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <9812bc9e-75c7-49b8-82c3-1e9162d53ccd@roeck-us.net>
In-Reply-To: <9812bc9e-75c7-49b8-82c3-1e9162d53ccd@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA1PR03MB6385:EE_
x-ms-office365-filtering-correlation-id: de1692b4-dbb2-437e-b6aa-08deed07f13e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 zIF78vbX/UzNDhatMARW1w4lorcBDk7iPdEtMv26Q5/5Uajp5KGo30qmEQilT57d5hTF1ggAk6TVPMGCPoXMDRjxHbRPzvErXhtP+TXGnO42vGrrHjtfLhOMBCiCOEvonmX1u6kRBDeKiJAxCpq/t7uwzu0tKIFPzPyYUaZsOnmML8kULbx98H4cZLvdw1JHDJgKPhThCbqH8g3mxofgdBb8pdcV1CcipffgV8XGt5oTvkCjjEZhOI6INRCKEdBgjA9FUfjp1cHjh9LCu8afrPsYMoD3R1zkTPn0TKdADnsAL6NyNTxgrR3mDY+gRP7PXWMm4PqdBBJc6GJTilZDf9XjZJcatDSiHN1jGrT9qKz42KePBrliaWTjkpvEXgyb4Nqf9/9oiNNg40lp4T6g9MUWum11Dl3SSAVIYLm8djiYQmS3Ck2uRYKafX2aDjxFca41hpqHOiZ+5jRNHW/xquv7Oe/3hYCXSYeEZH79zuSZdadn8zrj/aN5uh5yHyeUSYZJequsxgjNiOM28klnmFa5Ka1mN2OmeCZDAtxtKiJdHAV6DjOWSrWjXIyVRyf8D2iY5jaFFXRRUSax+m/xDJT5Gj7l+H8G1lpWeu6CosBkU/U+tyRQ1v6lojekc6oDhK5VecdtymYiwqAQUHErzXAQemmdgrhI5+ArKE0sRYn37e0PTJT3xSo0V/01u3s8fvaUFwBq7k3u71ABu57y4dcpBcG/YrWsWsNvpDhpCd0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1FRS21PRVVaajUxakphWFduaGhremdBa3pYQy9qMTc5RlQzNWV6WHIwS0c5?=
 =?utf-8?B?alJ4QzRueVFHdXVRalVrN3paWVNxNE52ak5ndVFMWkJqVk1ITlZHRlRBU09q?=
 =?utf-8?B?UkZrVnhCZmtZc1EzaVY3bEd4Z0UxWEZvVU5JU1F3ZXBPOXhCQU1zUXUzTG1j?=
 =?utf-8?B?dWFpUU9zQmZidWt4SFlmYlg3VVBIM3NCL05GWXJUcm1ucjRlaEYwSXlOR1FS?=
 =?utf-8?B?cmJwdGFmbDFWK0h3aUxCbUdpbk0vOXNGZENpazlYb0cwUWNoUlpZWWJTTUtB?=
 =?utf-8?B?L0dRVVdGRnZJZjdkRUFVNjZiOFdvWlUyU3FBNUYxVUJrN01QTk9IREp3SlY4?=
 =?utf-8?B?WncwUllCTlgwcS9HVmlRc3hHT202VVc1MWtPN2IvVDR5UW4wbEtNRnpIQkgz?=
 =?utf-8?B?RGlMc2x6cFU4SEJBcHdGSzNiYnJRL21JM0JFbHlaMDJranJyWXVuMFNQbjFu?=
 =?utf-8?B?MnVZbU5qRGgxakowOG9Jb2RSWE90QjcyYytzU1Rid3VhWll1ZlpkeWNCeE5n?=
 =?utf-8?B?SFJKclA3VVYxUGtSRTcvZGY2MWZpVDJQUnc1SXQrN2pQYjFOZCtpK2V6WlBj?=
 =?utf-8?B?VHJ0VktWdG9lT2lOd2VmVHM3NFJDc2ZycTcyV1dVUUEzdldWZFgyVTMwcS9u?=
 =?utf-8?B?T1AwM2VPWlUrOFJqWkcydFAzTitzMFJwTEZOaithblNmbzZjWDFUTXo4ZVlp?=
 =?utf-8?B?SVhEOVdRanZMTlQ2UlpGU0VrMlJxYVEzM0hudHlXNFh4NDlkM2J4Ylpic01Y?=
 =?utf-8?B?Ukt3NlQ2Q0Y2eitMNnVpUUFjT0Z2R1hzQ05Nb1V0OEZBM2twOFEyeEhjTmlN?=
 =?utf-8?B?WCtidmZiTEZqa2RlWUVuaDBxOGk3eWttME50UU85cGFrSExnT3QwbGI3UFRQ?=
 =?utf-8?B?aFprQjVYck11UW5YWmFselhZTUJleUljSkozOUtLK1dIRVdRR1BIb3BVM0px?=
 =?utf-8?B?Q3BmZ3ExREdkd3g2cFhXNEJnU2IyNWRpNmR4WmI0VnA0b2l4aVYxQlBGaUkx?=
 =?utf-8?B?a1JpRGNZRWJJYWltN2x4UlVUUFFUTzg0SDFMbG1aK0VEcE44RGxyQWtCc1Zo?=
 =?utf-8?B?bEMvS25rNmJTRDZnTlhPVTllUWkwUG1pMnNXWi9GSFpnS0Q4NGgzTGFBN3hN?=
 =?utf-8?B?QmRoeitGNktLT3pFUVN0OXJSVTBjL2gwZDZHdWJrcUdjYlp6YjU3S2hsb1VT?=
 =?utf-8?B?STF4VUtxbnBCWmk0RXFVeEVZR29lM0FnY3dqQkhYWkowYS82YzV4NnVkUlU0?=
 =?utf-8?B?ZE5mWHJvRFdveVpXSWtMYUJqMFVxQTFaMnltb0ZRb1NxMmFaeWhpYlI1R1dX?=
 =?utf-8?B?NU9hUXE0TG5lZlVXOGx5a2JHSlFldVhtSFdXaDdsYlJUeXAzdGhUZ29LbHZE?=
 =?utf-8?B?U3pUVEpRd1lnWGpSRUt0aFZOL2JxQzZUUS80SVI5K2NPeEhKUTFSQ0lWU3FB?=
 =?utf-8?B?cTY1emlPWDNkekpqODFUcjRSSEpVOFB3N3FTNlRrSmhSVWJ5QUlwYVZCSGlR?=
 =?utf-8?B?Y29vZHljSC9Tem80aG41OUlIU05iL1krUDBKYjFSTktBZDNhelo3Wnh4OXp4?=
 =?utf-8?B?K3JxV1dnYnp5OWxNK0JKcUZkcXVGU2RORkJCZC9VazJsNjdmd2NMa1FlQ0VW?=
 =?utf-8?B?NHgxN215blFzMTNsYjFidmJYRjNwdEdrS1NTWVBYVDFHcjNobE1EZWdWL2Z5?=
 =?utf-8?B?cTFQS0F4eVl5ZUV5b3ZUUFA1NTBVVnlmaFFpekdkcC9kNGxNbmJCOUlCZHdx?=
 =?utf-8?B?aDUzS2U3ZUV6Y29UeUxlU0IvY2lGQnV5ZlkvUlQySkMyY2tJUWtZT1hUbjJN?=
 =?utf-8?B?elJhTUY2WDQ0a2xEaDM5WkY1Tmo2bXRxVDRvWDlwaTh0OTF6bzhBM0JWSjF5?=
 =?utf-8?B?anJqS3d6Y1ZBb3dWd1RMYkk4RXpLQnp6Y0dMYUQxZmltb21yU1BsSzdlYnBJ?=
 =?utf-8?B?QitCKzljdFloZWNzMmh2QzlBN09ISHAvcGN0SmZuUkM2ZFY0RFJaWGhuYmgv?=
 =?utf-8?B?d213NXB5cU5EamlZMzZ0bzFMR2tqa2xkT3c0V1hseWJscFJtK2Q0MWJ0dHds?=
 =?utf-8?B?YTNRZXdxaCtTYzhqa3U4bmxJckV1RUVJV3QrWm1VazQ3bFk2M1NQSVc1SUta?=
 =?utf-8?B?eUdLaXBQam94Q3owNC9GS0NaeWlLOC9LM0pYUjBEam02OEVWVGsrM1U0c25y?=
 =?utf-8?B?U2tDUlFmSzJiWEJKWUpGUzRCckVGTk92VFVXdE1IMkNaeTRNNDBaUGdBRkVV?=
 =?utf-8?B?VlJsUGdZeVZwcXVtUzByUSthR2FpZjd1UGEzSnc4MVQ4QzF3NS9vUmZUZ3NB?=
 =?utf-8?B?V2k1WkFhbHNTaFIxZ25WVzhlNmtVSjRyMFpXV280QjFkOEZucFNWYlNENU5J?=
 =?utf-8?Q?R7g16PqjDrhg8UVQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	LMXYqbvvirPR9zNVQLbw+balcGVpyEbRC7/FOSbICpvtMXbTkh3tlxAbgDdEifccNSZVh0Q5CBhsLBCLnR9nKoAwVBJa8fqm7j29ekjihY+l8l1KeUIIMDgG42rhZ9oBldQljNCIKr85jJup0lY75xBpU/L48xNdKr7VoZRs7HxrPrX4yIwPKW5Ewar3h8YOPKRpxf02Zb/z7l2D2sJBgnicj1GDe6ce/NJfiDMGWdavDPFTRu6+O+LmGPldnVdKW1c/D/PTQpjjCjUH8QBdXhPNfy4Jt8rICi+AENOlduK3FlxMMIAx8zc1Whm1D2StvEpzcpQByXeXmvFWUvtUOA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1692b4-dbb2-437e-b6aa-08deed07f13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 00:25:50.1010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PZYfgDYoinjdJH42mkzxYbeSUNMolthRA4M8pbh60aNGswuq8WBvh/9BFpasbsTzuGCYYMwBz6APyaI3q8ZgapzeRljDGfcdyD7ETQXkLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6385
X-Proofpoint-ORIG-GUID: v-CuWm0qJOUkTCTV3XDXeOH0YAfKcC7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwMSBTYWx0ZWRfX0Xiwms38M49m
 T2WY8vorbeacSvlsjySpfUK9jZjY4pOOQsCO8iklG3Be6fw/aILwDErC8xvFGQv3sG/J65b8XFk
 6mOmjfl1Ul2LFkIIIhylrChBLj9I+X2TtSHanUE1DlJ6WaZk9QHKCtFvuNCkjPpyUNRLhKLOPu7
 af/Ox5AZsRJcB3TE96UF7N2NClxvcWHHkYefAKn2Zlp1i5qER7AnPls0eSz8wArdyIt8e+Cq9bB
 t31B9MCQuYZH5mHgn8c93FA56k07InB+t0NTHMVuB4ato9EgArBB3MdKEjCoraJ0gEpu7dwbHZe
 CSRc6Fiq6n+0ew8tI6KePSoesL0GgxXnyphwPY/9qJCwvnpc9rG3mUQXmteu39OvxvVzHjub+vO
 H+M3dZpeaRvHfkK+Fu7P0JuwtMLHu5AbW1e94+ZHLZMAPbfpkviEtOOP43+1NRU7LOzhK/yAwRo
 XjkqXA7PppTb8k+3AYQ==
X-Proofpoint-GUID: v-CuWm0qJOUkTCTV3XDXeOH0YAfKcC7D
X-Authority-Analysis: v=2.4 cv=OtN/DS/t c=1 sm=1 tr=0 ts=6a694891 cx=c_pps
 a=erT4cWMnywdrD7/NC3b1Og==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gj89xScQuDpo1S-Dc3oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwMSBTYWx0ZWRfX7oNDI8Bsn4W4
 YYqysVthOmxvhxh+SdInYT3KaooLN54sKzX5aLCxt8+qlStVRCum3f2nGWUd2upLNLSQ63gQyLE
 gojmjmkyZpcOase+k6fu8qKZbg+2XxLfr4xxZ5jW4m6Pn8tSeDYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290001

PiBPbiA3LzI3LzI2IDIzOjU4LCBUb3JyZW5vLCBBbGV4aXMgQ3plemFyIHdyb3RlOg0KPiA+Pg0K
PiA+Pj4+DQo+ID4+Pj4gQXJlIHRob3NlIGNoaXBzIHN0aWxsIG5vdCBwdWJsaXNoZWQgPyBJIGZp
bmQgTUFYMjA4NDBULCBidXQgbm8gIkMiIHZhcmlhbnRzLg0KPiA+Pj4+IEFuZCBNQVgyMDg0MFQg
cHJlc3VtYWJseSBoYXMgYW4gSTJDIGRldmljZSBJRCBvZiAiTUFYMjA4NDAiLCBub3QNCj4gPj4+
PiAiTUFYMjA4NDBDIi4NCj4gPj4+Pg0KPiA+Pj4+IEkgYWxzbyBub3RpY2VkIHRoYXQgTUFYMjA4
MTAgYW5kIE1BWDIwODE1IHNlZW0gdG8gYmUgcmVnaXN0ZXINCj4gPj4gY29tcGF0aWJsZS4NCj4g
Pj4+Pg0KPiA+Pj4NCj4gPj4+IEkgYmVsaWV2ZSBzbyB5ZXMsIHRoZXkgYXJlbid0IHlldC4NCj4g
Pj4+DQo+ID4+DQo+ID4+IEkganVzdCBob3BlIHRoZXkgYXJlIHJlYWxseSBjb21wYXRpYmxlLCBh
bmQgdGhhdCB0aGUgZGV2aWNlIElEDQo+ID4+IHN0cmluZ3MgcmVhbGx5IGluY2x1ZGUgdGhlICJD
Ii4gVGhlICJUIiB2YXJpYW50cyBzZWVtIHRvIGhhdmUgbm8gVCBpbg0KPiA+PiB0aGUgZGV2aWNl
IElEIHN0cmluZywgbWFraW5nIGl0IGEgYml0IG9kZCB0aGF0IGl0IHdhcyAob3Igd2lsbCBiZSkg
YWRkZWQgZm9yIHRoZQ0KPiBDIHZhcmlhbnRzLg0KPiA+Pg0KPiA+DQo+ID4gWWVhaCB0aGUgVCBp
cyB3ZWlyZCwgYnV0IEkgZGlkIHRlc3QgdGhlIEMgdmFyaWFudHMgYW5kIHRoZXkgZG8gcmVwbHkg
dGhlICdjJyBjaGFyLg0KPiA+DQo+ID4+PiBBY3R1YWxseSBNQVgyMDgxMC84MTUgYW5kIGEgZmV3
IG1vcmUgYXJlIG5leHQgaW4gbGluZSBhZnRlciB0aGlzLiBBDQo+ID4+PiBkaWZmZXJlbnQgcGVy
c29uIGlzIGhhbmRsaW5nIGl0LCBidXQgdGhleSdyZSB3YWl0aW5nIG9uIGhvdyB0aGlzIHBhdGNo
ZXMgZ28uDQo+ID4+Pg0KPiA+Pg0KPiA+PiBZb3UgYXJlIG1ha2luZyB5b3Vyc2VsZiBtb3JlIHdv
cmsgdGhhbiBuZWNlc3NhcnkuIEtub3dpbmcgdGhhdCB0aGVyZQ0KPiA+PiBhcmUgbW9yZSBjaGlw
cyBjb21pbmcsIHRoZSBzZXF1ZW5jZSBvZiBzdHJjbXAoKSBpcyBub3QgcmVhbGx5IHRoYXQNCj4g
Pj4gZGVzaXJhYmxlIGFueW1vcmUuDQo+ID4+IEl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gY3JlYXRl
IGFuIGFycmF5IHdpdGggYWxsIGNoaXBzIHN1cHBvcnRlZCBieQ0KPiA+PiB0aGUgZHJpdmVyIGlu
c3RlYWQgb2YgYWRkaW5nIHVwIHN0cmNtcCBzZXF1ZW5jZXMuIFRoYXQgd291bGQgbWFrZSBpdA0K
PiA+PiBtdWNoIGVhc2llciB0byBhZGQgc3VwcG9ydCBmb3IgbmV3IHZhcmlhbnRzLg0KPiA+Pg0K
PiA+PiBUaGVyZSBhbHNvIHNlZW1zIHRvIGJlIGEgTUFYMjA4MzBULiBEb2VzIGl0IGFjdHVhbGx5
IG1ha2Ugc2Vuc2UgdG8NCj4gPj4gbGlzdCB0aGUgdmFyaWFudHMgKEMvVCkgaW4gdGhlIGZpcnN0
IHBsYWNlID8NCj4gPj4NCj4gPg0KPiA+IFdpbGwgdGhpbmsgYWJvdXQgaG93IHRvIG1ha2UgdG8g
c2NhbGUgdGhlIGNvZGUgd2hlbiBhZGRpbmcgbmV3ZXIgdmFyaWFudHMuDQo+ID4NCj4gDQo+IFNv
bWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgc2hvdWxkIGRvLg0KPiANCj4gY29uc3QgY2hhciAq
c3VwcG9ydGVkX2NoaXBzW10gPSB7DQo+IAkiTUFYMjA4MzAiLA0KPiAJIk1BWDIwODMwQyIsDQo+
IAkiTUFYMjA4NDAiLA0KPiAJIk1BWDIwODQwQyINCj4gfTsNCj4gDQo+IC4uLg0KPiAJZm9yIChp
ID0gMCwgc3VwcG9ydGVkID0gZmFsc2U7IGkgPCBBUlJBWV9TSVpFKHN1cHBvcnRlZF9jaGlwcykg
JiYNCj4gIXN1cHBvcnRlZDsgaSsrKQ0KPiAJCXN1cHBvcnRlZCA9ICFzdHJjbXAoYnVmLCBzdXBw
b3J0ZWRfY2hpcHNbaV0pOw0KPiANCj4gCWlmICghc3VwcG9ydGVkKQ0KPiAJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKCZjbGllbnQtPmRldiwgLUVOT0RFViwNCj4gCQkJCSAgICAgIlVuc3VwcG9ydGVk
IGRldmljZTogJyUqcEUnXG4iLCByZXQsIGJ1Zik7DQo+IA0KPiBUaGVuIGFsbCB5b3UnZCBuZWVk
IHRvIGRvIHRvIGFkZCBtb3JlIGNoaXBzIHdvdWxkIGJlIHRvIGFkZCB0aGUgc3RyaW5ncyB0byB0
aGUNCj4gc3VwcG9ydGVkX2NoaXBzW10gYXJyYXkuDQo+IA0KDQpGb3Igc29tZSByZWFzb24gdGhl
eSBkaWRuJ3QgYXNrIG1lIHRvIGFkZCBNQVgyMDg0MCwgYW5kIEkgZGlkIGRvdWJsZSBjaGVjayB3
aXRoIHRoZW0uDQoNCkNvZGUgd2lzZSwgSSBlbmRlZCB1cCB3aXRoIHRoaXMuIChJIGd1ZXNzIGFt
IHRyeWluZyB0byBhdm9pZCBtYWlsaW5nIGEgdjYpDQoNCi4uLg0Kc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBzdXBwb3J0ZWRfY2hpcF9pZHNbXSA9IHsNCgkiTUFYMjA4MzAiLA0KCSJNQVgyMDgz
MEMiLA0KCSJNQVgyMDg0MEMiLA0KfTsNCi4uLg0KCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KHN1cHBvcnRlZF9jaGlwX2lkcyk7IGkrKykgew0KCQlpZiAoIXN0cmNtcChidWYsIHN1cHBvcnRl
ZF9jaGlwX2lkc1tpXSkpDQoJCQlnb3RvIGlkX29rOw0KCX0NCg0KCXJldHVybiBkZXZfZXJyX3By
b2JlKCZjbGllbnQtPmRldiwgLUVOT0RFViwNCgkJCSAgICAgIlVuc3VwcG9ydGVkIGRldmljZTog
JyUqcEUnXG4iLCByZXQsIGJ1Zik7DQoNCmlkX29rOg0KLi4uIChwcm9iZSBhZnRlcikNCg0KVGhh
bmsgeW91LA0KQWxleGlzDQoNCg0K
