Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AB44A708;
	Tue,  1 Sep 2026 21:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297150; cv=fail; b=KYOXSjyYkr0/xP9Gu+aTFex2kJcH6/rjYPsVlXp8lklttyexS/Im3Cuc1Ah0CQNILHYkvQvjEzYCKo8p+gI6mHsAKgB28fh+IVIYPnIiJTFb/Z5m6S7I77zEoQAUmyVqajhlXVR+0l5/L0dI7hNPzaTWE9NfrtFUDuWHcPhQAuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297150; c=relaxed/simple;
	bh=zCulbIAhWoit1xRPR0PyT6RchBzPsO1Hqj9NvAQxMxE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XFecO04PgP83cEq3OlV9gKWBFXs28HLJnAeF2Vabo0izWOx9ZmT4j0YK3eYPcZqqJYMxaOO36ezAyMKxTw5yesZVrqOVIL7WY0CAkZRcG3xRrS7uCxMCJimk/q/OCHfKyxm+WNJvcsdHNMF66uSBBIjmNS6Olgc04h82Ir9MfBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=pZoGESME; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="pZoGESME"
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KaHxM050138;
	Tue, 1 Sep 2026 21:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=zC
	ulbIAhWoit1xRPR0PyT6RchBzPsO1Hqj9NvAQxMxE=; b=pZoGESMEHFAe+jJlKH
	ksqStZexfyAL6QwBbxNE0NeV/Vsl3eYXODj7yPBqYFJSukM2shI6t5KCTZT2yX8v
	l4YLm11RO5wz7tTST/F0NzTwDqLyDHTPhnRbvnR2F0kThUcqfin4AN6WV+rDPXQO
	gtpp8YqmXmkXwCuAoCgEKsaZEfvM4QOadKeNgy0kC7BZlZ5W6ifKDCjerROMszuJ
	s/ubNNQ9e/ZoYxVgz7F48TXxp0lYq/DshMcWTj19vRyb6zUy/JlM0sQCl66R1awM
	aZdf5f7DYUdHcus1lZWNOiHJ6g5FPdJuLt+rFZCBEYEWq/CprjzKDtnlI2JF94EQ
	JZKw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ge0t4mxuk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 21:12:02 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id ED71512B77;
	Tue,  1 Sep 2026 21:12:01 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 09:11:55 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 09:11:54 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 1 Sep 2026 09:11:54 -1200
Received: from PH0PR07CU006.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 09:11:54 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzYOeEWPfii1Yr9M9goRp2SRsy1nYjmQjm85l6b0mImwPWYji1P2FzYISLMXljzsz06EJHJlTfhS5DUI5dMshsigtcqa/GxE8/T7pfxP7dqiwR+SeXMr9IOHkq1GQs45CgmbO2w7UbBRyCMGueDcFV5JhLjs2mlyc9cQ+Rc4w0wB42P5wX6tAN8KDtLVAqOo+XlIIbFsdH0YeZ6EB9iWSgV534/IWqidph0hBHIsKUTZYra4oYyoY4GSfmvoaOpfrBTtCKHIEAb2b26so87MMqUY6wKcMPJYfJYwu+n4BOLG9ufYjOYGMy9qmkSPRscmlIaKVgq1EPFQARK7fC9pIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCulbIAhWoit1xRPR0PyT6RchBzPsO1Hqj9NvAQxMxE=;
 b=PcLz9UamSwtzXrGP4L/eQUv7gjfcKmr/+dDzoyWa34lINRovWntH3rIvf/37DMsDZFH8v5pkoLTRhGnR8q/gOlgAkL8u9mhrXphsgOsd17/0LVW45LmlMv/VkaNok7/+zZts/YREkiU9t/MbVhm/7qIiva7ROtYsx1Gl30baGjqXw/0Y2lYs8Q6nhRrahXuk0Yu3XQjUD+yRmy91MaEl0eIPlZ6nVYGgJrrqjPPcJ050e78nsboWCEsUSsIWJrLSo8LfcSK6BivHfz5d083yLQMqA0Li+WWlxgrpToNAqU2D4fIcCsw5kZV2C+zU81rZcbyixwiwz5+FLijYEgn2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 21:11:53 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:11:53 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622 and
 TPS53659
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622 and
 TPS53659
