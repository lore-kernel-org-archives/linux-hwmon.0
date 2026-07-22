Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14743B6BF4;
	Wed, 22 Jul 2026 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734733; cv=fail; b=S7xm5cQ0BFhmQSBy84yUhSO0xlF6DrxCPqHfsSzQn5OUlJ1JXpyJ4wHIuGKMjaSZUZlEwE3xlKkln31BNsOMu0lX1tyb5AbhO0wUlCr8Zi+jtm5vOSmxU2Zd4U2Vk0IORp7Td8QmrRyqP2zdm+/L1q3wuj9ffaVkxWmZ/ydsX7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734733; c=relaxed/simple;
	bh=0/ekls1IHxuwCikY4cbWPb/btKrv7dyHvO3nQFSsCEE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fk8cO0TScExlR5a2C4Vt7E9P0RevX6dASuGGKm/dzEfdW1/M79X5xtRFVlku7m1QQPV8tLafVhjEkyD2N3z0w2ecKxfkMDcLI2aNT9+LvK1lcUhye6ElKl62xOjdID4Dko9AK4tEl8xJ1R6VrP/1B/byWxplCgSKqBwnCXAn/KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=D7SfTfkh; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="D7SfTfkh"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDafPV3771039;
	Wed, 22 Jul 2026 15:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=0/ekls1IHxuwCikY4cbWPb/b
	tKrv7dyHvO3nQFSsCEE=; b=D7SfTfkhTXwfaiB5UVjGjWjm1An1qfP+cRFFG9jD
	7cOHbmmTBWRauFPheByDoxHc9vDVeIJCOl6E11rH5IGljZt1E9KzSz96jzTzwVBb
	+PsZ9a4IVaDdhJcmcWxjeIV3yDElLlRWWUzv9EeLosRpANXG7sfkJusCFP3mRR3n
	SO+ShASSkVUPZHKtxMMFxJoULqilzHNwppLAk3bmzXiXiW4qkI9qvUZD+dzP8gEw
	wz+03qEXNl6oLR3PNwVFQAAzSxYXR2Nun6cxvQm4bQ0tWBJ7tPwtmGWI8vN5ONYw
	Rr/Pzv+4Y2jm65v6wd+4rvDdHqNk2yx4/66hN4NOL9/Ffw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fjxcq9ysj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 15:03:42 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 33863800200;
	Wed, 22 Jul 2026 15:03:41 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:03:36 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:03:36 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 03:03:35 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAQGmj9in1ghJgA3ezMvZJfb2OTdOv+Si9a7PfnxdrBErHIpnH9H0yQqd9sGeEr5+puZ5FbP8ekgvgy9usZ4JbbSss0omPFYgODvoa40TZ13IP26P1+hCQT69Kt0MJr9vR+7mko2Ad9jlYIEWdh7C6RoTVquoOcBkG81vf5Ifi/hB+J6CIzFL7hXxV0aIbGQoNxlz7dO5o4WVFU273VV45cRuojbgbkCqkl95Vt0aRMiIU8+4oZ22OgfUIq6TdMTXrdmqgfPDm7z3BqgDXUdgRpsMX1T/wgQl2bjbQFeTIPX2Rko31qoe4Q/7ujZtQg5fTw8qQvhqg4LQeGBByj9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/ekls1IHxuwCikY4cbWPb/btKrv7dyHvO3nQFSsCEE=;
 b=PuMbEItI1IyIjvrqRp8KhFRls89/NwNy8ghEbA935Pd3Pwv1M/NKnXm+3SDSY4RqK23aasjFpnGUiBFJQzQPofh6RSzkZtvqn+jHPIctTYp/0OX1XmozruuCxARK/iJm3ztNoimPViG2YH5G1NQaK9BBi0Qu32ORYjDNQFpFYGRg3YE3+8+KRfagHteNOiqTH3MwK7ih3TQsQlch02ZOM1SzAY6Jxphdnnemd8dVjmKdr8uHzIy5MJpWB/ifIXcnu4wJb0tPZlB45qvRW+2qX3zYBNnpcU4NmUaovn2ZSbpOXz3HXo9LLcIOzV7kwbQe1eEJDmJ26lzrcQGmigNDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by BY1PR84MB3887.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:4b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 15:03:32 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 15:03:32 +0000
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
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 0/2] hwmon: (pmbus) Add Analog Devices MAX16545/MAX16550 and
 Volterra VT7505 driver
