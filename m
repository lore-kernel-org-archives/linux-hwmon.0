Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861353F482A;
	Fri, 24 Jul 2026 19:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784922197; cv=fail; b=US7jN2cxq5C3sUPF0+xH2JQUv/pUs6iv8etxPlDewg1CNgXGrqqcIZlaVoXei06v7MSNuwOgl0T88Z36J0lrDuezpBahWycBX5Yhb9M74n+S6zx2/XvU14IJAbmSzmelDM5wCdbwA47WqfyU2X3YZXwZk6vqf3FN+R3aqjC4haY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784922197; c=relaxed/simple;
	bh=TjiL93MV2ySLr3Oa3IE7zLJoOqIt44O9PBn+zDXqMPY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OSUGaXOUG4XZ0je/hfj9TQw6bawtrhJL2MSdQ+keq9sY35Cr7/3B624iSaPJzuN/GJy6vNHuaDr5ccA63pyUmeMIgHN88iqXMVX2NiAlpHFftzPY1szg4BgwL/y7cRXgNfBF063KfR4ir/b/LL2pmZoOVuv8ozYDPquO1BHPVAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=eW8fQsoM; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="eW8fQsoM"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OJYAgu4063363;
	Fri, 24 Jul 2026 19:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=wS
	LpJ7E8Ha04/O52RDhHBLBYXzcJChhR8NmWMJxFfk0=; b=eW8fQsoMc3gQd1F4Yp
	aLaBdy97QbALa80gncO7xn0CP71xyAGtrXc9IegoIYSHz0SQ5s/5RvzoPM3wiElb
	+qHISX/M15wQOrvPE9GumjXAkQIorUoVl5RO1cVj6Hjj713stEVAs0m99gTb8mEd
	MEWn1IpFRkUsKBItVX4rpAeLRFmV6h4++hUDnatfmwpLB7VC0mJt2p65RhaSbhmR
	R/OM8QWdcRWqjs0ZnZdkH4lacKz+TOwDE9MOhurL22kzDbblDdfBwGT96Nox8zxC
	jjPBqe2oB3e2JZ2lSYMDSvv7YdFwYbb7cqG4z/skOIwLQN/QFcClwbYATYbfMcXf
	yE5g==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fmeaq84tp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 19:42:57 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 929E9800229;
	Fri, 24 Jul 2026 19:42:56 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:42:46 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 07:42:46 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 19:42:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B39lnZSB9+a2mmO5tTt2zd4zv3vNH4ElkW3LIqPiBqBVSaQjOvz6EOguH7furWWhgw2x+m6ZimiCYWM7b8Xt/VApWU5YyD3l5L+68pmyGYpmnhb0J3arqXq25t7RRLE4+KHQNg+OfI8apLdVVJItTo7AYK+iZkPVTAew1a1rVfCaVJimlt1Tm7LzJSlJWi7++OZAIQ6qBfgYGcVXbhB8BXcbVeBzzEg4jwYdR/48fvv4aX/HPuV0gTFZmzXyDgRLZhvWe3bvEAGiwJoCAPTNTMFvQdRVk1x0I3dFbhwIoodoWakglno3ddppPVPMnmxV/ahIxNwpOIY6wRXmZn5n5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSLpJ7E8Ha04/O52RDhHBLBYXzcJChhR8NmWMJxFfk0=;
 b=WZMK4Bo9hN/s/063BwmQhjWa+gsQrXpWhnYW93FzXMe6qFp8B6ZUoXTT99JOYhHgQGrKvMj3qEHKLSua/yde77SSGcyDmYhZjzS6ECkkqA+to5T+xEmrIXwykvuBYXhllPEY6DLprPBnoB9SzvDixVwipQ1554rwzYAiaJ8na8Bz5dCwWPufPvIU3dfrBvzYsbdblNQVF+w01tSZ7E5OnBRv1uMarbbbOVlQNaOlQ9KzXu2uqB3XkPbckIIZPRzJkrdB+2F9NlCWmDf6HuDJfZQLe9eRtzCuDzf1tvUJFx2vSP0jULn5TsfyksvKHz+PtO7lpnOBE9BsspQSBbSwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1666.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 19:42:40 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 19:42:40 +0000
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
Thread-Index: AQHdG4x34Q4P1zCD/E2JxkiuennFRLZ885oAgAAebIA=
Date: Fri, 24 Jul 2026 19:42:40 +0000
Message-ID: <20260724194229.261194-1-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
 <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