Thread-Index: AQHdOlaD7eWZYeN800eANwUkwa+U8g==
Date: Tue, 1 Sep 2026 21:11:53 +0000
Message-ID: <20260901211129.360792-3-sanman.pradhan@hpe.com>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260901211129.360792-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1664:EE_
x-ms-office365-filtering-correlation-id: 0e2c5c0c-dc63-4374-bb01-08df086da5a9
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|3023799007|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: Q+sEIQblpuZ4cJezp+Gb5uy2EXe+xzQI+pa/DVWVD3qJTD/v1a6PkQGlQJ9C+r4WnDjBTRaAB9PjyiTYApOHC498Uq6KwGsgHDXmecZ9BViGVgWiKIFBAmdCmEwnLzc2rYJjQsvSQvbziq/rbdH5GgNCm0qrAK9eSGtGjyBo/VrgesJcAni1d2O2bwFT0iIJrI2j1BNIZTwjApsx/d8L+AJ9dzGBXsb27oRkWZQBQ6uWWLbtZqpFkS2tVlt5fyynn+ePT9YiwGK/cvX2KL4y7Wsd16BYAHZ4m/iddegasvR+lE+TK1ZvN3FcvVKZQqzMAfiVSp/+FvV3h3O1btZ/SS39R7LBLU4JJeklDhG/5axGu/IGrFvs/mNLHP7Xx1+twAOIJd5gG0V6u4eNldB5AqJh7atOetDcnupNZEIeJesjyGVqEdiASEgZgOEetWHdLf6QHW4WelALDaj+fDRHt41ztwxQG1YUBYWjIBC2kBJoa6L8/+zAYzUuO1/TrW64C+1F0uPPZpUIJXLbqTg9HPUQ9LAEGrKnbB840YUbZuGqEVXZAV4n9/3OG9SQwzQDd6qK9UVKbHAEjZz8/n/DT4WodjoC/K6nWK0You0DNpgFBjeb7G9IGlee0TN7HomiAtrfb5Q0bNJpRpp3cCZOlatuzBX8XCxn0ak8SIcEv4PhwRgCKui/qmXzrzJz/p1E0byItE+5tOtR94YYFGqyFn/6EZ4Grnw8kVTjHBhTWXU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDFudk5Obno4N1EzemNZemtZRjZUM2EvRS81ZWkzOGVZaVMzNDQwQ1pTeHVm?=
 =?utf-8?B?YndoQ2J6b1NmblFMYWk0L053VGxKOC8zbG1ndm8wRTNieHZaVGIzNk1UdG9Q?=
 =?utf-8?B?OHhXQ1VQNytkOGJHSVlINXQ0bE5CcjJOME9Yc3NteDVybk8wVHNIbURQalI4?=
 =?utf-8?B?cnkyVzJoYjRHaEZrQ2kySGowdzZ6Tm9IcTJ6NEhkSDc3YTFsSGtyaGR3N0VR?=
 =?utf-8?B?UTdYUmVoSDROcnVFdENSZjlHNW5NSXg5Q2RNUUhtWGlHUHRRc0V1OE1kS1VQ?=
 =?utf-8?B?SDU2RWg5ay9idUwvckF1MEJ3aHZaL3ZzeFJlUUo1S2RLMFZXcTJPdExjaHBH?=
 =?utf-8?B?VERMbGlVQkJtVkZqWE5KRm9KMEVVR0ZrOUZUWERYVGVodWQ2Rm0yVWF1dkNo?=
 =?utf-8?B?SWlkbTMxYm91bk9wSzVLZXZRNG5uN2hid2NLR21nVG1EWEdyeHNBckxNbGpK?=
 =?utf-8?B?WkVpOWtGY3ArWFlkTndvSStpK3hvTzJibDl0bTlQVmtnNU9OblVEaGdEL0dK?=
 =?utf-8?B?Tlp5K2VuZ0VHYlArclJXTytWSGpvY1A5OXQyeUk5bmEyT1Q3VGhuSGI2NzMr?=
 =?utf-8?B?ODJTY1JSZnpEbGJCdEorZTlybHJWeWcxSjlEclVpUzc5V0lMY25rYk5nUVEv?=
 =?utf-8?B?QlhnM3VTeno1dS9GUEVybGFhZEx5RzZaMWxqTkxGcG1UT1JETHF5MDd2dFpG?=
 =?utf-8?B?RVFkVDZQRTUwSzJVMC9VQ2o3MzhKUGZReko1RGlaZXRMTXI0NmU5Zk4yc0tK?=
 =?utf-8?B?NUE1Rnc5aktaNkdNL2JWRTZEY09uNHRqdEJqVTZibnkyRklUYWtFckJDY1ZF?=
 =?utf-8?B?S2paam5uaXdEL2lNY2laYzlvUW5LSTJvelBHU2doRjdSdEhqcnNYYTNwNDYy?=
 =?utf-8?B?T2VVcWpLNzZleitIUFVpS2dkcVF5bFpYVWoyY0lMZmkvaTBJTnBseU92d1Jx?=
 =?utf-8?B?bHMybFpVVTZUMkVzVWdwMUZiV1IzR0JTREhZemFvL013Z3JQMnZyRHhtVDdm?=
 =?utf-8?B?Znk5WmorQ284c1ZDS3UyczZoeGVzRks2cXd3ZHBZWUkwSlMxbHlGZTJZckRv?=
 =?utf-8?B?WGE0clNnMVJ6cklSbW5jWVE2b2EwSENOVXNHWlFHSHZxVlhxd3dvRHVyaFpp?=
 =?utf-8?B?UFN1c0NYRDM0THJiajRWRDN5Qzh1TEgrclpXN21nNWFMZXR1VzFWTk5wMDA2?=
 =?utf-8?B?d2lUa0J1R0tQZUcyWTNsbUtrNldKSnJhNk03YUJhdnYwVC9LV1cwenhiNDRM?=
 =?utf-8?B?NXEvWWlVNjRKaWJTUFZPOWRBVWg1YnFRYzJmUm9BdmlkcmZiOEdDSzdLc2N2?=
 =?utf-8?B?L2tJVDZuYWJKR3JpSnVSN3NleWtsOTRobEV2MVh4L1MyUWs0UnlrTG1lVHdo?=
 =?utf-8?B?L2FiV3JsVEljS1RhZmdCcWd4VUdsQXpnM3MzUFNlVFplT1plcGxvenhKTXVM?=
 =?utf-8?B?LzVpbDZqbldUUStUZHA5VEZwVkdJZjErcDlnOUk0NEo2azlpKy9Yb0R2My8x?=
 =?utf-8?B?cWErK1Y5N3NJVHBPQ0JSODhFZmo3a0JjclNkRXNzQ1djL3pZSGNQQXBXL09w?=
 =?utf-8?B?b0s5KzVINmIrcTRtMmV6YkVoREwvdVVQMGp5YUYrUDZHekdGb1JUTm9kekxY?=
 =?utf-8?B?UGRQK1ZSNlZZcGxKakc5b2dkQnJkdXhRY0pMODRxU3ZPckpkNzVNWnI1c1B5?=
 =?utf-8?B?N2diWnd4ODFaK1VjNUpxZ0RiRlFUMmNMVG1ZVGRpWVRGZFBGdWxPUEliTHE5?=
 =?utf-8?B?bEIvNnhkSG1VcU12YUJqYnRuN3FHbEZYOHNHVkNQQ2w4SVJKa24xY0VaM0VS?=
 =?utf-8?B?YmhYMFFSMjFmUjRNYXlpU3hlUkEvYVdFZVk0bmlBN3hGenhEQWduQjR5eTdu?=
 =?utf-8?B?cUVXQWpRY3YwOUxwTkhjcTVLdnc0c3grdExLOVEvaHlsTVo3dy9qRlRKQ3lC?=
 =?utf-8?B?MkY5VklrYUdFQU1DNmdLS0N0Q3lRU0xxL3JmdFVLUThnYmtkWEl5cHZJVFFK?=
 =?utf-8?B?cjMrb3AzMnJ1NkgwUjlteGp1aUYrSUVsZFhKMnBWeXNsdVR1V2JPZ2ZhS1lU?=
 =?utf-8?B?RjFLNE5mekI4dHNIRWR6MDRDcHZJSEoraGFUY1lxTTJQVXlRU3FoM3lSRVlx?=
 =?utf-8?B?SUttZmlFRS9STHMyQzJxLy9UdGJzNEZBQ0VzK00vUFJQMFpEZVZxZ2V4bG1U?=
 =?utf-8?B?VTV6djBnRU9GT3RkOWw5K2drbWFQZ2o2VzV0UjBFS0dsOXdRdVdMc2pqVlh1?=
 =?utf-8?B?K3g4NVlvaGpKamdVekEyZ1ZNN0k5bGQwN0txRkFOekphMGF3VEJNbVlMSElF?=
 =?utf-8?B?aUxWTktWRFpHbjRrRjhKcGhtZmtEc2FaVjhnd1dDbXREQ1p3SSsyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yD0moMvrs6HVBCfnIDN5NWCsnA746AjL5EVsGReaWfqS8tl2ge5CriS+yhz3U2tKmRdqOpAzlGfW8oZbRHPvpWzBAyAH7mZ/O+ZGhxiQ3cNTuzzNeLe83sfQk2IcYdZQptSl4cQqtS3WxoxZ/g8fIGNymxf2Sbti0xie1OKIdQ9AhdSL17qvQr7+RiEQJwDcg6lM8Cyv3CBEqAhQ2rmw3KO8ZmB5MXM0aiMyRfCJpHYstQti+8IsHOVHbhxUxfnvIzTt9kmD1QQCS85qx44wvaM9kPQPLA6MhWUTRxteT7PoamYsDMQIXZnlopjh1j4nE/5v/LHOdNlq7NLHNGEi7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2c5c0c-dc63-4374-bb01-08df086da5a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 21:11:53.3295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCmmiFNeTplTvMM8hNeEWMlVptcmB+gQIAybmyD4aOD+usyuCuOiQuNl7m3TaNRtqN609MvzLTP4f+k9F2C8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1664
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE4NiBTYWx0ZWRfXyUUe1nKO8Bo/
 ZqOKrjT/FMKsi1EKYZAl+hIyVcmdMzU3ksY5XbiIAfgKyyEw37dfFFJoLf5IWp3RLgr/BDZ7anW
 f5uNonuhYmJAouTnEEeXCBlb4uw/AOlXGz4/JdK4QrSruZd7UgLP2nq1nlJBVlU8IFfBc7Vkjnw
 xWPLu6NrG/WuzO9tLiwLktjRauRURrchitlK9q99kh2yde+A4s0A1vpoxoIoZXdDM3CBru8QkuN
 zFLCaERLbGKkn23UbJoNrdjf4PzRBHPSl6x/ddN6CuHt8Pd3TBMwqxwBGa7ZeILJYX20sjOZwX+
 dWiER16DkNB8qBQ+xrhzOcRnY4JlN3Vp5/DLgZNamGpeTJGW4m6qhoKoL7sP5w6vVZOrS5B5OgV
 vVrES6Nd2orLD+E6KKLMo3zK1zxB7tKSYIWoB3SKfL2uo6FA1TpyFtgXOxDKzJOrItYFGZothy1
 oJSxNDYUEwbAs9WOmyg==