Thread-Topic: [PATCH 0/2] hwmon: (pmbus) Add Analog Devices MAX16545/MAX16550
 and Volterra VT7505 driver
Thread-Index: AQHdGetDSE53xtyt1kWeuaamoLeJMw==
Date: Wed, 22 Jul 2026 15:03:32 +0000
Message-ID: <20260722150324.164799-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|BY1PR84MB3887:EE_
x-ms-office365-filtering-correlation-id: 90a34bf4-316e-4e11-3d8c-08dee80265a7
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|6133799003|56012099006|3023799007|18002099003|38070700021;
x-microsoft-antispam-message-info: Yh2YHRjK87ZXbs+YFrfacK7ZsYE7VYmsnR7rQrfMfF/t36Z3D0I2TuKECRtDOL8TMDfWZKb9aYYnKn/nQ1GGFlK0pF5817DUlTfyq0dmgKc8Al2D8Fl+VD+J9xXHwkZxJ5eUolnjMM7KrclQaaNjGyic9sXxae5BZB2d0l7Nu2ggNK0g4LhBxwCwqsABG94VmrSyY4UkNj7a0cUYFv/MuiZYeQZXjfEBpWhAsB7gkb4rUNGS7au114mynxY44rEt/OmsEtu4p/OQJLscksEm2tffKkkRqAxDwtqVbcPOkMHC1c7Sskgbzy2VY4PzhXxzmIdAiVCPzIRzOOjBoph0yr8NrhdMElGuYSrKFHggTTi+F51aYW84PieyADjw4BRLi1iuYt2aWMIN1mb0TsNtJ1zXMZEjLhK6O6C9ZG9NkOQtiU3zgjEYqy4oSvL5IgS6sR6eNkhbzwNR00yqxglZ74MLHfAihJivdsAMYFtWHtjZ4MrR0/4Zi/beLVlefeBbmJD+ViXnXB0wIW/BvthWz+U6rIxePc2zH5OHhkwHeM7cKVBa2lqh0g7NI8nPWW74tdjWuCrYPWW0ZVH3QQAuI1bd8gNtWnHBvwcSlUHFBpxx7248uZWX1e8q9cLzfYR/UeJiDoe12RuvDS/rU6l5FN2Hg4pFzdPIIpetIcXpLLXixyIdDL4ro83i6sZ9yTQ0nrOQiP6yz8HFs0p/c4590WHcGK1MkFEBsjgn1Fyx1Eo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(6133799003)(56012099006)(3023799007)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0ZJT1pweVcrd2NJVk02cEpQMjJSNVoxbUxQVGp2bmpkcHlHeUhjdTF3LzN1?=
 =?utf-8?B?cU9JektkajNkRTlSRFdXZDMxNGROd3F5UWlZTFR1UjlyaVEvVnJqQWx5eUlC?=
 =?utf-8?B?UFlINWNiMFNaOHlCQ2VpVnhQbXJqZU10d0RGWW00d1NYbGRDRkE4Q1RNNS9P?=
 =?utf-8?B?MFFtU0xxb1VkeFZhT2gyam8zQktvZ3NVV2RsZnNhTFo5OTZzcTJXSU1VYXp2?=
 =?utf-8?B?VGtvaEZYM1QzK3VhZFlHYm9DelVlbHVqNlQrM0hucHZGRFRUd2RhNWpZK3d3?=
 =?utf-8?B?VUNZRmJseTZFN1k4YklTS1pCN0lvT1JnS2Q2OTgzazlMSXlPRU8ybVBkVTh0?=
 =?utf-8?B?dC94TjhCNDk3Z1FHL3pWdHlpSUVIVXp6S1Q1R2ZSRWRYa2dFVGd3Z3dXUjZY?=
 =?utf-8?B?WG80bnJ5eUlpVFRTWnF4M1I1MEZZYVp4MTdiU2ZpcmRMTHYxbzdMZGhyS3l0?=
 =?utf-8?B?WklPVkF4V2VNWFhQckp6WXBkOE9PRGVrMzU2bmxrR3B0dVBIOEdBVkpmY2Rr?=
 =?utf-8?B?SVFQWksrRDIxSHJBZlBwSXNuc1BJQlBQQ25JSm8za0w3M04wK09sdTlHbEo0?=
 =?utf-8?B?QzdPc3dmb2ZORUVoYUhhck0rTmVHSjdLdEFhWkNkRUxhSFpKSXhDN2pIOE1i?=
 =?utf-8?B?eUxiNytyL0k5bnVHV0hOV2pXSVFmV1g3bE1JdTg4RnNkc2ZtaDNqK3BCVnFz?=
 =?utf-8?B?eERsZ05lZW5KdGRPNlhlWkZRNGZnbGZSTGo5U1E2VkViQndDMDZNOFNMN1lP?=
 =?utf-8?B?YXBsL1hzSHJLSUZ6RkNRTnJDSDZFM2VmWTVRZnRkOWJIdU1TZXNYYVY0TVg1?=
 =?utf-8?B?OXNVeUNOWGZPcE9KTnA5bHFaZE1IQjJDbG1QQnh0Q2JrSmZOc1ZJaHFkOVhl?=
 =?utf-8?B?bWdrTXBoY3p6bmtVZlFRNCtxOGorMk1PV0RzOXptQmp0eUc4NS81WENxYXZo?=
 =?utf-8?B?UTRGZ3dDSk9Vc3B2OFlnTTRhNlBMcDhndUxiVzN0MVJBMG10T20zU041N1JM?=
 =?utf-8?B?ZFFMZy9ybU9tWmR6QjhQNGhHVzB3OHppblkrT2I5eVROWnZ5bmZXUTJRYXhE?=
 =?utf-8?B?ZDgwN0VTRXUyRGNrN2xEYlgvMUU0UWM1MEwxc2RqZmxiQW9VSTBkM1lQVjlQ?=
 =?utf-8?B?UFEzSi9oYis2OE05Q1Y3SnJ0a0JiL29xemUyQlVweXB6bjNta3l0UnI4Nnly?=
 =?utf-8?B?YVdOVHNxOWplYmpZSnN6YjlEZktXaWpGRUlCNit4VDRtVVJScnJxUXhHaWEy?=
 =?utf-8?B?UlBIMDdJYmlUcCtSUm1oOEF3QXkwZ2M3SWt1VkEyRnlJSjRnbGQ4c0ZIbFJu?=
 =?utf-8?B?cmQ2aVVqdGVQK0hRVFVXS1lrQnV4b1AzVHlRV2g2VUlsak5tU05wRkh2MjZm?=
 =?utf-8?B?cTU2MkxmdDVaM1h0aXRmRWUzenZOcjB0RTh5ZHdLUFMzRW9veVlTaGVHL3dY?=
 =?utf-8?B?WkFRSGZNbmI2MzdZcnhaeVB2VHRRNmF3U3d2VUJnc3EydnpVS3ZYU2ZnbVlQ?=
 =?utf-8?B?aTlSNHVIekc3MTdLbEhscXhOYi9Ja0k4eXE2b0ZFcnpRaHdNaVBLVTBRazN2?=
 =?utf-8?B?WTRkZzcrazU5QXAyaVVFdU9FVXRWNW9YSGxTdEdLT3BKaXUxbzhYdXNPaG8y?=
 =?utf-8?B?K21KU0hwWlkxVG9aVWhlbmhscURFM2FoVW4rWGlzNlR4Q0RXenJJOUMzSlFU?=
 =?utf-8?B?R0luV0xQSzQyK25mckRGdDJlYUZrZ0IyNjk3VmxCR0pGbGlkeUZDTTBxYStK?=
 =?utf-8?B?eGNydkQybVUvMHZ3RmJTSTRwaGVHZm01N2RTMEJxd1FVRzFBcWgwTllsTDNh?=
 =?utf-8?B?ZjdsNEFNYVhTV2p2bzNNQklRMDNFVVVmK0RmZHFzK2xNS3hqSmZSOVI3YkdV?=
 =?utf-8?B?VHUrUWpVRUN4bFBIQXA0WnloeGg3MWNHeTlRRFQ4a0o4N2FDZFAvUmRWQ3U4?=
 =?utf-8?B?WlhuSUxHQklGUURCcGNoZVl0RElLWkphVzIvYTYrTU1pUHVvMDlVcEV4Z21i?=
 =?utf-8?B?MzlpS1k4Nlo4WXVFc0tjU2Q5UWl1ajRPZEZ6OGFTOWVIQ3pycTZwKzlmQWkz?=
 =?utf-8?B?aURrV2lJZjVTTTBwZHNOK0EyV3c1MDN5czArSVp1b0s2U1RGMFZRbkh3L2Ey?=
 =?utf-8?B?QU1tZFBoYmN1Y2ZLdWlYNE1BdWtYaWdDSlVncHA1dGRUWWZleU03S3oyZ1pM?=
 =?utf-8?B?aVFHU0ZCMjVJcDQwR1hCZFR6NUZvY0VCQ0QxdngzbXpnZHVwQmZxOFpheTE0?=
 =?utf-8?B?QlllZmNLQjZ6RDFabHZGeEJETXM2QVd0aldzSmVseHlpSlhQbTZBQ3duT2Jp?=
 =?utf-8?Q?yqIkTm0Ryhd2QIAqRR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bTmncsrujCA7gT7Vbm5LTYJTCLi3zgf+H/yZMjcrqwZY4KHYfHLjRyc/alywvQK6nkZ6oZP7q84//jaSwDgCDYrSVvYU+YOo17RUZNU8y2eOyvhov5pMuzOI29zOfaXksAmLA6AUzzYsfsIbdFLuu79RfAqhFl7lqdGFjHOvt23wow8ZHXdjtO59aNJGxo5y6QKC42JM4C9EGbpE0ABODBwEtiZ0rKFEtM7Quagq9aYZ8Gxn1hLQ1mKc5CZRw55i90nVWGyPn1IkIiQaeqzVtG7iBzZ4uOccGfY8z4LCXWBMqTZlVRqZ117wD/Vh0ubn6n6FwoXOtWG8cu9aHUxivQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a34bf4-316e-4e11-3d8c-08dee80265a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 15:03:32.6174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjesXwOyxVgWpu6P+N2xYNMBVH+zSACI+pPdodlhZKMMCaEkPgU7olMNOI0AVnNQWMuHrpiYJ3/1PG+8qKHNXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR84MB3887
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0NyBTYWx0ZWRfX/AYeyxY1Mi4d
 XrLbA70hJVmRNe+/x28Ip0KzoZl8WBTq9OjWaDbX0WZYUOEAlZ7iZdPx2ecsJgA8zZI+yAyVp9a
 cOQh3ia2r0sJ1RKTIpaqKdJH6z8bCmc3BvCKUEWsVisF5F7Tbz3UhuJsawx8yb+oYt8VTuqJvJS
 uWz87aqGUQHZVpGX2M9HlKiJOFXBtylJVwzZmHPMTHyPRfdtjhfS8JIIkQ9ZmpFz44pbDrhddz9
 26+A4XZOVxmZL4AU85AT+ZIN2nLlJxuRoY6ZrntkEfEmKVNNJI/3qZrpPN0OSS2JcdDx2of5vYb
 0h58fJKfgh8lrUNMx1IpAC7v9EJW7R+tm0hFQm3CaGLnhbibZgWsVHhYRkTdjwGg9b/lIxiWEEG
 GoWWCWoAGKAsdOgAmDtBOFjs/Mdlne1E/F9raTb6dfuhZblWGnJG1VDv9+yaOeL2lqwcOGqcgkJ
 5IQg1zQnz4w+qhAJ3Fw==
