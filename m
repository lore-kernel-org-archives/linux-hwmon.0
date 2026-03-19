Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C9733D6D8;
	Thu, 19 Mar 2026 23:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964306; cv=fail; b=TW8CsERCwEsCV06F8n/0V3/mNK0K8u87Pqt1Xy/fY2t9mZJgeFgRaxYE3Q8YyrSSs3D4Ibbnq8cv/IX/7S6CzZfxAq+KehvGHkTgRqYWdrn/JvENvfw2/XSta+9mPGTafwZAUCItB6+5/0dRcONPC+7mEnd727yI7Fe1uGuTtZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964306; c=relaxed/simple;
	bh=IeBiX6nQqqIvoti7jyfGaqxy22v8411osF9yPd1cCFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z5d7s9ckUbKgP+b3mMqJYaXrKMtmAnn3ZrN8UcAfWqR/mm5nTf2dXk/wp2HNxEYNU/O3mCqC45CtzW5RLwbDBwvgxdPdO++clptIPgClGbqfLnKyZeITw/YtbNOwWCL4T3jI4AcpvaaHUacIOyya5+T/GXF7U/2h5Cd5PZYYHSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=I5vIipif; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="I5vIipif"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JH8Aot1647432;
	Thu, 19 Mar 2026 23:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Br
	pvXfHt8ATt/RjplPWYhWHkgSgqPEQHHGcev6n7twI=; b=I5vIipif2J/8fcS7Bq
	AMPjeZ8dfWeyPQvOvMxeMjYIH2j6U0eDPj5TCuxDRzqz2ezIiiMP7fNDIo6Zw/dX
	qFn9huesNRwyc15Ufp0Ifu4XqPoEC7cHCbLkaaV3Khh24wTmdrKIekjdaPXt/kN5
	G0dkmb54aB1gKV1AI/P4D5GlkMboML1pZ1vc0Wjr4n/5zekiN2mTBfIwLGyCsIat
	vBoW16DPjKyGC5lR2pNPVl4p08ATUMQjFIu1b6+9c6u75TG1dbhgGDWoexQi8bbU
	0bVZhNqajnjASYEvW6UfBptoHV10pA0cahKGLTzTIo8Pn3AXsGEsH5hOAts/oR/t
	u2bw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d0n9c3n5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 23:51:22 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 20A2DD1DF;
	Thu, 19 Mar 2026 23:51:17 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 11:50:52 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 11:50:52 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 19 Mar 2026 11:50:52 -1200
Received: from CO1PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 11:50:51 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6B4g77Pi0QFG9JhmQKkrVDXXlW57zUYNeS4Rt4J8K7aBk5JhMeXTR4/Zx8lbR4vBsJ1L2usiVBn2kUfxqimCso220MJupIkwy1uGuXqR9A+U4IEu4CSJTPlk5DvC35Zs/EqD0uYhzZnoddPtvTNn6z40tnn+o21+jIo8MuVZf28abIc/DISfv2UXtuprS16ai6Z/o5sClm6r365pKZ0MRQndy0uxiynSCOy6+VoT7q4JxNMY0j4ko3w1rPqPsIb4Y2d/PwFvoki5ACSrYoB4JVTX8SFf9UhhTEzaShBOCe/cGjqdOpXvSzzZFQyzz2bUl+bNJn5KMg5/9g+YOX0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrpvXfHt8ATt/RjplPWYhWHkgSgqPEQHHGcev6n7twI=;
 b=RBE9iN+fME4/AdFvQXfD8oC21uA5ZdkqUs7sObvBMMaTVRHiUMLTyrKLwmAYSiauDSEjJDVC7ap3hyvM73BuFhesZX7ZcGHhn0JofTxBUlmwTT1jNPVXD1Mq7moJQmMxqBXksmNaoevSqhBpB4wqw/Cs9P/BT7BGzRphz6dJXiSzNXiVADDkFJiLJ9oHkIS1WFfvyJBLg8ctc4cM2PMjLOJh5d7ryWbSIJyPptBgS2AUIRfTFP7eXUEfsr4710K4sowFBa5PQPPiHR2oxgVriuj4wdIuegCqXsNy0aATVpH0Skm1cMEWimdq2MXozENo5q4+eI7106vnglwfeoA3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV3PR84MB3459.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Thu, 19 Mar
 2026 23:50:50 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 23:50:50 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 1/3] hwmon: (pmbus) add spinlock to protect 64-bit
 timestamp
Thread-Topic: [PATCH v4 1/3] hwmon: (pmbus) add spinlock to protect 64-bit
 timestamp
