Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035F31ED81;
	Sat, 25 Jul 2026 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014492; cv=fail; b=ksVMyl9G8uFhwkU1WO2HmjnDHijDU3e+wkQfnx4/CmI8yqLvmvuFrpZHewHkjPe3Z2ABkF1F3Dyrpzm6i4AkqK7HKEQiv2/v3qmLvgbEQXHtXiluHe8G7EigThMISCLVF9pfH7UMQ9STm3G3a2Ik2FZupZKV8LaVZAnOGWPT4e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014492; c=relaxed/simple;
	bh=cbXQRDIib7pMIQVElX7K8u0hjFT3IO+LOQGuRTbTVE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z+7rUwffyjOG/lLqcShGttX67tB/u3NDE8FJdfg9mTQ4/9iLGN2hvZSeJyOWxYHON4ya0FMzFHsQYqAipLHdns+lo2HJAZGRjEF6HN4kliSxgc7Yyyy3YcpB7b25aVRPPCTipMi6t14SUfnY4wFh0NoxyJiLuLdkWLqvbO0lXZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=LbZhqmR3; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="LbZhqmR3"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PLA9Is731830;
	Sat, 25 Jul 2026 21:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=nf
	hFUjSC83bGz+tSFvyfhRxVoQMzp1GaQGTPqfAavvI=; b=LbZhqmR3RxwZqYmIBz
	BOwXJ2YihO4JNZ5HixYBQL9N8BEhaJcp2B9GjSJexctE18Y/tgKSrEDlkTKAs2p8
	Guto5TZOYbmNR/dZP+Lc1wMvQ6KaIhFM1QuQYmEDIE/KaAO9kQJxdCi4wK+wH4md
	T+SEXDWCyWla0cgkEMwwkCFfygK6OL7tAdlm77WqD3J14A1lrGEIvNYtycTh8Wxc
	XGzDswWXuu84UFB+xw5Bc0LdjjDyMKG5nAlPrFX3oG7VYgZqZMWbYjd/uEFMIVZx
	qo6TyKUdX8yNh4MOiL8a5+pCglKrCr3MTjte29etiUKPLX+tnmumWJXY/Lh1BUT/
	kenw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fn4tr02g2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 25 Jul 2026 21:21:14 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id EE742147A6;
	Sat, 25 Jul 2026 21:21:13 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 09:21:13 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 09:21:13 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Sat, 25 Jul
 2026 09:21:12 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMTX1aMsnJ1Vpo8E5wpG9IFxOgP4k2Coc3vQZpQDbncxnjlADDs0cnFMjSlxhf1kGx61pnmPUZGFIL/31QQTE3fejhfNNQLoLOa5GD0TRUwOaNURxv1fgu0QwuKO8MvUCv75WSj9KRWnk/UDDTpi/ECHv2JrHCbUaKA8C7IAkAZxWA83libeD8IsZCzGKhKJLnyIWfg9NIrwfWVHR5lhlN7PUb1/58h6msU4AeyFyZ6FkjR/iDroU2U9rqyr7qfeqbP8oPqUP8HABbSerwCHf5l+au78hcIi+Kdy6AQ7LOi1eRSqtpOKZbbndSbEIfyO9rlYoqjmF6DHfMqWOLTUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfhFUjSC83bGz+tSFvyfhRxVoQMzp1GaQGTPqfAavvI=;
 b=TAUy5yqjqF5pK2X51/wk2+MbUT6esXZde/UEUjbn92HuLADnz7N219zKKNOyBwWcu/WeG1qVFx3SmfOSVui+kA+W8zH0DCpDmZjbxDRqn8b6n4scDwbD9w2CvLDyCQTtZvmzjLSiJIdTgWe4a9iosasfutDQae4e7eZUM/bknQJiOFdWCQHLipT4v0n1rsXUxDEtW0iTTZEkUwik4ifzZEPip0jflTPm20NgzQukmvopuwk50ge53sBYKNJuEmQmVLbR1mkwd4ZyfOgHrLTFcFwr55fF3H4EKXduB5hLInjl7CRwexSQi5aOJBOi5QMZpBm14lRfxiQ6AwWv3d9wrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1498.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Sat, 25 Jul
 2026 21:21:10 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 21:21:10 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
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
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdG4x34Q4P1zCD/E2JxkiuennFRLZ885oAgAAjGACAABhXgIABkMaA
Date: Sat, 25 Jul 2026 21:21:09 +0000
Message-ID: <20260725212045.289942-1-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
 <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
 <20260724195912.262226-1-sanman.pradhan@hpe.com>
 <bff175c3-f29a-42eb-a857-c06f66483897@roeck-us.net>
