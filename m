Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CD37647F;
	Mon, 30 Mar 2026 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774901007; cv=fail; b=kVkrhoy9yBSHUpZ2O4ZkmvQgxHciRTVehuf+v6MjZCCEpnoG4Gg4JQWo8zMhvCShbP8mG28XtZTPKwk5T67g933CraSVwfh3WcQESzFV3alpTYaVGnUsXiqd14EWPIfmOemS8D7XHObHmmfB6iISbokRJ9Z2YcbO7YPctPh3j88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774901007; c=relaxed/simple;
	bh=X9KGaYGTJKn7+nqjKZUil92Ftv/p7Ju0JcFFtTFKNMU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k3KUqCBMPwN8s5wzMLVGwFbr6wP0PDBRxceDbIHEL9fv4cmxsq9jVGvEbNX9f0lGhqrETsnWYhuZN78XJUZYLMadUyLv/WbGkn75DHcfJ+WsC3m2BjVCGfWZIUmgGT7l4XS10F8U9OiZtzpMUZ/uuHzlYGAvxfbtXWcEylaZD1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=CCM5N9v5; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="CCM5N9v5"
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UJ3LUU3803314;
	Mon, 30 Mar 2026 20:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=X9
	KGaYGTJKn7+nqjKZUil92Ftv/p7Ju0JcFFtTFKNMU=; b=CCM5N9v5tUgOSrSmHr
	43WHLcj6d+MwoxJzkOtxHgY22BluqnKCXqxOiE9/QjF91gP/YJUFicRpf52WpjnK
	fo+lxfuNVasGj8jdixVQ4WkxYv6+ildUQmRjaQeCOSIJK7w76pMMhWbKZ9XqGNr2
	+sgd7qqk8YLU5hdQxpBdyeFt28EpFkjx3P0lIRnpP0jPXMf8s3WYlLRMhxYuUfld
	BSMYV/Sbelnva4yBoZw2SDFJIsZt4xMV2+gWPB60OJgAx114Hmg25z3Wqm5OLstS
	nv7MwHMzbFyrn71MMQDVHjdD6P6iUWGWTrAOOZj8WEc3+TtEfLG+WH74MBsNgzA0
	thQw==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d7vbxanjv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 20:02:50 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id A16A780171C;
	Mon, 30 Mar 2026 20:02:50 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 30 Mar 2026 08:02:50 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 30 Mar 2026 08:02:50 -1200
Received: from DM5PR08CU004.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:02:50 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQtgHy4WTih1Yf5flyks6HLlxPrWphnPRJ9uFQ+Ans7E8yJa7PlXPyjRL3aNMua6+bsGixJN41qTOSlAkSAi4qTj4W9KnqluiqkgDdrZL8TfNVD+Zp6ktLSrvsqkS/Zjc8CheLlV6+MMQEgEQPBQBB8hDRhdEQ9oXd1+S9kRfI3PXfhGrlG2iltCgsxwuCzqIhmIuWat9fajZsLW7CR3TIpOTGre8u36e8KJcVLMWu4g/edBnKw15yJ28e8GJgzuGds7lEKeZHn5EOVCyjkx6eUQOul4FMvhPj/sxSq1YYTEUQNOIpe1kO87fSXPwNqGOIheaRFbvSrkafHEI3m2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9KGaYGTJKn7+nqjKZUil92Ftv/p7Ju0JcFFtTFKNMU=;
 b=lpw9oLijBERWpGqIE/DgVrlccICSCsxEoTpPNoF8/XdMG+ogfySPnyELYQ57iUAvzEJ3e48jQJ4593/MkDHQ/qNyhU1suyoyAcwuLaBPSOYNJ9z+CMUsFi6c6ROW8TG1B5uwyWXQ94UEczSUk/KN2O/kl6x15sh+HhCCYtPZ++BsTs/XdIkXFrkjmaakYe818yIDPTNzA2U0yGcEIIyZKXz9OVbFIdKWuDak7rR+FPtnpCMCcrZ/czcuQiI9xk3cilWukk/wwpLbvYBELm8jK5bdliSllu0L/Agou3BPXfw8areYsrkkedviggpO0w0CcH6bujUn6bRRY6qKOWfbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by MW5PR84MB1769.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 20:02:47 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 20:02:47 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Topic: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
