Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4D426F28D;
	Fri, 10 Apr 2026 00:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780808; cv=fail; b=Ijj+9lVV3fgn9Yy25ZWTvwWNn8vr6rqDCEgb6BJTilZsxbOR3mQ7cE08OoOIVjomq35A61/cJeemBD5QDCfd6IAdwqO/eZPAg6kNDdVeM4e+Guv/ixWrWRq5jVp7RSpYq+YJphyEaefBZbn2BTjlVwWzwKMEKluGbiDqdvx9GOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780808; c=relaxed/simple;
	bh=uxCDQyUEpRNu7G+C2Bg4PGsRNzZ/kRyOOLIIWMJz/uA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BSgY2l8/9cZyOIr3781FmUy4zFosl963Y3dSkUEdxL8vQJ9nw6JhOGB8IkuvH2qf04SP6MEibKzMrPgIxEYy2YhZ2gK6RwhmaR19BvgDTE7Vb6ceWvs3gSyNeFnh7dRbjRfYUasMdJJ/Vpmbep6X2rJaLBub+qzbESDM/xJ+mHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=k/BDTEoZ; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="k/BDTEoZ"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639NFJg63153224;
	Fri, 10 Apr 2026 00:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=GJkpL14HAg7TRbf2GYCAIpb8
	3tvu9cZpqRB0Ipt003o=; b=k/BDTEoZlEGrJKjKEXDRFXgvF2/hKJ8Lj341+Y+C
	KHACoXddqA3d/sgsXfQZdc8aDQGmYFUv7GR4QIUnKYqi4sdgF87AopadbggHo9gp
	h+EahwB1PHrVgRpTi8CHW1zFBqVwWs2M+b4SVaKyfwMX4BH6kdhenULKwiPKOIF1
	ZED4He3nu74jMzwXUJ+kxMtr3H1wh7YjuUVFN+sYI/wn/MkULQ3kelk4apR6cu2s
	vcp+F2CzzsR4dG6b8P/5iQS5rdwP7/2ZJpvbBu3RhWgULwrZ0YYiosM0WrpFdkkj
	jH+44JBdnpL3/YnyU744rWebNL22iEmx+l2SvTy6NGtJEw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4decx8y89g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 00:26:33 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id E222D261;
	Fri, 10 Apr 2026 00:26:32 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 9 Apr 2026 12:25:34 -1200
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 9 Apr 2026 12:25:34 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 9 Apr 2026 12:25:34 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 12:25:33 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkoiGfZAij3ynsiGylULyA8fdBfFuw+wNgJj/Uni4S/l3ZiGbafJEVPaHsr7zQM4aiCjgeoCCz8/bzD3gLPPh4AWDeF6z22N6Yz+p4ZgV7nvVMMffAL7bLzxfURrSXUUJXdtYeyH+v1isbtm9CuaanV/b+Y1oOBbalOfPmxskXT/WwW+4CxEwJ7KZe464a2HuxU4cl9xlYt51zfAUTxuFuu7yOVzK6jolaZbo2ZVEhv8iZhe1YTh/YYkIG3+mwXtvuwTSnZXLJVbf8pYKkFV8Z1ZSFK/jSc+nvldGgRhOblog5DwpUOsPBxjW/jerVwd8NxY2guC3iNcVnsFM08iAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJkpL14HAg7TRbf2GYCAIpb83tvu9cZpqRB0Ipt003o=;
 b=fbQebjuad99o1NV3TjldCXyzqi46bWeOuf5qnLCdqf0QjH3wzU8KiELCk2rVtwRaEuPIJRtdfogNwmXelboAeQY8NrvM0xMu/MdZLhhsyRkpBh1Ey2s7cYotBUuQwtqKpvtN/leHTTDDo6az1BXoV1NJlN/TvRE/j9wmAxOPyKZuj1fogbrldLNg8V0uoYUR9MYIbTjlNKjKSC+wWlH49koyZAuHrGNhLp9uG3fEy+v/UxCat8mJgVXqjcTxAs1dJ3UzXfqMs9gYY1d6IZISvN8tYxr2Cf+9hGqoKtOYd1ANy2uR9Vy6+30ZnPiIsrL3fKJq9ylAY/aWkhzOfDNeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW4PR84MB1706.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 00:25:30 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 00:25:30 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@weissschuh.net" <linux@weissschuh.net>,
        "linux@roeck-us.net"
	<linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v4 0/2] hwmon: (powerz) Fix disconnect and signal handling
 bugs
