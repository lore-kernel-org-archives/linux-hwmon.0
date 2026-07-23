Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B9A384CCD;
	Thu, 23 Jul 2026 16:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825247; cv=fail; b=n0jqh6lYU5HxcEAPr/yujB4hxV1/01TMbtmWmZZPabDS5WyTmQhQUGhO8uoJlMpuOFGNN45stY77DzIvi3iUUg5dT3kCdrVDPHmLrhTC6SSGf8kHElgwwEXt5dHuJ6/M+SI8Xc/JAAZafoGciKEOlyfMNDYaSf8XZWibhPZ2sMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825247; c=relaxed/simple;
	bh=hOXAFQrDngEuXvbL0RWVcSeTzei23y4DaShZuDhBP3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NaxpstBVouFMN+kq9IqSNQqPLZID7ZSRBEgw1wVAAyE/IEOzydN9V0Ka9LcsXC/scMV4qVsaNFdAMAsfavriuvsCSIPCikrjb0sCHTuxes/qMo2oXTCeUpk+AuTZQAP9H4uOfsEFuJc4D/b1L8JYCCZ0k3PjSrASxgSjeBEy2rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=EQrJN/95; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="EQrJN/95"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NFjlw73406609;
	Thu, 23 Jul 2026 16:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=lH
	bqIe1UFSDmZr0oGR7c4qFL21RUKnx8LC0zvMEr8ts=; b=EQrJN/954Cmg/IuoiQ
	nLuAJrdbxyiy2rtEDs72KjriVzWpudcCD8fwHB4jVHegq+mumgxLYMPspF/KDTCj
	pj7eLFq9vjSSLbeFIJ1d5XpGLaMpCk2jQSHWRsqyTdS4UFJVquRRs78s/b3ohccU
	v5kHlGJqJTBjHfgH+HPQwt76DTPaC8KangKlyc5oi8b2mLfHjqcL6qvPz/25etEb
	ypmdu1DoBShvIQ6Xsc8gSx77sC76Rs6hDmkXdDzccWs8ZiuEKwmQPoCNqFtHyfvS
	b9aoN8/GZozS8NF3kS9bxKJj1JzFg0agCJ3YZDuKEXL5Ss9BtgGZ1eWCpWXbzGNW
	sVHQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fkky73gky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 16:47:04 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 6B0CD12EA2;
	Thu, 23 Jul 2026 16:47:04 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:46:27 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 04:46:27 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 23 Jul
 2026 16:46:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cT3lY/Zui/EuJvWvteeV/R8ox592qMQu3ryK94DwzVZre/YpoCZUrV/3rV+27M3FKjVfp931HwAC7hK/bsVpab/rJp7f44DEiTT/kS3VhD6dfvi+VnyCULo8JWESLm80DJAERzbY6zFSV6p0E27Y51duDbgpHdEPa0dDrGFJ6FqsFGTmqxmqmlRrsg4Q0NgB+Bz96/z7t7zv3XbeVhbNI9mRSH0vDNqdkG0dt5Zs6QiZ73nk2etAMVpNYKwQlEbPuTIrrXC8d9pmNEX6NOjQJsruI3stCXKCwe1+VpkI++xEEjBggbD4nQWsMhGM3tKh+30TVzo5kA2y0oE5ifCFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHbqIe1UFSDmZr0oGR7c4qFL21RUKnx8LC0zvMEr8ts=;
 b=JnFGJ4MzXy52Z+F2S9Ee9UrhsDsdZGy5ydf1rMFJ6KHWjIAWNlJeM+PgMZachDzSie8Z7Y5Bx5bJ2PyjcQ28ULZC43VnQopEwlQqeD3VHaQYPpB8JjB+K23eJ+L+7CTJvQ7+SawWd6wWO5n428lUSJFUrYmVrYSa0FG3xA/yITf8JoeheqsIcH3SJyskFZQKhx++FlirsVENl16yNR62VWBkEl1WjHbKk/1+bcth8uyzsAc4usdkVepMRmIvqqaKSkz8/thhtMjxIuJ9Sd1yj366uutKVnlHuR8TjJdztZTqJmUL1VapSf5zi2HZ7Zmquza1ByVs2iFU93yRJBM8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by CYXPR84MB3515.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:46:25 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:46:25 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
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
	<psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdGetG+FiegzNR8UWUAh9SRcIYD7Z5u/UAgAGVrwA=
