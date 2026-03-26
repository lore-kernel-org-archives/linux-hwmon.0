Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23EC33D4EE;
	Thu, 26 Mar 2026 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.147.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566713; cv=fail; b=dLZYy2WwIYMIJgtMTXzqXwH4zLZUOK1vEDk8ELTZDoSzRN4MazTnU1nZzq5i2vvTs4if11WxlTmSxR2tiwXJzgDqBai+4wSKvoWI4XPfQMEQEGa79I1KEgGPAd3u1W+AfJCNTuZ2NYXStzV1Isf2HZ3NXhHSWKZu3Avqy8ASpvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566713; c=relaxed/simple;
	bh=zWzY+al9QCCnu2UnA7Y4AWUHMhOCuDcY08aGagppvAE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7V1Nq1dUtM1CLTfO6jWgcsyNAz10x8h2wF1fERbPjTHwHVCLSzevodj6nWTlgUZWMI/cKTV/4bsd91G8orAvwkiQbJAVNoCPxOd5a91FTb+gEUgVQ0csd/KW9pay4SwEKOQMxLlvrHDBiIlVW/Lemalixk+3n15odEhNh7mrTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=WgX4fhzP; arc=fail smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="WgX4fhzP"
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJTohC3225028;
	Thu, 26 Mar 2026 23:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=zW
	zY+al9QCCnu2UnA7Y4AWUHMhOCuDcY08aGagppvAE=; b=WgX4fhzPHlhmd7zgSR
	O7IPxkiz0HJCzTZIuTncFUh9xupivXwXhMObvZXmxP4czSdfMAjaIaGcBp6l1nf0
	MAw0xAWjWEkqCdCLTjIOACdjEhGZHMIOrslWZ2s0dzSuXPm74LCBLmXRVPpLot9m
	Ug/FcgxOTndvKDjuG+eYD+A5hT7ucMDa4Den+UxxSkuNOu9ADuf6QT/JDYRPCRhP
	E6wBZ26X4LLC70q7exyXH3+ooApQDu7QnQv0xJxNTi2f5UnmBGVoLAMHIFM0XeQ5
	qvJbFQHDiHREONNTd/m6icktnVDenEc+qCNk82cNPcSm/JGEo+wy8qe7MSzKhr09
	uElQ==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 4d56x7nqpy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 23:11:36 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id E49F9D26E;
	Thu, 26 Mar 2026 23:11:35 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Mar 2026 11:11:27 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 26 Mar 2026 11:11:27 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 23:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIEvhp9Zp5iU3e474SD6lN8j9LhPM4byDlKkHXNtpbkoLlEHNrVHsio+TXLwxHpUFN8Qt7gcAbRWqUk7/H6ylOQc9ZV8L5l12yde17ldyvv2okiNfbRyf7jH9ApVai1NwPck8WggxYddhtMudaxdsAEoo9frQPmN+dv2jFM+VOQSsBYsg1+GDzl0SoykKsteRq+Hmj3gCHqSUagP8mVmhyhfhIzaMnORQ17hoJLKWX1nAWCcjFRImh2cjg0t+x+FPsi2HUmYYpPs1UhGMQKtViy7w+wfgNn6nluNRlWNv1mDvTpyDezIPMzvrmSQo7bboxMDvXlwjxt9i5eMffJJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWzY+al9QCCnu2UnA7Y4AWUHMhOCuDcY08aGagppvAE=;
 b=hezifNBDpso6AL2LmrME1tduz05ppQX2a5zJx4scoVa2p9MDL2l/tVUaTmWIz3RSh2XUO9/L0JNlEfeUtWotLv/femXVoGCrkSgmhwwT1WXjPha078it7wjkG3m+iH49T7TCCk3PCXVaqj3M2EEYhK6Au3WUFx9pNxtT9A5+HGpc8cAo2lX2yCDp/IRX8ADeyppAT3yFYbrLg2WXVdK1j10mEr2dcfuBrpnOMF7n27fhge1wEySUSxxME6wMb+3LSsmQTERhvciJPHyrevI8LpbNZDNjcjfWlKCmQMNq65Pvn7/urr0zjMv9n8WLc+okO6hFtJ27+CF1BTdOuKVZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1cc::7)
 by PH7PR84MB2246.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:158::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 23:11:24 +0000
