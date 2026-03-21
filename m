Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922B42EC083;
	Sat, 21 Mar 2026 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116727; cv=fail; b=IhTlCO9mkoB5BLK1PGRi7B8tAzqFXwPrPoAv+4lwaJDunrlS4Ttgpdmm+gn9dTfpRPCpACzuhTRIFVJksbjNx9Ll2JurK2ezi1mNUHrx21aU1TpNQcwb1bR4dGtkeBx2YLR9JvsO9Js7V7VFPp/yhk6mQDYBpZbkeAP0SJx4aEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116727; c=relaxed/simple;
	bh=K6Q0ggsZSNdVvZKs8SRGM/bVAfQUiOMSyxOnBXPTEvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bVYCi0AN6ZUX77byHTqhnPfyavK3nX31/Ra9OmvVBoq/PyNOmgp7xDH40v8qX5FVU/ZaACFtZd7pQRqVlqheJ+vFdC9oLJZKr9PBkrb49mq6iALeFVQFWvpZxK2QT8+VrQn0y4BOGSsfbo3NYg0LiQdH7zbt4jSYs04W+fm/Mew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=QF57vcBE; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="QF57vcBE"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LDCZZ7749275;
	Sat, 21 Mar 2026 18:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=7W
	lRDEYf+Rymufnd7MAlw1fDGPlji1x8NFDVk2PH6RI=; b=QF57vcBEBxGcRPxViM
	udXgJxF1vUZ9FczLOIC5yxFJLNYG4iWY6wGKTATiHlP989aBE29Ll7zkAdnxNTL5
	b25RobVAoWq7psF7AN3wl4qHDxjlMm8uTCbJpcsrgaS3rCUryHo/g2A90e5dUuVx
	c1AjLSFJ96Lyic2ImPlxCiRdYXVYr8cZnmP8Vcd69ugC1/sTRbfzpXdTxnQZI4D7
	UwakxtHgu/wmGkydOI8y5uDgidWJAfS74EqPSCxjVh8Dq12RUdBsvA+4WbYfRgV2
	q4Xr2121BNVmhgP2jgzbIbgB4/qb6+3Gzc6k6BNQaDemJcc8EieJk+noMbx/Vgbc
	i9Lg==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d1v0nhkma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 18:11:51 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 1E269802BA8;
	Sat, 21 Mar 2026 18:11:51 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:11:50 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 21 Mar 2026 06:11:50 -1200
Received: from DM2PR0701CU001.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:11:49 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtxW+4RyNVctJCWhpGsKcdwVS8H3gDOl8IezdUTeUYWoQhbBeT1zPXo2K0yKFleyDwms3p5I+QFuX/NpSZ8xMS56Eln5+CbMv0YXU/Rl7YTNlTO3iKnJvqgZrdz/DT4VMhgUMU2NWkPZQMqz6HXK1uQay1dE2/1sAkXn/LbkobWhx8tdK01AdvRCzkNALgHHHPDu7AZ3cqn1Hc/2IhX53UoBVdoC9RSfmYsP1xA6CyTncMtEqUOkNh0FVSSRQWa480b9ulTw33BY3m4r5og8GLIRm2FVHXLkroMnGDxdMmCgPoYXN/W0GN+DOY9q5rTPZ6NNb3XKgWj0VCPIdt98kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WlRDEYf+Rymufnd7MAlw1fDGPlji1x8NFDVk2PH6RI=;
 b=DN1UOU9rWF707r0NMEk8n4nBvptGjd99E1XAfWmwOpkKpbeSuyOZN8fr82YvvMsUvuNDWNTZ1yCZAlauJk+vGQ5Gluloeej1kHRkZZpQ9Xo1fuX8N7Rae/a3Xv6YVObFqqwQAt3B8RW6uirDk6DZBDzsrtcy2dn9rLzH07/JlbH2KhP9Abn881Dk+3YfywvkpCC4W6Um4A8NydPRSyTxRXDWyiFMthwtpFplDdmmYivoDF1LxQAkp1DY7NoCcAhL7AILR7wrXKehxCE+CPOLoY7kIPSghF5zfpOg0jjozfal0/J/41ZFsfKktX0VXYMwITn/mIXa68QtaCp8FCLR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SN7PR84MB3208.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:268::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 18:11:47 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 18:11:47 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v6 2/3] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Thread-Topic: [PATCH v6 2/3] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Thread-Index: AQHcuV4umRvuzBT8H0qBEKRvQfwsgQ==