X-Proofpoint-GUID: vVzVKiMAgsowO8KyIuj6LYtgM4hDwfCm
X-Authority-Analysis: v=2.4 cv=IdK3n2qa c=1 sm=1 tr=0 ts=6a60dbce cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=0il6J1_hwJo-EcoPzkAA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: Z0UH8TO7JWxB3x5U4oG96dt_UjTPnnBo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0NyBTYWx0ZWRfXylFZ/F8bi7cN
 V1BU0a5UMxMU0PbLhtnaR3mCElv2ri1Qjp3cZ37WowuzXh/Fm6YEyCwednUfyrmKRzv24PBNPPh
 oHR+ugti0PCHTN5GMkBjGtdqSwre29A=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220147

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUaGlzIHNlcmllcyBh
ZGRzIGEgUE1CdXMgZHJpdmVyIGZvciB0aGUgQW5hbG9nIERldmljZXMgTUFYMTY1NDUgYW5kCk1B
WDE2NTUwLCBhbmQgdGhlIFZvbHRlcnJhIFZUNzUwNSBjb250cm9sbGVycy4KClRoZSBkcml2ZXIg
cmVwb3J0cyBpbnB1dCBhbmQgb3V0cHV0IHZvbHRhZ2UsIGlucHV0IGFuZCBvdXRwdXQgY3VycmVu
dCwKaW5wdXQgcG93ZXIsIGFuZCB0ZW1wZXJhdHVyZSBvdmVyIFBNQnVzLiBBbGwgc2Vuc29ycyB1
c2UgdGhlIGRpcmVjdCBkYXRhCmZvcm1hdC4gUGVhayBpbnB1dCB2b2x0YWdlLCBvdXRwdXQgdm9s
dGFnZSwgb3V0cHV0IGN1cnJlbnQsIGlucHV0IHBvd2VyCmFuZCB0ZW1wZXJhdHVyZSByZWFkaW5n
cyBhcmUgZXhwb3NlZCBhbmQgY2FuIGJlIHJlc2V0LgoKVGhlIE1BWDE2NTQ1IHVzZXMgdGhlIHNh
bWUgcHJvZ3JhbW1pbmcgbW9kZWwgYXMgdGhlIFZUNzUwNSBhbmQgaXMKZGVzY3JpYmVkIHdpdGgg
YSBmYWxsYmFjayBjb21wYXRpYmxlLgoKVGhlIGN1cnJlbnQgYW5kIHBvd2VyIHNjYWxpbmcgZGVw
ZW5kIG9uIHRoZSBleHRlcm5hbCBjdXJyZW50LXJlcG9ydApyZXNpc3RvciBvbiB0aGUgSUxPQUQg
cGluLCB3aGljaCBjYW4gYmUgc3BlY2lmaWVkIHdpdGggdGhlCiJhZGkscmxvYWQtb2htcyIgZGV2
aWNlIHRyZWUgcHJvcGVydHkuIE9uIHRoZSBNQVgxNjU1MCBhbmQgVlQ3NTA1LCB0aGUKc2V2ZXJl
IG92ZXJjdXJyZW50LXByb3RlY3Rpb24gZGVnbGl0Y2ggdGltZSBjYW4gb3B0aW9uYWxseSBiZSBw
cm9ncmFtbWVkCndpdGggdGhlICJhZGksb2NwLXNldmVyZS1maWx0ZXIiIHByb3BlcnR5OyBvbiB0
aGUgTUFYMTY1NDUgdGhhdCBkZWxheSBpcwpmaXhlZCwgc28gdGhlIHByb3BlcnR5IGlzIHJlamVj
dGVkIGZvciB0aGF0IHBhcnQuCgpUaGUgZHJpdmVyIHdhcyB0ZXN0ZWQgb24gSnVuaXBlciBQVFgg
aGFyZHdhcmUuCgpHZW9yZ2kgVmxhZXYgKDEpOgogIGh3bW9uOiAocG1idXMvdnQ3NTA1KSBBZGQg
ZHJpdmVyIGZvciBBbmFsb2cgRGV2aWNlcyBNQVgxNjU0NS9NQVgxNjU1MAogICAgYW5kIFZvbHRl
cnJhIFZUNzUwNQoKU2FubWFuIFByYWRoYW4gKDEpOgogIGR0LWJpbmRpbmdzOiBod21vbjogcG1i
dXM6IEFkZCBBbmFsb2cgRGV2aWNlcyBNQVgxNjU0NS9NQVgxNjU1MCBhbmQKICAgIFZvbHRlcnJh
IFZUNzUwNQoKIC4uLi9iaW5kaW5ncy9od21vbi9wbWJ1cy9hZGksdnQ3NTA1LnlhbWwgICAgICB8
ICA4MyArKysrKysKIERvY3VtZW50YXRpb24vaHdtb24vaW5kZXgucnN0ICAgICAgICAgICAgICAg
ICB8ICAgMSArCiBEb2N1bWVudGF0aW9uL2h3bW9uL3Z0NzUwNS5yc3QgICAgICAgICAgICAgICAg
fCAgODkgKysrKysrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDggKwogZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnICAgICAgICAgICAgICAgICAg
IHwgICA5ICsKIGRyaXZlcnMvaHdtb24vcG1idXMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL2h3bW9uL3BtYnVzL3Z0NzUwNS5jICAgICAgICAgICAgICAgICAgfCAy
NTkgKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDQ1MCBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3
bW9uL3BtYnVzL2FkaSx2dDc1MDUueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vaHdtb24vdnQ3NTA1LnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcG1i
dXMvdnQ3NTA1LmMKCgpiYXNlLWNvbW1pdDogZmE4ZmY4YmRlOTIwNzUwOWY5MGFkYWNjMTU3YjIw
OGVlNzMyYWRhZAotLSAKMi4zNC4xCgo=