In-Reply-To: <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1666:EE_
x-ms-office365-filtering-correlation-id: 67bf346e-d49e-44d1-d95a-08dee9bbb8d8
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: C56P5hRrqMowyZwz5XG0PxVOcDByZ8+DWa385ekilUOkoQ56hElmOUQbueO2jsi9UjAsO8iPxkhAGd4Q+P7w8fg5FPJ3x977hMwCT/jeomw09436OMA+rKZnQRAkZJamJgNbs4huZ1fRkNQ3yKn2zMrEOqeT+hTpZpPeiag9Oao7OD8WRC2MxF8Zb9WMwvBxNhsiFIitvPaareN43d2A8sbynGZyCdI0YpE8tPmYSIFAJgfgaXxmtzRPvGjyuokuqKpDfieHBUhO1eCFkVT0YnUAWqsYUG0mVnyHC+AIfcilhWFJFl17fJT9QJW2vvEpiL1KE3gQhsZZovB+aetByMENFiXQNsBsOa9ee0Js2Q0Y+xxfejMDQKHFGoZofNbl3cKt5pE0iaF0SR9Zkdx+/M1DLJdg1PpYGSkpcd1OwhljnVrsse93bfkGRc4c9PLonQM2M2szkx8/6ESyKsspHepbj0rIuAAc2QeNnLffhHzLFk6UIBazV+CmuglGTia+mo/lJN5ESWYlhX9bdiNIcVV6rhvmwIEaic9OSiig1+SPBiy1lqTc1hhmKM98eVCIr9RR6Jc0dzCFId/ETwV0h61OhotUYJ7GLuONKOB6McCg54WAF7s1//EGsPIWFofE+AyUrV/mpqR7MuOa6m1FTXeg+aM/5WHWc5wTWrfkAxkFm9v1uu9Eja6WSJ0EQUzgtJtFh7j1t0Co/QPqPz5DXSGF5fdm/bc+NO57CDDtR1s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xvHtIGzcJu4m5btqzKH4IKrSpq/8kt3d1jKaZwCg5Upz/t5uYef0W38TyX?=
 =?iso-8859-1?Q?wqncWgFiQRFo5a19iyxhZJc35UwFpygNAr8tiXSYj1NFDANBb0GY4MX2ZE?=
 =?iso-8859-1?Q?COIMApr7Xi0XkYyqvi7Q5fkPM52XMc4dVIcaGOPWsjY9WobD8Xzx4QPXzy?=
 =?iso-8859-1?Q?Im3jSvkds4hOJMxVFo1unyt//L91jwt8bipFWfosgBXPcYcVjq/p1ZxicY?=
 =?iso-8859-1?Q?bz3Cz5tb8A+Je0MlBdRg7ckoyXY26VirfSprasQnPBU8Ytza9nMbdVUAuB?=
 =?iso-8859-1?Q?J257FoUGKolR6JaOaEVLX3bh7ZMujBpZUOFJm2xKDWiG/MT2eSv5JCJgB2?=
 =?iso-8859-1?Q?nvVspfytS3ZbPwbLKYEbxAIONgMK4zF6Fsog89SrxJ3O2wJHePIrNGzqrV?=
 =?iso-8859-1?Q?hm7yKNJdHYe7bh/55eOHinuwJCVE8DARFzo15A2jwfCqjG/tUhTgQPcpZx?=
 =?iso-8859-1?Q?PRW7PQ8tPzwnvQbwS3LNlgd9Du5ZFjc78TcMpuUeiJaaq+sg5bbpeyO11G?=
 =?iso-8859-1?Q?c1Eqv15U+S+OLsOUKm1HIy52yGicsV1DCW4042MGgzgwireeA3TN11c3Q/?=
 =?iso-8859-1?Q?J2E5vbCoKtj9al1Tb0M+DuqrwMgf3kndZqhryT0x5ojJs1BOV5ebpPIos9?=
 =?iso-8859-1?Q?t5HgSEUsoU2xG/RQxDyMbWdi8gdXBLrbB64qoK9/K2CvwVOjNdVPywx2Th?=
 =?iso-8859-1?Q?xo0lRc7uRzpsRNGt+iTAuPPqpp2J1jA75eIL7RDWrM2hakk149wvxxL+D+?=
 =?iso-8859-1?Q?UKdGUruWB/ukzPijym2VYxQD2uHlysU8gGBcjUhodGV7nno5jYsonkWV/S?=
 =?iso-8859-1?Q?hUOPd7w7s/7OnyA/i7PHqRmrPvlOXnk2hDswArcIRWPHiYGn9QhR68rQ1+?=
 =?iso-8859-1?Q?gyh6KPcXxoiCBz7tnlh4YgkRxtDQY5LtagUQeh9Q34PoI67jbzcyxZLak9?=
 =?iso-8859-1?Q?8Hi+pZjGvDCbH2xwCEzmW5sWj6QRc045ao2UOadmJxtYO6dJ/El8DOn6tC?=
 =?iso-8859-1?Q?V8/KqWeqMb2/amTFkJY3GnKhqPJyVjUbfzWto2ur+MeonR/uy4Mfu4hY4H?=
 =?iso-8859-1?Q?ylVHdQUkCdrfqXRlLhf6wYsFZI41lSfpyy1/dG3PWZfs1DIZq99E+FZlcQ?=
 =?iso-8859-1?Q?6db8g7szxtfqd3hfBYj9GWCzG46YvnNvPdknsI8G/DwTTY9QDMVqqIec1D?=
 =?iso-8859-1?Q?NHPUkFprv08dDKotnMSwjP+9qsEaWsfNIgzgqRgeR4QoMoP3pALMsM9P0M?=
 =?iso-8859-1?Q?D3skkclc0TRx8hjdxnlKE2YLCbX+LwfreZUdmL7V9GuXB9U0uv7inG5uOu?=
 =?iso-8859-1?Q?om81PFJ1YHBsNJOQmdgx2OlhCED1Yx1KoJpYlMdI9gIDDdl46aOPLBf/78?=
 =?iso-8859-1?Q?5H0qiJzvWZVOHwuIcGh8rPrdlD8lKZTqLWQEo/jq1J+ra0iTm0hjD9kMHM?=
 =?iso-8859-1?Q?dFNZryLK5pt5uw12dfeRp/bwpukFzovytSFRM8GF0QVKi3g9SlQ+cdNH8z?=
 =?iso-8859-1?Q?+PRnuEDRDOoEWwcoTFfXMQCPjxfd4ba86tZHSo75ddg8wcItGIZFJ/L5Og?=
 =?iso-8859-1?Q?fQVcz7VkbhwRVm5KM3IcWlL1Zu/DBSir4PnNjAYvT/4lSWIHFA1o5/2sIF?=
 =?iso-8859-1?Q?ebZKObMwDKlivaKRbUaQZ6bAbIi7kox6AarsnK90tYSsSa93jGVlCnv6r1?=
 =?iso-8859-1?Q?+wIQIBN2nNh0uS3gHMn1DEWX4/LqC056sb/qJUTEL6B3RRN5/VoMvZDs8p?=
 =?iso-8859-1?Q?xY+XCoXe3yWAJ2oPSrxI5o2957TrpvCI/ueJFY7fGzhg2O1bXTejkV5YB/?=
 =?iso-8859-1?Q?PKjdNlkzyA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O468CQ611Bn8+Uzn517gqTshCnjC5/qrpqwJ9Yr4aWwuPOO7MIKQmm9YSP7Ur/Fwy1mDdbYZLGm+brSrWott/E9j4EcQuFtVRSblLvbdNs1CElwx5s0Cn0NMeqOXDaBXFvyCOcI6vjknpxLQXWoHCYdphzCKC7akkIl9Ke7nzioLNSw7zPZndRIySr7+j38YrAK65fK5+Kyh4xTTohbA20iLGI0KdPPc0WSrRAlo5NU1j7AkbgjAEQz6losBDphXbAvkJSFz5dUuwBJD1gIeVjIv7UI2obxIqtY6mwsMyz0X0m+wq9xCzdnwtF/F3mf4++ZzC5vQhMuCYwodkscahQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bf346e-d49e-44d1-d95a-08dee9bbb8d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 19:42:40.2419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QMeOT0PjCsQPwDGXp095c8kwaoy7TYtarJzyVpvbHv2oxLNlx+/Y1EWmNXtVY96IscFIWGY+xARP0HjNwAQowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1666
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: P1B5DeEGjSsCwQ6535zfc74kjfVucDBK
X-Authority-Analysis: v=2.4 cv=UcdhjqSN c=1 sm=1 tr=0 ts=6a63c041 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=qyv4EEyjTxOpfzQzqrYA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: BC4LF3aTNbXL_glQFbURqzWKXRypO7Ic
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE3NyBTYWx0ZWRfXxL/4wU7AHzOM
 tUSD42+YXMJCrTGJIzHfsxtvgPk9OoqsOeGYDf0iCeCbNlnX90pfTKLpBGCVgEmYbhwh2QMab7e
 J9vdJg/ufQocTAb5E46IJPjDKJAw6t0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE3NyBTYWx0ZWRfXyVdfs/fARSGf
 2IEXoxrA5CAqbVNqgfzXa1yc8Zp3RYom9ouL0/2PUJgv5sRzftEeWkge7+msY+6PoVT3kYlouFb
 q8h2AzcB6PtlhVa0t85esleZxMqC5j91wXhafAMZpEZg0dleX0b+nH6N9F4V79DtnBJr7PUMGpj
 CxxJ059S8KZ+XuEprkbjXi28xM9YInbvAcbHDJH/ic1T6d/zs2m6fneM1A4g56l2nbcWaQ3R1ei
 sCzMxPZajew5lMoMSgrzhgh23Sl8eodXPRXkOT1aR9RRHFt29P7U/oKfXwHHSydeilmxd7QnzNX
 Ueipj9ShBWmL8PdUm7XZNtk9lwmvfF3LspGE2dkVqAnpSXeo1xte71o8A7XmQPgPakpj/jpJY7s
 jsl88jVTIapQdTcmhs79m7trUBietUYMpceUoMRmUgO/0y4tjKq3e1nN7PdELdgHlKjbi3RFt9G
 gfohAjgVXFLmfr1P91g==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240177

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
On Fri, Jul 24, 2026 at 10:53:36 -0700, Guenter Roeck wrote:=0A=
> I get delivery errors for the following addresses.=0A=
>      ddevineni@juniper.net=0A=
>      gvlaev@juniper.net=0A=
>      avadhutn@juniper.net=0A=
>=0A=
> meaning they are quite obviously _not_ involved in the patch approval=0A=
> path. Please drop those addresses. Also, per=0A=
> Documentation/process/submitting-patches.rst:=0A=
>=0A=
>   Any further SoBs (Signed-off-by:'s) following the author's SoB are=0A=
>   from people handling and transporting the patch, but were not=0A=
>   involved in its development. SoB chains should reflect the **real**=0A=
>   route a patch took as it was propagated to the maintainers and=0A=
>   ultimately to Linus, with the first SoB entry signalling primary=0A=
>   authorship of a single author.=0A=
>=0A=
> Does the above SoB sequence really reflect the approval patch for this=0A=
> patch ?=0A=
=0A=
Thank you for the review.=0A=
=0A=
Just to clarify the sign-off history, this driver consolidates work=0A=
from several internal commits developed by multiple contributors over a=0A=
number of years. Each Signed-off-by line was carried over from the=0A=
contributor's original commit, where they signed off on their own work=0A=
I did not add any sign-offs on their behalf.=0A=
=0A=
The contributions were roughly as follows:=0A=
=0A=
  * Georgi Vlaev: original driver=0A=
  * Dhruva Devineni: MAX16550 support=0A=
  * Debjit Ghosh: MAX16545 support and device-specific data=0A=
  * Santhanakrishnan Balraj: severe-OCP filter=0A=
  * Avadhut Naik and JawaharBalaji Thirumalaisamy: device-tree probing=0A=
  * Brian Mak: fixes=0A=
=0A=
Some of these contributors have since left the company, so their=0A=
juniper.net addresses now bounce. I've removed those addresses from=0A=
the recipient list to avoid further delivery errors.=0A=
=0A=
My intention in retaining the Co-developed-by and Signed-off-by lines=0A=
was to preserve the original authorship and sign-off history. However,=0A=
I'm happy to adjust the attribution chain if there is a preferred way=0A=
to handle contributors whose email addresses are no longer active.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
