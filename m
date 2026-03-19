Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D238654C;
	Thu, 19 Mar 2026 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964319; cv=fail; b=ITMK5y/8YANB28wJBojyiASi9EfrCbs+J2mxbYBcjThd/5zEHsnWqmSbHZMnko7cLU+iQmWr4hDz27cuha695VnxFH0nnNIBRmPYvAnpts10Xym2sa+vGf5P7pdduVxnrWOVhY6Rg1uE06t1JY5d/PegQj1D9StLuy8RA8wkqM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964319; c=relaxed/simple;
	bh=bd6Gcg8ZvqgwhjVm+IhMLRF7gb1j95Up/aUBB0hPPvw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tj2ilMCWOf7iis9IOpKp19QOrrkT2XrA16cNyBjax8EABmOZK7AZz5C9zpTcRR9eCq6NOuspIN2ka5dfCHsQtnSVOvUdJIFePAtWkpHd0jqCqVf4czYDogB0v4u9qpqKzErfH5Kvj6jacNBj6WkdPg1I/Xq4yz/bDLnpnF05xYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Nx2xr6rt; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Nx2xr6rt"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JKrSlX1856988;
	Thu, 19 Mar 2026 23:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=3F
	zEbD17Zx3w46g9Bpji7121w1zcUR1gHsg0EX+IZIc=; b=Nx2xr6rtJMwDyhKU/Y
	pZBB08BvXRpv4Pjee8vdqQ66LjZWvOM/pLwzsOSBhHbo/TVBm40eQ5kk87BThmD4
	EwqO+D+cvp+t/5mvLjR51U1HeEknfTFO40wsC7w+OFacyvj9E6bqGjsiRDBFetwx
	YN2hCkGIKuW3WYtx/v3X0gbFu1fUfAs3bcJClS+iAnZYmogzX8ScfK6oPt+9j+uz
	80hCZsCthtNYPYBnAVKgiRafHPEns1AWHRcuQ8IQj/mQRRyLgpFlU5irmIqV07Z8
	Xnob8l0at6jefQvFNbUn5SP9MwaHZQ+bHRW41aHskPINjbUG2F7NwvuaNSnN2869
	TOsw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d0rk11hmj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 23:51:42 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 62A98D272;
	Thu, 19 Mar 2026 23:51:41 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Mar 2026 11:51:39 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 19 Mar 2026 11:51:39 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 23:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbKnJ6scu0637XTKEVIP4oJF1lQwIyhNRCq+Gj1IV6NkULU8jTeApEboasI8/1KPd2Fxnv0OyO8aA4cVIZm7zC/go3uUvHuqhhdt2FktXyD8WrkezYfgmek2JosyJF9g3NoZWrNAzV7codWhlsLi3xk2sXJV2ZFo4oJpWkuy+8L87wjZ+8YtuZLtm1ZxULqlQ/w9rXCx1Hf9CPxbINsJBTtr3fKvvNqNxScAOHkOWIl13q2QHxUFjrqUReu8J2W4TOfjyKMZ6elbDY8Gz7kTXQCwF3aAWcgmTePJzB8BfH+9nr8c4ROjn00VFzQzXLBc2r3Agl21toQhuwl6SO1Nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FzEbD17Zx3w46g9Bpji7121w1zcUR1gHsg0EX+IZIc=;
 b=Sl1pq53dxDayLKpJwj/CWX6pbDbeKRmJ5jO23/779hOv5JEmomWwb/ofYhMzcK+EnA8JB5Q7mLmH8/xj6HDu6Q7ldSaRES/UaJPu10h0UyVehUGYyHvUtnzXOVb1FdiExXH5v1JF97qNGO8O5Mzf+TNz5jwNpMa3qAy+jTWKeSzhFx9OJN6VBoRk+2UqlF+Zy7lKTF1OWpt7Ef92PptP6QrPUgMQ1mM7MvRvvpej2ULcYMZTnouBlzLhEgs0ZkR1VbnoeIrZAr1+gRA/LdUrSrDF4Ou/jonG6DiuvGmCtGxxlv4F+Gqm5cf4pu4DSm+JpRDTsDBOH9hlfNm5pi0etw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS7PR84MB3085.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 23:51:34 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 23:51:34 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 3/3] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Thread-Topic: [PATCH v4 3/3] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Thread-Index: AQHct/tRTFU6eQdWTkekbhGPzitG6Q==
