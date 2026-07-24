Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0871448BAB;
	Fri, 24 Jul 2026 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911824; cv=fail; b=EM4+IpliXXM8MRLdj1qZz8wcY2rzmaynII207+v8Qj9apwcq8ME+i47Hmz9m5XiNipJyeIsDJeHeDLXgeGYbwCnKWv9tkLDWj11J8GO1Ymvr/GJULMjUk4BBGZPCj02mckSL1oLaOIwY7jmpoMQX9d4sLQgXij9QLytmvhzKxTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911824; c=relaxed/simple;
	bh=j4dY7LDBmNau536onrksfHMUuofum1RRevXxtBUkyG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bPLnM8EL/WhnPBKrM6MA6KCaonui+D7oC/hd7FKdIrmyZVzZRaWUiuUHLs73Npv8eAr05SjxlUxW1t0866maWYUHdwEMf4QsFbHNM04Quwn+VOGERv4pxvMQXwubtiKIiZKtKfI+9zo7b7DtA/XIeB0ulemhlFL3TgWrAxIguwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=bISmQKne; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="bISmQKne"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OFMOFD417919;
	Fri, 24 Jul 2026 16:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=hs
	4hM3nCN8IeZ00ZPCir2GnRseXxfwMfiHo/iPMX2II=; b=bISmQKneeX55xBOZPp
	6efFCowoZfJ+sLwko2CxHdNaf1LKoz0JZZUZB9c6xL3JLCZbbebSRpTEiONnzv8o
	DkMACrOciRYfoiVRb93CUtzwfrXxubSufJRGRLA4tdrcXu/jVyXtlGVu07OFRPdN
	pNh4osLUqwdvOaQ151UjBut8w++Kp8U3nSTFuIpGZj5PD3c3CQKtLuiEs57F/nDq
	FeJo1UQhdZ7MvVAxwjZprwKnNlcJoYVE6m7RO4wL5WmRajc4kx/Xoxy3Y223qu7v
	PkG1kJx7MNZ9J16cwSDP0qBgNJ09kED9I9GngKWxKpSGkoVX3ctvv+DCv/HHdCBw
	xZgA==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fmamus9dy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 16:50:04 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id B9792800220;
	Fri, 24 Jul 2026 16:50:03 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:50:03 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:50:03 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 04:50:03 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 04:50:02 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkGEQohdpjDSMwsfmh/b8iDfuQP8vC9C2fCRuV0VsHDRdGBpkoIiahyKQNZM4pPoD+alDndLC1fVEOvpSj4i9A9IECXXVWdn5cMmjCP0Ln3r+7YHfLcyzx1mLyKxnExBHq2RF22E4CCrtzoLtE+JXlak2jLP0gE0OWnRRLSt+Q7ZtjOM4B8GXFK/7tOzam6lYF2bxJdKAr1XLD36RWx1L5EprgNsrpkvsM9KfC5ukdA2dUGMv8BA0FYEH56oYyRdAlxL8BCOdB/oLtVd0yxz7cYxXG0LRl/m1lHaBr0IKcmZpevV06ynLVgsFuo+SaQpthTq3W7GNsFmIUAcb96G9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs4hM3nCN8IeZ00ZPCir2GnRseXxfwMfiHo/iPMX2II=;
 b=rxOqth+lvrRq6zbV4Q9cWD6hDZfHMBnlvwyTvIbABlxHUOe4vd57mm6YVvz5LuXK9CFll/x2Oqm6HrWoov5o23XApx7RiZbsJsoo4SLAavormR5oEwCcSxy/Xua+3st9cYvzdJRq77RuBjupRMQl6jGyWFRHlizA2n8qdtX1RlZBiY+DxiZ88frhlnIait6Glw7GWQBBB1+keUL6W7TtSHjBXA0VSl07VasuoIxVY503kwnms1xxHxCbHLa/8FLCXvl5Im+HbzVdTDiUdkeLy6oPpbvMeIln+RYzOfQJJJrnX2rzjGrpVjEcXXGeoAfOoC+H9XRjJPCiLY2ycxi0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB1816.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:156::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:50:00 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 16:50:00 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>,
        Georgi Vlaev <gvlaev@juniper.net>,
        Dhruva Devineni
	<ddevineni@juniper.net>,
        Debjit Ghosh <dghosh@juniper.net>,
        "Jawahar Balaji
 Thirumalaisamy" <jawaharb@juniper.net>,
        Avadhut Naik <avadhutn@juniper.net>,
        Santhanakrishnan Balraj <sbalraj@juniper.net>,
        Brian Mak <makb@juniper.net>
