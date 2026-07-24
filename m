Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468474483BA;
	Fri, 24 Jul 2026 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911876; cv=fail; b=uOkdQ3BUuoNIxL1gjJkraCEF/kOWt3+IL6x4nH5Ty0G4+0zC4PQv1PzcEjay9TtcGEl3Mci27tG3H4Jti0Ell3k1uxveoL/Zbz7zlNVtnYBotgvuV6LHoZsFTBU8jr6a5u7+C3j5N+r8yzfrgHDJwebofCi1QgvS+MKY50wt+xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911876; c=relaxed/simple;
	bh=bgTjxl841Vm3k6a0+PK3YqY50n/wffSCTzWUoQ1qBgo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EdsGEAPa/g11XlDkCJ9FLWoDUgLjwj6Clxh/GD8NDhWP8erNngCVOMIlUdFnGegr76iNFQph6B9vexj5G5LWdDr/N7ua/937BDUTBWd4U6FAFzHwxyzt5Z9Ih8js+sFDxmrJRiWaUeldmLwziIOuUsPs+Vz+4J8R9ytiIGI1p9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=AaqUZHHQ; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="AaqUZHHQ"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODgTpk2931150;
	Fri, 24 Jul 2026 16:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=bg
	Tjxl841Vm3k6a0+PK3YqY50n/wffSCTzWUoQ1qBgo=; b=AaqUZHHQluLtZ4f7HW
	zLUwYwwjCIUs1hKf454VhPJcJd5jhdua36UR4FBGKxcfRZK5N9D7KiJLsz07EsQv
	GOCXQ075bN0fJgl30NXgJEPrhRlAWOu9/cona+zwYYivH4edM/c4kuIcIkUCWOHL
	u+I0losTiFua91esavZaqEhBwuRJVob135IcfyaePO0ffoVNeghyjzPSyVj3H96T
	7Z3N5Fol7x5hZxMPQ28QrlClaSIs23ubPR9mWgdNXOK/6MYcLs9fIlZxmVTRQrHM
	6XOM32gQiRErO+K0HlcP3G4SIWYWCN0YwMy74+EbQa01cjQkE/HlgNq9+m1XRuVj
	GkmA==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4fm845brua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 16:50:56 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 73CAF805674;
	Fri, 24 Jul 2026 16:50:55 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:50:24 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 04:50:24 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 04:50:24 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDVVvRVjumXRSwosalN99CGMfq6POmgSZSOMLgtr5a0j66I/xLSFSGbW4OPltIvNcPXVfa10GlL1wpxXubhpg1J3bcizssuXs/RZKtaMNMelBel+VyfrlMmtwEJVAWkGWgYqjD7btmdcS1bGh9qJ1B35rJfnj/YmNU2IeqO0NTOFYS9p+6jW7I/MabuUWi56AQDoDXWFfzzbOm0AyFG1J7kKuaWghTqPDSvarEcMUs8QP2tbo0NxB182cAWtdzsh2RZuX/0TjNdw4FDfnG6cpONrwV8kNwQ9MTOV+GXLWOIXgDmFnYbLZ/9mz/NAuAdaqXZPIZScvzjbYhrRUYv6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgTjxl841Vm3k6a0+PK3YqY50n/wffSCTzWUoQ1qBgo=;
 b=c9XLN6hooVjKX4ajqjxNvvl+GAbsOquTiBkjcYgtkyqH6no8dF5m8NOs9gd1+vm2YclYLqxX5ZfZMqg/Hu3XKqNPcIWI0wz4a0AUJyEtm8wI8mXgcB6tU7yDZ9gyBmweIXDIoIdQwOPHRg7rDDH3AP7CDpq3Qbmn2Ml1KMDnUjhwYPlNcfn3pmSNYoRHHaaApJ4TsYKxsqAVNSqarwdZO6FYXLZJR46h2fy/9OoaFTupHJBH4IolocP3br6TMjLvwsXqW3lkC3WpJU1q2Fr3Qrz0pB5loVTxLUAGcYdtnbQQqpVMDojGx6fauXTtyiJZMdsxBE7+47OetDECrJG55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB1816.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:156::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:50:22 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 16:50:22 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "krzk@kernel.org" <krzk@kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdGsJ2cSmLk2VFO0OlR+OxGumQZLZ8YPoAgABGh4CAADvxAA==