In-Reply-To: <bff175c3-f29a-42eb-a857-c06f66483897@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1498:EE_
x-ms-office365-filtering-correlation-id: ab58e9b0-466c-4517-f072-08deea92a5be
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|4143699003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: 5gS1N03p7KqQMCfA6GH2ChjbMk30KC6lOyxLbstJzHtOUIVldnKitrqXxTy6CWXYFw/Ao8y7ZGlfRXkO0ziYqayf1+iCK9lhOiYjX1NmzAz10tHzTmliwv94odCEQgjMrF2zaPqZ/jRKj9S+a3zi5oBFU+vxrCdHTy0IFDtP7K6aV0zA9qSh5rGwba92Z6WgOIgSn3sT+VDLzl2WZiBiHP/OJ4ve7PodG4wDA8Z4GjGP9rDyTAbHVE8FljMLbwL+kPjtaSWPxlRzm/gHWFpSlwGcwldT0bOHW/vXvpZiNgD/WMqzPUrqiC5DDAjGVmLI8VBkchBXcLeWEnGPm1S+xenUwgi4axUH6kFmgMDUUaF2Nfmv21qCdeGEWW6oo6ueydEFASpT2tODezK1D7zA7V3LMGqbfF6pLZLqTjduvloxn6Ag6ilxM9mWrhW/TmNL98uHGKuPODqRvQz7nltkre0OXWhDNfb/8HAZ/HcCfbhTtG7Gpa4jAA9UIqaRT3B9VxdQ7s8S3ieX8ac0NvhlL+Nw2TNz8AmQ6Ha1MQAH69QiXpeDNAhugB4UvBdZcCC3tEEHVWTy4Yg/fMtyoB/MYODSxvutK6zFLv2hU7dOH/qQVzgl4OuLxOdvwFysCb3onQa2uR4rJLIR/wawLjRr/JPQhkclBw5daxENuSWW+RrXEK24arRIrtbveX6GqodLQagC93DvHHjL3TrHTej7K3GERFZoHeNmbGPb25Gts8w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RpkWYSwiFZBTGVqd1yKb8XAOjeSfWxNAF1N4b71AnzVpDfszPC5lXYTDMw?=
 =?iso-8859-1?Q?aDb6d4YbZa1ega0ocRjXC5qr2a/3bDX2Q1WBnxToOzLTUImgLyyMQbbBr6?=
 =?iso-8859-1?Q?s3r+K10YbAT57B8+/bF36+2K6e4WaFKJB75Z4QbbiCcllT6n1VDuZWTqIb?=
 =?iso-8859-1?Q?ybMLSW3Wzka+KrjTDa/AoGdgBU9/ok93XKXCEYVMCnqSgXXk4vZEiOvcoX?=
 =?iso-8859-1?Q?mRPv7CQR3kznWzZc7+paCKvp0MVsBjWsSqEGHj1h66sFSWahu/FN/Is1a8?=
 =?iso-8859-1?Q?lbAmo9BDMh4QkOZ6kMVIYCBkn0oryExV+9qLB8blM8KafveirfFxrFubJI?=
 =?iso-8859-1?Q?XznrsXyXIL6niJ1vqBmAdjQQdjrZbpHVqpctVErspzSL9D83hNQxcT0H2C?=
 =?iso-8859-1?Q?IbHXbsciq8j1ZqdyEuEpiQKbZzTRXq6uVgo+Rd3bKRgR5bRcu4PD9qERoA?=
 =?iso-8859-1?Q?q35z2A39ZWXiscrrBvNrGW2eKgkvFfbigllPxd1IEmdCJyVUZ4GUSeLnIA?=
 =?iso-8859-1?Q?iyB03eGNHVhz8P2gR9E/SvqFEad5jthqxXfbo1UwtXQE2f0SuyHavKyUBr?=
 =?iso-8859-1?Q?VdkYhIWcaUQYUJvz44uB9c7W82iEtt8VCwA0s3n3Oijn8DXMiOh+nk6tOa?=
 =?iso-8859-1?Q?d25J4zlBTozajps4fcwQ2jAq1TjSSE1+ssCrZHXchprVnEUEQYV6favI55?=
 =?iso-8859-1?Q?BmnhoxfNMVV1Fbux846QhIyrpCDWT2MHHWPVcBLeKTaEpC2CPUp76LUYxX?=
 =?iso-8859-1?Q?jP+SMwqHKbYuFH4b/q2owZjNE3ZTFXSwzzxZlbv1FVeJNuD6Rwzu2X6q9a?=
 =?iso-8859-1?Q?RRoy4wPY8u3QTkOMmNJ78I4/JfHUZPOjKwSmKuLYk7slOMyEBC/u3uXB5L?=
 =?iso-8859-1?Q?3hj3vEgUVo71lw78zRdXLSMilUCapT72iKLOqn0BUuO3yDYmg2Z9DESdUP?=
 =?iso-8859-1?Q?E+Uk3mYHJoB0Z/tU1Cu3KqcrAa3H8eOJaDSLkW5f1h/+fdlQVL5YjH7Uts?=
 =?iso-8859-1?Q?ItvKSDKwWYwMTj9DfSQ2JMJ8cqTPQTfDGrCXzjiCz/ULI7+pTj4pOfW47l?=
 =?iso-8859-1?Q?wI+Qb0YcrwvnEyx920dz2iptfVTBhO5p0EcR23FJYi6IkJPOw8wt4OVATR?=
 =?iso-8859-1?Q?DWVQ1fM+eYVpn48+8VLdKg+gi3Lfx+Xrc5o07/Dv3YM+hLOGEhcT5SJ5Ta?=
 =?iso-8859-1?Q?Ni54+4KmvegedUEg3kjWWIIi5efryMcxESesNBw21Fj6ziM31bsbCRNtSH?=
 =?iso-8859-1?Q?97jVtUTeIrAgD3/5qUj2w8p1/HkU4RVQs+9P1Cy8ivAgNkUr3ifrWzZIEb?=
 =?iso-8859-1?Q?v9Z60jRm9MSGH9ZnjYK/5OurmfXnXEla1eDI2sn7UXlHEwuAT8KOYPWsWx?=
 =?iso-8859-1?Q?0uI2IT9yUzbrjfksMdxAdPFEtqtQ56gTz4MxmCl2spMSJ4QRfuHLfKLFPb?=
 =?iso-8859-1?Q?hMZuTWRLTI9SBEeJephNEklR0vl7JBe7ZyoSAiHXFlgSDEfjssBTpKU1pK?=
 =?iso-8859-1?Q?dcDVsWcM44QoNEFvCfFUadGEYaH/3Zq5oCHA00deuuj2j2PYloQ8kWrA8h?=
 =?iso-8859-1?Q?0GUuz/f0JveBnq1MmB6kWl4Dd1MwU1LQIu5jz/pIu1iouMkJVK67QIZ9/m?=
 =?iso-8859-1?Q?GevmoOk3qlft17QhXeHZDWbyEkZgwwmTABopNLqbCuDLCmzRQ6HTk/w5vg?=
 =?iso-8859-1?Q?gEKeOUboKUsqxGMIoeGJEtxj54UuUpTWIvN9kQLPROxsFHDwdA3K3ur6vg?=
 =?iso-8859-1?Q?TMo8n2BD35cmghzhwsK4qMvhP3f5QSMxXK+OOoMrOSpIFsq3gbPJS1j1cc?=
 =?iso-8859-1?Q?p/te69vJGA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bXaxaiUBE+cMw9bSWiDn8FmSX9ku021mEEF5SgMBGH+YMFRpfe7/k/ZwxvYtnuM4RztY25W2iYrfaYlxZKGcUxGXDOOLfvBkSJauuSg9WSJeZht3nO2UYuKgqvDlf6SJodUaIO5VmQbGcQRyX6ahskmy50Nl+rssqlFi6ipyP/kLyP7es5xqljUorH191L3m6UqlbDVbu+FGwchJZYF31UAvMjuMf8iuvsizOvJbciA333fzB0LuqwFgUO2mKierwNb8bESs5swMF8nAsgzkJC09RCk3pZgWsgF0o3LDISZjUjnS48keXIJbgdQnbCaaB0VptYla4P9tO0f73tqNUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab58e9b0-466c-4517-f072-08deea92a5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 21:21:09.9860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0em+0O1NWPdHAb+V6br4M2ALGZrPixhzTG4d557l/Gs/DJMGHe4YktcZ2VPuIWSMcAoeC1gT3xvmSPm6j01RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1498
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDIwMiBTYWx0ZWRfXxMC1B9bxz1dp
 ET0Ll6ThlI+dTKSQAWEIQnEyRtj3FUWvYCuUQnins5Ekq84wNHDeKxeymf74x0p/fVSrrtqs+GA
 H6DmsAP4ANtd8bne3ZYN2U6yh/CD5z2Lo39/iutfDZqaMisGZ23f3L/h2EKHOn1y4Yc7wNr9dx0
 N5V1UPTFgVKGhDzPOM9UU0SlhZ6QQqEO6axKBwGs7Hwl5qsHy0Q1t3bTw61KcBx3zrQCfe0DmbW
 Ez2Xs5x+2i/HF0XuVEw2nXT8h3dMVfaey5CAGSqlId9h6PZiAnr+e0aCZ9FwUnbn/qQaI5qSMBX
 G8L8445eKuCvU1hZvBVTCAzcWaZVnD7QL92JlccgXz5gBzsSfJGZOVHtu3AOlB72UcJiirytvcJ
 9akDcMhi4jrY5PC92a67uRYwElKNtnJ9iSTbUF726rVAH4KwtpwKr7Ad7teJLP4eq7TdqrR+wJk
 8ScnweBrQMa8t/3eapA==
