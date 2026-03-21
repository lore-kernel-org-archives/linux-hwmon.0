Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810092EBBAF;
	Sat, 21 Mar 2026 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054463; cv=fail; b=Y9pGQS30cK5vd/h7lCX8ewRHItbkZOR7//VKLudmOwjETJnvUT2DIXOWqQo0MwbA6cQuhms8vcIfwzC8lUCjeW8li50VyrDs6liX2O0LPwZ2tPAkw8j56Y7fJfAwbHce5FWWlwMeWQoR4aBTtHOedmnM1H/uqVqZlj17QYp0wqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054463; c=relaxed/simple;
	bh=VZXnJ6O3G7LjusjJJKfTsj3ORJKBNBj5YLewXlsdpro=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QynTRuQDbPFEn+ZKVyhssw0hRyop4Np1s3HrL+2wup7wItIEb99DKGBa3QP7Ni2lbTzLsQIntLeaL8mybeqFfYZUZ9+Lb3dE52gfqo+0k0UpsPH3MeryxAsuf2lWs0dSJPLWl2fUcCQ/UaP8Rsc7NibX4/nYMD7KySPvTBeXqQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=cqZZaj2u; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="cqZZaj2u"
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KK2ZWn2577340;
	Sat, 21 Mar 2026 00:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Ss
	IXLn4FPrH1FsPS8lFDulzsTuMy28bz7vulm2yUf9o=; b=cqZZaj2uoOYSELqjh4
	vIXsxCx6FcycADqx2yzMpM8eU11hQUuDLgROketSxLvLJi6k9gRWFdOsZuh14Czj
	FsfFjDx+aZyS0qDn5OlpJGq6LcPs+amiPg/rsHokw2mkkYDRH/VIfTmOK9lcrQAV
	ptj6x/9y9vvc/s6MgJMLEPbNQZ61LbK2PbPkIzUI0M4l/rxUSYZQpPTfMeB/hvtb
	a4gugpatq8lpQUFtiNhFFcxoY5mqZR/IUR1RrkxpWvNpzCl4E9OT6ezAfri9MY04
	pzGU7x2JyCIR5+uKe7zh1/iUR//mLpjspLyLedDIr16JnkUOXXDmUnea+5ZU/4l6
	12wA==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d19f0m9ua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 00:54:01 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 90BE9295C1;
	Sat, 21 Mar 2026 00:54:01 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 20 Mar 2026 12:53:30 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 20 Mar 2026 12:53:30 -1200
Received: from CH4PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 21 Mar
 2026 00:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpA4c4eYI1BZLtpB5PP82JoWPA8BQxQ6VjoU+8RYZWfl/RE+ZFHfH8F6GHFK7rWjSAfg5xGwsjLkTAU+oau4kBMxgKLjWdFBnQP2W+yL8VZXF7g1ewk9l1fw8hGFsjcGco1xpzjsMmKaTAEjBzJtKuqzJY1RSDIeQhWurJTNZb+QEMEyVWmPxc/snd7WenhI3qv24xn347aIVSwjHPjVG9MAJCMsNV5GmRXaAN2+J3RmmgrT2MssSofxm6vTsFS1fysuoMfZPAKL8IvdxeQ7cQg/9I6xRQSeb9AHb6UBcEp22Ygf+jtbYdmenY7IVyybbWOtNcZxACvxZTPHGOo5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsIXLn4FPrH1FsPS8lFDulzsTuMy28bz7vulm2yUf9o=;
 b=EFOi3EPIwavjPW7dXsyDB6y3LAkmiq2b0+lSRX015ORpbvClA5sL2XzofsSStSe0ge1RWDpcqah9Q7cxJu3ZUDjyH8ARV3azRUzFWYjdjVdQJPSHtS89d32jPHCuQYdoOPcKV1MtPBC8kiJ+3WXl8nhyA450RGPBB8raODKoqBUMg4D0gt8fDqapjVGkJtvbmCG8XG7zthsO8r0bPpaEjC+MUZnXYYYaVHFAELsydc8S54Qb3IsFKDNtryX3+OlT34QAHx95RnuslZ9XW+/poj9+PbTZqV9boLkufrallgyY6p/hgifjgNlVFYk/3ZlbiMAqd+lRslM+qOtTY4nMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by LV8PR84MB3772.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Sat, 21 Mar
 2026 00:53:27 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 00:53:27 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v5 3/4] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Thread-Topic: [PATCH v5 3/4] hwmon: (pmbus/max31785) use access_delay for
 PMBus-mediated accesses