Date: Thu, 19 Mar 2026 23:51:34 +0000
Message-ID: <20260319234945.151487-4-sanman.pradhan@hpe.com>
References: <20260319234945.151487-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260319234945.151487-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS7PR84MB3085:EE_
x-ms-office365-filtering-correlation-id: ef31f928-a881-4c50-f338-08de861273c4
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 20wLwHKe11RnSgBMT9b0tpWQ4S/pn5A1V3HW3TpiFNoEuja01mB0rT0+ZtWaJM2Q069jf1r1qayOAMQa3S1YTfTP2KqCJKGgoQF6G8pmumYenTZldrfcoiHvB6kYaQic/xLvgel08L/RameJwXl9fEKv3Hlb//ozH6QbHNJ0Xo8NBu1Cepuj46pnNTrC0B2ZIkdie/c2mzLs964fBcwBe4B5DWjMQC26aUHi4AcdUGb+XV+ZKt9a+L6K/gjD2kYfeGXidYuYDT7JBc7B4gmQgnjTV8cYbad7P3tV0JeGQE7LNtVIUcLlFvPy0941aRdnHpZ3QaFdr8ZGCevkrr9KghY0mKXvJYvP18B3SjZyEYjtbo3+1cdAGhT5sSIDxfHTvgbk5h1JY+6K78f2ayZ6LHNvvo/RDhUTugEPMgpeuRuXGpxrVwbSntLP1vQFqgDpLLXSwhuUDfx+DeeJjBXI3ZyTUipF4fdAE3LvpUZphIc3t82W3bTeUpDXkwyi29ereDf3kbUWX/vr2VqB3GuthDr1jyOr3cxfGLKYVqRqSWZqhFZVzb1KxBzN6329wzV0z04P/fCP70hqaVMWdIkkImVJqh+gMMZ+jiQMGkPXVHWojjqXVbbRUxTLK0fNomlfEHuH1bNBQM7aIII3l5GsIMso2tX071CLVzhobRN4Xqr6NRFa6sE5fnNMcwIVf3w/V5JfG4BYfQzfaXSNJ0/SNjaWehIKdxsM2wMMbT9EKBxD4UuXP+cfWb3bJ86kD2aZ4COmPSG/OvJt6yb7G9m8AZ7S1DYOii//rMyrmX/XnJg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iVUGO03nW7MFcDJAx/Zam9qaVXVrVatgJVsK6s5kTGW5C+dvioFyUkD9o4?=
 =?iso-8859-1?Q?ZTVHl5IgIL3GJyKd23McZDEPctPRRE5ds4kWg1ZriLnE7nG2NCEvZTDrjs?=
 =?iso-8859-1?Q?gie2L4ItwnV/R9hUAv0Ua6y2jQeRN1S8HjZ1I4LfnpLkp6epxFQroDzldF?=
 =?iso-8859-1?Q?3MNet9LVyRxOGcPSgpd5V2JSjitgoI6u7+vYeSod087wh9sJGWWOlStWYf?=
 =?iso-8859-1?Q?upHwJiz/Wg1zGqvF9JK6g67TlM2pnX5bFk95bPX2Hi6lY+UGP7kmKnQ2KT?=
 =?iso-8859-1?Q?X6pVCyl23mSuqKc3Xsi+SsjOuAE/F2Dhu9YYegYJDRGwXT7Up/BbdK4stz?=
 =?iso-8859-1?Q?JuleBIQiiRVobXZt0LHmZCPE1fw7GLsQ67FhVqcf3IJ/x1aHUBqu/v36Ma?=
 =?iso-8859-1?Q?Doj6Ghb+9gTG0WPklA6ilj70Ilqq/YjkPxvhL60Wc/7Fo/qbQElwj1a95I?=
 =?iso-8859-1?Q?HjsC+RgPM4VJYR5jbnwGycAPcRxGXg0b6LWDjDOFY6NKzc1l+0DWRBrOv3?=
 =?iso-8859-1?Q?YN+8HPq9L6V/hMGK0T/lSdGHjN81bEn0zqJp1WHZ1kvx+q4wt7GXGKqr8h?=
 =?iso-8859-1?Q?bFnVMV3h02RROT1vusAb/cj43m+W2idFu/MOnrR6UDeodhvR5ni9L+HVWX?=
 =?iso-8859-1?Q?KFnCKjfUpLA9tCZ7rKz+SI6eeQ9OF5LPxLaiAlGAsxEEbpQvcSABf/GbT5?=
 =?iso-8859-1?Q?fPlN+Bhzr0UMziLYnoninVGBspvQcR3l5T0OGI3IZUg02zUV+crq00sE03?=
 =?iso-8859-1?Q?9xcvAU/mAoPEDP+pa5q+KpgNxncRzcAgaoRj4UZaQbnhQMzIodMNk2wa2X?=
 =?iso-8859-1?Q?6VjVl+MENjtUPVwcHzTo1TetutTP2dNVLxsnbsz0S5tm3ati728/FjHQU7?=
 =?iso-8859-1?Q?EQwWAouCwTH0edAhZbxIKlXV6GyuGiz7uKRWSseWGoJ7rExMYbE3VRAvMT?=
 =?iso-8859-1?Q?8hO1nbcTMK1k60xj2Fvuqj/v20LSOno9gs45wxyUQFuG/sW9EVfVEPpuKV?=
 =?iso-8859-1?Q?XHdo3dhQFB8K6DquWH+r0Vk4s0DAypCr75Lc3bVefSQTz0aapnrM0D3gGv?=
 =?iso-8859-1?Q?g2U7Ay6Uy/3Kibq16L8YUxiYm8HV5zQ7ur9s3qNgEh0kSTpM5wp4McCjXG?=
 =?iso-8859-1?Q?Y50K9wuyyHtI1XrHmnAjUY1YfvJagVgf/z33mIWYQSbcZRWoqBV9UWB6K1?=
 =?iso-8859-1?Q?/5UOYc49zo5NrfimY5+IQPrrPxGpkuPlXDhO74bKyMZcK9MQhEDaVR0/H2?=
 =?iso-8859-1?Q?Yvo8l2YnETv393ncmKc3mrZMOjodLyDN3jg5xeBeMI/L4tQoNTjh5aWZSy?=
 =?iso-8859-1?Q?r9BEkWbDCQl3yOm2uq2IdkbpgG0hgVEhXkuLk8/0CCR0/ARb1r+oKbWkxn?=
 =?iso-8859-1?Q?LgMNHd4bYx7XNanXpEWAZpgNU4ldrBO7LjjkWaKxV7zvM3FyzbUAHRcfPz?=
 =?iso-8859-1?Q?S30ImHPjZQnKAC8oj9agxUoM1THQxJKLlsn5ttA4EKc+DFg/hvuijyg2MX?=
 =?iso-8859-1?Q?CfeY9k5s1lSXAT1Y4iSSXcb8wKk4oIQpTnr2Im0zAeJFIIeSp4cDLdI8p2?=
 =?iso-8859-1?Q?L/t07Ay/ti4Wd2aH2G5Ru2D+dl1FM9rA6SeNz4A7mxMMTSXNC2eFgGePyp?=
 =?iso-8859-1?Q?NLyI8GrBSTG+Bf1/DwfBB6ifEdPLm2isjhpMbjnA7L0qt0SYJ0grmg/E2p?=
 =?iso-8859-1?Q?LWDsZyMNScKENjOx8UeLSMgwMfRZjBG0a/PcnOsZ1pLrXVIdxyYKkTn81H?=
 =?iso-8859-1?Q?EBbPyTtTVkCmOUI6NS+2d/Nu5w9ZgfvxWiAFVndQBqqQemM0QcFvq6VEmC?=
 =?iso-8859-1?Q?vjPFjzVKxA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Wp/zFLATuNx9oOeAnKCuOkPry5tU88I6D8399gyq7/i5wRu5l1YSqtPN+LVRyi/DiClEL1O6tQKTk9fe+YTsEKGVwOUL3pP5goW4VN04zsnanIlt1DRF41/rbdjffmKa0MyxJ2YXLg+5kC1ljqWFo6hNBSGYQnQqsAaqmCd5qJE66MsENS8DKlmZtIlWB5Sh4Uyfw0BcaF+tpq2rfiBon7bA3wxP7D+hQ2QqFJOEsK42dzNhy+iU508oSywO+DsYrF1pmVwW351xq0uOUy6VyeB5mkttEBkAc/rWnQRsrmR8OzDHd+GsGR8m1HW4Hu71Q7rn/jpy1pDBvV3AROv+YA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef31f928-a881-4c50-f338-08de861273c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:51:34.2729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qmgmWItJNQvJ8smsc/Hwa7zqxivDOtEgwzoRZ7bWplVrQVecGa3TqV/Ovz6P+kN5nJnyfUsYOqsT6QMa3DMlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR84MB3085
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: PlrGs33QT03UHK3zLxN7Mx_-DL5sfMh5
X-Authority-Analysis: v=2.4 cv=S5fUAYsP c=1 sm=1 tr=0 ts=69bc8c0e cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ZSrvDirOKP4VPF05hnFf:22
 a=OUXY8nFuAAAA:8 a=1dJJvSGK75pZe7GnG3sA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: PlrGs33QT03UHK3zLxN7Mx_-DL5sfMh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE5MiBTYWx0ZWRfX1eKfvDkrBMOJ
 2b8t0lG4Pis88Ubm5YFC7aTCMnNiVdiYA5HUqYJGymdwLIn/pfqE8knfsfLt8dyoRYl8bMpAHuV
 iQr5CA0i7RY5ae6VSDQim3P4GWt6u+SpvLQoSoyN9SymoH1dxMW8M6+qPbmlyztBLFD5kS5THoG
 IrBnTkq+cQZ3jjeimvIPini6LSXJGvBGXRos0igTIeGMM6ikvqBrvxh09eMH2WYZGUv58wiP0bP
 xOrnyXGBSy+v2xs7P2V9kYYUNmPB9sfLPzyiZWBx2jyipC5LyJibtMyKL4NpLhTKyjYvf33Rov5
 cbeY9FdDG0c6b98+x4HxxxMYOZnXwfF3m0rVfzDPncqCj9np0HxSNh4WvKmHGPkJbhFEfxoIjDU
 3x+0q9WWGrQjEtG/ql1AMnQSUmeuETrqGz8RAqb8MLQxHDscNeCmK8NM+x8aKnZ7tAUoM6bIa7/
 Gf+bebobbJjX3NbuUrw==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190192

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The MAX31785 fan controller occasionally NACKs master transactions if=0A=
accesses are too tightly spaced. To avoid this, the driver currently=0A=
enforces a 250us inter-access delay with a private timestamp and wrapper=0A=
functions around both raw SMBus accesses and PMBus helper paths.=0A=
=0A=
Simplify the driver by using pmbus_driver_info.access_delay for normal=0A=
PMBus-mediated accesses instead, and remove the driver-local PMBus=0A=
read/write wrappers.=0A=
=0A=
Keep local delay handling for raw SMBus accesses used before=0A=
pmbus_do_probe(). For the raw i2c_transfer() long-read path, which=0A=
bypasses PMBus core timing, use pmbus_wait() and pmbus_update_ts() so=0A=
the PMBus core also tracks the raw transfer timing. Update the PMBus=0A=
core timestamp before checking the transfer result so failed transfers=0A=
do not skip the required delay before the next PMBus access.=0A=
=0A=
Also update max31785_read_byte_data() so PMBUS_FAN_CONFIG_12 accesses=0A=
are only remapped for virtual pages, allowing physical-page accesses to=0A=
fall back to the PMBus core. With that change, use pmbus_update_fan()=0A=
for fan configuration updates.=0A=
=0A=
Finally, use the delayed raw read helper for MFR_REVISION during probe,=0A=
rename the local variable "virtual" to "vpage", drop the unused=0A=
to_max31785_data() macro, and add an explicit delay before=0A=
pmbus_do_probe() so the first PMBus core access is properly spaced from=0A=
the last pre-probe raw access.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v4:=0A=
- Standardized on the Juniper email address to resolve the =0A=
  From/SOB mismatch.=0A=
