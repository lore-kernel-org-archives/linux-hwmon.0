Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46951B6CE9;
	Sat, 21 Mar 2026 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115694; cv=fail; b=H/6MsecPA5d+NtqHEnlOwlnroyNUJaK5pmcTId250PatuT+r9O+y8B1gqao/DaMs4364cLk0/WH1G8erptA18sDijvr7Up0fPhcggD7o+Dooli477qqCFNtSS1tb7/grrpkvd8gKFvAztl8QWQw0kJPJES1qWZY5+hlfdfrN4YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115694; c=relaxed/simple;
	bh=MkQvInQsB48ubASL3N9FROcu+taDBm8LLzckhS2MNQQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lm3WKoZ2aBpKTnn1aX0TSqAgokFhzYI7AYBblGlmmQUZuTe9I5Z0ZAkVyvpyONfIZPGSO+899sNeNQnPDfGR9XzZqfFr7rFOorT6Ne2F3ARQIKi3UZ7YTSIpK3cHvlsNOK++H7uJpaA2mSnXhhHBr1swis2cWidBVoNC5ekLFZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=Yx1gWROd; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="Yx1gWROd"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L7WlUv4065469;
	Sat, 21 Mar 2026 17:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Mk
	QvInQsB48ubASL3N9FROcu+taDBm8LLzckhS2MNQQ=; b=Yx1gWROdflgQXQtJV7
	s2vPHed31VrkNckgVskBqipBmZP8Xm38+U0yPNd21WB62flAG7gIvrDsXPi4RUZk
	sLu20TwJB8PQpWDGbc2rr0Y/0vjr7lRvzwgddC2FafPmHtg2cRKLBvitbZDpazJi
	5VactS0W1ryKh4I/9e5n1SZL1b0F0Few6k99htH8PJajm3N9DN37XWb3E8Vo3vwp
	YSZcNXFMta3tS0J1GM3NTjENxvdSUY9+Jjaoh3tHr1C0ISIMiq0cZrptabnfgj11
	TlQp+lRFfjZHlDQ39TMdwLa8e/AbEblWl74mcVMdwwpcXxwseaRBxPjdm5kBs+w6
	nuZA==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d1mghcju8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 17:54:28 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A837B2767E;
	Sat, 21 Mar 2026 17:54:27 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 05:54:26 -1200
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 21 Mar 2026 05:54:25 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 21 Mar 2026 05:54:25 -1200
Received: from CO1PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 21 Mar
 2026 05:54:25 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqzD/ewQAqCFzazfEm5X2iqfJXACN6fPN9T7rFpzf38KbBLp18lELS3SnwQsRDPNxGH+eenEZpfZJplSC8jtpNkmodH50mOc28xgwudez/4kbqgKarf0cg5EPm8VDqGLj6IbrkHt1hWnMprVoymGIMSaEHN87D9P3kjvV1FKTKxrrRY5KokPHYVn8VXYmhndB4vh5eix8Fi2NoXRSUPaM3EHFIbCcwTS//p1EsFLFs8X9DR730v6PI9CL/fVmC/9yBUhJCJ+OR4T5AF5FxoMyekZ5CCTprAuXzbXNpAre3aPKSkx3BgpJBXhMFZogCsOnW30DTwvkSxlIjwG7Lq7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkQvInQsB48ubASL3N9FROcu+taDBm8LLzckhS2MNQQ=;
 b=OEvuZVR0mARe2byhgijIiCXhQSQViXtbra2MB7MYaYlJqPUHFGn/1/cohdytx5iaazTUjcmGwM9CLzUihmsv/NFxw1cZDDNHn9O1SYZcWgInG/LUbpI13YNXLeMxXpsCRSlPNISNlscoqyQ84OJgjUG9ooBQsh+lpuGKy2hC7RqWRm8FTm//n5V9Y2HJkhVYDXa7PAQ2YvK1TUBuUiknBl6hv9Rk4g2my+gaPpQ/s+bhlSeYgYViGiSSel3rvh6fio9uOmo5Akqbf5ny5/WrtQdOcGPbsV1OiztpBAdY4JzQ2MvouPd8UjhYdFe0nLhn4EYPC32ItVimcFTS3eFhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by DM4PR84MB1424.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 17:54:23 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 17:54:23 +0000