Thread-Index: AQHcuM0h1sacbCINVUOUmFAikuva0A==
Date: Sat, 21 Mar 2026 00:53:27 +0000
Message-ID: <20260321005206.6350-4-sanman.pradhan@hpe.com>
References: <20260321005206.6350-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260321005206.6350-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|LV8PR84MB3772:EE_
x-ms-office365-filtering-correlation-id: 6a8d5f81-660b-42b8-6692-08de86e44390
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: HaRQKC8HddF0xhrAsJaFc4U2cq0iC+ieZb+UCCN8HUEkaKBj3ZIR9hTr1npKY9QrO84yqMEKoT18mu6pNG2NJa3/ALiErn3mn3Z/jODRckZYHO9GHBbCH8RXkzfr8EVHK+su+fPLhx/ZWl6vpGStGwCzpJ6dan1TC7tEmzfx1+BrnyG0Woh0efpM1rJdXYHkLku6josSejMtN4OfgBMIr/nc4ME4NJOUUnTwBanyj2D5s57i3fD0zRy/AA/22W2S3mnG1tYES8XFzxklFuPzwWSH9Q5jZYo8J2hyJf29DzTmAAatG22rlMTY0/4cRG98pEF67Ky4xTn+XBL61O9vYCjPyuQwqT5QpC04JAaOD+jpe7KQsptv2jYP/PB1L+wPxp1s2FJ6mrTdhYWxlVFvemUnBxMfYIJg+DhX5DCZxLiMO03Mnq8E9Xj/OAYfa8WxYbCZKTNsYyu7P18KytgEx0XlYWvU2LXuEQ9eVr8zCNMHcTpckRM0DLeoaz8kRXHGjFl47q90bbie9djCRcWkSmfu4LgvUyMIhyZbUAFhOMJQ5bg6i2G4DHRjNShJAX2yNIcZjT/4HOiDG5sJJNc8Sm3Cm55pTggruyzqXHezwn7cUnKuBEc3G87uLEc1o3L1/rN2AmVA8hUa8sjlbtFXz08J/cOpdz3tgGpeLF+8QotkcXZTjzVCgslVkQZL8TKMtD2NvkR5dneiOz4T2mFsJvSGwTyODXM/NasdFb5nPjWU8aTW+g0AJ4BEebmcLubvrae9ZEkGSeQgkxZF0arFC/tvqbtDBiUJFeq6caa0V1w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pkFP/1opwFdkS/oXgeI+IMlyV1PkoFbylJ/e/IUfXvwdMXAkq9huRP14+f?=
 =?iso-8859-1?Q?TX/OAKQBBLA6fB3qmlvob17bCFOGkE1KJz+1m6f1ywyRflVIimOIjhuYA3?=
 =?iso-8859-1?Q?3+31aQh33Z5RpTNSC6YcEbyrHkRyEjPdzzBUG9ivHE6L7voxqcu26luWyC?=
 =?iso-8859-1?Q?EJOgSYwTUhgy3WrXjU33qtpvzNel/dv5MpHVeIo04YvMRnMfQvsMDbaaeE?=
 =?iso-8859-1?Q?GEX4bmGsn+LlWGaEpefVgEPk9sFEDkpSKzyBc9r1fvtZt529PFRX2URfGU?=
 =?iso-8859-1?Q?uka9sWMAJQP+Kvk0yUX6v00Z5e3TwKJoq5YXkLdyuAfJUI0hj6x5qYnBRn?=
 =?iso-8859-1?Q?sIZnLCHVVMk1wFx3yLJ0T6Dd49nrKt0AtF94CMMDowby6QBzq++oa3VIGv?=
 =?iso-8859-1?Q?/V2YYv2giGfu8AwbMpGpAvnnoAon9YSAAUfxObOcyFCAsbvaPSHWBwdemr?=
 =?iso-8859-1?Q?0M4v4+IUZKTDIahK0COE+GESqHQzJz2Uj2BPJePz1KorcQABV+2jYaJREX?=
 =?iso-8859-1?Q?2PvCpnf3/LBrx0qr25bjkNA+SWMhzg5moUigE5ozVc4UvZrepoMvXucmCA?=
 =?iso-8859-1?Q?rqb9vMqxtuBXbwtZC/qVAXDujmsaH8At1XTJfY4xODflDtV8J6qhLyTsZ2?=
 =?iso-8859-1?Q?Oa9saHQLcFsiwJRKhUM36tud6tBqkJm6nJJs4U97rK1hVvhzmgRXxhzHr0?=
 =?iso-8859-1?Q?gHw1bu7eoxeJAao8z816WKpH+K2HLxJAwhwaUR8VR2tEuf8Metxs9SKdp+?=
 =?iso-8859-1?Q?/HIHlirkJQ1f/+T7GaJKvNyE+TfvKI57zrZ8RsKhyBvSgvvug4I+mE6mXO?=
 =?iso-8859-1?Q?/4Kr1aLD12Ma4z+MjBI85t+loEUIz88bU0pJ06MEaGzTS/fcHGrQmd0a2L?=
 =?iso-8859-1?Q?0LdR98cJATxD2VR+MI7ysJH1LWIRNKFUABcDDrPCNAp2LTlKLEiMRIJ5fC?=
 =?iso-8859-1?Q?CIqSZiyje18uJYh+IUpKGL23yPf/aamD3fEgiznzmNs0z5pTSzxWE+kxNN?=
 =?iso-8859-1?Q?uix44BYe25fVs6ZbehuVeFGt5yiF4KM++yMr/FZX04CisGI7ZOVJni/QXz?=
 =?iso-8859-1?Q?XsPYU1buO2Xhq77kTWjpDiQCZXE+qA1J7SsFtgLjizezgpKx43IlrXVG3j?=
 =?iso-8859-1?Q?MKNSWlyNIDzOzsLkaTyLPqVJvrKbrhimlGf58/wq+hHiZ1g+yzLyT+oNFG?=
 =?iso-8859-1?Q?SImp+S3QPBXZYCZcx4dSFNXyDGu3SG4r/zICETaylVuZM84XMaNW15SBkM?=
 =?iso-8859-1?Q?5rO9HKEtfAfStTNHiXXvk/YF8u1tXF/xjQdJ3Igt8jFST29GttSohNi35Y?=
 =?iso-8859-1?Q?+SbjHD5jDIVZ9ML4GucU24vsjnMBm0g8uxaSgAGmyHUbWmZqKHGbb4R9oz?=
 =?iso-8859-1?Q?K/ajRQQlFBInOv5SpynkIm0ibY57kKmUOZOLOfkkvL3VpP1b7qVJqRGBsM?=
 =?iso-8859-1?Q?YQUWzT/sC7hG2zvVEN/JpcRpjKadic11SGcu8IbL+A6d+np2CVIvuAxKHE?=
 =?iso-8859-1?Q?aNfGWy24B32Zpj/FnIgEYOdXzDCxHvOtn81qjoacsHJoFDPJWtH13Mryu9?=
 =?iso-8859-1?Q?KKb9uc3U3HK2FSuGEn11S/70PwS6dPDUthbbnaNIHCPs4GoY9djvds8oYR?=
 =?iso-8859-1?Q?BxRi9iFJoUpnQbUe+U9z7Rbal8CHhA83/GVKWK6gmQ6WU2dpGJgG17QDPw?=
 =?iso-8859-1?Q?SNe4m0f28y0nQyqFETLkmacCNocjXmcZq9tCdOt1UobZAWD9eDSeGokS38?=
 =?iso-8859-1?Q?rMjlSCc///Xz59ZDfzedyXHcGDoVIAnCBbhK2+buDhgoCXIY5keIcxNvtK?=
 =?iso-8859-1?Q?XEgLTiJjtg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ldy6RM1QU4mW9yrVt3rQePNUn+XfjB+MofPacAxQv9vJ2KhgzMsHbyyXioxAfSN4GkSwI/8Xc9ExNhOH0gBmOrEWIJgvSjrZBPSFS3TbQ7NpLHAtLT0dKDrYasgQUNyLZ9UezHPTzPyhNxgLm0So369T7i4+FSx0siAGkQN7+nZbNNKadD++B5HLKLbWkwcz8rKXIP70XlqG7tMD4mNeiqcouPPPDAeqkzDYD5i9slyGVqHOsHXvvZguyZNMBRx+GS+O8V5/1I223fASy8g8frvoeQtSwLWHK+FweRollC1kKJVUeXp9aqKEpkl6b0q/xNOdmXbwol+W7T0o465bNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8d5f81-660b-42b8-6692-08de86e44390
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 00:53:27.6934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptgqhKq2rEfX2cmei/leRjLQm0AK8JFwXIydKrCIEO2QAEy7xmwbj4L5Dr59fhoLs7bC8WtQs7ODmLxkagPblg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3772
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=69bdec29 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=_ZmgHqWwjZUDpi_pur5s:22
 a=OUXY8nFuAAAA:8 a=1dJJvSGK75pZe7GnG3sA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAwNSBTYWx0ZWRfX4caD5o8TO4nq
 RniRPsVN0gesqBLZSB1tkoGK9BlrdpSlhB04sWbNP1hf+vPKLYkw3p+XybT2v9FWAP3Qr3RnTes
 38ugGKB3wWoWGZg2Mpq3C/gdFXfgxw/qsJGmbWcq39t6MWumQsEkPILPFzKQfMkiS/7sEAfhpqr
 YGW7sRePnIR39aRiPKANkzPJ8cOao/gCMQD5EdiDPuXGqa7r3E5ODmewno348yQpWsxmXX5XgW1
 t3LElKEtFT4f1HXL18ruVPW5i/KbcZhkf1AbnUGNIY6QVQlSz8/YGxgr4Gsl1MIDp/TocsrcyQq
 CTaEsC9T76OdWo3TBrXrN4EdfTIw5+5wFc9rpeMkxvOAz5YoqAYF+i2XmGvt/P45LUjc6QirTTT
 BaaFUx7YsmA06fFYN3mA9nHrOD0aZtJhS/PvQrmqJPZumYGe4h/He7YsaMu21YPCDlE1GRNWgXb
 rwRM1eufxL8shYMD7gA==
