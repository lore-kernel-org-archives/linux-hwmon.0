Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DEC36E476;
	Mon, 30 Mar 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.143.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886222; cv=fail; b=qIJg6186BhWqPGwn7SVdYehafuzKL5JGIOG5m4yB0utbBPLhGDqYZFcG6aDfbn5Nz3sq/QMLiP1qJI0nf4wqCs3lEfzYwGTWcIzJsVIyw8OsL3lPrm5AYcpRaOaArBAvAiHSp9t8hNekhOiux2icgNQ6wPKyfNGg1J1cQBiW9I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886222; c=relaxed/simple;
	bh=aP3Ds8mkFm+PdBFkhCQtZkhZkoOrRAD+Z42/XgNpdG0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VxyKgRALw6FWe21h0/vIWEJ17vVF/3c2qfhMNdyePHXAi3sz1PKA9/rQeCSj9i1Ka4jX69XWGnJZ/VqEr36R7yz4cvt6WMRv0/ft/j9Aq8lYMmKlkp8g9zznEGSM4RVW0M75QKfmCh+utnZm30GqvleXns7XyIElsKU+Be2Zt1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=ekLfcT+/; arc=fail smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="ekLfcT+/"
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBXRKi1682414;
	Mon, 30 Mar 2026 15:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=NtfZ7PER66RLhqRKCqjUDS6/
	kyEOT+3X+APbc08VaGY=; b=ekLfcT+/Cb3RFJZLnqTk9B+zBOKRCm/+QA5dUI5T
	IdqvAkjZWd9Zk5lEbJdttMxZQBYs59kuk13Qx2lL9O61zBFlWDQYGbNAgXjeCX8D
	DjRIIdRgy/IMz9n3WGyKsdqxLmrV5gaC8fZEtbpEWwa8RBz8jJm9xToyTpHeCb3r
	GVdAkHzSTOylryTOmZ6pUpwX0RnCGC/sCOqRmOg2utzFkI9c0KJ8v8m0buqTxkxg
	TIBByWfwO/SJJcenimDFc79aQk/JXYBzZJUBP2Qrw5n8l7uii4Xx2AgKSMvjtfr4
	OlRuM1C9x6T8gp81sjBd6CXG9TUs0tmNflFSgTi9ZdJ01A==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d7p9kcm68-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 15:56:43 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id AC7A7D1F5;
	Mon, 30 Mar 2026 15:56:42 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 30 Mar 2026 03:56:42 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 30 Mar 2026 03:56:42 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 15:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wamqAIWHpoHwLYEQiupt1NAlUcECHKk3O8ISIeaTFLJ1JPcszrLSCA/JqnA8rf7I7m7iVhMVBLzjShJw4B/MDRNGU0/pay/HoD2G4Y9sSS+3p9wSV2PIvXyoskTxiyGbgNN20L/TyBTKrR/KWL7YwnV3J3mgh/N2o2OQzL+YL0CYhGfnmpGzUXL0s8Bpqkj6S+yBfNf833zZwXuob4Viy3F+PQxZqBsXJOYUCeTiEcXujkqOtJfDJ4YsYcsNio61q776Xf0EdIaRuHWm6wcpC4Blr5X2u1Ig/wLDTwlPHMt4XCbAdwor5upVI/ingJ2c6CsGn1vaLjsiWYb7F9jM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtfZ7PER66RLhqRKCqjUDS6/kyEOT+3X+APbc08VaGY=;
 b=c812v0JpNJW1xzX6UnSRNAGwkSbgyrNXntOCJ7pc69RBOZMLLi2l7Y/T/4Cl9j/5kxjYwLFPe1QwiOyYLKGKyvvK549GT+oFohNPW7D9B40xSmmcpor1BpRNKl2TnkgbDRbTMkXwwPadugZ47VJjUVhyi6JVS7eShbluMmRLihopLIZbX/Z+97W5ZDlpVR0m/9tYOY5cI84nZR2D8qJ13u2R1b6ZuGMVRLahI2nV+la2y8g7MFTcAMgaPyV5LU+hDWgFsaMc7qaDI3kAaOjwxg0pz8aBPjaWzKEAcUDdi/j/XZGpxJTLaYENnhQuup5gp0P/HlE7AgUA4At4m9V00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV5PR84MB4003.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 15:56:40 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 15:56:40 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v2] hwmon: (tps53679) Fix device ID comparison and printing in
 tps53676_identify()
