Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794272492;
	b=OzXEEm73uW1r1V4TcmQqSrycWgKwwUySuzLSxJobT9gGoyO8F1T6B8rAKUszEcvsfBhX
	 IPNx2PVuorkI30xMrAIODRV262jtfQONN3as5o8bHv82cjwsOH2MXmPfFUn+uDENYv799
	 4jIZhEJpliE2LEteKWRbD0aa12DSANB4JiXY/g9Z5/bF+uOTcsi1WTEGcrZjBfdIfVavs
	 hGOQ/dX8FGcMtU0WlGThx+MTOHhz3YazWTsOf+EsrBmH91g/8LM1k1mzDJr3P/ABXz1XG
	 DrX+bF4Z8PdniX3wHHm7DI4ajZY9kiDR9CkvjZMpLOuY8Rn44Zd2TePhkxguHYa7VeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272492;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k+1/l/bjLju5syc0XLdlo7Hcau5tcZ2uM5RdmI4+SW4=;
	b=uhqRpdedBwR78BLfYyDoGOlYgKljjFr8XvBOgz3l1g66vfOowNkbxG9+NTcAhJ+yNuka
	 gJ/MmDHLuHEjZR6qGWXJ6+RmVoS6PA89g/IdtB2MbwLDQxUN2Kw8yXaiPaEiTT6uMER7w
	 fZHLngkArPbGv2lYeULKn8v5ZhYTFItjETvAfQwpxF5QdFTtmit2xuygQSfyNXsAw3CBE
	 s3FVVA8QsM2BeK0qVyw21ojZ4JsO/hSAzjJy/cua0pLyp2PP+g54oJ8HV31nCqyKunGd1
	 JDd5yuAsu7daSQQ5aF8TJ//qaUSJcAgVpTr+yKgV9omOKTwXAhcOWCMPgLSeCYiwpVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=hUStiX35;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="xs+y/WKK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBDE606A31C;
	Tue, 10 Nov 2026 01:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=hUStiX35;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xs+y/WKK
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0khN22313557;
	Mon, 9 Nov 2026 20:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=k+1/l/bjLju5syc0XLdlo7Hcau5tcZ2uM5RdmI4+SW4=; b=hUStiX3
	5tzDQEcv6plOxwkKOwklUeA9gSc68RHsvFZ3co32cd97okZrG4gSIz/x9BUqU7C9
	T/YOueW2ESOAUCGvCFHC33BfvjqYiS+bbLfDFFm4GDEDILp/p2pQDTry1B3Rv+Uq
	r/IPGN5obGmYwL5DpafsH1yTnmylfNgxFgzbsZwhRliBvzmIbqy8t8tMCg5oho+l
	ZcXfSrALDZuDlH3P1kH0gBqbqqTWbrx+F3k/AoyEhDTMkeYN8ISjP1pr106mqlX0
	TRHgc9IUB6T/6pWHjMs1RnGFDS2oGfR1FRbCaet5U1DxuHKbEPnJbZ3DgxDzYysH
	PX+omOVRoBcEsYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=k+1/l
	/bjLju5syc0XLdlo7Hcau5tcZ2uM5RdmI4+SW4=; b=xs+y/WKKZfCYeI7LTvV7g
	VP2kcHuGhx9Flh2XyfnOEKD5oOz4wHP8giHGKU9ebowv/QiAcsX2aksVv043HIta
	NupV1piLid7d2m8fEgF8imDCXDm9EYFPe91A4gkchLO29Li7864MgG5FSRjhrOH1
	Hs9zZFUpfbqAEfIKPc2a8lNmslq/h37x0Ly/LwL6IYQVYO7iZgLPc4HrwkNi3btg
	J930/yuTxeQosdT7oVCKYdPZEj4mxhmG9XjeThdxHfJyING0Ymf3KM2KvLm6O2kK
	I2J0Gisv0ejE8lpRhd7ZzbGkktLNDlbWYqkREBj/WUAGBmKBGIGdOcrz6IgszaQa
	A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hupd5ru4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 20:00:51 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFaUNzoX/oXFTW8qTgO0STbW+hyxwkd8YKaE2spWcRbAUaj1MaXrlgmnznOBzk9jkGb80uW4kFpe0sC5wQzdIDLA1sCBD2WkPMzQAE+8BWPylQLr3PnO9wheeFZlovJ9c95nC0PYgNHU3Kg+35W0BC3rvZwc3mv+hvfa3qcfVpgyxHYIg2NwqrC4g39ccZoxqkPHB8kWcH2tlszBlQG4k2NWKDiGDIHMvXS3jl/4f7N+59hRQhTCWjgFier/b3NCF3xyeqZqeNl2fuEOGw4xVKzqyJWGguGvUSBCkmKkw16Xt3FQ8XSO3hMYvvqy18Egsd/7by4cogDAdHrjpd1VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+1/l/bjLju5syc0XLdlo7Hcau5tcZ2uM5RdmI4+SW4=;
 b=sPx0usP52HckaHdB6w58JwYXjLvA0FRERb8P3A5t+4pDQaRqW984Pi8KNPfuu016ywNya1obeKlFDOzxpHdrE10qQQFDdeJQpHydLGGCBmNpfFBt+JMQF1DlLqq1i/Hi+QFghjkY4IpqebxexlI4gv9XQZQqzH98A6r329FyQyFOfp7t/fX/urEXFeMkcmZBN16hbK4frBnHm0RVIVKaDDaqASsy8gTvqdFLZImKF/8sUVIzkg8WEma2v3GMSEWN8JD3tc95XKyut3XdwavdFD0cFfMU2HMN11etZPBXSUHq46o+asx4UBCJ871YV8a1BvS/WcN0L0FunGkIjxPwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by MWHPR03MB989357.namprd03.prod.outlook.com (2603:10b6:303:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 01:00:45 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 01:00:45 +0000
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
Subject: RE: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4284
 Swap Controller
Thread-Topic: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4284
 Swap Controller
Thread-Index: AQHdb+U8P+KmZMU350Kx4JSLh1gG2bcldPeAgAEHpPA=
Date: Tue, 10 Nov 2026 01:00:45 +0000
Message-ID:
 <PH0PR03MB63517EF06080F29277DC81FDF1722@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-3-14a270a38f7b@analog.com>
 <gwgt3gujrjko74b72kwb7ywtpc4ffphx4bimkzmwx6nz3gbvis@4zsojuype6mv>
In-Reply-To: <gwgt3gujrjko74b72kwb7ywtpc4ffphx4bimkzmwx6nz3gbvis@4zsojuype6mv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|MWHPR03MB989357:EE_
x-ms-office365-filtering-correlation-id: 45d6f34c-3441-4986-237c-08df3ec60cf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|38070700021|11063799006|4143699003|261102123227099003|261026121527099003|56012099006|261021121427099003;
x-microsoft-antispam-message-info:
 MgmXxxMOtOBhlFE/7YX1npDwlCml6qBBNB91flpMofvyLi7Eaq9OVXAZ0MH/AUbMLwf8yF3b324Fi3lZtSqNma2usFEe+rwzM5WKYoYGrlr/iXq0gA25ChO2et8FcDZLMA0dvTVPnZkxV4k+TwsnOaQ8k084Py0O1hM/Zf9yG7RRsD9ldge0/tHIfeJx8Th3y8Z66KAALPnCigqJY7RMNyDf2SK/jvGGxJc9D24r3eq8CqvWkrmWPu3LOrfm2fJc3OhZjqBISgzyAse1GgCggClIoSB5k8iValb83y98A/E0vPXNcXffs1NICXx/2eILweUOIvT+IRR/ZNgtrw1xT1df3nYNQnkxE0XDuMnxxzGigJl6x4LZJ7K+517lYy72K8Ge1D1I59ym3egUk6gSs8ZMrsIrpGcJdU/Xui0gAkDgF5mA0DLBGbOVKmi4A9N6XE+03Mnn5RgVw/s69E7BHlnj9Xrs5Ew9LytzHhyoBFh9UHXhPHLa0NY/kMq03TA/HDnTWWy6gheDXNAS6wIx0jf1Qt/TJB8OxG0k5BgWpdIfDLL5palxDDo19mkOydt5JLhP9p2xl9m9h12MMmU6UeMpUlE13oHiVIdz91f+P4xePuk4SQ9BSRjNcqnfEPKqIMZHjEyZYmCvWse8b/R63LZyrvDihhT9FKxvzhsRqXlWaizMb/uy1LAD4QvG3KJ1efS+QzCSvbWdipwAS20hxQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(4143699003)(261102123227099003)(261026121527099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bZvwSbMl0FmlPHmxqaVWXnt4mjYaiZgao+uCEYs5dUNor/IctOYHjLfvNwqx?=
 =?us-ascii?Q?ElA2vcqcak99cCqSQVJEtMU+ui4yXB7tncrADObFvYWCxfTrYJgnUjq1eSOg?=
 =?us-ascii?Q?1IwLGbN2j+JTrzL5isngT0AOCejfcznXquqe4PU4jzZsHJsXHYGlGTdyV+vF?=
 =?us-ascii?Q?j9DJD/pRXTq3EuHPYH9C188qrTusIlK+fEwDvq26sWHlNLkq5NCtK3aLmTpK?=
 =?us-ascii?Q?DajyNZJga869lfYbht56XejomXlip9pPbHmQn1yIFitPPJNQnOIvyVbv2Xn+?=
 =?us-ascii?Q?woz1hXOvFMB8bTk4Rj9UHfFMvvqFxzDwsgJuIH1C7SZBZsay5wtRDTlqVHFV?=
 =?us-ascii?Q?BCN8ScPZ/MHUWdgJJ5e/tXbqtnoOTNBmNxHhhFL8TsvdaSVWUKr6E8yLaQ+E?=
 =?us-ascii?Q?kU6vQXlNksiuFWI0MyeUg56rl+OW64852nO/5j4s9Ynbov9zb/hRKU6e6hdX?=
 =?us-ascii?Q?/WEk4qP2byw/2IU4XoxUix8JgtaWkrVgrZRBOzmR6TprhgaJKiYrSF1O1nZ1?=
 =?us-ascii?Q?yne08125C6dNVG7oI0ACO7DIZc6n+4TIc0e952BU55GH7a6FgPN6hQyVfRQZ?=
 =?us-ascii?Q?cpHQHfr95eVkQdFXMbyWlXdpEEFe16jIOXCfWODUWMIW1SErnlavVIKVDuS4?=
 =?us-ascii?Q?/wwD+p6HW8yLjaZd3aQf3J7InCVsOu77fUV+vx2fw1No53dZ1P/9X5jgproG?=
 =?us-ascii?Q?PQp4MZ1bXPNYj9Lm77hXo8F6W3Aa5P0NtMGzv5KkB01aqdZF65C/JHZMN3gU?=
 =?us-ascii?Q?K000WPT6MoWKARakhqymmLg1JARZtPeyJyXgmeZFW2dR/fCGUcxJWjWQ+iiY?=
 =?us-ascii?Q?ZWau3US27ZO39RI0e6AOipV3FQ/Yg4iocz4kX+VK+8pjj28+OxOQ8cdfRduq?=
 =?us-ascii?Q?UTUX2sZHhOGWTdRP6X1myUlbfHP9UTaZcqIOJ1T9zY8ncpz6F90Oc1fNW1Xd?=
 =?us-ascii?Q?ZHXaO7mZF9rsL4O5c2C7kenfL3pWGp8Lb6IkLYiQN98kQCeMmNSjeZoDu/Rs?=
 =?us-ascii?Q?RDJUkj8ON2lkCBApovxw33EzrdSN4tTc3k5Wfx0PZ9F/wI0X9xZwUmQ5Zj2D?=
 =?us-ascii?Q?WHNSULUSWeKNkPOl19hYm4ID17H8S5KFDiC4KyC4NuxjoEuUAqTKHa3IC5X2?=
 =?us-ascii?Q?1odEdbGrABh33kpAdGsDk3BVcnRSLbaOfRxwDkFAj4SXDzNAoDzp18jdCt+2?=
 =?us-ascii?Q?MFCI9T/wu6mPBIe9piqqluaM73NUfs8sXXx68mDHxThZxe/A6AGd7/gvGf4n?=
 =?us-ascii?Q?s85uzWGCFZMul7G3r2b/EMUT7yhEJs3ti0IAMuFORe/dqBts5t2NO2lYRBl/?=
 =?us-ascii?Q?UAjPXkNm/oiykPQkeE4hKKeiw8t4isBh1VpmpL7S6mAMuvbKKiKnjPzBSUFx?=
 =?us-ascii?Q?IvHzseDaJidGnE6psQh8zxQTK1WagR+LmuNjYv2thHf2DrykKcAeykPE7jbK?=
 =?us-ascii?Q?0uoNconwlFNjgtqwW0Ted3boX62JRcFePSTo6ADGu9jN9fnGAJH+gR4/akZK?=
 =?us-ascii?Q?VdhXQ4sviCsOCDFV1nlV8VG2HxJA2XdKGWHd9+t/+iM6LcgplPv8PMzjNGp0?=
 =?us-ascii?Q?yWfgBoiZLkRI7NPwPPJ+hJ69c0FBQka1BXMQdmne+43cfFJlkYe9U4v0xe4h?=
 =?us-ascii?Q?PKbKPE9NrZceDqRK/XOAMMTJNyl5ZGHEtqS413HkqxqXgmx2iOCa3Tj2HgSK?=
 =?us-ascii?Q?aYGyrKDd60YunAHsajrvH8KR9nRZCzqd+joY8yaaVVGM+a+m+p8DUdbLA65m?=
 =?us-ascii?Q?/w1Ca8iDpfjYr5cvof/qvGgK9JtZd/8=3D?=
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
	vEOaRTJIDDe2MnCfmGIePqXTsVQdDC0q3Y+vkPDoPrWCoM8sgfJdI/OezV9JuUtC+3AdFEURO39C/KjyOMxJVNkYR2+cZ0kyfkFmZSQKg3ijX0RqNCPOxRaLL5Y0xBw41gECvuZVpTY8i932DNnHt1cnG3VNC+01WDR3OjC9n/FBujxeg9AqpuAROtLNsrt4f+GJOvQwXdSyXB2CtaEW5zrAS7IHg8HbWFjysVfbECzTAVb2USySISy7MPQpCBLuSWcCCpZRcoMH6vQch8ePQw4T0a+32KBZ2/6H24fr+O33Pmwkvxo0N6EiUv9QLhtl1DrZfDQ3lbjsLFPxkMS/hw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d6f34c-3441-4986-237c-08df3ec60cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 01:00:45.1182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkVwIOll1xWO3zR60RTCsKPf9n8S7Cobo0/1KbS7vreGMPkms7N3SB2drs2FpNWzypXEdZ046ARbXEKwP12z1BgBaRYrvR43wP1kskCaSUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989357
X-Authority-Analysis: v=2.4 cv=ONCyTiaB c=1 sm=1 tr=0 ts=6af26cc3 cx=c_pps
 a=zYHeo5UF1QI7fA+G+QDVSw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8 a=169Sr_zXAHG_6k6K8PcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: uDQAMmtSMNRVnoGUj644-rF667nBO78Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMyBTYWx0ZWRfX3EB7VaODtyK0
 OqkcOLcAdHAYzlsC4Ty0HSZnT8p6RxHbWkLE9mDRZOJatijaDwRPwKv6nIzXTT89n6UWnyBvD/9
 eDfP4huX8D1h0iKsb38fcq1mYnn0WKatRKlsGzDeGpzpYhb22jyf
X-Proofpoint-GUID: uDQAMmtSMNRVnoGUj644-rF667nBO78Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMyBTYWx0ZWRfX1XcAS+XLcH1z
 FBY4zHGotiFWpkOIt1r/YGw3UPdMdJvftb7nevUKcpr+1MbwxwUIJEf8UhAoGc33lNlauYWx68P
 LO4jiXqmcV7jKl4MByhpe74+NKTk7LbqSiPvW3U1mloyhl9ZFsAiR5UbHb21x010/guN9SgO3MI
 1q+NcO6SRkY237aHyWnmh5/9gIaS8F553uyzyCL7+g8zqOlh1CKX03U5wqrFD9OESgSlqwuR6U4
 qJTNNfH0h+S7QbDuxiRtirs4tb13VNro+gpisiPtkAOWHg4P8Jqb20rooNfNsC1U6ce1YjYTVfl
 UkI0FLfi4Lq03xK2MCtgsIxRF0QSusbyPzEzVeQz22+CHVIy70X6TnHjp8P5ggVJguZEnuJmDTC
 Ss+O3cJeKhIuNyCbTpgPTzjCoz2qArgmPoLdG2vvA5qhD94tU7R4eAoR5G+MBw0+Yt6A22uhiSS
 xdvapOJUF+dcadGybtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100003

>=20
> On Mon, Nov 09, 2026 at 08:56:19AM +0800, Alexis Czezar Torreno wrote:
> > LTC4284 shares the same GPIO hardware as LTC4283 - same pin count,
> > names, and registers. It is already handled by the existing gpio-ltc428=
3 driver.
> > Updates Kconfig description to reflect this.
> >
> > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > ---
>=20
> The commit subject is still wrong. This does not "add support" for anythi=
ng. Say:
> "update Kconfig description" or something similar.
>=20

Ahh, I was focused on the body. Will edit the subject with:
gpio: gpio-ltc4283: update Kconfig description to include LTC4284

Thanks,
Alexis