X-Proofpoint-GUID: 8qaYoOeLX5IrQNtmlOLseeSF0Ym4X-nx
X-Proofpoint-ORIG-GUID: 8qaYoOeLX5IrQNtmlOLseeSF0Ym4X-nx
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210005

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
The MAX31785 driver currently uses driver-local wrappers around PMBus=0A=
core accesses to enforce a 250us inter-access delay needed to work=0A=
around occasional NACKs from the device. This duplicates the PMBus=0A=
core delay mechanism already provided by pmbus_driver_info.access_delay=0A=
and adds unnecessary complexity.=0A=
=0A=
Replace the PMBus wrapper approach with access_delay for normal=0A=
PMBus-mediated accesses, while keeping the minimal local delay handling=0A=
needed for raw pre-probe SMBus operations.=0A=
=0A=
For the raw i2c_transfer() long-read path, use pmbus_wait() and=0A=
pmbus_update_ts() to keep the PMBus core timing state consistent with=0A=
the raw transfer.=0A=
=0A=
Also:=0A=
- allow PMBUS_FAN_CONFIG_12 physical-page accesses to fall back to the=0A=
  PMBus core, while remapping only virtual pages=0A=
- use pmbus_update_fan() directly for fan configuration updates=0A=
- use the delayed raw read helper for MFR_REVISION during probe=0A=
- add a final max31785_wait() before pmbus_do_probe() to bridge the=0A=
  timing gap between pre-probe accesses and PMBus core registration=0A=
