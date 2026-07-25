Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A7433D4E1;
	Sat, 25 Jul 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014447; cv=fail; b=Lx2df1MQYVe37NNl00Q4X+G0xXhRno2OHwgA8ywfy64U8A8J+5+OerUwomyZcF8y1zPT2DfMK7hSTX4Z2RwjMuokITsetqd1p8gfRb53Yz+DPQKdm8kwyVIZdJEowHNWf28hIeSrsQtK7bivIfjU+qkLzGh6yz0quMclcDwhDx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014447; c=relaxed/simple;
	bh=VuDOcE3XA3fpLFWHu65/rRBVNxJWrkm4MarCxykhz8w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BAwOeRqkDC7OU/YcED43iN4gTOeBtCIUfiygiWMtFSnflzM0BnQRgrmB3362Pa7tJ1b2cR5N5p2IaUpgHBkKEOQkRr1q5hvmGj/OscK9xVyj11AEgVCy33HAF3MkyYCmomZotfN2be5KefS4dVsYr76DiUdaVKld9hAQ18vh+Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=IsaPnMmf; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="IsaPnMmf"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PLA6js731710;
	Sat, 25 Jul 2026 21:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=N7ijaI9KOM3ViyTzYrFSD1Ug
	FZEodM1Ogb7FtaiXORQ=; b=IsaPnMmfVGVS8e1w+HnqRlpPT98ai+EplXCv39/3
	/J1Xm6QZ/Xw9ciDsEurg/mIe5SywC+4JbTrO25auG7GrcsMLpggYhsqvU/t2O8JV
	RZAOiiC3HYK2ku2tjcNFgwaqKGHoL5NAxnOlypikBi59NeCz9FEWRvzlhekyBI9x
	Mo/Ouij53UE2Eysmo4Qxhhq5W5wyUKhm3BxIgdtpGlx/mWVbttmVYDucT/Zuct6V
	WDfzzCvSPqfujBJwx87t1Uj8tfcriTlz5aBOwSlr9pCavdYjqsYyor8PM2SC+kQS
	NmeV0+gw09Uh8LVsGb13nirdKXCNQFxU1ZMn69iDcPdzAQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fn4tr0266-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 25 Jul 2026 21:20:15 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 56BFE147A6;
	Sat, 25 Jul 2026 21:20:14 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 09:20:02 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 09:20:01 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 09:20:01 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Sat, 25 Jul
 2026 09:20:01 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3VzsGYer2TR5KWl9m9uZfTlJkCNQjHuoswWHGwZXSC20zJilXyzdTUyJu+pITgU/d+nKp+5GHczZNnngB49IoL7G5776mKMH37GyQE1TjCm9OlZYRoXRsfBTnFRl9W0vc/8vnj84+OENUUlUZJGfTrxWnjyT0to0Omu17GX/QWiyxbyBC1p5KcYa8dKu6URKGuB+z37Ef8CRpk37q5fZT+LQgNi1xT5Z6ZbBPS+iEisIOvuRHcoGaKnNUaB25NMWQq4LR3dHMJ1XM5A2/42aekeHKo6Z85v1YpHd/5WGQKkd7yzSrhiRQ9sCgX9MjzNo/QDWPuRmgNwqv+95x1xFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7ijaI9KOM3ViyTzYrFSD1UgFZEodM1Ogb7FtaiXORQ=;
 b=lYggZ95nlYIHDphHnJqGXkLixnHgKNaM+2HRpbkyqwAvJes52KvjTX31yL83JwFgKFNAscTQ0o/F8bZ/gyz51LYeL8NyzJa4F8Qh3e3NlM5SV5u97Uyq7JIVnV5RoQiojlBdb+5Ue7nZNolG87z9nhs3i20rM4IzjQh4vuNtg9nDA7cvdsCYFm2hDCX7gpvAtF4W+Cf91RDYSr6zkgfwG50SCcFodYtU806hTmyqMBTZBKTDludkLZAMWnl0kAybguzy8hzEU5IYeyRC55e30XfT99BkV3RhAVT6G+sWn7BI5wCzy7p+FaPTaH+dqniJCCbiK//YIMbMklprdIicQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1498.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Sat, 25 Jul
 2026 21:19:56 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 21:19:55 +0000
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
        Debjit Ghosh <dghosh@juniper.net>,
        "Jawahar Balaji
 Thirumalaisamy" <jawaharb@juniper.net>,
        Santhanakrishnan Balraj
	<sbalraj@juniper.net>,
        Brian Mak <makb@juniper.net>
Subject: [PATCH v4 0/2] hwmon: (pmbus) Add Analog Devices MAX16545/MAX16550
 and Volterra VT7505 driver