X-Proofpoint-ORIG-GUID: SEO26HwWqquzD-dNeKdEIBFIMUWeKto-
X-Authority-Analysis: v=2.4 cv=SvagLvO0 c=1 sm=1 tr=0 ts=6a973fa2 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ModqzXLkJJ0tFyq98apW:22
 a=sozttTNsAAAA:8 a=OUXY8nFuAAAA:8 a=2xm8aHGRjrEz6Na0jTkA:9 a=QEXdDO2ut3YA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE4NiBTYWx0ZWRfX8UCPmLVqafU8
 8c/LF5B6MKddF/5CatAucwkm4mvSrPMd1dS+M4SPGjR5G9316gt8wR0sDb5AmKfGKlumDGl6EW/
 6fhinuL8KxdAOgxzoSlKq0Ja4pyCs8I=
X-Proofpoint-GUID: UQFKEgSdGAwhis5iAQNC0aWW9Yq4gmSM
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010186

RnJvbTogU2FubWFuIFByYWRoYW4gPHBzYW5tYW5AanVuaXBlci5uZXQ+CgpUUFM1MzYyMiBhbmQg
VFBTNTM2NTkgYXJlIGR1YWwtY2hhbm5lbCBELUNBUCsgc3RlcC1kb3duIGNvbnRyb2xsZXJzIHRo
YXQKdXNlIHRoZSBWSUQgVk9VVCBmb3JtYXQgYW5kIFZPVVRfTU9ERSBpZGVudGlmaWNhdGlvbiBs
aWtlIHRoZSBleGlzdGluZwpUUFM1MzY3OS9UUFM1MzY4OCwgc28gdGhleSByZXVzZSB0cHM1MzY3
OV9pZGVudGlmeSgpLgoKU2hvcnRlbiB0aGUgS2NvbmZpZyBwcm9tcHQgdG8gdGhlIGZhbWlseSBu
YW1lIGFuZCBsaXN0IHRoZSBzdXBwb3J0ZWQKY2hpcHMgaW4gdGhlIGhlbHAgdGV4dCBpbnN0ZWFk
OyB0aGlzIGFsc28gYWRkcyBUUFM1MzY4NSwgd2hpY2ggaXMgYWxyZWFkeQpzdXBwb3J0ZWQgYnkg
dGhlIGRyaXZlciBidXQgd2FzIG1pc3NpbmcgZnJvbSB0aGUgbGlzdC4gVXBkYXRlIHRoZSBkcml2
ZXIKZG9jdW1lbnRhdGlvbiwgaW5jbHVkaW5nIHRoZSBwZXItYXR0cmlidXRlIGxpc3RzLCBhbmQg
Zml4IGFuIGV4aXN0aW5nCiJUUFM1MzU4OCIgdHlwbyAoc2hvdWxkIGJlIFRQUzUzNjg4KSBpbiB0
aG9zZSBsaXN0cy4KClNpZ25lZC1vZmYtYnk6IFNhbm1hbiBQcmFkaGFuIDxwc2FubWFuQGp1bmlw
ZXIubmV0PgotLS0KIERvY3VtZW50YXRpb24vaHdtb24vdHBzNTM2NzkucnN0IHwgMjQgKysrKysr
KysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWcgICAgICB8ICA1
ICsrKy0tCiBkcml2ZXJzL2h3bW9uL3BtYnVzL3RwczUzNjc5LmMgICB8ICA5ICsrKysrKysrLQog
MyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vaHdtb24vdHBzNTM2NzkucnN0IGIvRG9jdW1lbnRhdGlvbi9o
d21vbi90cHM1MzY3OS5yc3QKaW5kZXggZGQ1ZTRhMzczNzVkLi4yMjgwZTA0M2M0ZGUgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vaHdtb24vdHBzNTM2NzkucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vaHdtb24vdHBzNTM2NzkucnN0CkBAIC0zLDYgKzMsMTQgQEAgS2VybmVsIGRyaXZlciB0cHM1
MzY3OQogCiBTdXBwb3J0ZWQgY2hpcHM6CiAKKyAgKiBUZXhhcyBJbnN0cnVtZW50cyBUUFM1MzYy
MgorCisgICAgUHJlZml4OiAndHBzNTM2MjInCisKKyAgICBBZGRyZXNzZXMgc2Nhbm5lZDogLQor
CisgICAgRGF0YXNoZWV0OiBodHRwczovL3d3dy50aS5jb20vbGl0L2dwbi9UUFM1MzYyMgorCiAg
ICogVGV4YXMgSW5zdHJ1bWVudHMgVFBTNTM2NDcKIAogICAgIFByZWZpeDogJ3RwczUzNjQ3JwpA
QCAtMTEsNiArMTksMTQgQEAgU3VwcG9ydGVkIGNoaXBzOgogCiAgICAgRGF0YXNoZWV0OiBodHRw
czovL3d3dy50aS5jb20vbGl0L2dwbi90cHM1MzY0NwogCisgICogVGV4YXMgSW5zdHJ1bWVudHMg
VFBTNTM2NTkKKworICAgIFByZWZpeDogJ3RwczUzNjU5JworCisgICAgQWRkcmVzc2VzIHNjYW5u
ZWQ6IC0KKworICAgIERhdGFzaGVldDogaHR0cHM6Ly93d3cudGkuY29tL2xpdC9ncG4vVFBTNTM2
NTkKKwogICAqIFRleGFzIEluc3RydW1lbnRzIFRQUzUzNjY3CiAKICAgICBQcmVmaXg6ICd0cHM1
MzY2NycKQEAgLTEwOCw3ICsxMjQsNyBAQCBpbjFfY3JpdF9hbGFybQkJSW5wdXQgdm9sdGFnZSBj
cml0aWNhbCBoaWdoIGFsYXJtLgogaW5bTl1fbGFiZWwJCSJ2b3V0WzEtMl0iCiAKIAkJCS0gVFBT
NTM2NDcsIFRQUzUzNjY3OiBOPTIKLQkJCS0gVFBTNTM2NzksIFRQUzUzNTg4OiBOPTIsMworCQkJ
LSBUUFM1MzYyMiwgVFBTNTM2NTksIFRQUzUzNjc5LCBUUFM1MzY4ODogTj0yLDMKIAogaW5bTl1f
aW5wdXQJCU1lYXN1cmVkIG91dHB1dCB2b2x0YWdlLgogCkBAIC0xMzUsNyArMTUxLDcgQEAgaW5b
Tl1fY3JpdF9hbGFybQlPdXRwdXQgdm9sdGFnZSBjcml0aWNhbCBoaWdoIGFsYXJtLgogdGVtcFtO
XV9pbnB1dAkJTWVhc3VyZWQgdGVtcGVyYXR1cmUuCiAKIAkJCS0gVFBTNTM2NDcsIFRQUzUzNjY3
OiBOPTEKLQkJCS0gVFBTNTM2NzksIFRQUzUzNjgxLCBUUFM1MzU4ODogTj0xLDIKKwkJCS0gVFBT
NTM2MjIsIFRQUzUzNjU5LCBUUFM1MzY3OSwgVFBTNTM2ODEsIFRQUzUzNjg4OiBOPTEsMgogCiB0
ZW1wW05dX21heAkJTWF4aW11bSB0ZW1wZXJhdHVyZS4KIApAQCAtMTUyLDcgKzE2OCw3IEBAIHBv
d2VyMV9pbnB1dAkJTWVhc3VyZWQgaW5wdXQgcG93ZXIuCiBwb3dlcltOXV9sYWJlbAkJInBvdXRb
MS0yXSIuCiAKIAkJCS0gVFBTNTM2NDcsIFRQUzUzNjY3OiBOPTIKLQkJCS0gVFBTNTM2NzYsIFRQ
UzUzNjc5LCBUUFM1MzY4MSwgVFBTNTM1ODg6IE49MiwzCisJCQktIFRQUzUzNjIyLCBUUFM1MzY1
OSwgVFBTNTM2NzYsIFRQUzUzNjc5LCBUUFM1MzY4MSwgVFBTNTM2ODg6IE49MiwzCiAKIHBvd2Vy
W05dX2lucHV0CQlNZWFzdXJlZCBvdXRwdXQgcG93ZXIuCiAKQEAgLTE3NSw3ICsxOTEsNyBAQCBj
dXJyW05dX2xhYmVsCQkiaW91dFsxLTJdIiBvciAiaW91dDEuWzAtNV0iLgogCQkJdGVsZW1ldHJ5
IHN1cHBvcnRlZCBvbiBUUFM1MzY3NiBhbmQgVFBTNTM2ODEgb25seS4KIAogCQkJLSBUUFM1MzY0
NywgVFBTNTM2Njc6IE49MgotCQkJLSBUUFM1MzY3OSwgVFBTNTM1ODg6IE49MiwzCisJCQktIFRQ
UzUzNjIyLCBUUFM1MzY1OSwgVFBTNTM2NzksIFRQUzUzNjg4OiBOPTIsMwogCQkJLSBUUFM1MzY3
NjogTj0yLTgKIAkJCS0gVFBTNTM2ODE6IE49Mi05CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdt
b24vcG1idXMvS2NvbmZpZyBiL2RyaXZlcnMvaHdtb24vcG1idXMvS2NvbmZpZwppbmRleCBlYjcx
YTBhYzA0NGIuLmJjZmRjNGNlNGMxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9L
Y29uZmlnCisrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvS2NvbmZpZwpAQCAtNzkwLDEwICs3OTAs
MTEgQEAgY29uZmlnIFNFTlNPUlNfVFBTNDA0MjIKIAkgIGJlIGNhbGxlZCB0cHM0MDQyMi4KIAog
Y29uZmlnIFNFTlNPUlNfVFBTNTM2NzkKLQl0cmlzdGF0ZSAiVEkgVFBTNTM2NDcsIFRQUzUzNjY3
LCBUUFM1MzY3NiwgVFBTNTM2NzksIFRQUzUzNjgxLCBUUFM1MzY4OCIKKwl0cmlzdGF0ZSAiVEkg
VFBTNTM2eHggZmFtaWx5IgogCWhlbHAKIAkgIElmIHlvdSBzYXkgeWVzIGhlcmUgeW91IGdldCBo
YXJkd2FyZSBtb25pdG9yaW5nIHN1cHBvcnQgZm9yIFRJCi0JICBUUFM1MzY0NywgVFBTNTM2Njcs
IFRQUzUzNjc2LCBUUFM1MzY3OSwgVFBTNTM2ODEsIGFuZCBUUFM1MzY4OC4KKwkgIFRQUzUzNjIy
LCBUUFM1MzY0NywgVFBTNTM2NTksIFRQUzUzNjY3LCBUUFM1MzY3NiwgVFBTNTM2NzksIFRQUzUz
NjgxLAorCSAgVFBTNTM2ODUsIGFuZCBUUFM1MzY4OC4KIAogCSAgVGhpcyBkcml2ZXIgY2FuIGFs
c28gYmUgYnVpbHQgYXMgYSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlIHdpbGwKIAkgIGJlIGNh
bGxlZCB0cHM1MzY3OS4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2Nzku
YyBiL2RyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2NzkuYwppbmRleCAzMWU1NDYwOGIzYzkuLmZh
MGZkZjFlM2U2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy90cHM1MzY3OS5jCisr
KyBiL2RyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2NzkuYwpAQCAtMTYsNyArMTYsOCBAQAogI2lu
Y2x1ZGUgInBtYnVzLmgiCiAKIGVudW0gY2hpcHMgewotCXRwczUzNjQ3LCB0cHM1MzY2NywgdHBz
NTM2NzYsIHRwczUzNjc5LCB0cHM1MzY4MSwgdHBzNTM2ODUsIHRwczUzNjg4CisJdHBzNTM2MjIs
IHRwczUzNjQ3LCB0cHM1MzY1OSwgdHBzNTM2NjcsIHRwczUzNjc2LCB0cHM1MzY3OSwgdHBzNTM2
ODEsCisJdHBzNTM2ODUsIHRwczUzNjg4CiB9OwogCiAjZGVmaW5lIFRQUzUzNjQ3X1BBR0VfTlVN
CQkxCkBAIC0yNjgsNiArMjY5LDggQEAgc3RhdGljIGludCB0cHM1MzY3OV9wcm9iZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50KQogCWNhc2UgdHBzNTM2NzY6CiAJCWluZm8tPmlkZW50aWZ5ID0g
dHBzNTM2NzZfaWRlbnRpZnk7CiAJCWJyZWFrOworCWNhc2UgdHBzNTM2MjI6CisJY2FzZSB0cHM1
MzY1OToKIAljYXNlIHRwczUzNjc5OgogCWNhc2UgdHBzNTM2ODg6CiAJCWluZm8tPnBhZ2VzID0g
VFBTNTM2NzlfUEFHRV9OVU07CkBAIC0yOTIsNyArMjk1LDkgQEAgc3RhdGljIGludCB0cHM1MzY3
OV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgdHBzNTM2NzlfaWRbXSA9IHsKIAl7IC5uYW1lID0gImJtcjQ3NCIsIC5k
cml2ZXJfZGF0YSA9IHRwczUzNjc2IH0sCisJeyAubmFtZSA9ICJ0cHM1MzYyMiIsIC5kcml2ZXJf
ZGF0YSA9IHRwczUzNjIyIH0sCiAJeyAubmFtZSA9ICJ0cHM1MzY0NyIsIC5kcml2ZXJfZGF0YSA9
IHRwczUzNjQ3IH0sCisJeyAubmFtZSA9ICJ0cHM1MzY1OSIsIC5kcml2ZXJfZGF0YSA9IHRwczUz
NjU5IH0sCiAJeyAubmFtZSA9ICJ0cHM1MzY2NyIsIC5kcml2ZXJfZGF0YSA9IHRwczUzNjY3IH0s
CiAJeyAubmFtZSA9ICJ0cHM1MzY3NiIsIC5kcml2ZXJfZGF0YSA9IHRwczUzNjc2IH0sCiAJeyAu
bmFtZSA9ICJ0cHM1MzY3OSIsIC5kcml2ZXJfZGF0YSA9IHRwczUzNjc5IH0sCkBAIC0zMDUsNyAr
MzEwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIHRwczUzNjc5X2lkW10g
PSB7CiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgdHBzNTM2NzlfaWQpOwogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBfX21heWJlX3VudXNlZCB0cHM1MzY3OV9vZl9tYXRjaFtd
ID0geworCXsuY29tcGF0aWJsZSA9ICJ0aSx0cHM1MzYyMiIsIC5kYXRhID0gKHZvaWQgKil0cHM1
MzYyMn0sCiAJey5jb21wYXRpYmxlID0gInRpLHRwczUzNjQ3IiwgLmRhdGEgPSAodm9pZCAqKXRw
czUzNjQ3fSwKKwl7LmNvbXBhdGlibGUgPSAidGksdHBzNTM2NTkiLCAuZGF0YSA9ICh2b2lkICop
dHBzNTM2NTl9LAogCXsuY29tcGF0aWJsZSA9ICJ0aSx0cHM1MzY2NyIsIC5kYXRhID0gKHZvaWQg
Kil0cHM1MzY2N30sCiAJey5jb21wYXRpYmxlID0gInRpLHRwczUzNjc2IiwgLmRhdGEgPSAodm9p
ZCAqKXRwczUzNjc2fSwKIAl7LmNvbXBhdGlibGUgPSAidGksdHBzNTM2NzkiLCAuZGF0YSA9ICh2
b2lkICopdHBzNTM2Nzl9LAotLSAKMi4zNC4xCgo=