Thread-Index: AQHcvXI4vvjQBfqWwkiz6FB1AZzrTrXFvdkAgAGEFoCAACzHgIAAFrCA
Date: Mon, 30 Mar 2026 20:02:47 +0000
Message-ID: <20260330200233.105097-1-sanman.pradhan@hpe.com>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
 <20a29a60-6848-43cb-be2e-4e63c8602462@roeck-us.net>
 <20260330160105.78279-1-sanman.pradhan@hpe.com>
 <4dd404c1-8d55-493f-ad5f-2aa30ef10b55@roeck-us.net>
In-Reply-To: <4dd404c1-8d55-493f-ad5f-2aa30ef10b55@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|MW5PR84MB1769:EE_
x-ms-office365-filtering-correlation-id: 2376bfa6-b567-4d4b-2e2e-08de8e975061
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: lrZZ7XcR3ScMU4eGSX6eYZ+n7Bal2lzxUxys2BLX/+Nv3+iSAfNTG8P/81kMQgh8QCySmZ6whHLKu0mcyGzZnBoT6Wb+DbSJOJMuu47DRReJh77yj8txZ70dBXUzaYu64CIiMmlu+NDtn3AJPrwWe07lT6HvQPVSFyAs0vQ+AorErmZI81PjCb8e4LE8gIGEB+HTCJKTIRtDP7Kk/57EvigxMf/lYQpCRe8J31SnAlM2C4RxEynS7Xj/5gTf71P6G1jFLiJDxUBr34ZMcn7v34lWZrS50ncU3OekKNgy/6UAfGNwdM+5oa5dZt7+Oo0I5bj6POM+EomSNSxVbGVqSsr3yPImQjUWDooQ32eL4qjoZkv9U0Er5oedUDZVa1iaCzh+g6mt1XT/oS3zU40g6mjfraeZaoeZxzQiUZPIBi1lggPSK3v4QILSXsYBgGOgwcUfTUHnaEKPQU77ZFWkiH/v8piZAcHnxHfpV5NKWkCSCVFuHLNChCEI/WfxcOHZH1SSx2Ob4r/RznJtU042JE+HZP4NwfXXoyjc2D9jv40F5bXhLtdqunQ32QFTZ9tH0Z/q9payXuJfUovTyOFmaBTsO/9Sm4UStskaoz+3Eu4xMw3WDMI1yfuGgvEjlRh6EvvfgOBvi9txcgWhI238qKuhCrNg0mprxOFQiYzO5Ka7kir8DtbzAi1lyBbNRfC4NeKMDXM33RHrsT7uU3X5KBMvaaqjiZO+4Q/89xjxKpWPJ6FQGXnU8B6BFno1s7Zl9Yl0ctI81JQvWpuQe43iQWuptY3pRTLpSNj/MxBnWlc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ChRVYQynh5sa6JUh8XG1gsfiXtHl6IOADuIdl0lQBkbboNEfH0c6c5WFJC?=
 =?iso-8859-1?Q?ZTccUdaSMjRKrEzb03S+pHYVrKzOQ+mU8Z61+0p0UyUraHjk7a2W951BIo?=
 =?iso-8859-1?Q?bUQnAGnda4d49K84guckAoCizBypf0FSTkJL4KxRDhPPLiPMAd6qxd06nz?=
 =?iso-8859-1?Q?DCKRU/tJgLLvqRfgh98tlJSO+verMWOybTnndf7SJJGd7OGxSNLDaKKXZi?=
 =?iso-8859-1?Q?vED66THQGr1LuNTvWlbX8R7kfjD7ueOQEj1exkRsum37iI1b1UittqwWMP?=
 =?iso-8859-1?Q?663NxYOJ158tTqZvoA7wQ65CHmlk1bXPyYkK1GTSTZYOwe129b0RbUjAAK?=
 =?iso-8859-1?Q?CrCX4j1cqqcHUu9SVSvKjNpw3YCEz9cSLPmeac3N8tYrJJnGJd+MOmXr1A?=
 =?iso-8859-1?Q?MptSqIEFReRDkA6aG2H/u9dlZC46otHIu3nZNg4E6zw6YfGEl6whSQ0eAf?=
 =?iso-8859-1?Q?vfD/EP8+kIIUHsQZXM7vhS9wi5ggo9ZE2dGz6SNF7gL5/VL6MPurcgbjOR?=
 =?iso-8859-1?Q?/flPunpsoWT/itBw/nWqD36KUTxIvlj0DBYcRzFcm9JP/yJwczzSUsksx4?=
 =?iso-8859-1?Q?g4XSeoyqvoiLABJXHTLX7XKem8fRoOnc6xRcumO3d2qC/yqiPffk4spNx1?=
 =?iso-8859-1?Q?P4gAcvWySMgAjMeITTeOCSdc2GChjAUIZ/B2Mv16yuB1PmeaORC3RB4HBD?=
 =?iso-8859-1?Q?FKMTogDyHjjTET2CnqRoVHBAZ+r36clkxH9zJH0zWjtKnxNjl8oLyZTpHb?=
 =?iso-8859-1?Q?8Z/RAeEpTZGM5n36KMuudC5dfXK/lD/KnZ0hwbRawXaGsbBaKBBrhDnbrH?=
 =?iso-8859-1?Q?NR0fjxCTUM4Dvm6JL/o/m9LGXZjW7qtJ1gKxa1fvWMXnPUatMXXDk4EaX1?=
 =?iso-8859-1?Q?Me+BWjp6bL72Nd85KRn4zHjd+XLBm7TNh92afsfqAjMFpyPW/kOqAApxL2?=
 =?iso-8859-1?Q?5MEkjp9jGjSJ/ZYUhGexpPvrZCUrDegM+59k4ZpC99sHHU0tBXiiLzVmBi?=
 =?iso-8859-1?Q?jRweE2V/ShrBMLjRZ31u8ElMl8HitLll2+l5ASYAH3L8e4MpeVAYutmM09?=
 =?iso-8859-1?Q?wajQolSjqB0VEnPiDQQu4q0moVmfn0NaRT1VUuE5E9kTl590IfpBa24XOP?=
 =?iso-8859-1?Q?xGeJjxKPvMUOotmqIJe4Au3TIVtbY7AM/J0oCUBQg7/uquDkw9WAOB9h+1?=
 =?iso-8859-1?Q?p71gIAZrJXIR43ZIRvOvk7I4lyp4PWJWqQTV5aimKSjajK02KFKBX60Gw2?=
 =?iso-8859-1?Q?yosWPjWkbf+GSQ6u3c2vwnN+RH7cO3oC5uuh/1LWG1Cm6K3JXl7FlaquZY?=
 =?iso-8859-1?Q?CPxZNfVVc7KiqZ4mxwncDpqzjp++idqufQfqprFSSx2PZ6Wsyo2pyAACEp?=
 =?iso-8859-1?Q?w+aSpafwxJR/9UeaMiX8vkzYWRU04Mpnl+SUn//qRCSgIsKtTMibbAw6kG?=
 =?iso-8859-1?Q?MAfrf933pKp1x2LPGwkUYejMNYFiNGYm5c/hbtrRWssk+ADoU/XtTgo5yP?=
 =?iso-8859-1?Q?wBPp633bRTcWUDR9BI8UWUnQN9ifg4iKgtVHaL3qUCmYlaUPxtKFPlq7BT?=
 =?iso-8859-1?Q?OGet2t459QeKFZ7y2n9guiPygVJ1IbW/rgSn05Wx6NB6LbpHhI24A8AyWr?=
 =?iso-8859-1?Q?YV9NcHQnsQnhUgm0jdvLsEjo4gFqWc63IePT3ACVWzxPwgO+J0o7ZIuGwm?=
 =?iso-8859-1?Q?6J0ceZmA3LPI6mKVsBInIcF56Z6hMrmhxVExDMJWRpVu6HLuRJ/uDl+z+j?=
 =?iso-8859-1?Q?GUD6yZH1DGR6jw5TUgaNyPKDwJBu0h19Fjmj47Wzr76r96zJr+tCmghnji?=
 =?iso-8859-1?Q?QhbycphfcQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rv4T53+DEu/YiYq3Hv4z0VK6t0rKmjmPauINxWfVGKT28T1GdrphtAY8pUFhL+QoepG+urAQsWW23/joDmBhx7zCLTnGGTJg/KHVA9xieO8zMnRQLDEcVja7BruOdYuxZCQ/PsL30890yuaoZsdFDZeoauKqGX/qUxdF/TW1rW4YEaJ82Dq+JKkAOgrXvaD1hK80DNn/uFzrllFW26gACtV27o74P5Sv8iBf1d1pL/xwwSKCW2jFKc70nKZPBcoEZsVm28hhhwlapZ17H3yswY/W+a6KqXZS2fJtvdG9HvPhOb8jtK/e+ZMoqWkrSSdQQGn5ZQ0QZkCznFIxWPPfMQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2376bfa6-b567-4d4b-2e2e-08de8e975061
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 20:02:47.2586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1ZQJANZ9HSg6AgzHHCyZIuZ4knwXcROdGi9pWvEXYGkJnQS3fYWCAqgQbaV4E59GpE4w3lfIMVJLhSWU3PaVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1769
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2OCBTYWx0ZWRfX/fWVkt8Xp4Cb
 f9reqHdS7th6pX5O5t7NTCPGQ0EVmIvjQ9UDn8uFriIU6xIM2DRPcJdcfk5ZQX1utLlgMaMql6r
 0AxUiKUausI3DZwjkOxLUsTQMFTEKz4UOvaJY6uLsyQyc16KuGyk2ic1493Spf/87aFvtO3snWB
 UuLtfHweBk3OjA39D3AVcocFYBlZ/cQ/hXSJBs10Lfc7kFJyNDzRW3uUc3w41qGJ7aBePz7pJ6U
 Qdlkh/XqwD/qlPXnTn4jZc+yKMx0W4l5C90Bq1dYMqWQDNohoZUwMP1qldPcv3xZhqbUrYYFKXE
 p9plT+XyqlAmA8ZAKkOO9V2KIREZ2PvS8UHNw7DopvOVUwpsvXj/eEr7KmVtMjQTfaAUYSk90Mm
 Nt6tZQwML0wmgvOayM6nCdo7GJW4koZci3jrqKH7mtS2NHUE7/E2m8LlSbO+Io0TS7EnInQEBiK
 X58XG8lWSAqvdT4fCoQ==
X-Proofpoint-ORIG-GUID: 8K-kFRy2W85XQJPbozEdWpIQf8WerL7R
X-Proofpoint-GUID: 8K-kFRy2W85XQJPbozEdWpIQf8WerL7R
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=69cad6ea cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ay80y3fxfMS_JZZz1qJy:22
 a=OUXY8nFuAAAA:8 a=6wXjqhTwZRDNoZxS-7oA:9 a=wPNLvfGTeEIA:10 a=q5mp2vxMLvQA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300168

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
No, I don't.=0A=
=0A=
Please go ahead and apply 1 and 2. Thanks=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