- rename 'virtual' to 'vpage', 'driver_data' to 'data', and drop the=0A=
  unused to_max31785_data() macro=0A=
=0A=
Signed-off-by: Sanman Pradhan <psanman@juniper.net>=0A=
---=0A=
v5:=0A=
- No changes to this patch in this version.=0A=
=0A=
v4:=0A=
- Standardized on the Juniper email address to resolve the=0A=
  From/SOB mismatch.=0A=
=0A=
v3:=0A=
- Added an explicit max31785_wait() before pmbus_do_probe() to ensure=0A=
  proper timing spacing during the handover to the PMBus core.=0A=
=0A=
v2:=0A=
- Replaced local usleep_range() with core pmbus_wait() and pmbus_update_ts(=
)=0A=
  in the raw long-read path.=0A=
- Updated read_byte_data() to allow core fallback for physical pages.=0A=
---=0A=
 drivers/hwmon/pmbus/max31785.c | 191 +++++++++++----------------------=0A=
 1 file changed, 60 insertions(+), 131 deletions(-)=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.=
c=0A=
index 50073fe0c5e88..260aa8fb50f13 100644=0A=
--- a/drivers/hwmon/pmbus/max31785.c=0A=
+++ b/drivers/hwmon/pmbus/max31785.c=0A=
@@ -31,8 +31,6 @@ struct max31785_data {=0A=
 	struct pmbus_driver_info info;=0A=
 };=0A=
 =0A=