Received: from CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f]) by CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2c54:3534:122f:e74f%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 23:11:23 +0000
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
Thread-Index: AQHcvXI4vvjQBfqWwkiz6FB1AZzrTrXBcM0A
Date: Thu, 26 Mar 2026 23:11:23 +0000
Message-ID: <20260326231116.297222-1-sanman.pradhan@hpe.com>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
In-Reply-To: <20260326224510.294619-1-sanman.pradhan@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR84MB3523:EE_|PH7PR84MB2246:EE_
x-ms-office365-filtering-correlation-id: 78146b9d-d5c8-46cf-a507-08de8b8cffe6
x-ld-processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: FQ9gGzeDf4SQwCWjAo51TUgM//MpfGuIGc9h16ZNkcgWqzJuFjHAS/fP/2mdYD+5OK9dSD/10U/UVLepjBsqGYNQHyk84n78jtk+wmnLM0P7kGs3vFGi2G7ulusLTZZm+rMYYkISJR7eNppw/ZTOw2iZDkrat/iNLaK/usmVnV298eYlWkusfP5rMmXwLPb7mANUbuGzG3Y5touwO2MMYJP6tj/tMAzwbK0bmlvXwI+uBe3+XNj+S424SDNuCO7S12TZdW6SbHghi97OqUfpWy6ayNtlWyRX3f3MPRAj6R3/6rgFs+RB+hpr6zr+DqsMsPUI6kf7CtWFNRhSOkwRjmeRt3kZn4T1Lw4+VhyTPUJOMan1SCXVBv9qwdAi1G1hRegC/77nYW9JUwEXZPzFFCQ4tAu4p+nYbxDJ60XLZCezoQaAkJkDmG7BRVBIyc/TYe83RSMaNBIFlHeMBIavOr5BPAlvaQ7ITcqRQd+bkh1hkZWxqzSWoWU6meUjia+w9nr72VV3JrKsVycPvxdRxHlmHqumsJPevmR7zeaf0Gj/jDFCaYSMFiHYnbeUw17phObdxKAaO77qoq5L0fXDsXqBcejdS5RrMUV58NuVYVNPqRZ4NZA5ayfP2dGSRHg+w+bThcP/i8BwsF+tH5Wpx2hbRSaotYWQCUj709PPa+jTu0O0cFuDTokE7lpBq4V/b023MefwSj/WsUBm0pWdnc40SAMNEJmMirYY7DJwI7Wc2Y5WbQwEy3feLC/Ip7/WexhbIIWEWoKdzQt+LMl1A5h9b7Zwkl95ZYyMsh5r5M4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Dsdt1BlPjBx0qJiYXWEB9RJqeNOmEQ34rcFyxUWWYH7ZvJq3KwTk7KnUcm?=
 =?iso-8859-1?Q?fTx39Ox5ZAkZMjyd8BHD1eUyZ9ioLGj0Jp0cUQ7HEI5a4/GJswrUcwRvux?=
 =?iso-8859-1?Q?hQu8pYCp0FjgmFCQViXtITK/plXJtMHyqv8BT2Ru82zRQvMUX9Iq8dnl9s?=
 =?iso-8859-1?Q?cNz9TEF5MfybDHcoaD0oiqkOKpHRBCQzZq1R11KeLhJE1TwHzuBX0t6j+a?=
 =?iso-8859-1?Q?9dTILx3HcNqbTXWAVQevj5M5FI2OYlDOf558ktGgmrZFTXE+nrmRq77GPn?=
 =?iso-8859-1?Q?NDtYus3gzXKaz2HB0A9WwpdhEuP0aXn41rQhgUqCdz0Kr+5AHqNFdj720a?=
 =?iso-8859-1?Q?7XQtZYb3EHHPsk6l3dyr33etUU77ohj9e2UBTT2/bsYYRsXtCWwcmdabCi?=
 =?iso-8859-1?Q?ka/daGp0ttvWFOi1mhaHyLtg5imLO5kw9N+i6MH/DTBQu0G5+2VW6UmtSw?=
 =?iso-8859-1?Q?3fHC/YjMZ9+zYkSXORXzFNfkOExQiwSTHl+wCuMRlXCQz7FWL3QMt2YCTa?=
 =?iso-8859-1?Q?A8vbP5gLoa9vflVmy0UM8Tm5dV33Zr+HJHwrg+UQrmw8YxeEZefuyH+Shd?=
 =?iso-8859-1?Q?unXBVpjkj/bWl0yPGMWNHU3d4oPZ/mJzSEuj3vqTjjK2XlEaGQJtBjiZky?=
 =?iso-8859-1?Q?0+VznSQ/h6PKxuK1WMVp/5hMvIelZ2UUWDSoV91KNzLl9TTi76vGnaEMtb?=
 =?iso-8859-1?Q?h+4DNgrNOLaNSjOmW5dLO434IYhkAXuDrRLqpVUjwZOlAzrwx3igfmV65e?=
 =?iso-8859-1?Q?g2zGfU6CbXMI13s7FfuznbTepOpHtR/aezuRu/wENdPJ2w0SyqWUBIGlEV?=
 =?iso-8859-1?Q?zxKbozEIIgEGVLevnTkRgq0k1CbR6pp66CopsqieeSogjwyNidscYK//VU?=
 =?iso-8859-1?Q?pa+T2ytUtOmEX+fjcBi9UnaNlIzUB8mvds9Rd0xTUIhEc3YcSdajqxHKr2?=
 =?iso-8859-1?Q?iwjSn4IyDlPzeQVV6OjrMoAuAfog1hwc7Lua89W/61VrZJq1NzucaiDGaR?=
 =?iso-8859-1?Q?tdbZ+lcQIDUv3AalcobjkgU8v727bGoz8ubaQcG3XEzcSXE0FxvnjKszHf?=
 =?iso-8859-1?Q?0TPHGbHQnhVeOJYSAaN6VWuK4XksE10a99q3MW/CwEPz7Ez88d0UxmCDBs?=
 =?iso-8859-1?Q?YN8UoNE8ebG1i7FOWwJIcuLG3+d1tnXZjtZpgL8TivkqnKXaXjLOoV2hT8?=
 =?iso-8859-1?Q?upGcEiF1e/jXR5et73QR36gVGKGP+hklnfCEEKJGd4gt9t42beL/AwBam/?=
 =?iso-8859-1?Q?m3nGU+btimXhKkfLPZCbWzCuAlEESJlgttWIyPtotUDfiGm4TL2iLRdV5q?=
 =?iso-8859-1?Q?nQmyFXHmdd5HCNDfY56hr6qp+XTOVLr4SU6j8rfS0my93dexTT/LiEtd3W?=
 =?iso-8859-1?Q?VaDb5q0buzEjLoZvQ/T7yQeCe89rIhDQIWAhyY/iVR2ZveMVEIshcCwN9N?=
 =?iso-8859-1?Q?dECPy/cEhRosmCbkAXusZ8kFRXRHd37L4uGapTF0GhHbrvnsqeFQsLrkzl?=
 =?iso-8859-1?Q?hDtAtWDtcSRervoLtseRVVp/rRtzw8eHbmZLa6fB7q5En8NbXkF5xdyNfK?=
 =?iso-8859-1?Q?Usv6kI7AE5suIm51n21fQszrzo7/wwzMuOPMuHV2rZvFTXHyocb/S5Y/l/?=
 =?iso-8859-1?Q?FXrmZI/9psw/g3y580SgjGqaGYkrEd6sjVmU0+QlWfww99NOu1B2XPPIdj?=
 =?iso-8859-1?Q?Hpi0IYjbM/XZgQV4558slNhSypo7cZYwg6e2tVm2DAiSp/3K0ckp1kvnVu?=
 =?iso-8859-1?Q?q/8NljVz0Z/GZWlJ3k7esacy9O6dtvMOqP+d8mBFsTr2e9FJQvWUISaTN8?=
 =?iso-8859-1?Q?zsxL/c2KsA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dOjZaZI/P/rNOAAcy/6GTwO1wMAPsBLT0K24MJVOUoXUAt0XIkLJxzlKEXdlNm3w0+FyC+rdCja9fPr9rRrMI33wMo5J8GztGEk0vq6qtflsiA8GTmq59B05B+Vi8QdqoiDjeGcDLWapYUWHo655Gre3RFOh+Z690XWV+g36JI6aqqzFIcMBcdtGzKSDRHZRiPyEGTrMblSd4OXFDP2udlF5s3Ng4hFIdJGKJlbzBl+CUuot1TaJ3qPVtUNvupShsmYjASbkpDt8I6dfxdLEwFbwYQqFzqzzZIhO5Vk7GwC7gQksSt/YxVMji8fM0EXpDvkpzQItUrbmNHqCzQC9NA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR84MB3523.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78146b9d-d5c8-46cf-a507-08de8b8cffe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 23:11:23.8010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFDmCBppeqOEYDpeFT6joW/A3YRn8gO8qDewBQ0yZmcCx+lyBZ38cDo0wi3lMFe6tqfLbU1tRCv/uXp8CALTTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB2246
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2NiBTYWx0ZWRfX9aXEwxZ0WW8o
 ZZw6d4Q3ilHT8Y2sVy7GIG+1pVYX2DowcUYyZkmZ/YxSZHqLRlEolWOE+K36C0AtHjlbklJka49
 PXnAx6Xps2f77nfDNFUT7DHNWuNTKjueblW4hWWYCenMds28yUq43hSwvXIz3XYboGG1djwkiQz
 p8MpLbSoJtSgScoWCBXhNpSIKKtQqTqIUOS1aCp2VxH4YMVdhSLpMPT6iOzbY/ZbkRbGeJytrDv
 9pDkudtzt0t058yiLJolxuoRy9ELN+e6n6dHrhwu5oj3s8MsvhWnk5MiREIJdBzf8WlREVIWYHo
 uSZTWzkUP9wyU5n+c5g4j2ZVTpr2mWRNDDTQNfkMgOtU4Al3dtZvqYvT9Jcp3XO75XIvK9KcTd1
 6Dw4uz65w0holSEBatW26KYeZU2D5p1ME6qvSUkEurQV4BdVgWBvNljZYxyI5rpEGf8/kJnlK9Z
 xfhL0YRO9SuwaL9hz0w==
X-Proofpoint-GUID: gQyw1SdSmMT-WsVOOqczBbK7XF_yIdJR
X-Proofpoint-ORIG-GUID: gQyw1SdSmMT-WsVOOqczBbK7XF_yIdJR
X-Authority-Analysis: v=2.4 cv=B+20EetM c=1 sm=1 tr=0 ts=69c5bd28 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=6_mrDcixewTG61oOsKN3:22
 a=OUXY8nFuAAAA:8 a=0_-pk2F48EGxuqt0QhoA:9 a=wPNLvfGTeEIA:10 a=Qzt0FRFQUfIA:10
 a=cAcMbU7R10T-QSRYIcO_:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260166

From: Sanman Pradhan <psanman@juniper.net>=0A=
=0A=
Apologies, the cover letter from this series did not reach the mailing list=
.=0A=
The three patches themselves went through fine.=0A=
=0A=
I can resend the full series as v2 again with the cover letter,=0A=
or just note this for context.=0A=
=0A=
Thank you.=0A=
=0A=
Regards,=0A=
Sanman Pradhan=0A=
