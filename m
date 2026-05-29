Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6CF308F32;
	Fri, 29 May 2026 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780013985; cv=fail; b=qDsMkni2tVzC0bQWgTB93SshYwO/tmFDuiZ1ShCmNwTBh4oI+0IVvUB6Yy9nZnhtfmC2L2K8qdVpuqTkDtn4a2ReyIOBc+83x/DliS2ai9K+U4xXi+HetBZlZ7llEHOzvuYQJaA00yYeMNI3/1duPf7efPK0wk8V8l/WsoaetNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780013985; c=relaxed/simple;
	bh=X1+pxlfCG2zSUhhWizZumc9kCB1JfHORzIVJ02WtGzA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GFjP4nnAGfcjc2OiCFRpWLxXj7h7oO8QMVRXFBU1bJyya6w2+yeWenNpwbKnO9s9yO7bhwSaUWobQaJ9aGmDegFGR7YPyDCOzALbc5Y7Ds1p6hyJ6Nk6h2MYRVEwM7Eob47wta73l+jr1RQdWhJfVob9NMg0gSsW87ZM2U2857g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=LB9GplNv; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="LB9GplNv"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0AHlq169544;
	Fri, 29 May 2026 00:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=Qbrt+JKXr19lgSv55kg19BVM
	CO2amN8Wvto70MBVIC4=; b=LB9GplNvSz0L/yX9Mi15xeGfJbMxr4AywDdQm7iA
	CSU/+Ph9yOeo/t5PqkaDeN7v9MPQxCJNM94CLks1jFZhrsedusB9EzDZrWSSr7EX
	4to7Ho2PVvAVvS/P1aPhKU3N3hkmuo2TNzYu8yFYYjtKdN4gbz3f9U2eMBKNxPsb
	Dql6+wT6bTgyTTwVLG1zdYM4T+56l2p/z+8DWMs1YL8MvT5hRgY3dwVGEI0O4XRx
	dr+6k2jCGErBIdarTo3gBOeDXq6S5Jw+mivLd1rFS9GveyYq+sUc79CO4/W9DX+s
	DARSW2Jnf2KUHFI4MhB7DUIrKmO7EebiZj/Gk5iZIR48oQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4eerwad5dn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 00:19:28 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 0DD04805E7A;
	Fri, 29 May 2026 00:19:28 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 12:19:15 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 May 2026 12:19:15 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 29 May
 2026 00:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ5Q0aUqFZ6us5N8DzvLLD9cTcxxwfYI/dirbdnhcBs2lPc25yZaJnO7D3FHnGlFxm+UK08GsiEJUQ+xn4aTV58ve6NSOKQT8qAbnLJWzEEqQ0OEZ3dmRObRgBnYNpphGzuEiLj81T2LpxcL+jLC/hI7IvHPJtpwEA333+U47rVNXrdznWFzOE6K13aO/U4IoCJ5f9JwngWbT5ghdFKDDfwCcfdFP+ZGM2bxyJelVpdXh/1Tf74ee7oaWZTKw95rbQcSmINS+9Q0FlEIBfocl6HSvos60x5DkmcTTLvxYb+DrbrdaOgOlu6FoDDztJLlGmnZJ8iq70CRCxJH5rZQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbrt+JKXr19lgSv55kg19BVMCO2amN8Wvto70MBVIC4=;
 b=rb6RCVRq6FdQcxEaAoaY3i8btkF1115YC2m9ih6YfmLtqRhYUoWgF7LWTbmeEr949FPEgrq1KNcCoJ/ybOXeIuDNObyWimAxHXRZvFvqYAMCVOhPAnEgHbzS1X/TauyZ3QD8K+0+EjjPGMtjmPuNRJIbnr1s2skrVDdyq+PHH3toL0RMU7JNz3ElN5MIRAxg1amdUrSS34d4DMFSVjA1FSkEAEu/3JHh1Jhgwtj38F+tfTRfRXt3TOBV26RuQsCtInZntn4nzvGo0FypVrw5zSQBhiGBC3xD6Cue1CQ9qv/KMQsbb/CSVicwoQoPFJSNmYyKzugHwcmHFiOBD0LLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DS7PR84MB3086.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:9d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.5; Fri, 29 May 2026
 00:19:12 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 00:19:12 +0000
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
Subject: [PATCH v3 0/2] hwmon: (pmbus/max20860a) Add driver for Analog Devices
 MAX20860A
