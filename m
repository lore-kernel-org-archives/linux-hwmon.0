Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84C3F23A2;
	Wed, 18 Mar 2026 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862848; cv=fail; b=dK2HtEU4RidErYOiXRhH4E4MSeCimedaKjJQxVfIsI2sQUfkmoPucWpiAY42KTY93ep2LQSCTEOkHFSsiC8mGWAFBWBctXGkbiZ4UGBgtFonC8Q3WTMK0oC1RSFGIObkSEUSxeaSPSfIJoCSCqpBqlULsVrdKby5PgwuU4PkZq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862848; c=relaxed/simple;
	bh=VaICUOjH/Gu1f1dus94cfmfs4hpxBJalgWmDcyJ0XoY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ijs2nOYFVEnrygsGVU4yudWfr0TnLMRAevZtaqG+OtiBxXg5Ta6Jdl4zoyy5LTBriOwaVRx2pWc85vMDjHWfAQFjHaG3WxAFOrdbRArt6ZWSejEcwO5yfAZ3+f3msENvELHw5/eindNU1Vebfxbdyn+qkMDZ57FGfDhQIaCUnJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=jfAPP/aH; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="jfAPP/aH"
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IH2lRR1690899;
	Wed, 18 Mar 2026 19:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=OGED+YxFJfupMMNmvBsSfOos
	1rjec3ieSXcN6MDbOtk=; b=jfAPP/aHqiRBLKJk+7LmBK9tIF+K5lJm6Ge1aT8u
	N/7LuHZDgB+w9cV4jSl7yzbaeshJM6Vmjdb6kNPZJvbMm1Yg3FAIpc2e166XCIsW
	HLYEx+oQ3m0oGgASvdYYvAEsikz3wK+nxG63+sdjrOfZuDiFM+RQz0kYznbumPn9
	hqp+yyyrGyMbpXny4yUe6SktqhGP0SNFrtoz32VB7tWHo2VtM3iA3ibfGxjYvfl0
	HNJXrKMhu9ftKYUHPB32PgSf4HPsxAG4C/fku3X7afseof81GMmZRRCmx4mhR1Uu
	W65/SNKGJzYZjfAgNZaj6SoJxRffCFXZFEnjOvSc1yQv3g==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4cyufudsac-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 19:40:25 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 80404295DC;
	Wed, 18 Mar 2026 19:40:25 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 18 Mar 2026 07:40:15 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 18 Mar 2026 07:40:15 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 18 Mar 2026 07:40:15 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Mar
 2026 07:40:14 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ac2zcSluZscZQ2fgnUMZxxPXLaqCLP9Oa87L7OJHsJF8YNLSAovszLg+YJyqb0wQxnGb/a/UGQZc39mAshFnH/5WwpWcRm0ldUxCoGOiwyGAZLBmGr7o/ROsHj+XGuFa9AXT+tISFFLSioXH8RHUukclm8SLWd1Erp6vk2vrg3fpTCkS78IQD5j3A1VK2D6QRFXOKJ5jEfTyMspfcYcbgWiC5nVctA0ZK5yQ00IumaT+24ricGpDYxFOccEPAqWpis51dMFDd0IKgtaVUDkmsiUMBwC8ZsULxJBZlxdFWIb0Gsc8H1uBnpxxPjY67h6khr1ghPHQ2qKqJm0XCAEQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGED+YxFJfupMMNmvBsSfOos1rjec3ieSXcN6MDbOtk=;
 b=YZVQSFID+vSfiRHLQ4WApmG2fjZBYxFKtT0oXP8FaDRTKA+0HHAFN3OPLwVq9I3mjEfh2uB7gzF+Q2AQFm3DBFTJSSReemumtlmjlETI3BhdyyuGBpkWglfH2INz609QVIIXCYnjZbYIW0gfdB/KQoXYORt2GUi/tKyFGovlu6w7u22ItujYXMQcEoOW6+PTXPpnUqe+2ekswInDK33NqaX7OPXEaESxZQVBJ137oLAXGaZw7yRr4HQQhR5o8qDXAAwsVgpKYmbaLPJprs0s2jMMQv8WVM7z0vonub+Brwek5vL981ioOtOVibownmCVR3120+OnBMhz3JLMlr6tzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM3PR84MB3466.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:0:42::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 19:40:11 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 19:40:11 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2 0/2] hwmon: (pmbus) Follow-up fixes for isl68137 and ina233
