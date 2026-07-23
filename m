Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199E37F8C6;
	Thu, 23 Jul 2026 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825073; cv=fail; b=CdtMX5R1ItVn8bV/zDxynpqBYJWfJ/NA76DgfCdGskI5I8iGbzhC9WMeZ7fEzorctiJE3xwiooW77uusp0X3TKu6TpC5rM8VomjNbW04FCe5yYLE4Tf0kJCGPJlR5NJCtOP2UWXTEaIxlpguT+TIAtsNWemL8zBzZsQ5zYGe5x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825073; c=relaxed/simple;
	bh=AqCu28IXCnKe9gYkekCnM7wBkIVH6I4lE2NDpo4bmcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lf6u1vlkEkoiCyWmLLH3gCsA5fNXjIVZaW6R/f2YRerdpV6IfOttbFOOmAtVmpzXkVTD0myOO7tuS8J46/I8/Fqz2+V4kN3U0CDxg/b53MfOT3hY6brA3DnPeRXIMRkU7f4FWm9xmltn9O4ja2s+Q5Mi0g0c0i2FvTpWDh2g6J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=NfcjG+Bt; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="NfcjG+Bt"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NFk3HF3448544;
	Thu, 23 Jul 2026 16:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Jl
	MRz2/bLAtMB9C4SBO2HXrgBiRs6Xc08ddoGjRLTuw=; b=NfcjG+Bt9ApHEvbLrO
	BCyQatc1EaQ/9A7xR+SW7HfJYXEEwnvzQX+OmIqpVRybt2takzFLuh0vKvUC3J6i
	/MUoCi583+oHYgrvvVPxGBVOU69ekn6Ynbvw6+qCR7vsG4FiA756erghGGFswZ0R
	EGrxYREX7xwdfZaJck4hoG2nx0iOrTFQ+YHpb+w/mWkHNouwN1QfkO1j8k5wfu1p
	DluXzRCZyY0Vw/uJ10gf9IJI5ztip11K98OAriWySRwRuviuw6AhtXT2pcV556fM
	buuzhxA559yP+HZCLdXgAYNebh6zGJMzi2l5OsA6zrYX7qMEOvtDuPX5alxrCvBv
	OdsQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fkng89g3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 16:44:12 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 30B3E805662;
	Thu, 23 Jul 2026 16:44:12 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:44:03 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:44:02 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 04:44:02 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 16:44:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0/WHbbQjp0DYsaGyI+XVMxXwMhdM4HnW4m8A+v/w9V+vCUgn379sZnGSWduEg9R62MD9TlS2lzXa3CZjJtcjk7U2NJgaOtHM9n1bOouvY0Ux+KkBBGrbnlYsmKbBfU3yMQBbQokr/AkTLyzxkiX+Bzrax1791ge3beGocSydz5P+lneorTHPk4WJM5SQVX8mPI8Jg57lH8yMNNcr/Kpi+4jUGzeaDqsu0P9gedB3UJluAjGKpHLsqx9Ajo3rWOVwe3jDbRLKkI1zrMzCCCrQ/r0vTkiKAedasoWoWY8nqBx2GblLTCgsZsX5pJIXjDtL5Qg6JXMSqv7mznhusG00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlMRz2/bLAtMB9C4SBO2HXrgBiRs6Xc08ddoGjRLTuw=;
 b=uaNNtTk+pBA2r2ykAseka7cxuA9T/dbdu7lEMQTvIuVmkqOjng85cxhZCtv8x4q14itn+XgdCSsuvEqVCYDcFg+jTGe8Ocbx6NCO8v3mpdMIkNeikLZvYnQu/b+T2p4fkd23CJL2RIxNsPAEH7R/AxhthXlIwngOLdoHm70AfgRgnsPGxWaUfIfVQNPkdQfjEyTGznoAa1wCq5MJmeQxJVQ7qRdlFIo1HEfi63WGF2fDScKhCgdRL88LXlWly6Obh5SM/enrxmLe1tT+jqKvNZyaDpSsAK3Els02JJ1ZpALXuYQhbZNv6dxyz8j45yOLGwgFVKj1bRvAQ+PB0ER0wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by CYXPR84MB3515.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:44:00 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:44:00 +0000
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
	<psanman@juniper.net>,
        Georgi Vlaev <gvlaev@juniper.net>,
        Dhruva Devineni
	<ddevineni@juniper.net>,
        Debjit Ghosh <dghosh@juniper.net>,
        "Jawahar Balaji
 Thirumalaisamy" <jawaharb@juniper.net>,
        Avadhut Naik <avadhutn@juniper.net>,
        Santhanakrishnan Balraj <sbalraj@juniper.net>,
        Brian Mak <makb@juniper.net>
