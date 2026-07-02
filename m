Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E902C187;
	Thu,  2 Jul 2026 02:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782960650; cv=fail; b=qLDZt7ZYYcj5wwvJarVxmWirBY+W5dzrQe2dNNTWSIhR9pGtDHg5m370s0FTlBr2knEof79FseS6pyShBzaWNj+Qhv5QupxYYlYkbZRFhiA2boIpturXYI7sMYcSODAUSJD7ilkzGPnT3n5vHQ7W2eYtg/rfEx2ADJvvIqSf6EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782960650; c=relaxed/simple;
	bh=tYmugNZALu04rKNZgUOGi8of3NKbGG8mXTx1Lhh7XPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=twpV5U87VxlFChNMmdXSYJzmDo83wsVvUoyvmJPGwPYAGoI0TY9y8fQ3KEU8MCEPs36aspEPRGy6dv6Kppdz5Thdr6CUu3yQyGFMkRf9qnE4zSUDVqx6Sf1IKBtRpfAid/IgMEuCKqEfv/0s9+/8cM24mEkoAeXXp61LdhN70dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kyaFnYJQ; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="kyaFnYJQ"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Mcsq804212;
	Wed, 1 Jul 2026 22:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Xs/oH
	2349xGhuKe/F+RR+o4i2ciFgjr4sUtNUciHS7w=; b=kyaFnYJQov6FDGdGbaX01
	ya+G3+r+EpI78J3a3gXnXx6PTQVcHwObJST4fa6rg8xZb+9M/rAm1hI4fmpHsu2y
	cD5v8+tdIeWp35ribWTUUHCPvDKasfZqIgC3C6FqKPslP7AiC+8H5roZAh/tqoZX
	Unx5cHXvDkJNFup+d5JLEompa+ShoV/bLs1W23p3wtthdFElWnYbIpEg5CGWf/44
	si863SCIR2wicbLR/Q4L+ipldVgQtMxz397FvkAN9Gj6cXpuAYM2x7W7PrfxSgnr
	SSfCSZQb2YQzzzrUqcY9lhGGmCr2DEz5kjI0p4sRGA2QCZIVCZNGcVUwsSifqVk/
	g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f5e9307rv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 22:50:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNcK6pIxdz/26k+bR/DoyZeeaiN4N3yMp2Y6Ood/bZuYVFvzAce9f39eMiEbzH+HU/+UdCqYn+QTMWYy9VxeXSDlvj4LEWC+JqcHBSUYQiD194+mhW8lX33TRxipqvHBhGfCvuPVVFOrni6u5s6NZmOY7sSfXGHYvLvlbf9bCkSepc35owT4ipW6vS12pYs8PnSW7E0fMuWh84ijLBTlKZvqOEzLp6O8e9bIDEd6sC9UKj8y+3ehWRNB5vOAmkIRqiMK1jTgYpBrevpcRrUhE+iW/6XC/d8GVcp64tpqJF8oDFqQVA4iB69xc/gHJy/oAXnotW8jY8VjuA/b2Jc7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs/oH2349xGhuKe/F+RR+o4i2ciFgjr4sUtNUciHS7w=;
 b=GXbiiUkyNU5W51+p4MycUk7obWSNnTeQxK0FPJ5de7mX5RjIWX+5Z9/u5hUUYZBYINLig28FqriAYzAkx3diJtY7EDtV++rwNrUE8c1BtjVTv4JoOXqJE+3dlGuSggY2zhe/KeiA5/3KaZjolGSggfRI0BBTTleCyTivve93w9yQNfmYrsTy11OL1QCDKhw8h+VN9LVdtOG2dl+2LbV5r+aTUgBTACshKoUaxpah2fUzZVcKb4Ei7nOTjsOTt2MlDckmLu8SjgBd/Dnds2ULK30QlxTyNZgC6HjdL922w/10AridqxuqhZwbSU7WreXeQCsYIILIjx3mxE/PwVMQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by DSVPR03MB989637.namprd03.prod.outlook.com (2603:10b6:8:41f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 02:50:13 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 02:50:13 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Topic: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Index: AQHdCDrPjQujEK8MeUujhrP1WqLJTLZWdMEAgABEj/CAAHm5gIACUkyA
Date: Thu, 2 Jul 2026 02:50:13 +0000
Message-ID:
 <PH0PR03MB63510E27A6F22742D526C244F1F52@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
 <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
 <PH0PR03MB63514C57CA17984F0B6FEEC8F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
 <adfd2c4d-6d42-4aeb-9eff-6a059550ec80@roeck-us.net>
In-Reply-To: <adfd2c4d-6d42-4aeb-9eff-6a059550ec80@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|DSVPR03MB989637:EE_
x-ms-office365-filtering-correlation-id: 779d48fb-b665-4d74-2d48-08ded7e4a3ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|38070700021|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 KesUkSXJ3rzKynMkAEizJQpDvWeahdcVy539f7sxUiTp30jLVrZ4TPAVS/TZCZO9hyI9B6gbef923UvZ81pXA8N0ZXGIujo+kIHlwBlXUIr1lsPvfLBrOjDlROPeWpAlPP2StdaVVpN73FLYeVAmbDAOOuAxT8HRi1CGI7qoyzhjalukgGiflebd+lPeMImWfCzgCcSd2lo253AYH38l0tcfKu1CV8neYZV6mwbvZ5LPwpTkuTrpr8KSrqJN5bglX/83Jx4hoXtOx8ig1UVrDGqhP4F49WCBSIfZMEWO3dmpQLFREc/D3kWhVCvhLYiE9gWvmMCAKnmG9GXecv91fhEH192A21wq0roN5jEBmHhN5UqzO0JrcQgimGY94GdY3AB58cRAAvSmd56tBaQ8di3lXYKSwwtWxAkv2pQbsvwJXj8jrLnZndNHRyw+TT8xO1GxOOdVEJHluIvZWsEjMLTLtt8K/Nt7jwhHC665m9/NEHE6QlQ+xg1jakKrotVWJLsQdeQ3OIafL41AHeENSDZy3Z+pNnVrKXF073N7fXZ114Lndf6224gMHTeeR2HrltUlM7qRczRxiqtbT3+AvWyfMqimsK0a9/hFznLHh6j2fpmHV9AgSP1lfVqyT/SYEBWFn3iGLMpq4Ae2Py48rMPC7zjq4/EXca8r1VArxHIuarwBMaG4xyqu4lqHCdc0BxiDR65dNy8Hfx9ASDvm/IfAtLPk/5icJIKz7YKBLks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(38070700021)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FL0TQwe6c8vZnjhItzz0UU0ORhAd9GlEI6UN2j4vXYRDeTqxjzvkpvPlG/rW?=
 =?us-ascii?Q?3hdXRMwwl7erLY+dWGFBF5QGZdqPWRsQ/KDgQ4zB2HJpI3LSxMQRZKRsKRZB?=
 =?us-ascii?Q?Lp5/vJlpH8ZSkMpL5z4q21gPIsFD0lEXKGnUuvC70plVlKpOj8P8bkoMz416?=
 =?us-ascii?Q?FpmCecVgsVhv3SX1UnOM1AhLpgShJh0GS6qduVj3j6/k8fim0fItPNUYrz2Z?=
 =?us-ascii?Q?ucA3JNod62wSGsz8TBSw58vz3a9AZvYqmox+yUPJ3UmxkIhR9pZ4nj7Sr7kK?=
 =?us-ascii?Q?YuI41BzAhkvIEjGKIKOnAVBB5ZZtiPpo/qVkCB+btr8tXBTHY4458/uI9Npi?=
 =?us-ascii?Q?Nr5lhd3bkteMcrjSffVQgfCjzKtLWchA0E4i7xaOEbt2aZzBVvspHGs76NBG?=
 =?us-ascii?Q?5XDvvr+El/eMLfvM2Ct1ozXMdynPXNJpVX+jfWBzQSWEFhQN8FHqpLB2cpcL?=
 =?us-ascii?Q?r0fJRusxNZZn4WekhzGarSuV9jfQiN2GXb+BdxI3YtT05LFri/OPeM/jyp4n?=
 =?us-ascii?Q?LmP0qsgfiry9sg1cyX3tnC0FN1zJlsU+K7Yde0mPF2o/3bdtU3WR/s3cx8Lt?=
 =?us-ascii?Q?jnu0/yDmxifUEbddY/w+Y1j9kqk8TA2oBtGV6xFh/7i79c2Z3+RQtqlFco5L?=
 =?us-ascii?Q?Len5kgo1eVsjBnucILtgHSgKFbzfWoxVXXeuRFR0A3Wh4TBnvj+RVif2//CF?=
 =?us-ascii?Q?Ro2DHd/GEv0SgO3TEurX5HnrWG0re83wLrX/iv4ZVlJxHny1851odszFFlw8?=
 =?us-ascii?Q?dPGlFgYQq/Gs02X9PiBEPbKU9jDFcX13MGtegz/vHlpvT9VhwK1z3MQoqsn9?=
 =?us-ascii?Q?YOuJ4bzH1a+yNWz28fzLeyzH+QFc4CZ0tAvLtfvy7kyYuLGr2hvEx5e/1QFF?=
 =?us-ascii?Q?+850AEo7B4ljAe7H5yVw4nxXFJNbYV1m/uj+n+cpI/YXdxUdAKb4HkP8Iluw?=
 =?us-ascii?Q?HXIhu5yXCYmPGZ+mT/VAut/w+wIjgeVJh4HDZk+hOV18sSSl/UIMvXi3oZPA?=
 =?us-ascii?Q?suMUQC2v015MWdhirXcFWCeZlWprF8CmCHGZzSK7CGb7ln3/7N9zufVHcSyb?=
 =?us-ascii?Q?ZLDA8Vm/2MIywocgbW7B39745134GQJzc/21auouS+GCPWBsuYV0K3mxOH1I?=
 =?us-ascii?Q?6OCAOxewF9JnZ35ykVDhtMUYKSlSYnjSN08f7QrimPJfKa+sV2TJN+zC2b8O?=
 =?us-ascii?Q?PpU2Rz9HMaw3BEUL6klIsEBSKMhMe5A67+Bg9iKMoZAYQciH0LYF5KX3UIvn?=
 =?us-ascii?Q?1tSs2X12FHg6HNSmwsq/UqV80MvJdyBBz4/AkzMRHGZcetwmbtvUESeuJ5/1?=
 =?us-ascii?Q?d3znGJwnS/VYP89nWcwinTtuefFOgqVmAfohKz4Eloel8GELjQJv8j0IYyB8?=
 =?us-ascii?Q?u3mTyOpTEF3NjhNV83rt2jNUr0WTubZ7B4TfTucvpFalxVqIIDLPCSCzEH6t?=
 =?us-ascii?Q?m29sgNzCLSK1vgouu/PWd03tw+GiuKncMIAEBOBkgAbh7h2iYKc3NRKzG0zS?=
 =?us-ascii?Q?D5g4YeS55c9qltCtZ1ckyMOnSppDD2le51ZNQ4VS1oyWbT7aeaAaHRYzg3Y4?=
 =?us-ascii?Q?Scyhc1CW38w7ug6SOKP4XtwouKRD/HIOlaAThHVkNtc4eErUcXX4hTEdteZz?=
 =?us-ascii?Q?o60BgreArbQTJZcdZAV1dyw5LVL5vTkxL3qusiHUNvJCT12O/FuR+6ltP0J8?=
 =?us-ascii?Q?CGtW8PqxhWLkBdRnF8eMR5DXThOi+XSPitBX9Cb5aU/tg32lQJdL9cp2ToW/?=
 =?us-ascii?Q?b4mD2HWwrwP0gH2JKsylAhB/TPCB/xo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	SpGsDwCFlRTOgxoaHaY9JhrSefsoB8YAPLxw0Kby01jXKlbz8CtQN4ty4PveaPDoEw9NLh8LZovIe43T3pjL5vMDXDCj/RAPUuwCpej2Knef9FQRpw7tFfYJoczGY+QJ9/g4QV6k3liLUnMJ6kb7/a78+PCYw23iZxAW94rXe8TvbIbZBMwqpleV8Io4VJGYk1XmMzUh9gGex8z7T/PufxJYH/+Wy4LThn8sFWHf+OpuYmrhm8XOwnJy3NvKrt0g70Wg2aSOys+VYOfoRwYotcCu1WNdn+zxmSr3kGB0eJTlS3teAO2FqXH+Daer2UR18NO0ob64XEpphFANiJMxPQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779d48fb-b665-4d74-2d48-08ded7e4a3ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 02:50:13.3086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiRoAJstVe8FfuX4npnQV2yfoeTcNgO+wFr7PVDBEp7CL7gTIoq0S6efCD05JJZOmdP97T7oCGhJ6h70GP59r+1VsoQH2YMxqPrnH54WNWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989637
X-Proofpoint-GUID: I7tpu8zx-WtnAUFx9JPa4Z2VhxvH2GgF
X-Authority-Analysis: v=2.4 cv=W4MIkxWk c=1 sm=1 tr=0 ts=6a45d1e7 cx=c_pps
 a=3tfckwpITFtzIurveUQz+Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ZQxX5BWu6Z8IJBb2zLX7:22 a=QbS9kZC1mrf120kMGuMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: I7tpu8zx-WtnAUFx9JPa4Z2VhxvH2GgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAyNiBTYWx0ZWRfX0A8gjMaI2YOG
 1oU+Vtd8xU6vVS5qsU8onbmN5QhKy4tKs1L1vMlfnuSJCGSqRju3LOZJu7e7J07+a4CKgPDMOBt
 Jqg1MtdAJKVoyoMm7DeAC+2PUw+Gk2fEKdx20GtfEmkpXRL1NKh6i8SLBnrirdb8hyqFJjCA7kW
 2AbouyDDkXBoadKdOdqlLJywAe26mIMyGrWM+BXYZcNqrdDfPGIK0Jv8STtYFPGn1aaNQ8xxJ5O
 KJa6QxBtU4aSrvf5BPk+x4mDyC2PUSZAH+13GcbQO0/x1dJ50tG834EUMUygs0HQh/kUMzrXOoA
 /9dvH1FGYXsNJlvoRVOJuxOxC9+qxEJRWD0wdlXzBlB88IF227/Ky7oF9tY0Sx4c+qGKL+UUQ+m
 517z2++OMiytc1xzcgs9CY3fuyq8p1S1weouLF1+f7OIpUQUfVLHQ9Eec1/jjDCysKg1BlewJMs
 y6fWQri4x5PVtf41Hsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAyNiBTYWx0ZWRfXyleaytUmQ8zw
 cwg0K+N4R+G/9capN6HPdGJB3C7gY5cAS28KCsBqvbTejpKmaSsa3XraomAFBYs4nYdycuxmyza
 ilkKRgNCckNhfnXY1hN23TR8pHtEXmFagi89bRpAxzsQzmrz9iob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020026


> >>>
> >>>    static const struct of_device_id max20830_of_match[] =3D {
> >>> -	{ .compatible =3D "adi,max20830" },
> >>> +	{ .compatible =3D "adi,max20830", .data =3D &max20830_chip },
> >>> +	{ .compatible =3D "adi,max20830c", .data =3D &max20830c_chip },
> >>> +	{ .compatible =3D "adi,max20840c", .data =3D &max20840c_chip },
> >>
> >> "adi,max20830" is a fallback for the other two chips, but that is not
> >> how the code is implemented.
> >>
> >
> > I may be inclined to just not use fallback as it seems to be more
> > complicated and a bit unnecessary. There's also other devices that may
> > be added on top of this so it lessens the complexity. Will edit the bin=
dings
> regarding this.
> >
>=20
> You are missing the point. The fallback is perfectly valid. Technically t=
he driver
> does not even need to support adi,max20830c and adi,max20840c.
> That is only used to validate that the chip is supported. That does not n=
eed a
> separate devicetree entry.
>=20

Checking if I understand this. I need to add a check that if DT chip->id =
=3D max20830,
and if the HW returns string of either nmax20830c or max20840c, device stil=
l probes

if ((buf =3D=3D "max20830c" || buf  =3D=3D "max20840c) && chip->id !=3D "ma=
x20830""
        // then it's an error...
}



and

"That does not need a separate devicetree entry."

does this mean I shouldn't add to the bindings and max20830_id[]/max20830_o=
f_match[]
entries, and keep it as is that it only takes max20830?=20

To add support for the 830c and 840c variants, the code discussed above is =
enough?

