Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963567;
	b=s7MOHWDMLzjPODSto95p1Lvalg3pc5FOKYNWFZDpdyP5GiVsbrHnVPCVqwCxyZDhp3h+
	 pwIeu8DUQAy0S5kcKpPLEX3X5sfVvm5JE10veXN9QU8sQOqvJistF/DOBc6RiX0b9Ldxx
	 TpZvDfpQXmIDDFXNFhtYf9TOO4XeTWxG2uKJUaXHwRdN+P2X3Zcxasxliz7r1g2u9q8zo
	 uFRVbUSbS1H3vwdzaElmlXH82R0XVqJFR8/OYPR6fHAeLef2vJtGwe3ayyrKgAL0INYWr
	 iHmdZSVMV8c9wN/XlQ/CS8miuY47Y8n5trovfzdPZ8nIurArSYoZe2f/mc8ebm51Agw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963567;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pIWanW3cHaQGFy3zdm1D+tVkwXf+ea6eIbkrvTQyJ2s=;
	b=O2nWIHRyx0C3QnFbmpZJYlLWg/AYpEQQVNC170TI7xxN3T7kIBK6S+9sAOcyEGk+Iefs
	 +MldXWkHbOWMkY+bryCAUo14fJcItg/oahbdZi/VeMH/MRw/g3vw6Wz7ZEgHj/6Vk3ZAy
	 vXLXJX/ssLDaWRDyUQVozit2RTQj+vc1filhoYcvaLDDWJ4fZIk/7tOBPr9TAOmwGXGrB
	 vixIdTZRxrc3eIwx4LlZ9NEBUh7BW9Mc9mHCrIPpyHD1Fdt7n2x0dnda62WRy+kwbpt69
	 Ar+AhTn6zvJ8hcTV7qMDt14e4tES3I7MkVfOiFi0jycyBDAlZIQEjkJZgAfHx+lbzIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=MxLnfZFy;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xU4TeLea;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA11606A329;
	Fri,  6 Nov 2026 11:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA11606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=MxLnfZFy;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xU4TeLea
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ARFa42798788;
	Fri, 6 Nov 2026 06:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=pIWanW3cHaQGFy3zdm1D+tVkwXf+ea6eIbkrvTQyJ2s=; b=MxLnfZF
	y/f0R9dV2ztsWpfOLuMv5Gy8fmeTfMYnZev4VISqGWF7oW+va64VRN0ZVahZNdHd
	4sRkpKEn0cj0Am8nBTz9XCR7V307HZFMa85kQ7J/R/HiX+z/hNJLT6tvxzr7emk6
	wO6i4VWRe6tQt3OPFQ696PyrRqifNlDYsc6WK4RrNmn3WBm2u/UCr42qmqgTU83t
	TT+jvQaZ/A9AsE8dQSXRWta2NRyLONw4B2FV4U9NDxhVDwRuXmoEoh86dzI6ezQO
	Xwe/42ESusRPLXHg7uJGtxiXICEiwb+kIndGsvPjc6T7GYQAwXQW9TtMUuOD7+MN
	+U7nvGkxqjXX4EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=pIWan
	W3cHaQGFy3zdm1D+tVkwXf+ea6eIbkrvTQyJ2s=; b=xU4TeLeaQaQwbteVa0IPq
	ErPmRU2dm5nOFJvWFn/BWxyb69PYe1x5u9r3VHX1umu0uu9JMxpMmvBS7KSecMwn
	XJ2CPfNvvGZwxH+qh6XVmMazheET1aBkVRhZz5xkZDFI58E9EVAZDQmFlAQz9s7w
	WV3pi6AJnfOgjwZs3vDHvezfFCuA66rB/IZlgytnzAABK4EB2G11hIBTKb93W5KF
	7MRg5CXPsjF/UEx3FpSIHIDXBbIX7uzUxpByEK84gOztjKwpWem+HwvlwblUuu8z
	25SGGEJ8wMnISoEJmrS9khz1d9YHhb68c9eXD1/NxX4pS6S84Tzefht2r1l039gP
	Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hs3qabdve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 06:12:19 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyjQWS5dnXGz+zxuVl9eo8RF3mL51iwFcBex370vKsHNUgAQEOH07/ashUAEP1TDrykHxln8HOiCShNvuHXK4CuHdf7T7RFDaSqFza1yFcdPEFntrH/xICi4xximn5TFxi7yfJgiZblU12WP4K5gLgLnmJ684ev+0/h5cUVNEUsp6Q8vEfEarCLrntOUAvRhrbZj6DX5j0yjLqxtInkhYRe1GpFI0wG5pjNrdIJGO3R+fb6KKgkassv7Z9htRh5VEkiLfRkOz6ougqePA1pBJiFbhK6JoBFcGnxvkT/tXfLOtYdb09Uf+EbYAWC3U9OsFPZwOKlRosojMXgjzm5x4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIWanW3cHaQGFy3zdm1D+tVkwXf+ea6eIbkrvTQyJ2s=;
 b=oEkWiLwSpDuOQenQIaB2ovAiMebmIdoaipipwtry6dyqngRtlzoCXXJgGpMgtQO725kG57HNXeq2JcC4tI+tt/84odtdBptln/fy62tPWUpeTDec0N0c0yMHWnudMVk6kUv6eUsdKXXqcXbeBLCyoLzCTZXU6yX6GNiMT5M3Nb6euf2ZFhrTngEXJRC2nXVsSD2xBqwogyAilWg0Ns6ni3KqSKEEO/BMrnHj9T6WItq4egl+ioIl8pYY3Wef1hJ/xX4Zsedr5SxR6Yf/dpUTqiYGLG7p6/akWpIBCwrerLIn/3bm/kGJuse0dTuBiJwuh/LKDkfc6/IOb5hWm9kKcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by CH5PR03MB7933.namprd03.prod.outlook.com (2603:10b6:610:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 11:12:15 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 11:12:15 +0000
From: "De guzman, Christopher" <christopher.deguzman@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH 2/3] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Thread-Topic: [PATCH 2/3] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Thread-Index: AQHdYIiZmTG+SQuslUWCvZWZVD78L7cGijKAgBpzfJA=
Date: Fri, 6 Nov 2026 11:12:15 +0000
Message-ID:
 <DS7PR03MB8265B347A0C50851D924C4F8ED762@DS7PR03MB8265.namprd03.prod.outlook.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
 <20261020-upstream-lt7175-lt7176p-v1-2-86b9b728b95d@analog.com>
 <62872394-e64e-4ed1-9d73-ccae1336d7bd@roeck-us.net>