Subject: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdGsJ2cSmLk2VFO0OlR+OxGumQZA==
Date: Thu, 23 Jul 2026 16:43:59 +0000
Message-ID: <20260723164249.199442-3-sanman.pradhan@hpe.com>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260723164249.199442-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|CYXPR84MB3515:EE_
x-ms-office365-filtering-correlation-id: c66791ea-064a-43bb-92c9-08dee8d998b1
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|6133799003|56012099006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: ZdvveePBFvwKIM3h3nR+0P6jbviUboRzCdCMNUXO+K1zu3xB+wWIZdtk1A8wiWcxg8V3imDdhTZBGEWF9pg7ErPcWRk7Dv/axqDTWNVIMr/7OYPA7VSdqbqrEhfor7c37SDl44ekoKtNbn29sCSrNT2aSC9E5SJoNtKTIR7SheCUzCfCqfsHnCtsPBNxuN7PzhGyCoB8hy4N+4JQWMm9ch5MHNGY9jm+RTxy8aUDvlYoBd15ANnRkQTdTl94Gc9qvmSYU5GaI1EGMoUQ1ceuZEV9UbeNlq6ZISuQQ322CZQP0sqG+ozkfPYWeLoHBpwMWx2RTuoGx+8nN+kI3cMNlgTmHoPIBME4d3wxCrdCi+a/2Z39iSRp7A/+CZPdiYvchG+EJi7P+T7hp7zR0C/Zp9pmsO2q7eZQVLsdNj3doPp+CG+OS+DusQTkTwmHwn10p8MdnWgAbLY2caGqDEpyWrKocWaseOBjj31EZOzUBhUaPtUFnVNMYpYpuRwgjTaa+OatiK3r3ab8/GHtErihyu43R7AoieuHcW2r2to8Qb7C7yYamhg/4iezf15NFjPbVxvrVq1NYxs4SaXoqfqMM479PhbFYIvXwCz52X/00MfyLCEFW3wcPv8Yt+GMcTUOVGLzv0DYk1BAUBN+etikeDeF/xO2d5Ro+Q+FU6mHZXwB3bWuM/0WURudE7x7b0gmO3xmT/jYTgRDBZ5nRMq9/2KcP0gXykVqhb1G5J+NAb8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?O+o8FiS11w8vJmrCiPSFGEdE3cmw9eJuUksczkEwJZom7no9IFQQ+j3qTC?=
 =?iso-8859-1?Q?d29q7Ar+YLS312ivj5sE1zn7ZVlA2feH3yHk44CKir/qalah1pF6vxcq0w?=
 =?iso-8859-1?Q?70WH5r7DRa9xHjFzB5aAF7GsWoCHxQOAuCP1rUF3KwVxhOBSLWpn8ydDvc?=
 =?iso-8859-1?Q?+T1r8nfrGz1xzI5uHxa6ozk4Q3LswNO6cWPuSmYwQ2IOTCobszr1PTWZSX?=
 =?iso-8859-1?Q?IP4pE0dQ7eUbgfuzrY/JzYYz6KtLcXZPLc45RKl7GYa4i0ENFt4klGNDVy?=
 =?iso-8859-1?Q?Ujh0TvpNt7yDgjwHauGZkxXsaPuVB5CDD332RL0byIJN6U8PNtp1TOJRF1?=
 =?iso-8859-1?Q?42u+Wrcxh/8bq9FWlKnftwhkNH97tc5Svrfzm8hozoyPToF0WlYujHi/yK?=
 =?iso-8859-1?Q?v8/qyRRkK88vh4AePTyPkCMR6N6/pk5vVcTk/u09ILn3EzZhPCciFCsUk/?=
 =?iso-8859-1?Q?bKA2us4L2gziegOfQlTx4FVlbUUvkAHNdFdcNH/o/dEtsldYtylN4SFW0W?=
 =?iso-8859-1?Q?NZTTSqCY0wbS1If2uLXdwClsSkGmx4ZataqNwowYRzf4Gh4CidIvhkVHL1?=
 =?iso-8859-1?Q?MQQ5YkFOVHWoTjiFYbLybUUbfWqfh6PqzVL4ZdX8U8HwGLL17wKE/JcyE7?=
 =?iso-8859-1?Q?tKUeqmJZymu8zf/EPlK2KIxFMRWNgHLHfgvW9HbLuEM0Pex6w52slSIYV/?=
 =?iso-8859-1?Q?MoTolKHfNfT+WANhLLYUl5M10KVhmhd1yjTTlJa+l7Ncdfv4fDsoj8vb/Q?=
 =?iso-8859-1?Q?Jqb+qD1Edng51uSgFOR1wXKdv+lSEVbYuo+JRXmclN/OoXlb1wP0i41Q0w?=
 =?iso-8859-1?Q?07l/qLQGxwcdA9gc2gS3pITkI0MU0HF4vahcENNizXTFujNqhbnWiq4qAM?=
 =?iso-8859-1?Q?NEoepo71HVvHxn2ckB1W8xD8L0MZ0YRb3l6aMf6VNcPNPcgAZ6+G7g8oNl?=
 =?iso-8859-1?Q?s+1aT8fqhJDQ5jN569Gvgk2LQlxMTbekiI6qdZnOwzlmevTamN1sLvnNKq?=
 =?iso-8859-1?Q?27IGdo452zWJ9zjfZTjJCQ4FN6DCNFNf+Hzf6DRruaBDNwFFZcaTujoGfi?=
 =?iso-8859-1?Q?+5ipdrBQQDAc5mCExH1xyg9zMn3TYlxLhbWJOPfO/G/VQSidEMXyZmNEse?=
 =?iso-8859-1?Q?GDrnb0j0X7SSFhHR3k103fZoGfMDPKlUmPfzxiEowbewuR0zfrr6xcBr0T?=
 =?iso-8859-1?Q?yc3lyGpaD8QuNlHRS+v9FN6xUEUkhFl2rh7dyUsxpqhFvQWGT2P3NcD01a?=
 =?iso-8859-1?Q?qMOMC5THW1rR4XGN442rHVHjQ03DM5tNYJTlk44b6G35O5P2sXVlR4uYOx?=
 =?iso-8859-1?Q?26rMbjulMXrvup6w1wKV2Z2HUloy4Z1cGwXIQRW3VHb1H3MQqhf8FjJXEh?=
 =?iso-8859-1?Q?CmX9SN1qsZJltkLjkSCfTjJWlAOmAsH677MIC2wWxk32sShlt+7E46zsrs?=
 =?iso-8859-1?Q?nhe/OQi8d7YWIuiCUKvW0dBkFCwiZ7iGdREn0Ondoo3zeTEvFB4SJ2J1in?=
 =?iso-8859-1?Q?VkPtkOKQBIz1G+DJ7H8Rvkn7nGlMxZJlLCyCfX43JX+ZitNsVWgxfY3fvb?=
 =?iso-8859-1?Q?cWo/bq3bk7nuITAG1UXWuZiMnpHBfg6h8WynOCoobLZRUGy1fucIf5E76T?=
 =?iso-8859-1?Q?veHhBU3mrjSvpGIQEcUg9gn3iukBLOxjhyoSPHnvLQvb/aeORitQh8+kQW?=
 =?iso-8859-1?Q?E4LfyzZWObnRqxkuBcQakID7ei/6QVulbkYFA7WxcAcU7Cb4QkpQejur15?=
 =?iso-8859-1?Q?DBGnjyyRKzEnM4/ohUC3A8w6/P7tbeTK0zNb7/icm1nX3j?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FLOVfmYZ5BscKy5+c0nzEfUHFtkUa4KFCiPQ/LxNk4pFtpaKnfSJrtBYGFZtCTmibJ6x2AVYKKTxsfLYdwPZsGz0wSg0iEtYtclhfJLs3KY7paW7q2UDbO2cOtRpzAl3occCgfLUlvZEiU9SjrfzoqWRSN6fwgTZZuCn1miv89RmDqAXRbjyXU1DsN6Np+T7cAZEjIU21QtO02v5bDSSw6sgAGOLlAl7ndGl7sQdvP2c9fGsm9P2tRu/arzxLV7NZ0Tqq9zuAdN4OlpU6FS+IyNH+5WhaZeO/GkwYkjKiJc6Jn/nQJBKmE6hpoynEqECyWKop1y0w60tmFR/A7U38Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c66791ea-064a-43bb-92c9-08dee8d998b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 16:43:59.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KsJxL6MLCpwm4MbfgvkCFICJdGJkoaNZZEto5oHX6/VE4WdN/paTqZlJXQanVuxRAWzcMdheXtwWElvbMUCGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3515
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: dC98gjHQYEyLRTyzZawJk8I-mavwB6KI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfX0hqHqHoesgMk
 3hOW8IWrynpbTzUVvaq5Jms117Nx+M9scUhA4QYgAUP/XxichunRX6o4+l3staFvSf3SNUq1ix2
 r9lzxwP9wPHdyS4+KCVIKIaZfIztKnwoQxBulBappL5pbxbeqNlrnq363pca50ME7N2FarO8odb
 avHqORe9o4+CsIr4AAvCgcSN80qNxEXK5N4fz4VEtCIVA5OeDtn7EHXCcmwKnlkFXKUkueTkw6D
 evZy/T6geDaZ30NVNyCsMEr6Nii8ehLaiZ+C5lx8K6xwXmZT43ZoOmD0IrxwWmdT6l+SU1f5q6L
 /u8d0vrd4FrJ0y24LHYLRIh1t5keGoN84/nv4rXqT9mH1j3OYVRfRIY08jpMisfjWRcFppdyy6Z
 NHo8vRx1ie1aCCWzrYlB75Qf/+zTKn9Hv9RyzEU0qLwVQgbA0NlRjkrPZMlcMQf2QAAY5BDJzho
 24S3fISzo+8m1/by4Eg==