Thread-Topic: [PATCH v2 0/2] hwmon: (pmbus) Follow-up fixes for isl68137 and
 ina233
Thread-Index: AQHctw8IGOrKtyYvWUSuN2YjlM/02A==
Date: Wed, 18 Mar 2026 19:40:10 +0000
Message-ID: <20260318193952.47908-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM3PR84MB3466:EE_
x-ms-office365-filtering-correlation-id: 9844a181-69e5-4d78-aa2a-08de85262b00
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: vrREMLxI8oe8Io2PhqYBX7lAx4JEfzkoDmu7UC5d47QR4rRPihZyywSZqZ7TQgkCZrJZkIIIHxSc/AcD5qxr8TX4HqUw/++7agjBeZqcuEVpcmkLVr1GAgPdPkmIxUtlMxrB0zvl7gPGQKV8FCvySWbkO62sEkok0ThuRU9RqPytEna7L6yMceoOv2w5GQGaEgBQZAozTp/gVap2Foo41MMDlfT+aS7W7oKAoKabxdXVra8uPAnjNXAixKtL40wBWpNcYTKMhHYlkdlpxbrFxNNXtZFJtRzJcL8bgG1Dhjn6jCFmajLX1mQLTUAAO0/FJks3Tu5N6hthG/ppVj+LgFzbOaubA5vdXsgS8nhojDw8Pb1WjiqZesuhEeGZh7CcM6QEFR/9FjSrYM8Z6T16D9+wTpVhPCDr1ruip9af3jw+z8meFSci+x13Ue4mIy2j6PfM4SgS6sTeTz6TRmtDqTb3rTlXM4kk043O8/fg121Oibc9X3Fuejyiu4BQb2YWS+7odCohS1rjxbRxmC+nNDjc0FNX8jpTwmsMxB5zyP6lzMxQ6lI2NKPPsxDkAmsUQFXlvubUBJgH9iC+a63B/GYSBFwtB/pjCSPQU6Gljwu8JarmpnzM6jE2QVJMmJRd3IM+gfx7LCE9nEbqAXJ7FSMYzyMTj1/LphcuV6veMQm1XHElIffW4FQObrMo+eA0sPlLDTT0TqsyT0J1f6EQG37N5I5HUUSv8saJiODC9SpG2xYLJvKj7UjlysxiBLAgVeJo+2WynY3Oh95BxLvxvCkTRyC4o4BiiYvBNVRybqQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+2Oy2AxY/dcGkfz1J1xrYmOl5CUaIyg54VYRhO9Xzi2wbF2VULoaOX0m8l?=
 =?iso-8859-1?Q?te06i9FlxxaLZl2lfjz0uN5DoCH7DF7rNxC2deY+EAsxJXKmikyCKz+MO0?=
 =?iso-8859-1?Q?vBbMevADGoZqHSg3WUbi3PMzNiD4eXgSiiNnrCY7VkRm5M1bJxgif7qqSA?=
 =?iso-8859-1?Q?jG6N3ZyHDJ1LVupr4I/YxAdtLHyoALRIPW+QWQbGOrF1USfXervgNuT+4Y?=
 =?iso-8859-1?Q?fdlm9DlmAaeOLroFFcvpcsQAZUU8sUrse414pVwFxp6h0tnK9yFt8HAhzJ?=
 =?iso-8859-1?Q?78DQH/CUZfKkYndmcvqvkz3npNwRLEQqrngF4eLg6zo7LGvw55LXkQDBKl?=
 =?iso-8859-1?Q?qENNuKjf9t47L/Mz9cI+2jVfvqMEl+t+Z/lHb1EEg1NvCx4EGaH6pBXWIC?=
 =?iso-8859-1?Q?0BNf8VvNKBXkf4wO+4qNfLZ73sgjZgOMrcsth1exHZtS9o0WdnngMLM9h4?=
 =?iso-8859-1?Q?CR42R6Zd9FpD4iRZxuX7n8qkT/KKWIiM/FLZMYb38jUbO3yLca9qI1iqgR?=
 =?iso-8859-1?Q?zSAUfWnfTiFYBzldts/q2CLb+uoo1gsmvJ2d4vLWKZxoLN+S9p0P1itMe6?=
 =?iso-8859-1?Q?ivGOmBLsaIRahn198V4zr0b9XoLNFaTlS5/P/cg5Or7OUBOAEN8VvqiTDL?=
 =?iso-8859-1?Q?QyT6y18lInuSw7nZet5Fx8tUgcnsIYmA3mjVA4gt1QJs2NVdlBIzM6eGEg?=
 =?iso-8859-1?Q?50FmYVkGfJDgJ16SPpIVdWKfPjsEJx+DKjA4fLSzENT6jHZBwYHJprfnjG?=
 =?iso-8859-1?Q?6GFw5960bOf3GO+V3UMbvj5K0loIgxdd5kb3/JqlFgzr/qrYUMGSmZ5rk8?=
 =?iso-8859-1?Q?1GEA8szfuWLIPZ3Mhs3KDYwGMAEEgqzNzvE1fdmWkTeWC18str4SsJVfp0?=
 =?iso-8859-1?Q?3Oirbmd7bkyADvF2KNJotc7tewplm1Zz6UwwXoVQ9USI+3I8XQl2R2WQTB?=
 =?iso-8859-1?Q?aq+UMAcUJaCwlzNHoGyXBUCcZRMXZALax2PKT4Ji7uKpQKornYoROIVAtq?=
 =?iso-8859-1?Q?fXlq7a8Gv53lNNFYTQInq6ImSyV3vWUqdq20TKiRVVeS9oCAuOPbbcNs58?=
 =?iso-8859-1?Q?TjD2GaLig2wQ+Vp/VH54MdRBXSyJw7qIxRYbOiLuy2ZNyStDCbEyk2LFHn?=
 =?iso-8859-1?Q?L0Y2gGbiPR/BNpNSawFtHHK5ne2FEqZkCv0IcU/aO+Ax+MteBb/UIullGK?=
 =?iso-8859-1?Q?jNZm5bZhyXEs867EFCK5TKANWLQMyKAZD66efCy/VgwJnyOew7HqXztZZb?=
 =?iso-8859-1?Q?bxY9Tp3R1Iy43WkUZ+spFQeFveQPaUw0zSFY1mr8FooXNrtBYMKbbZHkEK?=
 =?iso-8859-1?Q?RhJfN0JzQoB7RjxL6fkzy2VSA7ctMeRz6dhxtM0UjmR6Tkg3nVSCmuOGMQ?=
 =?iso-8859-1?Q?kBllOcgQ7njP9WH4Kq7E1IMcXmwdMAhOqSh7u06Qz8jXjOKB7a2/iGIORd?=
 =?iso-8859-1?Q?vFFY+jTPZgCFK39xc8OtLkfA5rfjRsjR/o0jXB27dPNDvuQEkThb2Rp0rl?=
 =?iso-8859-1?Q?osEVViMCi95OgwVBBYIQoBbUhitL1JmDTcTU0P2OHgBrUXMQJjKp2YT8bQ?=
 =?iso-8859-1?Q?DnfgElvP8Pp4SXozWrnpSppPA1T2tg4WH5k3uzzhUAE2Jn6JvFfLL2C2tg?=
 =?iso-8859-1?Q?Rse1eHPc+0JqP8KX0sPdEm1xzNaSPwoHK7Jt0J9djuf+JLSTpW6h1/o5k4?=
 =?iso-8859-1?Q?zN5gYuoTItVuX/oKoL+GFxYRHRk4IsE5nV8j9g+Qzyc6udbNX6D9+l7ict?=
 =?iso-8859-1?Q?okQSBSKqKOAgRIP2xBLqLPoqvPas795nry/La7OdPkvgCpUvZUEvrHwcFy?=
 =?iso-8859-1?Q?X8yjd8QHPQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bpYshQjuzGWMizwUhRxfCXR7Roj82QJGmaj9D24rdiAq24bNB+P2qa3kEcgqELcgcQOHdtZ0v/MW3ioQ1LenevKETntqgcZRRbaY12ALyCPTXXJiqbdqz7130UGUaRGM0LmpMCZ3/wUEzBMHGxONhqq6zRWLz3D2ZIuDyitdZ06h3pupmyPZWIuEuRTGG1HlrcB8USBhXAsMBCW1hr5iS6qXFUIbZPqsVR83GDO/ORu26nRKIY5WupIRHiZfkuWSZjntrfoYC4NB/wBJgN+ePfx6Ahpkb2LckTteWDCqQmkM/n1zD7bKvPK+fJPt5L+75nvWj3itDPoMzG0sGen1QA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9844a181-69e5-4d78-aa2a-08de85262b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 19:40:10.2997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nFJDdIsry3mtt6Ztb9y94XGSRTSyadrU+/qAArAJTjYTG2UKHkpQmeWD2IidshVQDPWCIaBTQzdINO7DTYWAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR84MB3466
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=aIz9aL9m c=1 sm=1 tr=0 ts=69baffa9 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=J0OTuHAx6l5K1fCpvPfz:22
 a=OUXY8nFuAAAA:8 a=FKlWhglNLlQLTCYP-LwA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: WGisdGMM2nyBqz27pg4HzpfSNkcLIH4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE2OSBTYWx0ZWRfX60pAa9LkA4fs
 YfUZfurKL7iuIIuFFG6Zj0UWktCQqKn1Ftz9Iqdf/CCWUQ5mkItMiIclU2Vz8TkYEzwx2OvUsfA
 5998nmFV7YZT2EmOJ036/qjbOUUrDFWgvn8+5tMQv+JhbD/qtivdfqQRTGXwyT5QKowAAXr7TPF
 7ud00t6TBahjS53SmuIRX5Oi41gcxtC+LiAy3Jbdw/enERdmmHDRALinbDGM0A0ZbA2qEGdRZrQ
 /uHm+T97hlpbFk7xSeyo/Mtycv5Ob0vF0TTckGICseYVde2vnQ0GU6yw4e+Q+S9lrY0/TWjFIFQ
 QtnaEg8HBUBMbLAnndm1XQd3MaHZr3SqXsPGkOxAil7u5LpL0Jb9D4bFma6PKrL7mn8MNTcPYhZ
 ZLEB9Kf048ZTa7CjSc5pWC7CYm6G5MdhOTXzQIgSmftBsZk+5nUmEwDfRBFBqHQOy8eGOfV6xp3
 VoOoY1moESe2N1X+Crg==