In-Reply-To: <62872394-e64e-4ed1-9d73-ccae1336d7bd@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR03MB8265:EE_|CH5PR03MB7933:EE_
x-ms-office365-filtering-correlation-id: de7461b3-fc14-4d8c-8167-08df3bf6d090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|260925021311599003|260925022911599003|260925021911599003|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 oZXhVjiY3g68NJrmFUZmqblbA4+ZTjJTvsRNGsaHLb3qsfT1nMsioPv/GJZaL7jPkdSrRFLhR0knjK2uNB1070079eZGGqGVIbluu/rVQbetnefK41mVm1hnLL1PShIERuDSNJdVfSPHC7HSu7GMdy8/BRAvoRl02gpoWAGJFG6fE9pe44TUKMzEp9InzMQW/sHzjcuaAfApqRA9IKDUxNb+LJg/7br5DVx27RA3xgJGgP8OAcL3CE8n8xT//cWe79503eb1+3EcR49vd4MH7WdqdtOE29k/5xANYwsPcDttK04h/gLmsGGiH4HjFP/1gRxHI0T7KiYEC1I/ddIfzV7GO76eo1JG5ppAxKEVOVozb21hUwjXVfdNZint08fNccvaqs/TjBUEDrexvPmCM5FUPjC4J8EncHUKAypcocTzOu+n+bwIa3JujqjqGydqv6xypaiSCRPnTXXm/6fMvpGAGBt+WemOCE+vqKZ3QWpkFDU6Mjfk2mxvDTsmbHBKJyFaliq+0GpP7f/g7le0BbFi+PJvEMm0gKhujxBx2WpdwSRySwHZ+W5JbUh6kOsnrxK1Ejply4KdkUtmPqlLsYtN03/NadfJQN3xQfAkoL93bXoklD0uItBYl32RLtZtaTTB0GII/y1gH8a2WPwHiVqfBxfVil02i8kZsIaiRaink0Ag5Dr/+udWYpCiW0oFf00PIgApnCfvD/P/dJ2VDigitlH+7tumHePXJ+1lCRU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW1rOXJoclJqbmd5MjVuSHpXWVkyWVA0eXNZdGNkamhUbGVrVnZPdDNtUVQz?=
 =?utf-8?B?TXpORHZ0M3VMYU9DY2NQV3VHdTJYOGg3VlJoaW5aYTFxcVFyN0xyaXRKZCs2?=
 =?utf-8?B?K2FDVlhabUdPRDNNN2NPYUx3V2JPNExzcnRxNlcvcndubjZQUUNvbkUwVjBZ?=
 =?utf-8?B?SFVCMk1ZcnphYjgwRy9XWmR3VFFpS25La3lrSjNtYUFscng2Uzc2dE12eDFt?=
 =?utf-8?B?ZlByMDlPQjg3cG4wOFQxOEVqSTVKNlhCRXcyRGQwMXZJMzlkSk9QZmlTdVht?=
 =?utf-8?B?UFhOVHlMRGJYSHNHMkVpQXBkZERtM3ZPc3NBbHpheDZSRkphQTFUTWZtZGlC?=
 =?utf-8?B?c3RUcG5vK1JUNjRZL1VWcG1MOVZROWgxeDNwT3Z1M21wYVR4ZzgveGhIMkEv?=
 =?utf-8?B?dTN3WGl3TWRuZS9mdmEyK1RkUDIxRlI0MTI0b2VLS1YvMkVNZ1U4WDdhMGZs?=
 =?utf-8?B?WUNzUU5nRXFFMTNhd010eTRJVXdzMHZrc21EbE5TOG1rWGY0ZEttUlZwYWxR?=
 =?utf-8?B?bWUrZXR1Ty9UWjc3Z3BlQmdPaHc1UjhFeHlLWnBnQmRVRlZtdmtDY1JkV29k?=
 =?utf-8?B?TFFZQjhaZC9ER1ZEVk9pdTFKZkpNOG5qQVZ1YWcrdk1PQVZkRWlSTXArK0dQ?=
 =?utf-8?B?ekFKU0ZWQ0FmV3hVOGhyTmNOVnJvcDY5VUhUQXlsZ0xVSUVSeUpjeG53UE5x?=
 =?utf-8?B?MnBFM1I1dmoxN25ndnJpS3dDV3NCK0EzbDF0cjhuYXA3cDNxMHljMUNoRnBq?=
 =?utf-8?B?V0daSUx5ZlZWRmt4Yzk0Qy9jOUFMNDdmaGlic3lnSXhiYjJ0Z1c2ZlJPUTgx?=
 =?utf-8?B?N3VIeEZFTkpmUEhlUnZxcHVJK0lSMEIrdm03ZUoyQzVFTE1jZzEyN2x5cHBp?=
 =?utf-8?B?VTE5QXA1dVJpbENIeXR2cnplN3gwU3hIbHM5dmdpQ1RtclRkTjRSaGFrRi95?=
 =?utf-8?B?ZTdmQ05YREtvWEJPSjBZUlpYSnZNVHVQcXNUSXluT24yN0hIY0tOaS93V09m?=
 =?utf-8?B?MVpzdUhMQThOKzE4ZDFWUVdjVkZPOHRaTjEwMzJkek5jOTFPdTZRYS9uS003?=
 =?utf-8?B?ZW1hWkM2VUpjZndPODVMUlNiM0FnWU9idkJDRmREZE1pS0p5WXQ1emhZT0RC?=
 =?utf-8?B?ckYva1VOdXNrMmgxWFhwYWd4M0hPS25TV2Z3WTF5VzFoUTV3UlR5SDJnWm8r?=
 =?utf-8?B?ZG4yZVd1bjE5K2J0d1Jub1VwL28zWlhxbjRFbDk0dXo2N3JiUDlRRXd6SVl6?=
 =?utf-8?B?K3I3R0RHakJ2MjFZeFJ3TVdYUnJIb0pYVm5IemE4NndHNm83VEltWnF2WjNU?=
 =?utf-8?B?SUQvcXJOL0s0eGZhU2o4ZjRVM1NsdDB6dnFZZS81TjVkSEs1L0tIbHFtZDJH?=
 =?utf-8?B?VlhaWWpXVStrTkhmWU40KzJsZ3VjSmR3NlRma0YxdDB2cXlzY3g4MVRGay9n?=
 =?utf-8?B?WEF1THZNVHVucE1QMjlKVkhiUlNzdDdQMTB5WXE4SHFrUFJPT0R2Y1N0R3Rt?=
 =?utf-8?B?ZVhKSlNkQXEyOGRNY1VlNFV0TzlJZzkrRVBsci9iblpTZEJWelA2QWc2TGxh?=
 =?utf-8?B?RldVaHIvS3BWN3lnWEFYZzV3Wmc3SmppdjB2emh1dVp5TGlxUncydUtiVkgw?=
 =?utf-8?B?T0NOenZRcFAyY2lPRGc2NzQvYlVXM1ZuWFJLbVA5eEtVajVOQ1pGVlZhclNM?=
 =?utf-8?B?UC9kK3BmVU5KdEs5TVQ4aUdFY3dkQ0d0blRjRE01c2plK1FpS3poUGU3UEFS?=
 =?utf-8?B?MWNhYXlhdnk5N3VTMytSS2tCYXBqOEZnemZXZzdrUUtaMGF4NkxzZkgybWgv?=
 =?utf-8?B?WVJlaXBTY24rQWppbTRIdzZMRVV1MVVsNHNHRXhUZkRkS0UxbzV5aWlGV2hN?=
 =?utf-8?B?bE95MDJPbUlvYmo0YWFSN0trTm9OOEZuUDBtcFV5TTBLbVQrQlo5U3VVYlJM?=
 =?utf-8?B?L0Rsc0NGQTZSWWpadVNHV3BJWXdCb1Jta0FaalBGYitySjV3ZWRGSE50cjli?=
 =?utf-8?B?RFFDNFJqR09VUUpCM3AzZEVINFBLdHNqK2RlWnFOMU5kR09vMUdoeVRPeEIy?=
 =?utf-8?B?RWExN0lnclRYSkc2WjU1TUN5V0RTYWhyNzRJQ2NScUd4M2ZPU3hKNkNFaW1O?=
 =?utf-8?B?ZnFmbWtoWUZ2YUtHK1h1Nk9yTlhpNzBaUk1Qc2Y2UVZQaHY3NTkxM1NIcEY1?=
 =?utf-8?B?Zm5mNFV1bkhmUEpNZ2RIVTZvT1NjeFBmUy85THdqSEY1OHMwQnQxampNS2di?=
 =?utf-8?B?QlQ1djFnS284UFhITGFmMlQxVzZoUVV2NnhXNENuaUNTbHYvQTU3UlRITDZU?=
 =?utf-8?B?T01ob1pRR1YrZWgvdEFSTFhGVnZDZ3FhYTJ6dnNDL0E5ZVlaMTdkU0lqWXNH?=
 =?utf-8?Q?rAlC+pjy7OiK1jfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jRWbEUg1nNbrJk5OipGzI5C/laxVBhM7hJ7a+yjkurtAAGVRkkVwk00w4oc9gnQkadyCV9kfFyF14AdFboNHTi6NFn7fDG6xg9Qn528SD+WagCVVpYT0GoYmlwBOz8eaCAIJ3zyXo1E1mr4QmliCmbUzwBzagwI8Ky59CXpXcGLU7zT2/KsE5VXONznVCaQpNtwBmybhvWomowrYqWIquoTSLRTprv1CZjQB/2O47oZc6kJY6JFcJ1HHo+2Xh2p71DDARsgF5WyWxm+6jQp5vzo21gS/cX8snn+Wgco7Oo0W1882ctvVVaQH81CCoO7gsqlVgLUWnjq5z/43OFa7mA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7461b3-fc14-4d8c-8167-08df3bf6d090
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 11:12:15.6214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GgCZJh2AebGV8MFHdbIz+dkynW0E9I9vjEMxr/xTY+0oEr7ldxu6ex1KTja7IFQdbPUCZCbXR+wCqg3SzQtnsi7j2F97F13qqPlCh3O/h7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7933
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX6pWA2s/QYsCt
 L1Uk9egNcIu9DPZ+mVAYQc1vCS5PeSzj1j9YzrLb42VZduBRNQNTgopyn+uPWVqZwjoNE83Qhaf
 uVqK56hJIpDmfz3EMIf9Pa2OJCNN19tctSnO+62TtuMpasdbL+QWp0WG2VuWQboDWNujF+8vyT9
 yJgAUU2w0uMhVQOTT8J29wQiOs2qJCrjnJGdf2I39jHCI8Ur6lonyDO7EAwPttGWGQ82OEA1YoT
 HK3+fuggkWZ8A6upI0MBSA0pYnHpTIAHC/jjfLLGq/C7FlsBHOw0rqqeNyijSbZ9vQwS717GzcG
 G6qCuQub58RksXA+YxnehVzuMtAxTKfyLBMQh5lOibzkXwt6cUOcWbAKTwng6aSjdbFuuAeW4c+
 Q0eOL59D20+8GTacUGCvHth08r0dXZSJm2i+ytWHcJ3vSQ62lItD/a7lAvXUhK5OsQLyDwEfdHF
 o4MzDbQMTQbqDif/oyg==