-#define to_max31785_data(x)  container_of(x, struct max31785_data, info)=
=0A=
-=0A=
 /*=0A=
  * MAX31785 Driver Workaround=0A=
  *=0A=
@@ -40,9 +38,8 @@ struct max31785_data {=0A=
  * These issues are not indicated by the device itself, except for occasio=
nal=0A=
  * NACK responses during master transactions. No error bits are set in STA=
TUS_BYTE.=0A=
  *=0A=
- * To address this, we introduce a delay of 250us between consecutive acce=
sses=0A=
- * to the fan controller. This delay helps mitigate communication problems=
 by=0A=
- * allowing sufficient time between accesses.=0A=
+ * Keep minimal local delay handling for raw pre-probe SMBus accesses.=0A=
+ * Normal PMBus-mediated accesses use pmbus_driver_info.access_delay inste=
ad.=0A=
  */=0A=
 static inline void max31785_wait(const struct max31785_data *data)=0A=
 {=0A=
@@ -54,89 +51,40 @@ static inline void max31785_wait(const struct max31785_=
data *data)=0A=
 }=0A=
 =0A=
 static int max31785_i2c_write_byte_data(struct i2c_client *client,=0A=
-					struct max31785_data *driver_data,=0A=
-					int command, u8 data)=0A=
+					struct max31785_data *data,=0A=
+					int command, u8 value)=0A=
 {=0A=
 	int rc;=0A=
 =0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D i2c_smbus_write_byte_data(client, command, data);=0A=
-	driver_data->access =3D ktime_get();=0A=
+	max31785_wait(data);=0A=
+	rc =3D i2c_smbus_write_byte_data(client, command, value);=0A=
+	data->access =3D ktime_get();=0A=
 	return rc;=0A=
 }=0A=
 =0A=
 static int max31785_i2c_read_word_data(struct i2c_client *client,=0A=
-				       struct max31785_data *driver_data,=0A=
+				       struct max31785_data *data,=0A=
 				       int command)=0A=
 {=0A=
 	int rc;=0A=
 =0A=
-	max31785_wait(driver_data);=0A=
+	max31785_wait(data);=0A=
 	rc =3D i2c_smbus_read_word_data(client, command);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_read_byte_data(struct i2c_client *client,=0A=
-				    struct max31785_data *driver_data,=0A=
-				    int page, int command)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_read_byte_data(client, page, command);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_write_byte_data(struct i2c_client *client,=0A=
-				     struct max31785_data *driver_data,=0A=
-				     int page, int command, u16 data)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_write_byte_data(client, page, command, data);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_read_word_data(struct i2c_client *client,=0A=
-				    struct max31785_data *driver_data,=0A=
-				    int page, int phase, int command)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_read_word_data(client, page, phase, command);=0A=
-	driver_data->access =3D ktime_get();=0A=
-	return rc;=0A=
-}=0A=
-=0A=
-static int _max31785_write_word_data(struct i2c_client *client,=0A=
-				     struct max31785_data *driver_data,=0A=
-				     int page, int command, u16 data)=0A=
-{=0A=
-	int rc;=0A=
-=0A=
-	max31785_wait(driver_data);=0A=
-	rc =3D pmbus_write_word_data(client, page, command, data);=0A=
-	driver_data->access =3D ktime_get();=0A=
+	data->access =3D ktime_get();=0A=
 	return rc;=0A=
 }=0A=
 =0A=
 static int max31785_read_byte_data(struct i2c_client *client, int page, in=
t reg)=0A=
 {=0A=
-	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);=
=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
-=0A=
 	switch (reg) {=0A=
 	case PMBUS_VOUT_MODE:=0A=
 		return -ENOTSUPP;=0A=
 	case PMBUS_FAN_CONFIG_12:=0A=
-		return _max31785_read_byte_data(client, driver_data,=0A=
-						page - MAX31785_NR_PAGES,=0A=
-						reg);=0A=
+		if (page < MAX31785_NR_PAGES)=0A=
+			return -ENODATA;=0A=
+		return pmbus_read_byte_data(client,=0A=
+					    page - MAX31785_NR_PAGES,=0A=
+					    reg);=0A=
 	}=0A=
 =0A=
 	return -ENODATA;=0A=
