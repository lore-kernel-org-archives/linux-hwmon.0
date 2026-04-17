Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FF1A08AF;
	Fri, 17 Apr 2026 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388667; cv=fail; b=DgqdLm1fcyA8lyNWHKK5dyNRW9fngmIyI/Rk90rGamC+mDx7PhgoboZ/z0+doaxbLeLiSAk4NfwhqGs1ZZpqMfxdNlNd0IvOJ5pF1iMsGUr+VW6dEqwApQIP2tdhM9NYChtreajciLCcitXcgitKWAIvTGqUAUXAxXSQ+Qf/Y0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388667; c=relaxed/simple;
	bh=iXbboM1wqtfzT79hbR2gqkbB4VhEZSudLNrsvlIkpnU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=huojFqV3CIbpnDjovDmdkUgMP8rzFrEn8V7NNmknZbDLegyv53RejN4BSpC3nSg9f4RlVLP+0XsTlXaGqYfevmRK1Wxmmuj7pDO6N7Sjuyi8SrktPHfO7wvj0DNxCjicszBjrgrKPjhbxQDTl84ZA1uib+mFHRqF8nPsPsMD+Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=oY8592kC; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="oY8592kC"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H1F9FL1152789;
	Thu, 16 Apr 2026 21:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=N55Mk
	zLvpQv6nTH+DEzYivk1eACs+2I/eKUco9kdTp0=; b=oY8592kCxuq0ZzxNMZDuP
	Xhiu9nq8hYQxDSTAMPlcbENy8b+gL7Ah2FSYLCp0ZLA+skA3+yhTZIqF/ax+b86t
	Kqx4MeM9Uj9TnN9kMASIXtXV/n0XQtyFoa1ZXRyPFW+NUKh9ubXoFXAja+GsylYb
	UoY/Awh2NQyjSZyLYeRXFLuiYugwb3GnFTiDlKKnPM/CB8hLEv+dAKXkjw3+8udL
	3TlYTgr2qihgjR91odHyCHsnmv2F5UvdFGKskDYK3ND+a61yI/5wJAi8BNJWLtee
	GADpH+wfchbBo2DLqOcRu2nL3sk8/+XkORcnkDxEmkvJvRjE14g9KVPpNjbPnhBz
	w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4dju8g3sc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 21:17:38 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZyROoCfALdVUmoVpV7IY6FcVDeTgXfc6fAj2zdTa9skvMQn7zpD2x9EqC7+PYT6zNBS51z9uqxiMZ9THF16IYI/5uOrlTRld97bnFTe90hrSvhMlj8W0bMgF4aplVmX1AufydFL6j5nnxrh3r1dqMv/w8j+UNbhOHy4pP+BBkEImsFH0zNPR8HbU4vMK5yVhlI33RVmRsRmunmIpDzB1U9PymI6Wipi4OSM4Z410jBnf3vHOvkpT9k+FMd0/WV8pwmT12eoBFt1KkbBgQk1MHIOHISEvQOxkOjNiHaQsethYbXVLW5ZTphOUPM3GonLgJqGC9TeCfylGgIDPH05yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N55MkzLvpQv6nTH+DEzYivk1eACs+2I/eKUco9kdTp0=;
 b=gB3uUgoH4RwJApdhHA3IUY9ZZWGOV0+hkrdugYn5xYBCxrRwIat3lRf4WCfQZ08h+7QqTZmY6ouDHu7qbUSiRN56pW35SS6SoF9FjbP+Whmd/IEdKtmABtXXTUcQ9qM0UOKa3OTCTqf8kYp/iRwYS7aMosIzSJmkgIxfB8voQgQYWwXzvR0FaZuwVyCW9kF/ZRDstgLiOCe6EB8FltcPbnUZTAKxo+qjmNeAMnCCGNy5nmpeWawJmCs2yYDJNgfAL9te4Z0rsWkSXwHqmgeugFl6Nvcg2F0uL+j8auVcdRnx6ZnZmhHuboKiyTsJ9P8PGmna2aDASnvPffXIg+dSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by MW4PR03MB6603.namprd03.prod.outlook.com (2603:10b6:303:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 01:17:32 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%6]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 01:17:31 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Topic: [PATCH v2 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Index: AQHczXcOTdnCd+it+0SOsooN5+64HLXhhGqAgADtByA=
Date: Fri, 17 Apr 2026 01:17:31 +0000
Message-ID:
 <PH0PR03MB63512D5FCAE0B7DD152AFFDEF1202@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260416-dev_max20830-v2-2-2c7d676dc0bd@analog.com>
 <20260416105628.7E8EAC2BCAF@smtp.kernel.org>
In-Reply-To: <20260416105628.7E8EAC2BCAF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|MW4PR03MB6603:EE_
x-ms-office365-filtering-correlation-id: d1592dd1-618f-41a9-bb2e-08de9c1f1985
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 zkXJonGOr1r7BLtJO1Zonw/Pc2mu8KTP3W/4JCRLRDliyNwcm5TlT2SPBfhV2XVUBP927Hjv1xzyxzE6cpXAbGd29g0tLwtrpee0uLouLdUDg4+gOrDYHhvG1vJE8qp5uTLmvM0F2zTsF+Hw6XnTXqbZddn5KEejMHFxctJ/7/oLF5GnFjZTGiYf0dwKyGek0StbGLQgA8mgyRvFYu0vONvuhPYSoMwBFiTWUl/NHqIhhPQpOqlmih7phhjWysLT8MpUEA38++lT8drfi2WPLeUIlF3Wj1rp3Kj3ldUEbk1IHkF2DO4QHDSdub8b/CphX2zp0O05+xd70QDUPqJSq+k6qZ2CRg1+pmVNAAEzKVrB2ZtDcUDh+840Dn5KhzkJmFjWqPRV5P5Bx0gYiZLS5TCx5B13JYI0EfvaTMyu0TXkvSWfZ3iYJW3g4cw2/6J9YZaO3C/j8eVvwmHU6sOR4OmpTfR1A0Dhe7nTg3rGkkrVDrA9RzD4gyfK+GPU5xwkMkVkfbr3FE0sSZscp0uey7KTbTTB4mRXCqOgjKESNGe0tlzEl6p9IP43y867Yga95621QjswzuFdoL5ZnM+RXr9eZxz3NqOU2Wz04pgx9adhwG5ZbWdCVrTOUXPAtDtpxDL6/FSySe1CaNYinVF/lJbrVTWpM2ua8lSXhR1ZbjryujGPmRjgoY8oSiKNE6M/AseN1Dbne6Pa8j0dWpocvw4/ih/3fmm17u1kEKHyM/O/79a4xba3yuQ+TQtKEfNB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+uW+PGiBlSK26sf/WdahHdfj2LgxA8qbhXPm3p8Ltl3V2DdjhnaRa6ZfLMYb?=
 =?us-ascii?Q?GACnEkb1FK9Cca6g/h8MvrNgaG/4i2HpPAF2tqtSVkPUcggAKPOM5n5Hg8K+?=
 =?us-ascii?Q?UXchXm4Yoy6pLmzGEPQxHjI6GfzuevmTAEzRAmDYm2xrMzCp9q9cTSZP1FuD?=
 =?us-ascii?Q?sgo6Yd6Kv3N3GLnh9XUwd8XSVTySc7cJ1R05HZwv1HZbBD0jiNP3KYvj58mL?=
 =?us-ascii?Q?FxoVMXvyRhOxq86XcQDtqXbRSl0tP368Z/XmMHesmGGHHkI9f7MgtQJNoAOZ?=
 =?us-ascii?Q?xEZzpCLQzrfGKS6Ubk4dvAWoPvOzw/SU/olfHTYIILyIdYP62r0d++elWVRZ?=
 =?us-ascii?Q?shWuYPr5egQ3GoLZcGDB0UlkRZOyELhI3Q3QvwGf2HFnwRPeVxkBc33HBbIC?=
 =?us-ascii?Q?4spyikspsX8ICEbPY/0yMq2P+Bh5zsekbxcJ+KxbM16l4wRNq4TuxBVZw71g?=
 =?us-ascii?Q?sImxHK7LvpT/QrXQR0wdrJwf23/P+HbUripfRGVGcv1s61kHHy2dQ1rH5/au?=
 =?us-ascii?Q?zP6rIXMByZ1wYaEIoYjYKXfzlvzXY7BjVi6lhZJQtUTaZ3+jmbeOJHkgc8cF?=
 =?us-ascii?Q?JaZQibuUzrgu9yuPNxvYjNThdV+he8Q9VOgD2BffKIsaYhenVE0GbR/o7Saa?=
 =?us-ascii?Q?8VKePUKn0DlSVKRCjbq2xKtbvBaKWzKKgGTYALqHeepYLkpjMMQadPYYzeR4?=
 =?us-ascii?Q?E4fnVfra1J2egXqDT71BQElhkHHUKQJBSFmXnwjjpx67+ReNPK6v5l9StAUV?=
 =?us-ascii?Q?Vcdnc8oXVcx1dVUg/qDJ8SPtwz4vsdfJFy6cyZTG0IGvy4JxIJb40ZTfAMZO?=
 =?us-ascii?Q?fud6CxkhCvvZr7oCOCeigP0HwDr2ihiW8QKpEJyDjt01YOclN027PHzlRE3h?=
 =?us-ascii?Q?TGRy7+HQtyJ3+CEoqhH9DT++cNNrAu09kLIfooE3VKodya6WhOLQznaN1H0J?=
 =?us-ascii?Q?O+WjEmr5uoHIei9b7lZHbFqHUFeU/aT8DnOWb2uhff7jPLCd3fBcqVcFL4Eh?=
 =?us-ascii?Q?NWucAjWFFGdhxJc+IzKYsj9pQquYeI0MhLgInMXbG9i6372V++NscM6T/1Hc?=
 =?us-ascii?Q?ReOSE1wEKWwQo4x9T9IxDw2g31Ww28Rdy8NvL9S2SHCKCFJnGSCspPd+Oq7y?=
 =?us-ascii?Q?LtJ5XVg5Y0l84aa+E2yTE+KzfV1avdBlc4Lb+nclEwSMYcWVorXzhdoy9RqV?=
 =?us-ascii?Q?PDAfh75MSun6DJANfXcm/41udOA7LjZTF6fTBXflw2GlxZ23VjtO2ltNUTD1?=
 =?us-ascii?Q?6CgtDUB4YX4RJhZfmSQB00PDkViQii9h2pBnWFa1cqPK//nyPUb9gLYcJJ3M?=
 =?us-ascii?Q?NJUtgYCiotgURodtGPm0oSgT4ss3v466kdFeRx4JgmnCKRNdyT5LBdIlCo8k?=
 =?us-ascii?Q?Gw+65vSjRE70d+A43cvSLeZBdCf1RWUs2dhbevRkB1WBMRMFi2IoxRxkD83+?=
 =?us-ascii?Q?7B/ucgFmNP46//mdcdWG+beer/AouLqzRklfaNSvH9ifmtUJlHBeSNMugXnM?=
 =?us-ascii?Q?MIqMtserBbPTdIxWMp857gdpqxyF9sDSbpMXenPawgkTNBIquU3O52uIYNqP?=
 =?us-ascii?Q?uGF+GC8Q8xC9gGm5LmxzKi1UWJzC9ghzE1EAFSmil9+i4GX8oYgUzibzaQb1?=
 =?us-ascii?Q?7trsa9TQskXNvh/2ahAF5qhHvNyPYOMsTIKtLY9iYhJ3z7YaKba7KkhRICrs?=
 =?us-ascii?Q?gLqbMcFEHFcyBpFPnKSGuLyOy1kDIV7zBdalKTqc8+fk2vIf0874E01ovw9o?=
 =?us-ascii?Q?x3e39HOuVzSAsYw5iN2wMfu9BXuZPV8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	p1fYJgQn6h9f1vdPxCbqMYOE4groqsERl+VTAm6rM67uG+3nCgU2aDj09bd6HKt4jcXkBhsJJsR9XOSrApfskiEiCzkzmJGnEd6bvVsKHuEgw2j4lgBd63heUoVgWCfjOQA3dIREYNTvw+GYi/S+oCqO/zXvH1Fu7yMmdBeZyzobItqMNtrWFo6Xk1d/BLhNEeNl+q4AwYKRpXf3Jjxy+fsgXmPLRfbT6vKnF5bcraj/gbM0VxLtQNdPlytkPE2mbK+eaW2qec+n/ygFefUoxO+YFOlpTnBeP7Pk1NzMW3Uym5gQbYddM16sjmD3/ZrLRMFUD3l2cIA7Vql8T/LNkA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1592dd1-618f-41a9-bb2e-08de9c1f1985
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 01:17:31.8914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkZOWpWcCO9eNhv/pSwHOkOmCOWjjnHLtjAMt6H10tsOd0on5RhePNT8N5co0C4Ku5kOtl2R5BeECAvsxgar4t0z91VS5cUmVXNnYzdWfaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6603
X-Proofpoint-GUID: 8y6idqjPnJqmZOypCpU4RhkCqj-VKgXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDAxMCBTYWx0ZWRfX6IgTWK7FPgBc
 1F1MoSumY2nowpV2UrlgzpzdGJztV1kWZ24ePcmFI/Z93kZ3MDpEnOLZ6ovDmyhcw7Ha8zY2HJe
 u/uRRtuGzX6koFxLJ7FPtfVb7JaoFkK/ALuKGpVejAmoJaPvjz0cI+Si6Ct8j82wU2dIplM0zuk
 +H/AvDg8tmL+PySeNjBk7iF59h6J4h4wtfGoRGqzK+PkZvhOfu/Mq6ktRufPuK01h2mILr/O0QT
 ibPrQCU1UUwAFnJDRsIXG17+g5WrafBNl+vpLODzwiZmENAVIw2yL4vfDIDruwR8CxorA6PQjp4
 hHuiSDyuxUIsNYfQ8hqYxU5qUEaVNlye5AcjJb/VAbaCbzD+aEV50IkHnSzvSTVvZ2a7cShVGA5
 ain/J4Bn4atLQoL9fUUT4gZivVTe520CFhfxZpsg6MvPMLu7WKs0rTfefRfESmt9AvAp5hLLxSF
 90OyJlTEA9OR+2xsIDA==
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=69e18a32 cx=c_pps
 a=iUWcX4Zb67NrYBHNvjZ/UQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8
 a=6qIfmrQ-uDjTnqxQwCAA:9 a=CjuIK1q_8ugA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 8y6idqjPnJqmZOypCpU4RhkCqj-VKgXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170010


>=20
> Sashiko AI review found 2 potential issue(s):
> - [High] Missing validation for short reads from
> `i2c_smbus_read_i2c_block_data()` can lead to uninitialized stack memory
> access and information leak.
> - [Low] Off-by-one error when null-terminating the device ID string trunc=
ates
> the last character of the payload.
> --
>=20
> commit 479738352902d3197058c3172cee31960249a6a5
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>=20
> hwmon: (pmbus/max20830) add driver for max20830
>=20
> This adds support for the MAX20830 step-down DC-DC switching regulator
> with a PMBus interface, allowing monitoring of input/output voltages, out=
put
> current, and temperature.
>=20
> > diff --git a/drivers/hwmon/pmbus/max20830.c
> > b/drivers/hwmon/pmbus/max20830.c new file mode 100644 index
> > 0000000000000..21ea8b59150cb
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/max20830.c
>=20
> [ ... ]
>=20
> > +	ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> > +					    I2C_SMBUS_BLOCK_MAX, buf);
> > +	if (ret < 0)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "Failed to read IC_DEVICE_ID\n");
>=20
> i2c_smbus_read_i2c_block_data() returns the number of bytes read on
> success.
> If the I2C controller performs a short read, returning fewer bytes than
> expected, buf will contain uninitialized stack memory for the remaining b=
ytes.
>=20
> If buf[0] coincidentally contains 9, the len !=3D 9 check below will pass=
. Could this
> lead to uninitialized stack memory being accessed and printed by
> dev_err_probe() on a mismatch? Should we verify the number of bytes read
> (e.g., ret >=3D 10) instead of just ret < 0?

