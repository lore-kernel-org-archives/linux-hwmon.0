Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34346409632;
	Thu, 28 May 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989718; cv=fail; b=Oide+VaaMbEPPnJsCvnOpnqJgdmtiqTXoPX1oYb5xGoSq5bkPmM/KU6Mg4B74k8/jOTJFi/xli2T1a3Oh0GqNbWuSR9KBBKjBg17y2l9jwVVtsjZ0RLPoMXP7VPsHDWDY+lf4T4MbjovHpWCYXalVhTfgdWyl7HR+sx93R8v85g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989718; c=relaxed/simple;
	bh=So6Dn4UoUm5Dn+jSi0H2Zsgqy57CRlDG31ZMKYYxL2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D5ZydUqRCrh4ILkv0gXDrxCJfi6ZXxNp8LxEiLwIGxZ4WiH1gujJCaXWqaUJALXzrSJVobWThrzUTZje2wHAu0UgNFkoix479PFnaHG7bytEbneot610aTe1UG2JRzCa3QPzUVALqKpOomTT/3dSlroZ4jMdE/iWEW+BnJQvHtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=hYjzopuN; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="hYjzopuN"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHRrRG2055929;
	Thu, 28 May 2026 17:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=W7
	Syi2JiuHBU4B5qfVVisFXT21VSOx0iboLGqGlaoaA=; b=hYjzopuNdRvoxSgtDT
	N/wE840ON0Ncsx5ugQlwGayyUAWEf42rZTJ/kvLOzxjFYweRCaMXvSkr5T9N68DS
	TVjbC86PxMUGZFjEawxnUI/bRTdyEHkdO0S+/wxTWT2hytERTXePTsDQOHEzmvje
	SykWqBYGwfvzSq1jl5M8lCm38Reupx0CovMnH51Hm/oBDarZK6gyD6VIbdvE6uPq
	0PxHkc7c94QYhhZG1Q7UV2fEk4c59BvVGGKufuoloYV68HW4zph6q8gCrlhR3Z7y
	MH/nD8LBXZDXd8KDIkWWwBKi8gR+rOfC1TcKoZEuhk6QT90pxo8Z6X+s6gGc98Id
	/bDA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4eemnavx8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 17:34:58 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 02C5113174;
	Thu, 28 May 2026 17:34:58 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 05:34:42 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 05:34:42 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 05:34:42 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLSQkmqs9jFBEswkehhdo0rhyTq+yl4BMr9O3sBs74atzy6etUuYYsumX5m3evnRDg6r63AsX+qVP6N7tp9vv0kyBZr5hjnUaV202P/0R6qL0WaCr/PWfFctFe8OkjOuDNnjPGttm+0DBtiiezxmDakdYOabtsYkF2snBQmlW6ONq9tOF7HiVQDrLKQQFhcc/ZTvD3Wzzd6neBLmVsBKPPQxmVquI12iPzEMrSpUphUlkdEfUCv78O1OfLIY79R7D6rho8UP0CD2zO8YqxhTLTnOOP/36rzne62tdEp/pBSiZbL6sek6f/ADDOo6/nAff99tHlD/Knfo8az4lCsrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7Syi2JiuHBU4B5qfVVisFXT21VSOx0iboLGqGlaoaA=;
 b=JuvxY12FCgMjNEQxGujRvg9YIRP4yvDYxXhrb9Xmd0eaChasKe6oXwg+N9HSvxQebqEGsXN+qZXC0F5ng3AaTfvLuHy8oiotrnPg1M03BUUQa2erCxOhtuwrF8E89cXD8XNzWHf2eo3tLLtlXYrGtRnH8wicU12wHOb0OgXoPIIcty5NhTZ15925Uqplg/FH890cvB5oOtGVgR0Um3I9cOhnQgPuKBIzToB1WNhi3qZ6pusqZCMrzzuScmKOmQ3DmzP+8CSEBZ8DVQGtPAIpeGCMxH/U3Z+fKbToPHToKHzGe2vHHAykVti32jStzq3jn8DDSd7/PPr6cLLuvZvr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS0PR84MB3745.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:34:40 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:34:40 +0000
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
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2 2/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH v2 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7shDezR9P+s0TkS7e8v+A9eTXg==
Date: Thu, 28 May 2026 17:34:40 +0000
Message-ID: <20260528173424.87503-3-sanman.pradhan@hpe.com>
References: <20260528173424.87503-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260528173424.87503-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS0PR84MB3745:EE_
x-ms-office365-filtering-correlation-id: b59950da-2b04-4fe9-dda7-08debcdf65f0
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|3023799007|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: cfcagI0YmqHCdzwtZZt5eRi2KR2LPPGcriw4wsDF9RaolQjbUtCXG57AdzEBR+2rXZm2kBw7B4PV2x/tW4q6CADwEmwEed/C9tsLzGERVLA+8I2n6KeK2L56amtD6zIPJw00Zt8x5W6QlBtuGSgcJvGhuFehO0VYbXKL8tzPPets2Zl9z/gH8ohLPRdPVYrBKsQ9bRvbaubLDWzg4xmt9CZmw7sfbVuUZQR6hjf3Pfgmye6zaLnxTlucJGUZMMM9fqmfGZh2ov/wgAsXALEfDRZrvYVTUqySEjwV+V6U5OIV0mymLj1+ffbqDC+lRFfNZdN4eNT2qy4MuKRW/hZnex+hAZUeKtf1aAJbbg3R6I2RvgzYVtP+13vPnviOo9opdxtnp91gNB6aLMFwbQgKsvCiSD0iRpJ5+1owQzUaAbkb7rhdt7Ks6MAJUn5uY1WmZLhoQZJwQTFj3ZAd6nE5TWdvSAJ4s01IkTWvLVKojc8P/FrpyDyRi05pz8cyCS7Ko51T7HINDF9EhylzZQCcxbv+7C1R7Be5L3BPKMw5Td0W/+SBijsjjKxitr7ats9UXvSH2mLPyx67lauNc58mjszA2vVBoCDv1WGHVz3mo625aoy7NQQprjEsw5TLoYsBZYJCvMGN+vaJU5GZpQbzI9wU3qD65efW01qxJesroPcJlw/hDsSa9O79U+jML/bYOUtJC+/tX9tdIzyOuaS1RrP2nh7voJb/qfds4b2xYH1YsERpFs0JRJ38SqpS0Jy0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sTkplNI4TvkNtQk9PN7e3+2Iaw28G7UnE11528FoaAE+zY9pJUcxdwa1Mm?=
 =?iso-8859-1?Q?ehHXW+FaUCQtyA1nZ+tlmz0mRBQxUUWwOXXDYGjvYbP2VitMatWwGLIukw?=
 =?iso-8859-1?Q?NFx3a5ueY37ZZK5Yuyy6F2Osxl//pAUA4kjSy0YtQ5rwWzYTbCNo9X1TDI?=
 =?iso-8859-1?Q?8wdzvXNtXg7O0/b76bZeG8UmavK+QedwIwa2fN8Vetx0Ay3XC6JNVX8TVt?=
 =?iso-8859-1?Q?Phb0nEGhcjDthZz3eBalfkRaq8GGODtu8QCxl2PpuKopgkJ9Lgqh/yp2Ew?=
 =?iso-8859-1?Q?VnjGejil+jVWZBHV2moUowvFWiExUY2p5aiQPZmZv7UkFp8s0V1nskDRxl?=
 =?iso-8859-1?Q?4k7iZqhn7GQ5ubRa8UIz2kyfOgKcA8THYs/RWCM4Chz56EBmrjcshFXIp7?=
 =?iso-8859-1?Q?aegU1umtpMJsPIVZnryA7HNh1SJCOngYzqTmKPJlIWrtUyG430yFudlk44?=
 =?iso-8859-1?Q?Uf2N9fg4L9QsN/hNT28h9D8AH2/O6Mn8vxQqKmPP4TSggUIDLUrASknGEW?=
 =?iso-8859-1?Q?xeck2sNoMnhMjSXH05o8wv7ksJyIS5+omKUV7hbEYECaDmE7LOhoPiWbEx?=
 =?iso-8859-1?Q?b6IelrVfHGRR1Q31GeRxqMBRiivZ/juKolhz+aHLg7ngDKTmpr9/tTcV3J?=
 =?iso-8859-1?Q?ZQ1erQd+rMWb3RyCe+59leEG0EKS+tjGPnWquJAGYYOTglAeQbgXm4IWom?=
 =?iso-8859-1?Q?fnpP9xVkv0qG7xRzP+7u3IAB+x3exPnFquGRdHJ9lTTM2QpS6v/mORIPe2?=
 =?iso-8859-1?Q?nIGhccRaVZuatHMwSzcCvFOnP5vCNjPquGhUidTauzGZ+p5JAsukA9o4oH?=
 =?iso-8859-1?Q?gtKiyYaC0XXutgKL/2bU8N01iayQOQVlcGAx5uVuRBOjBrB0dIWz+2bKIN?=
 =?iso-8859-1?Q?7HdhunR5T9OiukuQIfCiHQmOOK6EP0r3AtZjt9SUsB9aEOpyF3UUU2xhua?=
 =?iso-8859-1?Q?i30SOr5Kh57PsyeWiBv6KbB4zXU277eV6pEbrPlESVpq3TslqilY3TU1Ix?=
 =?iso-8859-1?Q?Lv37/haEkj7gTJwvY8sKg0gTnCTg/beO5l5jyQir1VzebvT21OnAA2X0Jp?=
 =?iso-8859-1?Q?4vQXel6q3Luh7gZJ5RHNkwIxPp5OCd9vKCH+QtGSWSGYSgY1hz7IBJh15A?=
 =?iso-8859-1?Q?LVvXE76I9Rgw8KkqII/sadnp8fAi8Pxv4RjyhCGIuzUvstfVrmQ/X70mgP?=
 =?iso-8859-1?Q?tm6z277y12Af/iRt7tQZGSpXy+V9kHcYbMUfYSq1zgyRCi3dc+TSOhQ8dB?=
 =?iso-8859-1?Q?PMjHYD87RJsW1/unt4izi6N5Rzek4lknC10L18gpFJ36xdcsO0BoaOwW49?=
 =?iso-8859-1?Q?vUKOTGwE+nwmwgAENyV/ixfP3N3+Ay/TkC06mdKfzAV0hRFW+UAHXXNosl?=
 =?iso-8859-1?Q?noATxpgrciCYSfUnIcIAHuttvTmj+GKqGoycQ01jTATN4sKTq4fz73L2X9?=
 =?iso-8859-1?Q?+WxudTR5Pbshd09lV0eJVdefP7bpZ4nBviXOeoKmTPPObeOwLOBgYQMOMq?=
 =?iso-8859-1?Q?v5ZEaJ14i7lsAciSGPYYpFuKNjBiMZQshDr+My2RNf4H3tkEcIus34OK5s?=
 =?iso-8859-1?Q?nTGbX36pU3pghywTUGb8wlEEsJH+EsIDC0WEI1LfJQjRinWmFNtzaogier?=
 =?iso-8859-1?Q?zWHelPAwCToN+cm5xut/rrva2F9wSajtgZL9SIT3izTveWK3gndlxEK61w?=
 =?iso-8859-1?Q?4p9Ez1wpiLBFlInE2cbYaWOI3tAIjUvXawAPQPqz9AAHvrJrcUi9d7XOIK?=
 =?iso-8859-1?Q?yg5QhRcdGCZpu4F2dTVRhY7F9yCtAQsaDOkkj2oJb/XUUK3RC90OGhTFnq?=
 =?iso-8859-1?Q?QQ0YaswIgg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lMeZdX8M2kSITx2siAFXbECbGS6mLgKOlt7RpRjwde/HmWhInPLVBlvOwxXI7OOb01XtOChubz6mSertShKE31bPy01K3bGg1lxsKrdGLunaAv1ubEGFoHX1Ry9E8iYj5/TtGOHCD/SmycijWlaiuUgOfI3kT4JIg3dD5Twhkinbl3SHSylq+CrPCJ+J1suJiuQ2h7j1hpIHWkxL4y0Jgimfe5Jbl2fnrLklDNvzISKmYBs1tcbDT05xqnOmGT1zsnoK7ISkSvSAcQbK+slMkkcKt6i0w9LOV70FuBau8Ug8mP1V4322ruqH/5Ib0Zzb8SY84IaiZcGmI/L9zYZvvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b59950da-2b04-4fe9-dda7-08debcdf65f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 17:34:40.7000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRIKF6hJaLs2L1AI58Zamh4RbhZR6BKDMB/W4BncuQJgX4BwgIOrdT7EaJlgmbMP+dSQ/cHYnhmV4+IHqdJ9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3745
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NyBTYWx0ZWRfX3pZ+bcnqiNvO
 3PJBxQOCO6a3quDwU8fVqxKmmkqheDa31yuX17CKibdyqggt8ksXkTn6Z8/4p6RBs6aHOD7/WB8
 uYE7JAcLqpwcCfksxaj2f8+hBQq0MxZdfXJOcScGA0OPJYlIhYFW4aboBXJQTPTStabtr96fdTC
 e4OoMKjZW154AgUEZRtq0ddpLDCoFlo4c8SKoXPbnHxQ76CscG7RAs60eOrnt7mJlit7Lcceqlx
 OwUEJWCBc5roG83NEKQIdIrnJmISl2GplTQWOhPnmTqwR8VyDXu+6R96sLcrJrI2TVUbuYHQ5b1
 G1nrXUiLwA8u0+R+zhu/rY5v1bKiEzOt0XfaZDgLEttelpDMgtPmQ93R/LmEaLHuD5UFk42Rdug
 SPSayZRGk2po6IxxpoYQdbQMw66ZL2hVonTCyOrCgsWr/u0Jvezz5SrQ8NDj/nhkxRsSdRPBSCR
 I3Jo06ZxcRZ0uVY8Bbw==