@@ -178,7 +126,21 @@ static int max31785_read_long_data(struct i2c_client *=
client, int page,=0A=
 	if (rc < 0)=0A=
 		return rc;=0A=
 =0A=
+	/*=0A=
+	 * Ensure the raw transfer is properly spaced from the=0A=
+	 * preceding PMBus transaction.=0A=
+	 */=0A=
+	pmbus_wait(client);=0A=
+=0A=
 	rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));=0A=
+=0A=
+	/*=0A=
+	 * Update PMBus core timing state for the raw transfer, even on error.=0A=
+	 * Pass 0 as the operation mask since this is a raw read, intentionally=
=0A=
+	 * neither PMBUS_OP_WRITE nor PMBUS_OP_PAGE_CHANGE.=0A=
+	 */=0A=
+	pmbus_update_ts(client, 0);=0A=
+=0A=
 	if (rc < 0)=0A=
 		return rc;=0A=
 =0A=
@@ -203,19 +165,16 @@ static int max31785_get_pwm(struct i2c_client *client=
, int page)=0A=
 	return rv;=0A=
 }=0A=
 =0A=
-static int max31785_get_pwm_mode(struct i2c_client *client,=0A=
-				 struct max31785_data *driver_data, int page)=0A=
+static int max31785_get_pwm_mode(struct i2c_client *client, int page)=0A=
 {=0A=
 	int config;=0A=
 	int command;=0A=
 =0A=
-	config =3D _max31785_read_byte_data(client, driver_data, page,=0A=
-					  PMBUS_FAN_CONFIG_12);=0A=
+	config =3D pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);=0A=
 	if (config < 0)=0A=
 		return config;=0A=
 =0A=
-	command =3D _max31785_read_word_data(client, driver_data, page, 0xff,=0A=
-					   PMBUS_FAN_COMMAND_1);=0A=
+	command =3D pmbus_read_word_data(client, page, 0xff, PMBUS_FAN_COMMAND_1)=
;=0A=
 	if (command < 0)=0A=
 		return command;=0A=
 =0A=