Thread-Topic: [PATCH v2] hwmon: (tps53679) Fix device ID comparison and
 printing in tps53676_identify()
Thread-Index: AQHcwF3MEtW6SPNIwUO3uJ/csQrXXA==
Date: Mon, 30 Mar 2026 15:56:40 +0000
Message-ID: <20260330155618.77403-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV5PR84MB4003:EE_
x-ms-office365-filtering-correlation-id: 53980877-ef4a-4f62-e700-08de8e74eeb7
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: XVYvY6apZEUbYQg4mQP7m3sDVgeNT6B2G7wnuUJcrkyuq3elIqNmOSfjh6zdyHDA4uRcND9fhvFa2BhYQTK1fSOVXyCCBpSldoMabieu/oqX0V54QPhSmopEJ+rlOQwKqdshvl2QLqcAOrgWWSBp1AsHirbpTk7tCtvXTYezU2yn6EDPeLlJYC99bG+aHnFQwOkgo6Hhh6xm/3Y8FliWCpzoC0WcwhOGLr2hTzR9kZVctM0U2mS4dgJV2NN9cU+I1ukReEAwPbMSvJ6utVOnjtaGRnKRbJdx/sWFb735FVDlbOlEhi18XnWIeuVZaTb2IRpt76HSoqQ4femNfKHS03Mmp3FWCpKwsvqjM8MnGDsE9w/NNsRSrMb2eNDpR9AxQ5fiWbSHVVp/y8p6wVqbK2QMllvr3aIayDLeeA9Ul6/pm1LV2Vu04923pd4tuYZA7g3x2EJUtcaB0VSRmFdGSZ7+iX/bEBLLOpVMGZ/FZWd1zqkv4A8eNBTKy4DvRZMuM+3/3H+964LoASp+Roj0XK+SLMuR/sJi7yO7LXd0PQVsEsI2Hf/xg1mV70q9GrKDWuBPcnmsl8EVjN5IjyceowCB+K0o7gkQQ8W7Yalx0CZ1y4HAHvm0j7IoBbfhDFpzy2dj9uCb4uu9MuKeesflO1jibJZqH1ZjKXSY+CAhlP1gHWKzLVxevS5ArNQKFMjBVKsfg7C3Y3nikwh9JxrsR08etKfaHofPYnuEGbiqb9ZSQd5MhZv8SxqgagoPaonCW2W4uJ78J/y5THaD16yqqFXD23MijU59kQjhYrCPeCI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HEh9wrsw4+olS2KxWuyNqLk48JTznU1kf6H7hzYMTaIy2jg0JnNoD5T/MD?=
 =?iso-8859-1?Q?D7eKv9EteQcArWPi89HGvtlODuksjC+6ZrFNvYz16+lhqv4j1RPxPRfz+h?=
 =?iso-8859-1?Q?fo4+bpRnvbW42xwJw/4sON5RfSAiWzfjSiZhGlEuVuHFKamGpIlrE9Z1H8?=
 =?iso-8859-1?Q?ttodcaBphdesSfJPzv++kJOL6kejksXb2wRrjVn3o0ETf73OozYhbOWDF9?=
 =?iso-8859-1?Q?+mIDkOHaT1FM6SiIiIuzZVwIDO+wlvNaeLXK5F9xOjhBY9f853jW2bZWIc?=
 =?iso-8859-1?Q?bv8jGqyN8K771az+xjgxroRmTUCs6W+64deKgGpZZsXYOePFg1FTIU9pVO?=
 =?iso-8859-1?Q?oYu0rnrg2tLTuSRWiIuIPSIv69qOxiFrmZD5aJH5pBj9KnKXdu0WfeZFeB?=
 =?iso-8859-1?Q?D90hx4vZltIhJoR6J+aJdEHC+ABj7frKrdphUBoqITefnxZl66plk2EvRM?=
 =?iso-8859-1?Q?BFW3VdHs8czGrg76EYJIWPRiAmKfgbOMRp1y0CtE0qLAaB/ya1shiNnkeI?=
 =?iso-8859-1?Q?vRmS02+wJow6Q6klWqj5Yh0aj3jqdoUIZOsVL6z5QEjl7U2mDI730+ch6a?=
 =?iso-8859-1?Q?DoKQvgQQJdxX9mjrLhGexotMzBLpvoMuMRJUZKtCeJ5Z1h/t8nbJ429QFm?=
 =?iso-8859-1?Q?OSyi9oaHLZe92LGj8dIDAMdQ3JlhVnSl6bN8zhzPObj2iztyTDSLKZc0ew?=
 =?iso-8859-1?Q?YJkI++GDUZpEH9NLE8Kby4B7w97E7O3GJnojiVdA0OZu8Mi5Q7K1w9FAdQ?=
 =?iso-8859-1?Q?d5qK6DijhD0sBGOHdUYa05iUmJaih5YouN8FyguBn094CmGSbcgmFXYcJ0?=
 =?iso-8859-1?Q?NcvdsEn0PnsVZY74UnIdVWmf4YlnzGgxu2rPFlNSi3NQy4BouD/XpCDKWy?=
 =?iso-8859-1?Q?v6FR5rhyukM23pJHqUhoHhhNAq+tDBoLx5J+bSLyRVVNZvkJyfQLbVQuTV?=
 =?iso-8859-1?Q?bHMPG6oYi3K4/cVbFuo77HcZlBqBOYR42AHvmgk3O27w9KDXm21AV4n5Vc?=
 =?iso-8859-1?Q?bei/FdoAAJZjMDCYsSJRhp7sSIS44mVNZN7xdlx2bCAeBv3njkrwWsIupD?=
 =?iso-8859-1?Q?YZJC6+SSPY8LoxlCE6IPXUm5fff70HeoBY8uLBcGg2M5LGKzX29npapESt?=
 =?iso-8859-1?Q?1n/mjxMFfSVOQwwWeuTVVFbfgdm6ph7UW0H8XX3lVHuA6VjPccml/b5/ZH?=
 =?iso-8859-1?Q?Of1e6yxTDTdHbU58Fn7gqo6993LA3ZswJl8WCVa1RmIzLLNQlTUo9qp8CE?=
 =?iso-8859-1?Q?AFp5Ixo7HLyp2o3wvHBpWB118D+TMEGdYgMJuGOcOJbGHKEwxsxrP45C7v?=
 =?iso-8859-1?Q?qH1qrFGiewB5EaobvicFb6ZtTs3XB6/dvHG/5St/D/31D1JKVUIIG8x2tk?=
 =?iso-8859-1?Q?de6Jcq9EkLOOq6+78fe81Ds/otjL84J0SVmhhw9Zt9ZyDiqRbDMxrFbl29?=
 =?iso-8859-1?Q?KdOy6HUCX0kRIFfEJPKLcsMawFiDw3iL4T1+ne9VxByn3+ZBYtAdNPtMiu?=
 =?iso-8859-1?Q?D2em7cLmafFTqv5vRDreUk7IEJChMlchAqJ8fmOCFiMNYLdcFk4niHv3RA?=
 =?iso-8859-1?Q?nFIH+kIq4mk5ZHZfPPLpi53YfFf7L1B8eLmGrVuHPbxh9nyy+Wl7x8Ab0v?=
 =?iso-8859-1?Q?dCL7gXxJjXy1qE3H/QC6Y7ozdexNt+vIA/x7KCO6qqX7OxlrigVWWyAEEM?=
 =?iso-8859-1?Q?+A3fYOGY1iFHgNMaUXbuLVFSII27F8HchcDci4fG/uXG1xQ7elRh9Bhqi2?=
 =?iso-8859-1?Q?xbWoP9RJImJLXoolFOIZ3s2MwJLq+ACMb+TykZAMD5fV/Cxlo9YuYFwtwP?=
 =?iso-8859-1?Q?FUy5VWpw4Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gCdqGd7YVgAhgWmEW/Yd/08pwharJdKZlF2WZk8v9yqjzewtpnVTWVrNPglRuMSIhbOY/u+hcFqEuHsajD63Ro8iA18f7iI5zguXTzW1tZwJQW/hgig2jb1KSAO9m65W6NfhwDleuidbSrVVQek5Qe5r/QmCXG1p+H9ZoSDrvpVNwMGSo0kjnW+vovdTYheE4xjB6O2rRWI8rfuAW3yQu/fHKYwhq4UYXOnp2JXHeY2md3rtCURkvADcuCCOW1Sm4VGEUo1ac4Tv8LI3Ljs3vFtyeCMX4jHDRcI2U9fYtw8/wf3nJhZvz0AjAyGYmfwzQEozvK3ByExSPTW9UIZiJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53980877-ef4a-4f62-e700-08de8e74eeb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 15:56:40.5496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cfqcIYiIdfnT9QKZiej2cu/ruGzIYNwKK9C34/8LK5C3zQkMYa4WwkLTikTM0xYpvoHQA+qWx++hiZ/pCochXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR84MB4003
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=FuIIPmrq c=1 sm=1 tr=0 ts=69ca9d3b cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=3haJ9R1Aw3gUfsUHDaCR:22
 a=OUXY8nFuAAAA:8 a=42rAJXLL-PIXKrGuW3UA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEyNiBTYWx0ZWRfX3cAe9zpUkrxn
 tgfMlRlS2x+a6Z7XLaEo3wilkdqsELW1xEKeH1LKpZvnBR1czJjPN7m4rv2iMq3xche3+zqEkDP
 aGATDxh2P4dyNdkeOfpcj06XF9eKDRtmSUHqG+Ghjg7HbYqxVe9w9KVwo8cwXK0A5CEhXRqM4B8
 813VzYpPHpxkEuhntfenyGtY/JA85k3rhIne1vBgM8YVB/c0JLn6Z8/bHYVZ8y4eRGxcL5JCMKe
 z5cGypguo78wmX1MGASkb+RDhtHymO3SE9VcE6+9e3ZKaQfR75/PwsxmQSceIxgi1Eb8xbJdBsm
 bSRFmYLGWUwjKlbHFsNnuDEb5bNxA8rlWQMe1rGt8Q5tQUULZt3cHqLkvBURpn9rPeMRq7a2fjq
 hEU0mwCWQFwYI4eRYb6PhPdEkuxQs4Bsw4h5Dne65DnBOJDuMtNpeImpvd688lnb8fxCidI0lE2
 5srgRxoiB0Ygxqi3BlQ==
