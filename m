Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF037E30C;
	Tue,  2 Jun 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418119; cv=fail; b=svdirn4TQn+lsLiw8kFwkhgWW4EWrYG706uueFDeDYBK7dKv8GAW+UKGr4HgxAIITDrJ1vVOOrKJ4e+tSucfpNVsH9CWHZArQ74HX1Qt79rg7k3P2U1iUAF1YGZF1Nx6+TgM0qpG6IvVSOuto9igluVvM8naNCUO7gQPTcI2X7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418119; c=relaxed/simple;
	bh=5yxaQiPaxH2JEo2IP+eZYjhwR8QYwenWRGFjEasdJbg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S9erKZTwwA0l0T1dIGuoqTTPi+71hW8RpBIctqU8O43Cp2sZCDbTAJqQkQ/TDcqxuiEVHYqmmtBTd+vFmA5FIs5Cuz6pQ33rcdRX9OgGV4XA8ncDNo1bWOge3MdQLCC9MivAgmNRWsPXB4ceEDetWIt1g7a9ebacmLOWXHNuW7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=fYwNmpTW; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="fYwNmpTW"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652E2YlU4094405;
	Tue, 2 Jun 2026 16:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=5y
	xaQiPaxH2JEo2IP+eZYjhwR8QYwenWRGFjEasdJbg=; b=fYwNmpTW9SiH2hcSVK
	tSf+2yN9c1NqVNQQT0meM/vOGr6WI5V0eaVcHQQ5PTpAjLi3vNmlMn+5cp5CfMYZ
	VVuRYU9Tq/k4TgcJmPUZ3TjVkF+r+phCQwwtwDFVZWjJT+PuDg7gKXJMgn1GMMOo
	jgm3xuLBsKbuwlV6Vgxh1oypmVZnpK0vw0kqjLEd+1zVXCKcB0+pGQQmyDvy+Xdc
	Jnvq4VqgHu9EfdYfwcRr6MHjwo7J2z7vzpm1p4Viysi1ofr36vxPFm1xC5TSJRqq
	r6ZGigZCA3i+g+4jn9Q6UKbcCZv/wY/FPH1rkMMsipbYcPg8iHQ5Qnh+KswZ4YlP
	quAQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4ehyapb5dw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 16:34:42 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 3B562132D6;
	Tue,  2 Jun 2026 16:34:41 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Jun 2026 04:34:41 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Jun 2026 04:34:40 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Jun 2026 04:34:40 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Jun
 2026 04:34:06 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4gNA8tBIfafbzGAAyjjmPS9Qcr04zreescPQIxxyGUJ0Xo2NDC84IcXs0dY4GRxK2Wz3iUWt/SBSjEuVci70wQo1BuaksBQzAbJTkBd5cmY9nh0QpgRe3wxoCUngcvY67P4aCyC8Zb44nNDKeJQQApeAUFRdzaZnfqi5rXmIDEyRXEDjQgVgBEO0ByVyXoLC2DEkamL0hbVBB+6B6+LO/s5fyIkQeNR5OfB6t+tqlnxKCk0meAZa8nSsMt79kbjy2v9xAXSMU4xlov41dw/dp7Z5YoA5L1co1oikhndz0D/rR1nn93HhYFUwK/kjd+++scZARPjiNWBerBJlHcblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yxaQiPaxH2JEo2IP+eZYjhwR8QYwenWRGFjEasdJbg=;
 b=SeTgDgtVVIkeea9ltQUAsCMMfrrKW5rrUO1xwpDeX2K+MGF+ZSUoSuzbafBan9aWN6wMIURM/+VqADTrEA/RPH+e1O/R/PzOrdGZQzjSd42G2bZCLt40IACTHDvxWtE6+IUo2VHVKh9s4I8CJ9dOoJgf1OJCS611Sf3sbt5LIrQ0NCBV9cckGNJ/kGMRNEyz7Vj7cJT/P9PYlBjh90Ev7FuuVcD8kKzwcoOWpBJXAVaHtCspymOD6V4WZmIgxuhEs5HONGrWRSkASc5DMZdufUGaUdkGXAU56gGwyrJv3kjr5bLMObvnPY9AaBoJNvasRAhQ7ggoLDkuBVDl+qS4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SJ1PR84MB3067.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:45e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 16:34:04 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 16:34:04 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "sashiko-bot@kernel.org" <sashiko-bot@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
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
        "noname.nuno@gmail.com" <noname.nuno@gmail.com>,
        "Syed, Arif"
	<arif.syed@hpe.com>,
        Sanman Pradhan <psanman@juniper.net>,
        "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Topic: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc8fbVSQ6G4ERqRE+l021qjWERhg==