Thread-Topic: [PATCH v3 0/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Thread-Index: AQHc7wDGn6MQoZCL9kONUVO38sKVOA==
Date: Fri, 29 May 2026 00:19:11 +0000
Message-ID: <20260529001903.625737-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DS7PR84MB3086:EE_
x-ms-office365-filtering-correlation-id: 5333b3eb-fa82-49b2-2dc5-08debd17e8c3
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|3023799007|18002099003|56012099006;
x-microsoft-antispam-message-info: pm5U9ILP8Gj9lUlo2GWgc7u7J3TLVCd/K/hlG7FNW8zWjSBQq8Pq5Frnx53TYA8SkOVZE95VT4sK7Lu5u4zaohMUW42GKLZiv15+/1E3zzcU/ZwkHfnauukHzNGjH7RXIQt/vMOPlbDUpDB8HR3MDm1IAq1RS+7nuc/wT7CZ7otUorNiIyklN2thHKNS7ez2s46LjksaAchBZ2f9MF3Q8mKSyybzv2xhu2/d0sBbH+8yp37yTvEw1k3rTudRJfSLDVz6CmQBJ8iaZdJlOnlxTOwwFvpaSX+Bnp/44+h+6ilc4XlN1rV3ply5Zxie6PO7aRqhqozuFAznSPsoXreefXBjepgZsoKfqEOmlwmpiIOaN6Jh7BdM7Y2ped6iTrgM35HJmbXmj5euYrwLTj7R5t3SYNTQUsXKXXbatZzC5Ka0bq85H4g6mzYtHnozl+TMpSR8WIpt92LBbcWAP6CA4hGma9EmMb6AS/HTfgcNV/WNRGKAmdy3jZicHSyGpEGbImYaq0J4T8+3Zatt6SKEQH7JyQJx+5pQwLUfk1W3HQDoUC69P6CJPNwp33VLyZhjbquQTWc5hF3wLh6qZTCvl4PRP/L7nt6dDcDalvBgHMv40/UZ9kDn8yjwlJYKqD+IMRVhqdoKsyaehPD5e0HyN9oZpP0sQ7AIBAtcPTsUHaji9okPqVBnD+vBHj0Gn2uHfHgle9qlP2sEycQ75ljrLjSiuFhyvDuetN8lk6sK3UqTITAZrtIp4L3M2TqmsEGc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?avftcKpe2p4g8lY0rrWDo3ARfV5O9fi7Ky5puxluewqFKRwI1bjlbxu6PV?=
 =?iso-8859-1?Q?TWzcMH/lorfhgV9wVUeWGPF956Dhz8WVaLLF0dess5ezOhp4S+ybYa8vwV?=
 =?iso-8859-1?Q?HNzIzarBav45pJ2cEIPpACjk4MF7VX+/PTD0pvf+6tKwGLojsvq1ZUvArB?=
 =?iso-8859-1?Q?zjmcDxhAdIIDUQ8Sg6mCQZp/gIUHEmvxgSdKSkCbnT1ATKwRsZpAuCneHt?=
 =?iso-8859-1?Q?Xzj7wBDdcoc2fOAt9A/NzNysitkjee1n9OHKHE0iiiP0YzVUyJby8qWXsA?=
 =?iso-8859-1?Q?RK5vUZE0PFwzPewoPM8YkAQW5vTxQR4oKPerOxDaFliCJU6VN36Gs0vYZm?=
 =?iso-8859-1?Q?nWgJf/emmqcmjg4FsWVw1W6yn+2FOL9hHD8j7Q0HQ1dMCTwgb1pWmP956F?=
 =?iso-8859-1?Q?wV3DCwTVRrJjZbpT+WITKFpyV1la4jdZCM7LNNTrsHcnZcRyJGswcIDD0v?=
 =?iso-8859-1?Q?Kfe++V7Fbe8m2lQ74/P9TKpolG8x7DC1tJCb8uLmJEgekvFEVU0JpjoDtK?=
 =?iso-8859-1?Q?Optl2UwhS8HDWzVinEuvy+dJ3MNJJuUOkjaoBlWkZI0782DQzpb4SbZsvt?=
 =?iso-8859-1?Q?VjgYc+4dJRTipL4PZEYWE4llmB0nYqMyli01I0v1AhocXI6mWMx+3EajFT?=
 =?iso-8859-1?Q?iV7D80PRzmgwh3jtFIngoCYaBZqp4p84gKI95FMZRQMmCSdiX/tW43sF6H?=
 =?iso-8859-1?Q?SYWSrGhkA5Tyd/LMFtwSFedQ/x7u+CJ0zwJRlS3m7wV+CLc9mr2rvslOt2?=
 =?iso-8859-1?Q?8dsNN8VaijvQgWE+lVd7/5Sja2aMcWQVkoJOQLAPgVrDnnKN6GE98m+LAR?=
 =?iso-8859-1?Q?3TZqhmAnah2doN4h93+nYKAodf9D4Tu7kpLVG/zagggDJSg/+RE1GqGOXs?=
 =?iso-8859-1?Q?col36ITf2W/pxl9iFgxpdmD2QReTkRoI7ctkku+1e9WaueYQp2DIMp5N2s?=
 =?iso-8859-1?Q?yUHiUpYj1bnkDK18OlnJyd+6xEcalgh7JGh8WNlrmlCvIjOjM4/Is2BLBp?=
 =?iso-8859-1?Q?n0+kq62D7x+TlAPz8K3rz/tzT0QxQk5vl7h1VUikkuXoOhN2QLuyJf+xzU?=
 =?iso-8859-1?Q?b02sr3u7ODqNV/cp1EWy3WlNpKisxrBjrYI2J4NTCCB8S1vpAOffTPtWhr?=
 =?iso-8859-1?Q?6fhjjljsg7psALvQ9luzZesAeL49XkE9aVBft5zDvV6GnTNMBBhVpoESia?=
 =?iso-8859-1?Q?7HZIOEQN/y4iU9hR32HJgRuYEDf5uvYXatROHf7V0reGSumsQg1opGyhDv?=
 =?iso-8859-1?Q?Yl+NxLgXpE08oE4QH5sP9u+wYIROHkaZCcE3KbcgiVCmJZr0ftMUsUb10c?=
 =?iso-8859-1?Q?JtXcaFdkolA/BnV0FR2U7O7aHQBzisxVTzKFEW+d4UBnf1nqVhPXMRnfxg?=
 =?iso-8859-1?Q?covJCq8qb8qlgQz/0bO1VcQjBnuExDdv6h9CrDU1XC7mE7YQ6/6ZKpX/KN?=
 =?iso-8859-1?Q?DpWTRKcaa5nYY+8QNQsJ5iSTtbftaIrrA/M0YDtKlEjfcdl3qcaWtUq673?=
 =?iso-8859-1?Q?dDzfoeoUu1LxbYOGU8jpxblCTadZ/Hdr6COJJU/rJjSbBwpeWRDhATWidl?=
 =?iso-8859-1?Q?lhYa4feebpUG0g97xHLY7fBM+fVg1EHTP7O9MoIHy6PCeW336gS+ciGSRT?=
 =?iso-8859-1?Q?tPNddm7+iiIVFjazovnmzoTWaqFReyeOY9pchbQKkKBdb1q/nFGCz730D0?=
 =?iso-8859-1?Q?WwcdlYPS2dSREMaXU1wXKyXvP/epWhph7cwjwyuSnS04/x7KWycRoKV3xT?=
 =?iso-8859-1?Q?C29cRhN35N0W15eG3WnLXZ76f7JOHubGRgt97K+VtEak0D9O7u5XfzuNTW?=
 =?iso-8859-1?Q?eVnTzQHSiw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XhR/ErMxOjndI3nhlHFtnLe2L+3JEhT0C21zmdyGxyeXb0r/pJzKaim65zhMrwoqmrPvWTR+jsk3U+py1TW3QpXsQY8z6clvLNYb2BKTDHvETvB/pHuOzIRrX0SoOdoTjl34InGyojzChFqyDKFeSd4N5Td6XBqKJPHwLo3gbFcE4OmvZ5J3o32DQ14g9eVUgxGbh4Ww+1KlCZRAVLID8vY8+xQEmRLTYCL9CNDAR7zPYLKLPbpU6lK2r2W5HZYSD/Q16Hz2YAWS/ZgDpFKlnprz0JC8fcfMUkmXup0ypHdFy0vqY6YMHuBx2xabuVqXljVMCqNQsm4/KwWvyv+ozw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5333b3eb-fa82-49b2-2dc5-08debd17e8c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 00:19:11.9278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z09UPkm7phVAW7du441nMpm/SLtF+VNgVUsbVnaVipyJm7bTUA4ktHkbiiQIgOqV1EDGsZg+6qK2RUwuI3ExAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR84MB3086
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=A6Zc+aWG c=1 sm=1 tr=0 ts=6a18db90 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=0bwX27tMA4ljDho7v6AA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: mLnEpHl1Gu9OIULhDY5xClFCybNJTM-4
X-Proofpoint-ORIG-GUID: mLnEpHl1Gu9OIULhDY5xClFCybNJTM-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwMSBTYWx0ZWRfX5OpbG/BsnPHS
 yQeyx1raGLDT+Qwa+PjctQD/7hpuzB1VlsiXJtwCmd7w+KrA4GSv9M4iD8Ut5FAj6YGa+FMhcnr
 lAG8Trg6enYtPJSNAKC7+mgLqv6GJKhmewaz2UNPGwgAhouQTj5kaYekenR/c/nG+HgITy2HSqf
 +EipwlHJG/tQFTozE0inq3U3z/WNIuywChhg8HiIQKg4e8Wh0R8LenPbzPOthCV4t5DWpSvj5v4
 JeOHzbI28OLek0/SJME82GZGaG49+N3+L91HYSOt4io+0qBEbuISTDfNOZQ728EKuz4K9zmTk8U
 vAelNsV3azxkMBBcyKO/363PyhHZgWonZIq9sGS8OHQscBH2iW3qzDljrWny3nYorNn2irmJsVE
 uBFY6s8wRsh8yjHZzI+AQH1Wn1EpwMr0qvMjtAHXyEipytnZFr9fvdoHwZqxY8sYnoSqtcyO0Bf
 qpGMejjGmsJEmqS0PAA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290001

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add PMBus hwmon driver and DT binding for the Analog Devices MAX20860A=0A=
step-down DC-DC switching regulator. The driver provides monitoring of=0A=
input/output voltage, output current, and temperature using linear data=0A=
format.=0A=
=0A=
The driver does not modify device write-protection state during probe and=
=0A=
relies on the PMBus core to handle write-protect detection and sysfs=0A=
attribute permissions.=0A=
=0A=
Tested on PTX platform with MAX20860A at i2c-195/0x23:=0A=
  - All sensors (vin, vout, iout, temp1, temp2) read correctly=0A=
  - Limit attributes correctly read-only (HW write-protect honored)=0A=
  - Clean dmesg (no probe errors)=0A=
=0A=
Changes since v2:=0A=
  - DT binding: Drop "maxim,max20860a" and keep only "adi,max20860a"=0A=
  - Driver: Drop matching "maxim,max20860a" OF match entry=0A=
=0A=
Changes since v1:=0A=
  - DT binding: Added allOf regulator.yaml reference and unevaluatedPropert=
ies=0A=
  - Driver: Removed WRITE_PROTECT write from probe=0A=
=0A=
Sanman Pradhan (1):=0A=
  dt-bindings: hwmon: pmbus: Add Analog Devices MAX20860A=0A=
=0A=
Syed Arif (1):=0A=
  hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 45 +++++++++++++++=0A=
 Documentation/hwmon/index.rst                 |  1 +=0A=
 Documentation/hwmon/max20860a.rst             | 57 +++++++++++++++++++=0A=
 MAINTAINERS                                   |  8 +++=0A=
 drivers/hwmon/pmbus/Kconfig                   |  9 +++=0A=
 drivers/hwmon/pmbus/Makefile                  |  1 +=0A=
 drivers/hwmon/pmbus/max20860a.c               | 57 +++++++++++++++++++=0A=
 7 files changed, 178 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20=
860a.yaml=0A=
 create mode 100644 Documentation/hwmon/max20860a.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/max20860a.c=0A=
=0A=
-- =0A=
2.34.1=0A=
