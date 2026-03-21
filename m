Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F87307AE3;
	Sat, 21 Mar 2026 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116783; cv=fail; b=DOEeqSPLatLXKULGPlXuxfGJnOq1heX6kxaPlV/8uWsj6UEy9/2apO8gICTs0W5SRZvp5MGGSZEKFPlZE2G+Qr7+dGUqzXqrRblzLLA3noGMP02ge0ELOh/wYwRVeRqo5LMO6YF6hg/5smNMqHQmKa1IdgQIHj5XjE5S2ySM0N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116783; c=relaxed/simple;
	bh=ddNVQxQRZI8VbZaXVNTADl5RYuNjXWmXaPR81ZuDUEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tMwgvLNPLyXRPBrhG+Vu1HoaJB6SX6hAig9TH0FElir+ZYw4RFkqxJEk1eOld6LJQhp/xcp5nmza0fmnsd9fVkM41rgpuEpvR9vCOXptiR61Kwx5X3aVHJBjGcfOGMwQArRmBV7iddYfLIEx/ifsUouN+9AOR8J426aueItE8Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=ht79ATqG; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="ht79ATqG"
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LH2hV53714012;
	Sat, 21 Mar 2026 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=M8
	naVchcg0AUDWvO3OjBpyJwxLzotB2CqvRMYzW7vJI=; b=ht79ATqG73b75oSvYu
	WqnkRTXSvZBkBkAUyztgSWbk9MzaL6rhz81+jFosEORNcDuzbTPTz1N74fEsapiK
	Voz68tT+iy0E95KS0A/csNL+YjYwxsuNxfrq/w19a12QIgbmnuFvFsWdB7msWtBH
	hK5AKl0e8Q5EhIQeObp2XBskxGUmeAc8+T+fjwQ12JtcDKnjywgT+OGOhaQi8j92
	+9w9zrb+MIPDqGXZhTGlbKDpRorgiFDZhQVkRV/H4GgeOIHdG2UrpMSbzF7yQp0l
	0R3k4fOdpOVZflmVppx7ek1wEt94H0GhW1UqOWa2KRn+Te9ItvbPZN8sCEQZ8L20
	EGyQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d1p6q429w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 18:12:47 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id AD11727678;
	Sat, 21 Mar 2026 18:12:46 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 06:12:22 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 21 Mar 2026 06:12:09 -1200
Received: from DM2PR0701CU001.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 18:12:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POfW5Pd47c9eXBjujgpvKAW9qhjE88usJU0WpeQygUueDJ+H7GAJSbxEN0mPz+awv2nhAvvp+RMYcmPSBPJxsL/ZLeFQo2VhQbw+8riOVDb/EMvStGrWvt1j1DDWKooC2oO1TzRxaeasV9FCu4/q4CzETA8BNXhOWmTxRxlKKhsXaZp0CH+vArVrlUsbAoJPGiLmvhQxKmvXfMtUEDwvh7NVhaL68039lTR71APj1+o/F2gvGYpP8DcpPGky41/SWFUqXubSVcp0/pJR/ZYoXhSU+rQmLI0bXZ6q8y4qKda0e1hTBX4aG7ZJIKF/XYX8CIZ8Me2LEIYQwnZsV0r3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8naVchcg0AUDWvO3OjBpyJwxLzotB2CqvRMYzW7vJI=;
 b=M6QNMkJBHYI8/n/A2z8EMNbWRV4YIYhTFE3+5ib3RY3bM01OrRjNCniTnxUpbP3iEPEY2YHOIFaw2o4U5PdLjoWu942XmwwYF7orfFa1jwYKEFKQ03x8KfOuHOhjPS8tBsaEos3tt0wdclFi8hXpkxnQjEyN/0+QBBB/wOvMVfLHEqrTc5V8FufkaCPROdNanyzGn8T5koAzuSoslMZC6Z+afjprww4mct1oMi/L2DwcpH7NoznYazlIPNy4IZ/yOs0EPtG+n9ZYqZejvpFPgvEUMnGGCeKsrDlAk80GB2oPiJLbHivGTWm1TO4YCJ2Ax12IMzUreR7iP6Mu8nm9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by SN7PR84MB3208.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:806:268::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 18:12:05 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 18:12:05 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v6 3/3] hwmon: (pmbus/max31785) check for partial i2c_transfer
 in read_long_data
