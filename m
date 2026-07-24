Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F98448BA8;
	Fri, 24 Jul 2026 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911821; cv=fail; b=L42tVc1HKPf7dvNotA8WkRZgUzEXNt8XhyjmYCWAo72rl679VRnLgYu3WZdO/NktUvAfklyEDToftnjOOjMJm+cGonL570Ozuw5vcPD6hfQzoCoJGXj3WNWbeoeVcKSRFFx/szbRMPlE/ib/bQqaK/r4rWYCKvMgySN0dQqu3gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911821; c=relaxed/simple;
	bh=5UW4d64S1QeEbQT1hKIKiB1GqeVZ3yGKE9I/8ysGrnI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3KWAbFUs8ssekWsmxm7GIqJKSclIv5In06Bk8PKfX01K41tnvzWBridetcxWh9xpUfvb7L3hZie6ruYpA/0B/UlYweJzDeSSiPn/W/rL0CJHTirq/lRnnC1vzAIVW9JRobEIiumm9j3WBfHNW4R2LsCulBZbI1N4DoJxSkVOBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=ZJ/6LPUS; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="ZJ/6LPUS"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODgaNQ3055614;
	Fri, 24 Jul 2026 16:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=un
	npPnekUMu/4D6V3xSYrCZ5Ri5PyV4HiARIrZfBhpQ=; b=ZJ/6LPUSJd8TwyWSOM
	w4pTCFN1ADXvRNkx6LjSaXT231MN11qCUwEcFPsycGncUBvrMjF0lvZgStIRiFg5
	wsJ+ce+Lxkk11adj+UTnPYvFh41S70SXVzcUJGtSH283d8ckAgkTNEoU2d6roMxD
	hB6kFwX5UQIrq+Ttju6ar2GPxXAeIxDok0+1I0bUvyDZrN+06I8/krfMY5ueeAKn
	np/TeawR5gkC0UEnMsYQNGQwEQannbIvXVY2DWQg0QK9RlWYSiDjQDWVT9+Jdys3
	hNbR1KayatKClSk8zTVZa/oYw+pycRgB8gmqJ7pE6tBfFITnGc8RDOA548mU5lOK
	ygDg==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4fm83bksr9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 16:49:53 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 9E17712E92;
	Fri, 24 Jul 2026 16:49:52 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 04:49:51 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 04:49:51 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 24 Jul
 2026 16:49:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvOL1Oq61wimzULpvuy0G2razB6+2EEJlg3a76CQkDoAoRoMZniU6Yo4VQjYXDDmeikkxgh6+jZ78QoqJD453IKayuOhW5aMk5n4offN9ODwmd99j3zuqjY8LCyQrKhGKE3HcXlNkJvzSzx1YX8/ES9rp7/+JUAkD3xsYe5+pBmLnMkthnnvBGwJMHEUbbNQaufRRsL2AViMpQo3wn6QS0PeYvx2R0wo2t7nTJfYcZXU+PkbdEeQNy/jejDUowupOMkTQ2SKCNkC2r7g1smtNv8CwQRE2MpSALoaDNlJtbq1eqaqCH39kGaIb1ctI6mXKQ0Q6Bcoak/Zww64SjyZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unnpPnekUMu/4D6V3xSYrCZ5Ri5PyV4HiARIrZfBhpQ=;
 b=tTEPZ9AfiXVjNgDdTnYr7gGCkRjn1E6G9n0z27qlZZNdAKLy4bX904Iyl+TPJpWPYNqr9221QBQpFJnTB1tXco54q2X8eeP46i22Sq25b1KwbUEZY0cp0hR8LfQBSIkKoCLKzpQjMMgZ88EyVHx/6Wvl2RKl5+iC4Z4sxPpnPAnIWvb8TmytLsBNp9rcNgBL//VT4XhBJ7y4a08DsQVXdKSnL3Dtm0aJfbt8/2ayZi6ZUOoI7ssFKZFZdkd4/lv3t0uQzJfrf7UPYfuUBnj0wFjkHHxnrjRm4PycwuQT6fNaLDx4yRXe1sQ4hj6AuFwdSiwb1eLowGO8cJLzOxb5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB1816.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:156::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 16:49:49 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 16:49:49 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Topic: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Thread-Index: AQHdG4xwyN+pXhM3OEa6OD8N1C2pdA==