Date: Fri, 24 Jul 2026 16:50:22 +0000
Message-ID: <20260724165008.248684-1-sanman.pradhan@hpe.com>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-3-sanman.pradhan@hpe.com>
 <20260724-skink-of-unmistakable-novelty-d97d95@quoll>
 <668b28b1-875f-4fdd-b367-b09edef95367@roeck-us.net>
In-Reply-To: <668b28b1-875f-4fdd-b367-b09edef95367@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB1816:EE_
x-ms-office365-filtering-correlation-id: 27b77d24-fbe5-4392-563c-08dee9a3a740
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|18002099003|22082099003|38070700021|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: qbbYp+p6h8rrQnfM+XNg6Oite2xfhADGkjzqumCyvb+loRyVLqz3yxLEhyewL5H4W4CnPhrQfbgs91INwDoalyG4o11DV82wbJEAGTbl6XA2mrYoBeR/N67hypCIZQB8Ij2jyKtRjKwc+oM0arEg2IjS+lqMXkgoyVvJcqgt6X7H1dPlbS/bksPI6SMAzsmJMtIR/3b5fJswS9IgpVkX40CDDEr4+78g4sl/QOV/zsQLKUVS5yU9eu97W1Qrd31+RM6qzqpcZifI/iUn/KqY8RkgYoGbpheedCypAEdccpq+H9b0XrfC8+xWhd4LxulIjU1OTaOX7h3dgOtR02Skd5ltpidsgIgdXoxhzOumgnMu+4tU9GIZ0MANrSHROmthC4wopzq+w7dw6mKj4HC+mKaf8YXuDTW295bHaQ5sTdKVE97j2kWdmTr1kld5rROY30ZCj98IkqhaGxHtyyxc/7xxTisMV4lK1U5neDEOsNjEgcTTmS9U434Evp0fTTjVg5zGjSN+jd4df2xHtZ0Oi3xtGRUvscGg6RfusiGPaTdBKSpLrOh1mbJl8v2wGvYnYo7MdhdBYZnTv1irN/ZMHqAf3MdZkpr0Wcwa3P0L4h0TegFJLXvB8yZ3lTqEi08CN7zB9S5vejv72/OBl6MIyd5oVWiTl31KcKRUCWt4lreDG5Gd0HDHqACEQ/BWXmaAiGNpG2bHeQ3zJDnitxAN8WBUnBO1CWBCtulhtm34weg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(18002099003)(22082099003)(38070700021)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AksGUFB8iAXKXKNbUn2svI+sDEgdgBApy7Qx6YQqeOLOCoVDB2VCL942Ab?=
 =?iso-8859-1?Q?0UnKpOWN5WWCHc16Y8qnGaxUXXWjaaQnI47M7pdanXu+GmDc1OUkOEn+VW?=
 =?iso-8859-1?Q?4QfT5ukppVjIyR8rdaBu48XNwhnCRhA7jZiI/BdLAeRmQE41yTxKVgrfef?=
 =?iso-8859-1?Q?yoqONiv3wguSbrvAuin16zO8KxoRb9tHr33/mc2z3AJXmcdvXQndqB86fL?=
 =?iso-8859-1?Q?TbaS1rDG0RpKkYSybOKOe28btrUBqN9wxL204Cp2n32gTdd5vW5ARMyRPn?=
 =?iso-8859-1?Q?zjjgOMJtM4JCaZJGNfYXyktXu8ujnJsYUO5EJ9s120M2VyR0+NTDAYXYZC?=
 =?iso-8859-1?Q?6Q1BgT+VAn6vi1g2hivoqcaamYKXRmVfwbyM0pGx/0ALLaEs7ydoSZxK8+?=
 =?iso-8859-1?Q?meqUN39pGXCMkOuWxHErB0wn1dCtT4fVl57G/lvHQBgxP4jdcnGVS91CPM?=
 =?iso-8859-1?Q?rRqHTs/0md01DhY9iiA2DXCh2CRaPjDX+QO1TkQMJEGCirrlH42SK5av7a?=
 =?iso-8859-1?Q?ynkXX8a09jKkVjOp6W6RfGEaxvjKvJ7Wvf8LFJHO6tLo98BYVJ6o3J49OV?=
 =?iso-8859-1?Q?GBd5/qC5sZudp9xP57FKlW8sRbYdNTKVYfhu8obvDZK9DR/RsnYHtmMRQR?=
 =?iso-8859-1?Q?D6y76rGDcsg8QHS41fjojnO30ziPSMqJ6yydNnzaRUo00FxZtM842yPT/b?=
 =?iso-8859-1?Q?PrJic+jh9azJmVlLFw9ihmHPDUJV8kcLdKHIMX7Huaie22yi5YKDiIKous?=
 =?iso-8859-1?Q?mJVOmQ0FJeTjzJPxIVFPVwjAiUIXdaMm+iOSAGMK0FaYy/4OVZRgV276V3?=
 =?iso-8859-1?Q?Qt9TmrIItvujEqDDu0fo98s9WQit1z4YJrXvuznzUa4ZNAbi5JTbXiW+DV?=
 =?iso-8859-1?Q?1yp30ZIsZh50/OUAv4sMOcUypSjZpg+6MpHf1R7/R9yS+ipzcg/zxxMvPl?=
 =?iso-8859-1?Q?8HtLfoQUdZKJUDB3CjiCST4Ld6uhNShX81LSO6bAsoub2oEcsrVCtOpLOY?=
 =?iso-8859-1?Q?E1mJODnKeVgQWDRuGeiuCcdxMhcxI+eNMe2gl5tb/DYOtn0bk6NstxfEXa?=
 =?iso-8859-1?Q?9zrY0jLv7Slo0H2DMdzkiW8qokcG+TtnwbWcWUpOpz4IWto5yi8ElapjVe?=
 =?iso-8859-1?Q?t6A2H4zxxFS3CL7pm0fgVWAGSzsWsgqy63VTIzGNY6gIuytQYtWUSrC0QX?=
 =?iso-8859-1?Q?/Mow6lUUfErJWqtvJVAPsNnNGIkS99Dl1exY9oODkD1mfd/efL+qW/dFin?=
 =?iso-8859-1?Q?ry32thoRuoHrw/yjF2rg3D0Cm0p+46MjN0PIGskfMyXB7pdUu1ZgSO4cBt?=
 =?iso-8859-1?Q?MaYtD+Kf0yt5R+/fuyTYpSjPdwhmNwv/T0RPXMTgJhFfSYfPi7vOkWw833?=
 =?iso-8859-1?Q?/DKIYqmRiUV6iXYesQKTPuQw0mAFGq7Fd17EaigdYJJn1eEaRl5gY6LvvJ?=
 =?iso-8859-1?Q?HOCIxzTjR6QxOTftbdTwxK47Jzx5KcVUllR/LeyczhMkl55QO8cBwpqDyy?=
 =?iso-8859-1?Q?vjveIFmeKdN/vKEOt+oK1KEmqF0s0IIjY7pIXtFd8wjmddtl3wPy/6diqm?=
 =?iso-8859-1?Q?80Ixyxf6RUD89wp4z+bS8C1m+dyEP/Mw+I/K3kncD53WY8S4W5NYN3Bndg?=
 =?iso-8859-1?Q?0joLJTPgzS55p++yXi36pA24CX9ysU9cdyuuhr8ZtpYtEZUKnMm56XNbZC?=
 =?iso-8859-1?Q?XqVIP8PDVVgTEZim38YVJm2Q9yQef9YdVq1ntq2JKG3gGyCbOSCkl/jlzK?=
 =?iso-8859-1?Q?VBvqfhhY43WgTDfrZfnUSYM/e3fV7iJt/1z1RNiqjdcuuVw4nQHHhFXWmK?=
 =?iso-8859-1?Q?hv5Uuujs/A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: daEPaFO7jq0diPs1FcowpTXga8XqLmMG14q/tCj3EzAcDFpVAu8MWwmvzVuFTy6WTmWUJNRkMBHUlt3tDSEUKZdhxQUXCmVYaD8kPmbeRGTAtiLpKxsz+iaNcgKSAdnNyJCiwVJGfc4I+CQYclf8z3FTaM4UjwxiFWwOPTWmtm88M2Tb0B2xcczoycKm6rCalY6iihSMhxOEJX0WAQb/VAgNZT/kEFxKaCxiGJ4fUMN0dD/flniRXqsh9mkEzcBjxB+38NfFRg2xmb5/vs4znuRdb7XySahKH17bIwRGztJQ3icDSjAYjKy52J6XHALq50LKY6n4T0AlUV7R9M5pZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b77d24-fbe5-4392-563c-08dee9a3a740
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 16:50:22.7816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9JapZCmfBuAqodsAFGbyNW7RsALtxkKkARPX89XaZZ7XOLuxrBD1CyGNBv6mlap/qvhRWGbEn9TUQj+T+dTdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1816
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 62ap8bnzrvR8qZ11oAUcIF4KsgNSUgbh
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=6a6397f0 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22
 a=OUXY8nFuAAAA:8 a=c5v2O8AZa9RJNg0W_cAA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX3HH+qurflh8/
 ecIOelGxLNQ84tbT0M6RARb5j1axX5JbeYufHkVRLJhIBx4kaod9JOaZFdfnB1EStIR2KSReKqw
 ycIA8mSbA72CH6dHiyI89Jp4JWpBiMQ=
