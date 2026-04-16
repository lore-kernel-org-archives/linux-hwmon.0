Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10BD3043BE;
	Thu, 16 Apr 2026 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776376792; cv=fail; b=blzdGbFki/GYwop+cJ8qj5eEFJwlSmjLyh8XOKyA0M4dG/K7Et+8iToio5B86VZQd4ein+61Q5S0n1Qq9uTwBdQR1izSN0PxBKQkNX2P7HsqjYrMJBpty5cz1x60W+bOg3fXh1vzy981U/F5HjT1rn/cOl4eQxEoq4uK/94b3MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776376792; c=relaxed/simple;
	bh=/6/3rH/RKNRdvA4WwhukuFnxytqFy3a96lrl78a2/BM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KkbPp7tnkn9Tb5DkGC7CKrxxwLy1Ae/b1BUxRPrUWpP19Zh+Q81OUXGYLBC5fixfVxjl74H4N+0GXkfwG0Ez/iSCikzhmdTREmT0DWzNC1EWWpxuAEb5tpq6mpBUb2N/WDWu2F51p6vef4BVx+CxoMdCf9yCYIeb4NGW+12t5jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=HVJ4hfs8; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="HVJ4hfs8"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GL3tVs2777672;
	Thu, 16 Apr 2026 21:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=NnUE+5L23qpe+KgsGjrrVMnq
	UNpQ5ZyfshJsEfm5LfY=; b=HVJ4hfs8nJ/nQYx4LqH78QiXs2uZYXgysGVOqLUR
	QnqdRXOmnakCLikbfuytf7N1iGcFfFx7TD+UFvcFU/j6iU3cO7LNXkUAfwvDZhd4
	MmUGnVUmdipeq/9k/RJEpzGlQr7z4diA10F3UwFjMn41uOGNrdWxsF9kad9eTxhC
	Ippnfsc6hlgevuieMHKN38D/kqjzp1I4XLZTqGjZzpdC7Yt6qmW3F7EiKUI+zd/h
	z/v94xGc0yeppHyQKAbrWve0vr2lgnAOvhzjnC+E5iqgwOSDioJqnThvGZBLIipd
	K5/8Ps0R4p/+eg7Aj2yi7CrN3gTKd1NiaVSZ98VjZo+Dxg==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4djxn9qnv5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 21:59:28 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 183FC8A3;
	Thu, 16 Apr 2026 21:59:28 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Apr 2026 09:59:24 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Apr 2026 09:59:24 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 16 Apr 2026 09:59:24 -1200
Received: from BL2PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 09:59:23 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo4ae2yZbjhdmJHtB1LIR8JgwAg841KMAqwFee+pCqY5Z+PSwnfCcuQ9pilmagExzmW+spDAR82dISRqsPn6IqgZjQwafNUnDljTK26PlbRTIGC84EyE+0bCmDnLBVB30EYkS8JUB7GQeBayJeB1fnjDP8NershfuNLO52zhzuYNTBD7y6Y8b84XStPIWbKVudEeyIVYgXbCyYgf6uk+nj0cjpyzfLsIomFfuE6HFrcbStGJ8LXpN/YC+t8UTTgGn7N5qX4XMOYm6JrpMbde2FOgNFqbplVmibcqoCwX7is7bPHx6JOGfGMXx32eeapmmazkrLyAi/UaEROuBGwjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnUE+5L23qpe+KgsGjrrVMnqUNpQ5ZyfshJsEfm5LfY=;
 b=HJLewTVCjhj7ppGvEdCuc4M+C6J4GKdxxFba4qlkoL3VhPjCrpfRDSPJ7lPU6EuQnwU9Rzi/KkiKEOcfFfvR3xEwpUjvmTQPKqKMpG/Wjb/Yotio2/TgyuHdNT83grQRd/7RY//6ZVIvsTcqQDjF6w1ziaiZ7bIcVpyZ0Oa8rXDm2a9BLNpECsmNWsDpzPU4brhGlfJzo+lp3qLjN3icRBi2y1uVVY/DOE/G9rrjWG+R0Q3UlQNoABs3n+0FxSqiG85xBdWHaL6f350Xvl0zlfPDPwCxVsoWeSMVuFZETRxasAuZ69mDlCmeOOPJ62iEN22yXuaeQVew949i7aRfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:203::11)
 by PH7PR84MB3250.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:1ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 21:59:22 +0000
