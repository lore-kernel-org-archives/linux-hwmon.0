Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841860;
	b=DwPNUxJHOZtC5Gj//wpG+dPZDc9nqN7SajiNin3DZHTiXKYXJIx0c+/lnZtyaksM2THA
	 W3o4FkBlyqGaEMvC85pR+Me2qy4hIUBr2esSMPzBRZVtQ8dnQ71+lS/LGyoVf8FQxNNfh
	 iiVFbgxmfr8qMIol9t3awaSd86U4p610DRZ/aNrdDILZ5aBfbv6Ao4HIw8ppupJscd1Kg
	 BH+Moy0lAipMgpja/eOuO32c5DnE8X8vNqRZ5pWuQXzxoDwu+tS8eyZPdZbFd7e1rcbSQ
	 woGI08h0gyHvmqRDA8UUMqE3cW9M3SGVNoXytcBGn5XBJwfBgWloCA57BxKcRbRhYgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841860;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Tkm/YAkMGW1fPSINDNQ70uhQelLjk8og+UxVid5ym7I=;
	b=zq1Ey1DN93nwdH/00WiW6ChoymWohYu+e4Uo/UMx8GvEbf61m86V5/7IOwe2E8KGThHu
	 Yg6zRoQ8dmA1d303uCthFYoA2iqKsePrk1iR7Qnpty3x7l/lAMFcdBsRnx64pLxzWtumO
	 zMmxuOkhqjusSeb7gq/sBa9M9++ncOvpXVXrD1XFoLMTzk802HZCuSw6ypScy9ifu881F
	 NihfDFbw094RGISYHHAGVXoVe+MU3eTWIVmU8siwYNC1urCr377UvN7UpiY9nkCIZ5FPK
	 L4oR9KrPi6V1hKqyRgKqMAN7gCyJ35yjiN4aQ1oV0APOwoX4XBE/ezlCcpXvB0GpETA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rLj48XMj;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="XEk/exO8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D8E606D80C;
	Thu,  5 Nov 2026 01:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D8E606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rLj48XMj;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=XEk/exO8
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50q7dj753989;
	Wed, 4 Nov 2026 20:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Tkm/YAkMGW1fPSINDNQ70uhQelLjk8og+UxVid5ym7I=; b=rLj48XM
	jyRrltxQJmNJt4f2mlxSDF0aSc66dfQCUpUj/0lcLrdoBBuGArzGsq8j4GHSaBe9
	zMXfV7UE51mvQ9OL2sezVcczjI79TFC2RpuL+osYcYeIUIZ1vTp9IjdJfuFpu27y
	hpPcsdusL0H8GwKL0dGuaB1qxnXQbgmpCZIFvbiv+3Oseb4iQOxj+QpOVUyaRxGa
	Yukd3OJ9QkcxCVcJ9sF8AFNbOMvXNz7lzPMeTWurbkQAN33+SKWUDYqPe31Men3Y
	tamJadPqiDEcyJa7j+lvPWQVQ3pqGGzRv54cf+biKWiX1V8U4Y9DN3EJ5PApVytY
	Vgzqnq6JxISv27w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Tkm/Y
	AkMGW1fPSINDNQ70uhQelLjk8og+UxVid5ym7I=; b=XEk/exO8d3nH+Odv1b8vL
	qh+Za26oxNJMRoVDaB7VYCcBsNdX5N7rEDHh5hkEvn+PER0NTin4DWplVJSmkSPj
	mFrTEDCy5KR3sr4K7ykRQmtoT7AZPvvn5R1Yl/ndiEOAF0BkYUdd9SZiTaKzeZFn
	BeKXwlGPBeJgQ13onR22Lx8Wf51P7D/bd4yG4p/WrEF70egCfyJlBZHkmqQczOgc
	YxvKq8FxaVrrimF2sut+wsyjj40IZ6aCLHd9DlAcFdVbxNhtURDVKwskZvO6FIq1
	bjEwWrI0w+y2JY8ro2bKLaXE4z5o8STXllaBhC3HD6SjNbOgRSJGp+J51tv8buBI
	g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hr873am1x-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 20:23:57 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6vNGOfIi3yNs+wr8Dc0hkxBdsBQZjZDdwHR3C4HIJ4dpyxJj4jtnKkeehIya2jD03t8ruz5DmnWJJJBzhuQqc09LDS4dM63ar777BTzE5UuuPuWqN3gGokGRFxXSN88dswYccaNntwGksBZVJdVFQ66YpF8AXuHyT9fWkIbp2cAKXsmb9H1vTM5UQ/IgybVku4mB8j563YA/KqFZJidWbiIH7PAW/TjkE1PGx8ppEv1QudqDjaqYo4WQ7bkozY6iWBkOVeskV6cjnHVTiPrFrJ9rHS63B93wT8sLq4mt+p8UTcMyIA/zo4afhetcoHiTlkRUeXxJXNNbavFFb8csA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkm/YAkMGW1fPSINDNQ70uhQelLjk8og+UxVid5ym7I=;
 b=x4XdwxchpP+2PZ6+h/3nryWjaK3cd/XEJXARVwPC8G74iPvP0uRvUo4sLWwaRBOgwbPy/vffq51CyGNyZZN3P7veOtSPmh3+Em+6bbi7HYhojBeHcgO1c2Gzh9+RUsxlyyE7TPtUX/FMFZ6doPpzPm6nxsXPLqAUQkM3uhUOG/Kg6gr7/tFYXpECtJu1/BT8nz+zx2fzdbayb5P4x5ej9WCRoBq3axF4fnhhOHjE2ojguEK3IExRycqhRlhyzLYuZqHmA6I6jIw2T63cMAF3MGk2JREPAQwdylTcRD7VNee9dWUxUVsdRthYpD9u6L//sv1qPRN5z8RuNoYqHpK+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CO1PR03MB5860.namprd03.prod.outlook.com (2603:10b6:303:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:23:55 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 01:23:55 +0000