Subject: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdG4x34Q4P1zCD/E2JxkiuennFRA==
Date: Fri, 24 Jul 2026 16:50:00 +0000
Message-ID: <20260724164919.247162-3-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260724164919.247162-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB1816:EE_
x-ms-office365-filtering-correlation-id: 7927329f-ab72-4bd3-fd91-08dee9a399f7
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|6133799003|18002099003|22082099003|38070700021|3023799007|56012099006|10067099003;
x-microsoft-antispam-message-info: 21Z/eAlDvg7o80KPCAWbKiWpNfypZ6LwEiwJ/Aqx5QsePG7g8JNTHHtqkU+buorO6unuQXRDXlvmeKCeaEelJceolpZ/vCYnbIJKZl/oBXdjYXWb5EBqqSis4b5pf/vcgEuUzXvV7UJx2bET45GaeLnEmkT6+UDa8Im0tt/03+mp8D7NG3w2BNlPatnMTl7s+PToCiIHjlXuC00k1wNDAsE+EbRhz/cP6Q4xkS12Xr27tFS5nFIc2cR3KmW5QRM8Qz4TOiTvlV9TYFRfeOzCCyTOmoFak+bkj+fMj+klXxoDsbkbgFQLqE0LnWg4iEW6U3qQw1HqqoNJTKdEFYQipP/X8nXKjJCZepxowGeNCiaEQf8JK8snbVnlUcHANaEdmxhSvNliwI+zMBO0Mi1fNnLx6nEJ/PvvV5R/We3x6dPVw+Z7EUXiv8g/l9//CzuPlwV5IpblOmTPxrOgg1n50j1VUl/FZKgof1SF1r7l46dSEwOxTDz70ZzwzidYYdK8devtxG0EyUaOoDozoDWgx080SWemjFrMINUylKNck51Ev6h3/ei/4dhoPUdD6kewtj46OwIHSbBf5cnrf+lCr6ObEJ/llWjw41SnjtGZEFeNYDSoUtQ5VXAZvit5tOSM5jgvwf2HSP9SAkstmQsBKzqWzTnr01Dz0xseQ7rxutMu26rTjDfeoXPUKEFlTrF72MgRgipdADuPlQowEtScQ/D6KpHaccQcHhUX3qctlgU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cCTd7C9X67S+hAFxGtJu9iFa4xTOkWEXQ8smqLBQ5l9qHjESUE8+cvRP75?=
 =?iso-8859-1?Q?rKtmtYBiyawe8BhVZgkqKV3EK+dQSfKUvPBjhhrBEto1sqOd4yaMSDRfDk?=
 =?iso-8859-1?Q?wD2T5i702S1ba/ELbxwv7BIfNNwhr36gTVOhU1aI2IgIUAiQCHYFwnyiT1?=
 =?iso-8859-1?Q?WgifcR0amDra5rls91A73QBQhmkEBvp2OlzMS3+lpB54mUhqk2pWHJEAW7?=
 =?iso-8859-1?Q?EmlL4lunAWiOqidzd0r2HeCEZpFF6aAHw12dzOOo8cqK/GQWlzbxH0NnHX?=
 =?iso-8859-1?Q?+H76lZ04e8vloiEX2FyS5osi4wtBmE+y7sfwUYBaeeD5y5zU/NIxOAd2+9?=
 =?iso-8859-1?Q?Mv5pGfc1XfcIRHO3qurN5D9uMMT+hIV2/btU8lPa/MZmtoWIDZXk3zs8mq?=
 =?iso-8859-1?Q?HFWuttir5aBnEy7pGgHruGWjSQDyXQw7iE3KpT9khv089suATrmENbfxrO?=
 =?iso-8859-1?Q?09e/sSJMdCYdMVB2yiiGuwVn0OEh6ueW2PcCF+S946FvTADrfaOklslUI5?=
 =?iso-8859-1?Q?KGTJIollaEXN9MJK4tPMQwb3O2Co4yLzfemlUUk5M9SVKsDENfmZgHWn2d?=
 =?iso-8859-1?Q?xMAzy64QEDEJ5R9+j/KndTjMAqNl5JHhiCgdrzkkrjRXaOLH9Z11kyMUZ6?=
 =?iso-8859-1?Q?7PMsGQA3+CMo4kDok64PJOMaEiY97dwdNyQSWxH2X2LZ76Kvi8K4i99ZPG?=
 =?iso-8859-1?Q?pOf2kyxNtOHX/62fYAEa7Nte68i/hzdvHZYPsSR1m8TP/AF9I3b32+TqvP?=
 =?iso-8859-1?Q?fK7o7un08VRBzRHCLC0YZe6fSqMGN4j0hI/bPpW4EJbD6he3zIhcNYp9KM?=
 =?iso-8859-1?Q?MJCr7K+3XvjsxGXRcsbxQ2X9Lsrke6oiChx9SXJWENudr/k67w2GIw617T?=
 =?iso-8859-1?Q?GMa7KkyyBYYz9hL1ASIV/8WImub/mUUJydKGC14Pd04QsHz5hj9gqbiB/s?=
 =?iso-8859-1?Q?qQBre4QIXcRGJv3SJcLfovlVenIoh8aNwdurVfYmIEU+QqGdB1CyzR7vsg?=
 =?iso-8859-1?Q?So1t1UUEv5jdEZhZmAJGvufBEPEp3dqYPT93r+8K8S+aiKGVS/7O+dwBhs?=
 =?iso-8859-1?Q?eoaKvsI4VJfrfIYsLRhZc3s7jjy/1NobDuwoOYcJ6q6OtUzq5mczhLGdQM?=
 =?iso-8859-1?Q?FvYTf9PZ33bIa4PIxYnPudOo1zDol+Jmh0uuV6ttIBVIZZe2vcn9oUVH1m?=
 =?iso-8859-1?Q?r9r5agsyEO0jQ5vvgKUcWJq+RTKROmF+esTmpVmdfWzV2mrD3QOdvN6PIs?=
 =?iso-8859-1?Q?1fZENSjdT+M+wFUh4CiqSUZde4xKe6Ojst1KLYitJ5vvofvsICZUXkoC54?=
 =?iso-8859-1?Q?s1/DymNH6T0MqMot7KxZDLVM8uG7UYAQiHkaTOqFYlLahEZw0FZULjPQMU?=
 =?iso-8859-1?Q?avOgKxt/lejDyu236XEdiInBiSZ5f73EUNrP1J9tZreIUOfG5EfFQJ6ahs?=
 =?iso-8859-1?Q?If9CT1KBarvs/ndc6jbRXHzIRYUPZJgpMOaPvJXSdBKdMHL3EnAIM0yzhp?=
 =?iso-8859-1?Q?6ElWQoZriQ/RHfv8c5e4DOhfjq9uaWax2vhe9Mx/mXWsqLjvLQDXzOrS37?=
 =?iso-8859-1?Q?6tH2s93LILXYYxuo4WQBSYa///v1TC+cS85LlV/ZcFKXlKz8JjUaYGta85?=
 =?iso-8859-1?Q?YZCWSm8fECgNTRSgj8fP+NK+UVpYO5VACEnQGUHU76GltsvBE/2LGr8OHI?=
 =?iso-8859-1?Q?HAiaXZfqwcxRSTtH3hVSSEmLmIgIdVEv10jPKRWpbmgU5qeTG1kMylDcXq?=
 =?iso-8859-1?Q?py4a5RbVpevXUX9RPvz24QUfj8YalB+Se1FjOgUi3K2EDQog5cmlzck2TJ?=
 =?iso-8859-1?Q?3lXr/GgUnw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OEe/sGvq8Zwkq53p1YauSneoMmd7sEIJlRDTIJaSAybCkbHfXd6e9PMABYrsOGHvBRCSoWqKZykol1lXsHJldgi/VXK8QTqwaos+vlrN+q9EdOawxTdJvrci7p72beajD9m5BFdiRQgCLM/+R/mUnEfjlZr1W5BCyYS2PZMetcZER1fEKPJSgRwx1tTlkagqYmiIgIocEWKvY3EhWB4XYCaI11ijflhMjTH/CkzTKXuJOfQ0+eZvz7uJ3jn+Koe3a4e90D1DkWfiGWxT2O+/VFTJj6BZK1mGT0QHU6jdDSmes1X3y51cNuEOy59Ssua34LbVQF3hs5Ak4VfhjDHO1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7927329f-ab72-4bd3-fd91-08dee9a399f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 16:50:00.5264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a8l+96/3TnIiVPf0OFQo2f56YuBDb8gVGIaH4gry+QLKJWJC6QNRq0cOcMmjfTwM+BX3xj+Nojr1TpOEcTqnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1816
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfXxQI52nRwhgHP
 UXA1Xd5ZDo8s7UWLOX7fJBZf51WUR+JuIvqBbXIEhoKaQEBp7Sby2kkurb3FbfCHcfyKQoLrTrJ
 ypFv75IUTXxkeRW0yImhmhxZTrPfrmEvwKAg+6m18O9XhyFrJU3Wt/yq98uL7djYRXDQ3jgOUIy
 XF4ukyiG5mJf6dixvVMwxyO1raGqMAJ43I7m00vu+8qCZ5iUuF6y7lEpY4iF6p6ZokAe5fwA/ta
 DWfvt9mPO4AN+evph153cdc/vbH2QUUTU6VeVnw+R+oa1/NbHBINYCj0Z23+Gw97tl1rWhB7Pi9
 fcVMNTRCuTsXa72+x6dJbYs5QMC/Aw7ET4F+CK6Aq0yzxDI5A/3meG0ptKyR99AGLoL/4a5Z+Qe
 nhqSNryXlCkRpi603ubNzBJ0BAw2br36S00A5wO/SWO94XzzUlyMjr4TXRkDvt385YBYCcJkdYC
 mmZ/XgMBAGkVs3Jr91A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX5gTHyQG+gFrJ
 8ti0qZSuECh3UQ7DyZlYLlkr2vpXf48Ez5LcljNWIP4wzF/5iinZjYUEEV/0Cy+i1Y2whpvxWKQ
 V45Uc1w69G/grhwpwW+mr6ogcaiYNlw=