=0A=
v3:=0A=
- Added an explicit max31785_wait() before pmbus_do_probe() to ensure=0A=
  proper timing spacing during the handover to the PMBus core.=0A=
=0A=
v2:=0A=
- Replaced local usleep_range() with core pmbus_wait() and pmbus_update_ts(=
)=0A=
  in the raw long-read path.=0A=
- Updated read_byte_data() to allow core fallback for physical pages.=0A=
---=0A=
 drivers/hwmon/pmbus/max31785.c | 191 +++++++++++----------------------=0A=
 1 file changed, 60 insertions(+), 131 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.=
c=0A=
index 50073fe0c5e88..260aa8fb50f13 100644=0A=
--- a/drivers/hwmon/pmbus/max31785.c=0A=
+++ b/drivers/hwmon/pmbus/max31785.c=0A=
@@ -31,8 +31,6 @@ struct max31785_data {=0A=
 	struct pmbus_driver_info info;=0A=
 };=0A=
 =0A=
-#define to_max31785_data(x)  container_of(x, struct max31785_data, info)=
=0A=
-=0A=
 /*=0A=
  * MAX31785 Driver Workaround=0A=
  *=0A=
@@ -40,9 +38,8 @@ struct max31785_data {=0A=
  * These issues are not indicated by the device itself, except for occasio=
nal=0A=
  * NACK responses during master transactions. No error bits are set in STA=
TUS_BYTE.=0A=
  *=0A=
- * To address this, we introduce a delay of 250us between consecutive acce=
sses=0A=
- * to the fan controller. This delay helps mitigate communication problems=
 by=0A=
- * allowing sufficient time between accesses.=0A=
+ * Keep minimal local delay handling for raw pre-probe SMBus accesses.=0A=
+ * Normal PMBus-mediated accesses use pmbus_driver_info.access_delay inste=
ad.=0A=
  */=0A=
 static inline void max31785_wait(const struct max31785_data *data)=0A=
 {=0A=
@@ -54,89 +51,40 @@ static inline void max31785_wait(const struct max31785_=
data *data)=0A=
 }=0A=
 =0A=
 static int max31785_i2c_write_byte_data(struct i2c_client *client,=0A=
-					struct max31785_data *driver_data,=0A=
-					int command, u8 data)=0A=
+					struct max31785_data *data,=0A=
+					int command, u8 value)=0A=
 {=0A=
 	int rc;=0A=
 =0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D i2c_smbus_write_byte_data(client, command, data);=0A=
-	driver_data->access =3D ktime_get();=0A=
+	max31785_wait(data);=0A=
+	rc =3D i2c_smbus_write_byte_data(client, command, value);=0A=
+	data->access =3D ktime_get();=0A=
 	return rc;=0A=
 }=0A=
 =0A=
 static int max31785_i2c_read_word_data(struct i2c_client *client,=0A=
-				       struct max31785_data *driver_data,=0A=
+				       struct max31785_data *data,=0A=
 				       int command)=0A=
 {=0A=
 	int rc;=0A=
 =0A=
-	max31785_wait(driver_data);=0A=
+	max31785_wait(data);=0A=
 	rc =3D i2c_smbus_read_word_data(client, command);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_read_byte_data(struct i2c_client *client,=0A=
-				    struct max31785_data *driver_data,=0A=
-				    int page, int command)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_read_byte_data(client, page, command);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_write_byte_data(struct i2c_client *client,=0A=
-				     struct max31785_data *driver_data,=0A=
-				     int page, int command, u16 data)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_write_byte_data(client, page, command, data);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_read_word_data(struct i2c_client *client,=0A=
-				    struct max31785_data *driver_data,=0A=
-				    int page, int phase, int command)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_read_word_data(client, page, phase, command);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_write_word_data(struct i2c_client *client,=0A=
-				     struct max31785_data *driver_data,=0A=
-				     int page, int command, u16 data)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_write_word_data(client, page, command, data);=0A=
-	driver_data->access =3D ktime_get();=0A=
+	data->access =3D ktime_get();=0A=
 	return rc;=0A=
 }=0A=
 =0A=
 static int max31785_read_byte_data(struct i2c_client *client, int page, in=
t reg)=0A=
 {=0A=
-	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);=
=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
-=0A=
 	switch (reg) {=0A=
 	case PMBUS_VOUT_MODE:=0A=
 		return -ENOTSUPP;=0A=
 	case PMBUS_FAN_CONFIG_12:=0A=
-		return _max31785_read_byte_data(client, driver_data,=0A=
-						page - MAX31785_NR_PAGES,=0A=
-						reg);=0A=
+		if (page < MAX31785_NR_PAGES)=0A=
+			return -ENODATA;=0A=
+		return pmbus_read_byte_data(client,=0A=
+					    page - MAX31785_NR_PAGES,=0A=
+					    reg);=0A=
 	}=0A=
 =0A=
 	return -ENODATA;=0A=