From: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>
To: Bartosz Golaszewski <brgl@kernel.org>
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
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 3/3] gpio: gpio-ltc4283: Add support for the LTC4284 Swap
 Controller
Thread-Topic: [PATCH 3/3] gpio: gpio-ltc4283: Add support for the LTC4284 Swap
 Controller
Thread-Index: AQHdbAzjbMcQoC4NlUypndJOKMcOSbcd85gAgACyC0A=
Date: Thu, 5 Nov 2026 01:23:55 +0000
Message-ID:
 <PH0PR03MB6351939CC7F435D0576946D7F1772@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-3-49fce67ebc48@analog.com>
 <qamxos4qxi24qqb3g644fgmap7yksoxlusszwoklmkdgexngtx@xfmd6iemag2h>
In-Reply-To: <qamxos4qxi24qqb3g644fgmap7yksoxlusszwoklmkdgexngtx@xfmd6iemag2h>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CO1PR03MB5860:EE_
x-ms-office365-filtering-correlation-id: 99116239-be1a-4c43-b8f7-08df3adb7587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|22082099003|18002099003|38070700021|4143699003|11063799006|261009223027099003|261028144727099003|261022075727099003|261026140227099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022105027099003;
x-microsoft-antispam-message-info:
 ukPhVBteMtD28hm0kYQd30UfWTyikygYKv50NyIOCq4x0EIK2K2Ru75KbbbKfv33Hsyob6RPV8iFf1wRJX2ap1NVegB4Yc7fZ4BQ86bgzGCAEsRBOyf0z2csih0fFaX52rUwEVYF0Smzt3kZYNXd3YF6+ZkaoJY8kdqtv6FtZD+7l72v5JTFzVi6EnY0BgZZKs6wwfVUX97tDwOUopp1NCFcy0Hnj+LcnIYN+EsrbK1Fk5Cu0UIeNGN2aGu3yUjn06maY3jmUgfV1VgfT7BcT/ZVYrWxZ4KFDkWjYtnVgeKBQeb1VIoWWp8bdfKrNZtjkR0YIe6IydIEcMz3kVC5fwsvN+5mwMx7ndW6aD7NreiD/ha0Rhbt7IrDPvJ4//NYZqAMBfwNiPPOy4EKHagREZe7suBN8sLPKfp/yP+dlURq0IyzlB9PpDOQkGOAWzZtjBBRiz2KVOv4NonuXhS1Kc5kMn548v69p+Rpk2d8NpKpSBA3tnNQNm69yGT8MpMN9u3EAmKPvTBIhePVvqbjfvplWG6y676zeo0tuGIbZkDRzhkuCkniiEcrBKvU/a4Nt6eMjsOwhx6HKqBT/3m3UCFPAJ1jt1i58Dryk4Yy5GKFXqE2WW1fGKDQoq7ixBEJeB5JOg1UMsaXgoQvsfo2g5I35fMsfe9APKg9+qhMYLvN2r0zKYN2vWuRxo8FACXx6wie0WqWNECFM0nOqzQ306sQ1BAsIbAxfpckFZi07zk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u7NEcmal8VBEtXB8z1TX2dwiwpgOBYnoUYFhvGMquUPbWIP2zcV77+m7ksDB?=
 =?us-ascii?Q?dVyswFMlvEEGHCJqlBm8fvzJGEVpSw09T/69TqbDdbCswk1MiO7R9UMAfk9R?=
 =?us-ascii?Q?wK4ZRyPwqzQUZez2dRHqyAdkfPypfBHglHP+aEEarUv2uPdyFmjbaxnupuoY?=
 =?us-ascii?Q?pbkdPROfzFSRjJlskzGY1682/RXLv0n2fFugybqPfXaSMdI4Qoa7P1eptHZW?=
 =?us-ascii?Q?Y0zkf8b50kp5dtX7LuIOfw6TeOMPk/CpvXGHN+2HYAqrq+aKnPZaTMRJSIgL?=
 =?us-ascii?Q?1i+b4PrksrTO8tMrcaIU0MlEZ2qnA2A6JE26DXA+kik1XlIDYKsdqwh2nOTU?=
 =?us-ascii?Q?pDSrXt9azgIOSowZ7N4fcRnvXspc+kZ+NTZABZv5YiwqGRuLs+mo3kg6QvkO?=
 =?us-ascii?Q?Hy/gY3IoiSM/rAo+0Cp4F7RLSL13EQhxA828HZWiCN8FFTg2u94S1fPIzGeh?=
 =?us-ascii?Q?LAlJKMkdoYnstIC+6sVhNTRwim/2HS4TRC446I392sQIXIHgBn+FeSot9U4+?=
 =?us-ascii?Q?FduRAfMVrriiG4PFd6faDdukCPww7sOrlOKB7g6Y8XfT6Qb9fe6i3ysBT2W/?=
 =?us-ascii?Q?Olw11MiDcQFm1PQCrGbodHbQx3Y3oo/DpEkXOCw96xQOCqjrBgPcuKKXmJZb?=
 =?us-ascii?Q?yse7WgMudApdakzAMxLIdkwMi4N3riOLSrVmk1bg7biym+kiSoutNOGeku4t?=
 =?us-ascii?Q?z6jPrltVuZpP6zyctZH6gVkicCdnaRsbjiUdylnLV9un9Y7eadCbt6L5QZ7G?=
 =?us-ascii?Q?LNCUMg/ynPFkbwGoad4Wcvm3/kH1QqV+OzpJd2FZbm9xPsquJQI/+AKfKWuB?=
 =?us-ascii?Q?E7sR+amVbtXt0Bww9ukF5QkyHDmDgTSDovfSFsUCALCcuFVjF2w9+932RCpG?=
 =?us-ascii?Q?UNDq5RmCeKIlhVOgkijLBk2Tugg5gUfC5mAiMvOxFxKss88SaumI86Gt3+b3?=
 =?us-ascii?Q?5ATmL2USIznM51jK9Bgz4nyqmEyiMCNzlVH/wVQMGAlNqZxzHjDp6t196vlw?=
 =?us-ascii?Q?gvEsdoHYpk3+UUzGPY24m87kRmkPmdpzrU0/bPDbUBJ1iTQ6V4a7sUtUkgU9?=
 =?us-ascii?Q?e1XBi9I3TvuVb/4wYc09xFUlolamHjMpVw7SU8b/Xq9I8b3Lwigfwi1j+iuI?=
 =?us-ascii?Q?ChZd6ZKchPVV34NwHnZ53AnHnnv90bTI02fdYw64C0NmECMfDdAX12LgZgTV?=
 =?us-ascii?Q?U5ASiqz6nFey0goOb+gsp4SQLPKeWtDBkSyxXPfU2/72GTVC8tNyqYtjbJ6v?=
 =?us-ascii?Q?CzQnS7RCiuBBa94gZ8WqypidnF1633zRHfb8hmMGzlixmKZgC+rRD0czMXAq?=
 =?us-ascii?Q?aiMnKWyCdMzwIpnTyOlGckNafVgcH5XJAzJ1CFrkRc3LFhZYXyd1yWYrUyLz?=
 =?us-ascii?Q?pjjFlhLvov6lLEU0jZ7xhsVZ3ZJh591/mAjM7ie3jZ66eJ+L/eM107xIMfWy?=
 =?us-ascii?Q?nsFYZ+pv6Rt/rZrhhLT1BYGlHSAz6FTeylKM4ioUsiWAh3y6LGm8EdoPh9iy?=
 =?us-ascii?Q?zi48Pii+p/ZCxOeFRSVSyzG4Eg+AX5Orv+CxC/kusGlmgEQuvkyub7CQjmtF?=
 =?us-ascii?Q?gFbvw72h4D4vsRn6lKOLcrSbAAzwfyVuiqj0g/C3BMw93ixOrJhK/bGvIdrg?=
 =?us-ascii?Q?oXKrbWo8C+EPD7RC2ficIbFzvhUVzUc53V/uYMqcrTqcuoqU2cklrtLDL2ok?=
 =?us-ascii?Q?yLDbDentn+WmNijfgRfzoVjtN9wTVe+JCjAN0holWCb/JFf2fM/Xj+hc+Lme?=
 =?us-ascii?Q?XiP3soS8iztyH+dOotBwnwM9jMIrjQ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
	P7q8aPzTgHL4zTv5+x2RCKVgwyWxEXiduv5xgsq8pxMpITPYlC9qZy76ag7qvrDb0+aLM1xz52HWGWSoRf3vPdwn4vTpip5WYmGr6zMCJpZJvVZcHFOn4h3TE6G/uCQAlNnJf2ywuxwtX5ejF29ZsQzA6JxNtRjaSeoshYw4l2jEN0XESvXP+cFDefo1CbbHfpDy1F6TjvFzjgWYErPkDRoeu2g79jImOWcPLZmlv+BzZ2tn6bHyKeONliKwLuOIyHxDr4yh92I6yxZBosp3h5stDzNyFByjYH00vtS2IPf2oPm4vMY5nWZM/Jq9lVRooEJqC7B1/ZTFFQDPeSXG3w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99116239-be1a-4c43-b8f7-08df3adb7587
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:23:55.3681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9RSAUWJfy/u7N0dzoZhL30bTg3UGBrBYivSZ6w5EyB2AugQdFKetFIFvW0wPpFi9GlLPPvxQaIkyjSuFBDntEf5Fp5dhmL5CZIgcz5fQF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5860
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXykCcfATPj9jD
 7ck9Elkwv/hprEoFQbTXl5+KpMeSw0z2ybgx3YfDmxNxwb9aPINsm7H65P97Ov3SEAyq6nhqAlT
 pUWrDLTGuq3Au7E2PXCp5ZmriQXCmt5N5nf/z8hWGsY+NNmL7yr0
