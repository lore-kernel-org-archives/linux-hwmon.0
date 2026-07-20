Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684EF25B0B5
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514326; cv=fail; b=WnpiP/COeVpdCZK/kMQwVKv6HONDgjkemKvTOxFyfZe1zPsZvCrEM95E6yiJF89fmgiFn1VRrjtT2bHbvTLR/BAlK4PTp5G/V6djZweIxHPMV+50LO0sWk1MzKEGtTAtWm0zLVtCRDLMms4ZbkqAfB0//tCg369/V2F/hhgyY+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514326; c=relaxed/simple;
	bh=aRG84Oo5YizzGtpmv5LuEaToirrAtMl1/dxrUFVPPpM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UZ/VqwrNnUULcQcUnFSqz7OL77b9uz2vR9+vDJo65aiKmFMNLdLUfjupD35zYzSq9ZC4I4kwyXVkV8wFob5Ypf9EGURg1XmqczCnyyV9qxl9z+L2h/Kcg6x65zqvQDWS2hp/p20DIGXG06qCcbqNop+7bthkXGrlE+T93Y3hH+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yMAsGBjV; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yMAsGBjV"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNs7ia3343629;
	Sun, 19 Jul 2026 22:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=aRG84
	Oo5YizzGtpmv5LuEaToirrAtMl1/dxrUFVPPpM=; b=yMAsGBjVuh/L3sAP968+b
	CFtIaoFGsZx4mHb90MZTVB+OFyYca/32D6Cey9z5hnI5/pLjSqhtUqL72qNYY8NN
	V3iW9KP538wA17UWe0jQpoJI/U3fO9BmZy2PEybDxp3nFz1PeH1fSLtDhyxAGHhO
	VwZFTbwbEd8SphXG9/vW4AM8ADNaxhY0TqxSJVxiNZYmK11kFzwjKDKAEDwWh7b3
	6GtpN22+70BhthSplWkiarIpp5x9rjV0fyShVrmYwsn4lcHAQMmN4u+XhB+Mn8ET
	RPUimVkx5+0I5XEzTzT4akDUZrCZNBu2P4S+4AHdlAH+f/LS63ScF4NOFUjbK9qh
	g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fg644bxxv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 22:25:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/HxjaDSrjKGcnab/quS36pSsf9CkrECaZ6j4QRSLk2pE9MojxHwGS9bdGRnxH9DKjqzNaaoa9+gPdnmiOzsrLZFJYnwGWRKDweGmFqt1tgNc1+7O4U6GkkWIm3MMZChR13kQ9fXVFaJcjH4E8EnDwJw8ElOICkDxqyqzerFpeBghka3zxSd5xsVDPAMaDYS1JYGodUv0e9WGJQfXvZuvpjTUkvW94DeJnZRxFao749dm/tyig+XwoIaT4yXCKXvseoY57BkIOE6J6cM+kwdxeeIPb95lG5m9SENxnf5z0razrtampVAQeJ/ytfvAc2LTR/pJWY3WLMvmBQlXbqqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRG84Oo5YizzGtpmv5LuEaToirrAtMl1/dxrUFVPPpM=;
 b=Xe845dIDaC2KFa2CWD+bL4FisTPgb/PTeECFhrXmBRZwZ+LiJMwJCJqRzA5oZrognhk2U6N62uik1O2r5+0ncmsSbzaVV+hy4Rn0or9XioIiOI0LYl7oPBQ/0fWFuy5cit0iRZIAWmHt93VoMc3tr1HwpxXSnyZBx27y2iN7JLzcPtDO5A0f/p4kFqlFmucmm9dKiXI1ZZYsShXbxBeODPxzHUyLUU044kndehCMmLD0d4uD3ELr6fiYA8E3I2KQw+Osf8W5z6TesLnA138NBXUsAwiPkDzMxnaWNBN3dFGNpT0Z0gTUbK8T+XmKK+s3rFJYxWttkQJJiNeDiU36Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by BY1PR03MB7876.namprd03.prod.outlook.com (2603:10b6:a03:5b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 02:25:07 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 02:25:07 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Topic: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Index: AQHdFP0KHG1nLTwPxUSiOhrbWS5u6bZv0jOAgAUR3gCAALLXIIAAGG8AgAAESgA=
Date: Mon, 20 Jul 2026 02:25:06 +0000
Message-ID:
 <PH0PR03MB63515017409892FCCC9E45F2F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
 <20260716083544.1B5B91F000E9@smtp.kernel.org>
 <eecfb767-972a-4b21-a088-d7c7b68c29c5@roeck-us.net>
 <PH0PR03MB6351C0B2AFC4CDD92F67AACBF1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
 <0b555e2e-f687-4ea2-8b7d-cd80342fdaf0@roeck-us.net>
In-Reply-To: <0b555e2e-f687-4ea2-8b7d-cd80342fdaf0@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|BY1PR03MB7876:EE_
x-ms-office365-filtering-correlation-id: 773be27e-1b95-460b-849b-08dee6061d64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 1X9z8qY2effQVYjx+G01cwTU9HXVrcKgrYnmjN2NQ0PzPpgfD+O/6pVlYPXU6rRIcCwK/hVOVWds9S00TMG29vd2qIIEHWLlYe+trwi1F+2WSCN5oYjNpvNhV3xDQLkvKLdQCc1BlDd9ea4lWqJ5UeYhv8VDShswYQ7OgORZwfMGnXLxmtQBFbyvp94WCIZDfIV8kyW838c1lxGyVcqg4/b4/Xa1OL6D8m/x/VOQu/k8HbCOkFS2cvm4kCbBhoZQQhi0GSNAzhr6b001S6BjXZkrBbBwx/cdkLU9MJxkdC5INVfpPdIoV0ASAJ3dyDvdzRUshml7Vdanqn7dYv2PE08hqGsUlKAdbwJOXYexlsTpqBf67bHdqDbp9pdQBkplzTG5Nc2BuRpJgECgRtlkfnO+X2kO9vhsEdQLoWhTnAQQOXQ+kqvAMDjGKdR/laPHM51ktZSMjdxMZ5UdmDgbUhk67qlyVLsF7sXEc/emiXpwP4fJSZ4SKKh6+5hF9wVIGRegBIqaDSHtYyxzhtM7OuRie2LL77FepVTgxllGlbwwc4j6mw0CgHJryzddextpjNkgS6hRgUfei4l148XF4TQcBYvbM1pKlzptr45W9QB1UfgWStFMnQELpIQ7vseUdoU6p79tRFej2aYhlnG4DjlALRRh3EDB6z9C8f1QFWuZIVzHs6YLD8HTjCpXS5Yu7SmfgYiuiGCz+R8r55hHVJ4hUbtkB6y8A0s3fzHNLBI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXI5RDFPaHdQWHVoY1ZYTVJYdDFLcEVzcTBKTXJXeGVYQThmbFBRaFgzZnhq?=
 =?utf-8?B?TmJxOEZJRUwrNHFqeUhTa2RJTVdLZ3puTE50SEFoc0I3cjJxZ0FGWmMzOW8w?=
 =?utf-8?B?N2ZpL2RKWVhabHFqeEVQZWd5SWlRWXFmckU2dzRDSm9uc1lzTnlqbzAyd0FG?=
 =?utf-8?B?WHd5ME1FQ2M4b1cydk5aRGJIRFBNem5GWENhcjlEblBoVGFuZWNDYk90QW9m?=
 =?utf-8?B?RllOSmZ2VWsyU0o5ZGV0QW9YOHRHdmpnMWlrREpGekI2NEIvTDJpdnBHM2I1?=
 =?utf-8?B?SXBDRVlWM0UrMjI4WWcyeHFQa1Jid1U2SE8vY1V5Q3Z0aHN4emxrTW9sYVJB?=
 =?utf-8?B?UUJCRU1qWDVZR2JpQU9ydFEwbk5tUWE4SkVNZGRLa21oQXBsREwxVVdqN0gw?=
 =?utf-8?B?TlFYeEllN2tMMVN0bWxPTmwrVE1PaENkRnNjc2ZJRkt5SE1xTEFvUitnbEN6?=
 =?utf-8?B?SUxSS3hZR3FhTi9sS25OWVBkcDc3T0dFK0VzWlVOU0kwMTBucEd5YkdubWly?=
 =?utf-8?B?Y2VnSzZDTlNHci9JNVRsSENkd1o2NHQ4YXdXY3IydDdBcWdpT3VNRUhvRlQ4?=
 =?utf-8?B?d010QWNMVCtTSUtWNXczV1lDcUc4VzNWc1NqWkQwYy9TaWRmc2VmZ0ZLVEdo?=
 =?utf-8?B?b05jNWJneW5QcS8zSmZCYS9ueTRmM20rVk1uOG9QR05xamFRenN4VzI2N1FT?=
 =?utf-8?B?Z0dXbEM5STZ4SXBGWThaV3BIenhDaHRZK0hjRkNwQ3Q2RmZkZHNUSzg3aFRu?=
 =?utf-8?B?UTdlSzA3MEwxUzZyUi9ndHh0Y2xLZHJIV2dOSnhFOGxDRXJrbTA3R0J3WmNt?=
 =?utf-8?B?VE1PbUE5cEZBTnUwMjFHbStaTFlTMG1RSDA3VTFDb3pDK1FZbUFyek9KVVI0?=
 =?utf-8?B?cHRkVVdlT25KbVpQeGFtWmVxNkliSm1TbStQSG91VmdUai9WM3hLbDliNm1q?=
 =?utf-8?B?YlNCeE5xUWJ5eFFRcUxXTGh5Tk5GTjVJRlRkK3dydnptNmRLdmNUNkgzZmts?=
 =?utf-8?B?MGpPYmtiU0ZQMEFrS2liNCtvM2xUR1ZLRFZXYnlQMTFRcnBkVHZ3THpJNi95?=
 =?utf-8?B?TDN0MFJoek9Fd0w5MEVzbmVXZGJqS09IUUlwU25NcmFtWXBiTVNvb0dwc3R5?=
 =?utf-8?B?Sk13UlNCNjRhNm00NlljZFZMK21tU1M0SW05QUhIcFBUOEN1OVg3bmpiT1N4?=
 =?utf-8?B?d21jYmgrOG0rSjg5MzhLY091bUYxRnhObnBObXFoVEhQaFJIeXN6V3JLZzlv?=
 =?utf-8?B?ajVZb05hRmRQdkhLeWt3YmM0Y0IwL3NJa2o2VExTYUpyWDd4M0E2YkNqTE9j?=
 =?utf-8?B?L3lyWjMvOGtRRUlrSVMvM2lkZWRQWDZUUWhsR2k4K3RMay9mdFZ4Z1JLSlpS?=
 =?utf-8?B?bHllRFV5NTJNYTdVZU01a0p4ZTRrczBvZFVvZ3ZnU3NUSkVQK1RySGR3cEFk?=
 =?utf-8?B?aEs1YjJKMjgrY2Frc2oxZmVFYlduMzJJSFg4dXBBaTFjelRKZ2FzZTduSG5v?=
 =?utf-8?B?YzEydDU4bVZ6MFNjVExPZ05LdXU2MjRuaWtEeDMzR1gzbXZEdEJlclh0Tkhr?=
 =?utf-8?B?M3BoNVlwb0VYUWRYU2RlWk9ydFZJQWpkZW9SZEJNby9JSHE2SzB6S05WaW5F?=
 =?utf-8?B?a2tzR1lXNjVMaUpoTFJGS2dQMUV2dVZ2OUl2akxleGRjVHorZlZJZlo3ZEcx?=
 =?utf-8?B?TmVPcXF1Y2p4WXhSdHpzQXBvdzg5L3R1RVVNR1o4eWVBcnFPYnlPbllFbkVu?=
 =?utf-8?B?aDNqU25mSTlNZExiR1ZEV0p1R08zWmU5dkh0NjhlSHh4eVUzd0x0VXVROXZp?=
 =?utf-8?B?Z29CY1VvWVB1Y2hzdEpiYzB1LzBPZU9ITEw4b1FKYStTOHdzZ3hiQXN4YTZh?=
 =?utf-8?B?d1F3WjdrWEFmbzlnMTZvQmNOUnBVc00rNzJmTktBSDJWZDZPV2NEV2ZOUSsz?=
 =?utf-8?B?Q2xFLzJKMnlESDVxSkFNQk05RFhBdFYvSUhmUkJPTDg2STNuV2RoOEdrQ1Vx?=
 =?utf-8?B?WXhLRE1YRTVnWEl0TmR0V3diTURkakZ5cmxaU1c0WWdlSll5VXhtTXRCM1Fq?=
 =?utf-8?B?Q2JPYnVPekt5TlpvRndSYU5hc21yakpCYTMwWi9EaE5TczBWMFU1NTJBeXdx?=
 =?utf-8?B?SXdDRk53RVczenNZRmhJVG1qTjNxd25rNUNaeVlTYi9uUVp1dENYTVgyWjNO?=
 =?utf-8?B?ZWFnVHd2d3FyL3dDaWg4M3hoVmZtYm5GR0hBdFpvbUJGSzJjNmFlME80d1Bm?=
 =?utf-8?B?OU00OHY3c3ZNa3pPdE5Ib3hQeEJDZXBMak1mSFFaMnZheXJWZENPQkc2VkNH?=
 =?utf-8?B?Mkk3N0ZWdmx3S25PTmhvOU0ybG9jaU02MnhQbWJJT3N1bHlYeHFxSW85SkVk?=
 =?utf-8?Q?tmwjDk1YVTGIe+wE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	eaZyDvI4pmXPqjEiiCO0E4KMyf023umfTVuucaOpWU+pVUJy2YznDt0DDfCoJqd8ll79yhFXYfnd6do1ZAUSwV+tkt2qRGd50kp0H4adbEmgWVHvowZtbTYfMWv9D5po1u61M3tw/gwqagYUaIm+ll/xXg9ivnlEAtk8FeSXNx8Kzqv7TW26Ok8Q/2nYpJAwpT/yLe3g/xvyC+w6oxUQCEHlTUe16TmUJxaqpX2ng+y8HF9E1jq+vB74VK3k/yNzxAY4TbqnmXLmtsoweR8QolA39m7flntjBIZ2MDxP09RcJtqqRVK2JJM5+v6oKCv7JT4smUPxJajTXu2CGAviLw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773be27e-1b95-460b-849b-08dee6061d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 02:25:06.9875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UMXcZ6yUOMFoSkJTf5zIkweVvDV2XwBuRqAD39gNVzxkm+bJW7hvmCx1fokK7z6hGtN1kZZHcYcAWIvatrsC3oYBjQZCbWq2xE6dwKNxjU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7876
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyMyBTYWx0ZWRfXzcn9aeFQskpt
 PIfL24E2F4Sk333pSafmEGV74gOPD9YgIKdyBgcPG4mk5ogKHEutqE6ZZ2nddeD9JYS6pgT0j/W
 Ak9w2p7NziYXBJw8SMZUMPSGRZhTlXG6g7ckx+lLy6sY+FIlS2K/
X-Proofpoint-ORIG-GUID: puJHcwzlBawuFQ1KevVM1Sdvw2O4P9hR
X-Proofpoint-GUID: puJHcwzlBawuFQ1KevVM1Sdvw2O4P9hR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyMyBTYWx0ZWRfXx+9NkOawmC1r
 f2XkGWSJQI1DdtJh9vshn7h/htf5+ngfOmUSXoOYdc9v+2D/SE2bxYCETA0C56xDDDAPjNQh0vM
 q19CKkO2sxep2rj8StVmxgI3TGLYWF9WquaDwE2sTG7cTj4sxkywGzyrbS1xjqhRSN21TAIZdSx
 pSJviLi23KDlOxBPvkrAhLzIARCVOpGRuDuy958EnG2n4OvLAuK/3xf1zzfVov3w/9+fk//GUNj
 C9ccSzY4arKJLdv5UjHcC3mlBAffE+PxGPXFuCytNdscEdkVcLQmO8Qi56dO4Q8e8EOuldw7ijU
 13/PVAjmdu2Jfxl4zIzrHTgnlUGqp8zRk06CjvxJeG4z2PgJ4qpyMy8i3EWozmoJcb5i7yplFRZ
 TRSMIx7cEkjVb6aXiBSOy2Qsb0sPzFR8zMyRIaUasTIKw/KT88rNcLgJbIelnlIl9AtzfZEHceq
 vlEScTxtWuM9n7ozqHA==
X-Authority-Analysis: v=2.4 cv=McdcfZ/f c=1 sm=1 tr=0 ts=6a5d8705 cx=c_pps
 a=w8e6fJRD9yN2bKWo9pBaJQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=_jAD5XSDOtq9-5Nde2OG:22 a=CyfIlk1qopnS0zpzXr4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200023

PiA+Pj4NCj4gPj4+IFRoZSBjb21taXQgbWVzc2FnZSBtZW50aW9ucyBhZGRpbmcgc3VwcG9ydCBm
b3IgdGhlIEVUTkE4KyB2ZXJzaW9uLA0KPiA+Pj4gYnV0IGlmIGEgc3Vic2VxdWVudCBoYXJkd2Fy
ZSByZXZpc2lvbiBwcm9iZXMgd2l0aCBhIG1hbnVmYWN0dXJlcg0KPiA+Pj4gcmV2aXNpb24gZ3Jl
YXRlciB0aGFuIE1BWDM0NDUxRVROQThfTUZSX1JFViAoZS5nLiwgMHgwMDE1KSwgdGhlDQo+ID4+
PiBvdXRlciBjaGVjayBydg0KPiA+Pj4+ID0gTUFYMzQ0NTFFVE5BNl9NRlJfUkVWIHdpbGwgZXZh
bHVhdGUgdG8gdHJ1ZSwgYnV0IHRoaXMgaW5uZXIgY2hlY2sNCj4gPj4+IHdpbGwgZmFpbC4NCj4g
Pj4+DQo+ID4+PiBUaGlzIGNhdXNlcyB0aGUgY29kZSB0byBzaWxlbnRseSBmYWxsIHRocm91Z2gg
dG8gdGhlIGVsc2UgYmxvY2ssDQo+ID4+PiByZWdyZXNzaW5nIHRvIHRoZSBvbGRlciBFVE5BNiBj
b2VmZmljaWVudHMgcmF0aGVyIHRoYW4gcmV0YWluaW5nIHRoZQ0KPiA+Pj4gbmV3ZXINCj4gPj4g
RVROQTggb25lcy4NCj4gPj4+DQo+ID4+PiBDb3VsZCB0aGlzIHVzZSA+PSBpbnN0ZWFkIG9mID09
IHRvIG1haW50YWluIGZvcndhcmQgY29tcGF0aWJpbGl0eSwNCj4gPj4+IHNpbWlsYXIgdG8gaG93
IEVUTkE2IGlzIGNoZWNrZWQgb24gbGluZSAzMjg/DQo+ID4+Pg0KPiA+Pg0KPiA+PiBQbGVhc2Ug
Y29tbWVudCBvbiBTYXNoaWtvJ3MgZmVlZGJhY2sgZm9yIHRoaXMgYW5kIHRoZSBuZXh0IHBhdGNo
IG9mIHRoZQ0KPiBzZXJpZXMuDQo+ID4+DQo+ID4NCj4gPiBSZXBsaWVkIHRvIFNhc2hpa28gb24g
Ym90aCBwYXRjaGVzLiBBcyBwYXRjaCAxIGdvdCBhcHBsaWVkLCB3aWxsIHdhaXQNCj4gPiBmb3Ig
aXQgdG8gYXBwZWFyIGluIGh3bW9uLW5leHQgYmVmb3JlIHNlbmRpbmcgdGhlIGZpeGVzLiBUaGFu
ayB5b3UhDQo+IA0KPiBUaGF0IHBhdGNoIHdhcyBhIGJ1ZyBmaXg7IEkgYXBwbGllZCBpdCB0byB0
aGUgaHdtb24gYnJhbmNoLiBJIHBsYW4gdG8gc2VuZCBpdA0KPiB1cHN0cmVhbSBpbiB0aGUgdXBj
b21pbmcgd2Vlay4NCj4gDQoNCk9oIEkgc2VlLCBUaGFua3MgZm9yIHRoZSBpbmZvLCB3aWxsIHNl
bmQgdGhlIGZpeGVzLg0K