@@ -178,7 +126,21 @@ static int max31785_read_long_data(struct i2c_client *=
client, int page,=0A=
 	if (rc < 0)=0A=
 		return rc;=0A=
 =0A=
+	/*=0A=
+	 * Ensure the raw transfer is properly spaced from the=0A=
+	 * preceding PMBus transaction.=0A=
+	 */=0A=
+	pmbus_wait(client);=0A=
+=0A=
 	rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));=0A=
+=0A=
+	/*=0A=
+	 * Update PMBus core timing state for the raw transfer, even on error.=0A=
+	 * Pass 0 as the operation mask since this is a raw read, intentionally=
=0A=
+	 * neither PMBUS_OP_WRITE nor PMBUS_OP_PAGE_CHANGE.=0A=
+	 */=0A=
+	pmbus_update_ts(client, 0);=0A=
+=0A=
 	if (rc < 0)=0A=
 		return rc;=0A=
 =0A=
@@ -203,19 +165,16 @@ static int max31785_get_pwm(struct i2c_client *client=
, int page)=0A=
 	return rv;=0A=
 }=0A=
 =0A=
-static int max31785_get_pwm_mode(struct i2c_client *client,=0A=
-				 struct max31785_data *driver_data, int page)=0A=
+static int max31785_get_pwm_mode(struct i2c_client *client, int page)=0A=
 {=0A=
 	int config;=0A=
 	int command;=0A=
 =0A=
-	config =3D _max31785_read_byte_data(client, driver_data, page,=0A=
-					  PMBUS_FAN_CONFIG_12);=0A=
+	config =3D pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);=0A=
 	if (config < 0)=0A=
 		return config;=0A=
 =0A=