Date: Thu, 23 Jul 2026 16:46:25 +0000
Message-ID: <20260723164600.200995-1-sanman.pradhan@hpe.com>
References: <20260722150324.164799-1-sanman.pradhan@hpe.com>
 <20260722150324.164799-2-sanman.pradhan@hpe.com>
 <20260722-everglade-nickname-cdd52d3842a5@spud>
In-Reply-To: <20260722-everglade-nickname-cdd52d3842a5@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|CYXPR84MB3515:EE_
x-ms-office365-filtering-correlation-id: ef53b5d0-70b6-48ba-5afc-08dee8d9ef57
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|6133799003|56012099006|10067099003|4143699003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: p9xJAlsrwl+U9cqTgUUd66DPiwCxcXg9v1VFkng+5iRvl4F9LTVwhb/piEYwVKwwUgx4pw/e51va5dwwvXVLFS0NYnaRAWgxiOTBjSAesikKUV/tprLJXy5+itq0A9V6Gyx9pZlZk+7FRpHOLBXfr6keGCEFPDdpIZoZpQ18RLf90f1eUQsmKs8VCWqloOMJQ0oNNVJMCbl8GtoMqXALtV6l4t7HNQsaJ+1mTky8sxMj8ySvS/O7V6lt7fN+xBjhXNSWjpSu87fdb8I+4ELSKK82RKX5cojWEBuWcSaDa2qyYnKC7eDKqDloqMOvCdYtH2ILuHmlXz+zgkFCMqHXoNHlWk8cz/64yDi1ZNSt+053suwdau3VU35/GbUTEAS4zrFY2D7LsfkiuNd1vkqlkgNAOkrrLKOqdS8/HiGR1tQj7C/x8/ApZeYEKDWVsM48ds47ByZmUl6GKGTs+Bqh9RV61e4dBM3MTiaYzuAH4LtS7EkkDq4Z5f3Jbyognfzot4hYPCbVoXrM+vBmkfyQWmTWoKAavHW4lP5iWLiwERWYsFzGXr4mMZL4pOTc3kRZV7t21mxEW22KvaSdaNFdUmdvRuGPaaA4N39RLgvIbtFZcHLgRq6voAvRV5fOD1jhd2WQ2GSu6Igq7qSz2Tv0qPD4pvMBhHQP+EvdTrpi+xuCXj/VRAhKUWA2gBiZqCEt+8dsiqaL1o8/Hgsxh1tastNPoLxHD2Hq9RH0zGLz9sA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uQQ1X42pwj8tjKI1qfELMEIKVUE7c46JFjd2sjaBruLTgAGfEeYE/7+o4C?=
 =?iso-8859-1?Q?BDR696lVzfLmKNGHFvpIp/cx2QQrVycLYc4ZmIe/e5L5nmWc3jzrSTbYUU?=
 =?iso-8859-1?Q?8M9odlokzIoikXUw8GxIm3im2CCmflu5A0wlt6EQBopLtRJGC8VioIX6OH?=
 =?iso-8859-1?Q?qeYvpZzCE6rWTOge0u6a/I5r2DiQZFm2Cf/Z07SocnDCo5BovFEevAYIMe?=
 =?iso-8859-1?Q?vL1gEZM5/5E01gssbYkevK5kzlwi95lUh4rARMf/PXxgdqHKK8r8kMlt9W?=
 =?iso-8859-1?Q?MEVV62260aglrNbE7LDKxKy3TzZ6J+kEhvVdFE8DoW7W/ivUQx6qiv7tZ5?=
 =?iso-8859-1?Q?bfg1mTO+C4gMv2qmHw73zeW3jwTbuHUv/kPM7pFC5DHZSj0z2BXleZYbNd?=
 =?iso-8859-1?Q?2cD4COUUahXsGTZVMBBU18yUlRrqD3wr3YBsVVTkZWRG3Xi0oZIkNsAkuL?=
 =?iso-8859-1?Q?PatLHJsU0Zh6+2dbSdWb0yFa3E76WOxkYFRHhLEUq2YK0NCGZ4ziqVJmfi?=
 =?iso-8859-1?Q?+F//tL195sTrYg7l+ShCeqFlmU3pAtPyhFgdys1vi3ozr3vbdc90bgGV27?=
 =?iso-8859-1?Q?miVZkVtcU2ZgNIm/HSuU++46lRfNeEaa2y26LkFgvfzBj/2wXvWn2nyhTV?=
 =?iso-8859-1?Q?TvqllKfbXktAO7QSxJOHA4mMov1oHXu1AF0FgVYVbx8jKEqKc4XZ0J5n/n?=
 =?iso-8859-1?Q?GF9OmULKXzDqW7IkOefaM0CKqxRy2wVScHgkOR3P0Kp1YUKqMRiifJkv+A?=
 =?iso-8859-1?Q?z/Xc1/hvuvB53hYGYiVO3OgHOIh+K22hptuaOyHAG1YHKKxyEXrZI6lBan?=
 =?iso-8859-1?Q?ilcz5hglLKztcIMy6MWt+5j2ZRr0Bca4MHNosDuxUONmXvZhZUo7eSQLk0?=
 =?iso-8859-1?Q?/xbcSnBa86uNxK9VUwWhXn9SSFIZVFt68RrlazJEucowKeKkKvNpPyn0c7?=
 =?iso-8859-1?Q?N48iTfFYZ7hcV/jHYFHwq+f9ulXBA76i6gxmZwDmmfEOPDtjxqtMPlvcXT?=
 =?iso-8859-1?Q?u7IAgmJU+ESEsiyS/gNddLfE7MXlHOPKUtp8YQc8YN3oB/cDeozBkvU4WE?=
 =?iso-8859-1?Q?Q1jjRaHWYQ/+dcQmBIlmSDX7CgmmImXIclopHWrPnrUDYjLcyik7Ztyloi?=
 =?iso-8859-1?Q?8/lTtJ4RhjPjyJdP/0W+RmockO0iZw3g3fYatfJZQiNnHUcvnvl80OddTh?=
 =?iso-8859-1?Q?cvSVQtQJAi/A8Ryfu1X8nucwAAABIHyhweYm5BmyoUDt5FnDLhq3sdYxnQ?=
 =?iso-8859-1?Q?nqwijqZrp1zLYgDyaSlgHufa3E+hIvXYtVYOUcPhXSO7AF2plHL9sB//LS?=
 =?iso-8859-1?Q?2N6q9BE5Bsmk8V4kk0s82NEufQ/RvvER13Q7WRpgfd7RhosDW2nGm+1T7B?=
 =?iso-8859-1?Q?QuiHdrrXIqHxMB63+/1VGGOBmi/wOsXzXKw+Ob5su3oAGaVdbf6FNqMWeI?=
 =?iso-8859-1?Q?hXC4YCxH0xNtzOgrUxTJfDVY5Uux0chRCu8VEFYjDfN3tMx3j/o4kSh6rc?=
 =?iso-8859-1?Q?+ulc9P1nSihd3UlBVBXhpQ1ttVRs7rS0KIqPSPuDFy1qwYygRDQi5VzqTA?=
 =?iso-8859-1?Q?uHN4MCxxRd0oSvABzsnUaQNuHwGC+ldYmjPs3wIqPYoULPRMHhM9+QHJZF?=
 =?iso-8859-1?Q?JeS0OADyoogO3yx9pWEnFVqAgSQLeJVvZuemziMxC42bL+uHI4f0NlxKCB?=
 =?iso-8859-1?Q?n/Ud3zxXqWH1Xm+CEiG1conv5k8cBMs3EeX+d4+w8rh8jYoS1SCJ7iZiXL?=
 =?iso-8859-1?Q?rUO9e5aZakdGynDCg0AkZIbg1y+QdHsKknAwnivuLTrcmg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UxrtyyyvBYgQWSBIHzMt9iMOwo9AaZTK9ZkCe2HRoq1YgIyRBMS0Cqgc38CGdlB/1YqrbRXm/M1WHftB3PcaxU0rBODQ4p2cNz3jUn/JtfKhSsiBZGLqeo/KKVOSBCY4xGc2VEDEjXhM1PCGsx4OyWHqD2d5X6Qum3wAT6VMwHjs3280Y02bafjaXLb+xVi134WAx0heM0YM7mLGVsAcOaFJSEDE3RnEYb6PDGJviDwRVQVFiMroCCjX3gERFArXF7k1hxZONFfnpsSXimmixXhTVK2czVllSzs83vFesGLwqGfYL4xXLnA0a7yYOCR0geY31yO9o4Nu3NuZJ8tyKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef53b5d0-70b6-48ba-5afc-08dee8d9ef57
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 16:46:25.4165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HjQF3mud/jDxQbVPrtJFkizweYK7W75O5yaCNcjEtKTVjfUAd/RUYa1uciTl02ilw5ly3mO/U6qPZILn7greew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3515
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NCBTYWx0ZWRfX/MejZAGM0etp
 7Iw6of9gy+fR3PX4adZgFVh6MItJPrNcOLheJgY1dFd8Wm3wu5aEWdWpO1vfKG9PVspf97+qz1I
 TOHZtqwUaKMzxG1xeG+SVU6LpjdbhBPgo/Ce6CQH+YTSRuYbkVX9l8JaM4q1Sb5F72N6eKuIsF3
 MMGqwc7dlw/JtdTC0KQXnUKsthn/XHeItWCOLdCYTjegZF8DmjU7LbpC5/0GHMYW4QOnmTx9TaD
 sDtuGBT5FfV7SEbaH9Y1501/3Dk0S5GzN4TOMGDdfh6/8ZxnhQYNEUff7q8QvRb2CCqqHe/7hA2
 cUXW1gx20ek4nN6/zWw5z7bWoqN4akls34WpeKFIXoLVsy+xv6ZkcOEDsW0PQ6E/tDTqRzLK6yx
 JtUVbZ0qFlDFNNhrz4Ei5/jPJxyTBUsMNaq5/szAzNQkpD44vVru9VTSxcaBMu6cWdSdtGD5AXp
 IYIvFEfdzgF0wEF9HKA==
