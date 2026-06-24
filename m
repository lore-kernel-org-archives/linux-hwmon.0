Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EBA3B2FFD
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 22:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.151.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340600; cv=none; b=RNQ9h9btatM8kOIbnEXkmwhyolruEqQS8dGCsAdhJeP5eYASgBCGOohwsO92pSlBZmcxAoO7eml0V0UsH0oUm2YuBFOfVKBLvw3tOTJ4T/p7iFTlwhRYrQ5/9HsKRYthnELOrWWoF6dQDK6vYMaLMpACTN7NnWkrK1Bker1x5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340600; c=relaxed/simple;
	bh=rgJQZ8PAbd0vkv+8AgmlvytfHtU5yfhiYhlHHWZ55qc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=FqTGzT9lxoWC5NNcU4zhOOa6lqZqE+UvZxQ76K6ta+7hjyFlvNXy9E3LOLGsmvnuDIepKNFBXcZ4p9IxQXNO253NQ7xEi6JB34bQXWD8H3BGNA3xhUHy397iwdwG6vh4hgqqhVKLAhNWA+PTicmS0uW1FEaAy7aF13ePe/Cvt94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com; spf=pass smtp.mailfrom=onsemi.com; dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b=Svcc08H+; arc=none smtp.client-ip=170.10.151.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b="Svcc08H+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1782340593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6r0s+CJ4U8f53sUVzzTFTFQ/7L3S5IrQSY7l5X44Glg=;
	b=Svcc08H+EiwCvJSZYcNyYz7cnkqgA4K5gNFCNnCLhnZXFXdczqROVdlcOfLGbeocaliu87
	v/Zqg/uScjwcePYuReubw5BA8+THSkHNGI66UnfXiUZK3t38wWR85vl+x8OdLJEWMH6rUM
	pARV8d9WFGvAFzMF2KNLBKraFIioWvxmnP9XgxM0+2KEeH4mlQH6aHrcwva9vfMyzTELqB
	9d+jrR65Id6sIuAAYwYp6Nny8UQ3jJ0XgkirG10nqmejqdALl3uuC6CoW6cQY4PgipwydQ
	GVNRqnk4MrfktW+fazhibNq7bbjLV6qAyGlxyBJAJnwN8bhadg3h/z0W+CSIaA==
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-51-XYtZdcT0NFG7cFQrb2VBiw-1; Wed,
 24 Jun 2026 15:36:25 -0700
X-MC-Unique: XYtZdcT0NFG7cFQrb2VBiw-1
X-Mimecast-MFC-AGG-ID: XYtZdcT0NFG7cFQrb2VBiw_1782340585
Received: from CYYPR02MB9828.namprd02.prod.outlook.com (2603:10b6:930:b8::20)
 by SJ0PR02MB8401.namprd02.prod.outlook.com (2603:10b6:a03:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 22:36:21 +0000
Received: from CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca]) by CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca%4]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 22:36:20 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Conor Dooley <conor@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Thread-Topic: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Thread-Index: AQHdAtUG0MJr3kYk70C0stjgUT+1+7ZMZ+AAgAA2+5CAAAYPAIABpgGw
Date: Wed, 24 Jun 2026 22:36:20 +0000
Message-ID: <CYYPR02MB9828EECB3F6AFDD2A7BD3E9B83ED2@CYYPR02MB9828.namprd02.prod.outlook.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
 <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <20260623-scared-judgingly-7efc1c188670@spud>