X-Proofpoint-GUID: RX65ShUxZIJQjEcQ4inxGg3cJ1712LLS
X-Proofpoint-ORIG-GUID: RX65ShUxZIJQjEcQ4inxGg3cJ1712LLS
X-Authority-Analysis: v=2.4 cv=IPUyzAvG c=1 sm=1 tr=0 ts=6a187cc2 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22
 a=gAnH3GRIAAAA:8 a=MvuuwTCpAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=g-UD0_MmSVei7Gk8AtgA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280177

From: Syed Arif <arif.syed@hpe.com>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC=0A=
switching regulator. The MAX20860A provides monitoring of input/output=0A=
voltage, output current, and temperature via the PMBus interface using=0A=
linear data format.=0A=
=0A=
Both "adi,max20860a" and "maxim,max20860a" compatible strings are=0A=
supported for devicetree matching.=0A=
=0A=
Signed-off-by: Syed Arif <arif.syed@hpe.com>=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v2:=0A=
  - Added "maxim,max20860a" to of_device_id table=0A=
  - Removed WRITE_PROTECT write from probe=0A=
=0A=
 Documentation/hwmon/index.rst     |  1 +=0A=
 Documentation/hwmon/max20860a.rst | 57 ++++++++++++++++++++++++++++++=0A=
 MAINTAINERS                       |  8 +++++=0A=
 drivers/hwmon/pmbus/Kconfig       |  9 +++++=0A=
 drivers/hwmon/pmbus/Makefile      |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c   | 58 +++++++++++++++++++++++++++++++=0A=
 6 files changed, 134 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index e880c6ca84f0..ffaacda416e7 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers=0A=
    max20730=0A=
    max20751=0A=
    max20830=0A=