Date: Fri, 24 Jul 2026 16:49:49 +0000
Message-ID: <20260724164919.247162-2-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260724164919.247162-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB1816:EE_
x-ms-office365-filtering-correlation-id: 3a68d0a8-5131-4075-4331-08dee9a39358
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|6133799003|18002099003|22082099003|38070700021|3023799007|56012099006|10067099003;
x-microsoft-antispam-message-info: 27/uCkXxeLpPIyDp/mvyzZlVnhtv0WTPJZiG0KuRKbWr5h5PthwSTRgNf4zvX7LaTwF+MjPCxiJ8De7uBZcqFd7C0dUR7cRmrRe3I3B3OgrHHgcGVt5zGv8tafcyJaCMrGfUsVhA5h/Rcb3jKheTvBgQkPzg51+ZMx+u+SJ91CINvYtCRMlEGsBH0Z4w9EQxAGZLl+cnF+f8dufmOpIKZwUe3unpsvV3UPfTauDt7njfBfdIiCcoCHdG8wip20UP715Wh3t/1cwpEmpycgwsOdKqIMAefQzPlIFOos0T7GTuR+Pz/U3Bv0Zqt0XEwH0VcFS9RrSZEi2SUXp5EnFA1vFrSgjGKxNR6fTnxYAGHJWX9W+4ZCkkt/aON3oB6mFSuKwqoAoeaggI2/V97645+l0Ba7l1UfcmR7d7NIqJA5qCdjKuGdzUvGxLFH/ZH9ZtAy/FnV4BwC7Dz1/BBqJJcutBArLTxee8JEGHTwFXNE5yTbHHzmtSilLkvRnzvX5nkkiT+nvXxQXuJokHeeFsD5sEdp6Hl8+1XRbkObh3ykICXNXaEOXHYn9aNWjA3D59BuAsDanUEz+5QZ6No9pl9rAOb91KgBD+LRone3Knsgzyaky+Hp9AEN/VWBfyuAoPouvsrpaJj9yiVksmgy3J7zXgUVnBQE/8Vmn2SS10+a0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?L459SpJijuzVH48gjf0AS8NB/75njXX+HAEnyEcBkCIgPgQOFPOrSPkpor?=
 =?iso-8859-1?Q?e8a7uIrcK4b/7/Q5Dyn/j231W3zeXbOzCTBl+i7IkDggbp9Ytlo6ceAH1e?=
 =?iso-8859-1?Q?fDU17dqQ4Ax7KxFnYWaRpMiZDLiWOx9XxzFjiciLJcbFWFCq/bjPK4lj9X?=
 =?iso-8859-1?Q?Vf3g5Bx6pTIEf2taOAdvRyCSrwc72Sl1og4CtLmtHbG8Y9N4tKIU8QgZ4K?=
 =?iso-8859-1?Q?Y1ULZNbW+k5OBtYzd1XLW5N79GPXVIENUtnk+1ZHO3KY/p4VJcLTQ3f40R?=
 =?iso-8859-1?Q?APFQ9FhnvlCcGPgnO9FCIX1R2vIsKTxfDQR92ZfbiLmpUnV2GjmxjJh8Kz?=
 =?iso-8859-1?Q?31WDTbh0XGzP87+I4Lfa1eOIsVBAGiog9alM8zN2kXAMmIbYwndgf1hyns?=
 =?iso-8859-1?Q?KERKKA0eKbZ8bLnW5ol8VXUo8Zy4BZE6SUBNvtTKWytr4LaJeqvcRJ9Kkt?=
 =?iso-8859-1?Q?/6ICjUN/RVq6TdGbDhnsx0K0dXoAJ9+ptsS6w5BWlBr/2XB5+PrSOWRDHq?=
 =?iso-8859-1?Q?TpEme4kg6/YhYDT8KFmIJshEPbm/i+3ySEpNzhcFY4kZpWq06Ee30MjALi?=
 =?iso-8859-1?Q?hwzJs3PWU04IpL3PUzJv6r9Vw7GIDJJqM5OQUZySFbALJEgG3W6PbCpc47?=
 =?iso-8859-1?Q?Hmvla7qu/o1zuCl1kcfPNzCOfW9tILQWNQrwWh2xDCwbvHrY7fQGJLtzxv?=
 =?iso-8859-1?Q?pVoIEJ9ti41cFTw5WuS4ACBI0S9hnHZaQJBrIc85DZKsZbzNPHgj6lakpt?=
 =?iso-8859-1?Q?2Sf5s6u/jmDzcQVNgT5Cx9vfsOppQ8vpD19Xyhw83lC5HSbHqWugl0TzKf?=
 =?iso-8859-1?Q?woMi558C1OD802YOlRCMABOGYsKtbr1H4O4kUIdVJIywF2igEU932S7ksH?=
 =?iso-8859-1?Q?sz6Iut0aU6PwVwlJh6mBh7jSgUoxJ0Sf21tYequ8W5MUaeugafFsvXbZe9?=
 =?iso-8859-1?Q?zn2rQRVqG6Wn8UtW2p+NeZU3l3/QpYwT5Z/vnU2jGmoIf0LPk9fcuRv/Lj?=
 =?iso-8859-1?Q?xqoyPrU9WHhSyFlChZ/z2c7b4wNHJBZay7GuzU9bzBre/aZSsM5oCeJLTy?=
 =?iso-8859-1?Q?LV5M/WunDkHimXYtEnQzWE9JoZKyxOhKstTu5wirwzulI1v0yS6twcf+7w?=
 =?iso-8859-1?Q?zohN1rcvtaXGkxD2sFkksl4FxWm7PWkV9oFeGUi3lL1KYPZ8Ltp8k/WaiH?=
 =?iso-8859-1?Q?a4o6hU58Echstv0voHzwn8L9JMNAZNEwk9uF557J+8uF1mybx5w+OgwUro?=
 =?iso-8859-1?Q?Sf42Yjuac6vEMwm9S51CIc7BM+xkRierx0JddiR+XCgG6SaikqaR0e6j1s?=
 =?iso-8859-1?Q?1opgrquCDND2JXr2Hvh1p99akspokRndfEYsvsKXkD5jVG2OsgcHRnirgU?=
 =?iso-8859-1?Q?gmsILXcQpvCfMBc5vd2c64V24jv7B5PKHBelPLRbq2XcyTCTPmA3AqLpN8?=
 =?iso-8859-1?Q?zzpyjpZcfaA4Jjsahoug4fk+bmf+my1hnj4aYSnqOBTWyqR7ECN/zv5tmU?=
 =?iso-8859-1?Q?eKH2UA/Qfj2jy8vw+haahWP8ECq6piZHqbyRMXuT9RekBTAHGMupUpB3Yw?=
 =?iso-8859-1?Q?Htg104Yn3/nSDg80pVL8x9oVoCkE6OHcCwMQJ7mHC8funt57sxBe2OMaZ1?=
 =?iso-8859-1?Q?Y7zD5hZdZCcU2Ag7GoSFj2fZXqZQV2tdSisoUdazrh4+Eq8Gf6D+wUjY8m?=
 =?iso-8859-1?Q?qXWzMtPpIuqpVQ1fVe7emU30nplfq7I/yehSFaz0RsotUKNKBD+W0qWwGp?=
 =?iso-8859-1?Q?9svTW2FgdY1teoZJVKvHf83B+LiyGujBWmr+5xRCyqCGyIh4GM/gefQhm7?=
 =?iso-8859-1?Q?R6oUawW0jQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QnEHIgC/qI/uhgvNdPWqRBs0xdHcEO7e+6cSbp5ZMFubsXCvvjAzk/jwSkMDBFYISqHSbsEKuJW/f73prAq61iaq+Zbe186Tkn2sEc0sQQrFLNkvNykkJB3b0CeT/NDfhYhb/ijf8pmbA2CxsiVOmV55iDJl/rnfzdLhe9gLI3kOVctH0PsuwE6jyuxmYGPgTjMNq89NmMJp3h8y/WbsXQTB5MuSH4XFeMnqVelQSXdqXf3Cw3dk65S/A+aegnqtcITmN82W6mAHT1vLCRWxb4PmaE3ZUO06LSXfz4JhfCyKrFHfsze0UXJOINGButE5w5yaooNu8gzxAVzMRujdIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a68d0a8-5131-4075-4331-08dee9a39358
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 16:49:49.3935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mD5lj3Xcp2QLc670zlGekcxa2OcdaJu0Ta/vV2BoE5Ac22/cl5mqSauRrnqFyHdmeaUzuZ64ns/7VUF2NJhx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1816
X-OriginatorOrg: hpe.com
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX9w6kqsjfwThw
 87PHd1ReXTH4ZoKSue8lrTH3gKt6c5OZqo6/FTmCKG3b35mh0PhdQdMOBW29wDegYihuAozRN1o
 PU4EAUK9FBCJIQbJkdzuyklrza5gSqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1MCBTYWx0ZWRfX2/zYIKaVfMy1
 5iHUAvfBUvRZ7hHjPVuGlgXDKdd0QiB/k5hnJtgD0hF68lzzM4BFFC/f8OUcIr7GjaD+Qp48npV
 qyXSAr3sDhEdOUeXxOYejjrHDSR2Lm8C6McEGPdUI9z+US68YOTHvKTk9d9S7KBas0rQZgxyCa+
 bs3AykE4r0ApgthnhD0UG3EAvldN0nJw4U2uVzDX6ImAWybXTQsHyNcYebdGWYm2lNZstrFlg+x
 UG/UQYKkphE1VEtxZeJpcRbxzP/G8JdH9mdlpdCw+96eZyjjtQimWeHmAXMnVVuuE5lquxaBJfe
 rz9O+SRok5+sfbzvFvmsMWz/+egnyOnLeBVmbb5yoVxzWCgau2Ocol9fiCfpf7xZRPGMReVEI5D
 6mpm+FCvgkzVE7utRJy7qUP2VUjqvEiVv+eJFSafL8TtCEH0JKFLPyTzYyDx1XgdXLkyZIsPMEW
 jBh2/dBRj0Ub6H4nrDw==