In-Reply-To: <20260623-scared-judgingly-7efc1c188670@spud>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9828:EE_|SJ0PR02MB8401:EE_
x-ms-office365-filtering-correlation-id: a844558a-ac23-48de-7886-08ded241039b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003
x-microsoft-antispam-message-info: 4uckDDwM/KvPmuQ5mmUykZs4NcDcctVakTLqg6NcP4uP8wtCh/U8OBL0DQCY4Sikju/G4lTZKXMW90lLCxryBLmcRNDZhdWhat66SLwhC+DwZ1Fhc5OWHdrnSZU08QUs4It9wn3Z0KtDXHFkwxMu1TIAw7HO5g8JniMVm/fnQY0SH+MO8gr0jPwf34eLTXjZNBQWEKimD9Pw4U1t4keSwDZ0vw/nuyAZJxWLphcHykW0LdqbJxg2IRxiN5Cp/c9KCia2ArRHZr7QQW7aV3pAVlK/qHXTr1YjYpIlpfOgAfW1ZUHdY4rS2KoQQwpUw6ktz2wVPdL/GG/y8zSf2bm9WgAwxBVGd448e0qo6N1sgrKRSNN/bpd7FswEHaexatkgKJjP8AGsyomlAfwBffnukCFyoSgKMpv7iTE45qyWf3EjEG5NDduBSV+QYkPVW9rIiGl/9rwhXQy1dbzp+cHS/Nz26ZfA/SWRUkGgBDBlk2o17CGr0na43Lx1OX5AeRFEJY3vg5VEHAfupKlNSE1DIx/CQ/JKQSBH3GrOLJ9Y45Txg8qSGuQo3WW7t9hjJ9SdaaWeoYFRHRQqieDb4Glqz5eOgAEp2lfYKNJqDd9RkpNZ/DPP26+TBBAb2kxH4vAWe8eMuicbpcW1/fhQRd7ShsJCwPXWXEcsJRJbPyCnbMXtrESWQ+LtZhXTyNcNXu5m06+C0Q9bbG+LWvnENOzhHsAyFLjPUROJjuSUHoDNoC8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9828.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JDR48QaphNGHmzVNosCPcHm259jjoEhiZr9DDFQZ+ooDRRscWG51E8r02cZ2?=
 =?us-ascii?Q?2ZZRd7w9ioXLdiheQS1Nco0yILx8ahBsm++MW+xbI8+KDV9sM9H7O/9RUS4M?=
 =?us-ascii?Q?7bOLIKPiee9+x4IH5rQqC8Pc/U5ClsyJIOReVQGKvmnXtTJhazgrAQbKU+Re?=
 =?us-ascii?Q?PxmMoYGXtKDFtLEHAN7dQEahFFuIDiW2l2Qn2P2aIAe649KNBXYK8ct7TnTz?=
 =?us-ascii?Q?WbulhoQ86Tj0+vkmJlFq4F1vS1BsXgw53iMgdRQPgMn3K/GPWnGfBo/5/sFH?=
 =?us-ascii?Q?/TJa1ujFdHNYwAKo0CoAW+6GkrxdXAPYZMggRW5jp2WcLGyQIzP44hWmyE0r?=
 =?us-ascii?Q?eBCR5Y36bF7w5rGOC+jdC/y/kP4br0r9fr0LaEG0Qc/UzcCVxZFiaezFDT7k?=
 =?us-ascii?Q?nylE5SYyTlO2hY3Z+401ON1/bJbX7Vj2LNMrz5g/Tx7++ZB60BdgJIeXd+hg?=
 =?us-ascii?Q?RWsWp4i9+RcSIqLqPXTL0zFZwVbZXHUTksiLQ59v7cSFCz+IOIYj3PHjSSSf?=
 =?us-ascii?Q?KG3WyOA2wgXTbV0jF38YUJdk00Ff3z4kQGLXS4ltEJSwk7XRO+xZFAktMfgK?=
 =?us-ascii?Q?evhgcv18604iCli52GkQIP5hRz0EuOi8TroxNzwTOONKkbxaVzMcvC0icckH?=
 =?us-ascii?Q?vedhOzEeHaN/TMC32uoqa73vJ74j0TJ6tUi25I5VCjWGfr9Z777MSPvJxQ6S?=
 =?us-ascii?Q?4xfb5VHrDnw/HIYF8KDUmBcYnYpgCVofFrru9GXZSofnn8jSeenqTXIhcjVa?=
 =?us-ascii?Q?o1azapANLG9rcUS/SDiCY+crNNdEQK/BWDl5AAZe2xw46c1yFhqGBcZMIidD?=
 =?us-ascii?Q?Hub0clTwAs9y1Lnz7lyQhIMPOVhcprT+Ryc77j77czX1QSTzElxugMBpvfip?=
 =?us-ascii?Q?vYGS8XTyV2WjSzNj0kDt3B311B/Kx8qXj2EIWT9ySEqp8X163IeSL83v8Pl/?=
 =?us-ascii?Q?1iokHqe3RLJLRhy+AvaTyUDzesVo3wfLA3VXTZ3cP+esA49CXWrxAcyK06x0?=
 =?us-ascii?Q?PPCnq+j//l7MXS5PTpVGSRSF64BgTPnUANJEJK0RAyRYwN7AG5AHWnoes8o7?=
 =?us-ascii?Q?tbWXWxqca3SajZY60YLb4G2HiLjIhXQAVXo+Nk8sg8Esao0/rEe0xwFh3cGe?=
 =?us-ascii?Q?NbsDx9wWZs8B4lWlrRb7KMX6rZXSHu9dfjO5UIdRVFU70mts67N6+WoAqIDc?=
 =?us-ascii?Q?mG2LXyznAZXgD7Phd/7O7Brdsqw2f86NZqtO90y0WUYevctmPq6aIlbg4Ik6?=
 =?us-ascii?Q?qIWnW5txM4tzUeMLqyvAh4qMt+LEoAy+/lJqEl1AGAfsb+6Lt/Up5CrMKCq1?=
 =?us-ascii?Q?DETwH72ftqYk/hvsMcGnJrlhCCX2cvLNl30ZwrH52sIYawmWIWlOp66vBaoZ?=
 =?us-ascii?Q?28Rms7QitgY+OXgnET1Qs1VoBCNV8/bE+YaV2ZJK+s3FaPr8twMPpYl0OuY+?=
 =?us-ascii?Q?lr46OBUyo8wJAQbQp5l82ZA7Mk/OIv8fTwG2tfzyCoDID2sV3rwj4zGrk2wS?=
 =?us-ascii?Q?YS/rRagF68/IWDcKCSHPSWop64uFcm36FI2k+zPuwCUwblFpEVOglztSlgxb?=
 =?us-ascii?Q?Mxo7bgGah2Qu2XY2rnZ29anPHOfifLy/rUlwNW0cbUtx/3N+mvxS3BfJ3bzh?=
 =?us-ascii?Q?PR+J8a8+9z58gW4i4rW7H+AafH6znsr4XdiJj1T4NaDdeArb5gN4yXloVrRO?=
 =?us-ascii?Q?iidV+zWS4ipzqQFVQ1+TIe9mRsHBsHEPu5K6D9l1vcaDlnZ+ad98g3BH+s5l?=
 =?us-ascii?Q?9A0T43EB3DJsUNnp9UNSaAcpyo1LGQ0=3D?=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jqFWS0NRsAUtroHs28tuAT32c6WxDs80LbhB06dQ1EECY029NpGD25NwSAKKE3pLl8ws+hOwTg3aBEbdCFh87CiGfXWGNyq7OV9wYEP/yuWCbQZEGqNYrF8FVkAJXDBqMHgbHyxNEcNGZI8yNHCccZ5p9Q9YZcwMjuaA1VjjbXXofkpGxm4YmD6hK+fU0OwQFJVH6Mvr+xZxGk9ZK1bpAHy2fzyPRbtsfyHG5fScasOS8PVwQJWfBucbvpyuCH70Wl23Rm/Jc0RrSpi87pKZ755KFS1ZR46DAOD4q5d7/p6IucUudXpGtgGPq882c/6Hq9+V8n4BEcZu5s3F6j6dSg==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9828.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a844558a-ac23-48de-7886-08ded241039b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 22:36:20.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5Be9VvFo2mh4ajh29Fyoa/YuZjHoLnV7f5JKQSUrzElTG/lmoKKLneVW/2hgerbjvfAaxoYE043lGKh0uws8XtFRHUY5ACH6l9rfPli148=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8401
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 59w1MBW2zmgFbBG9lnuiG3r2-Ooc_9MgHFqMHI9KJzI_1782340585
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's =
FD5121
>=20
>=20
> My point is that what's actually being controlled is missing. Maybe it
> is obvious to you, but it is not to me. Your nodename in your example is


You are right. This chip may not be a "controller" in the traditional sense=
 as it doesn't control anything.=20
We can change node naming to sensor or regulator so that it aligns with the=
 convention.


> > +      fd5121@50 {
> which doesn't comply with node naming requirements and I wanted to come
> up with a suggestion for what it should be.
> I am assuming that its power or voltage that you're controlling so
> either it should be hwmon@ or regulator@.
>=20