X-Proofpoint-GUID: rLZYiPFCf74WBsmDxrKN-oxTEeKflKQo
X-Proofpoint-ORIG-GUID: Y-K7hqzo7sYVH55Rp2V2Ga071gKHAFE9
X-Authority-Analysis: v=2.4 cv=T9W8ifKQ c=1 sm=1 tr=0 ts=6a6397bd cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=EprCN7UrAAAA:8
 a=iZzoODi1DZXc1RShzHEA:9 a=wPNLvfGTeEIA:10 a=cAcMbU7R10T-QSRYIcO_:22
 a=HCbi7XInCiJmNhJA85EG:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240150

From: Georgi Vlaev <gvlaev@juniper.net>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the=0A=
Volterra VT7505 controllers. The driver reports input/output voltage,=0A=
input/output current, input power and temperature over PMBus. All values=0A=
use the direct data format. Peak input voltage, output voltage, output=0A=
current, input power and temperature readings are exposed and can be=0A=
reset.=0A=
=0A=
The reported current and power depend on the external current-report=0A=
resistor connected to the ILOAD pin, which can be provided through the=0A=
"adi,rload-ohms" device tree property.=0A=
=0A=
On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally=0A=
be configured with the "adi,ocp-severe-filter-us" device tree property.=0A=
When omitted, the existing hardware setting is left unchanged.=0A=
=0A=
Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>=0A=
Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>=0A=
Signed-off-by: Dhruva Devineni <ddevineni@juniper.net>=0A=
Co-developed-by: Debjit Ghosh <dghosh@juniper.net>=0A=
Signed-off-by: Debjit Ghosh <dghosh@juniper.net>=0A=
Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>=0A=
Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>=0A=
Co-developed-by: Avadhut Naik <avadhutn@juniper.net>=0A=
Signed-off-by: Avadhut Naik <avadhutn@juniper.net>=0A=
Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>=0A=
Signed-off-by: Santhanakrishnan Balraj <sbalraj@juniper.net>=0A=
Co-developed-by: Brian Mak <makb@juniper.net>=0A=
Signed-off-by: Brian Mak <makb@juniper.net>=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes in v3:=0A=
- Use per-device match data instead of an enum (no zero-valued match=0A=
  data); derive the temperature coefficients and severe-OCP filter=0A=
  support from it.=0A=