Thread-Topic: [PATCH v4 0/2] hwmon: (pmbus) Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505 driver
Thread-Index: AQHdHHtXwiTaw7z/fUKj7drt4wa3ow==
Date: Sat, 25 Jul 2026 21:19:55 +0000
Message-ID: <20260725211945.288415-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1498:EE_
x-ms-office365-filtering-correlation-id: 6d3f35ce-bdee-48e4-b8e7-08deea927990
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|3023799007|38070700021|10067099003|56012099006|6133799003;
x-microsoft-antispam-message-info: dLjGee4cgZBBIqijJQiMwIv8hebsFPaG56C6gQ7jQrXnDLxQrocvjtr7PsgdCwCmURLseIpPyfU1oxWgtNcjKxEL0RKPH8aq6xwTlTrudF89EfEquI88aqyjWasCl4diW+Aw5UXeEH6MnMnkOu85FHWGGs0SdNF0/INGQqNTpTm99d/ktD9q4rg4j6+Bffkvyl/rEdbYyb7IcJtNoZwG49e2YmfxEzVIV8EQOGBo//C+Np9UoumEHuN1roIO/EJ1jQz5cX7nLWyd9viZ7Gc6NSAIhfuUjR5VrkYmjT8jyLCu1N1kKYelPEQ6v/WVTLvyjO+oB9Oklwqhqcc0Fq0IvEn3ogALLYuRo2jAI+uexzmL8X03yK+VBLAYXbTbTuEXkPXxf41OKH7gDfa+GYVEllqQAst1WOd8B+0xnbsDpXq7aHP1Xk8CPAMdz7Lb4DyDmS2LNJbvqd173Re+5ACFdKdFEUp8TiJpWaNDqa0shR0ZQZ4kO2QAjn9bIufC61p8QhEn+7nBOVNB9PpV90O5TfIGtSrxhHB9ihawU4k3E5J3YWmzbusZIXoi8oD5H9LNf3gYzxW415RsI9yVQJg75dr6eT+8I60lByPIpDBAa7aDJW2IlFxla31DTuNKy5qgU3SHwpJ7JdOB6Ui2pG4eWSHJeyXC0LlmHl2oQndLiPNYsIqZDt1cqjwZi1ZH40tZwo5UAp+H6f0nKjq9KsiUthCBrQvGjsrBoBZP2JHuoqM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(3023799007)(38070700021)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CfE5VcLIh0g8JwHAeUE7gUgfyCZbiqA+o7GxR4Y5SLJK/1LjxMtu1wugd6?=
 =?iso-8859-1?Q?rpbZC0xxi39OlbebvGhdX8rNwVI2m9zqIewHqH4bhhOz4QuoKyX9HLmUiD?=
 =?iso-8859-1?Q?CK4/UpmN1+JfW3Hy5ZT3mH1FrzE/03xlhsC3uP9UY1z1BOuzSwsyAofw9X?=
 =?iso-8859-1?Q?MgC4I7gzMYbCnJ63BT2E6wkx+reCxwYuZA6oygqPeCG94b41E3ajfLSQyf?=
 =?iso-8859-1?Q?Tb1vOW39xsmLA83dKlhWctmzn7NoAMzNiyaqN1TLVTl9hfc3NYwkrckbwp?=
 =?iso-8859-1?Q?OMTw7yElV21ceeBxaROv71/sVTvRuJQKuWN2zLlWb2PqFn1W4V+r1JFwgt?=
 =?iso-8859-1?Q?Eb28rHAGX+8AhHTf7QRbwETuVmWOD25lH9B777W33em5BOLWhYlH5ZBlsJ?=
 =?iso-8859-1?Q?g4aUa3TSyeaWksBuGspEfMhGXFTrmlYxLlkj9AZeEEvx3xc3h2T8GDUqQE?=
 =?iso-8859-1?Q?o5uA+iiMPxpbK8pRQTOZFKvijrBGxnwVnauRe7af+dx7tBCCONFcR/1S8Q?=
 =?iso-8859-1?Q?5JNMqRkYLwA09pL/aLva/IzORy4JMTfyuYj4w2scr/OX/PZe0LVz+Omy+7?=
 =?iso-8859-1?Q?R8N4sNKHtvZidoJZb4IjIikI0teSodlDs9NEqdoNr2N1B2cwhmUY5Rhq0D?=
 =?iso-8859-1?Q?yyAk7A6leFrPrjCHbjlO/gk57S1Kn9htKf0A5oD9+Cmgb3GMne8CYHl1gA?=
 =?iso-8859-1?Q?vm7FLBOHb0u5wEVAwqh/Bxzk0CkAcsHVC+xPlVmHZcwPY5cdTooQ8C1yw5?=
 =?iso-8859-1?Q?suI+aXT7lSk+AUoXxbg4vqrTzLyuzvtWcpX28btyKHUty8Y/IEY0sUo5Wv?=
 =?iso-8859-1?Q?gSa33f2z3fQLhB4i3OE5YehIzStPF4oc1TLtwBjHdxSEUaHltXFEIS/Sjb?=
 =?iso-8859-1?Q?BAcyvd4MEeAxWnWzT6yus7FQTVmopQ3OdmAZUlADZTdXm99qeGiamd3P98?=
 =?iso-8859-1?Q?ifWMourczGnvYSo+b2TtxFv3H1iAZKPixwN3hUZntKPdlf5XfMa+B+k0dI?=
 =?iso-8859-1?Q?lWEBSd0+YVseQ8qV1Ya/GYAv8THnahhJJb8chKAKcO1+WgjX8y76dx5dm2?=
 =?iso-8859-1?Q?hJjyLOQPeejXALgwoLA4FULQTVy699Wuq33w8mvng9REbsSbOwSdhdnWUI?=
 =?iso-8859-1?Q?0UfVRGVdy/6IQYmrjvKVjezjNdjsG/F1eavabOC4WP1OY09+HhE7duX8qS?=
 =?iso-8859-1?Q?hmdCmrTbnhz7Y+FmX7itTAptGP9vuiZhqxTIPhliTcR4tssuv519TCMLB5?=
 =?iso-8859-1?Q?i3wkDoNrySu1BqekmfJtLW9lhYEmpkJcs2eBZ22oNZKei4glx67VkfRSLc?=
 =?iso-8859-1?Q?h8UDDqKBwvfDRxxm7cwW3eb72l1WlrDQWSP91mz3C3FnSO0xXh4dQVKdiM?=
 =?iso-8859-1?Q?bjQnE3JocV2UwrOjXkw/uMZMD2VyS2FPmDZTWV4j7N4ELhQQ5k45tfTvzy?=
 =?iso-8859-1?Q?uOwdLKaF7uXplGQdyQm0iYmaDbXRQIv70mtCdoBQbksux3P0TOpI8+hPLN?=
 =?iso-8859-1?Q?FOX6q1k/cu8oYgUBIWLLVxjbCa+WUkPBf+PIOqMwkLO0KNxitbpmIaAneV?=
 =?iso-8859-1?Q?7TfD6Iqli2bE0oJf/s6xX22o4ypALqDhU6fcJre7crw4SeNlAl54yC+Vpa?=
 =?iso-8859-1?Q?u8d6bo8dzHW5/jnkQCN6RqA07lGzHq5O1fb8jY+RFoiCzLOuhcUHlr3j73?=
 =?iso-8859-1?Q?6t9lkXPaf5zIzjNnKsTWQERsFKx6j3bFgNI1Uj+ep6+NhDsndYiQtkZy2t?=
 =?iso-8859-1?Q?+OyBqo+n0fML+FwdRr5DOKrA83gmzfQ8PVolTC2DawnPxxLy8fnJjOc/2Q?=
 =?iso-8859-1?Q?OBLPjVeB8Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e8XAqQz5EHrZZ5LRWeDmhrfIxLeJzZkm0EArrzya6hC/yUvbnwokvZTf2et7lVS1g3N6bjpH79DdH40o8aUdb1KSExbLYEjTM7sMAGsAatiG9x5pmT3dnFBR/iaiYGyKIIae8rRA72LGzwLts1FOTjpkfkJhVV/wOl9CycNIIeFjBjM/hJOEaQKoBlB5cGagd0JwVZ/yR5p4+Yc1StVqI7aNZx6p4TAiBOzrAt6VirG70kdUGybnrU3zYydpQC4tjlgLfFm1xG3lJT2F9BJqTFHDlhAvyGq0M4uFm+p+LI1lDjcEuGGv8qyQ5AD3erwRrE1se/zyHcDmoBZIIPXBPA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3f35ce-bdee-48e4-b8e7-08deea927990
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 21:19:55.8330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8blUhSlcKyOmT+FT0AxgeDdTwsVDjzdCDYNoBzQjDzR0qCoL6tARRvDWdhP7A5hWcyzXJo4lXNfyPM5N/7c4mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1498
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDIwMiBTYWx0ZWRfXyL6HWq7WrJqZ
 P4Z3HBqLWW+c5wfuCqoKSoFbifTZ44Wjj2KAM/4uO4VGBbIRNcarRSkrzRCZIKTkBAvLpN0WcKg
 0OhndrlK495Zf+hhCJPpBysWgQh6II/4sN37opGCnxjVnEDpPcNr9As1oZJi4YEneLKYvSskDWg
 z+3aRqDDYUqRp/H5HZIlTVGgJH1o7I3qqibEawSPb9G4DUP7MIh1Ghwiapchwp7hP1DqT338iVI
 +J3pRVMiMvd8TybY7k0BvbkuHpbBTW70aKZ02sJUMIAA1FDQRN1Ba4iRXuAXJOaVT1ydoINfzfO
 ZU2XIO80u4pLHPT8qYP5V+sJNqNt7sXA5pIlyijkLw/zC97yd0ErBKnOY1Zhu3d1DaETwK4Mt16
 RXvo+kho72Iya/6CekVFBSdX78/v1GjpGtAUjvC2dIk54K7LK1vUu6X+RqY4lib4tNzANs9cvH8
 F1kOizFPT+jSL4PzeAQ==