X-Proofpoint-GUID: jNJKZMAbs5FL7k9shUxN4Dl9aLCbDaEl
X-Authority-Analysis: v=2.4 cv=S4tMU4sP c=1 sm=1 tr=0 ts=6aebdaad cx=c_pps
 a=OswsEo8IlqVTC7zrgcx7Gg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=BtkhRJChWNPZ7w67iCsA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: jNJKZMAbs5FL7k9shUxN4Dl9aLCbDaEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXx8TcnumjOhsR
 Xf3wMyLzrz92B2LDEaRy2KX4yhBD0flbPVziEi5Qjo/Pjj3va68a+L7hGegm1XebCo4dYc2MZx+
 W3WT0q0kxcReh/HWTIEHT6dRRHS+QXZavJObK+RhITfb8VHwq4sTXkX88ihF9l47laLi2183bST
 P/81DDTrsGr5f0tieWzJerau0Ja/UTZyevhI4TSmCiqckLCJHeo9qdcav6xZdiRJuZruHsD+Hqb
 wOtZLhYUwTcuMXqeyWcNlHXd36k6rsZAyq1mG6HpvxF+2GMaVOYOYo7QpXsCp85vJPYfS8LaecL
 q3NKLJLHQoNPJgg4jvncte8boy7hBH1g7HCpD09mEAGKF7Zs4kJkJ4Kq9sN1kY4z1MJchYSQlQM
 uSU7lZf3iHrlRYMC/k8f7d8E05pXozuUPgv3BxkJSTXV1Dfz0PXZzWbBTT81lIrVJqsaPHL3v5/
 Ca8QgEnHyiXCLViIYeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005