X-Proofpoint-ORIG-GUID: bN-NkSmvkII4Gm7AWK5G2o8BjVhf8u7q
X-Authority-Analysis: v=2.4 cv=Ibm3n2qa c=1 sm=1 tr=0 ts=6a6244dd cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22
 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=VwQbUJbxAAAA:8 a=EprCN7UrAAAA:8
 a=4msjFyqVbehHPNB7FIMA:9 a=wPNLvfGTeEIA:10 a=cAcMbU7R10T-QSRYIcO_:22
 a=HCbi7XInCiJmNhJA85EG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfX1cuBSAWv+5Qy
 uhegVlw8+bvYEe0FSTDKW0byfsFXJgT4T8dWywcwIrro9PQ+DAIp/d65yFeJardFIvGmz7m3teq
 Texsy4/J0patv9oQJ26hjvSyz3saKYE=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230163

From: Georgi Vlaev <gvlaev@juniper.net>=0A=
=0A=
Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the=0A=
Volterra VT7505 controllers. The driver reports input/output voltage,=0A=
input/output current, input power and temperature over PMBus. All values=0A=
use the direct data format. Peak input voltage, output voltage, output=0A=
current, input power and temperature readings are exposed and can be=0A=
reset.=0A=
=0A=
The reported current and power depend on the external current-report=0A=
resistor connected to the ILOAD pin, which can be provided through the=0A=
"adi,rload-ohms" device tree property.=0A=
=0A=
Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>=0A=
Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>=0A=
Signed-off-by: Dhruva Devineni <ddevineni@juniper.net>=0A=
Co-developed-by: Debjit Ghosh <dghosh@juniper.net>=0A=
Signed-off-by: Debjit Ghosh <dghosh@juniper.net>=0A=
Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>=0A=
Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>=0A=
Co-developed-by: Avadhut Naik <avadhutn@juniper.net>=0A=
Signed-off-by: Avadhut Naik <avadhutn@juniper.net>=0A=
Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>=0A=
Signed-off-by: Santhanakrishnan Balraj <sbalraj@juniper.net>=0A=
Co-developed-by: Brian Mak <makb@juniper.net>=0A=
Signed-off-by: Brian Mak <makb@juniper.net>=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes in v2:=0A=
- Map the microsecond adi,ocp-severe-filter-us value to the=0A=
  MFR_CONFIG[15:14] register field.=0A=