X-Proofpoint-GUID: dW4kkaQ5Qhb9PDAC6jgDq62gaA9M0Lf5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDIwMiBTYWx0ZWRfXzYdK7WG9B15M
 Hrl2oP6KHZvpCJHS3wzMkdUcLRpLo3JVl7XFEzKqHmx89mbSR1HwTrRLjZypZ3p7/o0DrOOrNIs
 Xoc3Uft7+YQ42z31Wc9Hm2kU+WNQa9E=
X-Authority-Analysis: v=2.4 cv=ctCrVV4i c=1 sm=1 tr=0 ts=6a6528cb cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=bdxPK5GIHWM_DLijltUA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: JSkIw8XFByrGVArdmAXDMoTg1bwl9wHK
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
On Fri, Jul 24, 2026 at 14:26:19 -0700, Guenter Roeck wrote:=0A=
> On 7/24/26 12:59, Pradhan, Sanman wrote:=0A=
> >      Co-developed-by: <co-developer>=0A=
> >      Signed-off-by: <co-developer>=0A=
> >      ...=0A=
> >      Signed-off-by: Georgi Vlaev        (primary author)=0A=
> >      Signed-off-by: Sanman Pradhan      (submitter)=0A=
>=0A=
> Signed-off-by: is inappropriate for co-developers.=0A=
=0A=
Understood. In v4 I've kept only the Co-developed-by: lines and dropped all=
=0A=
the co-developer Signed-off-by: entries.=0A=
=0A=
Thanks for the guidance.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
