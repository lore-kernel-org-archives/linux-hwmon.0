Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B19F1BF33;
	Mon, 20 Jul 2026 03:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518122; cv=fail; b=iBOGYAv+ne5aWoEHSdvBogQWxdRXRhPRjCQ9AB3gz1P3PVw7tFKCH+AXqbBaxZwWuSyEZdmIic8q6j5EL/ZORXvE79ArWmBYva5YlE3pGqy9MGvYef6QN8o+2c9BTuuIL1TCPRCQDfmgxs1onSC9w2R1iyRzSrhecQcvEy4/4EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518122; c=relaxed/simple;
	bh=ZBe1Oq4m8I28pu8mkqnINnFpy1/X9DbApNykPzk2zQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AQaUH2QnFfRSfnt2M5Y53UQzj+qk/NTYJOO1zAQ5McCma2vQB6unjqXZAqTcOUxn5wBwJsres6evEM6p5iJN/TcO59xWTu2S/n1p/GkWLdti1OyknIG1ZFlI6GBTgU086n0mzkDPIP2WwwQlydMIGtm12i+u6HyfXlwgHzXfE8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wdGxRFE2; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wdGxRFE2"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtG3w453475;
	Sun, 19 Jul 2026 23:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZBe1O
	q4m8I28pu8mkqnINnFpy1/X9DbApNykPzk2zQs=; b=wdGxRFE2RxL/pm2RAxlSE
	LkwQKwJdQgzPCGuImP7U+HeieeOdIYzWNuUwCrnsPJpLf6xzu73BpbcXZxE9Asjc
	EUAwoGXVq/775YvYTtjp443545GcC10Gxzz8FHBmtv5LbyfeJWtLHSuI1BVRE+Lg
	umD1CT/bDo6tS492VwbBHsM3efotIJ1KykXapekpe0q7B+JfEEhfyXOQZd+OcEBI
	vIkuSu0YE2BXwjMXB3kgMyMnYp3fG8+elCsrIQxtjTJkqgqTan+Hl3QWXEIYPeH3
	LiCyJxeHVjndpm2l6rj+ZX6f2LxNfans0QM4Icsd1shLYZufAI7wO6OzkVNnhp8a
	g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fgttga6bb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:28:39 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH/OCAkz7lKts5peAW5goa1Jl18TW6l4PddvK7puxd9RDVfiGyH8ORU+botPdMbfZoTmezchSiFpNdU904BU4K1R71OOsnQq/OTEu2WPB64HkkVvyWMAWZ7pus92BMZz1qWmsZEkqwNleBQd1WErUzaB7MOfbobBTJ3Mw/wKPFgy4aW1u91+EDbnfp/IJh1IqYeMhH89vD/juqtidov23kT6gmwbqNYrYlGFPYGdKNgF2+k0n52k3o9R/O2AwxL5OcXItPxQOzXw98Vb4Xs4UiXsqLyrgaFtuotmvvcrWAUzLyENdWI80lOdSK2RTP0HZ1ddXzgL+CV0ZRtmDTaJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBe1Oq4m8I28pu8mkqnINnFpy1/X9DbApNykPzk2zQs=;
 b=hXG9kDqOpEGRHP98kLxrBdT894QXUcX5uJeistNu1/HFG/+nRkBkX+WJ56rbV00V/fZyS4UpVk+wJOoK8D1wXOivxVOm/LSvCTtBMXEvccUKHzbdtqaJJQH7/3WsSi7iOcmhEk0TRd0pkj+bz8Ol3SPvHO3psF31dsDydreHzoBrt5zL4+xTjB7uRuGZ4aUAjgatQdgADlHmkwzp9q0PndZjoKJVfNu8mvKIZJKEmtvE7Z8xxQggQUTwYOAhCu+LjAuMruypgXnLf5MUXjeDs70bGh0G90FOxghb5ugxoc2xpHt+AtUPqwXKe4/WIs3KEZSHpXpTfEdEeaSGyC15ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by CY1PR03MB8124.namprd03.prod.outlook.com (2603:10b6:930:105::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 20 Jul
 2026 03:28:36 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 03:28:36 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Thread-Topic: [PATCH v3 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Thread-Index: AQHdF/X8Z2VmjJDBfE+uXgH6InSLHLZ1vfaAgAABCrA=
Date: Mon, 20 Jul 2026 03:28:36 +0000
Message-ID:
 <PH0PR03MB6351355291337F1598475B7DF1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-1-9d06d27d6da3@analog.com>
 <20260720032207.E5A9A1F000E9@smtp.kernel.org>
In-Reply-To: <20260720032207.E5A9A1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|CY1PR03MB8124:EE_
x-ms-office365-filtering-correlation-id: a9691257-a81b-4e24-a732-08dee60efc00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 mIXetd/yxtLpA8yk8Spcj77pKj4EkyqSJSUpPz33pP43s7xUNGWwPnjTCIiI1XY+qL0XLq3XriTsn8P1TO+NoT33vtz0e1C8Cgzd4kiMbPwggQa7B4V+/EHXa/EWZcnecg10Yr+4hYKfBaq0ZZEwjbpadf1ihJgtK4LcVyQV8bLnZkWrUG0nKQZIRZIn1q0YTFACiRnk2oGVbJUKVxbvp82swLHP/DpOQBgqsGHW2JK3LJ9v+KlAppIRbg8ElSuaRiCCyb0bb/YMXGe/Vc0dQcvI3p7YGZZRstbhHHB/KNBXvDA14Y3lHHmb9MMkf5qQ67pQy/eKA8WBdgceIZv25RZKk7FHd4znrQpmbzgQCiKVeKRQc3bQWQcDPvfJqVIqTMpd0quDQu5a7p0tR78M/qq31AeDxtfuEpF6+Uweauk0rCY2juL6MxSq05jsJQjRyYx/3ZSLG8+9Fyogmv1ZpjaOf+AnB2zyZSoMgqskPKeZeY6jl3CvKivRbaeZAAZQoDuyYl3/QC+P7Wu9wPz2jBkVL8msisrkKw+1F65BpBPQHS5tQhXkf9BBPfyV9JXfLPyu3TqOOeqlAdULjdJU++QzM4zx5HJP48Ga+sOJDShAU9Rf6cSGiACwwwB4wzX64m2lEsWQwLCpvWmRDi8XjdDJU4iCSUhBT1PLoXeaSyXaD0+Vh3zrJFS4i7RHRvWmw/2w9flmA66hZAFwk5s2Qg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHk3L2FxUEtDL2FNeDNNMFNDRHI5bEQ4M2V6dTFDUWJBSkY5bCtmdkNsNDcv?=
 =?utf-8?B?eWF5NEIrQlo3ekM3NVFQVDY5cG5BV3pFMlV3NFY1ZlR4cktzck95UDRlVDZX?=
 =?utf-8?B?eDVXVE94MVBBaFZZdEV6N2xzOVZiQWZ4WUt2L1NESVJGTllEY1ZneEVjVE1L?=
 =?utf-8?B?bE53TCs3eWhCZzJRMUxrbUtKeEdmSWUvV1BtYTFuV3NISTdScC9oUlFra2Ur?=
 =?utf-8?B?RFlEZDRRSHVFVkdyc3Jyb2ZzM2JLQWxTbWpseUczcGdHNTJFU2NOZlhSNkxG?=
 =?utf-8?B?VERQbVRXYW9RL0lKaE4vQjVvQ2dYM3daNW56ekQ2QVZsYThVWXVNK3ppNXZH?=
 =?utf-8?B?QlBKZmxjaHlqVnE4R2ovaUFKVWFCTnVEMW1RQ3BUdTJ3NkduMG8xRWE4TUdE?=
 =?utf-8?B?c1ZKeHhWRlhIb0g3TGpJaHJ5ME1VcWc5NXJzaFc3MW4rd2xCb0tNRURGby84?=
 =?utf-8?B?dXRNZmI4UmZ6NW5uN3VzZnd6b2F2SUhva2JrQmZJMytKMlVxckhBVWtKZkM2?=
 =?utf-8?B?ZTJGNkxHeFdBeDZKTkUwNFdRY2hQWEd0blVOc01Bb1JrOCtWblM1YTBlaUxo?=
 =?utf-8?B?T0J2bERURm5aekMrSVNOMEM3MGoyM1lCQUMrY282TkhiTmJuMFgxK1cyR3VB?=
 =?utf-8?B?MGhEZ3FvYWN0dVdubGxtZWlOa0RFMFJldXJocks2RUNFbHJmU1VMbFBjSm1G?=
 =?utf-8?B?VWhoaUlyVk5FeU1aU3llVlFCZ2l6NXp3aWZhSXpubk1Ua1lLRStZYnpaMVVU?=
 =?utf-8?B?WE9HZERHWTU3WlYyOVUxbXNkYmR3a3dtQWlhSjNxUGlwazlNRkFVZkwxclhF?=
 =?utf-8?B?bldFcGQ0SkgrcTZvVmVQTWZOdjIxc1NyZmJUZlpqRGlBZEREeVVMM015MDJS?=
 =?utf-8?B?KzNBWHdtck10Z3A0cktTbWZPbStPUmphblplOWRYdk1sR1BBeUV6WThvMDlw?=
 =?utf-8?B?Tm44ZWQ1ZVppa2w5SUdMZEw5S1JsZWFENDdndW9EaU1YTnJiQXdMb2JWSlNa?=
 =?utf-8?B?eENFQWh1TVEvUkRPb2N5T2IyL0N6SkpLYW10RDdnVkJPaVgxWWRnWnp1NEM4?=
 =?utf-8?B?WVNyREE0VzZZTDdDODByWHprTk1pamRva0w0VVlmZVprRTYvNS84Tm41YTNS?=
 =?utf-8?B?bE92a1RCWEJDWTErbmtYM1p6NDV5SCtIRmZJLzNnZ0tFNEpvbnN3YjFsWVkv?=
 =?utf-8?B?M0dNa2IzWjVUM1NpRGFjRmVidlY4VU1pS3Zwb0xuS09mSW84dXRsSW52aHQz?=
 =?utf-8?B?cWNldlBlR0hvMEtzcUN4eW12VmRTTHpzeDNPMGI1dG5WaUFsS21OTG9NOHJB?=
 =?utf-8?B?V01BUmRhdGdLS2xjVno4YWxybjRGRG1EUUp1eWIxMUpxalFvaUEvR0pBdXN4?=
 =?utf-8?B?akNXY2Z4QkVUaGU4QmQvN2NGNUNybVRuNFA3UGg0Q0k3UmlLY2Q3QkFXSmk5?=
 =?utf-8?B?cnJKVS9qbm1wZlhDbS9sRDdyaTFzcjd5SmpuRThDZEJuMkxMMnE0ckFSRGJK?=
 =?utf-8?B?RzM0Wk1hNE9ySyttOStHU2VhUTU2NkNVSERJRGlDekFqcktvY08zNkdkTTFD?=
 =?utf-8?B?RGNpQ0ZmQWpDVGxwMGVuYlNveGNXcnZ6Q2JycXltRFFvQmFqdzd3RjVGRjI0?=
 =?utf-8?B?N3NrQ1dMTTBOdmNsKzZsMzBGTFg3RjdMMVczdVU2b3B0VmlKdWhNRTdaZVMy?=
 =?utf-8?B?cld1eVhPWk5mZGlJZDF2R3Zqajh3bTNHU3lxMVhVak85MHBMNHdhRFkxUnpy?=
 =?utf-8?B?eTI2dDhvNysxdEZITFBaY0d2ZUcxT2V2QVkzbS9yME16NUU0V3VoOUpsS01O?=
 =?utf-8?B?Mk9uek1rMHhhWEZaVnpVRkg1WkNtWWYyWE1NSG9pYXozckpXTHIxTUMvQmJE?=
 =?utf-8?B?Y1BjU2ZTUjFCZlQ4dkptWGpLbFlCcFdZN0c4cjl1SnRkblhJL2t0Y0FPaFRK?=
 =?utf-8?B?M2RJVmRFcjFVVWVBUmJyWGh5bklwcU16OEh6Z3N2ZDNNRlpmSDhET2YzWTE3?=
 =?utf-8?B?MVhWWEthblREVG0xMEZMU3BMZnBOZWZFL1dvdkI1bWF5MWZ6Y3VhN2xjb2p6?=
 =?utf-8?B?ZjJxcHNvMk9wa3k5U1dwMk1HdWQzcURSRUFjUVI2L3R0ZURmSGdLWFBQRFlx?=
 =?utf-8?B?UHVrR3lKYS8xS3dyN3RFOVdGQllEdGhMZTZxTll1MFM4ZE1FOE5ldnJ1ZXlp?=
 =?utf-8?B?bnR5UUkwMkZUOXU3eXlpVUthVHc2MTU5MG9JMnZDTFlId2pwYWh3UGNKNTMw?=
 =?utf-8?B?UHh3NE02MjlhNkN6c2FFUmZPamtTM1pveEQxTjFCWVNHcWQycXRBVDNyUjJN?=
 =?utf-8?B?WER0QlUwVkZkc0Q5S0dLdzN3cVFhNWdDZ2l0Qit6RmpzSDJ2Sm9VWm5zM1RN?=
 =?utf-8?Q?bGiZ6QWr/jw6bQGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	b/gcB+hBsZYaK5HyQaSiCFPposXhWwHlrma4Aa9iHb47WHCjxL75fPxqlrX41V+pq7cXRrNEF6ZboIdH4pB9tzXDCum5pdk7LzPFghwvhp1rJI63lVOl+52YWbDmShsDY8zvhVzVFCBnk7IqtSuQ8WgNu7+E/9c6Ro0K22Z1oH1SRtv77s7V1TJ8uN0rf9HMCI2KBf0DxeQIS3KiIB1cv5ByPfOOYvl/4kspgDMcvdJClMN8Mo/ySI4sdl/PhmYhDm06FZjF+bdFjsisc9oJIWzuJZHMUISZAAi5uoC6HZ9q0ubrcr4OdZmtLf/RO9qMEzC8MoGmVVhg1xJ6VbEiHA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9691257-a81b-4e24-a732-08dee60efc00
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 03:28:36.4738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fK7kQvMn1WmH3fMRu55ST+gs/rybquRMEOrvX3slUXv6PpkjXyy4ucVLIyaPygAUPZuXIjH2ceqL6FSN+4ybh2NwseB2e9dZTDerkWOMmMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8124
X-Proofpoint-ORIG-GUID: N7aNZc5Z4utmeDuNUpp8n0myRr-XWaG3
X-Authority-Analysis: v=2.4 cv=DagnbPtW c=1 sm=1 tr=0 ts=6a5d95e7 cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=F7p8smQl9KHZsajzSgoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX15+m0Ppqylsk
 oCoH/mvQgaWH88CFsULUH/IrDbkkTExvmfux0QljLxO+MM6lpHFuvrW97QPRoj5YmwBgl33Jz5e
 16dwbi+hlGXshkWzKQ+BRnjYkfnGllb2NIBU1L5oLsecDUfY+lxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX/L/bBPzYykfv
 8Fxz/rB2L4DVJclfan/th7m8VPRPUO1sfsNDaKcx8hYCKkNKCy1PkFmmIHGjXFsxbxkLIoOL1Gw
 9CqnWX4ySjvNOzeQxfSUNFpgQDgH73IfreoLIDGii8B3+m0JwZE/w7G3xheQUuqXjmIj9tPsAUD
 Yszo9kzMcauFVkku9mqNo1M7Hu7tO6YVB06VVYicNlnlkBL/guy/iiTfC/TtlINJTpXtFAXwSbN
 KFCTCNjHSe3BV8bqpuM/5zmhz2/hKy4Ks033aRkMwDCTijF0FDlabMsZDU/oXPOmFBQxNxtHBea
 Pr0rzxMlY8/kX1CMsqRfoIZYCECsn8NHA1nUauhrKkoLzLGyT+DdPPmnoxGEhHRht4E9bYIOF7a
 skBIP/nPdNrA95yCtGFhdnhDYBZD4CX3EYnvYSFcC5hWo9iHaAugG+PpC2zWdsEebEVQ9bYr6ml
 0Sfj5dd3Mds6bgqUZoQ==
X-Proofpoint-GUID: N7aNZc5Z4utmeDuNUpp8n0myRr-XWaG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200035

PiANCj4gPiBAQCAtNjEsNiArNzYsMTEgQEAgZXhhbXBsZXM6DQo+ID4gICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYWRpLG1heDIwODMwIjsNCj4gPiAgICAgICAgICAgICAgcmVnID0gPDB4MzA+
Ow0KPiA+ICAgICAgICAgICAgICB2ZGRoLXN1cHBseSA9IDwmdmRkaD47DQo+ID4gKyAgICAgICAg
ICAgIGF2ZGQtc3VwcGx5ID0gPCZhdmRkPjsNCj4gPiArICAgICAgICAgICAgbGRvaW4tc3VwcGx5
ID0gPCZsZG9pbj47DQo+ID4gKyAgICAgICAgICAgIHB3ci1nb29kLWdwaW9zID0gPCZncGlvIDIg
R1BJT19BQ1RJVkVfSElHSD47DQo+IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyB0aGUgbWlz
c2luZyAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+IGhlcmUgY2F1c2UgbWFrZQ0K
PiBkdF9iaW5kaW5nX2NoZWNrIHRvIGZhaWwgZHVlIHRvIHRoZSB1bmV4cGFuZGVkIEdQSU9fQUNU
SVZFX0hJR0ggbWFjcm8/DQo+IA0KDQpNaXNzZWQgc29tZXRoaW5nIHNvIGJhc2ljLi4uDQpBcG9s
b2dpZXMgZm9yIGV2ZW4gY2FycnlpbmcgdGhlIHJldmlldyB0YWcsIEkgc2hvdWxkbid0IGRvIHRo
YXQuDQo=