-	command =3D _max31785_read_word_data(client, driver_data, page, 0xff,=0A=
-					   PMBUS_FAN_COMMAND_1);=0A=
+	command =3D pmbus_read_word_data(client, page, 0xff, PMBUS_FAN_COMMAND_1)=
;=0A=
 	if (command < 0)=0A=
 		return command;=0A=
 =0A=
@@ -233,8 +192,6 @@ static int max31785_get_pwm_mode(struct i2c_client *cli=
ent,=0A=
 static int max31785_read_word_data(struct i2c_client *client, int page,=0A=
 				   int phase, int reg)=0A=
 {=0A=
-	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);=
=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
 	u32 val;=0A=
 	int rv;=0A=
 =0A=
@@ -263,7 +220,7 @@ static int max31785_read_word_data(struct i2c_client *c=
lient, int page,=0A=
 		rv =3D max31785_get_pwm(client, page);=0A=
 		break;=0A=
 	case PMBUS_VIRT_PWM_ENABLE_1:=0A=
-		rv =3D max31785_get_pwm_mode(client, driver_data, page);=0A=
+		rv =3D max31785_get_pwm_mode(client, page);=0A=
 		break;=0A=
 	default:=0A=
 		rv =3D -ENODATA;=0A=
@@ -294,35 +251,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)=
=0A=
 	return (sensor_val * 100) / 255;=0A=
 }=0A=
 =0A=