X-Authority-Analysis: v=2.4 cv=VdvH+lp9 c=1 sm=1 tr=0 ts=6a624589 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=0x2uElpTz-MGZQGG434A:9 a=wPNLvfGTeEIA:10 a=ZXulRonScM0A:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NCBTYWx0ZWRfX1oT13cVR2OkM
 xJWf5ja87nI8l9NS1mbk9B9TOXQ6k7CZhLFk/pBZGHDfbHQnIU/ewj4Ec86AgjQfbL/Y1g2k6PX
 0vR5XifHqEbwmvteA0ViZF7aVZrsZX0=
X-Proofpoint-GUID: B3KgBAtmBMSBMGSD3sKck2cfp_dkPH1b
X-Proofpoint-ORIG-GUID: Nbr9q0PJsM2ZlOW297bstjvlAcor0KaC
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230164

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
On Wed, Jul 22, 2026 at 17:34:00 +0100, Conor Dooley wrote:=0A=
> On Wed, Jul 22, 2026 at 03:03:37PM +0000, Pradhan, Sanman wrote:=0A=
> > +  adi,ocp-severe-filter:=0A=
> > +    $ref: /schemas/types.yaml#/definitions/uint32=0A=
> > +    description:=0A=
> > +      Deglitch time applied to the severe overcurrent-protection compa=
rator,=0A=
> > +      programmed into the MFR_CONFIG[15:14] field. The MAX16550 and VT=
7505=0A=
> > +      expose this field; it decodes as 0 =3D 0 us, 1 =3D 1 us, 2 =3D 2=
 us and=0A=
> > +      3 =3D 10 us. On the MAX16545 the severe overcurrent delay is fix=
ed and=0A=
>=0A=
> Please represent this property in microseconds.=0A=
> pw-bot: changes-requested=0A=
>=0A=
> Otherwise, I think this looks fine.=0A=
>=0A=
> Thanks,=0A=
> Conor.=0A=
>=0A=
> > +      these bits are reserved.=0A=
> > +    enum: [0, 1, 2, 3]=0A=
=0A=
Thanks for the review. I've tried to address your comment in v2.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
