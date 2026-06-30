Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304C53DB30A
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.151.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839606; cv=none; b=r30W+pV1scD+Ax85CnXPcxU+6bsa1zVk3PG2XpdibBQydbj++PSDvAYQCaHUsU3+mdgxRvidkkCtU0pBw0lDKNyoWfaQ2K9pLpwPc/JvvBVLiyoKaGT8xTFduQ8BmoHjeeFcM8I6khG4qe3/I56XS59ftuzguX7qIk5s0KRj3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839606; c=relaxed/simple;
	bh=m9TVrxcnxhO86FrvxHgEYfX9XQEO6Xu7u4U/yRG5r7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=qcJp6YqBxS0LwK++yqETDf0uiDrXsg1Os7ilP8vWf6/ddsZItQgtvq5QOmC3zHHMboYqTYa5gG6vTO6/E8gZ+/RZLy6otjXFO0lrvTqQCDxsqErN5r7UgQkGTVk4Rxi/+M0mXnmHVxNWccRQlpH466Z07pABEIkmUyB3APb3n40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com; spf=pass smtp.mailfrom=onsemi.com; dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b=dcdcLrqO; arc=none smtp.client-ip=170.10.151.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.b="dcdcLrqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1782839604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9TVrxcnxhO86FrvxHgEYfX9XQEO6Xu7u4U/yRG5r7w=;
	b=dcdcLrqOryWQ8raKhIQhorDkGbEdrj766BE8diJrVhq9CwRMLZOSGIxrbuWdwkTZinQxwy
	dEDd/rFidpI7zHmNMipeIxBm15xJzaVO7QXtDIztsUKiU7ybVIOtFIH1575qhMlNGPKWCV
	Jmgb6JU/Ok+/EaD/i/DFxWjfc7tRMtqpqxGeS+ycwxTOxBwb5+9UDbbQGxkVT1Q/uBN6d8
	1VkLujoGdlN2PnF8wr8RchOFZFgtEediZ8UGc7tWJbSU801uIbYxgDPa2tOKfhn4VOLem1
	anjo7oSERv2vrSE2rD06LBnTQETIGKnjkm5fLK1zj0qV0HR5KlShAH0xLUlzOg==
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-21-Irtr-vrlP9u8Rn29JVIcrQ-1; Tue,
 30 Jun 2026 10:13:21 -0700
X-MC-Unique: Irtr-vrlP9u8Rn29JVIcrQ-1
X-Mimecast-MFC-AGG-ID: Irtr-vrlP9u8Rn29JVIcrQ_1782839600
Received: from CYYPR02MB9828.namprd02.prod.outlook.com (2603:10b6:930:b8::20)
 by CYYPR02MB9761.namprd02.prod.outlook.com (2603:10b6:930:c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:13:19 +0000
Received: from CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca]) by CYYPR02MB9828.namprd02.prod.outlook.com
 ([fe80::2767:f7d2:778c:8dca%4]) with mapi id 15.21.0159.012; Tue, 30 Jun 2026
 17:13:13 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
CC: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123 and
 FD5125
Thread-Topic: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123
 and FD5125
Thread-Index: AQHdAtUEg1iU98CpwE61O70G8ttbHLZXWzyAgAAFy/A=
Date: Tue, 30 Jun 2026 17:13:13 +0000
Message-ID: <CYYPR02MB9828907FBC60D12DFD947EF383F72@CYYPR02MB9828.namprd02.prod.outlook.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-3-b31767689c65@onsemi.com>
 <akPy0zCESKoGgsF1@monoceros>