Date: Tue, 2 Jun 2026 16:34:04 +0000
Message-ID: <20260602163356.1020323-1-sanman.pradhan@hpe.com>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
 <20260601184516.919488-3-sanman.pradhan@hpe.com>
 <20260601190606.8BADC1F00893@smtp.kernel.org>
In-Reply-To: <20260601190606.8BADC1F00893@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SJ1PR84MB3067:EE_
x-ms-office365-filtering-correlation-id: d7cbbb64-f0ea-4b12-83d6-08dec0c4c273
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|38070700021|56012099006|4143699003|3023799007;
x-microsoft-antispam-message-info: WoRMy2vMY3bN4ZaUZ6WNwq2A1S13YgWA9w7wagaDl9wV7ZXP98L1/2U+vVccn/jmPhlBzSZpYlznPesXZOogbgoeHH+pGvx80hHzsaKf9lWwdaKTm8iODy0tFlpjO8kVS2kNwUce4swTUMQwbGdtcsxu+TQR1Vq8XRw9Cfuz73N7hwUm2S1AssBf40Aj1i0SQoJxOHDXFe6UTEtS3V726ys80kHY3n7C35ltTBTU2LeJylq2WzE9EyXsOUVAh9NmzkrjfpGvojMsgQyV4YIWH35FtzeLP5Xvwo8mvpLxyVkavZ95GFfWG7BbdJsORmf9Y5wbFZwo9HWAzhFOylbcJYXsA+fk+XHRYjY4TyLr5bmJf9uWl/uAu2LuLnGVOpOuJFTX8gP2AHDCa7gkGMHq0irdivSOBACZ1dQx1J1PY6l/gOpxFPRUzwhUaorf8s5njvg3vf4yiF+Q+fpZUPZgTk/P4d4tfi9z2ykel0jpNxxrrCdkUH7ClTk6+L3KS/ZeMr0bi5TDx1ODPkB5IGD6HtKDjKZHHHGnO1lzwxEz5LHa/nKfmikAeYirWd5er2g6PcI3nGmcUrRRg8Ri5ZHEA1IN0ESNiKEQfCBCCjkwJM8UrbDYnnuiJugM9xrllImxWRBrr0k0ScJglJovsV2zYRhEJH4ntB24jLGU8TmLyZZwOPdJBVTNmyLL47E4lZxZP3HgbpafG7QCM8w1sp0SQBbNwabdJu/mKrVo7laQ+zlVZyAiGK62gQtC3/Sd61sV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oX7pjcYZECHV7YEiQ81xYT/2lntM5BV5DnhEpovP3knlRLJNc+7mPDG+3X?=
 =?iso-8859-1?Q?B73xouOTAcdwYVJ7etyG3bWnPUmRWBfJ2ky0rTyqb/ZKUGvfh939keDNaI?=
 =?iso-8859-1?Q?Fte4zpDiXM2Vgoh4psUqMKkkjrXTQiQzzfBICzieMzkfA70KIMK8uObIsv?=
 =?iso-8859-1?Q?AwK1qCIsJN88PBobvd37gVVkZoXiA0tqG3Y2SjvKBhbsQ6rcHxf2JfTc/B?=
 =?iso-8859-1?Q?TdRiMhXQLfj6T8llMr9D5U+inpq6kEPcEX/dGVC8OCE8lb0zg2TBl1ScnN?=
 =?iso-8859-1?Q?npyYYO2O5okhZPTANSDayG33Gc9/Zv+vQR/fPiu4l833nt8ygCnPZ4yU0Z?=
 =?iso-8859-1?Q?qSIbn6i918Pdi/Cz8xf6AflVRbsht44XKnVM3Ib8JNjKAha1VOBOd52AgI?=
 =?iso-8859-1?Q?1wxOv7QEDPDoBg575h6SYa8htL3AR4ewZFuHNIF/wCkzc7ELktEC1A5RKF?=
 =?iso-8859-1?Q?mvO3J8iAb7HNcz1smmsn4aRvnD3UhGKj+rHB6WxeXrzDyECHkyVVPzsavK?=
 =?iso-8859-1?Q?OhEBgzv6e0qKKR4cU72rTDhTO38UsyEE1KwrfE6ySXaV2UPA9traf/1yhZ?=
 =?iso-8859-1?Q?qkE+ARf4lDT8BX0G4MpiEPR5dqD2oJkdb+xF5qOz4sY3i4qnopx3WyfFJH?=
 =?iso-8859-1?Q?8gHbYG1xEvDtkkoQmKMaEtJQuisRGpBsjx2JIV58kbrh0l6+B0ayWWQHZM?=
 =?iso-8859-1?Q?yo3OPzxeOBrthRenxyGfRq2O/FHXnoKfQsRTIG2ssnvl5pA9SmHwJUPe4I?=
 =?iso-8859-1?Q?lAxqkFEXOSuSa0kGgUR2CHVn8D15Gc1K9uenDp2CzUT2R6N/LZmDoZVuVU?=
 =?iso-8859-1?Q?rGbwHEMu3rASyUROU0HsDtgq1o0CFyLH0QPLX7Rwwqnwnw4sMHbhwSD5VR?=
 =?iso-8859-1?Q?wSAVK4XC1CUjoXrehMfYua9aFKUFSD0Ic9ngZa1XX+ha2Sb8CztO5B0uw6?=
 =?iso-8859-1?Q?wB76xR+7uezJ1AtgrDLUPpf6evAdTiUvBEFWyMmy2an/7SppSL1v8PzWx/?=
 =?iso-8859-1?Q?NFqlXQlHp7JyzoJaUkVUHt+SJotvAqKYemW2vvwNYvORrHlkHWgDQdEhxU?=
 =?iso-8859-1?Q?3r6ZGg6RWAoP+2DKDo+irfjZohQtWxjHw+yMfq2D7QtAvUltCp0/2tHTXO?=
 =?iso-8859-1?Q?7bwr8dQAj8I25B7GM00bCJLfChgfsPNM2dFsmQuHBI572Y8BIH+UUZFNJq?=
 =?iso-8859-1?Q?SCE/NIlVLf/KzsV8hlA+zZMEMD3Ywb3jI50/08cGXB1yv36FbiUJbtSxIY?=
 =?iso-8859-1?Q?VW7mtCH37nqU2rlLXcFk4NJ1BlrhOQZ/WivxAvk/eWuM2mhnzvMlDQeQSB?=
 =?iso-8859-1?Q?BqbwJQurVyVR1a4brCzdXKsXbGFI1L+HgMhwcKzlcSJHRPdjdAGBdZoPHR?=
 =?iso-8859-1?Q?yYSa4IO+ONrN5zg/E5BLvucKuUKKjRHuIbPgZ1RhyhzIWJ5MXV956TQJAG?=
 =?iso-8859-1?Q?LNGEwm07uKJvy4YvIG0cc47jfH8Jur9pdZPJrqUXMHP4myHKj3uxIHhKSr?=
 =?iso-8859-1?Q?7UUpJRFTGy5L9HE7ie8sS0l7KGW24FyHvQMG8EGFDGbd0nbvyx7v8wJcOF?=
 =?iso-8859-1?Q?y1TtS1WM2BxgHOFDfkXLno4Y4NkbSIarTZx66GmmK8COg9dLVGo+L/Dyl/?=
 =?iso-8859-1?Q?3t8wyFkhCXcLSbVqSVlQXaSnIdjReer2PjzzFs3i7f9hLL4r0mYcTvLpB6?=
 =?iso-8859-1?Q?98pcT3xzgKuVLPeary4+xnVC6RXtFtv6pfViDtG77JBCkf6Vjacd+SCShN?=
 =?iso-8859-1?Q?/boAEMe+yD38W05gbg1xqdHa2xj/T5Q1tRlhcHotShjoZlhYCKDA2jU4RW?=
 =?iso-8859-1?Q?9Ndwp6TWcA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DkZgxxUXIk921NaQBuLOOpc9vesLaD9Be4465D/JJwIcv3o41tp3SFumMULF4sUM9MBAdMpVspQjFC2ZmifUqapmufDrw6HbXQxx8cHtxJer+Fh7rxlrJ9u0rKnCfTmF1sp51X1nLU3RbyJGZHIuWBTsYAy1VYhWAy8BC1ZOjMM3QEzuCNPN2JgDGep9miZOhdVr+1tvP71lQcmo7YFPE2RiqxE/1OV5SBhajkgftNAkuk/KIiSil+m25CN6EW6fXL/M6KDMNudgDGirqgfqhh8tGy6fqqQsmIgbermkyJOQrczFh5ytmxGZqStQ1d+TKNcPFc/0kTCkty4vetQ/cQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cbbb64-f0ea-4b12-83d6-08dec0c4c273
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 16:34:04.0907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XC6IHCYM9+5sNmrjr8N+YIj7GIM3zSP/NqAgJSfqcvRzwGrDvpFrsI8DA4mv1lW6gdEDMtSDdIn/ZLHAVOVtig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR84MB3067
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: TQrVIxXQw0yb8NRi1kL9I8thQhH2CfmV
X-Authority-Analysis: v=2.4 cv=OuV/DS/t c=1 sm=1 tr=0 ts=6a1f0622 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=0M4ECsCm-uZCH7hIDjsA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: TQrVIxXQw0yb8NRi1kL9I8thQhH2CfmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX4Xc3GlP9ndxH
 Omx0riG3pgcqMuKjJI30U+iO5YO3P88UEZV4nSqcJHQPEcjPa6KKmhvFY720iWAee/Y5rGnVo7K
 AfW3DC0n9oLYxs92EEnragCU52NiziENq6lyNh6iRzUcfc7LLA2npJLn5IT1woFRid9NfJMd0vR
 Vjv1CABq2frloVrAzrgwL4Rkr0b8jV2KQ8LXFsmeNaJEMBFezfyd9rEPgRyI9vBvaL/rEpRqd9j
 yOXpqRsLy3qrIA0Ach2hGQ/zTf2IUZ6NqHOazvtnc8vnvOeJB0VpVSiLqp7yLXj+fMj9HGSIKde
 XQ2HyHaOhoprt5dBomUPVt8nPogdB8R//9PI907RdlpXJi0jjklhNxr6iYXytJCkjRmh5VQVLYJ
 pKa4ysK8GX95nMMeAvvKxVE61rvHcDZx4cXSrejuzELu0B/8KGMvwbbYzJEYSi9vQ5/ZZ85hASW
 tYFtAjA0xHxDrucgW/A==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020160

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
On Mon, Jun 01, 2026 at 19:06:06 +0000, sashiko-bot@kernel.org wrote:=0A=
> [Severity: High]=0A=
> Will this prevent the regulator core from matching the device tree node?=
=0A=
>=0A=
> The PMBUS_REGULATOR_ONE("vout") macro sets of_match to "vout". During=0A=
> registration, the regulator core searches for a child node named "vout"=
=0A=
> or a parent node with that exact name to associate the of_node.=0A=
>=0A=
> If the device tree schema expects regulator properties directly on the=0A=
> parent node (which is typically named generically, like regulator@xx),=0A=
> will the regulator core fail to match the node?=0A=
>=0A=
> If the match fails, the regulator is registered with of_node =3D NULL,=0A=
> which silently ignores regulator constraints and prevents consumers=0A=
> from referencing it as a supply.=0A=
=0A=
The Sashiko AI Review is right that with a generic node like regulator@xx=
=0A=
and no "vout" child, DT init data is NULL.=0A=
=0A=
But that only means no DT constraints were provided; the regulator still=0A=
registers successfully and the PMBus regulator ops remain functional.=0A=
=0A=
Saw a similar single-output PMBus regulator pattern [PMBUS_REGULATOR_ONE("v=
out")]=0A=
in drivers/hwmon/pmbus/ir38064.c, just followed that.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