From: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sanman Pradhan
	<psanman@juniper.net>
Subject: Re: [PATCH v5 1/4] hwmon: (pmbus) add missing mutex_lock in regulator
 ops
Thread-Topic: [PATCH v5 1/4] hwmon: (pmbus) add missing mutex_lock in
 regulator ops
Thread-Index: AQHcuM0Onve+LRo/4kiM8frHCLYbwbW4dkCAgADPmoA=
Date: Sat, 21 Mar 2026 17:54:22 +0000
Message-ID: <20260321175413.25476-1-sanman.pradhan@hpe.com>
References: <8e7d851e-0ee8-46c1-a5ce-4235926e8cf9@roeck-us.net>
In-Reply-To: <8e7d851e-0ee8-46c1-a5ce-4235926e8cf9@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|DM4PR84MB1424:EE_
x-ms-office365-filtering-correlation-id: a1afbc8b-2b27-4c03-563a-08de8772e28f
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: s0UDthyiURtpuOJoiRChseSX6BKE+2FYGfuO4I8Je/L0/rb9mkZ93Ec76uwZ0hsi+ehprH97jLNo+p07yhyBH0Zpzqp/RIoPusF5iVDshvuTWX8emor94ysULckgd0MXPHgmONts7eK67UifLwvRVvy06JtKPnYAP5HDCs6Z9GKcrabOaLYxnJJn75BeGFTSMe37NV2OK5Ak+DwiTdtshwgNcRhAoDn4aIIyTrI0zfp1xf03crod8RYE6ZD/jRCyPVNPb5kog8wYRuM/j7zK80tL0Q3QS4vD+XPoNxyk95u1xYuASFyxTRBEGSbH7KTEgA6nygmVGC0WIprIVGQK/POFMpeZ5SgcFzrEZUP/qWoFwtoQgs0PwGFlPPnPmd6o0hcH02R3/fyqDeaKKxzuk5VzFlyqZRqBY514TUOYPZgewd8oJw0k4CQ57GjHMa63Y2VQ4F6ycu7ObvTEdYGwkL+yGHTjSzg+XB0ieDqIgObvOk9AG/Zg8NN8OywKDOTPcDf4cDB6Rp/30erDm65V+cHEby6MdM6AyqsdiJZ95Ma4qiCkGCmDo6btQw2OwjFgWvtBd0yXomvGD4gpP/3I96Ew6uVI1Zjg3h+QmV4KQFPUZ6lxanM3FkRpP0A3wOYzHcWShaWBQmx53bIct4Mb4oOu1pDiJx6XfDaVVjh47kiA4EMU2uNUcG8oMqmvmP7WzetQLjurH9dp8b0T+5ubo+9TUAhvB4xVvkIjRzSbq48MkTh+09lSbLDst8jbAZWYnVyg5zplhHs28TrWCQI+qk955tg7sSw5/q24c/nopHM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tSeSYr1xDeBos1z/UW9RqO7KbMnQ16D+q4UVzDKwesZfEwsei6xizeVspT?=
 =?iso-8859-1?Q?u1xbOkF1NDuuEsURxwx93XXtvvbJWnJ7v+BcY8lmfbDe66IhigTZijAQvw?=
 =?iso-8859-1?Q?qwNBvjakFmYaBbmhVW1XexlNPj7bFZxJmlYZONZS2iPHTla4CRDaQXBSeJ?=
 =?iso-8859-1?Q?FrGh7yMSkuoAbqNW20adlmqiP9Hpe3dHrAhWOyTDmMP3LhJQVpewdEkqIZ?=
 =?iso-8859-1?Q?N1B5m2yueefbSRkZ28z0i0Kw6gM2GXpJ3yV/uQTToiTdQWASrCZcQ7M97k?=
 =?iso-8859-1?Q?vKPiEoDLcZHhpWtP4MQ2TZDmTPNFlyv4FPr9JDnWxwBP5Er38Ef289Dla4?=
 =?iso-8859-1?Q?nM0j5rhh+5JUQQoUjP8usTbXp0ZQfQhNud2duFfp+8ISu5IcuzOHI1CP8u?=
 =?iso-8859-1?Q?HKJw+I0uJJfZWniWqtX1qCsS/cY3va+igzL1Tc5zDu+gfWmktLRuHUHZ8l?=
 =?iso-8859-1?Q?U/8bgEaTJXWzvSJMW4YZ5Ndse3VeqCMTc/HYhXOKy/RyqwaWtrZ6ChBWYW?=
 =?iso-8859-1?Q?xv8mb7hUviIoYFQ9vFb71BOS/oXBnQj2amHOht+KEirhoTUz6I09n7vGbO?=
 =?iso-8859-1?Q?5dkTCIXskUs5bGI9guncWyrB86v7asyG3yXZD23fL09RpYLG9haOBhZAQq?=
 =?iso-8859-1?Q?MHyHREpNTZhzTKH9/hRX1RVTvdNSM0Ngfu6AoJc2A+94khZegJfJOPo8Uv?=
 =?iso-8859-1?Q?zcMGh+2NvNDKBc3tg9bh7iY5i4tY5Bxf0VC88znXBwJKzaDWP5mbExj7T5?=
 =?iso-8859-1?Q?SHNBjekxGq6O8H8hJpUl6tdUf/7SPUE3wIOyUEpz/MB/ncquWQkv+IGspG?=
 =?iso-8859-1?Q?+CKLcmAvIcPWrRq5e0gK9YB8Npiz/Vo6y3v0+a1DsBw4c7+8lbrwKLZMPI?=
 =?iso-8859-1?Q?K1MOv1hYqjmNX+3x08CC2j0WRvdp7yuQYxvCA1a38YXj2oX9jGOMeH2vUU?=
 =?iso-8859-1?Q?xOiq//MXLbkhKinjKJPdrWgXZWz43l+7Jl5BM0bFkVL4U2lPtvTMiBWowA?=
 =?iso-8859-1?Q?Oia2l0Jat2X7agJtR85bpIEPG897mk0vN04ofpldP6WOz3WNAgHvq14e1Y?=
 =?iso-8859-1?Q?c7QyhmFyxa/bqG2QIVgxNVadQMN1aB+PcNSYxh2nZPo8tVE6e7wyupJmEO?=
 =?iso-8859-1?Q?Tv4ZXNOpeYFvP3coNvQfi4O/Qc6duhL/bxGHiDxsUbuIoDui6jjNqFMbaV?=
 =?iso-8859-1?Q?abqYiwtIuqXt7z3FecYwco5WoRZHvo0v+smVIQW7S0O9WEMhpPp3HATHkR?=
 =?iso-8859-1?Q?3ukhoBo+1x+otBFPCj/7FA5LzpPXD1EqICzwE22k2nEXdZasEAkdZGdfPt?=
 =?iso-8859-1?Q?Mdg1IE8S0R6Eys551tDna8gMl9F/6JjzeA60DXFq71WUxBwiTg2m40Rz86?=
 =?iso-8859-1?Q?XqVfk5KSoqCBZ9ZbAmafXN72VKQGc05qcX6gZvVoNL8Xrvfv2F6CCAN6D5?=
 =?iso-8859-1?Q?A9USn4u0NckuWHRG68tx3ukTcj+zuGBZCwbLtC6NfnoZtAZ31Ur62zZwXq?=
 =?iso-8859-1?Q?dpK3kRLbGupoBrmDJJOsy211EHuKYw+KdE8o6Z6m2njgEFDtq5csCNm5IB?=
 =?iso-8859-1?Q?BWDBaSCp0tnNRFgj6aig9XlGUKAeM+8EPm1/vL6F+FnPVL3YJ0sVWLADaj?=
 =?iso-8859-1?Q?2AcSs1AkPUlkGZGdYRoeJIvZzX0OeEUNa3RuxVPI9MwsbAjOWeAoe5hzFN?=
 =?iso-8859-1?Q?F1Qc1H96SZC3aNYmzXDcGHMMyiodW358ELgt4lE3tVeNrlpNjNMSK9UbKm?=
 =?iso-8859-1?Q?FhmIa3isuGGKXKbLeDsoigz5cHleyjP9I0XZmxw34LVLVabpFqdKL0/kAh?=
 =?iso-8859-1?Q?yFqVpAnx6A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: laxw0MWkchM7EATiW2dAJunMMoS4OS8xC2MwFb6vOl9GIBPCcrURaHbhzOlDikQ9o/wxOu/B3u/kH4tT4UUUDUY07YInKQ1cZWGKYD2wDtyUlhpl6OkF5pEiAEyUYFIWc7yZZ+H+yNtlT54JgTrvX6BC2cdT9rMVqRQAkyMOhtjb6/4binLw9ZOwTZCSwpu6u+mrMUC/vEuzu/7NBIa+mA0nqSsxyMsAF0Q85Gxd4+6PkOE3pW0HH816YzqxKuJIbtWWe+cRh1Aoconj8KdqGdFcXicM1wwTBb+0bmNhQ1Qoxp4OXSKMeuCUqRrxAa53qngtWhGI9Smg+FOnQNbhQg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1afbc8b-2b27-4c03-563a-08de8772e28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 17:54:22.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCCNU/BeEwxamKc26UNKg0I8GuPRFMLeqgM8Yb01Ke+UGjDg9uNHRkytl0E0Kf1cNUqhfn8ZVNiUHhtvPatSdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1424
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: oobHfoMbXjhmIsl38ymAiaBfrp0su8Uj
X-Authority-Analysis: v=2.4 cv=MeVhep/f c=1 sm=1 tr=0 ts=69bedb54 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=OUXY8nFuAAAA:8 a=PR5NoB-ntYysLmXdl6MA:9 a=wPNLvfGTeEIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-Proofpoint-GUID: oobHfoMbXjhmIsl38ymAiaBfrp0su8Uj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE1MiBTYWx0ZWRfX7LLPjr/3WEc6
 XnWpm0hK4yta8IUHDP4v188agu0YIJZCT1R22mcJKJG89Tyi9qhnmo2NxzepCoAO9jiWaJrvPGe
 1tN0ZXlS0CguWju6NnaQhCpepg6DLUNcqm7COp4EbMG0WdlAJelEIawBHWpOYqg+OjX3JEbLeLX
 4D9RKH2qsyjavRctqCNlkujv+2CzgyyRxyhPH+0rl/MrQ6D7lwXwWm72HV2Hqc1dkF/qjugVFo1
 3SUTsk+sdRR6e1vwNw6DMFOFtF9NGU0OE4PA/uZI3CSNKr1H4fDrb7zQA32CXWQQkJWo3ZTv+/c
 X33DKI8DwAhbIrMipA8YCPSMLBk6C3G3L5SRuSQTagodw6M77dBR+SCLJks6UFfXp5EVf7fZXgz
 rBEYi/WApZL+9N0E/zuDNsSWxyq4UUPf5MUxtLRdDVW3Sta/ugV9th9VuTRMtsjLDkakv8+E+5l
 HrI2zMPRPZqazsW0exA==
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210152

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Thanks for the review, that makes sense.=0A=
=0A=
Agreed, Patch 1 should be dropped from this series for now rather than=0A=
trying to solve the notifier/locking interaction here.=0A=
=0A=
I'll resend the remaining patches as a v6 3-patch series:=0A=
- export pmbus_wait() and pmbus_update_ts()=0A=
- max31785: use access_delay for PMBus-mediated accesses=0A=
- max31785: check for partial i2c_transfer() in read_long_data()=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