X-Proofpoint-ORIG-GUID: WGisdGMM2nyBqz27pg4HzpfSNkcLIH4C
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180169

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
This series provides follow-up fixes for the PMBus error handling series.=
=0A=
=0A=
Patch 1 is a revised version of the previous isl68137 patch. It restores=0A=
the original bitmask logic for AVS enable reporting while retaining the=0A=
modernization to sysfs_emit() and the new error check.=0A=
=0A=
Patch 2 is an incremental fix for the ina233 driver. It ensures that =0A=
negative shunt voltages read from MFR_READ_VSHUNT are correctly =0A=
sign-extended before being scaled, addressing a data integrity issue=0A=
identified during the previous review.=0A=
=0A=
v2:=0A=
- isl68137: Reverted Boolean logic to (val & MASK) =3D=3D MASK=0A=
- ina233: Added (s16) cast for proper two's complement handling=0A=
=0A=
Sanman Pradhan (2):=0A=
  hwmon: (pmbus/isl68137) Fix unchecked return value and use=0A=
    sysfs_emit()=0A=
  hwmon: (pmbus/ina233) Handle sign extension for negative shunt voltage=0A=
=0A=
 drivers/hwmon/pmbus/ina233.c   | 2 +-=0A=
 drivers/hwmon/pmbus/isl68137.c | 7 +++++--=0A=
 2 files changed, 6 insertions(+), 3 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=
