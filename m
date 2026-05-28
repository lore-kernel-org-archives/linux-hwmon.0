Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53225409638;
	Thu, 28 May 2026 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989718; cv=fail; b=mDJlQxnQJfEkk/83dJVDhW1ahDaXjvHBIgBa+/qkB7pkoAdGqkky/k0dMJjJU562J9ssLKEwlJ00kdhMPOzeafb71+Q8ZHZVZC8ffX+6dHhD34r7OLtPogb97UynowQdmuCSteNYNdnsUN2de2stTLj16LAuCK5e/jRStV9LHCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989718; c=relaxed/simple;
	bh=DhjEByRlV7LanuPMEbaHIQstkq0rS5Uu3+Z5iQuFPOg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CAmULKEFLZJSYDu8iJ5I8Cfs3KqWWhzV5CGJOs4NI4dHQGbJbRyBQ9sI15MiEK0RfKAUDHJZyYnn3LdZtM46MJ9T7u3iq5PySBl7rY5Akfkzu8q8phCewMe+0tPYql9YekhN7kcBBQf9B55mBchGEl36KOLEtZXdU6uv+cfY7tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=lb+a8xqX; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="lb+a8xqX"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SG3u6H2696297;
	Thu, 28 May 2026 17:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=uMfVx1zuvG2gyBcSo4tOQjfr
	q+dwUFIu7ehIzLYowp4=; b=lb+a8xqXTJRNq0e5eNP7jbtLZbePY0WOIvc1SMRB
	Qr54Y21uX7NordEmlVZrRGrGRP9nwd+5fLlL6A/GzTuhfO0B7WkTY96NDwBDV5M5
	I3x81pbBZWt79ICYBOGj04CoaGqys3WWwFppx5wIyK23ccrPxXKiDHOPjrqoNUy+
	uEtZD4Lt7VJ47QrDTz/R3TLnVR4qouzRYlrBuLPUkoSfRYnsTIDAyChxuiAb5PcL
	6WDGFBpfLvUedRlAi01sSBWqtyoq7PWC43sE39pADs0BvOQ0B1LveKuAlVw9DzRp
	pHJCBoPchcsDncFC833ZYiwlh+pN7GAhEUWcH978ZzVPfA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eerwa99kd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 17:34:58 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id C4EDC13157;
	Thu, 28 May 2026 17:34:57 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 05:34:34 -1200
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 05:34:33 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 05:34:33 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 17:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4DZGqv6qMCkdU7eEPkRbl2wyNV1zFzpMjn/2n6FScPqcSpj37givTf/QA0SxmteaRBDyr+bHjtP7XsKyX9dzXoAGpzrkKZkXNFNHoGr+R5P78hALafJvgO4nro+wc/slpqbQg6xfehdxWLb6HNe2rngk0l4LO8DwHJPD1b/KEHtcj2/xNya84Jx0npRxG+uIo5QFDoMeJdlPkLy8fARoGfITt7uuylcH0c1/a+pzS8BG3yaJO+rcWunldWx2cWIGILW5cRv6tIZfny9pFXW/SlDgPqJqv5mI3oZr77TQ31mIHp2z8p5lK8Z0A+hadk0MvvzHz0DvUkmesfr+vLpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMfVx1zuvG2gyBcSo4tOQjfrq+dwUFIu7ehIzLYowp4=;
 b=kt38QVPgj56DAeEm6VMC79yUuEGqDh0r8gCfBSez9a3HI5fcUZ5xIr1IwxGo0s+sJOF0MBTQBaSi89XQEShLelIwrV5SCEGW+ZTiyV8eUZQrbliYVCbCTt5yqC+YOB2Iw5MZI0VhG/wCp7c3uVfkI477vplYW9XH0byvbYjnksiRgM+y3GEPnV5ooK/pPr2xiMzJP+cA1NoJMarb7fyptCG35DDNbvW/W6nT02P3yPO1p18qxOeUSdPCQ0oIdTZ2O7a6cIC5cS+2eldWb2F/T9JsAQhAY3hMzTutKzZtZPt+WSlAOvYZuxewQurkXHGwKJnnL2HwIIFN7pEWH/UZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS0PR84MB3745.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 17:34:31 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:34:31 +0000
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
Subject: [PATCH v2 0/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH v2 0/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7sg+X8ApuzzIe06wFGSHXXViBg==
Date: Thu, 28 May 2026 17:34:31 +0000
Message-ID: <20260528173424.87503-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS0PR84MB3745:EE_
x-ms-office365-filtering-correlation-id: 6906a5bd-68b2-4c81-331a-08debcdf609a
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|3023799007|56012099006|18002099003;
x-microsoft-antispam-message-info: f+aM1RBYf6d0JMEAADIsDgX61Jc+zuRSJ1nLfZcpOKGXnhEai/w4k/keJi7UszndW7XqwlvSFA3pV2M3mleU4sm2NEleQ3TPP4/oG1EWGXkqG+Y+HnTWKeZBydecNrZedJyvP/zCswF+pHcwrqNgEPSZKS3wXPN1kGPvIlcAYGHBG7u7qhw7Lm0oTe4ies/eG9ii6QX4v9fqw2qGhWiwRC7ZPs5khCCM3gmUN9eshULsvhOlrMKSem42KsuhIDxzMkWbu3UsPNGoJal0+JpZfueHKutGwGaM8rmGxscX89RqQ6fFH7l5lLq5Gz4wEGUYh76G9Zi9vpvLmc9cQWe2q+qyeusfRjmqChftPTiY/gDONETyoolRvi/GPIK8z9mQYHwtsyeEHZSLtKlv7JNAcbKvnI6OEMz4ALR6r8iAXC/tcWP4gnh6hDRZzM14ER+b2m68IzF17+qQOwlJyaT8mjU5E8hYLnXN7q7Il2ion8uLTgLy1XLgwLAIquXEAGgaRNzz1Z08XMGKjdYe+0wwbnrRaIVK3xMOl1DGY5PHd9XeKfiKPFkqf1EQtEfGwCVKXWRkfbUCaDfDOHmRxJNOzIn/lGxWzyIMlJw61aUWCOkqCEKFP6UTOveUH8/NdiAfA1v41cQ1JrsSRTXsTT14DiBs3jjFiGa01+Tyzmr2M4r90pVjUY+2LjgW5fxxbE61eAd0plnWNa/rFhbEm8IFy1T/RxsrLCh3V+fZF+EqD8+POSlaRr4WL4IdFinewoIZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ff7Xl8BIHa2byZd5tx4hPff2yivTFmrsMbFUswFSiOzDat2jRvFW51Nj5u?=
 =?iso-8859-1?Q?PXeHNHUPyLAWQxeBU5Sgh/RkQ8jDrXtUsC8U9gY4k6KobcNYi/IqSmIOAw?=
 =?iso-8859-1?Q?miWU7oYikHuyaAxohWhKGJwke++vPDsqYmKfRsY0fGjRZqmr9SikutWCdz?=
 =?iso-8859-1?Q?jP61t/gSBkq+NeaiAsEsKinnOPl/pTPzuxVQnp6WZNsh2zaUejv+MIEkHi?=
 =?iso-8859-1?Q?ghfhflvDIwIRWrwrpc/BqS37hu4gwJzZMfN4fKpIDfT9GVdinoFPLAxokv?=
 =?iso-8859-1?Q?bQHauOQ9ed5crC64VIhca+jCJhdhliYSbL5cEMdN1KIctCX3r0Av0eUIsV?=
 =?iso-8859-1?Q?01YvxuzvkWojDiGb/KaLgXnmJS/K7GFARfVpx7E31J49ZE8ZV5qdrBC0gR?=
 =?iso-8859-1?Q?st1HE4lcmFBrv+ChdoNvnLjKPgLUcsiSJM+MYsdOr8GE1/OI07vxM3cnBP?=
 =?iso-8859-1?Q?/wjLEx+ZVOXCOsC5BJZiwrr+eqtTk2ZQCkBW3pcQlLayjHKKhwRmxtvqF/?=
 =?iso-8859-1?Q?a0weaVvII7tDpv1W8j0m8sOOiCrFGh4UDgYxvz3EKGSR2rolspsNK5runP?=
 =?iso-8859-1?Q?SuVsaooIEUM+7/WYW5ZR6WMsgyybaznUwZTSiM02UqoXYBUAWoeMkFIkCR?=
 =?iso-8859-1?Q?j0B7iYQJTBqPlGOHpEiTtPNlQZObzYs5baNryF36GXOMZdISiqf9LlmIE4?=
 =?iso-8859-1?Q?JUf+FnzYsnIP12YdHnkIOUgmbnH7XGdpIgitxxIr16qZixri0cwIGTr1Q/?=
 =?iso-8859-1?Q?nvX5IxCLU5+ZHu/01wH0w74umNFnDm482Vj4HE+UBMwic4QWP0czqsGq37?=
 =?iso-8859-1?Q?kHceek+oeUGvV9pk2t4aSV/TvqnGh9gWlW+zMDONLH+dxJic9a1GdSFNVL?=
 =?iso-8859-1?Q?nz0FyYA/rnFkd8Qsf3aHrxluaqmWMqukyo7KvGJ8jHFra0Z9wmAbv8usfz?=
 =?iso-8859-1?Q?BgheJIKaz9Sd+B4W2UQkK2SjGX6wwIKEsc/T5ENtRHh3xlJW8u/VkVZ77Y?=
 =?iso-8859-1?Q?tJ5Igl7VNG+m5QkzzOguAxHVyEdZl6cE7VqAJ1Ktxt8SUqrqL0lXzlUn0N?=
 =?iso-8859-1?Q?xPsHtGl9tG/BTvpRd3DgPmYMXf+nl2MV9kwHFotdZgY4NTv1MZzUXntg5f?=
 =?iso-8859-1?Q?azmxTe71I6yUY0rhDmwlCh8ehcXfcfLHd8TUv86YvhHIPHQQ7lIYC9fMiY?=
 =?iso-8859-1?Q?s8b0PTgoh3eqeuqQYVDaxQ07H1C8seUcCK3JtHrotYYAG4AUbrdXKVJ3yo?=
 =?iso-8859-1?Q?3/l5ZgIDYZ94Vzms8v2F4v4h2Q300IimA5A0y9wGYSlQYbvlbkaXT5Ng5T?=
 =?iso-8859-1?Q?bZBB8624NmKTmrBz/+jI22qpFjiugtQqX6xrpeofdQeTZBvi92ZQnIVnXn?=
 =?iso-8859-1?Q?m7TvRdURtH0yUx58wx7L5ydE3NxuPTiUGV5lJUnzmXpR5y3puWleYZHUPd?=
 =?iso-8859-1?Q?xUK7oileHuJ5Wd5r6j2NMMhZIhAkiUNX8XOGfbcKwg/EaHBds4X+mlb+zU?=
 =?iso-8859-1?Q?hm9l94ToFfuUEeFMm7J7COzwDINbfZsOjw7wfQuOPegL++hWZ5cnrDEygY?=
 =?iso-8859-1?Q?n0U6/iQG8FCG1XTGVbhrNFQEpavX5F1GVv8ryArpTD86/To0+8BlH0hjTl?=
 =?iso-8859-1?Q?KNXRLYD0adfhCygnTYUSKQRgfteG9Gw2HgfLOISSthg4KcEE8Eprdv7XRU?=
 =?iso-8859-1?Q?UPW7HOjQk9zyKIrcnzZMyAtlkAeRO9yAMXLTzhpcFEtSenkyRUriUnhsVM?=
 =?iso-8859-1?Q?WU8TteR4ZagQgyqBRVwyqtUEzpU+FavBMSyMuW5OysZVZaSXTLnnD5k943?=
 =?iso-8859-1?Q?T0VrQ3/Fpg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sjubJ4qHAp5Xse99CZ+sNmuE+6/uF6GpB5h6J78IeqY3ZqQvYFOSwT4BJ+/mn5MFfu5GqyVzN7OwlEx7ijufj9Ch7opMDVdRCmKc+tPEEq9IOT9B1mmoXL2st3YUFBw1AwX/UlNSgfyUEahd/Cr9EshbPCzZlRQpAyvLF1MuOAQx5JDiRPrxnUqpb7TsxGDvYaTEH5hlTdPFw9XGjkt3UBT11dKmvm5qY+wSdlK4fW99ByJbI5gzET2NhjO6lCAK799QlfdCErjX61GcfdPA/Z9TnnEjgjER04/rWWX+1ijOjNQpkWHk6YDn+dPxjhltXw7qn9cRt9dHYf4CQMtfDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6906a5bd-68b2-4c81-331a-08debcdf609a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 17:34:31.7181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tK483f0nFaqgB1ozW/KWvUO+2ukKbf61IKwE5phG0EjfAhlfDorVQyzPZXbmTbnaH9BSvHd8xWR562u3Ib7OZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3745
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=A6Zc+aWG c=1 sm=1 tr=0 ts=6a187cc2 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=0bwX27tMA4ljDho7v6AA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: 4cAYY4pIEO4oIgnK5mi1j1lN_-sljb93
X-Proofpoint-ORIG-GUID: 4cAYY4pIEO4oIgnK5mi1j1lN_-sljb93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NyBTYWx0ZWRfX//1vKpQRDet8
 LSyB4GBptYBElwTR0wAWSFDYm0lIr+f3tuKKXBc2gWYycOUe+knANZdNg1n8ab5kLZdrx8zcvtz
 vBD00ducibXtEh56IQiG57P3dCnuHZ3io3WnM6xBy+2LBJa8ZuRrs1OKTQJ/bIlnQMH7qzo4wXK
 n/MyW+j9+mHMP/VrNtGl5pJY+VzKZ7yD6qGLA57ydHR3c3NQIr1lcMlwPF87C5tQd+VhA4PO8o9
 7jgEDkrWWbVBXmc19y7ZeDT/OuuPJyjm8vwv5TVbIweEvBVs8Bmi4QCW7we1i8ihmMbPAJ4m2ur
 XIReZiKyvmQ7279TUNzyQkQuNzotShQHfrrd8WtQKRAE0WspJpwmDu0bSgNsPxUXBJ6nQOhycA7
 kaoTuiO8wSMow/0oh8EbcnszdC2TzFBUVEShdArqJXPkGRl9bdU4lONSPe3QGxZkHuwTjw2Pcjy
 SYvbE+wdiLBbcuRak3Q==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280177

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add PMBus hwmon driver and DT binding for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator. The driver provides monitoring of=0A=
input/output voltage, output current, and temperature using linear data=0A=
format.=0A=
=0A=
This is a monitoring-only driver. The device's hardware write-protection=0A=
(WRITE_PROTECT register =3D 0x20) is detected and respected automatically=
=0A=
by pmbus_core via pmbus_init_wp().=0A=
=0A=
Tested on PTX platform with MAX20860A at i2c-195/0x23:=0A=
  - All sensors (vin, vout, iout, temp1, temp2) read correctly=0A=
  - Limit attributes correctly read-only (HW write-protect honored)=0A=
  - Clean dmesg (no probe errors)=0A=
=0A=
Changes since v1:=0A=
  - DT binding: Added allOf regulator.yaml reference and unevaluatedPropert=
ies=0A=
  - DT binding: Added "maxim,max20860a" as alternative compatible=0A=
  - Driver: Added "maxim,max20860a" to of_device_id table=0A=
  - Driver: Removed redundant WRITE_PROTECT write from probe (pmbus_core=0A=
    handles it via pmbus_init_wp())=0A=
=0A=
Syed Arif (1):=0A=
  hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A=0A=
=0A=
Sanman Pradhan (1):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX20860A=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 47 +++++++++++++++=0A=
 Documentation/hwmon/index.rst                 |  1 +=0A=
 Documentation/hwmon/max20860a.rst             | 57 ++++++++++++++++++=0A=
 MAINTAINERS                                   |  8 +++=0A=
 drivers/hwmon/pmbus/Kconfig                   |  9 +++=0A=
 drivers/hwmon/pmbus/Makefile                  |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c               | 58 +++++++++++++++++++=0A=
 7 files changed, 181 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
-- =0A=
2.34.1=0A=
