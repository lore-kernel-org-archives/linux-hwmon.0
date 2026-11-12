Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.152.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475148;
	b=i2l7LUp1wcclRBCOniy/E5s7amJtntBV6IOOLgAnzWk8lvY2pVFApDXGbzjVmNMWTYg4
	 gpze7F0bTuE7Kt9pRFGeO0mcdNH8xnqxK7d1TvI50UDU5V4dl22nBdCqyZW/uHoYvXGYi
	 JgPHYaXDl/TVVZqp48omm6gX77V89WijTCidq6bNvYxpvGCFQazuCkrb2M8eIoQ3hzrFy
	 zLgSAvoaiGZeyPvzAZeMYG8xXb24fFyAWY+DiIYPNbQx2uZOIei0oY2+umCRAkPKFkAQM
	 CQ8t+YMXcy3BA7P7yxQ42+9bXvHyz5vAT3ZUzk5fWsL6+7kq75nxT3N0MneGgHvyJpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fHpHBf/lDdHOapyv5rxDQanbzTSGjFk8Enoroly6aQI=;
	b=cJ1ifLHQHdWBvrxIm6XVQXV7sEM3W2r4m5GEGI0FzegU3WXFWGo2Qlzfa5WcdpurBWJG
	 V3n8wUfF8Uv/QMYDgZ5RqnDnAx3o/WHwugB3Ams6GoMREV+9p7d1RkTc2FgCZdpNtgHbM
	 TDRWBm8b+rlaOdPYKCVUZOZPQwrkHS6QWZRszsRXoHWLID888ElsPnJrfRoCj0pmSURMb
	 A9sdoOfwnhfgfQ0pfgTO/VUwGhMVHXAMw30dZxUwltCyRSUK8T1WKQxYnWQ6we7qej/b9
	 eptCDUC6LOO+CRLABtxd3wfwlBxgI9UnirrtziN5rjIYtFF/dKQSxAg3xIIr83v1cUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=ugDVQtcy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.152.46
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8F2606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 09:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C8F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=ugDVQtcy
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8v08L1124328;
	Thu, 12 Nov 2026 09:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=fHpHBf/lDdHOapyv5rxDQanbzTSGjFk8Enoroly6aQI=; b=ugDVQtcy1hBG
	dPUxDJZepTHzqSWcKjQmycrRi/M2ihrDW6T8RgSNmVjkx1G5msM4IZnlVmnNUqft
	xeWmWHDYitc7FbUZWs2tcB2+5c1QDJfWiQcmn1twb6763U7lVlr4Q+4WGVB2JQBl
	axCNhhrZWUJhTIHxltv9rxixWN52MvE0Yv/GvIjgh30TESWIqUgxn3XOxRgPb8cI
	sbQ2OuCXE+7ALVJE/u9efoSp0UNava/YCRePW/oZWvb8vODDCudrBn14rs8vd/Bh
	/W6kIbvYIxUKBcnsjN8PvItKvc63iauCe6GGpySAe3ka5rptjBLy0YEx1pVQQQrH
	9rLN/JcHGg==