X-Authority-Analysis: v=2.4 cv=buN8wkai c=1 sm=1 tr=0 ts=6a6397b1 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=OUXY8nFuAAAA:8 a=0tmZBUMiZGfltDqTPNIA:9
 a=wPNLvfGTeEIA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: DdQFlI8xT1JfI3CkuPVoJQS420Q__Wx1
X-Proofpoint-ORIG-GUID: kNJ2X9lESvAQlGwSP8o4dpRI-BEA-anw
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240150

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Add device tree binding documentation for the Analog Devices MAX16545 and=
=0A=
MAX16550, and the Volterra VT7505 PMBus controllers.=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
Changes in v3:=0A=
- Clarify that adi,rload-ohms is the ILOAD telemetry resistor, not a=0A=
  current-path shunt.=0A=
- Note that the severe-OCP filter retains the existing hardware setting=0A=
  when omitted, and add it to the example.=0A=
- Move additionalProperties after the allOf block.=0A=
=0A=
Changes in v2:=0A=
- Represent the severe-OCP deglitch filter in microseconds=0A=
  (renamed to adi,ocp-severe-filter-us, values 0/1/2/10).=0A=
=0A=
 .../bindings/hwmon/pmbus/adi,vt7505.yaml      | 84 +++++++++++++++++++=0A=
 1 file changed, 84 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,vt750=