- Add an explicit adi,max16545 match entry and drop the compatible-string=
=0A=
  check in probe.=0A=
- Use designated initializers for the I2C device ID table.=0A=
- Replace the SPDX-FileCopyrightText tag with a plain copyright line.=0A=
=0A=
Changes in v2:=0A=
- Map the microsecond adi,ocp-severe-filter-us value to the=0A=
  MFR_CONFIG[15:14] register field.=0A=
=0A=
 Documentation/hwmon/index.rst  |   1 +=0A=
 Documentation/hwmon/vt7505.rst |  89 +++++++++++=0A=
 MAINTAINERS                    |   8 +=0A=
 drivers/hwmon/pmbus/Kconfig    |   9 ++=0A=
 drivers/hwmon/pmbus/Makefile   |   1 +=0A=
 drivers/hwmon/pmbus/vt7505.c   | 284 +++++++++++++++++++++++++++++++++=0A=
 6 files changed, 392 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/vt7505.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/vt7505.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index 956f3da0b7223..62687bb994ac1 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -281,6 +281,7 @@ Hardware Monitoring Kernel Drivers=0A=
    vexpress=0A=
    via686a=0A=
    vt1211=0A=
+   vt7505=0A=
    w83627ehf=0A=
    w83627hf=0A=
    w83773g=0A=
