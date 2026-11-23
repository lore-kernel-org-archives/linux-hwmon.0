Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795395590;
	b=iyZ+BlmLRQiXsNrN/hcNk9aNsHJld6XcepTZn4ThiGcLGMFtyKiFboQJy1d/h/ERa21h
	 u8XvNu5iTWfYC/c877rYmzlKtAP+3CqeZAZGdpCPE03C3D9X4O8qimurOCreSfYZBMJce
	 o9frdPtUVjjdllaUIB4oKrtH6dZ9gGRjQ9F0gBClIUIp+szLvIh3kM4Jexl7WRSwRuaRs
	 wOrVG3C6Verpg1SXWVIyXGziLcLrpHD6RFiZXen90cphuKoCQzjHcG54CA6lwnyOWJkWO
	 z1OU3GJy4hjctr6PL+oZuafw+6e46BcXtoX+xkRZeuZK/RNicOpAS7BCeEf2tVNJUng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395590;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EUhiZcwqo1Yb45IHxC36y2/JR+EtIBl7YMEYQCQfJgc=;
	b=Tr7C4BC9UFqxuO75vV2sIvjhIp+eqWAu6TYDm51LwfjNdKjLl69PZ8KPcbnJtTvCQikW
	 dphXjZwoPqg06BVyn+oXG6JQK/HZc2qbRQVov7Nho4Eu45Q22rT8vgO2LIeOl4nmJGJmr
	 NSf2jC/ShWIslYaSttyT8Oa5C4+F3f6oFRY8M0LR3U4uPBuFOhEcBWOl7nZa+mtoauZz4
	 zbplHsEJ5bARiKh7pVX6cksz8/eDZbC1lXo+4PVzeOYr0iL5rkXvi9aDZh2JFtEiiTVXR
	 uEvZauvxbhYCfpHhRJhom/VGT0w2BfrHCMj8Fy2nAQFOTBQpQWiPp+83jvuTY/COGsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=l+AZIMCs;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="g2EFKC/s";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE371606A31D;
	Mon, 23 Nov 2026 00:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE371606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=l+AZIMCs;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=g2EFKC/s
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNt1in593838;
	Sun, 22 Nov 2026 19:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=EUhiZcwqo1Yb45IHxC36y2/JR+EtIBl7YMEYQCQfJgc=; b=l+AZIMC
	sX0K05mgrTMAsdSz2+SSDiJ3fy3m5yGW9AzpT6VBGEvLpp2Fs8U/3yhLEmZGF/+V
	h/YKgbwzsbWeo6wa2H1RyvbrkCVSyLE+YDi54gexVApNwuHHNIluPYueZE6HjZ/S
	2Z/Pbw21GPBtJHLn2hqpHelZtF4V9PzgBsp6BOcg6bpaps5AVG3abMZ28XlQU+lu
	0aQpleR+0BMVZ0oUgc4RBS9ai1QZBFrBuGy/OB1S5hLs9ROfe5M6mRxG6ZXWzG9H
	IZpzO3cHjF0SRgfYX+kGCYFN2nvMxlLwB/6la5iZUExBh/2JtvesiENYGoaqeUYA
	FR1xFK36oWuMRrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EUhiZ
	cwqo1Yb45IHxC36y2/JR+EtIBl7YMEYQCQfJgc=; b=g2EFKC/sDeg+xtztbPf80
	GmKZm90qX0i803wkDrSzt1D2dT2ZxvXh8XuLCeljk4XiisqF/ZIE7cy9o4Odnc2I
	Xi5DyLFAqRkjfjTcn+WFWKx1ZRDwux5sJs+Nz5mLnMNejvZz5TU3bgZGVIR+fT0C
	sMv6V7Wg0abgR3NvVo1yaaF9f2lqPWV2PR2DXd48+pKKvj7e1AsMY8MejrET5ANP
	wrvJoON8gOFgTFReb5U9SSfoV14eqX2TUU1YCrHnE0A2Of1yyZT+UTqUw1dFdzwZ
	FKc/vSKQHTuwWIwnBu/Wd3rVMIBHUfFB1VRvqlaerpHhRlTvVxRx46Oh2ZLhIzKf
	A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4j3tgj3nte-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 19:59:11 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTL2Et1maVcwxR5v44omqYQwEOPdpLujVrYcthJjZhkPWKfM1coW0n61l+O++VInnkGNJyzgN4p1W70aCnRSS+VI0ICJa/m6+oAefgbFxem5qTiFFg3AxXMv0re+pv+DCyxgq0Vzt2apk64QHYsRGOa26PdStesvuCGUSQbO5bL0gSvyquHAESSiBhsRZtgzJRE549JUCejbUKBcKfOZBt3oDS0xZqmhh8/tF53hmEBSpGmS2khu/LrsRbqFyCC/OqPa+BxtJodwblLY3KN5d3MDuSHQs8Y/bctoZxqitthj2SaU+RKz16Xp9PWvPjiAjQbdjkTAGZdJyJnQFeQYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUhiZcwqo1Yb45IHxC36y2/JR+EtIBl7YMEYQCQfJgc=;
 b=LR49Vj5DoyTjQi/XF6kmeXZtivjwEDgZkBvMbkZnVzvGRDfjCxBQFmBVZHZiTmJ3xCMsAIS9FEX71p6undD0uDhH17zDimr3BLt18m0CLdx1ESm0Bv+2SecfpiyTbr3AGjkRgKfxr0wzhWjEd9ut5/qxI/kFetEeHIEV3lNPK3hF1VEzxAIRbBPjhT+GTHxKKdGsg66X9tlodjyXUKbSevEZiPVzvc0M6Sy4dDswOxZ7oNgScyGdLRVnnwYRHdc2wy5AbtiryCbNjlr9X3pA2KJ3mvgGAAnjYtAHhTkYfU5RzzifrofGeP19uF13T0SwFLkjTW4fq9jXVlMiV1c81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7924.namprd03.prod.outlook.com (2603:10b6:a03:5b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 00:58:03 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 00:58:02 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Sa, Nuno" <Nuno.Sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus
 Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Topic: [PATCH v3 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Thread-Index: AQHddm2Lj23pdZl5oEigx0cwgwMlALc6Tt+AgACMLJA=
Date: Mon, 23 Nov 2026 00:58:02 +0000
Message-ID:
 <PH0PR03MB6351E0A89FBE4C46B03C9EB2F1452@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
 <20261117-staging-ltc4284-v3-1-326bb844e08c@analog.com>
 <20261122-organic-tacky-chupacabra-5dff9c@quoll>
In-Reply-To: <20261122-organic-tacky-chupacabra-5dff9c@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7924:EE_
x-ms-office365-filtering-correlation-id: 2831d9e8-0e90-48ee-8b40-08df48fcd362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ilwLtW26wiykFSlBd+QNRJwcppFTXXMoFvI2HculiiYqiL06YWsY024pzMtEtXip0XTp1eZIUYC1wIVNIgz/4JwC2Qg65ifdJJs80gCwQS+kj41QxkUZmyD4+zM+J46Fpd6/USamJtohI5t9ZJNgWV4josHCfFZd/U8kuXAQcUHOu/6lK4tEVHDCO+SllQL7+bCa+55nZPRd7fntotSdK82CNc2ei0LH53vimOGwooAWSCBW3HiuofSQPrsagIKiGDahVdRzGg6lDPseSBvY903n+BSVFC7RTvtzdE4bXPB7GxpWpSd179pkfliYUxVSWXItlTxz1S5s3EHzgb+vGf1fyx3LXk9TWfPeM8AZ6mLEI1UE62gHPilGOOgGY4J+P9H7I8Mw25WD2EaTY1p0LCY2rHBvFx8GwAgPwpGNuYq793mu6QU+BB1JlhH1kMP4MNyPg7+Sw1Hwn8rnIJDVbD6D5RzphHTPZn5257SrzJGjaWLiwN/UdQKCMfPyjCubjx7C1o/+ez577ebuOjZo6fQ9+Xy4l0KxZ3bKLIUVP5gVUqe2DYfMlhbRSH2blEtEGUuZZVWInAw1Os/jsXF546UeMepGldrHYu2PAcdM5GNb7vPvt7mnnn+5P1GNr4ucV+CxCpfNshcpKkVVQ6+6C0NdbMavaRFoR4J8OosawVltEqT1DbtqIlkQoOzDL/hksMr8mNs0vQU5W5y1OkdS3z2lWHG3D/TmPGTftSj7fDA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWl6ZnM4VFJoMmZ2elFWMTd1SVJIQkppSmExVGNDWU1kK25raEt6VTZBMDgz?=
 =?utf-8?B?YW03S01ZYlRHZXVaUVM3V3Y1RGUwenNNd25WMkl1Z1FWNThETHdoeXV0dlEv?=
 =?utf-8?B?Q1JJRmg5bmQ1L2JIOWRDSjVHajZvSHhTQTZQZnRTRDNmNzl0dWxOd0RobWxC?=
 =?utf-8?B?ZGI5Wjh2eHhaZyszRmJ6Qk1CdlJiVjRuVGREUG1QZXlpQjhKTDltREFIY3k2?=
 =?utf-8?B?RjFzQ003azhTUzdYeFRnWEpQNytLQXdvMjI5SGdQSDB5S0doZEtyNi92QUtz?=
 =?utf-8?B?TkxNWUJ6bVk5eU5Ma1hpRmpEN3Z6Z1VPZlVZL0ljak84dWVDemlyUUhaSGZP?=
 =?utf-8?B?eUxGQXJJVmV3UWhPLzNmQys4bkNQaUtLZlNvZUVKRXJVS2VxL3VaR2xjVDdC?=
 =?utf-8?B?RDFyNDJOTmpuL2taSm1jOTg5N3VZbGNxbUwvTVY1aDZUU0dFOWVNNXRZcjUz?=
 =?utf-8?B?Q0g1NE9XclFkTmlqN1V3VFp0amk4WHFzZVBCalhxK2FRektRaExaUGoyYU03?=
 =?utf-8?B?Y3o0TUorT2pMT1oxUzBTdmNpNG1NUjIrSzR5RW1Ocm1ZV2VqY3hiMlBDQW9I?=
 =?utf-8?B?VXNJOFAwcjhmOW9lcGRKT1lmeVpTK3pYU0pCbkg0WTdZeHcwZlBVMFBibmtI?=
 =?utf-8?B?cWt1ZWh2SGRNY3l3Tk5nUkFHb3BqcDNKajIzMGNHY0FGTklYQy9CQytPbnl4?=
 =?utf-8?B?aHZkMThaMW9xZ2pjZnlNclNTNDZWRDRNd1NRUkRUQXUreUVHb0U4b2NBblJD?=
 =?utf-8?B?OGRUMHAyV2RxL0h2RVBHUWlncnlPQmU2UUpxdS8vZHBrQU5pVDNWSHNHK3JL?=
 =?utf-8?B?MlpncXJVYiszTllEU0liNEFwYm5YSkNCQ3VCRm85SHdSbnd1aGpXRDB3Vi8v?=
 =?utf-8?B?NFlBdGxaTWNLY3NOTkpjYXRBZWNqSGtUdUFkWEVuWkszQzh3dTE0K3QyZzhV?=
 =?utf-8?B?cjB2VzZNVVNDeE5IVVlJQlpSc0VxTGI0NWpQK1Ivdjl1ZUVIdXZNUDNaMnZK?=
 =?utf-8?B?RlR1emhwaTJrUEQ5QWJUTWtnOC9QeU16MWR6OG5uMGlReU9xcVNmSnRaZGdD?=
 =?utf-8?B?TTBMRnFlaGJOd2o5QWRRRDFNNnRyWnVLWU1DTEtsVHFTNW9xU1V4UDA4TzhQ?=
 =?utf-8?B?b3lnYmNEczhEdFNXbzF6VmdTdWlrS1M1N0cyM3crQVZIdmpPeHd5anhmTXRj?=
 =?utf-8?B?SUx0Yi91NS9FYnZUSkR5UzZnT2Z2MFV5SjloTCtZNzdpSXJ6a1F2MmFYa1RN?=
 =?utf-8?B?YmozUXUvbnhLZDhtWlVkZUtvQ1BCeW5YRmM2MzY5SktjYlNnSlJtUkQvMDlG?=
 =?utf-8?B?QnBjRVZnNDhEN3h4WHJMSzRqV1poOW5VVng2YThQYkUwM0sveEJITnZiMC9y?=
 =?utf-8?B?d1BFVU9HWFV1UTVaUXRnM1ZZVHNUVTFiRGprTC9pRVBCRXhKbzJzSnJmRFVD?=
 =?utf-8?B?bnYveFJrRXh1RlJ1a2VpcW5UbDRuOXg0YXp1OUlycng1S2ZNOFhVUGZ4cm9w?=
 =?utf-8?B?U3RvaHBISWFrQ1NYRktjUkRyMGZFWjBaZkRPVG9UWnJvY1N0YjBkOFpYNFZ5?=
 =?utf-8?B?Y2pjdW9FTE9zUllnUmlMSjVucjdvUTdwcmJEMWt0TERkUkp3K24vclM0ZzY4?=
 =?utf-8?B?UjRYdkpyVnZ2b0FCaURyaXdOQk93T0dZMFcrNVBWUEUvNDZQZCt5SFlBVGtD?=
 =?utf-8?B?c2JITmxYV3l0UFcwU0pzYTY1akpyWjE4OUlzTHBLN0JPZCs1ekQwNWNjRTRH?=
 =?utf-8?B?eS9pVzNYakR6MnQzM3J6OEJTWUYxNkgvZDV6c01VS2RmdmhUc1VDRnJ3MGRV?=
 =?utf-8?B?RjZQTnZHUVlJWkVvd0tYdlRUaDZWVkdjcmVKMzVSZ2hoc3pKNXhCY0puUWVj?=
 =?utf-8?B?OGcyMmR6MkwybmNmR09hOWtDTE5QNU5VaFhTTFB3NTdybUhINmlGS3NqbFJ3?=
 =?utf-8?B?SVpBcnZua3BrWEZzQ3VyTEVheEkxVExvVks0UUh6bDFrSzZIOFpuTHlXYWRm?=
 =?utf-8?B?eVRpZHVRUHBUV291bWxlallLVDFKNCtnWGRac3A1QS82UlpOaEhta21zcDM4?=
 =?utf-8?B?STFUdXFWd0hqemRRTGM5MTV4Si93THBVM2hZMmkxUitDMUZpdWJJbVI1cG9q?=
 =?utf-8?B?bVRRMTBUYWNaQTJnU0xDMWtzdDVOYVlMa3NQN2lLdTdUa21sSDB5QjFLSmFv?=
 =?utf-8?B?Q0ZZM2ptazVHTG8xUm1uM25ydzN3cDIrcEN3RFdreFMydW11Q3Q3czJlQkk3?=
 =?utf-8?B?NVF3OTlaS2JMSGVJK213OG82ODErWDU5UTJ0WUF3WTlUVkw2bTVjSGZRRmRS?=
 =?utf-8?B?dkU2QjN2WTZSZ0JUMkJNL21TM0JsNmhoRUJwaUUwOHdNeHdzcnVDbG1ZUWMw?=
 =?utf-8?Q?u0lvZEup1JGpCTFo=3D?=
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
	KGt5jP9rVUitfXqaZyyuMvEuCKfrxFPkW4KnoUfxYK9E9Oyf5CNv6nkQEIfAcCNes1kSTu2l6t/v83Aox3jMBauLV+vJpVFchPuU17Wpf7C0oVJD91PRQTrNT8/4WjL5G8s6DGdas4VsJ5QMS5xK6dH6dcmV103CQUvqvCCyUDfkFomhX6O3JGAnDpUcnU5RpuHgQERh0zUpiVnNIoAxeE80QC/mNtIKzFUklb0CJdqzU2w0LJKHY5gh9S2N+XPgfo3iFhh1HlpKorDB3PIYK6E6Tam8IF03pzPi251qlJms+2v8D/RwXTsSdz7h4ldE/Hqbr5BOdtYns1nWUCq6vA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2831d9e8-0e90-48ee-8b40-08df48fcd362
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 00:58:02.4189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdbRtcA1fZN6ahe3mxejpp9ZER9pq6SmrnIOKNGZ79mG9k3RtMkzB6DT4tSmB0r8bEg6DdoPwOuWFeldBKMheN4smgFeMg/kFLvP/ll2Yrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7924
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAwMyBTYWx0ZWRfX+ZubqJb2AIaQ
 qpUDvlynJ2g+V75Y5VeqPcZeh8naClbmyl0DqQe1OFd5BdfHxn2zTe6tONFlKLyGxQ6htON4wSM
 uvgViJEerU2b4La+fZwNGmgX2m0CpqF1hpmGf+IDAp5+z2giALX8BF17hBTKHgkTk4exLUTMNxF
 WBY9sdfg5fwkGmjCJNr2rIf/t9NTCI4YWhYHbIZUMKws+S45PSz9lYrZ6yEiBjqROKN7QAEdUjL
 OEP9gMqTESLWck32pt+dGD9crynPWk1ar0UExw0VhTz47Vi9rb/bZ7IwlSGYsGgzKGzNIiPNRwQ
 1Ol9adUFVFe9wFRlmdDiX7dtZMJSncJOnB8srLfnmctSHAhfQD+6G+wtBgGWTGOwfVV3U6Tm386
 KiVKZnjTOVJ1CVWjtZNVQMpUHapnj/6hRscjCkrPacTZF17a/WJC4mmSG4yvkdXQjKId0XWqt15
 o6t87hzGqSHP0TO9U8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAwMyBTYWx0ZWRfX6/+IP3FqUEtw
 7bPdfw2xgJtIqURope4tneCfRMmOdYbgrZqiOssEe4c64NA6bu3Xkqe7oBfYfI3JirIe5tRqOeO
 Dw+zWcptOt0RwlzTlsUN9h6zAUhgSX9jqkYxQpVoWZDPE68Dmir2
X-Authority-Analysis: v=2.4 cv=Yp6a1IYX c=1 sm=1 tr=0 ts=6b038fdf cx=c_pps
 a=4QVYENZnsEoURNel/cbnog==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=GbHSOyKHf50N969c9QcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EzZFEZEwWWqMIZxLMPz6UBsWRhMHI-8S
X-Proofpoint-ORIG-GUID: EzZFEZEwWWqMIZxLMPz6UBsWRhMHI-8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230003

PiANCj4gT24gVHVlLCBOb3YgMTcsIDIwMjYgYXQgMDQ6MjY6NDhQTSArMDgwMCwgQWxleGlzIEN6
ZXphciBUb3JyZW5vIHdyb3RlOg0KPiA+IFRoZSBMVEM0Mjg0IGlzIGEgbmVnYXRpdmUgdm9sdGFn
ZSBob3Qgc3dhcCBjb250cm9sbGVyIHRoYXQgZHJpdmVzIGFuDQo+ID4gZXh0ZXJuYWwgTi1jaGFu
bmVsIE1PU0ZFVCB0byBhbGxvdyBhIGJvYXJkIHRvIGJlIHNhZmVseSBpbnNlcnRlZCBhbmQNCj4g
PiByZW1vdmVkIGZyb20gYSBsaXZlIGJhY2twbGFuZS4NCj4gPg0KPiA+IE5vdGUgdGhhdCB0aGlz
IGRldmljZSBoYXMgYSBNT0RFIHBpbiB0aGF0IGlzIGRldGVybWluZWQgYnkgZGlmZmVyaW5nDQo+
ID4gdm9sdGFnZSBsZXZlbHMgKFZFRSwgVklOLCBJTlRWQ0MsIG9yIGxlZnQgb3BlbikgYW5kIGNh
bm5vdCBiZQ0KPiA+IGNvbnRyb2xsZWQgdmlhIHNvZnR3YXJlIG9yIEdQSU8uDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4aXMgQ3plemFyIFRvcnJlbm8gPGFsZXhpc2N6ZXphci50b3JyZW5v
QGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9u
L2FkaSxsdGM0MjgzLnlhbWwgICAgIHwgNTYNCj4gKysrKysrKysrKysrKysrKysrKystLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0K
PiANCj4gSSBkb24ndCBzZWUgY2hhbmdlcyBpbiB0aGUgZGVmYXVsdHMuIFlvdSBzYWlkIHRoZXJl
IGFyZSBkZWZhdWx0cywgc28geW91IG5lZWQNCj4gImRlZmF1bHQ6Ii4NCj4gDQoNCkkgd2FzIHRy
eWluZyB0byBwYXR0ZXJuIGl0IHRvICdyc2Vuc2UnIGluIExUQzQyODMuIFRoZSBkZWZhdWx0IGlu
IHRoZSBvcmlnaW5hbCBkcml2ZXINCmlzIHRvIGFsbG93IHByb2Jpbmcgd2l0aG91dCBGVyBwcm9w
ZXJ0aWVzLiBIZW5jZSAncnNlbnNlJyBpbiB0aGUgZHJpdmVyIGRpZG4ndCBoYXZlDQonZGVmYXVs
dCcgYmluZGluZyBlbnRyeS4gSSBkaWRuJ3QgYWRkICdkZWZhdWx0JyB0byB0aGUgYmluZGluZyBm
b3IgJ3JhZGMnIGFuZCAncnNlbnNlMicNCmR1ZSB0byB0aGUgc2FtZSByZWFzb25pbmcuIA0KDQpB
Ym91dCB0aGUgb2xkIG1lc3NhZ2UsIEkgZ3Vlc3MgZm9yIGNsYXJpdHkgc2FzaGlrbyB3YXMgdGFs
a2luZyBhYm91dCBteSBsYWNrIG9mDQpzb2Z0d2FyZSBkZWZhdWx0cy4NCg0KUmVnYXJkcywNCkFs
ZXhpcw0K
