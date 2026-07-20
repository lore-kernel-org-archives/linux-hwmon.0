Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8598265606;
	Mon, 20 Jul 2026 01:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784512718; cv=fail; b=cn32YlvNZdijVfB9YCSKsnvY4FoysjJ9FohCsmZ9IDwHFuMo8E6+rBnuVqnClE1NZIhUaTfCLckNh06DGYnbu1zUHDlgEdtPDr0lGOuNWtY+vnEwPwxDXssIh0GlCicyyQOOkNy76oB31uSxluO18/MScdNm1ljYllQw+/jzFXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784512718; c=relaxed/simple;
	bh=jpHFFhF1L87x+Gdb0YQ3v7nEav/IEt2cqdhCslmhndU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XM1eZHQzF5VP9QwIocOMaF2qebd9nv3Wj0hDq1jyZngP1o4IFWg2bPhQKplKxKcjZlsC8/WQ8pkIuk1hp8mCIVUnVK0iXDtyHPyOH30d1vFuktvX8f8QRWIkOt5DjmVSYCWrdqAcnZiteB2P2LUcs0jIpsrtlDdg/Td2FTtGEtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=SELK/NWl; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="SELK/NWl"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtFCH3049591;
	Sun, 19 Jul 2026 21:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=jpHFF
	hF1L87x+Gdb0YQ3v7nEav/IEt2cqdhCslmhndU=; b=SELK/NWlLoSOpP7iHkZSr
	JLxm3kaCreIdOcF+BUvXmoe+kSH5Rre7B+13r1KXQURGHIC4gmKfFA8XjTFbCcAz
	LQhBeNQGDrFG4ljZM7tcUXoSbdZW3/FyKh6APZycazfpUijDXQEPDhLJ//jvmy89
	O8+9xRoAKdaYbwbU6+o4fax+dc8thywEtelORb/Ttr2BeH1x7NtnsV+iNo/eNjAT
	oGb25qhrX8j7Q5WLT6VfwUJogT4zyAyWxvRlSXlT9okxmX9pKB1sXFHoOySF4But
	HJmH5EDMZDLTy3Ady/Lqf/FqS0UpM2BPVLvmTApOUYgMFUeKnvQ398Z6IJxtbH4n
	g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fguhfskfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 21:58:26 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtn5/cIQoZn8Kafb0ILOjXr25EqWI+jRlRE9CFomcb16xMX8IfzclmvZjedMwf0DAG+YpOROTy2ZZSjGODVl3+hXclW4M26q8sNTkjUQU0OtV3okA+RAQ1jmHy4d0LS6xdluE3agqYFHuRQ2PBX7XYqT9A40qw84mupZW6U6o4xYSykNcBmgJK9LmHE0a+LLK8yJnXh/sZ03op0mJUePlgeLO2WXo5/Hsk/FiY4W996rydEsaSKf+An/XD56nxpWc8mmZcqueVct8u5yyWATmhXGYlmbl0UqDxFHm7g2bHWCR4cfif9nze4cYO2fyo9CFlS6gwR/9mUkIsK8T+jy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpHFFhF1L87x+Gdb0YQ3v7nEav/IEt2cqdhCslmhndU=;
 b=b10I/v0sOcX3TS4e1Dfop0EwRf5ojHRde0tvKuESOrA+O8OD7KJpsmW74xV1SrBiv6QdyqyfXQw+uMRuH4v1crGs6j8IJv3As4KBPC6iQz9tybE0ssCgYLQFxx/xBQhMYM6+cb9Bj6zCihVSR8isHNRfTP72RX3tnIMxL6cpdAZCQX3x3VmboDWmS0OQhie2n6Zt7P+35YDA45bLFYIZ/LdosSzRha9mNgvTWZcKigJ7VPqhZzK1WdoywEl4UK6xJqlMXnaQHTlSyFu0sbS5az+vSp/Sgm/ogDv96vTqMzjTC5hYj6mlWyrkN1xQdue7nYJE9bTbaaRqZyuW3XIp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by LV8PR03MB7400.namprd03.prod.outlook.com (2603:10b6:408:193::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 01:58:22 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 01:58:22 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Topic: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Thread-Index: AQHdDOx2XA6AA0obaUOWsNbooF1ZrrZfwpSAgBXt9rA=
Date: Mon, 20 Jul 2026 01:58:22 +0000
Message-ID:
 <PH0PR03MB6351F16AE2D15684260D2930F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
 <20260706022155.C5B251F000E9@smtp.kernel.org>
In-Reply-To: <20260706022155.C5B251F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|LV8PR03MB7400:EE_
x-ms-office365-filtering-correlation-id: 91de2ebc-6968-4ef4-179c-08dee6026128
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|4133799003|3023799007;
x-microsoft-antispam-message-info:
 re4/JYS6xdROQOYg8ugkKquTSROo1jzA7UZ4BBR2RXcl/KhWn3tMdttIUJMblmXVTorx84WJX2vS9tqLuHTnOiE72gDF9dp9hiyvcQeL7XSwcdP2yyUERpNds8sOmGl6vQafsGst9cdyaXadF6FQz62y7smEW5v5vw+QLnTqDMH+ovCz9CZlpvjom+qW+UWdU73Ews4IZFYRVtgQdAIdgv/OfiawkrB6aarCwc5IW3+VK3vcSsKUH2Mlc/fSYjlaqLWp3sCAEOnQ1Gpa6Bm/lNi+tjQQKluwrIdTjDosvPB10igpGRYJkcoAw/1y99RSXK34tMXPwMnQ0gxMRTYCwOZL/i46IWjhUwQ2YaxatZm+1S4zlNS6RLxPsM/fMwOZ13GfTSfbI0MKEZNf+D8ecmI0B+D7eJXxFc1z4MDImkK/ra00NHmcS353pzbP+KpldRkQf0CB2cOjpC1ObAJnxvX++IqHpbi7T3Qi0oZFXVU3XgZCBQOBOVi1jV12GF8VDAy4p2BdkwgLZr2+QmCyC0/BwaiyEXgQuSBzvY9Zn+Rg9/RRIbUiOV/mLH8vY7MQDVIKDuErVzIBbXkUsgxx6HTzm7Ideh36oXc+qt+nXSR4MXl9+fXf0xAgoVTQaglwinRICBzwk+wUamRKJZiIAbM0Z0XWCsbxdW+IJoVPAj8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(4133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlJoWHE4SXp3bG5IdXZoU095UFRhWHJ6WjhPL2Q1OUp1MUc4NlJNV1MrRUNw?=
 =?utf-8?B?VmlDbXBwRWZSL3ZpOG94WkdndWhIT2w3ZXg1bEg3SEJGUUVzSCtFdzFGSHFX?=
 =?utf-8?B?MjhNNDlTQWZ6YlZaK3dqRXlRMmZkZ2xaWGZzM1p1R2tDTUhZM3F1eVV5LzQ3?=
 =?utf-8?B?a2ovQzF4RDkwWUxFSkhtTHFTQUt1cDFQRFhMMmI2N216V1laOWtXbC91dWxi?=
 =?utf-8?B?VjNwQWpBTVluakZnQ0UwTURwZ2sxT2ZTQzlUNUNXeVZVR3NMV0I3TGlpOFlB?=
 =?utf-8?B?R01pc0xmOFpUWmJ3T0hVSXovZE5VaVV5WHNzU0VFMXg0ajRLbUFvOTE2WW83?=
 =?utf-8?B?UzdpREczM3JsZ2c0L21INWtOVkk0V1o4K3dDZXRzdFRDakY4MHNBNi8vWWdq?=
 =?utf-8?B?cW5FS2c0SUJLaEhjRGEydTBkSGlIN1hSSHV4SGt4MDZ6eDZESEVHWmhxSmxh?=
 =?utf-8?B?QzNOTHlIM3JQeHV1VGFMak1jZGRsQVR3N3ZFNjRiOWRwZlluR0NNUnRpS2Ez?=
 =?utf-8?B?dDZZQm5DOEdrUGkvZVAzdGN3dFhaZVA4OEFWbTFSakl3SVhBRmhvZnNCdkho?=
 =?utf-8?B?OFlzWUowNnhkeFdoY1JLWE43ZEFHUG1GVkRiSVQ2a1RqdUYzTnF6MnQyeVcz?=
 =?utf-8?B?Si9uRjJmbWRmRDVSOVE0TnFMK0tZL29RN3dzeHdJMWdTVzNtWVJqRDEzdkV5?=
 =?utf-8?B?WndRNU85NEF6c0ZuYndMcjFPekVrRmgvdFduREJkT21xbnRYS2JHeDFIYnh2?=
 =?utf-8?B?b1VkRHVuV05oQUxoUnlEN3luWDIwQkJ4c3BOVE5QaitQRC9MSHZYVDEwZEIy?=
 =?utf-8?B?U25mb0hyY0tlL2NUc2ptb29JUnNFRm1hbTIrMjhtTmF4L3N2Y1laYWNKU3dY?=
 =?utf-8?B?ZnZPTTM4K2RFWUZ4dm1UYklLVFVNdkkrdDlFWnFEVllEN1UzQ2xDeG1ETUM4?=
 =?utf-8?B?SFRySEdKVWU0cnJDdlRTanVwRVloTmhiMTJGaWhxSWlud3FTcTNjNlVocytX?=
 =?utf-8?B?anZaYjNFbXBHdC9BclhPUVZiQ3dYRFI1WExTM1JqOEpmdjNyTWR6SWVrTzh2?=
 =?utf-8?B?K0kySy9DUEM0MThPQjBBQlcwWUs4Sk92UVc0OVkzMXZxU0ZMUXVBbzRkcmNi?=
 =?utf-8?B?R3kvUDM1NUtaL3M4M3Ara3VTemxtelJjZG9hY1VMV3ZSUmZKYjllcnErakhr?=
 =?utf-8?B?V2xzaDI1Y2s0TlF1TWdFYUxBK3hCZHcvZ0RCUVdBdTZZemhGRktsbG5kd1dM?=
 =?utf-8?B?aHNXbkZtYjhKUGlZQ0xVc0U0dmZDN1R5WWNZL0p6Qk5VSk9qVENpblJjSm4y?=
 =?utf-8?B?REg1bDFySzYrNUxWZFdNRElHcTJGZnNTRSswWFAwd0ZQYjYwcnduMjh6TXh4?=
 =?utf-8?B?YVVBenRwdzZpNnF6aVREZzI4OVd1UDE1ZHBhWDBmS05FRHRuajVvWFdBc0Rq?=
 =?utf-8?B?Yk0wQ0ZSUnlqSHNnRVI2ZDd6L0Mxb3MwWlhXSEVTZ1BjdWFNaXF6RFhweHRm?=
 =?utf-8?B?cTJtY3pwSFB2WnFXZWtod0VvRzIybHFTekt6SmZhREZOdDB2R1gyMFZUZ3hG?=
 =?utf-8?B?N1kxdytKTVdKWVMvMk5aSUMzejJZL0VNcXgwOFBsVmdVdG45blRKdDIyZTlK?=
 =?utf-8?B?N1NLWHNIaDRFS2MwWm9QdW16bFpNSHpzcWxrRlR0Nnd3UERzTlpiS1lKckJi?=
 =?utf-8?B?MWRnTzYxa01oQnhCdXhhYUs5STVZcE1Mbm4ybzRod2ZsN0xibVlLVFVxbEFZ?=
 =?utf-8?B?RS9YSzNCd2JLNEpDTGZqMDZOWndVYkNhcktaUU9xRGpqRW1YODlYeU1RZThk?=
 =?utf-8?B?dlVWeG12OUtJYjBySWNKQ2hIOHZMRElpaGhGMXhReHJZc0UwcDVXdjBPc2ZO?=
 =?utf-8?B?UGF6UzhXSjNFOTJIK2ZxRStCZDdyR2ZZUndRQ1U1cjNVeFhvRkNKaGtERHRX?=
 =?utf-8?B?L3JIMW9pRFV4WWdKQlVrblQ4RDZvK3h4MXh4NXprUWZYVDArZ0VRUUFHbllT?=
 =?utf-8?B?OHpVK0lyS1RSbkdqUWtvSFptaVVDeHpZZzhITkNhY3lheEF6dWJhYWdYWlVL?=
 =?utf-8?B?MW16cWxMdVVXQnk4ODJQV0VWSGhCUXpmUGZLYWNBRFg0K25reDJzK3BoOHMw?=
 =?utf-8?B?Z3g1bmpDVE8zYkU3OUJOSjd4R1NKbjlPM3ZrejFGVnlSNEI2YTBHQVljRzJn?=
 =?utf-8?B?dEJzcjZOQ0xONEMxL3Zkc0tqcHo1ZjJ1M1ZhL3pOelI2bGpUVnRFNXBBQ1dr?=
 =?utf-8?B?MCszQWJ2NDlPditRNXRNY2Nza2ozK2phamlCRkQzcEhHZzJBOHl4dHhiRGVW?=
 =?utf-8?B?QUZjc3Q4WnhlRDVrbGQzTXlPOWtranRKYXBNK0xpa3ZCWTJGMllMSWRKOGEw?=
 =?utf-8?Q?e0C+LkeKfaP+TGVg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	n2Osu0e8tBPgMqopZaFNJMwKCqSuG6SnUgo4UytElBpKgsD6f5iH4EnEw7Q9007LQeSzZRjEJQlh80GGeGXueq5tFehvXtqHq7ulkSP1DifKvSoSEybZ95FsNticShWmGBXx5KdcDAEAFQ3NucG2SmjFOsrLBNri3jX7quj2NyqrZEaq0r6pFaQh+XJJaf4yI/7ADO/KR476x54B+KdWSrsDk1tl0e/izBUXVgO0iphe4LGTWEzeo5CzNMk+e/CD7t+AWV0i1pj1KGP3LoGWnqOif2DVxKz9LzQI9Td8XgEgpFceNb7ovHFTYYu2q+n208DuKWRjUajqRpVIXHRfLw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91de2ebc-6968-4ef4-179c-08dee6026128
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 01:58:22.7280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vS+yAYoJmWobp+lBodNH4Tfg0pB/UBy7MOSzBZRNlAN//Ysafim2Pg11hfczIah6ZGuQNy3MrlPh98C964/IsSfNpeIfG8ByYt1gMXoYSHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7400
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAxOCBTYWx0ZWRfXzleB7QlOVUv2
 yeLL3xy8J2DF5MweZmHnOhg0MK1mzAtULZj5EMQKDzM+3A2+wOsi52pTHTJOcleh61svTBaj0CP
 /D/HhggWiTlEJ+WiZUvIKhw/ZtbqhV0PxcCtjWPGi1cBsqMOeMwlWf+lfRd8p2kqfGPZTtONaoP
 h0ikzeQPLshqMyY35cgGw/zeEcOu6AasQeTmPiDKcC6DZ+S/Tm53HDRQJYNle/m5NEejrNLmGw2
 MlKiWrvGhe0jyAa/KohV8H7LlJFXfzes/yVdUa6uBeiDy00sL6fb0lKYw9IO8Nz08zCZMqVjT6B
 jKmO9ZN7XCYwEaOZhoIQoAfuyIY26Du88vRor5w6fCBYJRaWAD4/RF6PLH1kQfK5ncdAU0TgEb4
 NbREUyvwcJx++YpX6RK4inD9e8Yj1mH22szAxuDVqMCrlmV8MpkufA0S8owSqd7zWWfPc/YN5Z/
 UYwRxP610AD3P/UxW5Q==
X-Proofpoint-ORIG-GUID: iZIIj6oIb2nD5RMPnG6Oo_Hp5PNeTLb1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAxOCBTYWx0ZWRfX/91u1xIsHMU+
 tqG6yOefCpmOhJXXtwNBszypX/kE/DYdZ1CYQGYEGXwcftiHNh4yjtdb1f2+Qj66euNuoFqTBJM
 h/HX/n7rLg+i7SQqKIwmMcgmIH8sNG2rCOqYNKhoc9AnzLRnnTDC
X-Proofpoint-GUID: iZIIj6oIb2nD5RMPnG6Oo_Hp5PNeTLb1
X-Authority-Analysis: v=2.4 cv=VIztWdPX c=1 sm=1 tr=0 ts=6a5d80c2 cx=c_pps
 a=QjrP5IPIVlaYm/X31SuGbg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8
 a=0C3taGCe8KwzmXO738QA:9 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200018

PiA+ICsNCj4gPiArLyoNCj4gPiArICogRHJpdmVyIGN1cnJlbnRseSBvbmx5IHN1cHBvcnRzIFJF
QURfVk9VVCBmb3IgbW9uaXRvcmluZyB0aGF0IG5lZWRzDQo+ID4gK3NjYWxpbmcgdG8NCj4gPiAr
ICogY29udmVydCBmcm9tIGZlZWRiYWNrIHZvbHRhZ2UgdG8gYWN0dWFsIG91dHB1dCB2b2x0YWdl
Lg0KPiA+ICsgKg0KPiA+ICsgKiB2b3V0X2FjdHVhbCA9IHZvdXRfZmIgw5cgKDEgKyBSRkIxL1JG
QjIpDQo+ID4gKyAqDQo+ID4gKyAqIFZPVVRfQ09NTUFORCBhbmQgVk9VVF9NQVggYXJlIGN1cnJl
bnRseSBub3QgaW4gdXNlLCBidXQgd29yayB3aXRoDQo+ID4gK2ZlZWRiYWNrDQo+ID4gKyAqIHZv
bHRhZ2UuIElmIHJlZ3VsYXRvciBzdXBwb3J0IGlzIGFkZGVkLCBWT1VUX0NPTU1BTkQgdmFsdWVz
IHdvdWxkDQo+ID4gK25lZWQNCj4gPiArICogdG8gYmUgYWRqdXN0ZWQgYWNjb3JkaW5nbHkuDQo+
ID4gKyAqLw0KPiA+ICtzdGF0aWMgaW50IG1heDIwODMwX3JlYWRfd29yZF9kYXRhKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsIGludCBwYWdlLA0KPiA+ICsJCQkJICAgaW50IHBoYXNlLCBpbnQg
cmVnKQ0KPiA+ICt7DQo+ID4gKwljb25zdCBzdHJ1Y3QgcG1idXNfZHJpdmVyX2luZm8gKmluZm8g
PSBwbWJ1c19nZXRfZHJpdmVyX2luZm8oY2xpZW50KTsNCj4gPiArCWNvbnN0IHN0cnVjdCBtYXgy
MDgzMF9kYXRhICpkYXRhID0gY29udGFpbmVyX29mKGluZm8sIHN0cnVjdA0KPiBtYXgyMDgzMF9k
YXRhLCBpbmZvKTsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJc3dpdGNoIChyZWcpIHsN
Cj4gPiArCWNhc2UgUE1CVVNfUkVBRF9WT1VUOg0KPiA+ICsJCXJldCA9IHBtYnVzX3JlYWRfd29y
ZF9kYXRhKGNsaWVudCwgcGFnZSwgcGhhc2UsIHJlZyk7DQo+ID4gKwkJaWYgKHJldCA8IDApDQo+
ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJCS8qIEFwcGx5IHZvbHRhZ2UgZGl2aWRl
ciBzY2FsaW5nIGlmIHJlc2lzdG9ycyBhcmUgbm9uLXplcm8gKi8NCj4gPiArCQlpZiAoZGF0YS0+
dm91dF9yZmIxICYmIGRhdGEtPnZvdXRfcmZiMikNCj4gPiArCQkJcmV0ID0gRElWX1JPVU5EX0NM
T1NFU1RfVUxMKCh1NjQpcmV0ICogKGRhdGEtDQo+ID52b3V0X3JmYjEgKw0KPiA+ICsJCQkJCQkg
ICAgZGF0YS0+dm91dF9yZmIyKSwgZGF0YS0NCj4gPnZvdXRfcmZiMik7DQo+ID4gKwkJcmV0dXJu
IHJldDsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gRG9lcyB0aGlzIHJldHVybmVkIHZhbHVl
IG5lZWQgYm91bmRzIGNoZWNraW5nPw0KPiANCj4gSWYgYSBsYXJnZSByZXNpc3RvciBkaXZpZGVy
IGlzIHVzZWQsIHRoZSBzY2FsZWQgUE1CdXMgd29yZCBjYWxjdWxhdGVkIGhlcmUgY2FuDQo+IGV4
Y2VlZCAweEZGRkYuIFRoZSBnZW5lcmljIFBNQnVzIGNvcmUgZnVuY3Rpb24gcG1idXNfcmVnMmRh
dGFfbGluZWFyKCkgd2lsbA0KPiBjYXN0IHRoaXMgcmV0dXJuZWQgdmFsdWUgdG8gYSB1MTYsIHNp
bGVudGx5IHdyYXBwaW5nIHRoZSB2YWx1ZSBtb2R1bG8NCj4gNjU1MzYgYW5kIHJlc3VsdGluZyBp
biB3aWxkbHkgaW5jb3JyZWN0IHRlbGVtZXRyeSAoZS5nLiwgcmVwb3J0aW5nIDJWIGluc3RlYWQg
b2YNCj4gMTJWKS4NCj4gDQo+IFNob3VsZCB0aGlzIGJlIGNsYW1wZWQgdXNpbmcgY2xhbXBfdmFs
KHJldCwgMCwgMHhmZmZmKT8NCj4gDQoNCkdvb2QgQ2FsbCwgd2lsbCBjbGFtcCB0aGlzIGFzIHN1
Z2dlc3RlZC4NCg0KPiA+ICsJZGVmYXVsdDoNCj4gPiArCQlyZXR1cm4gLUVOT0RBVEE7DQo+ID4g
Kwl9DQo+ID4gK30NCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gV2lsbCByZXR1cm5pbmcgLUVO
T0RBVEEgYnlwYXNzIHNvZnR3YXJlIHNjYWxpbmcgZm9yIFZPVVQgbGltaXQgYXR0cmlidXRlcz8N
Cj4gDQo+IFRoZSBkcml2ZXIgc2V0cyBQTUJVU19IQVZFX1ZPVVQgYmVsb3csIHdoaWNoIGV4cG9z
ZXMgaGFyZHdhcmUgVk9VVA0KPiBsaW1pdHMgKGxpa2UgaW5YX21heCBvciBpblhfbGNyaXQpLiBC
ZWNhdXNlIG9ubHkgUE1CVVNfUkVBRF9WT1VUIGlzDQo+IGludGVyY2VwdGVkIGhlcmUsIHRoZSBj
b3JlIHdpbGwgcmVhZCB0aG9zZSBsaW1pdHMgdW5zY2FsZWQgZnJvbSB0aGUgaGFyZHdhcmUuDQo+
IA0KDQpOb3QgYXBwbGljYWJsZSAtIG5vIGxpbWl0IHJlZ2lzdGVycyBleGlzdCBvciBhcmUgZXhw
b3NlZC4NCg0KPiA+ICsNCj4gPiAgc3RhdGljIHN0cnVjdCBwbWJ1c19kcml2ZXJfaW5mbyBtYXgy
MDgzMF9pbmZvID0gew0KPiA+ICAJLnBhZ2VzID0gMSwNCj4gPiAgCS5mb3JtYXRbUFNDX1ZPTFRB
R0VfSU5dID0gbGluZWFyLA0KPiA+IEBAIC0yNCwxMyArNjQsMjUgQEAgc3RhdGljIHN0cnVjdCBw
bWJ1c19kcml2ZXJfaW5mbyBtYXgyMDgzMF9pbmZvID0gew0KPiA+ICAJCVBNQlVTX0hBVkVfVEVN
UCB8DQo+ID4gIAkJUE1CVVNfSEFWRV9TVEFUVVNfVk9VVCB8IFBNQlVTX0hBVkVfU1RBVFVTX0lP
VVQgfA0KPiA+ICAJCVBNQlVTX0hBVkVfU1RBVFVTX0lOUFVUIHwgUE1CVVNfSEFWRV9TVEFUVVNf
VEVNUCwNCj4gPiArCS5yZWFkX3dvcmRfZGF0YSA9IG1heDIwODMwX3JlYWRfd29yZF9kYXRhLA0K
PiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBEb2VzIHRoaXMgc3RydWN0IGFsc28gbmVlZCBhIC53
cml0ZV93b3JkX2RhdGEgY2FsbGJhY2s/DQo+IA0KPiBTaW5jZSBQTUJVU19IQVZFX1ZPVVQgaXMg
ZW5hYmxlZCwgdXNlciB3cml0ZXMgdG8gbGltaXQgYXR0cmlidXRlcyB3aWxsIGZhbGwNCj4gdGhy
b3VnaCB0byB0aGUgUE1CdXMgY29yZSwgd2hpY2ggd3JpdGVzIHRoZSBzY2FsZWQgUE1CdXMgd29y
ZCBkaXJlY3RseSBpbnRvDQo+IHRoZSBoYXJkd2FyZSdzIGxpbWl0IHJlZ2lzdGVyLiBCZWNhdXNl
IHRoZSBoYXJkd2FyZSBleHBlY3RzIGxpbWl0cyBpbiB0aGUNCj4gdW5zY2FsZWQgZmVlZGJhY2sg
dm9sdGFnZSByYW5nZSwgdGhlIHdyaXR0ZW4gdmFsdWUgd2lsbCBiZSBjb21wbGV0ZWx5IG91dCBv
Zg0KPiBib3VuZHMuDQo+IA0KDQpOb3QgYXBwbGljYWJsZS4gTm8gd3JpdGFibGUgVk9VVCByZWdp
c3RlcnMgYXJlIGV4cG9zZWQuIE1BWDIwODMwIGhhcyBubw0KbGltaXQgcmVnaXN0ZXJzIHRvIHdy
aXRlIHRvLiBhbHNvIHJlZ3VsYXRvciBzdXBwb3J0IGlzIG5vdCBpbXBsZW1lbnRlZC4NCg0KPiAt
LQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9zYXNoaWtvLmRldi8qL3BhdGNoc2V0LzIwMjYwNzA2LWRldi0NCj4gbWF4MjA4MzBj
LXYyLTAtDQo+IDM3NzYxZTg5YmI1ZkBhbmFsb2cuY29tP3BhcnQ9M19fO0l3ISFBM05pOENTMHky
WSE5QkJMb0U0ZGl0Y1JFSXZzREQ3DQo+IF9WRERLanNTN1hnclYwdWRYSWd2QlplQ1JDaHpEV1dz
dTdUWTh5YnI1VkJQRzRWUWxMbkRTNkVRbXU2ZmhmTHgNCj4gQ3BLVWwyOFpTRTA0JA0K