X-Proofpoint-GUID: _uCaYLri8QzsfQ2IDEPFLkw-KTQc5_2M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDIwMiBTYWx0ZWRfX8PUu76dn3e6j
 NUpGsVlbmugbcp4dmE5IAgP/nHLgUbr1PbApg2LWWCEH4kyGZTxbmYujH8Gz/goV0aLEUPkmZI2
 h25OuV7yTvKJAOns7x7bli6JuWNFSm0=
X-Authority-Analysis: v=2.4 cv=ctCrVV4i c=1 sm=1 tr=0 ts=6a652890 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=AvebblhZK1Ahs3EYZzMA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: CUSKkk5tpo6EdGBXySnUBABf59th_PAp
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607250202

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series adds a PMBus driver for the Analog Devices MAX16545 and=0A=
MAX16550, and the Volterra VT7505 controllers.=0A=
=0A=
The driver reports input and output voltage, input and output current,=0A=
input power, and temperature over PMBus. All sensors use the direct data=0A=
format. Peak input voltage, output voltage, output current, input power=0A=
and temperature readings are exposed and can be reset.=0A=
=0A=
The MAX16545 uses the same programming model as the VT7505 and is=0A=
described with a fallback compatible.=0A=
=0A=
The current and power scaling depend on the external current-report=0A=
resistor on the ILOAD pin, which can be specified with the=0A=
"adi,rload-ohms" device tree property. On the MAX16550 and VT7505, the=0A=
severe overcurrent-protection deglitch time can optionally be programmed=0A=
with the "adi,ocp-severe-filter-us" property; on the MAX16545 that delay=0A=
is fixed, so the property is rejected for that part.=0A=
=0A=
The driver was tested on Juniper PTX hardware.=0A=
=0A=
Changes in v4:=0A=
- dt-bindings: add an upper bound (maximum) to adi,rload-ohms.=0A=
- driver: reject an out-of-range adi,rload-ohms in probe so the current=0A=
  and power coefficients cannot overflow s32.=0A=