5.yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml =
b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
new file mode 100644=0A=
index 0000000000000..cc538de6c0675=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml=0A=
@@ -0,0 +1,84 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,vt7505.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: Analog Devices MAX16545/MAX16550 and Volterra VT7505 PMBus controll=
ers=0A=
+=0A=
+maintainers:=0A=
+  - Sanman Pradhan <psanman@juniper.net>=0A=
+=0A=
+description: |=0A=
+  The Analog Devices MAX16545 and MAX16550, and the Volterra VT7505, are P=
MBus=0A=
+  controllers that provide input/output voltage, input/output current,=0A=
+  input power and temperature monitoring over the PMBus interface.=0A=
+=0A=
+  The MAX16545 uses the same programming model as the VT7505.=0A=
+=0A=
+  Datasheets:=0A=
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max1=
6545b-max16545c.pdf=0A=
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max1=
6550.pdf=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    oneOf:=0A=
+      - enum:=0A=
+          - adi,max16550=0A=
+          - adi,vt7505=0A=
+      - items:=0A=
+          - const: adi,max16545=0A=
+          - const: adi,vt7505=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+  adi,rload-ohms:=0A=
+    description:=0A=
+      Resistance in ohms of the external telemetry load resistor connected=
=0A=
+      between the ILOAD current-output pin and ground. This is not a=0A=
+      current-path shunt resistor; it sets the scaling of the reported inp=
ut=0A=
+      current, output current and input power.=0A=
+    minimum: 1=0A=
+    default: 4750=0A=
+=0A=
+  adi,ocp-severe-filter-us:=0A=
+    description:=0A=
+      Deglitch time, in microseconds, applied to the severe=0A=
+      overcurrent-protection comparator, programmed into the=0A=
+      MFR_CONFIG[15:14] field. The MAX16550 and VT7505 expose this field.=
=0A=
+      On the MAX16545 the severe overcurrent delay is fixed and these bits=
=0A=
+      are reserved. If omitted, the existing hardware setting is retained.=
=0A=
+    enum: [0, 1, 2, 10]=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+allOf:=0A=
+  # The severe OCP deglitch filter is fixed on the MAX16545, so the proper=
ty=0A=
+  # is only valid for the MAX16550 and VT7505.=0A=
+  - if:=0A=
+      properties:=0A=
+        compatible:=0A=
+          contains:=0A=
+            const: adi,max16545=0A=
+    then:=0A=
+      properties:=0A=
+        adi,ocp-severe-filter-us: false=0A=
+=0A=
+additionalProperties: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        regulator@40 {=0A=
+            compatible =3D "adi,vt7505";=0A=
+            reg =3D <0x40>;=0A=
+            adi,rload-ohms =3D <4750>;=0A=
+            adi,ocp-severe-filter-us =3D <10>;=0A=
+        };=0A=
+    };=0A=
-- =0A=
2.34.1=0A=
=0A=