In-Reply-To: <akPy0zCESKoGgsF1@monoceros>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9828:EE_|CYYPR02MB9761:EE_
x-ms-office365-filtering-correlation-id: 8392d583-c178-4d45-50f5-08ded6cade4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021
x-microsoft-antispam-message-info: l0RsdMPMMeTmRnQtZM0JHWR7wCpgUiIr3kgeU7bz94R0mFk1JVwQ7UQCdWgFjU+kf7wxkJpmETMLBFCieNDqJkcFaf19HVvc1NEOo75QlZrp7u05RCtVgGFSIyONtyhWFZ5iNJ7ZxyUzBnDoneJAMvmORxBTcfCn7KC3vUT2ADOFPwEAI5fAhl/f1Qnswg8Bft9m0ImHDAOPxtkPfp/HUDOgakdmdH/3HDReC6NIsAGzkBvm2FU6HDIBX3/55IJZw6wKAgmUjluYoO4ce/x3VxJ3JgsV7cTcF71moo3OFl31OcI6TDeG3Mfx/NIUn86rgud+YurN2/82xq9qbt9jgAxpH2Le47FlGco8rhvrhxFhHKmH9Rqg94JjIeTWYhDcqGnrwIBd8EaMe0Ha8cnsBuVR+wrfS0n+HXnBiNdHMYOxcyy20hwcmwFHqkqndmmblntepQo94hfBbAZTnigSYEaqTBX/zuz04ZpLAq5ZTeQ3cZu4TTeykt5BHmZAz3TuT7v6Fy4R9ByuNL/YgzlgHw5PQzFP/8RxEJNjMskQfHMH6QaGLsNBCdTOUuYvobEN6VAVJyYBlf2tLuYQVzAeeMA6y7BwzGlDQBK1sqUbAVVeGUwVmneECN1dbPB5ezlR8YrXfjdrY9vSbXNBNluuyyL0m01EWkHeXp/yaznci7tzoVE7211TFEbv6w6N1sAKsA2sdpdL8COUXLALHKg7rYYUXjv3oCQtRI5NKOLYPO0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9828.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gNdi9LCRBFurJKSaZJ3QpTBXMFYkNLo0S1JroTVlxocbTZWsGfyBdOxspA?=
 =?iso-8859-1?Q?WR2mR/u7hIaEAGJtHE+1u+RMhruREorDvEfuk1ampiXeaqSYYBe9P9NHPh?=
 =?iso-8859-1?Q?wd7OmDDQqFOjA0Y4X7C9nW+ldF10Okrs0giNo1tOZ8W8j5K4MDFK4th2Bo?=
 =?iso-8859-1?Q?DRNy4rUJF2lxJadc1ieFohvTvHIyjVIhdINifbQi7v/92BfWrqIJEw10D+?=
 =?iso-8859-1?Q?7KHXwbTGDG14wD8zmcr8aaq88fT5pKvi1eE/0Ao6whvimaizpfD0Zuzh37?=
 =?iso-8859-1?Q?9mmP2pSOgvsiOq//z7Tts167NfSRXpYpDf2TdgMKIAiFGYqvpWdYbEmn0j?=
 =?iso-8859-1?Q?jxS1KQ/OyRavCdlqwRHHi7t8E4Tv5GUhAZ2ltsMH8wqKIrRv2IKjcEXnH9?=
 =?iso-8859-1?Q?TPu1BN08MrX1nBXlzTCWhQoJCO+70ZY3x6zRFk2zxq/hiO5JcVp/BVtk+J?=
 =?iso-8859-1?Q?r0USadW1r7Tkem80CebTU58pB90HOrB21mjpuPplH0LK/a9ldFXzsOtIPX?=
 =?iso-8859-1?Q?ob+JQkxF+c/dY57PV4xWv1OQG7YgPb8zi9hQHb5qCGKIQbauDQhMcHwWPJ?=
 =?iso-8859-1?Q?tqceBSYnERrvrW7xNgVVGPgKGpCdpNLWmEjd8IpQqC3Uo4yozHJfqr6UAX?=
 =?iso-8859-1?Q?zg4vgCwfrA1xpsikB6F9ZKjalNPqDmkj/kS/xTkOtSFMRwM2G8FkqvMgaa?=
 =?iso-8859-1?Q?mvDpnf+3HepMTR8/eQZWFgVFAQWLZ6EA3E0bn2EeEOyTm8zsxEUH2XY4g5?=
 =?iso-8859-1?Q?jJMdOV/oSsK6gsO1x2ligL455gKWv8mQ2sDvcbsbxiUrgDLL1OnwzVIr82?=
 =?iso-8859-1?Q?CtkmIq+vF26kqJ9U41Une7zyUawpgBJ8aYA6tC7lQ4rh6Z8DmPWRXT1VH+?=
 =?iso-8859-1?Q?U6Pt1Tq6wRErsotIFJEit2rYQoth4QFSzUZBxxMw9tcYeG52krZmx4oUzp?=
 =?iso-8859-1?Q?E389N1pLJ6FD3fU22VvHAOWYZKBMY5Iwzz5XuMmW/7Uswp4HLfftpjlBPL?=
 =?iso-8859-1?Q?3K497sETIgfligP+ZfIpNnCZkkwMNocVx9ivvu9yjHyoJv70HQnqdwo760?=
 =?iso-8859-1?Q?Yj6NpRM45O7h807FKtrYEQhrEldnDYFov2ndRW5Ik28Zbqs0RSeoadhjLJ?=
 =?iso-8859-1?Q?1g9YNXv+JiCdy5yegjhyGdCrLDViIX2n/eLo4RsdBoFeJsdXl6KYtske3x?=
 =?iso-8859-1?Q?aTD/4/xzNzCh7MYh+o4TbCnSaPtPHnOJQuGHbz1Do0xp/pCZuWh35vSatW?=
 =?iso-8859-1?Q?cllMhNcvbLZYVtRHkRIXDfq4UEZh6nvRgYwS7UxCAsKulo2VTxf2eL6h9i?=
 =?iso-8859-1?Q?OnZG5KsSCWM14h+wumGR6N5dJVoWbncNKGkMMv8tSxaP2BBRY1QE2r9bTy?=
 =?iso-8859-1?Q?/p5LpASaZvJy6h1N5Xuu6eKRCzjQtKE2u9JmupFr6aEL6A+XaTsf4aPaBz?=
 =?iso-8859-1?Q?AoiC9JhXmkn/y/9LNgJV+lnfosnsUt8U5uSMjc8pgRJ9uQe1jbmp1XiEkp?=
 =?iso-8859-1?Q?dlIsMYaKQN48tjRUTKC+X75Q+n+JgSTE73ndS+oMlQZ0Lb9x/5K31sADe2?=
 =?iso-8859-1?Q?LLnZyZ8LkY2Huhgoq19pc/UyyqGSOqXqH+BVVQ261rcotbBASAv6ZAmYQ3?=
 =?iso-8859-1?Q?jr/xI+4RdE6FNBxyS5dl9e7mVqDgLrTPooSmZ2brpr69rmC1sBLucQE3YW?=
 =?iso-8859-1?Q?WojIbnl0AO8D5dZg8UxWA2WFOL69lsc1MyaeDg/OJtX8LCri3DQyKa23ZC?=
 =?iso-8859-1?Q?QrYKIfpIcko98YIDsDPSS/jSiWy8bARphaypkSj/Ocz4cUCywEbdY1vhv1?=
 =?iso-8859-1?Q?8tT/bQim/aPoQGJ9KXhU6kQTky23kPw=3D?=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KujRT+zDU8QI6UbRgf0ilQfZLauFmkx14LHSrhMVY05vAPoQJk5cTVtClNtcbzhV0xEBmBVbUZ8QS1Dxnafur9vgkQuPBzA6BuBDWP/IKIMOGne4cADmobBnkAWpoMY9cmwwPeOkfqRx4OQbyH/FQIxb4pPWc3wQzRExhIH+pAu9oAJyM9fAxcAyxe8R7MmJTCrBbu7QEQjGQ26Bg8wp0hLhMaJ1X/qlXkjp69IvKWh5zJRqcmO/XiDL9F+FeWqLf37jmYG+TFg0tDlQiE5XbTDpewNQpYPHTnXgUYUDalKpf/UutGvaNwGlgFQNXdxm2cVdMtKXtviU9qvc7G1h5A==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9828.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8392d583-c178-4d45-50f5-08ded6cade4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 17:13:13.4305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbXemPLh4PaDGKJpf1XWG0URRSQqZ4t7MruKiCawzXxvJ+xOVHkm8Czt5ptDGXC4bRcVxdTdJY9O1G4jK/EkNSBqtvy0n/Rq66LsjbFcrDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR02MB9761
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h_8qUB-8-EKaqzw6GxLpEdq6f2m_rCoJ3xUS04isyKE_1782839600
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Sent: Tuesday, June 30, 2026 9:50 AM
> Subject: Re: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD512=
3 and
> FD5125
>=20
>=20
> Please make this:
>=20
> static const struct i2c_device_id fd5121_id[] =3D {
> { .name =3D "fd5121", .driver_data =3D chip_fd5121 },
> { .name =3D "fd5123", .driver_data =3D chip_fd5123 },
> { .name =3D "fd5125", .driver_data =3D chip_fd5125 },
> { }
> };
> MODULE_DEVICE_TABLE(i2c, fd5121_id);


Thank you.

>=20
>=20
> Best regards
> Uwe