=0A=
 Documentation/hwmon/index.rst  |   1 +=0A=
 Documentation/hwmon/vt7505.rst |  89 +++++++++++=0A=
 MAINTAINERS                    |   8 +=0A=
 drivers/hwmon/pmbus/Kconfig    |   9 ++=0A=
 drivers/hwmon/pmbus/Makefile   |   1 +=0A=
 drivers/hwmon/pmbus/vt7505.c   | 274 +++++++++++++++++++++++++++++++++=0A=
 6 files changed, 382 insertions(+)=0A=
 create mode 100644 Documentation/hwmon/vt7505.rst=0A=
 create mode 100644 drivers/hwmon/pmbus/vt7505.c=0A=
=0A=
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst=
=0A=
index 956f3da0b722..62687bb994ac 100644=0A=
--- a/Documentation/hwmon/index.rst=0A=
+++ b/Documentation/hwmon/index.rst=0A=
@@ -281,6 +281,7 @@ Hardware Monitoring Kernel Drivers=0A=
    vexpress=0A=
    via686a=0A=
    vt1211=0A=
+   vt7505=0A=
    w83627ehf=0A=
    w83627hf=0A=
    w83773g=0A=
diff --git a/Documentation/hwmon/vt7505.rst b/Documentation/hwmon/vt7505.rs=
t=0A=
new file mode 100644=0A=
index 000000000000..e56dc0055e89=0A=
--- /dev/null=0A=
+++ b/Documentation/hwmon/vt7505.rst=0A=
@@ -0,0 +1,89 @@=0A=
+.. SPDX-License-Identifier: GPL-2.0=0A=
+=0A=
+Kernel driver vt7505=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+Supported chips:=0A=
+=0A=
+  * Analog Devices MAX16545=0A=
+=0A=
+    Prefix: 'max16545'=0A=
+=0A=
+    Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/max16545b-max16545c.pdf=0A=
+=0A=
+  * Analog Devices MAX16550=0A=
+=0A=
+    Prefix: 'max16550'=0A=
+=0A=
+    Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/max16550.pdf=0A=
+=0A=
+  * Volterra VT7505=0A=
+=0A=
+    Prefix: 'vt7505'=0A=
+=0A=
+    Datasheet: Not publicly available; register-compatible with the MAX165=
45.=0A=
+=0A=
+Author: Georgi Vlaev <gvlaev@juniper.net>=0A=
+=0A=
+Description=0A=
+-----------=0A=
+=0A=
+This driver supports hardware monitoring for the Analog Devices MAX16545 a=
nd=0A=
+MAX16550, and the Volterra VT7505 PMBus controllers.=0A=
+=0A=
+The devices report input and output voltage, input and output current,=0A=
+input power, and temperature. All values use the PMBus direct data format.=
=0A=
+Peak (maximum) values for input voltage, output voltage, output current,=
=0A=
+input power and temperature are exposed and can be reset. Writing to any=
=0A=
+``*_reset_history`` attribute clears all of the device's peak values.=0A=
+=0A=
+The reported current and power values depend on the resistance of the=0A=
+external current-report resistor connected between the ILOAD pin and=0A=
+ground. This resistance can be provided via the ``adi,rload-ohms``=0A=
+device tree property; a default of 4750 ohms is used when it is absent.=0A=
+=0A=
+Sysfs entries=0A=
+-------------=0A=
+=0A=
+The limit and alarm attributes are created by the PMBus core for the limit=
=0A=
+registers that the device implements. See=0A=
+Documentation/hwmon/sysfs-interface.rst for the meaning of each attribute.=
=0A=
+=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
+in1_label               "vin"=0A=
+in1_input               Measured input voltage.=0A=
+in1_min                 Input undervoltage warning limit.=0A=
+in1_min_alarm           Input undervoltage warning alarm.=0A=
+in1_lcrit               Input undervoltage fault limit.=0A=
+in1_lcrit_alarm         Input undervoltage fault alarm.=0A=
+in1_highest             Historical maximum input voltage.=0A=
+in1_reset_history       Write to reset all peak values.=0A=
+in2_label               "vout1"=0A=
+in2_input               Measured output voltage.=0A=
+in2_min                 Output undervoltage warning limit.=0A=
+in2_min_alarm           Output undervoltage warning alarm.=0A=
+in2_highest             Historical maximum output voltage.=0A=
+in2_reset_history       Write to reset all peak values.=0A=
+curr1_label             "iin"=0A=
+curr1_input             Measured input current.=0A=
+curr1_alarm             Input current alarm.=0A=
+curr2_label             "iout1"=0A=
+curr2_input             Measured output current.=0A=
+curr2_max               Output overcurrent warning limit.=0A=
+curr2_max_alarm         Output overcurrent warning alarm.=0A=
+curr2_highest           Historical maximum output current.=0A=
+curr2_reset_history     Write to reset all peak values.=0A=
+power1_label            "pin"=0A=
+power1_input            Measured input power.=0A=
+power1_max              Input overpower warning limit.=0A=
+power1_alarm            Input overpower warning alarm.=0A=
+power1_input_highest    Historical maximum input power.=0A=
+power1_reset_history    Write to reset all peak values.=0A=
+temp1_input             Measured temperature.=0A=
+temp1_max               Overtemperature warning limit.=0A=
+temp1_max_alarm         Overtemperature warning alarm.=0A=
+temp1_crit              Overtemperature fault limit.=0A=
+temp1_crit_alarm        Overtemperature fault alarm.=0A=
+temp1_highest           Historical maximum temperature.=0A=
+temp1_reset_history     Write to reset all peak values.=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index d88c0dd4c814..b914aafb8514 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -28958,6 +28958,14 @@ S:	Maintained=0A=
 F:	Documentation/hwmon/vt1211.rst=0A=
 F:	drivers/hwmon/vt1211.c=0A=
 =0A=