Received: from typpr03cu001.outbound.protection.outlook.com (mail-japaneastazon11012055.outbound.protection.outlook.com [52.101.126.55])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4htghm88cg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:18:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hurLwBDLTPuihhE0si48W8RwHXCEwxSWw/8kXiwUzoEUM9gG9nSVGXmb1lZ26x4Y5Y3gKvUzAa34U/xdOU4LiULAGX/mQFU2/wn1K03L+2B9IKbtbf9IZY4E0hY5LRE4G4B9B8YswA8Gj7aaffSqu/mHK677ayAloHO/9cIZiTngwqVgelNmUeQyf857wEfT4nI8RPcesx8GFjc2qcD5jb57hZdwTqKe2DMp8JJtL3KLe+0uT6iYubxC1jzkCxPoQ0gUIKpBuZduld8BQbjteWr3Q8GkMwsJCW3PjJkN4izQmasPW+FIbP+JrtzqrETl8De7G5Frtb93lZ+fNOj0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHpHBf/lDdHOapyv5rxDQanbzTSGjFk8Enoroly6aQI=;
 b=QfedeCAt7mxS3sa7EdfeS6r2Ob9CO8fZI55iVH/pn0o3x6fGWIuW3ZFnzoafOT5KINQkMGhM4pTQsoWn0mVJiCzrloqcUvhYN69eZV10QIETxz7JLEf/of2CVhqgog/F4tHtLHjeRIuADH0CizhOCro+9/yusZctrJuo4ox4BHnJsooufsIaZP9k5t8ZuIrAEUz0ZZd/sbxD1p0+LEDFRrCjIMvirccpLRjqvJxYMZlhVawFtHrZG26DJn9SIKNkV6J9mJ5wV0iAq75kwIed9gfyMi77BLn8QE+TTF/igL0Lo82wQLpAq2yOEd/MMMm660sOr0ypGT+RfpPOeDSTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SE3PR03MB10595.apcprd03.prod.outlook.com (2603:1096:101:320::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 09:18:47 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 09:18:47 +0000
From: Jiqi JQ9 Li <lijq9@lenovo.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
CC: "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [External] Re: [PATCH v1 2/2] hwmon: Add driver for the NCT6801D
 EC sensor window
Thread-Topic: [External] Re: [PATCH v1 2/2] hwmon: Add driver for the NCT6801D
 EC sensor window
Thread-Index: AQHdcbz0iDy+4EcPMk2kueQymhpP/bcpCbCAgAEdX5s=
Date: Thu, 12 Nov 2026 09:18:47 +0000
Message-ID:
 <JH0PR03MB8637EDD6BB9857737E872F9583702@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20261111091338.799889-1-lijq9@lenovo.com>
 <20261111091338.799889-3-lijq9@lenovo.com>
 <8328a118-c3f2-4410-9d11-06a80ca79275@roeck-us.net>
In-Reply-To: <8328a118-c3f2-4410-9d11-06a80ca79275@roeck-us.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenovo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SE3PR03MB10595:EE_
x-ms-office365-filtering-correlation-id: 2ecb0541-7130-476e-f2e0-08df409df4d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|5023799004|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 WRwoIYNfF6TJjCaBSfJdQI2xNHtmOjgyENQR4Bbr7AfVjWSJ4N5UC9NVQVaqLB6s2wHkVOHPBlmw3uu/efpUVIHJweDlMTyaKvzJL6BqjLoNhcrSfCCdWfA6i67330FZmU+XGnr4gYr6lTs3jJ7DARleSPzfj3RGXoZ4H6xvYwMjh8iYauKVz8dw1+spi341Gcg5Z4ZvqDD+h9O+O6RUN+7QuJ8N0lR4hjyk1eXZzUarEK/kJWhrUsWVKqiPhc7z7XzkfiFyOFzlQRNQb8aNxI5LqOTKnJwqT402QWJUYS40zBK1MpR2KpfIKmubMYFv5ePQMEUHvf/8tGvxSTxgA8kK7ExbD1K7FYWgnzeL8auBChKdXZgFH0a54AvWTvSYd0OV1UFBqZ7VCuEfMEQD0qowvgKsmJ9IKGizmpT1irXYkXuVcqybxSFuAWpuMo1MhyPnGkg+jv6vUoAxxSeWyjgHqHJ7dIgXw7FKIWXyjJOyq6T+/Wn0JQ9F/cM2YxJUURFvbgTDu8SNIIQyTLw9fTlQXdDEgPp6BBrZuHOWMCznqKUe27tcIKr7PIB4w1nV9A38rT3yI/n2slZlVIDV3EkVT2UDiCnyX+dHlcZTAvmRb2bTHy/Jlg6bKtQLgixXFCra6g3Ge1LpCAVTltI9THpKszdAIP0PwqtcFu9x3Z0js/5L0KTC/t6HMkWNjCx9tFYZxigT1zKkNsnhpCjDTlWImqcNQ2tis8fzcifI+6Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aD/6F/8foyI8rW/IQRl6B2dhucPvaVrQ7cUEeBRcUz55YiHj6Zb5Iskmzf?=
 =?iso-8859-1?Q?2u7Dh85entLkwYK2nnPxgwMG1VVaG1AAOYJb2nFOoS6PCMOFRtwYnAAprz?=
 =?iso-8859-1?Q?iCt1iztwtMHfH/KjOFTE0HwOhvHQ/Uf0laRAokp1K7z3hfMi/pb9OHmj4O?=
 =?iso-8859-1?Q?e8YIuzuOpq2ckx2ZQiepz8y2zoa+dWHGpg5LCE1pH4Hld3EzaayATNq6Y2?=
 =?iso-8859-1?Q?ivm4trkuNwEeAUD/63jOWVFjj3TNBaIvbBT3Y2uGKxbXq8Xp3Wfx0PTKHo?=
 =?iso-8859-1?Q?5TFz2VClHXbkrHDSmpDvq3vIV9AOeZkqKj9JolPibLYgZ2jL/74MD4rmC+?=
 =?iso-8859-1?Q?rOfpDq3NByLzS4igT+QONzq6O8K/dM+3GZY+BRQUq67/aw1eSs/v+XrCwX?=
 =?iso-8859-1?Q?lh3V1td5+lPNRAinPzc3NZFawq0TY6ZCemKcMGBZcklYAqM4IummiqPD62?=
 =?iso-8859-1?Q?vvgnjo4VlGuLQUJqX7FUtOsyxzOJi4A37YL8LeFGU0+NPgEaBXjGdF2uio?=
 =?iso-8859-1?Q?PcBNjgbhU+rVejuojWygdz+YDa5/gwgRHv7g5NQzK7dugWMdyYn9kZrY6N?=
 =?iso-8859-1?Q?+vGHWIPhw6dUptgVPw2Y1lJcJvlZNscByuS413n+O24P0IvEBiTNhz0OPq?=
 =?iso-8859-1?Q?1zs6U0MKHfubC+cepHzi0iW9BjO6TqqJdY3LWOjztdYtF8ASXkgaQDSje8?=
 =?iso-8859-1?Q?MrbwTSR2ZNgUmwr4KAVWzRKS0abNgCwlMnFJJVfR5lUZQfnfOn7JQalrx8?=
 =?iso-8859-1?Q?U34MH4OAReOJhNb7KV5nQg4TLA269ytiP05RVxnIfEF9I/jxmSla/U+VZy?=
 =?iso-8859-1?Q?kaCU/WpnHraLsCKXCRyTlfonQ3OHzWWgBwT1UyD9WrjFG3zDm4Ompq9tKO?=
 =?iso-8859-1?Q?C31XGYX76J99TmqMylmq+PcCtfGCNJKaeUkKYoCHEnlc0LkrhgJ2A/nVEd?=
 =?iso-8859-1?Q?ilfd+9uqvv76GNTJKNnfJo/mPpKMNyABrOKFp+F0QMaFXjlXApNHv3gn2Q?=
 =?iso-8859-1?Q?xRHdCal919Y/TSPgJI4N6AL55V+xtIlJBXmamTSMoKkbp37iHqJNFjyUNa?=
 =?iso-8859-1?Q?0hR1/kj+oe1B/prVNrFVFim6Wi3a3b8TdtMu3j/Gr50eG+fYVR7yW838Dr?=
 =?iso-8859-1?Q?62mh+3Nv2tNRgwktVqdsBhVp3TLzJOSK1R5mD/Q1SIVcxDedc4xRjo8LHm?=
 =?iso-8859-1?Q?HtiPe/iiSuCm9WtiTOLduFC4g91S/0nlA+ucwyEwBWjawSzjdl51ssyFtr?=
 =?iso-8859-1?Q?Ho5lqXpVnqyWt/hpflYlRVVDhKQ3/XnwRmeGnDo8vIQkBytiyd15pgZCgW?=
 =?iso-8859-1?Q?jT7QmJoF5n8zR/0MXFKXjDmNeHdiFLWkzaBFxXJngNJ7oLS5zEBYN4l8Jo?=
 =?iso-8859-1?Q?rV1tOOKGNMssk0o/LvdtqxjnK1O3dlfWGDVQJaiDKrjw1t5c1sSMS6haz2?=
 =?iso-8859-1?Q?VfIO/VcbU8KcyqEhEjjpujkl/8npxj0LOsEKIlnJ/sebY+QbZTUyYPKMWE?=
 =?iso-8859-1?Q?xTcKt+9SUUWIr0A7E/6dVIOYeehUDUf5MciHeLxJRc1PVW7uPbrfCWmbfc?=
 =?iso-8859-1?Q?341qrMIyXu6mtUkYbd9YASgNNVPi19sHuQvJYTnYTQs/L7VvASZAADvZaN?=
 =?iso-8859-1?Q?MWMTRHxls+e3M120hZaD8jUpGmIYXQxHc6wztnwn7VrmjXBhjPd8Alij5c?=
 =?iso-8859-1?Q?LrzCjn2QCLQKwjw/428+gqLNl5GD1Mq3chWZE2gUm6hGU6qbMlh0a8mV9s?=
 =?iso-8859-1?Q?wq1hTXWpiwyrcmZFxI6T+Ye1yU4BefEpn/3t0o+LjWN2VY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	iJVC2xZG1aBOyL+mZ6SAvY5fLp75Pb9wvNouVuhQCaaIvNslUlbvog7DG6Ty8E+0leRAxH/tj5/9lkuvt213jtdscDjniOQJhDYAr5wOPOeM6/WAt14GDe3I5tgjiIW5FKBpQTIj5t7NRLZJxvQWsDyXG6LeLzkAnPyUleEpzTcTEUCbT6RheWUJTqo83GOh1zVHjw2sUQzOU2fFoGYZiHfNQ030WyzPWOaLx3Du41g9ycwmj3ED+6RenU25i9LfTTZslBdegMO6OTvtIKrCci/L+7DS5gWPf58W1LzAAaE33+X/Oz58/sPtHiIz90NMU3Ir0lW3T9NEqGDPnVMM3A==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecb0541-7130-476e-f2e0-08df409df4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 09:18:47.0882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WAi7s10Ka3upzVYbMAVAAFybrpXsX7OKjWlWzPm2DF5WKM1Loh4wZ85XQ1H1FSsfjvcEddC2kRwLR4XGJFh5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10595
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX2SRDRX3lfmVJ
 qErxFjnH5fIzpqMA2ElAyOrPlaGI0PZQIGlmCxcyruMQz9aHVLHny45hy3qnTjrUw45IXx4QMrQ
 5yOMXqMPGOmasKZpXUT/OjpLF0uu7rY=
X-Proofpoint-ORIG-GUID: gRwkjg-dgxXqP_mzsMh7qLfnIkNhY8SD
X-Authority-Analysis: v=2.4 cv=P5ivFSAu c=1 sm=1 tr=0 ts=6af58479 cx=c_pps
 a=kRlYcyTrbgrkg8r9Qj6YbQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=j7ft8fR0phhCBGdaz6r4:22 a=8k6WQxmsAAAA:8 a=i62hFP9U_o557ep9ANcA:9
 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX4ZQWeJ29NxKQ
 Phj0x4lM4xsvjJNOyYk2tF3Y7Kp5w0+v8iPyKM6/Y8aPtZi0l7/SInKymKyHp0KNfUOuUpXYSr7
 +z4yAbzAv5y9D138f+T/Yh3umGZrghb74XKE7TdCEqWO7lzMhrX1p3SV2HkP8gt4i4JLcdv1FD8
 bOyqAI1x1lXCk5u/VXZ7K44xnLhHfj6jo0nZo2Jdv93TredI7v/dswdB6hz71V6ZpvPdwGIIunr
 Ix12AmhInldyFPHyFX/LoRCLkMiQsp3dPxmBE719XEGEme8eUU0etwMkwG6DiQxfXkS56eu6F8e
 ymrwbFLyP5ns/ExIDFD6DsSWXmvGKdkdSFccS5OqqS9aOCJBHiuHWS1TbtSFNwvV+jfjrSClffL
 IsruJ+9ISwY0r1Z7i6DUwRn29q+jaTxUcWQH1e3uJZkgWsA25vxCwnqvb22+bLxpYM0tDvKkurb
 tGvQuryFeXidE2d5i8A==
X-Proofpoint-GUID: gRwkjg-dgxXqP_mzsMh7qLfnIkNhY8SD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036

>> The Nuvoton NCT6801D used in the Lenovo P3 TWR G2 does not expose a=0A=
>> hardware monitor logical device in its Super-I/O configuration space:=0A=
>> LDN 0Bh is the ATXPGD/BEEP/DDR4 block, so the eSIO-style register window=
=0A=
>> that nct6683 relies on does not exist on this part.=0A=
>=0A=
=0A=
Hi Guenter,=0A=
=0A=
>Confused. Why add the chip to the nct6683 driver in the first patch=0A=
>of the series  if it isn't supported by that driver ?=0A=
>=0A=
=0A=
Dropped in v2, as I replied on the cover letter.=0A=
=0A=
>>=0A=
>> Fan and temperature values are instead published by the EC firmware in=
=0A=
>> one of the shared-memory windows of the SHM logical device (LDN 0Fh),=0A=
>> which the ACPI firmware maps as=0A=
>>=0A=
>>       OperationRegion (SHWM, SystemMemory, <base>, 0xFF)=0A=
>>=0A=
>=0A=
>That makes me extremely uncomfortable. It appears that ACPI registers=0A=
>and accesses the EC, which means that the sensors should be read through=
=0A=
>EC to avoid race conditions.=0A=
>=0A=
=0A=
I looked into this in the DSDT and then on the machine. The DSDT does=0A=
define both the window and paths that read through it:=0A=
=0A=
    OperationRegion (SHWM, SystemMemory, 0xFE500200, 0xFF)=0A=
    Field (SHWM, ByteAcc, NoLock, Preserve)=0A=
    {=0A=
        Offset (0x24), TD0L, 8, TD0H, 8, ...=0A=
        Offset (0x30), CPTL, 8, CPTH, 8, ...=0A=
        Offset (0x50), FN0H, 8, FN0L, 8, ... FN5H, FN5L, FN6H, FN6L=0A=
    }=0A=
=0A=
    Method (WQD1, 1, NotSerialized)          // CPU temperature=0A=
    {=0A=
        Acquire (MWMI, 0xFFFF)=0A=
        If (((FAAS & 0x08) =3D=3D Zero))=0A=
            Return (Zero)=0A=
        Local0 =3D CPTL=0A=
        If ((CPTH >=3D 0x80))=0A=
            Local0 +=3D 0x0500=0A=
        Release (MWMI)=0A=
        Return (Local0)=0A=
    }=0A=
=0A=
WQD1..WQD5 cover CPU/PCH/TD1 temperature and two fans, each taking MWMI=0A=
before touching the fields. Every one of them first tests FAAS bit 3.=0A=
FAAS lives in the WMIM region and is written by the BIOS; the DSDT has=0A=
no writer for it at all.=0A=
=0A=
On this machine FAAS reads 0, and WQD1..WQD5 return 0 without ever=0A=
accessing SHWM. I confirmed both by calling the methods from a scratch=0A=
module.=0A=
=0A=
Rather than assuming this stays true, the driver will first match on DMI=0A=
(see below), then read FAAS in probe with acpi_evaluate_integer() and=0A=
refuse to bind if bit 3 is set. DMI comes first because the check only=0A=
makes sense for the system the driver is written for. I checked that the=0A=
read itself works: \WMI1.FAAS resolves via acpi_get_handle() and returns=0A=
0 consistently.=0A=
=0A=
Reading through WMI is not a substitute for the full set in any case:=0A=
WQD1..WQD5 expose three temperatures and two fans, while the window=0A=
carries five temperatures and ten fans. The rest has no ACPI path, and=0A=
even the WMI methods are gated by the same FAAS bit, so on this machine=0A=
they return 0 today.=0A=
=0A=
>> The window base is not hardcoded: it is read back from the shared-memory=
=0A=
>> configuration registers (SHAW1..SHAW5 base address, at indices F7h-F4h,=
=0A=
>> FBh-F8h, E3h-E0h, E7h-E4h and EBh-E8h of LDN 0Fh for memory access), as=
=0A=
>> documented in the Datasheet. Several windows are normally enabled, so=0A=
>> each candidate is checked for plausible sensor data before it is=0A=
>> accepted and an unrelated mapping is never exposed as a sensor device.=
=0A=
>>=0A=
>> The controller is matched on the full 16-bit Super-I/O ID (registers=0A=
>> 20h/21h), which reads back as 0113h. The lower nibble carries the device=
=0A=
>> variant on this part, so a masked comparison would clear the very bits=
=0A=
>> that identify it.=0A=
>>=0A=
>=0A=
>This driver should use a DMI match. I have no idea what "device variant"=
=0A=
>means and if/how it is associated to the PC or board manufacturer,=0A=
>or to what it is related. If the device ID really identifies the "device=
=0A=
>variant", what guarantees that the same device variant is not used on=0A=
>some other system with completely different EC access ?=0A=
>=0A=
=0A=
Agreed. v2 matches on the DMI product name. The offsets come from the=0A=
platform firmware rather than from the controller, so the system is the=0A=
right key and the SID is not.=0A=
=0A=
>> The layout inside the window is defined by the platform firmware rather=
=0A=
>> than by the controller: the Datasheet specifies the window mechanism but=
=0A=
>> no fan or temperature register block inside it. The offsets used here ar=
e=0A=
>> the ones the Lenovo firmware generates for this machine:=0A=
>>=0A=
>>    0x24/0x26/0x28  TD0..TD2 thermal diodes=0A=
>>    0x30            CPU temperature=0A=
>>    0x32            PCH temperature=0A=
>>    0x50            10 fan tachometers, 2 bytes each, big endian RPM=0A=
>>=0A=
>> A machine whose firmware lays the window out differently fails the same=
=0A=
>> plausibility check and reports no sensors instead of wrong ones, so=0A=
>> tying the offsets to this platform does not turn into bad readings=0A=
>> elsewhere.=0A=
>>=0A=
>> Verified on a Lenovo P3 TWR G2: the driver locates the window=0A=
>> (0xfe500200) without any module parameter. Under full load the CPU fan=
=0A=
>> goes from 808 to 2920 RPM and the CPU temperature from 32 to 100 C. At=
=0A=
>> the same moment ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C,=0A=
>> x86_pkg_temp 100.00 C and coretemp 101.0 C, i.e. four independent=0A=
>> sources agree within 1 C. Readings return to idle values when the load=
=0A=
>> is removed.=0A=
>>=0A=
>> Signed-off-by: Jiqi Li <lijq9@lenovo.com>=0A=
>> ---=0A=
>>   drivers/hwmon/Kconfig          |  17 ++=0A=
>>   drivers/hwmon/Makefile         |   1 +=0A=
>>   drivers/hwmon/nct-ec-sensors.c | 507 +++++++++++++++++++++++++++++++++=
=0A=
>=0A=
>That is a very generic name for such a driver. It should be named after=0A=
>the system, not after the EC manufacturer.=0A=
>=0A=
>THanks,=0A=
>Guenter=0A=
>=0A=
=0A=
Agreed, v2 is named after the system.=0A=
=0A=
Thanks,=0A=
Jiqi=0A=
=0A=
