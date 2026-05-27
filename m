Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D342BE644;
	Wed, 27 May 2026 04:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779857724; cv=fail; b=tWBRcBa4pwF6VHO5yVNflJ+Rgy1bbFCK269CY7JjNNib6H2ye1CCdpFUQ9YkcXIghXTHdx2GltTd4Lrb8CJRXDyoHqs8cmdRhcwDLfIZqxL+GKPRaGqzY5lVX5GyN0o9/3BU3ZPISHZWid5WR69W7x4cF6ZbaStDmIze5tVXG9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779857724; c=relaxed/simple;
	bh=YYEvZE75ua4aU8732agNK5qY2fntzb02vr7E9FH0g3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a9b2Lsf/ypQgme7XOWkEx4YUnb91fu79NGuHj67QUSfCQe9skbBaB3CuNHV1DNElZkoP341GjAstQ9yY1G/DDfbxt0STWXi3Uaf/cCDkBGNoed6PpY5xqt1gSdxHKPncLD7mZT1fjUt/1D2D7zNzdmfcZTchq2AAeABLoLJU60c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=YgpTVf/T; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="YgpTVf/T"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QNWFqT1285981;
	Wed, 27 May 2026 04:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=IL
	cKmtMzBPYNmG8cTcMf9yh6RPc3NVOVHxfd5CPSJmo=; b=YgpTVf/TqEvQ+X7VHV
	pPmTKBLJMqX1+uyOqxuwIPgi9l7Q8c5N/g+33MzSrA5nZ9EPhFan5Lcg6uuONAVB
	Q8nwF1t+15jsuC8lXzMjhjzbqHz/BV+OoWYORi8/POBhoy+eDSoOM3XCf/tLiT6O
	EAIu3pPzY4VXx/1r/ez7Xgs6iMZJMe+Rra4CicbjQTLGG4mq/37sh8Qy+6eoywzv
	xTXSO55ZHsSbwAndFIe5PfHETS6vZxM4SD9t8vTJERDzQWX23WjNuvNPgrzf2WgN
	e3E7HJ147sc7opZomi5mkIoMFgEqMeFIJQLcGAno2Cq2wDYwJtJMOEnOP2nLCNfj
	iKeQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4edm1cub08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 04:54:52 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 4C4CA8003A4;
	Wed, 27 May 2026 04:54:51 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 May 2026 16:54:45 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 May 2026 16:54:45 -1200
