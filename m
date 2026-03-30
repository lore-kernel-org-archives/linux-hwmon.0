Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD43A4522;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886538; cv=fail; b=EzLeZTYJsDO8jdjps+qPTRFyv1JO2HDeETvcOPr6EwQnp14EdgRmByo0R9/17xiyvx5QAvYn2ZIq5A0UB5XTClMuXUAM7aEWeVu3t6YSPyLxRI+bloWCZIYUAyI08e3DvC/EZaDxaX8XqOhTSh3SCHB/73lsnV+0dDF3kQxc0bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886538; c=relaxed/simple;
	bh=rAB3aJKtHH5F1Z5jJvcVZ7Nch0iWL5va3psJwajGnEw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=quZ0OxLntDOsfauiHcYWhJN8ZIA9eb+l9e+hRIZHLpjaCgeHMvsEwYIBoXUYsLcThnERaMdrOu/ppbfXl9O6zCVeuIjKVmBa0jJP8JUXx2DtSHMYZvUxMNoJ4v/U/MBxJzK8hG8GBDdld0WVK3vbv4iSrlypBWGtaq1PyW9BqVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=l7T53nTa; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="l7T53nTa"
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEnSrs2076314;
	Mon, 30 Mar 2026 16:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=rA
	B3aJKtHH5F1Z5jJvcVZ7Nch0iWL5va3psJwajGnEw=; b=l7T53nTaljZCJYye3z
	FAplzpUScjyHSLx+68d/W9wyJdk0Wl1Fhab0K1ijeXWtvKyYjY/hrfT5IZCIlzX5
	FsBPJvr/E58RlQLCYKIRIKRN8e49Rz7av1Bjtpqcq967ObXyDEpG9Z/EXznnHx0j
	Jg7I8eG0wq6Mj2n1hFr3KPnBzTnzYVkHKfvURJpJRTDxzCB5rnOiptQZ+gtKyu5D
	m2Rfrubl4tsySE+LhWKcHXsp5BUCojqqghLKnFosMQ5fwhfsLQ+G8qgqxq4+4Guq
	2gafIRA9uKv/6qtao20sskK5P51sGnI1+t6d37PhCkk6/iB9GN/XqdWpqnZwFQvq
	lPmQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d7u93gw15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 16:01:46 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id EC602802BBB;
	Mon, 30 Mar 2026 16:01:25 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 30 Mar 2026 04:01:25 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 30 Mar 2026 04:01:25 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 30 Mar 2026 04:01:25 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 04:01:24 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnd3IKAaSxcOqTt6IOcWNPNZz/yVvrUD3COO1AE6aIVzzuaxaCRXpKetz3xXLKavpJ1+XWX68zzDJw7Vx6lIa1YX05UXvevQ/sLQt/j+mK1g7UJvUiZyuCp2yV1bk5o9cSM8N7zn7RrXz+TPwJ5xXeqOIH8lqVKsowg6C4h04PHUCjKIEMzmfJuKrqhknhtQ2IrJT6kqgzyWxP0Jiopbr6Xj1u/2mHpvPoNw44f41S/EvCBJFRGIXgeQav/qboDpGwXFQXAqsow4DrKe/cfJCrc/DPg467/MbdLSaNDVYvndtlcVNnHAbyW7tBkavgN0po+RoZU+CoiMXkZ6vTHrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAB3aJKtHH5F1Z5jJvcVZ7Nch0iWL5va3psJwajGnEw=;
 b=LCal4ZFVYnJ6lnZlOxFPb7v6/QwsIP8AIGx5PG+OwUJSgwFaekGgy6mJ4Jg8yy9UnHkNwRjhZUGJLPwI1lJmglOSHKH2VsPIAGk4sIDc8NmSnIVbTkCnXGxE7umOo7dGPp2i/dhz2QJBZXxKFtPTNvW847x3txHixOKpyoXBoJqeFkN0GdHVbjKAHYQcN/c/TfI1zODOlzxYmM6tya8zVPO4yS0wEXAy/mekL0dsd6L+cX68G1MmpMZqJMppSHAb9wjR02PpjRSeDXiULPKZ3FFpyrLS5cd1rhfXdmS4wHYxJ6SQ4lVevlFvE2LSo9u1IaIuWMAATtMVMKgHzNheQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV5PR84MB4003.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 16:01:23 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 16:01:22 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Topic: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Index: AQHcvXI4vvjQBfqWwkiz6FB1AZzrTrXFvdkAgAGEFoA=