-static int max31785_update_fan(struct i2c_client *client,=0A=
-			       struct max31785_data *driver_data, int page,=0A=
-			       u8 config, u8 mask, u16 command)=0A=
-{=0A=
-	int from, rv;=0A=
-	u8 to;=0A=
-=0A=
-	from =3D _max31785_read_byte_data(client, driver_data, page,=0A=
-					PMBUS_FAN_CONFIG_12);=0A=
-	if (from < 0)=0A=
-		return from;=0A=
-=0A=
-	to =3D (from & ~mask) | (config & mask);=0A=
-=0A=
-	if (to !=3D from) {=0A=
-		rv =3D _max31785_write_byte_data(client, driver_data, page,=0A=
-					       PMBUS_FAN_CONFIG_12, to);=0A=
-		if (rv < 0)=0A=
-			return rv;=0A=
-	}=0A=
-=0A=
-	rv =3D _max31785_write_word_data(client, driver_data, page,=0A=
-				       PMBUS_FAN_COMMAND_1, command);=0A=
-=0A=
-	return rv;=0A=
-}=0A=
-=0A=
-static int max31785_pwm_enable(struct i2c_client *client,=0A=
-			       struct max31785_data *driver_data, int page,=0A=
+static int max31785_pwm_enable(struct i2c_client *client, int page,=0A=
 			       u16 word)=0A=
 {=0A=
 	int config =3D 0;=0A=
@@ -351,23 +280,20 @@ static int max31785_pwm_enable(struct i2c_client *cli=
ent,=0A=
 		return -EINVAL;=0A=
 	}=0A=
 =0A=
-	return max31785_update_fan(client, driver_data, page, config,=0A=
-				   PB_FAN_1_RPM, rate);=0A=
+	return pmbus_update_fan(client, page, 0, config,=0A=
+			       PB_FAN_1_RPM, rate);=0A=
 }=0A=
 =0A=
 static int max31785_write_word_data(struct i2c_client *client, int page,=
=0A=
 				    int reg, u16 word)=0A=
 {=0A=
-	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);=
=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
-=0A=
 	switch (reg) {=0A=
 	case PMBUS_VIRT_PWM_1:=0A=
-		return max31785_update_fan(client, driver_data, page, 0,=0A=
-					   PB_FAN_1_RPM,=0A=
-					   max31785_scale_pwm(word));=0A=
+		return pmbus_update_fan(client, page, 0, 0,=0A=
+				       PB_FAN_1_RPM,=0A=
+				       max31785_scale_pwm(word));=0A=
 	case PMBUS_VIRT_PWM_ENABLE_1:=0A=
-		return max31785_pwm_enable(client, driver_data, page, word);=0A=
+		return max31785_pwm_enable(client, page, word);=0A=
 	default:=0A=
 		break;=0A=
 	}=0A=
@@ -391,6 +317,7 @@ static const struct pmbus_driver_info max31785_info =3D=
 {=0A=
 	.read_byte_data =3D max31785_read_byte_data,=0A=
 	.read_word_data =3D max31785_read_word_data,=0A=
 	.write_byte =3D max31785_write_byte,=0A=
+	.access_delay =3D MAX31785_WAIT_DELAY_US,=0A=
 =0A=
 	/* RPM */=0A=
 	.format[PSC_FAN] =3D direct,=0A=
@@ -438,29 +365,29 @@ static const struct pmbus_driver_info max31785_info =
=3D {=0A=
 };=0A=
 =0A=
 static int max31785_configure_dual_tach(struct i2c_client *client,=0A=
-					struct pmbus_driver_info *info)=0A=
+					struct max31785_data *data)=0A=
 {=0A=
+	struct pmbus_driver_info *info =3D &data->info;=0A=
 	int ret;=0A=
 	int i;=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
 =0A=
 	for (i =3D 0; i < MAX31785_NR_FAN_PAGES; i++) {=0A=
-		ret =3D max31785_i2c_write_byte_data(client, driver_data,=0A=
+		ret =3D max31785_i2c_write_byte_data(client, data,=0A=
 						   PMBUS_PAGE, i);=0A=
 		if (ret < 0)=0A=
 			return ret;=0A=
 =0A=
-		ret =3D max31785_i2c_read_word_data(client, driver_data,=0A=
+		ret =3D max31785_i2c_read_word_data(client, data,=0A=
 						  MFR_FAN_CONFIG);=0A=
 		if (ret < 0)=0A=
 			return ret;=0A=
 =0A=
 		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {=0A=
-			int virtual =3D MAX31785_NR_PAGES + i;=0A=
+			int vpage =3D MAX31785_NR_PAGES + i;=0A=
 =0A=
-			info->pages =3D virtual + 1;=0A=
-			info->func[virtual] |=3D PMBUS_HAVE_FAN12;=0A=
-			info->func[virtual] |=3D PMBUS_PAGE_VIRTUAL;=0A=
+			info->pages =3D vpage + 1;=0A=
+			info->func[vpage] |=3D PMBUS_HAVE_FAN12;=0A=
+			info->func[vpage] |=3D PMBUS_PAGE_VIRTUAL;=0A=
 		}=0A=
 	}=0A=
 =0A=
@@ -471,7 +398,7 @@ static int max31785_probe(struct i2c_client *client)=0A=
 {=0A=
 	struct device *dev =3D &client->dev;=0A=
 	struct pmbus_driver_info *info;=0A=
-	struct max31785_data *driver_data;=0A=
+	struct max31785_data *data;=0A=
 	bool dual_tach =3D false;=0A=
 	int ret;=0A=
 =0A=
@@ -480,20 +407,20 @@ static int max31785_probe(struct i2c_client *client)=
=0A=
 				     I2C_FUNC_SMBUS_WORD_DATA))=0A=
 		return -ENODEV;=0A=
 =0A=
-	driver_data =3D devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNE=
L);=0A=
-	if (!driver_data)=0A=
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);=0A=
+	if (!data)=0A=
 		return -ENOMEM;=0A=
 =0A=
-	info =3D &driver_data->info;=0A=
-	driver_data->access =3D ktime_get();=0A=
+	data->access =3D ktime_get();=0A=
+	info =3D &data->info;=0A=
 	*info =3D max31785_info;=0A=
 =0A=
-	ret =3D max31785_i2c_write_byte_data(client, driver_data,=0A=
-					   PMBUS_PAGE, 255);=0A=
+	ret =3D max31785_i2c_write_byte_data(client, data,=0A=
+					   PMBUS_PAGE, 0xff);=0A=
 	if (ret < 0)=0A=
 		return ret;=0A=
 =0A=
-	ret =3D i2c_smbus_read_word_data(client, MFR_REVISION);=0A=
+	ret =3D max31785_i2c_read_word_data(client, data, MFR_REVISION);=0A=
 	if (ret < 0)=0A=
 		return ret;=0A=
 =0A=
@@ -509,11 +436,13 @@ static int max31785_probe(struct i2c_client *client)=
=0A=
 	}=0A=
 =0A=
 	if (dual_tach) {=0A=
-		ret =3D max31785_configure_dual_tach(client, info);=0A=
+		ret =3D max31785_configure_dual_tach(client, data);=0A=
 		if (ret < 0)=0A=
 			return ret;=0A=
 	}=0A=
 =0A=
+	max31785_wait(data);=0A=
+=0A=
 	return pmbus_do_probe(client, info);=0A=
 }=0A=
 =0A=
-- =0A=
2.34.1=