Date: Sat, 21 Mar 2026 18:11:47 +0000
Message-ID: <20260321181052.27129-3-sanman.pradhan@hpe.com>
References: <20260321181052.27129-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321181052.27129-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SN7PR84MB3208:EE_
x-ms-office365-filtering-correlation-id: 1c0df26c-4b06-4948-ad93-08de877550dd
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Sj2WCjIIv71hHE5C3Z0Ydwvc9sjYCTzR5cY7brrhfm39nBqVgYaIZTWHua6pb3jDf9caH823irEG951/w73kCA0QbQonQfSy1QIMHScCRuRhqeygL+bASVOYf5OzyCNqMShR7rcjqrmvOlHKYeDaExeZckk0goVNWaJ4QO5s4NE6WQXgdgnLREAJ/vMAMNzoOkquAkBHDJ9YP29HOwqQ85fPPJndkCwliOycfKXS9s/Wx0nlAtV+ByARpeUbGByO6UNOT8g8BELqVIuOtsKqwBVobHj4rQdyE4J9OjLsUuA/2pewrDGS0eaypm1aLkq2PB8RZi1SXBFcBBVNpwuI1hManF7ma4veDecqSywp5esXYq/AqSjNlnrS1ngM2VIHrDGb3iYkpcMnq4ONkgnRS6vUY2/0XIqsuU64/SXKUrVgTW4NOln6omYll74aTq6pMzC5DSvkBKn4CWENRa9u8DY9HhJdNE09Q1FHe4j/vWRp5hArZ+RPvvqPvmMyIk/ve/ou19D0xChjp3MWaq/7Y4D+XVMcDDZiFCq0QmRPc3kW5lBt3pM4hXIDbYpjq0vTLxzfKHDrP0y5XLAhsNIG2V8e+eMVS1CwkEateZWfnkBgpUBpkVdTg4sOG86LNG20M9UhcLgjrqDmW2RLM5O2f84ZQHLPZ8hsGcut5XfeOjPG82lkZWXmmA2vOKILeORIFCMKTOHx7dSBCMEc4Qoi02zSMbEjqG+exlKuJ4LSdcEhiGY7zhTQWJgjAd5N7Q1y6LoBIbpQA37uEPIUtuvd7ywItp3aWLuujR9/pxkq7TI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ArGztXgU9kuUvkadKW3TVbUmC2Z0pv6OUJpFHLhDWBwzJRCz+lxqAHFk3h?=
 =?iso-8859-1?Q?f/OTYWuNn6ApLdgwIO1p9XVfGKZ00ohpNYQbcczA+xxbT05KjRY7zG4cqS?=
 =?iso-8859-1?Q?nf7NQrfyiQa5JMhH7Z7eyQ11imRRE9Z0R62f7JqHD0XwnwyU8Vy2N2jLzc?=
 =?iso-8859-1?Q?HXLbGomjLzb83EPIo4HZ1vwGE9uSYlQvknWBe9vQgrY7Jb5MijI9pePSbs?=
 =?iso-8859-1?Q?eBHpShuebE43ThzsXKkFZZpoiv0g1oXxPQb3JZa14/J0VM87DRFu1F0AtK?=
 =?iso-8859-1?Q?ouiUtfekj72J5bWkH9J/K5Rd22xoWpbVYnzxjt6+pO/8nHkI+GtQjHCRX3?=
 =?iso-8859-1?Q?vS6a+RhEp5dI7X5Xvb0f0Xk3bxHm/JMxTJlw6zyPMSJhvnqRI2X80b+yrT?=
 =?iso-8859-1?Q?h3WVeUUn44Lxe+kpGYPYhAntBcPZzUmWxdDH5vBGaZh6RwhvkCviI6fre0?=
 =?iso-8859-1?Q?XirH5zAl73JnCqA/2Pn7tgFy7gvfwIiJJz+FbepGznSJ7CTuPaoHatNv/t?=
 =?iso-8859-1?Q?pG5u/RAYk5p4tGAlxesN96f3J3QM7oDZ5coRzda7SAITyaqj/PLdgZ0xbb?=
 =?iso-8859-1?Q?7zwx1jlqH6m/GbUOjbM5157rch4eXJpBfjOYsyx+CsPxn8lTCzw1q4/awp?=
 =?iso-8859-1?Q?Q19AUv1ecl6Ho/iE+yaXJURB13Jmu0o5ZX4O6jsgKGMEcz1DQyTQoIpDeS?=
 =?iso-8859-1?Q?nqNnShTKw2NEKQBUqLthC0yM9OcX2MDN35GgphblRgqiUMFVj0J4k+bEGI?=
 =?iso-8859-1?Q?0JZtNDcySnLIXvX3b2Sg++3la5UL+MNFnZgbAvM8UOVEga+DGJATEgcriQ?=
 =?iso-8859-1?Q?aFDNsOgrbM5XhCCEYpgvv4ODyiKTOs8tD232nTZOCfuJVDgroW0RkDgoYL?=
 =?iso-8859-1?Q?HR7Jgnp8vmQCbzHNk9XYuisjsqcu7sAgAxz2ZGJEOLwJ0WO1EOmmv56zSs?=
 =?iso-8859-1?Q?Xp8mupohWH9sFc6F9sYlL2OLCbjzhLX1HppucHxZAEE3VkfXzDVoa49mcD?=
 =?iso-8859-1?Q?yI274LkM+xPuk5sWuTxxzAfLjrLqdQUMNjrmS+AwvUm30/J0V5m5DimUSe?=
 =?iso-8859-1?Q?io94ME6fZGmSSfhbB0eCLxuuRHSf2A3Ijj1uspd5G8QYxDnFoFKzldTMb5?=
 =?iso-8859-1?Q?G/tvOfI53BwE5gRBfCMC9s8f/kWwPYEKhhMB05RRWMfF42OvG/0Da1Z3oQ?=
 =?iso-8859-1?Q?+Gs/0m5xMb1JDon4NVYlTcUfOJ91OTfJRm1aZUwYLJNgvlcaUYO77Q4rr6?=
 =?iso-8859-1?Q?DFXxEYfv/m378crdyBLDv7fgbf7xsPg5vdAXz6vZHOLg+FdlAdHHmfOm4c?=
 =?iso-8859-1?Q?IPh2fziD1pyFj0KPUFZcpb1bLNOrpSuoExBrBjfNimkpi536AcvCRRWfzl?=
 =?iso-8859-1?Q?YI2gFYW01ywnXzQT5SZR30rzoNhOigLprjVe35ZvrQqTrto5VgWFiKhW5H?=
 =?iso-8859-1?Q?hwBV+3LD0VDLEhdM7dC8q5eu8Qjl/+593QQfftaNupmE1MwdJz9/6VFXNK?=
 =?iso-8859-1?Q?ewn89hmbvkj8mpYWplu5qgRyGOeYGNeehu62h5aDCEkV6iI9Z+Mjwf0bUd?=
 =?iso-8859-1?Q?CXxsh7v0Qz6HReJLaznsLDW25CwIISiH7pdpbRVsHEZfS9CoayeqJ6yepl?=
 =?iso-8859-1?Q?MYpCnN0QZcIpaLF7BJ+Wycmnw4qs7WFGHn4ukudMlQ1RBkqzE/4xQEQc/c?=
 =?iso-8859-1?Q?8A0mjWAAs6hqEtlAtAL8piq/r4jnRczgSRLe6YFAqVAdv7PVe9jaHZsq49?=
 =?iso-8859-1?Q?rxahAOO25PHvt4QiDRq41MMIIvHE8cOJCkCGDdvcGzYvoR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uXtgWk4Oiq1dvHVkKsMzCIlBii3x+EFwcNed1NM0Ot7/sHquZLIGpfZiecNMN/w40zWfOoAgo7MDanIZiE9Jx/IajtVpwPh6taHlA0eB/om9yW537ybPaftemXaVP0avwFY2PoUaq1Bp3RxBEwxDa17ZNdepPzqifyJjWVjtCWruzJpfjHJUhJOK1j24Nop8GXk4VbmwbGjiQECgnKrem+QFwtFNQcIXSX5MRxIsLwLEr1RYIfE2F2OXdv2Kgjk9Fm+uWCgSne+5KkrPCW7MS9S+PldA4eDgFR1QDxtColzDC2mmNg2alapmkSVbxcR05mKH9F9CBlHon05PbF9wIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0df26c-4b06-4948-ad93-08de877550dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 18:11:47.0749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0avEHTNPKLHmTrxj248Fz1kIMPufRlqSzF7jWwkV+Xj/GmaL6Kf+2uZYmKFL3hxHwyQjD7nFZTvDH2fBDnlZGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR84MB3208
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: QtmxCLhR_Yr4DYWlUiAxue8ZisBGd7Sr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE1MyBTYWx0ZWRfX4oWUoOb03n9q
 18k03TRC1ywazOa+eQz/8UXyawrPTR+6D5o6VmZ5972W2n51RAaO1u71I0d3j1sDg/bKKT2diHE
 F3DIA6A04t2fjTB8R9aBYFq4P+pF3Nm/27I/5SAQsyLTjgijLKwhORInrNLREiT/HwsqLDOtxE4
 xgo5qsThkWzcu+36gRUnEiqRibKkistzOzD9QzsXHwv/pfmtpZot9yprD57tC+rPFYCNjmrHdl0
 cmHvX3sC+tANy/UwQGmefzuXLBF/E8W5VDt7CFsZs0a2BNriAMwYbhFQdUMXm/UMrmrcv4H+Ugu
 A/nB6qfpRxqDd2pb1z/LbynKKaHcPamxcPa8IzPeZLN8UewceWnGaQr/VmGCGt9zkjF6YqBUk3L
 QHmOLb41vf3qtliEb1pPHllDMiVCMHRnNYRF6p5nBVhz5C1t6y0lKmiKVCBtu56mUGIBIK+coz2
 0OxHdewfjyjIRapkupg==