Date: Mon, 30 Mar 2026 16:01:22 +0000
Message-ID: <20260330160105.78279-1-sanman.pradhan@hpe.com>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
 <20a29a60-6848-43cb-be2e-4e63c8602462@roeck-us.net>
In-Reply-To: <20a29a60-6848-43cb-be2e-4e63c8602462@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV5PR84MB4003:EE_
x-ms-office365-filtering-correlation-id: e5fc799c-0206-4931-989b-08de8e7596ee
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: AeZDe4wFKxbNBKtbxtJkcqQQ9+qgFgJ81jybGdTVh/H+FocB6YPZARf/MEYNuRz/bf+oWOTGagb4qOU5ZU979vS5rzrjU5vuEJ/8EZPFdj81QOLBjQqONweCElpQHZ16Q0wW56HcWi6LMjlOLSsu1BTzsJaySWNMQAo8WbCUA7eG49XNHCwQ+qmSIh7TlQ6E+WQNBPhvLENQ8PrNStttLDhX+xbc1Kb35hAMvAJ4X4C36Dc6FJ6G7BynlTHGu6WRhGdFL4l1cGVvBPVbMQdK3850RgPVd+UGbnU6LV+YEKWSKtf67pbm98KtNSgZfOtYj8zV5KNZfI/ByRCMyc3HawgMvCPYq4q+Y4M16eTgGdVY8B43y00GEqtdoBYn2xgE0MBkBbIe08Qux89XBKs1Q27It13RoO9DlWF/Zp5Oaxxka7nSW1udGHS3C6flasfNKjvcq2hmjBk8VdknsHBh8t6OZ0fHyUDkM6SNDXQiDZIrqqpnnMVRkQpzonBcihRUXiFgv+c/041kKiiOMqYXVLmAdmPIooRnsDKdhFvat86uK63RfNL6nVZwydfTQXhve7Ws5nFla/9o+3FdmOeyZ10Wgc3ssS3WHnDk2NTx+piR1LEAI0WuFJoAPWdoQR4HvY3/Pijm8FE+q8qDdHqSy/FrwWzws1hBarxt0AnR4DaFrmD2fVfD5MHcwvOwUP5OouYpa1mxc7v/TYQRzFKlI/bElmS/w8jlzRfpl9EKv0ehaFKfDSikO4TxeUEbwdirZo6JGE4NTeQEuC7JDA4qe4LlzOQblSkuZiIUDK9nlNY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Z14CDT0F5nRcNu9usLSSyx7wRMoFcVEAeSwtMEjUYJKDTNYDvsmEy7y0xQ?=
 =?iso-8859-1?Q?EPHn6YKMuuY7UYzd+4afkoqAuk0zkPusj1phgP/3VA2qqcHfWDBA3t7YJf?=
 =?iso-8859-1?Q?/CUC6oR6zUwEkwTprQZR2TfBcfAB8aqj5EzEftMyCV+s2r02j+eOHbGjj+?=
 =?iso-8859-1?Q?VxuWuO4fHmqasKaLzrWDQPki8/9rTFSifgZVlj+3WFg/s0y39YlNwl2I7n?=
 =?iso-8859-1?Q?yGR8M6oBbsfDMr5CQO9qghIPkthSIMX+RyjndtlwTa026UW0cMGYDxEsfv?=
 =?iso-8859-1?Q?/g8zeIiYc9W4dkS2K9VKQiRmbj17l80CzZ9CbOJeeml/VCspQQHecbldQw?=
 =?iso-8859-1?Q?F3WelHPEbU2VPQTbgUoOQDKIBv0wwgJDcAi6w9gTWZwaYfXwm/r7OI8mFf?=
 =?iso-8859-1?Q?38KI+h/8mAyfrBkgTH6es5AZ0pWj0sfpWgYXc1VX1Tmx3Vx+8fv3s60CvO?=
 =?iso-8859-1?Q?TQq3VZnPZzJ80uDOZk+GCMXoJ9ajj2STQd4JaH5jdoXiEJt5VyZtlIOI3B?=
 =?iso-8859-1?Q?hc13FvVjt9zqB2FYwwxblpG81pxRXLie13n4Tff0EuZncBX/xxxX1zpfK3?=
 =?iso-8859-1?Q?5/3FT+sVmZO4Tr0IWYf3s6a/R9O/BSx6yzGnUfhbE2AXbebXCg7P2bAtJl?=
 =?iso-8859-1?Q?Vv0AuBKyx1JQCy1FJRm3VdE88Y3w/bc0iAI74taF3hxLzz4Gv/+ZUdka3M?=
 =?iso-8859-1?Q?78LaCeQzpHD3fCBpl2HXfY1e09Hsd62ElgVeKayuYWDBUuGc/8e+Eks39j?=
 =?iso-8859-1?Q?YT38ZupV9ADihBAJYVberBf5eOyGi1mL4+nNZmK9A7VLgzwD+yyJOHod5k?=
 =?iso-8859-1?Q?lqVi0pf9b8GhmYzqOu51KgY2/FETxn5O4da4KUrMeoNSj8lgjWM3H0oR4l?=
 =?iso-8859-1?Q?YCw7UJpE8ZOhQLEl5yke5ZepqzMUaL3kekm2HMDkMVKRkxA/p1IDPwpg4d?=
 =?iso-8859-1?Q?pOSpurCcCtnBchf/jcwbHWuNN2U8NJl2kAUVVTTJA8ev+ARFmvu5eZNmF0?=
 =?iso-8859-1?Q?kBfZnBu2bBYwU4lssGFudVUchbQ9NjY3hAra+423rK7BPvnAw4DY69Aqrd?=
 =?iso-8859-1?Q?qb+4ugLD1xyGajwMVQ2UEdnjl4jd6pfxXsabyK1b4y0tosrbkhNd0G8ick?=
 =?iso-8859-1?Q?vg1nECgMlc2Fwsi9rAQeADHW74yQfkHyife6gEhQrPf5ftqtdNTJMyqpDT?=
 =?iso-8859-1?Q?K0OGUdO+9dHZ+b/i0xMJh1PABcQvjskPkURVE8TDrQztCIS56aktnN1scC?=
 =?iso-8859-1?Q?9D/pqD+39cnv3MeYjWwBxTHsXW1fd3RQ93YfypXV65vfl1cQm+nSKDRmky?=
 =?iso-8859-1?Q?1+263DsOhPkADLICDtPkvXY6GkQvR0+LJnC9YHlbU7O+cF70qN1X0+64UW?=
 =?iso-8859-1?Q?Yfz07Jr/CQQ/M6C7mlmSjhyBLseuqpm4Dp2dy9K4uGocZaW5mIspF5axDL?=
 =?iso-8859-1?Q?J0tjJ//GOyR9kb23dIhPYjKGwxcezOG3HnuG+lZrZO6vN43Z2qH5DvP2gY?=
 =?iso-8859-1?Q?ssMQen6Q/53qZpXeShzxZOITS5/5ruaUr9YPYNf82MK95adYNOyJKOwRrr?=
 =?iso-8859-1?Q?MIDA56s7Qu4HIgc12lwtUFRdik2LWmNBPBrYrsbi5LPinIm361vwnbStmY?=
 =?iso-8859-1?Q?kNEfKsAu6N53YYjcwoHGXNmiiPulDcbjJIEc9SWBlqoNpUXHBD7Wlx4fKb?=
 =?iso-8859-1?Q?TdD6KpWRvuMSDWxclzMXUOu1CyvxKNaU/EhQMq5ARtJ7eEfwIC0TTJ2Ds1?=
 =?iso-8859-1?Q?v4fpxefyWrIziTtY/+r282xO1sp1xs3YiLWbo2hUlh3bBK4J7Qc5qhvp9j?=
 =?iso-8859-1?Q?8ZIPkcjO9w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: coRfydnlxxfDQCB/hdxvYgkreOBpGTIWxGpePB6W7oDTw+BJMaP+FjmPiwlIOOGG2FM8elHAf2Kbdx/IGMftxDP1tylOLXn/ZRNopX/R/8+o+8eQ/978gWdPrq27QhG5hRfAzUqoXMQw+d3kUQxdfquM0SMQe0xDwSKE4v1jfb++lwUXBrFeftWG6jmDyVWEFlnyrU1X8imIdpyeJPSlo+RUpIhbnM9rg2RYBFfG9JrgiMhC1g4R96YLHxexBjtf8yjvE7fEANV5KE5f7aozDLy1EOemZJc5Ecd1diw45xuJQT/I3mQAfaqQSONU8zAYMGG2+HtMXCMzrUtr6y4tIQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fc799c-0206-4931-989b-08de8e7596ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 16:01:22.6567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMEteIwK3O0ntarHbhqU6TYAa/+EzhZ1eOx3nP6lsZu1l49Ixz4sHEXaInmw/VDQOEvhXRgKGC9zKxgF2qZOAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR84MB4003
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEyOCBTYWx0ZWRfXzOrSDjD9Z4pD
 lpvqW4C+EQbZ4DWNVUvWvaUCChF6Tt5SzVA5IZ9c75tBXHM2HgOiNzRh/SbZjocGxdZrVSHw7y7
 +7ah7N6hh5oVi0E6rq+6OU23jyf7IgumnHWCYh2+T4ezF7hEmkv6v83uHIAhmVLyh+kkbkPYZAY
 Zon6aJ6gymaon5G5i/ohwI1TGj8jxtyqLbAoSocUfEyViU8v1ojwLf18hltllRjbeEoOs3bBGGg
 /oHSXtJq7l4yPTc+M0BJiOkKprd0meQ67Uf8k44+0DA6S0zNsIeOtQL+aZbxJrCcNVlxsc+XJVS
 D6TkAW/lzdEFzMMSYWoDW2vn1g6F0dYaEMPu/dBL8PmsYPjCS5z++4sjBgsHDK8B11WjiGm0Afs
 IMyIOOaD/PNAHiDybz9iWHRVEVDtho/b5HrYMSBXRYoGBBHx1ql6XlfHvQWBNaZv6jnWc23I+PA
 fEA1Ky3BPMgIHLXphvw==
