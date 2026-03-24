Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721F3E5EC5;
	Tue, 24 Mar 2026 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370275; cv=fail; b=rB64ZRIYZFZT9vXdHWEsMxm0AIboMMjWnwyfuZXZc3s5KTMAxQYtnNH3hUtEww/wJ6sy/CiHBX80vN8hbdTzQRWJboiVLpY/oTagHqxLBGS5XSLR5jPXod6etdts7P+9mdy7lTCy9m8yOwSMmnZhvj6/CkhPEDTzgDxew+IxBmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370275; c=relaxed/simple;
	bh=pthntj2LMKz+9FLKEJe0p2wvhL73HvtWvuyQ8JAAQpA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gqSAYNMbeTMYPllUaahal3r5OH9dTmWq7x+TtJgiryZts3Uf6eH5DMzkyi5Swr0mLrJGXkGcIBvYQk++yLD3OfvxLOucRhWhICPss0i9AB871g0ya2ggf526rnqnOk831qN/FqAH4NVvPtM20J6JBVieMexmVaDJ3mE/WEOmnrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=iQYJwfSn; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="iQYJwfSn"
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCueYN1047780;
	Tue, 24 Mar 2026 16:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=pt
	hntj2LMKz+9FLKEJe0p2wvhL73HvtWvuyQ8JAAQpA=; b=iQYJwfSnXcz/Kwj52n
	D2nVKyPI0Vwh+KcT50WgecLARuMIur0Ytz1mV5LcCLkrLyMmhaT56QY3n7jJsTrh
	zRHA5JAEkntNFXP2/YombK1hjzSh9tGWuqiHlKiGbdMOEJUW9OIMJr3Fjlr/ocCZ
	d2+TloawtE1CEx3P3is1rmbai/cP5mz0O2jCMSqmShQyNN2LIX/Ny2tjRNZhjnqS
	4OaHdvkrx0t8HKqDxlCwDH04g3NJZLDm1pU34AldhPncVv2HYeBu9jZ4i73++Euo
	e7ekfaMPhoDqYQ1w/wnvNnAkyfEm1EY5WUtSBikgde/xvFvvDNXpQCxYnu40GOc+
	G/bQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d3u2hk3tf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 16:37:31 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 39CE6D1F2;
	Tue, 24 Mar 2026 16:37:30 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 24 Mar 2026 04:37:28 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 24 Mar 2026 04:37:28 -1200
Received: from SJ0PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Mar
 2026 04:37:26 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyRpbL6BHWtA50s2icnMpxKx+8AXvfS1hceaC2uEMgTaymKB03cjyv6xmSPXliu8A6hRxiGqJbp2On/Yr9qOjCP0Ez60Hf3EOw7FJmA/gGm0RJDj7xOFf3I5TApQ4iIQ9kUjY7Ig92x8R7UDOVCL61yGVDfK6QEmksZnaaz5F5blTXY5ZPgxyXxAEU9fYsO1cOeLuWT5JFQNFowCEEcQhUneFetcZgNKFnRJmJ2FkHuMMsGG3OLRKZ2CPTvU0EkU6vMpEQe9cI3gdYUy1UFkwNqwqjmVUiMlfWvonGy3lSavGo9cCTAJNjlmxKer1ZBqysAh0a795R+6CjvxFNhrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pthntj2LMKz+9FLKEJe0p2wvhL73HvtWvuyQ8JAAQpA=;
 b=I0HbPS5BiTCjulDWbKyb4pWvuUDKBv1LoGzBv2rxxsLGWhnen2QFqP5ZIDg+MatCLWQVv6LoH5A0nKHcwSWRqwujb1s1k3V2yF/fAcqDP3scaZAfNiCAaaziXp/u/Usa0BRPz6iAT4l7iP/LOKAJT+8KCv3nfdWa11NWeIy3B1nJpkXxcZTrbGMrhP0FcetnE2DjblVv0W8bPGYWwJiM+ZFhqdX2LIa6MEse/T1+yrXhhC5T64zdZl50LP706RZhftQqZ7jGXmmgTnIMDa0dm1d6GwCJEJmw+RTm386u7VQf5qvXU/6N67AOM2kBD/nmj7E5IJtb1p7zq5O2DR+xLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB1488.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:153::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:37:24 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 16:37:24 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "wenswang@yeah.net" <wenswang@yeah.net>,
        "chou.cosmo@gmail.com"
	<chou.cosmo@gmail.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502,
 MP2925, and MP9945 drivers