Received: from LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fce6:5af1:e04e:caf6]) by LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fce6:5af1:e04e:caf6%4]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 21:59:21 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "alexandru.tachici@analog.com"
	<alexandru.tachici@analog.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 0/2] hwmon: (ltc2992) Fix threshold write and power read
 overflow
Thread-Topic: [PATCH 0/2] hwmon: (ltc2992) Fix threshold write and power read
 overflow
Thread-Index: AQHczexHcT0jH1LS2UaUGZGqO/Jd5Q==
Date: Thu, 16 Apr 2026 21:59:21 +0000
Message-ID: <20260416215904.101969-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR84MB3535:EE_|PH7PR84MB3250:EE_
x-ms-office365-filtering-correlation-id: f9e06a76-2e9c-436b-f0e9-08de9c036a7d
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info: DyHRb5mrrrqXi6DIoT4qntkrWMaFyc4Dh4JSQvAjS6B6Z7ac3O8dVFwL5K4QKucHbqpPDcRXP+NdJwdB1Y64Aqz0D6OFEEW3zgdXrnJ1p6gTRQq9UHPRwg8PAaRKAR8AjpGLQtGZcyK0QEUP+S2QymR8pQtJ7lAexcqeNQY+nhpAIptbYg/mHJUURbbJPPLtX0HCWXu5g3KapVlO4m14VMR55Qe1tAe+4oe8wriUqLS2hJ30cddMzjmewYvvuNp7++hIKuk2DPawcdbepb1OE0WBMnFmGac35GVSJ34S8f1XoHiICoxP3cPy/zWjFQYLw82pg8l1W0kLpHx4GjHll60WLKGi0/d6z/RuvmW4RS+Jb9e+m+t9qBZNKXg7SBhpgP62ls0hT9wjI1pt1PXP1zZRvuefBb0SQqpv9ZGV84qCGUwkbO00l34RNzYmoGTqISf8qkUkx1Zerq+Lno4ynCyo5Wou04WS8Vsrp6vXD/FUL0reud+z22NWXTExr2EN2peS0Z+IjC/0Q1hkYdFgt/Wh5XNfZI+Mdi+M5/7Qr5ti6YSUlTbZikk/udt6MreCnKhZ2KZ10mVHyUSREeEt8lr7qP5hVv7AhOMjcgS470zCp5qs+Qwt6WRWjaqH8JBBRJutsuL+qw5/rAe9LEfGRrOvHu88V3cukiwTSHOfNmUQIYNWxYVjnhRKrwrHlrkpiR5TegBzjPH0I0GV/cAEuznQ/iJjYM90T2sn8IbBV0EhiSc1nyskeAdQCk3IMqp4g+BZF9FK6iXVcvuva5dqRLzno5z2UfFAQW2S0kEpHa8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BIlIsfuWr7rnRZh4dZk4zAI8DZ/FDFUEyBRdvB+qAY64IYUcHsdKF3ayJ2?=
 =?iso-8859-1?Q?hXZfGqEG0375txCMwEW0lhnj6GnH9kiB98ZNBSbMa+baYrH/HavO7I0XZu?=
 =?iso-8859-1?Q?0QQQ3qMitp3IQFmIToLQXXWVYKQPBj4PAoeZ7RxVU645/1RznlOEQInK+C?=
 =?iso-8859-1?Q?6xoNhCfI7xQvGqhXt7RS5FKOf0COFe8WqJUEfYscDJYo6AU4AYoCvDJ6TG?=
 =?iso-8859-1?Q?S1UzEo7N72612qL0/6O4/M61/5xROxsYmW6mxeSi8TwJboisyxlVTliMOh?=
 =?iso-8859-1?Q?Px+zTkImAA1u/NbAbl11USm7NpLq6LvVpAlV4b2jxDnQ08WYuukdcm877S?=
 =?iso-8859-1?Q?b9cPIKm3nqJ07DMNvcdHZpQTKFdF3YTSH4J+noz3suMqQKpCwNV5kcChVj?=
 =?iso-8859-1?Q?xXrKJoT6YLEU78/c2hO9rSQVCneDWcN69GjUFn8Bwl7XKD670vFYkHacXi?=
 =?iso-8859-1?Q?nmscz1FAOhTaOZh1rCofvJSfHq0Kl25GmMMwADtElJHOtElrK8HLw9K1tM?=
 =?iso-8859-1?Q?C20UgLeCvdQL9uuKvA1C3vIS2jB9KYdHcVIzTmQ4KHE6NJajgiuCaj5uis?=
 =?iso-8859-1?Q?+rlmFzOSvMPzNEYfd9xrVHR4as3zAgKaO+7oUoP4HigRcVEdctbyVqUNHS?=
 =?iso-8859-1?Q?5CzwIgQDzFquTn3rPhlqazlRi9bFU8mOGRtDHSTKIbpnTabjmGsA6+N+4Y?=
 =?iso-8859-1?Q?Yvx6Le0fJF8np57BDPlp6RvnNCsAJB8BUYTAaIdO4jn3ZfZpxCRKApX3is?=
 =?iso-8859-1?Q?E7wyVU4b8v8LtaTp2zwv7tVX7FhFRLtm0BGPyca/vern/DgAf5LJL1C6Lx?=
 =?iso-8859-1?Q?m+hhfUsWHVFC6LYzxZhE9XY2rurON+59fnfe1ZzsS4JPJqEt+wKx8E1cDA?=
 =?iso-8859-1?Q?OCUZPVNGdOVsOfBchH7y1L5vM19Zp8UiwD0ZegNd3jlE35VawLCLDMKv41?=
 =?iso-8859-1?Q?FenIdXA0gstMI1p+vHrB7rLmQujp9cIr80Jle759teETK1CedYMUkmSfDk?=
 =?iso-8859-1?Q?fOTYciouAjLD/QFt9TiEj2CBF3Caf2BhrcDvFnCT1i5gu4OQ+J8ErVcUtr?=
 =?iso-8859-1?Q?aCh1z77/69SFRV0XDfEDzDYp65IXxT5EbsvZ30GngZiMQYGww4LcgEruIz?=
 =?iso-8859-1?Q?QNSOA1/Zm0+tv5EEQT3i9yJqBnTaLOBimFfIPuzD1zKYda8GSRAhknuJAG?=
 =?iso-8859-1?Q?DyOMWL/lUqjRcu3PfFCjpWNVBBzyM+mnbidHr6TD1V+CQPt/XIkMp7nTLO?=
 =?iso-8859-1?Q?nce2N8+MpLn2fK2umQeHG0kYUSL+6chNTO62IDvw38/h8JTp88JOgi+G4+?=
 =?iso-8859-1?Q?wg/oQ9KHlLVr9JcT1h7+3cKU8bnsg48S1kUtuifhX9kfwYMSaf6mh+sS9y?=
 =?iso-8859-1?Q?tlY7nvfEYVcQrblKIj4Q8m0p8nRVss68JWahm/CQ4/ZybAN+oCbSe+5RkT?=
 =?iso-8859-1?Q?5GnFoQqjx2NC1aJds9khnG0RskBo7DS4J8rksvilZ9j7rzj+LTkMSArhC/?=
 =?iso-8859-1?Q?t1l8Jg6lTijilxs1C9YZohwdTc5NnOlvWQeEkWidRe2K+fe1VYdyOjQcsP?=
 =?iso-8859-1?Q?KLFPzOTktX4/nxXGXs+0hj4M3+JcJHZT9luxMeqtWHMkAYxqvoa8/6U2Jt?=
 =?iso-8859-1?Q?J7hQgCLDgRQglp7yPRK6+RZuAzaWFAjDe3ufbSHFr5UDvGUaDo6zXZgpEZ?=
 =?iso-8859-1?Q?aF1YcTxLMTcqkKuBmY4PeUurY5lOVY/lnOJybINzB6B/0YhEIacrpO7wbM?=
 =?iso-8859-1?Q?nH4jvp3OSyPj/0fcsJxs1pz6SQ20us9bX7NHUttAI/SGilhTLHFGipjqoC?=
 =?iso-8859-1?Q?dheX4d5IzA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wj9hhjhes3AhYHbopeyy3NcqmunpAEqheBWTKmkVrF36F+mo8CFhZ7ydikJ46vbg7f6e5quedYQjNU1rqAVx8qrCxowlOTn3u0sqSKHvI2YKTjQZLkjGZlBgY5wvA3wCjB7UCa4x1RLuVN2z0uzb+FgXkzJIB04afMEVeEgb7c0sr8/VsHkJA9nSEZhGM7QRNZDVwISQ1SzuTmU1kgJxlUab8mevE++9INDLGOGOk430sZ7T7KhUUIkR3YIbeJCi6hF0jg3EJm7wgPD6Ud4Gv99pRloYk4xrbQvWDVBZecE8rRNwjTh36nRh9o7Of1lRbYWlBWaiqlVdutr2/S8Bdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR84MB3535.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e06a76-2e9c-436b-f0e9-08de9c036a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 21:59:21.8136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SrEGCOP4k2gAz8snnpJk1BpJvhIrOxalyZM2bQNTOT8IxaFnpzHjYn44lDfWKl3joQis7XZY3ivtZ0z5wd/Hkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB3250
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: j3zJeXTuct9ldq2K-CFyXHG0bmXRasMK
X-Proofpoint-ORIG-GUID: j3zJeXTuct9ldq2K-CFyXHG0bmXRasMK
X-Authority-Analysis: v=2.4 cv=HIrz0Itv c=1 sm=1 tr=0 ts=69e15bc0 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22
 a=OUXY8nFuAAAA:8 a=jlLFYfBBHW4x2wnp0QgA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDIwOCBTYWx0ZWRfX+beWBG9bqJWi
 /oI5VnarOGLP9lJRJmlcNcEZqp8i9UbLZ4Y320Vh8H45NuLdwgZKrOESmks+zqviJL/Fq8vCss8
 bLTtJ0Cf7LTvBsTpG88B5YGDQ+Wq2M8fy+D5CopZPZouwhU1QoTNV/azOheiFWeQpijzaak4QG4
 sZ4QiqRZOpKxudami581sa1il3S8M4PiTpWpaInavjXxodxGdA3H7hnKKuc3CkihYUPBxgwsIr9
 lN0qpYuxmith4fCBpTbC3gYk8h0x53m6Q62mE+AhvEP6lUJABf1+5WeCBcoF8dbvrq6+2oIBxiT
 2WMKkhGaKYaXhGefVDMQp/X7XcmLTRzBdQozTS3494gQ0Efdu6itiq9bHBXSH+OLlgWUiYj93aH
 ExgRK9s7BUG60H0LGI+zOZ/FexB9y58/z72rLLClmcnO8cTrEe8T9Z/GRXyqnXedXZKeMVrAyV9
 QxdM+zSN7qWzWwA+t/w==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160208

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The ltc2992 driver has two related bugs in its threshold/power=0A=
handling paths.=0A=
=0A=
Patch 1 clamps threshold writes (voltage, current, power) to the=0A=
hardware-representable range, preventing negative values from wrapping,=0A=
intermediate arithmetic from overflowing u64 on 64-bit, and register=0A=
values from exceeding the hardware field width.  In the power write=0A=
path, a factor-of-1000 cancellation also eliminates a u32 overflow in=0A=
the divisor computation.=0A=
=0A=
Patch 2 applies the same factor-of-1000 cancellation to the power read=0A=
path, which has the identical u32 overflow in its divisor.=0A=
=0A=
Sanman Pradhan (2):=0A=
  hwmon: (ltc2992) Clamp threshold writes to hardware range=0A=
  hwmon: (ltc2992) Fix u32 overflow in power read path=0A=
=0A=
 drivers/hwmon/ltc2992.c | 43 +++++++++++++++++++++++++++++++----------=0A=
 1 file changed, 33 insertions(+), 10 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