X-Proofpoint-ORIG-GUID: 7NmCFw-V12xQLfoEEd7HO6Huu6yLNmlL
X-Authority-Analysis: v=2.4 cv=Nr7cssdJ c=1 sm=1 tr=0 ts=69ca9e6a cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=k7r4yCLl9DVLXMiQTbtC:22
 a=OUXY8nFuAAAA:8 a=yimvwmQyh8FuCFiYe00A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: 7NmCFw-V12xQLfoEEd7HO6Huu6yLNmlL
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300128

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Thanks, for the review.=0A=
=0A=
The AI feedback seems valid on both counts, but both issues appear to be=0A=
pre-existing OCC driver problems rather than something introduced by my=0A=
patch.=0A=
=0A=
occ_shutdown() already holds occ->lock across=0A=
occ_shutdown_sysfs() and hwmon_device_unregister(), while OCC sysfs=0A=
callbacks can enter occ_active() / occ_update_response() and take=0A=
the same lock, so the deadlock concern looks real independent of my=0A=
reorder in p9_sbe_occ_remove().=0A=
=0A=
Also, the occ_active toggle path appears to have a lifetime problem:=0A=
activation allocates occ->attrs and occ->group.attrs with=0A=
devm_kcalloc(), while deactivation unregisters the hwmon device but=0A=
does not release or reuse those allocations.=0A=
=0A=
Given that, I'll drop patch 3 for now and resend patches 1 and 2=0A=
separately, then investigate the OCC teardown/activation issues.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