diff --git a/Documentation/hwmon/vt7505.rst b/Documentation/hwmon/vt7505.rs=
t=0A=
new file mode 100644=0A=
index 0000000000000..e56dc0055e89f=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/vt7505.rst=0A=
@@ -0,0 +1,89 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver vt7505=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX16545=0A=
+=0A=
+    Prefix: 'max16545'=0A=
+=0A=
+    Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/max16545b-max16545c.pdf=0A=
+=0A=
+  * Analog Devices MAX16550=0A=
+=0A=
+    Prefix: 'max16550'=0A=
+=0A=
+    Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/max16550.pdf=0A=
+=0A=
+  * Volterra VT7505=0A=
+=0A=
+    Prefix: 'vt7505'=0A=
+=0A=
+    Datasheet: Not publicly available; register-compatible with the MAX165=
45.=0A=
+=0A=
+Author: Georgi Vlaev <gvlaev@juniper.net>=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for the Analog Devices MAX16545 a=
nd=0A=
+MAX16550, and the Volterra VT7505 PMBus controllers.=0A=
+=0A=
+The devices report input and output voltage, input and output current,=0A=
+input power, and temperature. All values use the PMBus direct data format.=
=0A=
+Peak (maximum) values for input voltage, output voltage, output current,=
=0A=
+input power and temperature are exposed and can be reset. Writing to any=
=0A=
+``*_reset_history`` attribute clears all of the device's peak values.=0A=
+=0A=
+The reported current and power values depend on the resistance of the=0A=
+external current-report resistor connected between the ILOAD pin and=0A=
+ground. This resistance can be provided via the ``adi,rload-ohms``=0A=
+device tree property; a default of 4750 ohms is used when it is absent.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+The limit and alarm attributes are created by the PMBus core for the limit=
=0A=
+registers that the device implements. See=0A=
+Documentation/hwmon/sysfs-interface.rst for the meaning of each attribute.=
=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
+in1_label               "vin"=0A=
+in1_input               Measured input voltage.=0A=
+in1_min                 Input undervoltage warning limit.=0A=
+in1_min_alarm           Input undervoltage warning alarm.=0A=
+in1_lcrit               Input undervoltage fault limit.=0A=
+in1_lcrit_alarm         Input undervoltage fault alarm.=0A=
+in1_highest             Historical maximum input voltage.=0A=
+in1_reset_history       Write to reset all peak values.=0A=
+in2_label               "vout1"=0A=
+in2_input               Measured output voltage.=0A=
+in2_min                 Output undervoltage warning limit.=0A=
+in2_min_alarm           Output undervoltage warning alarm.=0A=
+in2_highest             Historical maximum output voltage.=0A=
+in2_reset_history       Write to reset all peak values.=0A=
+curr1_label             "iin"=0A=
+curr1_input             Measured input current.=0A=
+curr1_alarm             Input current alarm.=0A=
+curr2_label             "iout1"=0A=
+curr2_input             Measured output current.=0A=
+curr2_max               Output overcurrent warning limit.=0A=
+curr2_max_alarm         Output overcurrent warning alarm.=0A=
+curr2_highest           Historical maximum output current.=0A=
+curr2_reset_history     Write to reset all peak values.=0A=
+power1_label            "pin"=0A=
+power1_input            Measured input power.=0A=
+power1_max              Input overpower warning limit.=0A=
+power1_alarm            Input overpower warning alarm.=0A=
+power1_input_highest    Historical maximum input power.=0A=
+power1_reset_history    Write to reset all peak values.=0A=
+temp1_input             Measured temperature.=0A=
+temp1_max               Overtemperature warning limit.=0A=
+temp1_max_alarm         Overtemperature warning alarm.=0A=
+temp1_crit              Overtemperature fault limit.=0A=
+temp1_crit_alarm        Overtemperature fault alarm.=0A=
+temp1_highest           Historical maximum temperature.=0A=
+temp1_reset_history     Write to reset all peak values.=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index d88c0dd4c8142..b914aafb8514c 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -28958,6 +28958,14 @@ S:	Maintained=0A=
 F:	Documentation/hwmon/vt1211.rst=0A=
 F:	drivers/hwmon/vt1211.c=0A=
 =0A=
