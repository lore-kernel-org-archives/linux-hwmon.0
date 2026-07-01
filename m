Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0072F6FC3;
	Wed,  1 Jul 2026 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782868594; cv=fail; b=oQtNFH9D5hpXA3VEi0txJnhDupKzBfdtpG58S5SYAZFOoh8b1DIIruh4chuZzQYvqEHDw1ELofMmW3ZcE0Js5VIq39gE8OKnwl0da/KGtuurCblELSKTqmJFNy/+JtpYZa4LukkPWidpDxDlAXTppz1y+hVt/jdjQmtr+VnfBFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782868594; c=relaxed/simple;
	bh=8ng8Mbc/58n0vFGyaaomoamFrHDH57Uz/dnzD6EowE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F1aXUTrP2qe8LqCWkzy1lo2dq4uce+8uCuDBhTFO9wymkaL8XQUu4Oo+wcVrNtJHyBN/eLXQOajr3iNwztD+0O6x7qscTTL4mcOXf6zPYNWWzxiCEtZUkjr8Sd84ocKPWs7VS3iSnlcsM89cD0Z8K9luSsxTjmOrUdudcgtt/qU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Bw2ZStcA; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Bw2ZStcA"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNLYle1868568;
	Tue, 30 Jun 2026 21:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8ng8M
	bc/58n0vFGyaaomoamFrHDH57Uz/dnzD6EowE0=; b=Bw2ZStcA76SMoy71Dpd4U
	nUKppS5lYYh+C5JaK5U/6CyEJhChCPG3aU/F6NmsxU+gV69RZudN9WanfBy5tDOu
	bJix0ylZO1CapwGds2ZeygVuuoaEBUgUj3yG6TLe2RIeiFXllhJCfZEgB2k8o4+8
	qQYctM99N60nCHiG6sMsc3mdl7UrVaWCbLBrlTj1sOyFAVarYbvxakWh8T7AWmdM
	vU8T0XeCrZKyeAUpT2LzbjnW2bvoQRAwtNrzMoCLxjZLDtEhLWhkNNSCiZEXfpRc
	MFFyAUINwMOT253btvT7T26I3TvL8AsC/bQu2ABRq3qNNvKEPfnrlDJkOiX9BUHN
	A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f47wpm2qk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 21:16:16 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzzW2SY2bxugaSlC76hgTVy7VHXyn9rUoiV/seKI6xYRXN81zvmzuKg8dBRwiEGQnjinKBu5hHSXS8j02wNFna9+L7qo9h4t6Znc+S6J711em1DJ2jJHM5oq/hlq1zYhheMz+fMZiJ6NVCRW8F+cSpxB4+htdBrFmbD2TROcwj9K+U3V+EVA2oQsMnwiMk43zm/ePVsKQ16P7phCLytby5iwjas5Ofksc/gTNIGiFAv6dNjh91hqGXFqZP/1tPeh07Ke2O6UJSTyUXfxH8YfPciUYCXYvFq/Y68xbeRaM9QX94y7cpqNUY+pL7RMbsJ6+wXQTgG2IdD/I2bJLh24pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ng8Mbc/58n0vFGyaaomoamFrHDH57Uz/dnzD6EowE0=;
 b=e2qvZGG4/PvgeK6xLfJp3nzHwsMeCmO5vIzAk8SivQZWSSgsDpD2huW9Hjdb1NHP6msecd0Bp5y6Z6zZxJjTCQfVuaZyPcolk3MkRz0lkwavbkEwCKBFKK6CasWn1IXY6Wvz7X9kRIB3EU9Stls6+AeaPmMKugcdEfF/32vEM+6mYY6ASO/3DGE/rzJgziQSinUYxcLQJD0iSulGEjZz7p1x0D3FDRuNcdITjfq/ewgUP9A/rcmkvPy6c3aQU/qfSJeZs/qStQUucB2w4Ra/QVA3P+GVZ9HAA93jG88MLC2jAQBtOZ+HN5BbHGmJrJCuVWjHV0vS9/GqFqE4vQznMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by PH0PR03MB6679.namprd03.prod.outlook.com (2603:10b6:510:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 01:16:14 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 01:16:14 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
Thread-Topic: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
Thread-Index: AQHdCDrCfXjw7m2rKUWmKtVpV1zDdbZWswmAgAAG9wCAAIVNgIAAmieg
Date: Wed, 1 Jul 2026 01:16:14 +0000
Message-ID:
 <PH0PR03MB6351BBC22CA37EF0EA9464F4F1F62@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
 <20260630-cuddly-quiet-jackdaw-b7ab3d@quoll>
 <PH0PR03MB63514D6ACDFF20DF4D1A4855F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
 <d6e011d7-ef9b-4cc8-91c6-3f329017d213@roeck-us.net>
In-Reply-To: <d6e011d7-ef9b-4cc8-91c6-3f329017d213@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|PH0PR03MB6679:EE_
x-ms-office365-filtering-correlation-id: 16202de7-692f-4986-b33a-08ded70e5849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|22082099003|18002099003|38070700021|3023799007|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 EBAxi0eUlZIpoDiD6ShNd2S0jT2PVsdBJlwC1LaeHWkQAmcLyDOSYfHPTCuWUJcz6QegCrT78jfsq1wsa71HXkp7WlwzyAkqOIPTVRyHzmFN2wNH8XBYoqwaThD7awkKjgXqjhbiBJ1TWmvn2/wKA6RjsI4bcls8V04XY9kRQArNSOACWamELdejeU8o7t0VErK/TzF9Iofp8iFEPCxmUA4YL4zlUbN4VBtH+yB7cF4t0FfSmvAF5tUSrNWvWqNOBAeQucSgS4TeUSwa3A1Ph9JUrT9YWGR+anCKx5AzrpSnSJdesyv7oB5gqGAuF0uomhrY+wxh+9UELlSWouwnArqDnM7Au7+8HcuVUK6ngY0fdLPnYcsNSsnjS+PzHPxOcR8+cqy6x0zmD5CT92uQN4DqztiOTHENEmw3AhCFx6Hx+DMqOOYo9fPakqNtjKuvW6h5EWwJU0qvQKVKrk6c2s7dI7yRAIUyomAnfaq7drtqyFdg21POIVtygRGO0CBLH+W1urDBVSgYZQyWGzxuHswPeGigM+uJfIzoiCyvPMW3cIw7OcNZgxgl3HHShuNOBBaw0qSwv7iEYjgdDMAyAl6LK4+f4r+m0+V9LHi7Pygova2lTul3sMken6j8gpSaLlN03T9nNNIC0z7XBNwy8s5a43HgcNnFc5zgixSTfWdWIGX6z9B+j0rL0/Q+9+wl6QXos5krDHm2ej6c/1nFNIt4ea+rTx3TDqwsFNX/DWM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?F20I87VsOUxLZEbA553uYAp3J1FN7MV3W23+HE89IkBLXDoksiUTppGkIb+m?=
 =?us-ascii?Q?Ihfjn9XMHVgm6uFT3EyLXYtmLJR9B0kHsjmwZk9rUPuIW0/7nvD3sgf8JOFz?=
 =?us-ascii?Q?cA0ZFenGF8wDyRQHaLFG31wghKkNi+rG794PuwKVtpFi+K9Z/Ynqma/TAsRE?=
 =?us-ascii?Q?TMMUeLKI8kLDQRTMy4oT9Roj1OShe59pBIlB7EBaCAUQRKvxkuzGh4spmsd4?=
 =?us-ascii?Q?8BDfDkgrQHzdFrCGDI+3raxzxiiuF+mrXcOGO0oFYQAdskPzYTIaioSGGvEN?=
 =?us-ascii?Q?D5A59bWPO2mlsD3kUf13aeCEfuzI8bFN13srCYbqTlZCqjX0aK2NF/gmw19M?=
 =?us-ascii?Q?Ze1PUVwg8He/XWmuAFzAKKSLyufIj4oZLmbBuJsHKA4EpDcuKXRs1Xe7NWLS?=
 =?us-ascii?Q?pxcl+2tPJaDE9UzLjqJPgw/fJ+28HlLLtdTLMpoI9SOKjrL53qzA1ojT0aXW?=
 =?us-ascii?Q?t024i5AINa0xTKuwQwkz9KEld9lHxIfJrQJngSvG7KxqzEP+4AzqnWgOY7Lv?=
 =?us-ascii?Q?Tm8ypjQ27HIpYZiNWXIagYPY3ZE2vkMEd7nlmM+Goevt3yqyHh17qv95MW7F?=
 =?us-ascii?Q?el2lHn9gB7PQg1wAMUwQrzMhgqsq38P6LYaeDFijpmW5Gkld68cBXqarPvF0?=
 =?us-ascii?Q?C/Coe4w3lisiexsy3rqLoIlvns7S8kLIrOQTe1zhhFFHHWUTCTlpBXWCnXwI?=
 =?us-ascii?Q?uuZ2sPNKeuWxRsoSm6aw2lFdYh2tACb3XloQ9aQXeFYwG/iXNfZhLOwMT+lx?=
 =?us-ascii?Q?RRWwFBrUdV55nNMXyA5WvdrA3cXI26k4Qr3yafhv0dUqyyL2sLomkaTqOwN9?=
 =?us-ascii?Q?foRU8dY40130stLrG/cSsfBLjpgfclvThui90sFhYk/eVcZguQGIz0dntUv5?=
 =?us-ascii?Q?HHZfzWWNvTPjesw4/NC15kwLaJ0XhOGM/rShHkWlYTXhH05KiCOBlc45jpWK?=
 =?us-ascii?Q?dZZxVlzbsoKKWjcRmCRWRPBdnV6sGVgNTac5kZIsfc+S1XxLdrlQ6ELxwHjv?=
 =?us-ascii?Q?nj3iE9PvVIZm4TrMLy835q30Vs/6H/jcLFA/tRr6rH+qZNYrgpNAdZAqyMG1?=
 =?us-ascii?Q?oqdtPS9InV0umJzMWTzVcalYJTUr39PEcrcbE2p+forDLjq1QbrkTidzX1we?=
 =?us-ascii?Q?R19b40f/a0Lccz89UpA5LyLpJU2ndVL8JuvAIyqeiEnGgbSewV681LiJbFTK?=
 =?us-ascii?Q?nF3L4zwoT/mPp6pgRT+l2wATwbVymwLRzU1nLkv1cGkKTYRX/EOSicTHHAQf?=
 =?us-ascii?Q?LK5VNXp5mJWj1QmzT5XPhrjhByI5rASPULlPiayQI7K1MM+o2ITjNY5ihZn/?=
 =?us-ascii?Q?7A40CF2no5PKSiySFm69duM6t4b7QSODPcXp2vYmqpHpJkXNfxddP3SU4Wl4?=
 =?us-ascii?Q?MpH+qv7T3M/zX0ZzMPkmqvzkgQRXQL5Vf2VfLVeaSwJk2GA7DSUnbjbWZ32f?=
 =?us-ascii?Q?nO0tpY0v16/fWwsRRTdOeM/KPKeaIlSsFZ1xKJrV8WxZQ4LxY9ygsA3fsphh?=
 =?us-ascii?Q?LqO6V45V5rnz6XL5E+YP108XTnZn7uYrjT/PDDUt9CJ7UKPlKIVzs/pHHLWS?=
 =?us-ascii?Q?F4QKBlDRgt9ou8Hv5HnYXDdwE6EbmLCw+ABIo0lMrLh7QV+zUSbpjPMRFCI2?=
 =?us-ascii?Q?ZbMUpyBfWGwW+fdkV/jMkXZc36VF1pG3KTNdm7QZSiFb7D/AJPiK68MBcZ+D?=
 =?us-ascii?Q?cbMOTEaAdFrJs5phfo1nbQKV2/hKp2wU+CLS0q69cz2i71sm/H3yi18rKd2M?=
 =?us-ascii?Q?2fJASn/xFN5zmXMgmd9QLsbSDcwlbZs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	a/iqxuNkCGkKQK/fy+X7wGx/J+0abiHWH3A0cDhtCkj4HxXaNznhUUll/Dg38K67pOQ7S+PmCsNCnnwNcKVvjlD/KW4875YzF9KWE+JSky3lcl0Q9XLvpG7d3md8kqdh9LmNjAwNOhaOYYL8Mxs3t8SjL5zKnnRxbQsA5YE6XH/YD4ANwv+q5taXUzA8l9IpmAwwPiaHBckW47FtL4ycAch5tLfkK/okXAy8+zsZTmm2a8eZg+tG1dbnhXewrcin7Cf0O7fnVEhJlk9RFR0jkeB+wnvRJOx34yV6ov2k4CivvHRthSbqlQSEfc7o4zvY0FciNiQTHymHLTzG/VpDTw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16202de7-692f-4986-b33a-08ded70e5849
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 01:16:14.3866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3Ler+ccbEsOaDfYseAWz3wg1Aaszc+BsT/DdRJdY59PsBncTT9LhBlyukIsajXX0wSAosVEHHihC5nBjpIj7tp2mts4yB2hzYph+Ri+maE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6679
X-Authority-Analysis: v=2.4 cv=UoRT8ewB c=1 sm=1 tr=0 ts=6a446a60 cx=c_pps
 a=OPuTCcLOD/60NKbq+Taa8g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=kGkSn6ZLCwrRpUP_QV0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: vRr9o_tUcWLqk4PykVPJNpAb5rurF5Cq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxMSBTYWx0ZWRfX0ibphCq7Fukj
 lylavT7fUDksRq7Xgc4XBBXuLp6qYv+RVwf8D7oAl44DeHzWUSIm7lSgWpu/x5QXL3H44svxePB
 Wz19bBrYYtzVeBUFQAGsa9xHTOdcFF2o0hXcu8XbUlhN7pj24AWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxMSBTYWx0ZWRfX15V8FSUicapG
 l77cPINUJ2omt/+aWFmOc9pk5nTP6dPhY08ZHtMjYWS+fyZ/N8EkoMQmLhA8WjD4RoYZ5sEoNwg
 xgoakODGH45Fsd21NPo+2Y+TN9l89y8YI6Hr4vzfSnhcEhs7yO9/ZVW2JDpWDWxovnEuhwgep85
 F3qf3VoLij4PzR2gowpIaU493zzj6/hSR/2Hm5LrWdlUrH+G2fJT6Q8+do/uTdMXrjO4KJLIi02
 tdRGfjTsk2n/gE6qflmxpm5ZTcsyG3qjSOkIvrdS5A3pVtxs9i1f+76fdICJJLnmqODViwtr9Pp
 9/wOeffa4juYnM9+AtpVqTFFQeJDT9IXVg6KzAkDy9M5523MEee1IEy06RyRMRout5IAH6Gck4r
 Fxr77x7KBJJTtw0z8e/yR/+J7GlHawL4gjZbmL/nxD9sLO7ww0p3D5GSUE8DP73O8BaBajSPIHf
 heyItgL1ADy4GRZyzNg==
X-Proofpoint-GUID: vRr9o_tUcWLqk4PykVPJNpAb5rurF5Cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010011


> >> [External]
> >>
> >> On Tue, Jun 30, 2026 at 10:46:43AM +0800, Alexis Czezar Torreno wrote:
> >>> Adding a missing entry for the MAX20830 EN (enable) pin.
> >>
> >> ... because? Device has it? Was missing?
> >
> > Yes, device has it and I forgot to include it in the past.
> >
>=20
> Pretty much every PMBus chip has it. Many non-PMBus hardware monitoring
> chips have it. Problem is that there is no practical use case that I am a=
ware of to
> connect it to a GPIO pin, especially for PMBus chips because PMBus (and t=
he
> chip) has a command to override it. Connecting the Enable pin to a GPIO o=
utput
> would mean another extra and unnecessary wire on a board plus the need fo=
r
> additional software to support - in a more complex way - what is already
> supported by the chip itself.
>=20
> This will even more complicated if anyone ever adds regulator support to =
the
> driver. In order to fully support this, the driver would have to add supp=
ort for
> enabling the chip through the GPIO pin (or to override it permanently, ma=
king it
> pointless to have it) even though it is highly unlikely that this code ca=
n ever be
> tested on real hardware.
>=20
> That is why I was asking for a use case. "The chip has the pin" is not a =
use case.
>=20

Got it, especially the part that PMBUS does have commands to override it, a=
nd adding
this is unnecessarily complex.
I don't have a use case. Will remove the en-gpio code from the driver, but =
keep the
binding entry.

Thanks,
Alexis