Received: from DM2PR04CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 27 May
 2026 04:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP0sh54p9KCqZAhT3ThN9di0nxJExK0IO34Z3X3b/KvVZB3IimccOmJUjd5hGTvV+DXzMw7Hivrn5/zsuZykT4ZoYesiTPghlUs86ldJpIXn12nhaHFqK9GdsP4s3LhMmzjnecFplJzWaMm9hJZvTQm8/m7ianPigV++SzC2vZompX+NUJHI4lHHegepekNB8kHbXZzWPXLnyuVrcRUTYbWsDKqitwJiqZPXg/jzbPttqRFCLak2kRIxpdyw7chZH5sojKY+oMZi+F5EXPwZAdNHVn0JZl3GLhh7hycqX/PPA/15p4FaroVYOBLXQglUICTDPzafc7fy5YcprEmJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILcKmtMzBPYNmG8cTcMf9yh6RPc3NVOVHxfd5CPSJmo=;
 b=amGq7pXVYIjT77oUH6PHa939btHRP0s9cFtldfmbWGLdhQL3owbVAsOUGoy+67j4EObGc5Wwf/R5GudYUB3mRorkbnPMGQ+x0Id9ZTHH6TWwD9l+cnQApMRvETRuF93U5ToX3DgsQJ2Dk56ArNkv6DeH0eMPJ9IiAL2YENwl6o0SgbZNZAl03PLL5WgA3YQUDhV1Rl2jaJyofjMcgVd9GqJCr8rODauwWE5MANVyvo1RSZjHL8gqPfJ+37CHvMZpuOCQNLjcp+ddq7RshMPdhCY03xlQKIh0YyGvin0hSXMIk5Wz8mPRVmuVeTgOPuA3bisrqM+jQqqlqqRflArk7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1496.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 04:54:42 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 04:54:42 +0000
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
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices MAX20860A
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Thread-Index: AQHc7ZTud9s8mAoGu0urhIKJwj0u/w==
Date: Wed, 27 May 2026 04:54:42 +0000
Message-ID: <20260527045409.9092-2-sanman.pradhan@hpe.com>
References: <20260527045409.9092-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260527045409.9092-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1496:EE_
x-ms-office365-filtering-correlation-id: 7858f85f-be3d-49ef-731a-08debbac110d
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|3023799007|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: G/RAD1k2p/jZOzkVQ7P0PmoPb7yo5jVAIYjxbrYBqtuQUylpxZG8HDC9JAQe53kB7Ri5vO8jIcLW0y7/llM2gJN3pHHR+wzxevV8Lgy0DrVRbY2Omkr81zb6QDfmVDBY2cSjdv1aevi6QVb7E+HYvSwlIqL7i2FEmj6Y/U4JJWhlZL6G+yMuHZDjHSEz/3Q+T/vL1R4UEMKc9vmP/fJPDovZYYsxetOPyHxPW5U6AzXo2z07qbkVbPSHzV2C2Fpn7LTBOsZXVzvcTsMmcAIqhY9hqjCdxBdpvqiFnLcFaZDGyDggS7nwbiwCdWqFkWvZWGQ5xzE56EOTUz/1vrET0fUSCu7IAN4nEHRMstBidR/Kwy51kAnixjpxscreNfbC5gi1FQ894B+lerOvbfqzf2sKHi4QilX9f2DXdeECNLjK8S7GRXbaq7W3kd0ssG5CwSK2ocS1R0jVSZyX02QIZVOHUhSVAzjpx3fe0iN2gtoBYf3rnZFHVzGOg8vqR+7GF9iDoCT116bHeUZIA7f/RqyvadncJCQta417AZcHmeN8IrjCQf7rU48aq+xCFKjkBDR2ZKkfxbJ5D/YHl2kF+93Ml8TIDbxOIBH92Jl37moIy93f2XoAgJGWDzg2UOfrIz/HgCRVbkTv8i9sxfn8p9dSqbE8Lf0oiWROc0YfAXIy8r1msoCS7HuhM2OcAFhKI8BoG3zwmeAC3nebSrkBMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(3023799007)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3Of3HoLURDjKkhXUvrjZGttnvdd+Yy1VebfJcP6SRnORiPz9RoOnNh2zxo?=
 =?iso-8859-1?Q?yyH1KpE1nQOrjB0RL0NQ6mPxQx0FQS4aqhUIbd/gHtiuv454al+J0e359y?=
 =?iso-8859-1?Q?I6/bWBvv2sZHNL/MXSijGMblHBrU9fYZpiJuUHi5ji0mOjw1vAIH5yYOk7?=
 =?iso-8859-1?Q?a348XyQ2rBOkYEFJpRaiI4P8k0NKxsTy7UFMopT+JSwbDhO8yxHAsA452F?=
 =?iso-8859-1?Q?//TfMJa2GhU0MeRDuQTsxvKdRlb1cpT4WoYk3we8JHLZ0CxjCkBg9+4ITF?=
 =?iso-8859-1?Q?QhdiGAeLbiSuHc1712cW2E0SYulLQ9Fa4MbpzQ0o4j/4K1lizVXk1njUDk?=
 =?iso-8859-1?Q?bHVe4MJol3RHqD6zKaFZSE7RNB8bB5ZG71VfN3i8QcfSlkyU1OP35bh1w+?=
 =?iso-8859-1?Q?GjJyoLYo2wTBx5NHZOujBiiimQsQzm8ncVpevBlTkXZcv5AjBO53zSXaUY?=
 =?iso-8859-1?Q?dJ6WBDcgjcer9lJy2F8P2W9gNOaUC6IZ4eJsjAuE2WHH5UZNq1y9AGGbyR?=
 =?iso-8859-1?Q?3haHDWIzgU83F4rrPIlHpZv2dLNGBqoBJImG9hmQglwuPN49HkBfBIQajI?=
 =?iso-8859-1?Q?dmsjhuAOc/ZwHKmKRYGe/zi2RSvSF/n+D3nuwaCK6+nciors3CHNxGw6bH?=
 =?iso-8859-1?Q?V/lzaMTUW9WySCVIjrnpFZ94sh0ktn/uJVpd3ZE23hzDB8Kj7wz0JdeXnv?=
 =?iso-8859-1?Q?wW8HCg6R92nk+4iHNfXOTCQS91huSy5r3GqgaiYoUhqScm9dyN+HKNMDQf?=
 =?iso-8859-1?Q?IeNVyXnLzu2BNvVly+nPAO3f400871aTvyyyQX+A5jg0hw3vo4wY6cdf74?=
 =?iso-8859-1?Q?KCFvoEBXm0ecRVm6gSGyKAkYz54YHrWa0d8EbrXVh+CRaPlrzud/AcHIn/?=
 =?iso-8859-1?Q?Nx1NfsvNyoUFmVSoySC+Rv6KDB+ADwohrx8hDn5PiJk/mG+qJAFS2GrYzd?=
 =?iso-8859-1?Q?GeJw///VsG3F9wkFsx3PWT/Zc2KdGEQG32lK+Q1g8M7jRayFIlaG3kxblx?=
 =?iso-8859-1?Q?uuyawT81ffkEmHULy5wYb+nT/GxmBdPkFbJStPKoFpuuu+2jOHo4b8hYUa?=
 =?iso-8859-1?Q?g7YLkJ1Dfurj4tY4WXlw6q1PdY5Getj4UFy4VO7A21Akp84dnGCo6gq3a1?=
 =?iso-8859-1?Q?DaEg5JybmImACEJNoGP0S+d6oPsk+MPSF4PlVbdONroK7v/LkDsyJRBobq?=
 =?iso-8859-1?Q?cizD9j422v9D/60a3VyMUxRACpXKgzpiTG2qtC9mFQTDn3vMlxxl75LXhK?=
 =?iso-8859-1?Q?nitA3CW9AKLYa9POJYIdSwvPaWpaMb7+8XbauXKyPfdE9KD9vGU0IQe2Ym?=
 =?iso-8859-1?Q?Knbtj2/5DEpy2Kw7/NjjIsE/DUrEz5w1TbVB2wstXLkPcbVUC34fzuTenu?=
 =?iso-8859-1?Q?oesx41ow65lxaTJdMnJmINWigomUroc8EB+3QmihDp81M+4AClzmPOuoSw?=
 =?iso-8859-1?Q?hsS/0WcpllmGdQf8WQnyuVM+AMR9rnbKA9sDJS0GukkWt+RmF+0tzZQvWr?=
 =?iso-8859-1?Q?cI9ayMjLExdTUykm2Uar2TeUkRFkSztHtS3OVMEB7+mRcd/YDnvpML5mOQ?=
 =?iso-8859-1?Q?25p3aeMVOvmhmzdLMmzzWA5oIAoUeRBMmzgdjLsCRQm2hVqQZaew9DTpgM?=
 =?iso-8859-1?Q?EuXQN0OVKqK0twZr3b/uMLf1+MgVQ5MxsHkSe1r4qMtgCCJjb5vOlCPmyj?=
 =?iso-8859-1?Q?dOsRYiMkHVn637Ic1jFDL1ctzbBR8FsWYrc7ZFkNRZ3ydzd+bqNpvkMaCv?=
 =?iso-8859-1?Q?jhnh6zeDngk/2kGitQYf7xc57L9/aY+WB7yJe1wSNzL/j4myvS492/AAUl?=
 =?iso-8859-1?Q?xnZtvOSBNw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FJPBv+JAr9OqTYlfpYdSdRNw+EAowfnodfyxlkb5MiC5KDBGm1+/uqOXf4N3OBv8k9JvE/M1qpzuVQYYYMWhxLzR9DVJngsURUSB5eh/uofETZ2TdoWa6jJ3VIbX+n5LXP2q4Lec3pUWz8h38csvXfR/EifdDlxx/xOnU6xPMKbiA6Wpzk5w8sjhdFtaQyGGk3rZygUX9R+Mu/z6kmzUSPH1nFmcerwMHOPve9N3HEkXoK6uYJh2KqRPaDuLB7eaJTScmVXhSlG15zad1TeODG2dHRbIN4SEOFt/8a9ObOUiHwz1rnFgc2fpswr2UrOSdj2S6dVE8lSq80QmUgNOTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7858f85f-be3d-49ef-731a-08debbac110d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 04:54:42.7718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qUiJeVE5mz1JF8m1QjTd0++surNjSXj+Y0WLiTAhXbMcPp0TV1J84+STB06+XPQjAcjFsKNXeixWbTPacmbIZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1496
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=CpOPtH4D c=1 sm=1 tr=0 ts=6a16791c cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=HxtRfhFi30CcAKtSzY8A:9
 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: pmcJV50e1yOBItIxv43Sc5kSprP7eso0