- Credit the co-developers with Co-developed-by and drop their=0A=
  Signed-off-by; order the co-developers before the primary author.=0A=
=0A=
Changes in v3:=0A=
- dt-bindings: clarify that adi,rload-ohms is the ILOAD telemetry=0A=
  resistor, not a current-path shunt; note the OCP filter retains the=0A=
  existing hardware setting when omitted, and add it to the example;=0A=
  move additionalProperties after the allOf block.=0A=
- driver: use per-device match data instead of an enum; add an explicit=0A=
  adi,max16545 match entry; use a standard copyright line.=0A=
=0A=
Changes in v2:=0A=
- Represent the severe-OCP deglitch filter in microseconds=0A=
  (adi,ocp-severe-filter-us, values 0/1/2/10).=0A=
=0A=
=0A=
Georgi Vlaev (1):=0A=
  hwmon: (pmbus/vt7505) Add driver for Analog Devices MAX16545/MAX16550=0A=
    and Volterra VT7505=0A=
=0A=
Sanman Pradhan (1):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX16545/MAX16550 and=0A=
    Volterra VT7505=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,vt7505.yaml      |  85 ++++++=0A=
 Documentation/hwmon/index.rst                 |   1 +=0A=
 Documentation/hwmon/vt7505.rst                |  89 ++++++=0A=
 MAINTAINERS                                   |   8 +=0A=
 drivers/hwmon/pmbus/Kconfig                   |   9 +=0A=
 drivers/hwmon/pmbus/Makefile                  |   1 +=0A=
 drivers/hwmon/pmbus/vt7505.c                  | 287 ++++++++++++++++++=0A=
 7 files changed, 480 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt750=
5.yaml=0A=
 create mode 100644 Documentation/hwmon/vt7505.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/vt7505.c=0A=
=0A=
=0A=
base-commit: fa8ff8bde9207509f90adacc157b208ee732adad=0A=
-- =0A=
2.34.1=0A=
=0A=