+VT7505 HARDWARE MONITOR DRIVER=0A=
+M:	Sanman Pradhan <psanman@juniper.net>=0A=
+L:	linux-hwmon@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
+F:	Documentation/hwmon/vt7505.rst=0A=
+F:	drivers/hwmon/pmbus/vt7505.c=0A=
+=0A=
 VT8231 HARDWARE MONITOR DRIVER=0A=
 M:	Roger Lucas <vt8231@hiddenengine.co.uk>=0A=
 L:	linux-hwmon@vger.kernel.org=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index ca312be58ed5..6c97a6dc88a5 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
+++ b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -795,6 +795,15 @@ config SENSORS_UCD9200=0A=
 	  This driver can also be built as a module. If so, the module will=0A=
 	  be called ucd9200.=0A=
 =0A=
+config SENSORS_VT7505=0A=
+	tristate "Analog Devices MAX16545, MAX16550 and Volterra VT7505"=0A=
+	help=0A=
+	  If you say yes here you get hardware monitoring support for Analog=0A=
+	  Devices MAX16545, MAX16550 and Volterra VT7505 PMBus controllers.=0A=
+=0A=
+	  This driver can also be built as a module. If so, the module will=0A=
+	  be called vt7505.=0A=
+=0A=
 config SENSORS_XDP710=0A=
 	tristate "Infineon XDP710 family"=0A=
 	help=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index 080d366809f3..daa4b49bc90f 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