+   max20860a=0A=
    max31722=0A=
    max31730=0A=
    max31760=0A=
diff --git a/Documentation/hwmon/max20860a.rst b/Documentation/hwmon/max208=
60a.rst=0A=
new file mode 100644=0A=
index 000000000000..ea6d2228fafc=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/max20860a.rst=0A=
@@ -0,0 +1,57 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver max20860a=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX20860A=0A=
+=0A=
+    Prefix: 'max20860a'=0A=
+=0A=
+    Addresses scanned: -=0A=
+=0A=
+    Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+Author:=0A=
+=0A=
+  - Syed Arif <arif.syed@hpe.com>=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for Analog Devices MAX20860A=0A=
+Step-Down Switching Regulator with PMBus Interface.=0A=
+=0A=
+The MAX20860A is a fully integrated step-down DC-DC switching regulator.=
=0A=
+Through the PMBus interface, the device can monitor input/output voltages,=
=0A=
+output current and temperature.=0A=
+=0A=
+The driver is a client driver to the core PMBus driver. Please see=0A=
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.=0A=
+=0A=
+Usage Notes=0A=
+-----------=0A=
+=0A=
+This driver does not auto-detect devices. You will have to instantiate=0A=
+the devices explicitly.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+in1_label         "vin"=0A=
+in1_input         Measured input voltage=0A=
+in1_alarm         Input voltage alarm=0A=
+in2_label         "vout1"=0A=
+in2_input         Measured output voltage=0A=
+in2_alarm         Output voltage alarm=0A=
+curr1_label       "iout1"=0A=
+curr1_input       Measured output current=0A=
+curr1_alarm       Output current alarm=0A=
+temp1_input       Measured temperature=0A=
+temp1_alarm       Chip temperature alarm=0A=
+temp2_input       Measured temperature (secondary)=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index b71acb130395..1d9651947ee3 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -15688,6 +15688,14 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/a=
di,max20830.yaml=0A=
 F:	Documentation/hwmon/max20830.rst=0A=
 F:	drivers/hwmon/pmbus/max20830.c=0A=
 =0A=