X-Proofpoint-GUID: mUlt9gdiNt7h6d2sjpIiFDZTDPnW3mFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX0EGGaprkiILn
 LMvoKhBdiC1gbcj3L8o3pjIwSIDRxoq9GJbbNXbqaXBelLbUDZXlK0AJftCGNBrBPCmevqPAKUl
 0AnZvoI/4y/cEZg1nl7yGLadB88n5YSiB+r2RO9TGI7tGzRk29tDje7mZQkbweuk3IYIhZFFggI
 xYSeG+M60ucVHhwH1rrpz/V4ybxxJf0DVYam7v/g77U7ZMRLW33zXB1h+xp95zE9NBifB06HzL3
 6wlVJ0vOibaQVbPLSyi7RrqjVboascQwXDhsbVXQxaIZPUdu3A4fU4giNajThnAl1L+jByrFw8x
 iUVQ5vrxGYxLeS+knClNKnPBG2YW9ZKI6DOYt2Ugfz/MBV2CFja45+zoFrVGfZSI2vM0s8vIXs0
 5h+YLHUfGbGxnzMFcPD3RWTwgx+pjdSips7/Or5BOb0FpGs8LW8bIDL1mJQmpayQiB7UIKhK3FT
 2YM7Fqxfr0GOqdZiqjQ==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240150

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
On Fri, Jul 24, 2026 at 06:15:35 -0700, Guenter Roeck wrote:=0A=
> On 7/24/26 02:03, Krzysztof Kozlowski wrote:=0A=
> > On Thu, Jul 23, 2026 at 04:43:59PM +0000, Pradhan, Sanman wrote:=0A=
> > > +enum chips { max16550, vt7505 };=0A=
> >=0A=
> > You must adjust to upstream kernel style and such constants/defines are=
=0A=
> > UPPER CASE=0A=
>=0A=
> No, you must not. Not in the hardware monitoring subsystem, where the=0A=
> chips enumeration is and always has been traditionally lower case.=0A=
=0A=
Thanks for the reviews, Krzysztof and Guenter. I've tried to address=0A=
all the comments in v3.=0A=
=0A=
Regarding adi,rload-ohms: after checking the datasheet more carefully,=0A=
this does not seem to be the same as the current-path sense resistor=0A=
that shunt-resistor-micro-ohms describes. These devices use integrated=0A=
lossless current sensing the ILOAD pin sources a small reporting=0A=
current proportional to the load current (typically 5 uA/A), and RLOAD=0A=
simply converts that reporting current into a voltage for telemetry=0A=
scaling. It does not carry the load current itself. I've kept the=0A=
device-specific property and tried to clarify this distinction in the=0A=
binding description.=0A=
=0A=
I've also moved additionalProperties after the allOf block and added=0A=
adi,ocp-severe-filter-us to the example. The property is still=0A=
optional, when absent, the driver leaves the existing MFR_CONFIG=0A=
setting unchanged.=0A=
=0A=
In the driver, I've replaced the raw enum match values with per-device=0A=
match data for MAX16545, MAX16550, and VT7505. This avoids the=0A=
zero-valued match data concern and removes the compatible-string check=0A=
from probe. The match data now carries the temperature coefficients and=0A=
a flag indicating whether the severe OCP filter is programmable.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