Thread-Topic: [PATCH v2 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502,
 MP2925, and MP9945 drivers
Thread-Index: AQHcux1uqC8alSQFB0aGwXV7Pr3dirW9FJOAgADOGwA=
Date: Tue, 24 Mar 2026 16:37:24 +0000
Message-ID: <20260324163708.215593-1-sanman.pradhan@hpe.com>
References: <dbab620c-ba74-4c5e-904b-8e6536a5aaae@roeck-us.net>
In-Reply-To: <dbab620c-ba74-4c5e-904b-8e6536a5aaae@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB1488:EE_
x-ms-office365-filtering-correlation-id: 2554c891-f689-49b3-e39a-08de89c3a100
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: ptCYl2yNeC/RAx1mVECeRXyroSTnXHFXnFF/cG7uTyjH2aM+3v2xS+hhDe47pD807Wo6RhtAf2sqveLI96V5JPBL8LICo0B9xOZcP4EKV9Fazi6D3t28xh/fM1bYKFlUfEXtGyIx2vjKZeeCE6px+xHr6lhHSZ4rKe4bXbhoLFOJwknzMzH1gan9qBf3vltS0xAzRVajRRuhShGXroyK+gd4NBuFyRqfD6SIIASXQrwEnJoCJBhjS6pomXME7tkOecBVJGofCilo6m/s8oW8qU/zocCBBknkWdg/MmkHqYGcejGLrTjoX0DXV03VLYp6G4hJVCW5ZPDXZ7OLaJhSXU6//fb/KKVGOrsvGsvF4k9z0ADJ+CJOgC6JuQ780d/Ajky9SLz2GFPs0gQPEFPjeXtyhbzvS7f/DVXD580+Y8/5q5r0nICUbC577Qkctr7XgKx2db0Lmiwvx1dGeDdXgsaKjeWQjDz7aCoqz4ndS5v6GeXzfUam5EKAus/5rIszMcDR52uVnwlDLw+ar0f2Qft1STCm0e+XjSjnaBkCtsU03hQ6LfUD3JPN5Efjw2TudIlcrazlzgHKb5LrYnUDsnOXahUmZrB1ZZTZ6dwAt2olGOAXCUcaf3OGXZHVxX/fxpooOcEjU50hRwpNlxoMJzVzA7Nk3MZiRQsy5YPVB7w2NKvR5Im+Y//2tE3GQucPT2w/6NoRAcbJ/r8xdlKbl9ID83oEUUtflGAL6ZYVqGgffuPPqROG96IQ6AoL4QUrjwNkGyFnUhszm3+I8+52XtqBm9r0sXU14IhitnyHEdM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0mXlAvRY8MvDipLtC7Ylz0aPBf8TxzxoPn42uhtafojG6MMrgy0UOvuLJv?=
 =?iso-8859-1?Q?lLwqdrU+KM421gXfUnAIbjbQUQaihQ3OInyvRZwbOZTbRu05qvN6wyiGrR?=
 =?iso-8859-1?Q?pjiuYBr+1OALuenvAWDZR9Y+EtNJFM2G3Ut9AI2M+c/oF0elI/HpG51XAL?=
 =?iso-8859-1?Q?vr0UAwN28gMAXqJ2BMp3Lz/HBWe4xzYWzYqYznhI4+zGia2KU7uYiLCvyS?=
 =?iso-8859-1?Q?WMGrQVZ7G34nr3DXwnOa+R9Yk8ciHwCkwctfFhLN7OAi90PtdUX/5wqZoS?=
 =?iso-8859-1?Q?/ySR53OBuE4fwE+ZQK+V7VGaB3aI3TSDgGdIk5VtDALCj3UFLlHyAGyvxI?=
 =?iso-8859-1?Q?weUT/8qoir+IaZF1RgiTGkoUtI1WbC3j0oZFXyQC8CmxFyAcIoeiirYefc?=
 =?iso-8859-1?Q?ZOCddjs/dQqROmtNe7rUveNiAhK9DUdiqkh3xMiBbkkx3+bm84F+GNQbId?=
 =?iso-8859-1?Q?SWbfT3GcBn/xayCbS5migFnhA74fXK5gfZvhP3QG7IjCuOm0r7hob5f4k8?=
 =?iso-8859-1?Q?nh7oET+nc/w2pxc4BJBC9PQ9azhJcfY+1gNeEbTufnVmvFb5F1FjVxIKkg?=
 =?iso-8859-1?Q?EnOljWlaTbk+92OQigkpNF0HE1VZBdecZ1Be7rftnY13PzdY6cXSWYsqku?=
 =?iso-8859-1?Q?1WoKRlt5/BzxvIFCc05GMDYszzD3CKWKzp0pebS73kQ3ZeIRH9WcmEY0e3?=
 =?iso-8859-1?Q?WUGoFxYCqPWUBYDIXHIOgOBY1rb8VO9NOV/SFGgycRsgTyoGx6CJ2msgZz?=
 =?iso-8859-1?Q?lwlYMBMdtSEd807HpeYDF/sF3jw/lNawH227KKeDD+kd9tUZ0Uc6OqyPDN?=
 =?iso-8859-1?Q?1lLQEZykaMb5am6oKoVAiAANom7/JL31zw3gjnVcCFJLccw09KXPeY6grq?=
 =?iso-8859-1?Q?O784UjrhM6fuyNDJ1XJeoLcf8n22/K8PwnEd70N3anVY6efKRqAzs+x9Kg?=
 =?iso-8859-1?Q?e1O3d9D5LusNjGRQJor2IBlW8nA39/Ii1xxR39B+R2WegiL2rWuXz6Xu92?=
 =?iso-8859-1?Q?lSQxaVFnBwlHvdjYcWmvSBarDOnUWyEvuA2KUnIPJg4xcEy8cyQFCLKHvL?=
 =?iso-8859-1?Q?hc0PLEayNunpGOR/GB0AjCwGhu01QMCtTmGIWJxj3wZOBNWMQXgbRFSs6z?=
 =?iso-8859-1?Q?jNl2ngZ198/y8mNW5RX6JxufqvlkQT6owtdGHqrisbeUjYCKlOL3Zl9XUC?=
 =?iso-8859-1?Q?7TpWe+Yt4SfWkV+CHLfTUb2AZldH9hlRoPjtmtDlWhO5MQgay0P2TS0k3l?=
 =?iso-8859-1?Q?Ru4EgGpVvz2hFl0oWLjuIVd7vOzcdnLrxosn+YuL7ayyZBqmVjWJ5FGWtQ?=
 =?iso-8859-1?Q?J7wDcGfPw2ocs3G0A0siZlaN3ZwLYrutN5bXPi/slbxpYxJuwLq0uflQCc?=
 =?iso-8859-1?Q?gzUJqSKmLLumRkUJD+UfDAF6+y3EYN8sVrjLeyqk9oYo5gSgoFOVnAmuIm?=
 =?iso-8859-1?Q?5ZppEUOmfP6H+eO7RQoXwXYEEyH7b/wXKyzUCcd5ngDZml7bvPZLbxvrqX?=
 =?iso-8859-1?Q?TUZ7YKrkqCVc3LhkbbqIVpQ6pgVD2VPgUvLQK9Xu6f35saaLM2vYiEtCVv?=
 =?iso-8859-1?Q?iLw/8QqW0ETysQcqFGSimDXMdghMowzoGiXn2OzTR/TJb98AegjbEphojO?=
 =?iso-8859-1?Q?BtiaM66C2vBWhn6fAtY6RqD2qqOJE/O8vru8zfpfRTSQAGSQk/7iAc2Xvk?=
 =?iso-8859-1?Q?xDsvoYPBCiB+cpV+fBKcHkiEvDUDhMp9BnhBErzMKhJaY0qKZAEaezfkI4?=
 =?iso-8859-1?Q?yupWGfBvdn46hTWgURD+pBF6xCDvrngmiAzhwOI+uQcFo8kvoEV4GhrQxb?=
 =?iso-8859-1?Q?E+tr4eDZjg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N5xNNXaqiXw+Q5kvz2zx5bek+NNMgKYQCiR8unOOjpkoNAnIjgsSw400Uss5LWZmiwEXoKqIzttB6muYCZcCGPgB1fI5Oob5bvR6NIo1kxULANKr5acojutKFla3BzLXu0mSSAsqYsPKsBdurDN26uD7qj/g+9rSzW6TqFY87dI0XSEMtdCgUI7sAhNy3XDEtVSMpOoPpVvA6Tasu5cCi9Z7wcWne7xAWDbtjSUs9VXXJOLHqsVpYNK990ywQXS2QrAAJ98RKZRxYXjnfWStEAJjgA4TuRUiOxDrgJQT7E1gi/Iu6Zn2O2Tpa6iSr++1PRbPQ+Ss5o1A+FG+/ch/5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2554c891-f689-49b3-e39a-08de89c3a100
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 16:37:24.5474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9gA3fhtwFcKy+TR4kstBHV/N1TkV3m7RQ6ueOomhKY4flXb1lcCPpd4xHraHV7tMy6YKUGu6e3qNLkPRKy6jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1488
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=V5FwEOni c=1 sm=1 tr=0 ts=69c2bdcb cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=g3u0LPWLDYfGfufhFw6-:22
 a=OUXY8nFuAAAA:8 a=FT-LHO3Z5LojS0UBp30A:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-ORIG-GUID: BhYR85SzGJA-IUMOzeX9bHgeonsPyGAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX1xeopq9xYSZN
 4sh/L2lwS+T9qrRtIw1VFljDrfmtEj5PCcBKz28y/mWwoZ0JVbfZ7sDb+Fvi2pnBZdSqMqhtfJT
 +U+G+Do1AwIA6n3OU1ErbPFOx1sdlWz3Qc3NB4HeTIpHU+tvOCyKfGdXX1qfu/LVSBHSl5T54xa
 kmfHDFYTkec3h+15jZ8KtaspqC/xVWgsorrCVIKBy0Tayp5DappKpgvi8v5geHVx63sxW5jD/xP
 SYH2m72My9HwxZPUxmp1lvjq/1lLi7LxTjLkLQRiOlG1I216tu+xk0FsXScxg9W3ZA2UmXZh9QU
 rF4gWZSRwVgAEwqjHSUJ2hXoTbuGeO0N483ntro+tTekjoM8NXT+KfevKCun7C+AWwlAFUfkJ3D
 kYRCWU6Tt81VPMExE0+XrX/2xHZqxgjW+X1ifa8XWGS+EYxVmja00Q8jFfSgZwYGJVgtWTVKAee
 WRn8xkJHFiDVl4FcPew==
X-Proofpoint-GUID: BhYR85SzGJA-IUMOzeX9bHgeonsPyGAL
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Thank you for the detailed review, I'll stop this series for now=0A=
and re-evaluate the arithmetic, page-handling, and sign-extension=0A=
assumptions for each driver individually.=0A=
=0A=
I can revisit sending back targeted, standalone fixes once I've verified=0A=
they don't introduce telemetry regressions or break page selection.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