+VT7505 HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
+F:	Documentation/hwmon/vt7505.rst=0A=
+F:	drivers/hwmon/pmbus/vt7505.c=0A=
+=0A=
 VT8231 HARDWARE MONITOR DRIVER=0A=
 M:	Roger Lucas <vt8231@hiddenengine.co.uk>=0A=
 L:	linux-hwmon@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index ca312be58ed5c..6c97a6dc88a59 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -795,6 +795,15 @@ config SENSORS_UCD9200=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called ucd9200.=0A=
 =0A=
+config SENSORS_VT7505=0A=
+	tristate "Analog Devices MAX16545, MAX16550 and Volterra VT7505"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX16545, MAX16550 and Volterra VT7505 PMBus controllers.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called vt7505.=0A=
+=0A=
 config SENSORS_XDP710=0A=
 	tristate "Infineon XDP710 family"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 080d366809f32..daa4b49bc90fd 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -75,6 +75,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679.o=0A=
 obj-$(CONFIG_SENSORS_TPS546D24)	+=3D tps546d24.o=0A=
 obj-$(CONFIG_SENSORS_UCD9000)	+=3D ucd9000.o=0A=
 obj-$(CONFIG_SENSORS_UCD9200)	+=3D ucd9200.o=0A=
+obj-$(CONFIG_SENSORS_VT7505)	+=3D vt7505.o=0A=
 obj-$(CONFIG_SENSORS_XDP710)	+=3D xdp710.o=0A=
 obj-$(CONFIG_SENSORS_XDP720)	+=3D xdp720.o=0A=
 obj-$(CONFIG_SENSORS_XDPE122)	+=3D xdpe12284.o=0A=
diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c=0A=
new file mode 100644=0A=
index 0000000000000..c60f849e1f9ea=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/vt7505.c=0A=
@@ -0,0 +1,284 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX16545/MAX16550 and=0A=
+ * Volterra VT7505 PMBus controllers.=0A=
+ *=0A=
+ * Copyright 2026 Hewlett Packard Enterprise Development LP=0A=
+ */=0A=
+=0A=
+#include <linux/bitfield.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/of.h>=0A=
+#include <linux/pmbus.h>=0A=
+=0A=
+#include "pmbus.h"=0A=
+=0A=
+#define VT7505_MFR_CONFIG		0xd0=0A=
+#define VT7505_CFG_OCP_S_FILT_MASK	GENMASK(15, 14)=0A=
+=0A=
+#define VT7505_MFR_PEAK_VIN		0xd1=0A=
+#define VT7505_MFR_PEAK_IOUT		0xd2=0A=
+#define VT7505_MFR_PEAK_PIN		0xd3=0A=
+#define VT7505_MFR_PEAK_TEMP		0xd4=0A=
+#define VT7505_MFR_CLEAR_PEAKS		0xd5=0A=
+#define VT7505_MFR_PEAK_VOUT		0xfd=0A=
+=0A=
+#define VT7505_RLOAD_DEFAULT		4750=0A=
+=0A=
+struct vt7505_chip_data {=0A=
+	int temp_m;=0A=
+	int temp_b;=0A=
+	bool has_ocp_filter;=0A=
+};=0A=
+=0A=
+static const struct vt7505_chip_data max16545_data =3D {=0A=
+	.temp_m =3D 205,=0A=
+	.temp_b =3D 6545,=0A=
+};=0A=
+=0A=
+static const struct vt7505_chip_data max16550_data =3D {=0A=
+	.temp_m =3D 199,=0A=
+	.temp_b =3D 7046,=0A=
+	.has_ocp_filter =3D true,=0A=
+};=0A=
+=0A=
+static const struct vt7505_chip_data vt7505_data =3D {=0A=
+	.temp_m =3D 205,=0A=
+	.temp_b =3D 6545,=0A=
+	.has_ocp_filter =3D true,=0A=
+};=0A=
+=0A=
+static int vt7505_read_word_data(struct i2c_client *client, int page,=0A=
+				 int phase, int reg)=0A=
+{=0A=
+	switch (reg) {=0A=
+	case PMBUS_VIRT_READ_VIN_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_VIN);=0A=
+	case PMBUS_VIRT_READ_IOUT_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_IOUT);=0A=
+	case PMBUS_VIRT_READ_PIN_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_PIN);=0A=
+	case PMBUS_VIRT_READ_TEMP_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_TEMP);=0A=
+	case PMBUS_VIRT_READ_VOUT_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_VOUT);=0A=
+	case PMBUS_VIRT_RESET_VIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_PIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:=0A=
+		return 0;=0A=
+	default:=0A=
+		return -ENODATA;=0A=
+	}=0A=
+}=0A=
+=0A=
+static int vt7505_write_word_data(struct i2c_client *client, int page,=0A=
+				  int reg, u16 word)=0A=
+{=0A=
+	switch (reg) {=0A=
+	/*=0A=
+	 * A single reset command clears all peak values. CLEAR_PEAKS is a=0A=
+	 * send-byte command; the device NAKs a word or byte-data write to it.=0A=
+	 */=0A=
+	case PMBUS_VIRT_RESET_VIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_PIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:=0A=
+		return pmbus_write_byte(client, page,=0A=
+					VT7505_MFR_CLEAR_PEAKS);=0A=
+	default:=0A=
+		return -ENODATA;=0A=
+	}=0A=
+}=0A=
+=0A=
+/*=0A=
+ * None of these controllers implement the standard PMBus WRITE_PROTECT=0A=
+ * (0x10) register, so tell the core not to access it.=0A=
+ */=0A=
+static struct pmbus_platform_data vt7505_pdata =3D {=0A=
+	.flags =3D PMBUS_NO_WRITE_PROTECT,=0A=
+};=0A=
+=0A=
+static int vt7505_set_ocp_filter(struct i2c_client *client)=0A=
+{=0A=
+	u32 ocp_us;=0A=
+	u8 field;=0A=
+	int ret;=0A=
+	u16 word;=0A=
+=0A=
+	if (of_property_read_u32(client->dev.of_node, "adi,ocp-severe-filter-us",=
=0A=
+				 &ocp_us))=0A=
+		return 0;=0A=
+=0A=
+	switch (ocp_us) {=0A=
+	case 0:=0A=
+		field =3D 0;=0A=
+		break;=0A=
+	case 1:=0A=
+		field =3D 1;=0A=
+		break;=0A=
+	case 2:=0A=
+		field =3D 2;=0A=
+		break;=0A=
+	case 10:=0A=
+		field =3D 3;=0A=
+		break;=0A=
+	default:=0A=
+		return dev_err_probe(&client->dev, -EINVAL,=0A=
+				     "invalid adi,ocp-severe-filter-us value %u\n",=0A=
+				     ocp_us);=0A=
+	}=0A=
+=0A=
+	ret =3D i2c_smbus_read_word_data(client, VT7505_MFR_CONFIG);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to read MFR_CONFIG\n");=0A=
+=0A=
+	word =3D ret & ~VT7505_CFG_OCP_S_FILT_MASK;=0A=
+	word |=3D FIELD_PREP(VT7505_CFG_OCP_S_FILT_MASK, field);=0A=
+=0A=
+	ret =3D i2c_smbus_write_word_data(client, VT7505_MFR_CONFIG, word);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to write MFR_CONFIG\n");=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static void vt7505_set_m(int *m, u32 rload)=0A=
+{=0A=
+	u64 val =3D (u64)*m * rload;=0A=
+=0A=
+	/* Make sure m fits the s32 type */=0A=
+	*m =3D DIV_ROUND_CLOSEST_ULL(val, 1000);=0A=
+}=0A=
+=0A=
+static int vt7505_probe(struct i2c_client *client)=0A=
+{=0A=
+	struct device *dev =3D &client->dev;=0A=
+	const struct vt7505_chip_data *chip;=0A=
+	struct pmbus_driver_info *info;=0A=
+	u32 rload;=0A=
+	int ret;=0A=
+=0A=
+	chip =3D i2c_get_match_data(client);=0A=
+	if (!chip)=0A=
+		return -ENODEV;=0A=
+=0A=
+	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);=0A=
+	if (!info)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	dev->platform_data =3D &vt7505_pdata;=0A=
+=0A=
+	/*=0A=
+	 * The m coefficient used in the direct-format current and power=0A=
+	 * calculations depends on RLOAD, the external current-report resistor=0A=
+	 * connected between the ILOAD pin and ground. Use the default value if=
=0A=
+	 * none is specified.=0A=
+	 */=0A=
+	if (of_property_read_u32(dev->of_node, "adi,rload-ohms", &rload))=0A=
+		rload =3D VT7505_RLOAD_DEFAULT;=0A=
+=0A=
+	if (!rload)=0A=
+		return dev_err_probe(dev, -EINVAL,=0A=
+				     "adi,rload-ohms must be non-zero\n");=0A=
+=0A=
+	info->pages =3D 1;=0A=
+	info->read_word_data =3D vt7505_read_word_data;=0A=
+	info->write_word_data =3D vt7505_write_word_data;=0A=
+=0A=
+	info->format[PSC_VOLTAGE_IN] =3D direct;=0A=
+	info->format[PSC_VOLTAGE_OUT] =3D direct;=0A=
+	info->format[PSC_CURRENT_IN] =3D direct;=0A=
+	info->format[PSC_CURRENT_OUT] =3D direct;=0A=
+	info->format[PSC_POWER] =3D direct;=0A=
+	info->format[PSC_TEMPERATURE] =3D direct;=0A=
+=0A=
+	/*=0A=
+	 * Direct data format coefficients from the device datasheet ("PMBus=0A=
+	 * Equation Parameters"). The current and power m coefficients scale=0A=
+	 * with RLOAD; vt7505_set_m() applies the 1/1000 factor below, giving=0A=
+	 * m =3D 3.824 * RLOAD for current and 0.895 * RLOAD for power. The=0A=
+	 * temperature coefficients are chip specific (see the chip data).=0A=
+	 */=0A=
+	info->m[PSC_VOLTAGE_IN] =3D 7578;=0A=
+	info->R[PSC_VOLTAGE_IN] =3D -2;=0A=
+	info->m[PSC_VOLTAGE_OUT] =3D 7578;=0A=
+	info->R[PSC_VOLTAGE_OUT] =3D -2;=0A=
+	info->m[PSC_CURRENT_IN] =3D 3824;=0A=
+	info->b[PSC_CURRENT_IN] =3D -4300;=0A=
+	info->R[PSC_CURRENT_IN] =3D -3;=0A=
+	info->m[PSC_CURRENT_OUT] =3D 3824;=0A=
+	info->b[PSC_CURRENT_OUT] =3D -4300;=0A=
+	info->R[PSC_CURRENT_OUT] =3D -3;=0A=
+	info->m[PSC_POWER] =3D 895;=0A=
+	info->b[PSC_POWER] =3D -9100;=0A=
+	info->R[PSC_POWER] =3D -2;=0A=
+=0A=
+	vt7505_set_m(&info->m[PSC_CURRENT_IN], rload);=0A=
+	vt7505_set_m(&info->m[PSC_CURRENT_OUT], rload);=0A=
+	vt7505_set_m(&info->m[PSC_POWER], rload);=0A=
+=0A=
+	info->m[PSC_TEMPERATURE] =3D chip->temp_m;=0A=
+	info->b[PSC_TEMPERATURE] =3D chip->temp_b;=0A=
+	info->R[PSC_TEMPERATURE] =3D -2;=0A=
+=0A=
+	info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |=0A=
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |=0A=
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |=0A=
+			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN;=0A=
+=0A=
+	/*=0A=
+	 * The severe OCP deglitch filter is programmable on the MAX16550 and=0A=
+	 * the VT7505, but fixed on the MAX16545.=0A=
+	 */=0A=
+	if (chip->has_ocp_filter) {=0A=
+		ret =3D vt7505_set_ocp_filter(client);=0A=
+		if (ret)=0A=
+			return ret;=0A=
+	}=0A=
+=0A=
+	return pmbus_do_probe(client, info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id vt7505_id[] =3D {=0A=
+	{ .name =3D "max16545", .driver_data =3D (kernel_ulong_t)&max16545_data }=
,=0A=
+	{ .name =3D "max16550", .driver_data =3D (kernel_ulong_t)&max16550_data }=
,=0A=
+	{ .name =3D "vt7505", .driver_data =3D (kernel_ulong_t)&vt7505_data },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, vt7505_id);=0A=
+=0A=
+static const struct of_device_id vt7505_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max16545", .data =3D &max16545_data },=0A=
+	{ .compatible =3D "adi,max16550", .data =3D &max16550_data },=0A=
+	{ .compatible =3D "adi,vt7505", .data =3D &vt7505_data },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, vt7505_of_match);=0A=
+=0A=
+static struct i2c_driver vt7505_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "vt7505",=0A=
+		.of_match_table =3D vt7505_of_match,=0A=
+	},=0A=
+	.probe =3D vt7505_probe,=0A=
+	.id_table =3D vt7505_id,=0A=
+};=0A=
+module_i2c_driver(vt7505_driver);=0A=
+=0A=
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX16545/MAX16550 and =
Volterra VT7505");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