X-Proofpoint-GUID: _TxGX4ybMeMTB03C7gIxSsZzeb_z3VNd
X-Authority-Analysis: v=2.4 cv=NbBzRGD4 c=1 sm=1 tr=0 ts=6aedb613 cx=c_pps
 a=KmUIp0grITFNz0c0ipdWMg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=07d9gI8wAAAA:8 a=ag1SF4gXAAAA:8 a=JfrnYn6hAAAA:8
 a=OaMopffkENnI9dM0begA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
 a=e2CUPOnPG4QKp8I52DXD:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: _TxGX4ybMeMTB03C7gIxSsZzeb_z3VNd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX9hDiOpgDO3hs
 5EeHJPsEreMCIXlh2SoDo1Hn/JEwbcj1ILi8MuLwvBsO2O6VFveQzKksCJ+8+ndbeFV2qAFDJkH
 o4yWibHmUSv963gJt0PyxKLF1dRTmQmmxFbZ/6jak6VsC3AR7nE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVHVlc2Rh
eSwgT2N0b2JlciAyMCwgMjAyNiAxMToxNCBQTQ0KPiBUbzogRGUgZ3V6bWFuLCBDaHJpc3RvcGhl
ciA8Y2hyaXN0b3BoZXIuZGVndXptYW5AYW5hbG9nLmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBD
b25vcg0KPiBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaSA8RnJhbmsuTGlA
bnhwLmNvbT47IEpvbmF0aGFuDQo+IENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+OyBTaHVhaCBLaGFu
IDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPjsgUmFuZHkNCj4gRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+DQo+IENjOiBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtZG9jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gaHdtb246
IChwbWJ1cy9sdGMyOTc4KSBBZGQgc3VwcG9ydCBmb3IgTFQ3MTc1DQo+IGFuZCBMVDcxNzZQDQo+
IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAxMC8yMC8yNiAwNDo0NSwgQ2hyaXN0b3BoZXIgZGUg
R3V6bWFuIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBMVDcxNzUvTFQ3MTc1LTEgYW5kIExU
NzE3NlAvTFQ3MTc2UC0xIFBNQnVzIGJ1Y2sNCj4gPiByZWd1bGF0b3JzLiBUaGVzZSBwYXJ0cyBz
aGFyZSB0aGUgTFQ3MTcwIGZhbWlseSBNRlJfU1BFQ0lBTF9JRCAoMHgxQzFEDQo+ID4gbWFza2Vk
IHRvIDB4MUMxMCkgYW5kIHVzZSB0aGUgc2FtZSBQTUJ1cyByZWdpc3RlciBsYXlvdXQsIHNvIHRo
ZXkNCj4gPiByZXVzZSB0aGUgZXhpc3RpbmcgbHQ3MTcwL2x0NzE3MSBwcm9iZSBwYXRoLiBWYXJp
YW50cyBhcmUNCj4gPiBkaXN0aW5ndWlzaGVkIGJ5IHJlYWRpbmcgdGhlIFBNQlVTX0lDX0RFVklD
RV9JRCBBU0NJSSBzdHJpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBk
ZSBHdXptYW4NCj4gPGNocmlzdG9waGVyLmRlZ3V6bWFuQGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+
ID4gICBkcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWcgICB8ICA2ICsrKy0tLQ0KPiA+ICAgZHJp
dmVycy9od21vbi9wbWJ1cy9sdGMyOTc4LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysr
KystDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnIGIv
ZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnDQo+ID4gaW5kZXggZmQ2NjQxMzE2NDU0Li42M2Zi
NGQ1ZGQ4N2QgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnDQo+
ID4gKysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnDQo+ID4gQEAgLTMwNiw5ICszMDYs
OSBAQCBjb25maWcgU0VOU09SU19MVEMyOTc4X1JFR1VMQVRPUg0KPiA+ICAgCWRlcGVuZHMgb24g
U0VOU09SU19MVEMyOTc4ICYmIFJFR1VMQVRPUg0KPiA+ICAgCWhlbHANCj4gPiAgIAkgIElmIHlv
dSBzYXkgeWVzIGhlcmUgeW91IGdldCByZWd1bGF0b3Igc3VwcG9ydCBmb3IgTGluZWFyIFRlY2hu
b2xvZ3kNCj4gPiAtCSAgTFQ3MTcwLCBMVDcxNzEsIExUQzM4ODAsIExUQzM4ODMsIExUQzM4ODQs
IExUQzM4ODYsIExUQzM4ODcsDQo+IExUQzM4ODksDQo+ID4gLQkgIExUQzc4NDEsIExUQzc4ODAs
IExUTTQ2NDQsIExUTTQ2NzMsIExUTTQ2NzUsIExUTTQ2NzYsIExUTTQ2NzcsDQo+ID4gLQkgIExU
TTQ2NzgsIExUTTQ2ODAsIExUTTQ2ODYsIGFuZCBMVE00NzAwLg0KPiA+ICsJICBMVDcxNzAsIExU
NzE3MSwgTFQ3MTc1LCBMVDcxNzZQLCBMVEMzODgwLCBMVEMzODgzLCBMVEMzODg0LA0KPiBMVEMz
ODg2LA0KPiA+ICsJICBMVEMzODg3LCBMVEMzODg5LCBMVEM3ODQxLCBMVEM3ODgwLCBMVE00NjQ0
LCBMVE00NjczLCBMVE00Njc1LA0KPiBMVE00Njc2LA0KPiA+ICsJICBMVE00Njc3LCBMVE00Njc4
LCBMVE00NjgwLCBMVE00Njg2LCBhbmQgTFRNNDcwMC4NCj4gPg0KPiA+ICAgY29uZmlnIFNFTlNP
UlNfTFRDMzgxNQ0KPiA+ICAgCXRyaXN0YXRlICJMaW5lYXIgVGVjaG5vbG9naWVzIExUQzM4MTUi
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvbHRjMjk3OC5jDQo+ID4gYi9k
cml2ZXJzL2h3bW9uL3BtYnVzL2x0YzI5NzguYyBpbmRleCBhZWE3YjZjOTNlNzQuLmE0MmNkYzFm
ZTEyNA0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaHdtb24vcG1idXMvbHRjMjk3OC5j
DQo+ID4gKysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy9sdGMyOTc4LmMNCj4gPiBAQCAtMjMsNyAr
MjMsNyBAQCBlbnVtIGNoaXBzIHsNCj4gPiAgIAkvKiBNYW5hZ2VycyAqLw0KPiA+ICAgCWx0YzI5
NzIsIGx0YzI5NzQsIGx0YzI5NzUsIGx0YzI5NzcsIGx0YzI5NzgsIGx0YzI5NzksIGx0YzI5ODAs
DQo+ID4gICAJLyogQ29udHJvbGxlcnMgKi8NCj4gPiAtCWx0NzE3MCwgbHQ3MTcxLCBsdGMzODgw
LCBsdGMzODgyLCBsdGMzODgzLCBsdGMzODg0LCBsdGMzODg2LCBsdGMzODg3LA0KPiA+ICsJbHQ3
MTcwLCBsdDcxNzEsIGx0NzE3NSwgbHQ3MTc2cCwgbHRjMzg4MCwgbHRjMzg4MiwgbHRjMzg4Mywg
bHRjMzg4NCwNCj4gPiArbHRjMzg4NiwgbHRjMzg4NywNCj4gPiAgIAlsdGMzODg5LCBsdGM3MTMy
LCBsdGM3ODQxLCBsdGM3ODgwLA0KPiA+ICAgCS8qIE1vZHVsZXMgKi8NCj4gPiAgIAlsdG0yOTg3
LCBsdG00NjY0LCBsdG00NjczLCBsdG00Njc1LCBsdG00Njc2LCBsdG00Njc3LCBsdG00Njc4LA0K
PiA+IGx0bTQ2ODAsIEBAIC01NDAsNiArNTQwLDEwIEBAIHN0YXRpYyBpbnQgbHRjMjk3OF93cml0
ZV93b3JkX2RhdGEoc3RydWN0DQo+IGkyY19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsDQo+ID4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgbHRjMjk3OF9pZFtdID0gew0KPiA+
ICAgCXsgLm5hbWUgPSAibHQ3MTcwIiwgLmRyaXZlcl9kYXRhID0gbHQ3MTcwIH0sDQo+ID4gICAJ
eyAubmFtZSA9ICJsdDcxNzEiLCAuZHJpdmVyX2RhdGEgPSBsdDcxNzEgfSwNCj4gPiArCXsgLm5h
bWUgPSAibHQ3MTc1IiwgLmRyaXZlcl9kYXRhID0gbHQ3MTc1IH0sDQo+ID4gKwl7IC5uYW1lID0g
Imx0NzE3NS0xIiwgLmRyaXZlcl9kYXRhID0gbHQ3MTc1IH0sDQo+ID4gKwl7IC5uYW1lID0gImx0
NzE3NnAiLCAuZHJpdmVyX2RhdGEgPSBsdDcxNzZwIH0sDQo+ID4gKwl7IC5uYW1lID0gImx0NzE3
NnAtMSIsIC5kcml2ZXJfZGF0YSA9IGx0NzE3NnAgfSwNCj4gDQo+IFdlIGRvbid0IHVzdWFsbHkg
YWRkIC14IHZhcmlhbnRzIHVubGVzcyByZWFsbHkgbmVlZGVkLg0KPiBMZXQncyBub3Qgc3RhcnQg
dGhpcyBoZXJlLg0KPiANCj4gPiAgIAl7IC5uYW1lID0gImx0YzI5NzIiLCAuZHJpdmVyX2RhdGEg
PSBsdGMyOTcyIH0sDQo+ID4gICAJeyAubmFtZSA9ICJsdGMyOTc0IiwgLmRyaXZlcl9kYXRhID0g
bHRjMjk3NCB9LA0KPiA+ICAgCXsgLm5hbWUgPSAibHRjMjk3NSIsIC5kcml2ZXJfZGF0YSA9IGx0
YzI5NzUgfSwgQEAgLTY0NSw2ICs2NDksMTAgQEANCj4gPiBzdGF0aWMgaW50IGx0YzI5NzhfZ2V0
X2lkKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICAJCQlyZXR1cm4gbHQ3MTcwOw0K
PiA+ICAgCQlpZiAoIXN0cm5jbXAoYnVmLCAiTFQ3MTcxIiwgNikpDQo+ID4gICAJCQlyZXR1cm4g
bHQ3MTcxOw0KPiA+ICsJCWlmICghc3RybmNtcChidWYsICJMVDcxNzUiLCA2KSkNCj4gPiArCQkJ
cmV0dXJuIGx0NzE3NTsNCj4gPiArCQlpZiAoIXN0cm5jbXAoYnVmLCAiTFQ3MTc2UCIsIDcpKQ0K
PiA+ICsJCQlyZXR1cm4gbHQ3MTc2cDsNCj4gDQo+IFNhc2hpa28gaGFzIGEgcG9pbnQuIEl0IG1h
eSBiZSBiZXR0ZXIgdG8gc3RhcnQgdXNpbmcgdGhlIHNhbWUgYXBwcm9hY2ggdXNlZA0KPiBmb3Ig
Y2hpcHMgd2l0aCBubyBjaGlwIElELCB3aGljaCB3b3VsZCBiZSBzb21ldGhpbmcgbGlrZQ0KPiAN
Cj4gCQlmb3IgKGlkID0gJmx0YzI5NzhfaWRbMF07IHN0cmxlbihpZC0+bmFtZSk7IGlkKyspIHsN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPj0gc3RybGVuKGlkLT5uYW1lKSAm
Jg0KPiAJCQkgICAgIXN0cm5jYXNlY21wKGlkLT5uYW1lLCBidWYsIHN0cmxlbihpZC0+bmFtZSkp
KQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gKGludClpZC0+ZHJp
dmVyX2RhdGE7DQo+ICAgICAgICAgICAgICAgICAgfQ0KPiANCj4gPg0KPiA+ICAgCQlyZXR1cm4g
LUVOT0RFVjsNCj4gPiAgIAl9DQo+ID4gQEAgLTc3NCw2ICs3ODIsMjAgQEAgc3RhdGljIGludCBs
dGMyOTc4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICAJCSAgfCBQTUJV
U19IQVZFX0lPVVQgfCBQTUJVU19IQVZFX1NUQVRVU19JT1VUDQo+ID4gICAJCSAgfCBQTUJVU19I
QVZFX1RFTVAgfCBQTUJVU19IQVZFX1NUQVRVU19URU1QOw0KPiA+ICAgCQlicmVhazsNCj4gPiAr
CWNhc2UgbHQ3MTc1Og0KPiA+ICsJY2FzZSBsdDcxNzZwOg0KPiA+ICsJCWRhdGEtPmZlYXR1cmVz
IHw9IEZFQVRfQ0xFQVJfUEVBS1MgfA0KPiBGRUFUX05FRURTX1BPTExJTkc7DQo+ID4gKwkJaW5m
by0+cmVhZF93b3JkX2RhdGEgPSBsdGMzODgzX3JlYWRfd29yZF9kYXRhOw0KPiA+ICsJCWluZm8t
PnBhZ2VzID0gTFRDMzg4M19OVU1fUEFHRVM7DQo+ID4gKwkJaW5mby0+Zm9ybWF0W1BTQ19WT0xU
QUdFX0lOXSA9IGllZWU3NTQ7DQo+ID4gKwkJaW5mby0+Zm9ybWF0W1BTQ19WT0xUQUdFX09VVF0g
PSBpZWVlNzU0Ow0KPiA+ICsJCWluZm8tPmZvcm1hdFtQU0NfQ1VSUkVOVF9PVVRdID0gaWVlZTc1
NDsNCj4gPiArCQlpbmZvLT5mb3JtYXRbUFNDX1RFTVBFUkFUVVJFXSA9IGllZWU3NTQ7DQo+ID4g
KwkJaW5mby0+ZnVuY1swXSA9IFBNQlVTX0hBVkVfVklOIHwNCj4gUE1CVVNfSEFWRV9TVEFUVVNf
SU5QVVQNCj4gPiArCQkgIHwgUE1CVVNfSEFWRV9WT1VUIHwgUE1CVVNfSEFWRV9TVEFUVVNfVk9V
VA0KPiA+ICsJCSAgfCBQTUJVU19IQVZFX0lPVVQgfCBQTUJVU19IQVZFX1NUQVRVU19JT1VUDQo+
ID4gKwkJICB8IFBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX1RFTVA7DQo+IA0K
PiBVbmxlc3MgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywgdGhpcyBpcyBpZGVudGljYWwgdG8gbHQ3
MTcwIC8gbHQ3MTc1MS4NCj4gTm8gbmVlZCB0byBkdXBsaWNhdGUgdGhlIGNvZGUsIGp1c3QgYWRk
IHRoZSBjYXNlIHN0YXRlbWVudHMuDQo+IA0KPiA+ICsJCWJyZWFrOw0KPiA+ICAgCWNhc2UgbHRj
Mjk3MjoNCj4gPiAgIAkJaW5mby0+cmVhZF93b3JkX2RhdGEgPSBsdGMyOTc1X3JlYWRfd29yZF9k
YXRhOw0KPiA+ICAgCQlpbmZvLT5wYWdlcyA9IExUQzI5NzJfTlVNX1BBR0VTOw0KPiA+IEBAIC05
NjIsNiArOTg0LDEwIEBAIHN0YXRpYyBpbnQgbHRjMjk3OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50KQ0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHRjMjk3
OF9vZl9tYXRjaFtdID0gew0KPiA+ICAgCXsgLmNvbXBhdGlibGUgPSAibGx0YyxsdDcxNzAiIH0s
DQo+ID4gICAJeyAuY29tcGF0aWJsZSA9ICJsbHRjLGx0NzE3MSIgfSwNCj4gPiArCXsgLmNvbXBh
dGlibGUgPSAibGx0YyxsdDcxNzUiIH0sDQo+ID4gKwl7IC5jb21wYXRpYmxlID0gImxsdGMsbHQ3
MTc1LTEiIH0sDQo+ID4gKwl7IC5jb21wYXRpYmxlID0gImxsdGMsbHQ3MTc2cCIgfSwNCj4gPiAr
CXsgLmNvbXBhdGlibGUgPSAibGx0YyxsdDcxNzZwLTEiIH0sDQo+IA0KPiBTYW1lIGFzIGFib3Zl
LiBQbGVhc2UgZG8gbm90IGFkZCAtMSB2YXJpYW50cy4NCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRl
cg0KPiANCj4gPiAgIAl7IC5jb21wYXRpYmxlID0gImxsdGMsbHRjMjk3MiIgfSwNCj4gPiAgIAl7
IC5jb21wYXRpYmxlID0gImxsdGMsbHRjMjk3NCIgfSwNCj4gPiAgIAl7IC5jb21wYXRpYmxlID0g
ImxsdGMsbHRjMjk3NSIgfSwNCj4gPg0KDQpIaSBHdWVudGVyLA0KDQpUaGFua3MgZm9yIHRoZSBy
ZXZpZXcuIEknbGwgYWRkcmVzcyBhbGwgY29tbWVudHMgaW4gdjI6DQotIGRyb3AgdGhlIC0xIHZh
cmlhbnRzIGZyb20gdGhlIGJpbmRpbmdzIGFuZCB0aGUgaTJjL29mIHRhYmxlcw0KLSBhZGQgbHQ3
MTc1L2x0NzE3NnAgYXMgY2FzZSBsYWJlbHMgb24gdGhlIGV4aXN0aW5nIGx0NzE3MC9sdDcxNzEg
YmxvY2sNCi0gc3dpdGNoIHRoZSBMVDcxNzAtZmFtaWx5IGRldGVjdGlvbiB0byBpdGVyYXRlIGx0
YzI5NzhfaWRbXSB3aXRoIHRoZQ0KICBsZW5ndGggY2hlY2ssIGFzIHlvdSBzdWdnZXN0ZWQNCg0K
SSBleHBlY3QgdG8gc2VuZCB2MiBuZXh0IHdlZWsuDQoNClRoYW5rcywNCkNocmlzdG9waGVyDQo=