Thread-Index: AQHct/s2QEwwKjFFzk+mQ6d6LFxNCA==
Date: Thu, 19 Mar 2026 23:50:50 +0000
Message-ID: <20260319234945.151487-2-sanman.pradhan@hpe.com>
References: <20260319234945.151487-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260319234945.151487-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV3PR84MB3459:EE_
x-ms-office365-filtering-correlation-id: 9ba37dd7-8c59-4103-fdf7-08de86125962
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: /I0VtoCUHhnqwl8GkvXPdSFlKx/porMVZB6lx4xn11/jQDuuywaZyrovM6Kpwqw5DOuEqKM39gxC5qX6qAGWaCwfNsleULCBBjjiyYWZSliM102wU4SlC92Ri0ZDFFW3NAZGv3cMBtdsMdYb3PKEVqHo1MISTRrEeeQ8beWsMxAHz1kP/XL9/SvujlK2Znt1m6ROnycHU/Re8U6ITRlak8ap9+J6P9JpmLdXCxgPlHOLnhHMtU4Cr2PcFjGxLw0FJfZ+qZE2FwhyubvuooNlUCDpbibNiBFoHZARBckw3KOGyT9Xwa/FbpqjHTXp0IkOK0Zkb7egWt2eW4AKsz7BG2oYFGARYg+dAb6RpkbAQBXnRcEolqccaRE9jj7rZ7MZNzAVsZ6ql1++CxHrGqNe7ellTni8OmBSTjcTnJkxj1/kIXBpdGrmbTYWztOHPgw8TEeib4oCgm3+zbfiEqNJSg4f4t5+oEkjglO4f20iqztoiM1IA0+sVmNsLKw5Qqpi5mo0DfMUbG7+PV4fBoIyZhKlS/rDWlZWZw7rLKFA222kKF5yLFx4IGfMy0/SH/zXbaXaLJHb3yE0nIpbVMva0ow3U8uNUuYwU9r4JTv8qL/z+MHnXZjWi1mp0FFB5dTpZcNcml81CftrYhMKN7twHrQR044DS64gNfyzIpk6mwMwJkyYtD1v1LHX8CNJA3je2u7yPtQ2Xo1jpRGb251mB3o8eI/7fbigNPGCdQ4aD/e0oNS7KPKgC/g6e8JaA/EugVKWkV7YwNsr8dxfdU0nPnH+dPB3EXBoETRByyNUfdg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UlmtM4u+kQxYfgjLDACtHV4MZJtWcmvn2sdBPwXK9kZHpprAXfPYq5mJxu?=
 =?iso-8859-1?Q?kF6f9OEVpMctRqvMO8GHAov3ZgCzKAE67SqC+IRC+YEztehr1c/W4LuFFU?=
 =?iso-8859-1?Q?nbk/rZbpvffQm+lXQyyZTpoDUJ8YDTSc2BiWVehRJC/ktD2BAXmgZggM2E?=
 =?iso-8859-1?Q?liRuIFN7+pgT/xKwJM62h6dm80ikrEq9aW5GM4aiS+TeJLPy+rvrZ/7NeM?=
 =?iso-8859-1?Q?d5NQV2cOg5FKR15+GxYMQUYyBpPDwFx5mjiAlR0O9jkTX2q4x5Dst6d6NO?=
 =?iso-8859-1?Q?YuWMmoBAkbJQa8um8zALizvzFD50DZ/RukwdFf1Z0yZBxgE9JYUPveU6xb?=
 =?iso-8859-1?Q?E7r9mss8y/bn/ZtH4pzBOSnd9j95KKAO/c6eRUlMQWohHMq6TCwZosrPuh?=
 =?iso-8859-1?Q?u2YX4U0g0L90fSSYpFZ0wmJ8v7IEEkgD04/zxXjkAK6GCd+0CocqjCoGrw?=
 =?iso-8859-1?Q?70dftNlm7dOO4j0hz44t4x9km/sv6ZBJNiEhbTWSa13YvoqXSOyvyriHrT?=
 =?iso-8859-1?Q?WKl0vR7p8rI8tFDJW4ummF4aY8CgQTXI9HMW+2tH5BCZQ4x97H+9nosM+b?=
 =?iso-8859-1?Q?Su5mGTTrFFB2XOZLRiX1CdB/DUSC01BgIk0FdxdUSPRhMf13p/YBneQcDf?=
 =?iso-8859-1?Q?AJUPou41GzLSfq0VPGuxPiBF9Uh2chM2GmZf/Wh7uwIuwxPTp4u7kMcuMf?=
 =?iso-8859-1?Q?pxJL92h5uqRw9m6ZbjWpqZspJZ1kCj7M/S9n4/y2IY/dLVrWN0RgQs7ZlD?=
 =?iso-8859-1?Q?kEVmytYeMdabCpHHy2YllWsZpjy9djr/eTLkGztpUdfYZFXmgmFRJkfVbq?=
 =?iso-8859-1?Q?Ye6e79+4kgsXWKxUj0bo57VmQj3K43H3If076nhWsMQkq7GuYq5UkpeGP0?=
 =?iso-8859-1?Q?DZBmQP4O3XfRTtkcnsmkpMWLFU1o4ZLzszbC0hR9ZTkiqOkOIRg+S6hswL?=
 =?iso-8859-1?Q?aHO+7jJTD/26/qdswBqM2JMeEbRxtXrDrngkJr4j/vbdf3X/+C5vJ6mhKw?=
 =?iso-8859-1?Q?siGmBCZGfGcADrTPp2bDXzOQEwvlnHkxlFY7/7LLR3eTyrGuNccJsfUl3m?=
 =?iso-8859-1?Q?vXR9iHDXtIWdEwiygJserD8u8A2u5QoCn4m92ALPbzAflh7oOzMe6xsXu5?=
 =?iso-8859-1?Q?WoMnec+qW2CDSpRuGH6soCRnCwbyDvR2TX2GUwxWA8Zq91StV8M0fX01FY?=
 =?iso-8859-1?Q?72LvRoQK2Bt3RR5e+z4ne0cNnKHR+vWZzG/pOluPQEIV5qNp0+rh8lOQ4k?=
 =?iso-8859-1?Q?xczkryNtCTjUqXdRe92sSgMwLOsUH092avACRs9VxFETAhX2aCOE4Vi34h?=
 =?iso-8859-1?Q?5C56S5whKw5cDdENxsBvkYRaf1wQsqQAKjeDdKxZkp2+RxaQTNwb7btnge?=
 =?iso-8859-1?Q?jvXsTq55hCeqYpPawl5wDxVthn4MGjjDcSwcBKGJ8GQiA2YfYa3oQlCcov?=
 =?iso-8859-1?Q?PTIEFLx7praUeQvgKph3PISJaKhYxAqEpptQTOyfxvL+npxPY6CdvSJ1BI?=
 =?iso-8859-1?Q?shtdlRVF/6JSybkGTliVJCp/5I5IOJn0y0fjq0H63JIqgOewH9djddha6g?=
 =?iso-8859-1?Q?rzU/a/sR5kqXhIGMX9iiQMaHu8lN/UuJkWuA+eIG+19lfFB8wy8TljdcxL?=
 =?iso-8859-1?Q?mZWgHc44fLlXfNGTaRsie0bhsa0QeOnnLHzZh6MYAlFojrcwEHXE5PuWOF?=
 =?iso-8859-1?Q?NnRkX4a1W14uSnarcyH7bKCcC8K/QZ1O90BtLMqFpI2pP+rNX4szU+WbVz?=
 =?iso-8859-1?Q?t6bjwjttJWjeHZ4LqXxgCsq2HOJHodkuLzoOrPxFXAol9S8jcwSv8u4Umb?=
 =?iso-8859-1?Q?qD8WEynGSg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XBr+aslFPqr3zmJQ2PpbQHVzDx5qEsklRMTO4y+EeI1/sILDKW+5xCa9nBZt72ijV0uxY5n5y9QINOo64c7O105gKooW++cDkcjHDcoBNY7W5PbYdUPjiBB0BQjSHu2xu+TKOkdOEcQ5kHp38u4CNfg68p7QELgMtn7aizf1M5+mND9mN3IS8pB/lrl+OHokK6/reav3n0aHMi0uemC69T1P34hFI9pXhEJh8WcC0IoXSSkBnqO2DhbNxoCcOp1LHNoXL3kCK0rYyWQzIs9brGgBYnHi17TbW7zt6MgPOSMN8ZCG2vcYQA4nGJt/5O97gMo18bkR8cnAzsS8Q1d56Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba37dd7-8c59-4103-fdf7-08de86125962
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:50:50.0257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNUwZxGUhm/fFT6LAo4F2DZriVRnNkXpDZeicD3l6GapW9QzF+25Nt9YkY4LOWLVpg6MLz2DmElOEHFSIFJ/Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3459
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: flMH9BYGJGCECOO8m2RJxQ7ZJeRuHgn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE5MiBTYWx0ZWRfX7Yi2LOdT2qUr
 uLRnblRh/AgJ6UMJvjWyOfy9QC+tDG8Q6nyajTDg/hULSxS3UxfAdiEsSuQqXgeRLg8EdJbmExm
 qCtAbs4Kz+z8sJAMqT7be+KybaC5vwrzYln+hQpaIvIQ5Oy0YsRpI0czj91Do9GSm+COEuVC1UH
 sFj9nKZ3KhnH2BgkMcL5pqNN2WnYTRh2SpNKN3fSw2BFbVDNTLlUwWTzG6TA/+GcLIDiaJpV+EP
 Sdem3YaceQ6mwx6+vuOS84o+gDcsKk3zSOMoBYIjQvoIyG0jktUW7KUjTgjPq5JGRcg9fX9sECe
 Pis5tawms1Jo2wLCiPjP3evtJgsysbboXImZHHhLx0ELVjlOrld2a7p6JhfgBPwBfa4qJq1m0Ar
 BxJkfGzsXZ/+oxTH2izgQF+ZMtEtx68UxEC9K4zyfXhWb751JCyUVxsCpAfLo6rqvJwrMP2HWmN
 2YDiXgRTPmPyi9wUf+Q==