>=20
> On Wed, Nov 04, 2026 at 11:30:02AM +0800, Alexis Czezar Torreno wrote:
> > Similar to LTC4283, LTC4284 has up to 8 pins that can be configured as
> > GPIOs and behaves the same.
> >
> > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > ---
> >  drivers/gpio/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> >
> 55e4280029d86e7701d9a043c89537f60bb70c6e..de9226619ef2f77fdded12365
> 7a1
> > 4c15cbba07b1 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1864,11 +1864,11 @@ config GPIO_AD7768
> >  	  called gpio-ad7768.
> >
> >  config GPIO_LTC4283
> > -	tristate "Analog Devices LTC4283 GPIO support"
> > +	tristate "Analog Devices LTC4283 and similar devices GPIO support"
> >  	depends on SENSORS_LTC4283
> >  	help
> >  	  If you say yes here you want the GPIO function available in Analog
> > -	  Devices LTC4283 Negative Voltage Hot Swap Controller.
> > +	  Devices LTC4283 and similar devices Negative Voltage Hot Swap
> Controller.
> >
> >  	  This driver can also be built as a module. If so, the module will
> >  	  be called gpio-ltc4283.
> >
> > --
> > 2.34.1
> >
>=20
> Is there something missing from this commit? The commit message suggests
> there would be some code changes?
>=20

LTC4284, at least in regards with the gpio stuff, is the same as the curren=
t LTC4283
-- same number of pins, names, and registers. The commit simply edits the
description in Kconfig to add LTC4284 as "similar devices". Will update the=
 commit
message to be clearer on this.