+MAX20860A HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
+F:	Documentation/hwmon/max20860a.rst=0A=
+F:	drivers/hwmon/pmbus/max20860a.c=0A=
+=0A=
 MAX2175 SDR TUNER DRIVER=0A=
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>=0A=
 L:	linux-media@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index 64f38654f4e7..5825dda75f2c 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -402,6 +402,15 @@ config SENSORS_MAX20830=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called max20830.=0A=
 =0A=
+config SENSORS_MAX20860A=0A=
+	tristate "Analog Devices MAX20860A"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX20860A step-down converter.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called max20860a.=0A=
+=0A=
 config SENSORS_MAX31785=0A=
 	tristate "Maxim MAX31785 and compatibles"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 1f2c73b71953..ffc05f493213 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MAX17616)	+=3D max17616.o=0A=
 obj-$(CONFIG_SENSORS_MAX20730)	+=3D max20730.o=0A=
 obj-$(CONFIG_SENSORS_MAX20751)	+=3D max20751.o=0A=
 obj-$(CONFIG_SENSORS_MAX20830)	+=3D max20830.o=0A=
+obj-$(CONFIG_SENSORS_MAX20860A)	+=3D max20860a.o=0A=
 obj-$(CONFIG_SENSORS_MAX31785)	+=3D max31785.o=0A=
 obj-$(CONFIG_SENSORS_MAX34440)	+=3D max34440.o=0A=
 obj-$(CONFIG_SENSORS_MAX8688)	+=3D max8688.o=0A=
diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max20860=
a.c=0A=
new file mode 100644=0A=
index 000000000000..5274147ad3d0=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/max20860a.c=0A=
@@ -0,0 +1,58 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX20860A=0A=
+ *=0A=
+ * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Developmen=
t LP=0A=
+ */=0A=
+=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/module.h>=0A=
+#include "pmbus.h"=0A=
+=0A=
+static struct pmbus_driver_info max20860a_info =3D {=0A=
+	.pages =3D 1,=0A=
+	.format[PSC_VOLTAGE_IN] =3D linear,=0A=
+	.format[PSC_VOLTAGE_OUT] =3D linear,=0A=
+	.format[PSC_CURRENT_OUT] =3D linear,=0A=
+	.format[PSC_TEMPERATURE] =3D linear,=0A=
+	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |=0A=
+		PMBUS_HAVE_STATUS_VOUT |=0A=
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |=0A=
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_INPUT,=0A=
+};=0A=
+=0A=
+static int max20860a_probe(struct i2c_client *client)=0A=
+{=0A=
+	return pmbus_do_probe(client, &max20860a_info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id max20860a_id[] =3D {=0A=
+	{"max20860a"},=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, max20860a_id);=0A=
+=0A=
+static const struct of_device_id max20860a_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max20860a" },=0A=
+	{ .compatible =3D "maxim,max20860a" },=0A=
+	{}=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, max20860a_of_match);=0A=
+=0A=
+static struct i2c_driver max20860a_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "max20860a",=0A=
+		.of_match_table =3D max20860a_of_match,=0A=
+	},=0A=
+	.probe =3D max20860a_probe,=0A=
+	.id_table =3D max20860a_id,=0A=
+};=0A=
+=0A=
+module_i2c_driver(max20860a_driver);=0A=
+=0A=
+MODULE_AUTHOR("Syed Arif <arif.syed@hpe.com>");=0A=
+MODULE_AUTHOR("Sanman Pradhan <psanman@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20860A");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