X-Authority-Analysis: v=2.4 cv=P8Y3RyAu c=1 sm=1 tr=0 ts=69bc8bfa cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=Aahk2nAXIxB2i9gVCqYA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: flMH9BYGJGCECOO8m2RJxQ7ZJeRuHgn-
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190192

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The next_access_backoff variable is a 64-bit ktime_t. On 32-bit=0A=
architectures, accesses to 64-bit variables are not atomic, which can=0A=
result in "torn" reads or writes if accessed concurrently from=0A=
different subsystems (e.g., hwmon sysfs reads vs. regulator updates).=0A=
=0A=
Introduce a spinlock in struct pmbus_data to protect accesses to=0A=
next_access_backoff and prevent torn reads/writes on 32-bit systems.=0A=
This change addresses atomicity of the timestamp field itself as the=0A=
timing helpers become callable from more paths, including PMBus chip=0A=
drivers using the exported helpers.=0A=
=0A=
This does not attempt to serialize the full wait/transfer/update=0A=
sequence across concurrent callers; it only protects the timestamp=0A=
field from torn access.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v4:=0A=
- New patch in the series. Introduces a spinlock to protect the 64-bit =0A=
  next_access_backoff timestamp from torn reads/writes on 32-bit =0A=
  architectures.=0A=