X-Proofpoint-ORIG-GUID: QtmxCLhR_Yr4DYWlUiAxue8ZisBGd7Sr
X-Authority-Analysis: v=2.4 cv=Sej6t/Ru c=1 sm=1 tr=0 ts=69bedf67 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=1dJJvSGK75pZe7GnG3sA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_06,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210153

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The MAX31785 driver currently uses driver-local wrappers around PMBus=0A=
core accesses to enforce a 250us inter-access delay needed to work=0A=
around occasional NACKs from the device. This duplicates the PMBus=0A=
core delay mechanism already provided by pmbus_driver_info.access_delay=0A=
and adds unnecessary complexity.=0A=
=0A=
Replace the PMBus wrapper approach with access_delay for normal=0A=
PMBus-mediated accesses, while keeping the minimal local delay handling=0A=
needed for raw pre-probe SMBus operations.=0A=
=0A=
For the raw i2c_transfer() long-read path, use pmbus_wait() and=0A=
pmbus_update_ts() to keep the PMBus core timing state consistent with=0A=
the raw transfer.=0A=
=0A=
Also:=0A=
- allow PMBUS_FAN_CONFIG_12 physical-page accesses to fall back to the=0A=
  PMBus core, while remapping only virtual pages=0A=
- use pmbus_update_fan() directly for fan configuration updates=0A=
- use the delayed raw read helper for MFR_REVISION during probe=0A=
- add a final max31785_wait() before pmbus_do_probe() to bridge the=0A=
  timing gap between pre-probe accesses and PMBus core registration=0A=
- rename 'virtual' to 'vpage', 'driver_data' to 'data', and drop the=0A=
  unused to_max31785_data() macro=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v6:=0A=
- No changes to this patch in this version.=0A=
=0A=
v5:=0A=
- No changes to this patch in this version.=0A=
=0A=
v4:=0A=
- Standardized on the Juniper email address to resolve the=0A=
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
2.34.1=0A=
=0A=
