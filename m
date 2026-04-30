Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49261273D77;
	Fri,  1 May 2026 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777596146; cv=fail; b=iMTeDgV5x/CcxtPO2RHWbInM7588UKWsTfVCIHq2jM7bKoci/0+IHZZfQ5B5dcyGrt7AkPf3xeo+aXTGfL6AKelOzRHs4+KOvUMAipS3tNdYTC0qZMEr+pW36vbNMuZvH9aQU+lzeELb5DXo74BeOhDg7gBWDkOFXi9tzfsTK9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777596146; c=relaxed/simple;
	bh=3YsqHTTA7V8bfqNtSaJypWmxTqXPERN8JMSIEzzMau8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a1lYcqjOgzYDmpcgzEgYnsrIb9MJhk7PmOU/bqvHg3TAJZbxUEjm7rJ14oEsYaNC/VC3S+PN8PueZPtzAc/NoaXYudlrtdcoZVIyRfsfnanIjc0UJXCdvFEeKxCbUwJrtpcXCZG+vzlquglNsglYXgwKpgtIivkxdnOUjUoUuv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=E36bdpYY; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="E36bdpYY"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ULwaHx427146;
	Thu, 30 Apr 2026 19:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Vsq7/
	zShIO4LjXBl2a6QW5cl4yW/G1+IQeCfwAKfap8=; b=E36bdpYYCVP993IABQB4E
	WQX/bh5tee2jA/GL3eJKn3otSQOiQICKcvT4iFIl4NGSDFVqIfVF0gKFCllpmT81
	/D/2GO6w2ylUYYeuphwa9bxDoiPEl46OKvkMaGg4D4nt+LKRLd7XfS3KBPUm+YM+
	/6ldovdHdobxtzZRupA09ZJFH0JZ6S91f9zIqQy8zhK1qfuE/Q8eFXHF8uJ82z62
	ZbS+XJ/TYprNOLOJP+l0nfMe2z2pCczW0t4kdgugZNlGcHELkH2p32mgKlIOQRs0
	HEbIzJY9G1nd4+fYK34fvfkyr7DECTE7+oWW5kDu6sEqZ09QVi1HWuWx12WEFD59
	A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4du62rry80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 19:59:24 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnJOCJPv3ntjoSgOOqDtW4a7uy6N8wN6maW6C/Du2CTJB84KEOVJ1kkfzzoM8ts1RfCpGi8vyi2xV7TbebnegB9tI5zytoRyymK1sYw5ch1ULicUcQB+r7VoBeAeB2IADneet7mU4pTZud75wfKTqv11ZsIsEBumt6xBz542JRIwLE+jzuPA+e+RfdYk+eOfDjHLK46w9w5G7r4VJ6QfP4SNNMcriHUftq3tyCeEojukAkVdaH2/E8+/h70OISKydr7kh0pQjmZFRLWT3M2u/ueWFdbxobgnZ4+tKqfhlqpua3mk8bJ8tKbcEfBRisdKvsq7mZCOaJL/7ivOqOAB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vsq7/zShIO4LjXBl2a6QW5cl4yW/G1+IQeCfwAKfap8=;
 b=quVFCko8D6r8S/ZzPCHdA7AsUv+drwdgEGXiY9Ztv+5W62+ynYpM3+MxXn6ocpxFLx1P1dOomduH7Bzt5dukeXdRU25yOxlxGgf3jfV42sbW/SBbvKJCBJYVz8O9x1LS9zFfkr2W0xVMhVRd3dukrtrfLEGKGKX+SZCKj+K85QySp2nopJklS8Lero7U2e2lPenNK+5VjX/d4V9Vyz4R6tGuf2lCxu10gCBBdWlhW6xdWtE+uovpCPy2yvWLTD4uRbVB508GoBiIOgceR7xHidc4/+RudIy5mnXhPQ2x6Jp424v7HbaWziKkK04UB0gAnd4O0NTywHJwi8ulTRLBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SA1PR03MB6340.namprd03.prod.outlook.com (2603:10b6:806:1b7::21)
 by LVXPR03MB989182.namprd03.prod.outlook.com (2603:10b6:408:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 23:59:22 +0000
Received: from SA1PR03MB6340.namprd03.prod.outlook.com
 ([fe80::412a:c96d:aaf:4598]) by SA1PR03MB6340.namprd03.prod.outlook.com
 ([fe80::412a:c96d:aaf:4598%6]) with mapi id 15.20.9870.022; Thu, 30 Apr 2026
 23:59:22 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
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
Subject: RE: [PATCH v3 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Topic: [PATCH v3 2/2] hwmon: (pmbus/max20830) add driver for max20830
Thread-Index: AQHczkQrngoXKJQTEUiTo/893hYTRrX3+HuAgABkflA=
Date: Thu, 30 Apr 2026 23:59:22 +0000
Message-ID:
 <SA1PR03MB6340B2050A6B46328993E418F1352@SA1PR03MB6340.namprd03.prod.outlook.com>
References: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
 <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>
 <63e770a5-1740-4144-9c5b-929fff8413b1@roeck-us.net>
In-Reply-To: <63e770a5-1740-4144-9c5b-929fff8413b1@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR03MB6340:EE_|LVXPR03MB989182:EE_
x-ms-office365-filtering-correlation-id: a47af0f4-cbe8-4cbf-734d-08dea7148037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 P0OQRbx0f1oypXM9IU8H7xISUzepddbVha70vT+dZBGh71EdricNYtkSJE33kiU9jmgf0JjrZUkQKDPFVgCL6D05w+A6BMSB/z77jdhLq7f8UYAj/iipeLAvdxwXm/41BI9l5kuXpfqUyb4AHUqjJieWNpC1j4nH3kCLl6sYwPv0uAb4h0EMdW54MnauQ1pJpv5djshLVD4glvkZFyEv2bbeO5DJNbnilnao8qGVkZ3iUh7KwURhpGTqyWMtlIOfV4Ks90j3gq8VmiW+dSxNB5Kp6E4Rc+hMfBNfHfNQvnpNMjO6zyCpclm7Az5rEijpuUEsTh+2kkn4vrdCZyyj/uCuWrfiha4Qa6TnC463TJhFPo1QWjH2NKM3tFNLG3jFnXDokduOehULOI6mKLAiD2t32yTqF1zq9MK/QSB5gggYbJxDvluEd/ygGSKzaF7Oh8/t3dUKHerzVgyTXWqT9hX8OQE0tybxA30ufV/TyoYMRIDjQJyuwIB1Ka6PfdtBxs6Uv+CPRtYXG0/zmdsKADu5nIa7YJZhQXYKfxVAW7v/jLNGd6dbMfOyxdNh07CdJwHbRz6/eiNsRZP+I9WpTUNA0SwLf2+X3wqmjPVDGytU0m1SPVjfFP9T61t+DrVOg5gWM/6TL3+TZ7c+ecICbFlJyNCbJ+Y7k/cxgG6RlZz6YhnyMoIWdhyHcmoqEVOKqspaNrZ9iMBbe0S29B8JmCoszpU8S6RkKZZUsTGboeoC1cz4Y5DEgBL+X/jsLnXG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR03MB6340.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yQGKp4xcWS2Hll0+X4zQHWHWdnVXqgvPIghfDeHExDFipxsdurtiV58KTVsn?=
 =?us-ascii?Q?RzITJPV9Xn2Yhllo6NgRHIv94WivhnTE+CYU3XU5t4Dy7lNQwLjKqWk7bscZ?=
 =?us-ascii?Q?q8pA7UHlJIe7Fh3LsvNHtbO95mMndoDPwZVU7/4hxij7pS7ju2iaSsfxqvo7?=
 =?us-ascii?Q?u9SL9CXBQIZeqwlmECirjXqHU0T9A+2i+dJqcxZIkCCVvgQYe6HclvKMJhrb?=
 =?us-ascii?Q?ITOZzmfbqBVXYgDCnkVctyIEybNPknwQOH25RFztXSXNjmZYwcFcXriw0JaH?=
 =?us-ascii?Q?1ubdhfY5gk8yXrxDGUf8lcIkejLrffhUtOoqM4Cjy3BHPArCEEUx2/XoD0jH?=
 =?us-ascii?Q?pf+2/3fVD1UdQnhRdNEZk4vxmYcOr3Ia7QXlHOPt2Y3YncGYJJOtVtEAjjws?=
 =?us-ascii?Q?oSn+lW3Jp3No+WObPZ2y3UgnuE7dSF7zWLk9M075eiVuV1xjAk7SrJzQPUS0?=
 =?us-ascii?Q?8nVG8Kp+0Z6Pa52gDL1yMwIqkeQZsVYsmZYwlqpjKqY0kBHu9IpC3R84uiOG?=
 =?us-ascii?Q?IzHu5f0ZrUVEHYkhcWRS2zwRW7r4gnAiJnJbBbn0ueKyVRoR7sdhFMWyOq6r?=
 =?us-ascii?Q?d1SzyJZ15+K2A33yi32XAxJV4idq+34fz6k5CO93SFDuyRnek/xmswUhkeFe?=
 =?us-ascii?Q?Wg/KE9qleBEiTpn7Qn6/BYYA3JWW65mcjEWlXzfEgkk/CVvkshuNafOI2KOE?=
 =?us-ascii?Q?q6OjHvk4+hN7HeLbCrZdS0WoNwfARx2PdQ4Ozv5QRHfPJcKHgZOR5S9CSSVS?=
 =?us-ascii?Q?W3crSCx3/GWUm/kZdP3k17OjkI1cLRoXVhHPNJ+TwAFu59DFTaFeDBzQvt8O?=
 =?us-ascii?Q?Yy4Lfl8Y6lHjy+B32siVysOLQobsxuAlWI4aTzdp8DMIosjjsqYi3syoVRyk?=
 =?us-ascii?Q?SIAiPQZEbM4n9keWGFUUs53fnXQ2kp5ZggJKPH3DuDqXJB4gdbZLp2Ot2bSd?=
 =?us-ascii?Q?O5uNF+6Ob4+aIhSO5wK9wpo0W80Fs+NqXSu+iSR/dFKM8HIs52yp0SRLPddV?=
 =?us-ascii?Q?u19O+y1XDtTHTaY7ABDj5xJ5qcDlTAzDu43o2C1/poXRSdP9oiY2+Bh47Y5j?=
 =?us-ascii?Q?/d485h6CQ8/5qjne8ZlrNuQQ8NjfJSZmuEPbnfwPUMWp2CjTNJzO6J/8aptS?=
 =?us-ascii?Q?D/s95IVZe0u7yo1NE+9yrzZVKTBNcUb+DQpx3n9GrOyI3wTUGVqQhZbbs2TL?=
 =?us-ascii?Q?1gZoDpcTLzzQ6+kAcdC4eIBiKthNEaA0TcrXrpJfAZNlHTQQNwlde+SHiLTW?=
 =?us-ascii?Q?wA5ye/eWUafS7actRjdpDzcmWm4LqJ8m8/rZyEjmEuVVLooDgJSx6WghJ+VB?=
 =?us-ascii?Q?1xx7Rhn6p/aR8QYpqpSi3LZKywGuXGfySnkArZJ8s/xzVFAVVn/uzFUVUq/o?=
 =?us-ascii?Q?dzZ/+Iyu64iOmWEE+QUkkkPWV6g4s2bLKHiPwAod8/Bwn0JtvAbnMQUJV0c/?=
 =?us-ascii?Q?ADjjXBjJAUfIV91l3SbwQhCrAFK9BsuLTh1cIAFthPstYI+JOZGiwR9Kqu2F?=
 =?us-ascii?Q?wENIJmiaeArw+4Uyjc3z0xCjr2qj7bHXVqJ/9TwVMUu0ykJZcDmkloriyfZ/?=
 =?us-ascii?Q?Xhue945k91JjT89s5v0qnf6LDAmyMaEHzhZHMRMwGvWzm4CSrWa81ar0G/PE?=
 =?us-ascii?Q?1ikrDvp281DkN6obuAnY9cHCh0AvH7/qQne+xv5EDH7vL2HvizPuG5ZXlqAA?=
 =?us-ascii?Q?0KfrkUvX3l4vtthhD0fTDUujU28nJAdTDl2Y0MkfkRkAOXXOnVBlilFtamtx?=
 =?us-ascii?Q?SEWTUSuBA5uSr250fj0PtcR3MybJHdA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	R8raDVTXnx9EXGe0ZS0qhbzHzVKGUVOrzsEV4lm4wyFR+HJzClrMz/WD8CbwCWPjK5Y9qzmBV0C9yawVIbA8S1E5S9ekMW+mRasyLm4phXv94R/mBi9oCYZmOSu04yPXw0vOMDgpIP6R2Iz8ZvuYN2NV02OO4RlqY1rd6PyQx3P2wKq9bCHBcMMSHdpwqqdPNY+EeldwNs7bhADBIK69nuyG7LhJ3lj9Ta2TmfiPPZLTHmd2URcA1At06NXMvKdd1toHy+MsbY6YvX7nAarjhTgA8+OZ6BUu8OfRidsJqRxwVCyJ2urC9xsgoFWx+Gqjf4QH5/bx/a8fYOrMvGEyZQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR03MB6340.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47af0f4-cbe8-4cbf-734d-08dea7148037
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 23:59:22.5061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzwJjhNlMnJ0kj09H1OOQlRvcOiM3baRBEK5q1VKeMw9fNv2Mm/zQLijY09G4lvKGCT9VaA2uXYH2XkrasL31Rk/8bweoeR3XR27X8NAils=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR03MB989182
X-Authority-Analysis: v=2.4 cv=DdMnbPtW c=1 sm=1 tr=0 ts=69f3ecdc cx=c_pps
 a=EZwmcie8zcfNvCQIxZ7BwQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=gAnH3GRIAAAA:8 a=BuL-BVqbdESEmYG-rUAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: YmRRr_CtiiAzwDuinmHesSVrGizb0Yjw
X-Proofpoint-ORIG-GUID: YmRRr_CtiiAzwDuinmHesSVrGizb0Yjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDI0NyBTYWx0ZWRfX5C469I9Sm8pV
 Ecghu9UZAsm6BjL3ICxePCBmciQeaP4rnU2ALeNILkwkmqDrV9XLFqcILEIG/r1u2C06c81OM3x
 ccCXJg1j1/LPUtllxcFv+RndpcSgqMve9eMIZPbbjPyWhHgcbqqo1kKMnr0zGizcQOEWNG7rMZN
 +zDB5RVciGGCeKvrQiSVNr7cMJHMkTmoOGmP5mJrwtaXVDZ0nxPy8dqRUdQpR5bUBPnTuw2Q286
 VkflyGwHdcp57Q+eg08QOVGtnEqoY9lFzfpPJTChKV+6q1A4xorfV9CvB1XP2QbCUqFiXRD9Tc5
 TlrK+UBbcVGE69SfHeseJBdsKyHPhLjzs28zydfa5Pv5ZrpGuw8wGmQbfiRpgI9B9tm9gZtE47T
 uZxeLdHuu5LPa+Co/W9JtFw4HT19X5Bm5VoEQZTJDD+dn59ZcpawVqIBpribzadiSsp5aN1Ddf+
 12fNVRyZFtNdU+0wmXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300247

>=20
> On Fri, Apr 17, 2026 at 04:27:14PM +0800, Alexis Czezar Torreno wrote:
> > Add support for MAX20830 step-down DC-DC switching regulator with
> > PMBus interface. It allows monitoring of input/output voltage, output
> > current and temperature through the PMBus serial interface.
> >
> > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > ---
> ...
> > +
> > +	/*
> > +	 * Use i2c_smbus_read_i2c_block_data() instead of
> > +	 * i2c_smbus_read_block_data() to support I2C controllers
> > +	 * which do not support SMBus block reads.
> > +	 */
> > +	ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> > +					    I2C_SMBUS_BLOCK_MAX, buf);
> > +	if (ret < 0)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "Failed to read IC_DEVICE_ID\n");
> > +
> > +	/* First byte is the block length (including itself). */
> > +	len =3D buf[0];
> > +	if (len !=3D 9 || ret < len)
> > +		return dev_err_probe(&client->dev, -ENODEV,
> > +				     "IC_DEVICE_ID length mismatch: reported
> %u, read %d\n",
> > +				     len, ret);
> > +
> > +	/* Data is at buf[1..8], so null terminator goes at buf[9]. */
>=20
> I ended up checking the kernel code. As it turns out,
> i2c_smbus_read_i2c_block_data does _not_ return the length in byte 0.
> It returns the first byte of the actual data, and the length as return va=
lue. See
> i2c_smbus_read_i2c_block_data() in drivers/i2c/i2c-core-smbus.c.
>=20
> So this can not work as written. Something like
>=20
>         if (i2c_check_functionality(client->adapter,
> I2C_FUNC_SMBUS_BLOCK_DATA))
>                 ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE=
_ID,
> data_buf);
>         else
>                 ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DE=
VICE_ID,
> 						    I2C_SMBUS_BLOCK_MAX,
> buf);
>=20
> should do, assuming that support for I2C_FUNC_SMBUS_BLOCK_DATA
> and/or I2C_FUNC_SMBUS_READ_I2C_BLOCK was checked before.
>=20

Oh, ok will check this difference out. Thanks