---=0A=
 drivers/hwmon/pmbus/pmbus_core.c | 16 ++++++++++++++--=0A=
 1 file changed, 14 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c=0A=
index 4d7634ee61484..42bd62f1e2e40 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus_core.c=0A=
+++ b/drivers/hwmon/pmbus/pmbus_core.c=0A=
@@ -15,6 +15,7 @@=0A=
 #include <linux/init.h>=0A=
 #include <linux/err.h>=0A=
 #include <linux/slab.h>=0A=
+#include <linux/spinlock.h>=0A=
 #include <linux/i2c.h>=0A=
 #include <linux/hwmon.h>=0A=
 #include <linux/hwmon-sysfs.h>=0A=
@@ -122,6 +123,7 @@ struct pmbus_data {=0A=
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */=0A=
 =0A=
 	ktime_t next_access_backoff;	/* Wait until at least this time */=0A=
+	spinlock_t timestamp_lock;	/* Protects next_access_backoff */=0A=
 };=0A=
 =0A=
 struct pmbus_debugfs_entry {=0A=
@@ -176,8 +178,14 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");=0A=
 static void pmbus_wait(struct i2c_client *client)=0A=
 {=0A=
 	struct pmbus_data *data =3D i2c_get_clientdata(client);=0A=
-	s64 delay =3D ktime_us_delta(data->next_access_backoff, ktime_get());=0A=
+	ktime_t backoff;=0A=
+	s64 delay;=0A=
 =0A=
+	spin_lock(&data->timestamp_lock);=0A=
+	backoff =3D data->next_access_backoff;=0A=
+	spin_unlock(&data->timestamp_lock);=0A=
+=0A=
+	delay =3D ktime_us_delta(backoff, ktime_get());=0A=
 	if (delay > 0)=0A=
 		fsleep(delay);=0A=
 }=0A=
@@ -194,8 +202,11 @@ static void pmbus_update_ts(struct i2c_client *client,=
 int op)=0A=
 	if (op & PMBUS_OP_PAGE_CHANGE)=0A=
 		delay =3D max(delay, info->page_change_delay);=0A=
 =0A=
-	if (delay > 0)=0A=
+	if (delay > 0) {=0A=
+		spin_lock(&data->timestamp_lock);=0A=
 		data->next_access_backoff =3D ktime_add_us(ktime_get(), delay);=0A=
+		spin_unlock(&data->timestamp_lock);=0A=
+	}=0A=
 }=0A=
 =0A=
 int pmbus_set_page(struct i2c_client *client, int page, int phase)=0A=
@@ -3687,6 +3698,7 @@ int pmbus_do_probe(struct i2c_client *client, struct =
pmbus_driver_info *info)=0A=
 =0A=
 	i2c_set_clientdata(client, data);=0A=
 	mutex_init(&data->update_lock);=0A=
+	spin_lock_init(&data->timestamp_lock);=0A=
 	data->dev =3D dev;=0A=
 =0A=
 	if (pdata)=0A=
-- =0A=
2.34.1=