X-Proofpoint-ORIG-GUID: pmcJV50e1yOBItIxv43Sc5kSprP7eso0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA0NSBTYWx0ZWRfXx4Vuxgqd7RGM
 QAWyrB5N+PcPcQNYPLPxCw9y1X3HBwIJQIoPN3fVJ/0TzAfk851CDyBMHsb3TlmOtOX5DDgTXcC
 QSFtpuTUdEYw+I1PLShrE+ztlKFWUASbnZpOctblCdLh1rJGbmQh51DfVsEjd+kJXITNrXLxngA
 PkSx+A07Q566PDQVDY6ivSD8WYjov+4mQFBaPJF/a8riepy3G6y17xaDyLiXMfq5BMFkPzRJN1U
 n3rsCOhu0D+J6kvCp+peQsSRmN3eRL7OVD/Dse4wYUDerovtkZ7in7LHHhyAdmOpXeOY6HWmUXM
 EMJutNkD66fNdmeLl11nlkdSrIRmKSMrUpUYg89bcQcGnoHrBljiq6GO4zBC4n2XW++rcSuqIVQ
 viqysFiq6/mDGDAG69+otEjUJ7ktX6fLc6w9Am7mK5o0RhRiyHytBYMOdMsxyJY6iDYlFqRNkLu
 YaRTG2j+1q3f+5xyCMA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270045

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add devicetree binding documentation for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator with PMBus interface.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 42 +++++++++++++++++++=0A=
 1 file changed, 42 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
new file mode 100644=0A=
index 000000000000..d864fef210b1=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml=0A=
@@ -0,0 +1,42 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: Analog Devices MAX20860A Step-Down Converter=0A=
+=0A=
+maintainers:=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+description: |=0A=
+  The MAX20860A is a fully integrated step-down DC-DC switching regulator=
=0A=
+  with PMBus interface for monitoring input/output voltage, output current=
=0A=
+  and temperature.=0A=
+=0A=
+  Datasheet: https://www.analog.com/en/products/max20860a.html=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    const: adi,max20860a=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+additionalProperties: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        regulator@40 {=0A=
+            compatible =3D "adi,max20860a";=0A=
+            reg =3D <0x40>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