Thread-Topic: [PATCH v6 3/3] hwmon: (pmbus/max31785) check for partial
 i2c_transfer in read_long_data
Thread-Index: AQHcuV45vowqosyq+0O6aKW4R0V/pA==
Date: Sat, 21 Mar 2026 18:12:05 +0000
Message-ID: <20260321181052.27129-4-sanman.pradhan@hpe.com>
References: <20260321181052.27129-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321181052.27129-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|SN7PR84MB3208:EE_
x-ms-office365-filtering-correlation-id: 6f674ac6-5d37-412b-3d94-08de87755ba2
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: xcATERYPXcx/2nFT39eisq6ePEevFqKwEH9kUd6Osp0gU0EmL9uVu7IQXZ7SjHndVZGAz0N0h67KUbA1Rpa/3fS30DzssmL7CvRzvrdy6ihScooHYby7rfufS+/+mbuYYLuKcApU0Nxu90PPk3LJA2A7yC1ylvfALbQimoQaBRa43eE78QkLlckXaW7B4GlAVqVtjR1kjfJxaB7CZwBpXg1f+e/1en4EqLx2S6BVYITnPHsxlSngYNXRGB4AHP4pY2LkYc/uzBNlf2gR3dFzg4YWEc4A/VkrmvbblA3O/E4QgtuX3CuZDfL+IJ7v7uYcOnU4Z8VEVpa6jmNJE1kTvl2251bupwBZ2W6ewUzP9atTMEZI2EZT79pKz8c9a6sRDXO2gX6MtBCRbgA0QtFUF8P4fVCD+HJG7CEPvLj67SIfn1OI8v14fU52jG0Pu2I080XdbwLE4FDM5IopquWE7ixq8QZ8HFeozOntepTd2Gt/baf33Hqly3DrCQeeSr+aKfb5yb2Mi7Th4iXCgt0WPBqhAFH4NlkHzS5ZlIVspXNPlqvDWgGX/UYvDYZMx8QGJmb5V/cCSVirTskOXKgzxe4POeI7dml3Jt2+5jKEBBOhRTdijArMPXoFVHOXS4JmLc4afmA/WiTM/sEsxL9+MRWsLLodVV4As4pk+H8BMUuVNkKrY6xdnV3wj/9auEJ7N8Gs57u/Jg5hnXvyzWkw8zrwVW2Pj0TmNVk2/howZuJft79v2PFKr6DqGK2TlHXwZL8swpigZWJVnee1baCd68XsufrMIxcOPbpPkaZNhok=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UKClKSNu5Ue+m+AeogJmschzgGFm3ae1mh9Dn4ui7XYO0PP+GwgUerEsZ/?=
 =?iso-8859-1?Q?wZ8SLJbWd1PneJfme1bnGYvdkE5VD7K5P1Ipgzcos9uN/kxuKS6zFOBRz0?=
 =?iso-8859-1?Q?7WBDl6UhOY4tUeWYFR5mwyBXD+inSXEhYJWMiBJ2U3Ttp8R8jrRO68T7pJ?=
 =?iso-8859-1?Q?YhfsrVXvQGq8zXjS5+15mt1GTYmyCusEwAvm9gipbyylKKFqK47ntgteLm?=
 =?iso-8859-1?Q?TjjVHm1n47JByUNVcgkpsndOTmr0SaIPtcPdGGW/1EWfg79WcnC37tp4W1?=
 =?iso-8859-1?Q?xbE6yJa6Qgpo0exJ1W8sT/eO2vGOnB4Jy2xHd8azm8CDR2EdeE3J0V0XTk?=
 =?iso-8859-1?Q?B9cKopgT1hjMc1sJyNnjzMnzFyEfKUAg3e65niUEqaOAX7sjbkDohmaVcV?=
 =?iso-8859-1?Q?hDEoxxogh3OwnSJVVvhVdMgm9YjPWUMNMlW0FrJFuHwte32HVDB+mkFTMB?=
 =?iso-8859-1?Q?XV5JKFq0uVoPiXRY4yIFJBxn4Ev20XxZPyLvJ9J6VI1q2uuH/K3P1qN+1I?=
 =?iso-8859-1?Q?Kxdip6zZiD3HM+/73M14Cw6zZIqCgjLzJ92K1wEbzq1Sma9RbbcHKkyER6?=
 =?iso-8859-1?Q?gq6sTK1HgVb6XzuwlR32QsvQJ98XR1B8I06tH/IekNbOSGdiqjsi/o+fhF?=
 =?iso-8859-1?Q?i+Tkz+z3ygkdecNd3BAUxTF9eDtDQVJuKqJiLU85bSYhCXhicxzk1xOE6R?=
 =?iso-8859-1?Q?q4/M65AxJYcty2JMJ/IC089J1q5TfgGxV0mOPQD4XFFIvmmbfpeiWpA8q4?=
 =?iso-8859-1?Q?8DUcB1hDXcc7iFwl3N95x6PrEh6wCtLxVKPZPAEDsclEFEjloz5xsarOYv?=
 =?iso-8859-1?Q?pANZLqmCwPl0bAI4LlsVKFVugyKU42Oa2cG0XFC71NOjdF4+JLlcpHHtm+?=
 =?iso-8859-1?Q?x0CeR6Taj2uYc8fFe1UnnU2MeQ5z0lVMfOL2xNG0EGOdGr/PI0uAYRyIpk?=
 =?iso-8859-1?Q?WtffyfX68xTMTTOYAh8awgrMPwz5OX+n1bPKS1t51x5C/Qger6eAjawqAO?=
 =?iso-8859-1?Q?1zGk6E/uvfof0Ws2GHLjXNM6EPE8ram5hj9ABBxLi0Z51HybAxI4oIyPL9?=
 =?iso-8859-1?Q?Pza6eJvdJsKJlRcit+7ILCwjg2rj2oDmA5H0coCFOKP3daa1TVxNoY0ROA?=
 =?iso-8859-1?Q?KEWho0uDd0jQrDMi+5ia5CvWg55vBm1anLHqUHujwO5M+WUwlPcDvHwJgt?=
 =?iso-8859-1?Q?6ea21AAVx6aO7Rk2IYdiIGskeyUW6oafTiuH8Ie3KXzbPZcIjYGPDOCNvI?=
 =?iso-8859-1?Q?M5pfbl1VNY95d4evnuU7Jqexk9QcRIO3W8HE2naY9Cveh7Gg/VEnL5u7Zk?=
 =?iso-8859-1?Q?KMCy21YeaijE2DxJQshdBXkAlkglkPKOBIefF5u5XDu+ONoq2o+Ugqv8Kq?=
 =?iso-8859-1?Q?CtxDKjeiWoHtz8DYNovoh3bqsEBYaBFmZFxZaLwv0SyNeWNsCOermnNu3w?=
 =?iso-8859-1?Q?g88kUQxGCt6cQa4Tik1A3NLUpLHP+3EEA7gKlqSKCFuH1vfHreDM7cp+4W?=
 =?iso-8859-1?Q?8RycMbQZWJ3JjQDkkKE0QeKxZhDCNllkxC/uSFCvojSVogGxdpGgDGghTd?=
 =?iso-8859-1?Q?TE0gzAO1Rcz2cNrx8K5viLtB2THEgXQ76zpaXa1pfrNsHltaFcwHdX18es?=
 =?iso-8859-1?Q?497A74FjJRK+a8fpfUQCTKKVNRryDwDMv9EBlDlsm/rIbtEqO+Ths36uD1?=
 =?iso-8859-1?Q?4Sl2nOlNOo0LvWdZZwsa83LwhxGLuRMMrjeTAeprdbW5/Xy5xibIVll58P?=
 =?iso-8859-1?Q?YViuGChedjIS19jYsrm27e6fRjN9j5Py28DrTsa1rVSpEM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UUK/brGupebfsN35+m9vHdJas3x/+uMVGPk4PIqR5pnsb/BUo9AwutdqWO/x2XnSOAEiA1/chrKXaLJa2IWdcGhX5dsn4Xmowu5pIUQTN7EkZCf+dLL0qvVoXaw91ZCkLbZzgzyEk2EqRLFN6lpNSBibC4sCHqkRscv/tFdDdeqy/ekS89S0QxVCDU9HU5ZilJTLxNwJxuW2Py0Nr3wdYmoe/jVx3L7g9jmCLdpDGX4jwm/plJDijwLfi0c7ze6hbzFJQn7X3CahnWv2rtZUsjpZc9Lk4oFj5t+bpuZEtDavpUF+twNvjpyjV6yqf2zPtrWkNatteSKx0BYNO1dE3w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f674ac6-5d37-412b-3d94-08de87755ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 18:12:05.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSjHvYyRNes3eqvcYj5k9jxlpxlZA9aB27B+jpam1nHDkx8eClbeiJKoXUgZ5RfRReOZHRB7rS3ninh7vwskpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR84MB3208
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: B89lu56iJqAokOcxDc8iejhYojnwfuTZ
X-Proofpoint-ORIG-GUID: B89lu56iJqAokOcxDc8iejhYojnwfuTZ
X-Authority-Analysis: v=2.4 cv=RaSdyltv c=1 sm=1 tr=0 ts=69bedf9f cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=OUXY8nFuAAAA:8 a=pxZigRnF54JOt-8cZC8A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE1MyBTYWx0ZWRfX35ZacDl8KHzo
 ybrvbT8wtKpMCKXVTSFPEVeLfSKbONEpD7nxZCLAGkM4Gz2jLIpYnwo02BdF845nZk8VeiGFh1M
 CPkVeaS9YJ2FG2O0OILT5rXNpOoa66/RarxXmrubCECvIXaDvPzJf4+ubjvbaWvaUbV/I/AEMB0
 d1KBh1zjF1+WCFBELz3dpJzeSxk7oi9Xa03JINAtMrFfzbFRN41FbRIFBcregIwoUpUsK1Air+C
 jDVvO3+ThphxJKAQjLIVxKmohRBisTSak9S+cjaK+D43OmG5W76l+pWECcB2WM7uhzRjprYivXi
 ki+ykc+0j/XIA5A+gCTIwPngZlCTCDql5NR99GjUAGR5LAOijMYzWfDkyhhs9DRZudt0zs6y7DW
 ur3R2zGZZvLIO//ZbyGWpKd9z24Zm76sOurJV1GkmJYnOghGPUwK3CsCZZ0UYdDlXJAq4A/iS3L
 /bHv2/I1Rpnu7qH+VkA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_06,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210153

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
i2c_transfer() returns the number of messages successfully=0A=
transferred, not only a negative errno on failure. When called with=0A=
two messages (write command byte followed by a read of the 4-byte=0A=
response), a return value of 1 means the command write succeeded but=0A=
the read did not complete. In that case, rspbuf remains uninitialized=0A=
and must not be interpreted as valid data.=0A=
=0A=
Treat any return value other than ARRAY_SIZE(msg) as an error, and=0A=
return -EIO for partial completion. Also return 0 on success instead=0A=
of the message count, since the caller only needs to distinguish=0A=
success from failure.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v6:=0A=
- No changes to this patch in this version.=0A=
=0A=
v5:=0A=
- New patch in the series. Fixes a pre-existing bug where partial=0A=
  i2c_transfer() returns left rspbuf uninitialized.=0A=
---=0A=
 drivers/hwmon/pmbus/max31785.c | 6 +++---=0A=
 1 file changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.=
c=0A=
index 260aa8fb50f13..3caa76bcbeb5e 100644=0A=
--- a/drivers/hwmon/pmbus/max31785.c=0A=
+++ b/drivers/hwmon/pmbus/max31785.c=0A=
@@ -141,13 +141,13 @@ static int max31785_read_long_data(struct i2c_client =
*client, int page,=0A=
 	 */=0A=
 	pmbus_update_ts(client, 0);=0A=
 =0A=
-	if (rc < 0)=0A=
-		return rc;=0A=
+	if (rc !=3D ARRAY_SIZE(msg))=0A=
+		return rc < 0 ? rc : -EIO;=0A=
 =0A=
 	*data =3D (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |=0A=
 		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));=0A=
 =0A=
-	return rc;=0A=
+	return 0;=0A=
 }=0A=
 =0A=
 static int max31785_get_pwm(struct i2c_client *client, int page)=0A=
-- =0A=
2.34.1=0A=
=0A=