@@ -233,8 +192,6 @@ static int max31785_get_pwm_mode(struct i2c_client *cli=
ent,=0A=
 static int max31785_read_word_data(struct i2c_client *client, int page,=0A=
 				   int phase, int reg)=0A=
 {=0A=
-	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);=
=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
 	u32 val;=0A=
 	int rv;=0A=
 =0A=
@@ -263,7 +220,7 @@ static int max31785_read_word_data(struct i2c_client *c=
lient, int page,=0A=
 		rv =3D max31785_get_pwm(client, page);=0A=
 		break;=0A=
 	case PMBUS_VIRT_PWM_ENABLE_1:=0A=
-		rv =3D max31785_get_pwm_mode(client, driver_data, page);=0A=
+		rv =3D max31785_get_pwm_mode(client, page);=0A=
 		break;=0A=
 	default:=0A=
 		rv =3D -ENODATA;=0A=
@@ -294,35 +251,7 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)=
=0A=
 	return (sensor_val * 100) / 255;=0A=
 }=0A=
 =0A=
-static int max31785_update_fan(struct i2c_client *client,=0A=
-			       struct max31785_data *driver_data, int page,=0A=
-			       u8 config, u8 mask, u16 command)=0A=
-{=0A=
-	int from, rv;=0A=
-	u8 to;=0A=
-=0A=
-	from =3D _max31785_read_byte_data(client, driver_data, page,=0A=
-					PMBUS_FAN_CONFIG_12);=0A=
-	if (from < 0)=0A=
-		return from;=0A=
-=0A=
-	to =3D (from & ~mask) | (config & mask);=0A=
-=0A=
-	if (to !=3D from) {=0A=
-		rv =3D _max31785_write_byte_data(client, driver_data, page,=0A=
-					       PMBUS_FAN_CONFIG_12, to);=0A=
-		if (rv < 0)=0A=
-			return rv;=0A=
-	}=0A=
-=0A=
-	rv =3D _max31785_write_word_data(client, driver_data, page,=0A=
-				       PMBUS_FAN_COMMAND_1, command);=0A=
-=0A=
-	return rv;=0A=
-}=0A=
-=0A=
-static int max31785_pwm_enable(struct i2c_client *client,=0A=
-			       struct max31785_data *driver_data, int page,=0A=
+static int max31785_pwm_enable(struct i2c_client *client, int page,=0A=
 			       u16 word)=0A=
 {=0A=
 	int config =3D 0;=0A=
@@ -351,23 +280,20 @@ static int max31785_pwm_enable(struct i2c_client *cli=
ent,=0A=
 		return -EINVAL;=0A=
 	}=0A=
 =0A=
-	return max31785_update_fan(client, driver_data, page, config,=0A=
-				   PB_FAN_1_RPM, rate);=0A=
+	return pmbus_update_fan(client, page, 0, config,=0A=
+			       PB_FAN_1_RPM, rate);=0A=
 }=0A=
 =0A=
 static int max31785_write_word_data(struct i2c_client *client, int page,=
=0A=
 				    int reg, u16 word)=0A=
 {=0A=
-	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);=
=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
-=0A=
 	switch (reg) {=0A=
 	case PMBUS_VIRT_PWM_1:=0A=
-		return max31785_update_fan(client, driver_data, page, 0,=0A=
-					   PB_FAN_1_RPM,=0A=
-					   max31785_scale_pwm(word));=0A=
+		return pmbus_update_fan(client, page, 0, 0,=0A=
+				       PB_FAN_1_RPM,=0A=
+				       max31785_scale_pwm(word));=0A=
 	case PMBUS_VIRT_PWM_ENABLE_1:=0A=
-		return max31785_pwm_enable(client, driver_data, page, word);=0A=
+		return max31785_pwm_enable(client, page, word);=0A=
 	default:=0A=
 		break;=0A=
 	}=0A=
@@ -391,6 +317,7 @@ static const struct pmbus_driver_info max31785_info =3D=
 {=0A=
 	.read_byte_data =3D max31785_read_byte_data,=0A=
 	.read_word_data =3D max31785_read_word_data,=0A=
 	.write_byte =3D max31785_write_byte,=0A=
+	.access_delay =3D MAX31785_WAIT_DELAY_US,=0A=
 =0A=
 	/* RPM */=0A=
 	.format[PSC_FAN] =3D direct,=0A=
@@ -438,29 +365,29 @@ static const struct pmbus_driver_info max31785_info =
=3D {=0A=
 };=0A=
 =0A=
 static int max31785_configure_dual_tach(struct i2c_client *client,=0A=
-					struct pmbus_driver_info *info)=0A=
+					struct max31785_data *data)=0A=
 {=0A=
+	struct pmbus_driver_info *info =3D &data->info;=0A=
 	int ret;=0A=
 	int i;=0A=
-	struct max31785_data *driver_data =3D to_max31785_data(info);=0A=
 =0A=
 	for (i =3D 0; i < MAX31785_NR_FAN_PAGES; i++) {=0A=
-		ret =3D max31785_i2c_write_byte_data(client, driver_data,=0A=
+		ret =3D max31785_i2c_write_byte_data(client, data,=0A=
 						   PMBUS_PAGE, i);=0A=
 		if (ret < 0)=0A=
 			return ret;=0A=
 =0A=
-		ret =3D max31785_i2c_read_word_data(client, driver_data,=0A=
+		ret =3D max31785_i2c_read_word_data(client, data,=0A=
 						  MFR_FAN_CONFIG);=0A=
 		if (ret < 0)=0A=
 			return ret;=0A=
 =0A=
 		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {=0A=
-			int virtual =3D MAX31785_NR_PAGES + i;=0A=
+			int vpage =3D MAX31785_NR_PAGES + i;=0A=
 =0A=
-			info->pages =3D virtual + 1;=0A=
-			info->func[virtual] |=3D PMBUS_HAVE_FAN12;=0A=
-			info->func[virtual] |=3D PMBUS_PAGE_VIRTUAL;=0A=
+			info->pages =3D vpage + 1;=0A=
+			info->func[vpage] |=3D PMBUS_HAVE_FAN12;=0A=
+			info->func[vpage] |=3D PMBUS_PAGE_VIRTUAL;=0A=
 		}=0A=
 	}=0A=
 =0A=
@@ -471,7 +398,7 @@ static int max31785_probe(struct i2c_client *client)=0A=
 {=0A=
 	struct device *dev =3D &client->dev;=0A=
 	struct pmbus_driver_info *info;=0A=
-	struct max31785_data *driver_data;=0A=
+	struct max31785_data *data;=0A=
 	bool dual_tach =3D false;=0A=
 	int ret;=0A=
 =0A=
@@ -480,20 +407,20 @@ static int max31785_probe(struct i2c_client *client)=
=0A=
 				     I2C_FUNC_SMBUS_WORD_DATA))=0A=
 		return -ENODEV;=0A=
 =0A=
-	driver_data =3D devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNE=
L);=0A=
-	if (!driver_data)=0A=
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);=0A=
+	if (!data)=0A=
 		return -ENOMEM;=0A=
 =0A=
-	info =3D &driver_data->info;=0A=
-	driver_data->access =3D ktime_get();=0A=
+	data->access =3D ktime_get();=0A=
+	info =3D &data->info;=0A=
 	*info =3D max31785_info;=0A=
 =0A=
-	ret =3D max31785_i2c_write_byte_data(client, driver_data,=0A=
-					   PMBUS_PAGE, 255);=0A=
+	ret =3D max31785_i2c_write_byte_data(client, data,=0A=
+					   PMBUS_PAGE, 0xff);=0A=
 	if (ret < 0)=0A=
 		return ret;=0A=
 =0A=
-	ret =3D i2c_smbus_read_word_data(client, MFR_REVISION);=0A=
+	ret =3D max31785_i2c_read_word_data(client, data, MFR_REVISION);=0A=
 	if (ret < 0)=0A=
 		return ret;=0A=
 =0A=
@@ -509,11 +436,13 @@ static int max31785_probe(struct i2c_client *client)=
=0A=
 	}=0A=
 =0A=
 	if (dual_tach) {=0A=
-		ret =3D max31785_configure_dual_tach(client, info);=0A=
+		ret =3D max31785_configure_dual_tach(client, data);=0A=
 		if (ret < 0)=0A=
 			return ret;=0A=
 	}=0A=
 =0A=
+	max31785_wait(data);=0A=
+=0A=
 	return pmbus_do_probe(client, info);=0A=
 }=0A=
 =0A=
-- =0A=
2.34.1=0A=
=0A=