Thread-Topic: [PATCH v4 0/2] hwmon: (powerz) Fix disconnect and signal
 handling bugs
Thread-Index: AQHcyICJz6Qd0objRUuJmk5EeE/0Pg==
Date: Fri, 10 Apr 2026 00:25:29 +0000
Message-ID: <20260410002521.422645-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW4PR84MB1706:EE_
x-ms-office365-filtering-correlation-id: f9a183f8-89ed-4651-0346-08de9697abc3
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info: BfrDKr/cULiGwK3GnJaxRN5NbUt2TQvIYwfQWb7Ur0YTqbCUy6YLlLXel0VRD4k2Lb7jc2W+HzaGkFKn27u4YOKaEmZxFXqRIQstSkjWIKzJnuhOxhIWlGRwSFiZfZLc3yx1jYB98RxFY1e30Oi4asrC4tGhLdtadt1bxnUS/t9XHNFBY9Ll98lCQpFArO2VBmx2gx0zdXYudn5ZQ1s1S6LT+izqe3Fx85BKYVaUB+/C5RkgyjiDYzED3/tl+4JskTIgChU3aj4FGWYM1x4EBJOfnGpqqMQC5B1YzcBL7Nfw/gf0u6p8MO6nun5jC+oL5yuck5gyZ0iN2B9R3RkVYhyuWWJLGOGlRKJXiSqYLbriAqRV2Jrv8B9tecCpxEkCdThK2RAMhIvogIih5TOCB0UkPAFMNxoWMzb0q6/t2HYjxee4Z+nQq63hGEIqszxmZ0WsFvFcwAIzS2rIkeWKEOvKI9GvK6GyU+JQ3Xwq8uNHKDm772xK7CPNTaN5+Ua6GYQXLJj+ydZITArlsiZpDJLI0p8+Yx8TPYZY9aKf4EX1AFB9lPh3wHVvV8/+tLPIZta9T4MCs7wavI5LkvJIbgYMaqGNDXfXxBFwdVG8JDsscaUwg3/+XpR6eL56Ar6XakeS0BOarRxjTjPGd/gpKRXD0RNMkCEBzoZs6Vh0HMRoF8yIymlIqIeTll7ulNGTYkDByajuufez0ltEftzHpTjg0ZiXYvwuTELT1jqXAkhFeCPBNOmjS1R3c8ypOksrsK0UXVziVRvmw9uPJDuSww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GlsEWPCpTT7gKZR4sTfp3VQ4bNk4gdZYk2h/BSjmucW2FR5ILaa8VxPlkU?=
 =?iso-8859-1?Q?OGQrNpQ0Dq0yFG6iErAnvc337Qd/MKrhdNyIhP6LtFKUkwy0aNBPqeC3XN?=
 =?iso-8859-1?Q?PH0QPd4hXVshhQ4aM+BnGRvJEi3so+1Ly/aFqejo2JvOCoq0HAhTZmfxrU?=
 =?iso-8859-1?Q?KSNGuFbLOJ3aJBSdJIT+AxXUxAfFRc11hDOWG35312jLjGw/p+LMeCIelW?=
 =?iso-8859-1?Q?SOma1B8DJKSj+acV30ZwB2RIJZNzYB2SrBgwbqGRIeK5oYZJNoRE0l9ZOl?=
 =?iso-8859-1?Q?/bfSKlF2PcoSY3i/8/2M95EQNot5XMB4vAu2iTHo8ZRQ0X4kgFOsyD+9SD?=
 =?iso-8859-1?Q?uKnHipIYddExR2fnkCizTj0QN10lSvj5aVOBedvgTn/u3TfVbU6wEweahE?=
 =?iso-8859-1?Q?Fi7q8TEsJ2EG26VYdRLApX9PvuAPk6D9OZwm0yNLh9uIa1ectENFWAutz1?=
 =?iso-8859-1?Q?eDIS60dlc4vDKGCQ6v1WSQ8KotzxFx0ROAvL3r/goEcw6HHvR78PsBdjoR?=
 =?iso-8859-1?Q?pVQDePIAngIr7hOd0OY7dy+WGXHmI3emZtMJyTl5g51i0RYsGnxzTE7TF9?=
 =?iso-8859-1?Q?/AALJERRSL4rqE4CQjmClmsqjhWi6NiZOMlt7mhSs1zYArPIox0oLcobFL?=
 =?iso-8859-1?Q?8RQNzbqRFb/UgkyoGbycaUdnFLGg4cQPiM1De5690BkhCQvQDHdBe+kId4?=
 =?iso-8859-1?Q?YJ1y4fl4Gzh8j0BEVG+SWzlCMa/r+8MY7F6il30mJTUnFG/s8H+tAYlJ4L?=
 =?iso-8859-1?Q?OJyJrCfd/q6OMZbty0/aAaSAHJB3TygiYzNfuwoLQJj5aUQ5s6cDBxy8Sc?=
 =?iso-8859-1?Q?CMS0Ah8ck+1llbJiV71fvV08lRhNkS7PtEMVk6zzp3hxaNkIeY5MsgaGD6?=
 =?iso-8859-1?Q?Wa7do0Y1C3ZwCaizH1DklbhTcpbCvcxKo6KQz3AhndurgdzNNeehi75KoO?=
 =?iso-8859-1?Q?FZobZHQOf+V2i6j95OGkh/eHMtAZU3gBi4HaMw34XaHyBluPq/oeGOJJqc?=
 =?iso-8859-1?Q?NHzo8wMnN+6jxO5NE9F5GUYtkH+sI0WQQPIUTkx+WIHg3J4qrmICLb7YjV?=
 =?iso-8859-1?Q?kfZFH39puPf90urQH5+1W6OuODsod7mlT0p1mu5uX4p9V5R70sgm2RNcQ/?=
 =?iso-8859-1?Q?ixNNLEf3TfDlwebct2GJUz25ufs33TXPyaV+KyLtn8RrTtbVx0bk2UY7BD?=
 =?iso-8859-1?Q?3z3sg8nPAGZ+n8I36E66AlUGOpGbkVkHMMa6RuabiLTf0nVtut116JhomD?=
 =?iso-8859-1?Q?5noSQgXGNINstK8QE8uhuYjojHHYXeoRrahcAPdk8mor324CVRI/RSt56E?=
 =?iso-8859-1?Q?CP8Z/cl69EPTSZXPaFEyOmyFNNfvoH3GzAteeFlPxFrfcLKdj5Q06GktWO?=
 =?iso-8859-1?Q?pj/wNsIrM1GukErptkWlnegZRYPKx8BAt1KulwuB58RSMmbOChCZoCRr+C?=
 =?iso-8859-1?Q?g3FEUjn3BjdA0osbEAJeJB6MR21MHas9w92+furKFz++YlgRwIWI8kmdtK?=
 =?iso-8859-1?Q?M/28HoIj5g6BuiBJdDMX4y65U1rLGCuL5K08g+ndJfkSuuQ0qQpxSKyPYe?=
 =?iso-8859-1?Q?f4zqfMTSHPqfsk0wi7Pguw4GsMNvF6wIz6SchXlCs2fenSf1o5WjCFMB7s?=
 =?iso-8859-1?Q?1U+3LWvdmUuUWIgxYURXXX5a/lLjIIpSXBa/ArJl/DPCDc8Dj++gbVbdnH?=
 =?iso-8859-1?Q?YpN17V227tYL2MwyT8mMv46//gwUmDO5DWHURqQ3V78G8ZtuYb5mMVP54j?=
 =?iso-8859-1?Q?D6CeoQMIhFbIJ68efBlCXF2CQ7iOdRfVvjzYrZPHhyyaOS/SYlda6rtlMe?=
 =?iso-8859-1?Q?aFKgKyadzg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IWVM6iSgR26xYXMAFCxu9lKAAtBAB3vAIKoi9AXDmS4CwR851oXTznUoKqOOun3fraER7Uk73WLfFWbJ3Hh2faHYXG1EpAW9f5OxU1zav6+P1BIBhbgzbIFCukRvJM/Pi1eIMfb10fSkSv+2I7ZHdf636AgEf0W73uWUOkqfWl+7AQl7H3kLvB3jlHwuQQ42klPXgj5pfb0pM4vCQb/jhxr/At3Y0rXCnzBLZmbzKlbYSFzRoB8f9Vuv8/avLgdagdEvp8hSdTHtT+gBPKUfnbBKFYBJTPXewsqN+nX7CJEZVxTuaB8uZ9SDPgvLM8DbehbH9iPum1qsrdoYjqWBGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a183f8-89ed-4651-0346-08de9697abc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 00:25:29.8847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMUenCdM7v4/qj2piPtvL9hBlryJgViKYqItSYyvwJtnd0rOEAbodsxwiNCca0YnPHgBi3iPWweBMXDnZLsoEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1706
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: J2Zs1NP_ns6i9sKYFNxAGoxcvqOhS9mH
X-Authority-Analysis: v=2.4 cv=IfW3n2qa c=1 sm=1 tr=0 ts=69d843b9 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22
 a=OUXY8nFuAAAA:8 a=Fvdn6QhTdhsk0GRR0NkA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: J2Zs1NP_ns6i9sKYFNxAGoxcvqOhS9mH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAwMiBTYWx0ZWRfXy1BllhaJBF7z
 gOdJi0gbc9GG/QlCklrWqtAPdcG2EelB2uqpaKWbtt8F5z6Ne+TErNetLweqjCOQv7u3HnyXZF3
 HaHTqYB31XsEhp2fZgUWqkxVTw+u3VmYHjU/gzoeu99TBRXORBrApA2+ynN0/0gQx2P++L/mnTc
 c7tz7odVgaKwIdcwVK6cAnwaoGVGD8n9UkxKQJAhHT9jSZ6XcsNFYDY2VRgjub1Nnyr+9qPalug
 +dzFpE6Ll7S40+7u1w4H7OwrkX1/dRiALuT3KFd7DjBQQ4dlstnbllqBCrNloxW9lAvPYt4RQwX
 Y58xNldEc9s+ivJK/DCPP2Z6F5AtdpVwyiFe2IivhL2LwseuWdZUIDLc6d9FCsYcpbfnkYo1VbR
 m7VtTgM3NarZvn7yJhc/qieSQtWtpEYh4r8CRMrRoETm+p/aHzMkw0FCrZUnlv3VvBmtRGL66ey
 jHq1U+g8iS+7WtaXYDg==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100002

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Fix two independent bugs in the powerz USB hwmon driver:=0A=
=0A=
1. Use-after-free: After USB disconnect frees the URB, a subsequent=0A=
   sysfs read can dereference the freed pointer.=0A=
2. Missing usb_kill_urb() on signal: When=0A=
   wait_for_completion_interruptible_timeout() is interrupted by a=0A=
   signal, the in-flight URB is not cancelled.=0A=
=0A=
Changes since v3:=0A=
- Patch 1/2: Split from combined patch, reword commit message,=0A=
  drop unnecessary usb_set_intfdata(NULL) calls.=0A=
- Patch 2/2: Split from combined patch, use long type for wait=0A=
  return value, split into separate signal/timeout checks.=0A=
=0A=
Sanman Pradhan (2):=0A=
  hwmon: (powerz) Fix use-after-free on USB disconnect=0A=
  hwmon: (powerz) Fix missing usb_kill_urb() on signal interrupt=0A=
=0A=
 drivers/hwmon/powerz.c | 19 +++++++++++++++----=0A=
 1 file changed, 15 insertions(+), 4 deletions(-)=0A=
=0A=
-- =0A=
2.34.1=0A=
=0A=