+++ b/drivers/hwmon/pmbus/Makefile=0A=
@@ -75,6 +75,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679.o=0A=
 obj-$(CONFIG_SENSORS_TPS546D24)	+=3D tps546d24.o=0A=
 obj-$(CONFIG_SENSORS_UCD9000)	+=3D ucd9000.o=0A=
 obj-$(CONFIG_SENSORS_UCD9200)	+=3D ucd9200.o=0A=
+obj-$(CONFIG_SENSORS_VT7505)	+=3D vt7505.o=0A=
 obj-$(CONFIG_SENSORS_XDP710)	+=3D xdp710.o=0A=
 obj-$(CONFIG_SENSORS_XDP720)	+=3D xdp720.o=0A=
 obj-$(CONFIG_SENSORS_XDPE122)	+=3D xdpe12284.o=0A=
diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c=0A=
new file mode 100644=0A=
index 000000000000..a96abf75b1aa=0A=
--- /dev/null=0A=
+++ b/drivers/hwmon/pmbus/vt7505.c=0A=
@@ -0,0 +1,274 @@=0A=
+// SPDX-License-Identifier: GPL-2.0-or-later=0A=
+/*=0A=
+ * Hardware monitoring driver for Analog Devices MAX16545/MAX16550 and=0A=
+ * Volterra VT7505 PMBus controllers.=0A=
+ *=0A=
+ * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Developmen=
t LP=0A=
+ */=0A=
+=0A=
+#include <linux/bitfield.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/of.h>=0A=
+#include <linux/pmbus.h>=0A=
+=0A=
+#include "pmbus.h"=0A=
+=0A=
+#define VT7505_MFR_CONFIG		0xd0=0A=
+#define VT7505_CFG_OCP_S_FILT_MASK	GENMASK(15, 14)=0A=
+=0A=
+#define VT7505_MFR_PEAK_VIN		0xd1=0A=
+#define VT7505_MFR_PEAK_IOUT		0xd2=0A=
+#define VT7505_MFR_PEAK_PIN		0xd3=0A=
+#define VT7505_MFR_PEAK_TEMP		0xd4=0A=
+#define VT7505_MFR_CLEAR_PEAKS		0xd5=0A=
+#define VT7505_MFR_PEAK_VOUT		0xfd=0A=
+=0A=
+#define VT7505_RLOAD_DEFAULT		4750=0A=
+=0A=
+enum chips { max16550, vt7505 };=0A=
+=0A=
+static int vt7505_read_word_data(struct i2c_client *client, int page,=0A=
+				 int phase, int reg)=0A=
+{=0A=
+	switch (reg) {=0A=
+	case PMBUS_VIRT_READ_VIN_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_VIN);=0A=
+	case PMBUS_VIRT_READ_IOUT_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_IOUT);=0A=
+	case PMBUS_VIRT_READ_PIN_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_PIN);=0A=
+	case PMBUS_VIRT_READ_TEMP_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_TEMP);=0A=
+	case PMBUS_VIRT_READ_VOUT_MAX:=0A=
+		return pmbus_read_word_data(client, page, phase,=0A=
+					    VT7505_MFR_PEAK_VOUT);=0A=
+	case PMBUS_VIRT_RESET_VIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_PIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:=0A=
+		return 0;=0A=
+	default:=0A=
+		return -ENODATA;=0A=
+	}=0A=
+}=0A=
+=0A=
+static int vt7505_write_word_data(struct i2c_client *client, int page,=0A=
+				  int reg, u16 word)=0A=
+{=0A=
+	switch (reg) {=0A=
+	/*=0A=
+	 * A single reset command clears all peak values. CLEAR_PEAKS is a=0A=
+	 * send-byte command; the device NAKs a word or byte-data write to it.=0A=
+	 */=0A=
+	case PMBUS_VIRT_RESET_VIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_IOUT_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_PIN_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:=0A=
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:=0A=
+		return pmbus_write_byte(client, page,=0A=
+					VT7505_MFR_CLEAR_PEAKS);=0A=
+	default:=0A=
+		return -ENODATA;=0A=
+	}=0A=
+}=0A=
+=0A=
+/*=0A=
+ * None of these controllers implement the standard PMBus WRITE_PROTECT=0A=
+ * (0x10) register, so tell the core not to access it.=0A=
+ */=0A=
+static struct pmbus_platform_data vt7505_pdata =3D {=0A=
+	.flags =3D PMBUS_NO_WRITE_PROTECT,=0A=
+};=0A=
+=0A=
+static int vt7505_set_ocp_filter(struct i2c_client *client)=0A=
+{=0A=
+	u32 ocp_us;=0A=
+	u8 field;=0A=
+	int ret;=0A=
+	u16 word;=0A=
+=0A=
+	if (of_property_read_u32(client->dev.of_node, "adi,ocp-severe-filter-us",=
=0A=
+				 &ocp_us))=0A=
+		return 0;=0A=
+=0A=
+	switch (ocp_us) {=0A=
+	case 0:=0A=
+		field =3D 0;=0A=
+		break;=0A=
+	case 1:=0A=
+		field =3D 1;=0A=
+		break;=0A=
+	case 2:=0A=
+		field =3D 2;=0A=
+		break;=0A=
+	case 10:=0A=
+		field =3D 3;=0A=
+		break;=0A=
+	default:=0A=
+		return dev_err_probe(&client->dev, -EINVAL,=0A=
+				     "invalid adi,ocp-severe-filter-us value %u\n",=0A=
+				     ocp_us);=0A=
+	}=0A=
+=0A=
+	ret =3D i2c_smbus_read_word_data(client, VT7505_MFR_CONFIG);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to read MFR_CONFIG\n");=0A=
+=0A=
+	word =3D ret & ~VT7505_CFG_OCP_S_FILT_MASK;=0A=
+	word |=3D FIELD_PREP(VT7505_CFG_OCP_S_FILT_MASK, field);=0A=
+=0A=
+	ret =3D i2c_smbus_write_word_data(client, VT7505_MFR_CONFIG, word);=0A=
+	if (ret < 0)=0A=
+		return dev_err_probe(&client->dev, ret,=0A=
+				     "failed to write MFR_CONFIG\n");=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static void vt7505_set_m(int *m, u32 rload)=0A=
+{=0A=
+	u64 val =3D (u64)*m * rload;=0A=
+=0A=
+	/* Make sure m fits the s32 type */=0A=
+	*m =3D DIV_ROUND_CLOSEST_ULL(val, 1000);=0A=
+}=0A=
+=0A=
+static int vt7505_probe(struct i2c_client *client)=0A=
+{=0A=
+	struct device *dev =3D &client->dev;=0A=
+	struct pmbus_driver_info *info;=0A=
+	enum chips chip;=0A=
+	u32 rload;=0A=
+	int ret;=0A=
+=0A=
+	chip =3D (enum chips)(unsigned long)i2c_get_match_data(client);=0A=
+=0A=
+	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);=0A=
+	if (!info)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	dev->platform_data =3D &vt7505_pdata;=0A=
+=0A=
+	/*=0A=
+	 * The m coefficient used in the direct-format current and power=0A=
+	 * calculations depends on RLOAD, the external current-report resistor=0A=
+	 * connected between the ILOAD pin and ground. Use the default value if=
=0A=
+	 * none is specified.=0A=
+	 */=0A=
+	if (of_property_read_u32(dev->of_node, "adi,rload-ohms", &rload))=0A=
+		rload =3D VT7505_RLOAD_DEFAULT;=0A=
+=0A=
+	if (!rload)=0A=
+		return dev_err_probe(dev, -EINVAL,=0A=
+				     "adi,rload-ohms must be non-zero\n");=0A=
+=0A=
+	info->pages =3D 1;=0A=
+	info->read_word_data =3D vt7505_read_word_data;=0A=
+	info->write_word_data =3D vt7505_write_word_data;=0A=
+=0A=
+	info->format[PSC_VOLTAGE_IN] =3D direct;=0A=
+	info->format[PSC_VOLTAGE_OUT] =3D direct;=0A=
+	info->format[PSC_CURRENT_IN] =3D direct;=0A=
+	info->format[PSC_CURRENT_OUT] =3D direct;=0A=
+	info->format[PSC_POWER] =3D direct;=0A=
+	info->format[PSC_TEMPERATURE] =3D direct;=0A=
+=0A=
+	/*=0A=
+	 * Direct data format coefficients from the device datasheet ("PMBus=0A=
+	 * Equation Parameters"). The current and power m coefficients scale=0A=
+	 * with RLOAD; vt7505_set_m() applies the 1/1000 factor below, giving=0A=
+	 * m =3D 3.824 * RLOAD for current and 0.895 * RLOAD for power. The=0A=
+	 * temperature coefficients are chip specific (see the switch below).=0A=
+	 */=0A=
+	info->m[PSC_VOLTAGE_IN] =3D 7578;=0A=
+	info->R[PSC_VOLTAGE_IN] =3D -2;=0A=
+	info->m[PSC_VOLTAGE_OUT] =3D 7578;=0A=
+	info->R[PSC_VOLTAGE_OUT] =3D -2;=0A=
+	info->m[PSC_CURRENT_IN] =3D 3824;=0A=
+	info->b[PSC_CURRENT_IN] =3D -4300;=0A=
+	info->R[PSC_CURRENT_IN] =3D -3;=0A=
+	info->m[PSC_CURRENT_OUT] =3D 3824;=0A=
+	info->b[PSC_CURRENT_OUT] =3D -4300;=0A=
+	info->R[PSC_CURRENT_OUT] =3D -3;=0A=
+	info->m[PSC_POWER] =3D 895;=0A=
+	info->b[PSC_POWER] =3D -9100;=0A=
+	info->R[PSC_POWER] =3D -2;=0A=
+=0A=
+	vt7505_set_m(&info->m[PSC_CURRENT_IN], rload);=0A=
+	vt7505_set_m(&info->m[PSC_CURRENT_OUT], rload);=0A=
+	vt7505_set_m(&info->m[PSC_POWER], rload);=0A=
+=0A=
+	switch (chip) {=0A=
+	case max16550:=0A=
+		info->m[PSC_TEMPERATURE] =3D 199;=0A=
+		info->b[PSC_TEMPERATURE] =3D 7046;=0A=
+		info->R[PSC_TEMPERATURE] =3D -2;=0A=
+		break;=0A=
+	case vt7505:=0A=
+		info->m[PSC_TEMPERATURE] =3D 205;=0A=
+		info->b[PSC_TEMPERATURE] =3D 6545;=0A=
+		info->R[PSC_TEMPERATURE] =3D -2;=0A=
+		break;=0A=
+	default:=0A=
+		return -ENODEV;=0A=
+	}=0A=
+=0A=
+	info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |=0A=
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |=0A=
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |=0A=
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |=0A=
+			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN;=0A=
+=0A=
+	/*=0A=
+	 * The severe OCP deglitch filter is programmable on the MAX16550 and=0A=
+	 * the VT7505, but fixed on the MAX16545. The MAX16545 shares match data=
=0A=
+	 * with the VT7505 (its fallback compatible), so identify it by its=0A=
+	 * compatible string and skip the programming there.=0A=
+	 */=0A=
+	if (chip =3D=3D max16550 ||=0A=
+	    !of_device_is_compatible(dev->of_node, "adi,max16545")) {=0A=
+		ret =3D vt7505_set_ocp_filter(client);=0A=
+		if (ret)=0A=
+			return ret;=0A=
+	}=0A=
+=0A=
+	return pmbus_do_probe(client, info);=0A=
+}=0A=
+=0A=
+static const struct i2c_device_id vt7505_id[] =3D {=0A=
+	{ "max16545", vt7505 },=0A=
+	{ "max16550", max16550 },=0A=
+	{ "vt7505", vt7505 },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(i2c, vt7505_id);=0A=
+=0A=
+static const struct of_device_id vt7505_of_match[] =3D {=0A=
+	{ .compatible =3D "adi,max16550", .data =3D (void *)max16550 },=0A=
+	{ .compatible =3D "adi,vt7505", .data =3D (void *)vt7505 },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, vt7505_of_match);=0A=
+=0A=
+static struct i2c_driver vt7505_driver =3D {=0A=
+	.driver =3D {=0A=
+		.name =3D "vt7505",=0A=
+		.of_match_table =3D vt7505_of_match,=0A=
+	},=0A=
+	.probe =3D vt7505_probe,=0A=
+	.id_table =3D vt7505_id,=0A=
+};=0A=
+module_i2c_driver(vt7505_driver);=0A=
+=0A=
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");=0A=
+MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX16545/MAX16550 and =
Volterra VT7505");=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_IMPORT_NS("PMBUS");=0A=
-- =0A=
2.34.1=0A=
=0A=