X-Proofpoint-ORIG-GUID: 0LjPtkTQVUlAdeqkZ-eH18AoSJFN_zMa
X-Proofpoint-GUID: 0LjPtkTQVUlAdeqkZ-eH18AoSJFN_zMa
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300126

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
tps53676_identify() uses strncmp() to compare the device ID buffer=0A=
against a byte sequence containing embedded non-printable bytes=0A=
(\x53\x67\x60). strncmp() is semantically wrong for binary data=0A=
comparison; use memcmp() instead.=0A=
=0A=
Additionally, the buffer from i2c_smbus_read_block_data() is not=0A=
NUL-terminated, so printing it with "%s" in the error path is=0A=
undefined behavior and may read past the buffer. Use "%*ph" to=0A=
hex-dump the actual bytes returned.=0A=
=0A=
Per the datasheet, the expected device ID is the 6-byte sequence=0A=
54 49 53 67 60 00 ("TI\x53\x67\x60\x00"), so compare all 6 bytes=0A=
including the trailing NUL.=0A=
=0A=
Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v2:=0A=
 - Compare full 6-byte datasheet device ID including trailing NUL=0A=
 - Return -ENODEV for any mismatch=0A=
---=0A=
 drivers/hwmon/pmbus/tps53679.c | 4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.=
c=0A=
index 1a6abc32afe2..94258e8cfd90 100644=0A=
--- a/drivers/hwmon/pmbus/tps53679.c=0A=
+++ b/drivers/hwmon/pmbus/tps53679.c=0A=
@@ -175,8 +175,8 @@ static int tps53676_identify(struct i2c_client *client,=
=0A=
 	ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);=0A=
 	if (ret < 0)=0A=
 		return ret;=0A=
-	if (strncmp("TI\x53\x67\x60", buf, 5)) {=0A=
-		dev_err(&client->dev, "Unexpected device ID: %s\n", buf);=0A=
+	if (ret !=3D 6 || memcmp(buf, "TI\x53\x67\x60\x00", 6)) {=0A=
+		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);=0A=
 		return -ENODEV;=0A=
 	}=0A=
 =0A=
-- =0A=
2.34.1=0A=
=0A=