It was suggested to me to just initialize the buffer to avoid this issue.

>=20
> > +
> > +	/* First byte is the block length. */
> > +	len =3D buf[0];
> > +	if (len !=3D 9)
> > +		return dev_err_probe(&client->dev, -ENODEV,
> > +				     "Unexpected IC_DEVICE_ID response\n");
> > +
> > +	buf[len] =3D '\0';
>=20
> Since the payload of length len occupies buf[1] through buf[len], doesn't=
 setting
> buf[len] to '\0' overwrite the final byte of the device ID payload?
>=20
> While this 9th byte is ignored by the 8-byte strncmp() call below, it wil=
l cause
> the dev_err_probe() error log to print a truncated string. Should the nul=
l
> terminator be placed at buf[len + 1] instead?

When literally reading the ID from the device the device replies with:
 { 0x09, M, A, X, 2, 0, 8, 3, 0} - nothing follows not even terminator.

buf[0] is 9, so len =3D 9, it apparently includes itself in the length/numb=
er of bytes.
Actual data exist from buf[1] to buf[len-1], hence buf[len] to '\0' is actu=
ally correct.

I can add comments on the code to clarify this.

>=20
> > +	if (strncmp(buf + 1, "MAX20830", 8))
> > +		return dev_err_probe(&client->dev, -ENODEV,
> > +				     "Unsupported device: '%s'\n", buf + 1);
>=20
> --
> Sashiko AI review *
> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260416-
> dev_max20830-v2-0-
> 2c7d676dc0bd@analog.com?part=3D2__;Iw!!A3Ni8CS0y2Y!6tnYi0B1txw5D1iHlO
> wMF5xTB08wkOaqxNEZnQLyd615sTaced0WcqjVwJpIAN6vuhsxvyz81g-
> FcmRT1xWRgDSmicnZcYI$
