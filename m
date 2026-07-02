Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BF22AE48;
	Thu,  2 Jul 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977312; cv=fail; b=CbzloZYYBJZ+1TZe4k8yVijk0MyQoS47RpxWVmqAu3/6hfRJL5WWcFILh0Ma3axc1nG//uZXaVFHY+1rmZYFct+vLWDR/WAGzWBz+7fhRlnPkSa98fN/u/XInbwx0rqFazaica5zMzmgTqIHs1cd1lKxZ48fvKU91caWNqK+b9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977312; c=relaxed/simple;
	bh=o1NV7cqZ37E/EO7g/v0v/5fkd2EjpPNVtIjUZ11Eno0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yhk8j/jl6WkeXxOKHGvZtFxtiePNqZmfXoul9Iak6NEHxqqYzU1KHw2M//P5/3gb/LvA8QGMne8SUSl3ajOA6wa5K7z9LcczGuXU5ogYnMgDX4ekcRQjZgRVTZ3pIhNEwykkV0PZm6KooXSKykTa93FBFPPfelkQQgN/hYSNEJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=eNYmNGYm; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="eNYmNGYm"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66276n2Q1100149;
	Thu, 2 Jul 2026 03:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=o1NV7
	cqZ37E/EO7g/v0v/5fkd2EjpPNVtIjUZ11Eno0=; b=eNYmNGYmK1A8qsT6az9wE
	B5XSlsefp4R7vTVCIXhNZ/eo9UpKdD6NB27J9hZaVJ06YeAvgkBKVJRyj4Sejnks
	gwWfp/bxMUWxPBUaZ6rO1W/xoKuMR1fzFvePCStlUaK+l8WBXx2eHSImLsrL9Nmf
	y2qOV93RsM2Go24+znkDT4YZmHGwZx/cOzCEGhbwRcNYEhwnGX1ab8lhTNAYkPzp
	VpsTiuB4X7M8uess0aobzrQRIi/bXm+LVT8krsy7HBlS1Knb+z32yXk3lZAJ1klJ
	313uCGbU+tT7+bqFfvGictUCJEnXcJQE5kXHQXqajsLxODKcXAZgDgNcnz3wGW61
	w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f48ehktj2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 03:28:04 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o27gk3+OPAHddjSeGySQUQ7C7JJdMWND6O8IwPN2wZEdDNXYyFXkocNNkaOSJHyVbLYCBaPcNgZcHl9/TLXOEmalUJk21dvTGWlLDkx8VwW3+hAukE0cH8M5Sdj9HdxZaTPwzkyE4wqeVOL7bXOhUrkInVyfNL0eG8nPNOn3tyasT8tK9+6/SuksQnH/31qhhbYjqJ3sL39thUTPvLbXYOvLeLy7VsfsxODCYKL32Mw/PFOCYnhk9ZUF25jOpNTYlvwl8lGZBs9bNatvmlvimDpIw4wA75co2v78Lr0zcFzDxv6c+50btGAEfdoymO9jxU2xr9za6xKVq5l1dmIeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1NV7cqZ37E/EO7g/v0v/5fkd2EjpPNVtIjUZ11Eno0=;
 b=cYn0v4yeZJ7YQIiHa8oMC8EfuvVzucWVzy6Rhc443ZeXnR0jVpxsBvN4DhXJ1DkbLQU+0uxIKRLoZKu6qRQNMBAbhRGIoFX8dw32FR0FEXabISiMH0m5y7McYcyZ7gNZUN1tZ6BhW33xSVTiOprQRJz2+v+WQ8fDAEpJb2WSREDhhF5/2kvO+w6TKdQvo3S/0qSVi0/w8R05MUrGrH29J4EFWrYl9WdVpiGt7zYkVKtwhOZmYsdcJtBjxy6bUxf3ZWLNqO3Ayjxex7scPkkn8Li+/MV3RrF9YjoLabHwvgAGc4KfIBQA3Mr+kqUtWsreYE9oz0QFqxN2O43fsdHJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by IA1PR03MB8360.namprd03.prod.outlook.com (2603:10b6:208:5ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Thu, 2 Jul
 2026 07:28:02 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 07:28:02 +0000
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
Thread-Index:
 AQHdCDrPjQujEK8MeUujhrP1WqLJTLZWdMEAgABEj/CAAHm5gIACUkyAgAAkzQCAACqmkA==
Date: Thu, 2 Jul 2026 07:28:01 +0000
Message-ID:
 <PH0PR03MB635183281F0DF081731DE0D5F1F52@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
 <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
 <PH0PR03MB63514C57CA17984F0B6FEEC8F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
 <adfd2c4d-6d42-4aeb-9eff-6a059550ec80@roeck-us.net>
 <PH0PR03MB63510E27A6F22742D526C244F1F52@PH0PR03MB6351.namprd03.prod.outlook.com>
 <d3053a4a-98a0-4dfe-8999-11fc64fad584@roeck-us.net>
In-Reply-To: <d3053a4a-98a0-4dfe-8999-11fc64fad584@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|IA1PR03MB8360:EE_
x-ms-office365-filtering-correlation-id: 943bb29c-c0e2-4f41-67eb-08ded80b730a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|22082099003|38070700021|6133799003|18002099003|4143699003|56012099006|5023799004|11063799006;
x-microsoft-antispam-message-info:
 vlttQvSYKeVvCPa4ocqZBlNUV1D/lJN8PcSoQSZd8+qCV8ZorBXlkPi19PuoJauOCvd7CfBqHkgnqQULl6TW5maz9X0f3g07+fIH+Qe9/Hc978h67UeLVOAzAtcd8rkYfQxZ++VSMonZiUOsHLpLh2BM8zMcIfXvUVJ8vB7jSKqAQCTFvDhMd6sj8pwiLnFSVXN42VgOemUMT7hpPLVgWpQc0xsGQdQ9RcHTXcdP9rWldkOxGIEWnG9LuPyBcrJWsH7Y5yanS/y/H56pcQcLQWuaaXW2a6pToZpIWw6telBSzOnI5ZEpx12iBQCn/t6BD2OVWMErNTFj61GcpDgrkPKQLH+xUOy2Fj5gkBLwp+SuR1P3G5vWYXInkwy/86doJn1D4UwfO1P33TPFSBx+750vDR8SpCrYteCF4cKWrr2VO/a4j7NvDidRilYpR4UI5Q/CcnE0m3ScjaSV9AjP2bjhyjNCVY5y69RgxBMg3Tl0xpkUKPkT61JIr6Jt2ON9Brfnb3WPcGiuCCADhyhlg6NPbLtUTfQwkATy3Axt2zHEG7ci98D73TZFwb69oh8E5/l0fl7qBSAZ5Jo7t38geote2Qg5bLYIU9uIyIY5n2m/69/HV6izDNIHqfMTl5GgvRINL98WOdPXEROMGtw5RN0kVvvFHK14EpIZnTm46QR3Gud0MqnV0LoZtyIs5bPnMy4+T+rWOxJUhbCdE3ZGvQnC9kgLnxo5MnmJ5RZ6OXw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(38070700021)(6133799003)(18002099003)(4143699003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vm8zdlltM2lXSHEzUkxzWTN1Wm5kczNub09HaGx6dVVNVm1lbjlvbHgxenY4?=
 =?utf-8?B?N25VallDNEZhMXUzMGgvNlFqV203dTA1bUY1YWFjZjA2Mnd4NXhtYXdMQUtF?=
 =?utf-8?B?azI0NlNjSDBzV1ZZeVdjTnc5V21zTnRhWHQvTkxvSFdseGo5aFg4TzdGODFG?=
 =?utf-8?B?eHZHaGVIdCs4WHhNTkxVeGJsbG1IbDZOYkE5ZjJYSVNSQzI4MHJ6ZmFrRUdB?=
 =?utf-8?B?NDVqSzNlZ2ZHQzZaNFI2b3ltVDVQaEdpUlRSaXZlOWdRdGhnZHI0Zkp0N2Fs?=
 =?utf-8?B?ZmYvU2RRclgxR2Fud3Vaak12SmNIelZtanlNcVphL0NNaTFhMExlL3JDT2xV?=
 =?utf-8?B?R3NiV3prQlVEMHpUMnpHc1F2czlLVHE3elhUdk9uWGVJZEZxQU5uZ0JFWnMw?=
 =?utf-8?B?SVlZdFU0VGtmVXExOE9tV0VIcXErUldtR2dXV0J6YWxNbEV1RlROMFptZXJT?=
 =?utf-8?B?ZEozQ3AvaHJlYWRrdkhkWGZUZDRSTHh6WHdzMUNHNXQ5Z2dINDhxUWcwcEwy?=
 =?utf-8?B?VEpnM0srS1U3K0RBYmV1UFdGUWg5dGlCZ1liNFRYZ2ppV09GUmZKTEo2b044?=
 =?utf-8?B?cGRVTE5HRGlLVG1GcmJPb2k4V1VWR1N6YnNPSEJpWHlHK3pjSnQrd2cvRktG?=
 =?utf-8?B?UmU5NXNISFBGODQ1Vjh6dzFzcnphc0dpamhiR0J2RVJ5cU0rU3ROV29LRkZi?=
 =?utf-8?B?YVEzYUZmVENzdHpaL1AwSzlsb1JxdFE0UTdUZytQUDdSeWxDVFFlVi9NdUZI?=
 =?utf-8?B?SUIySFhodkZSUXlEUEpsbitoaGNPNUpPQ1k2MHFvTTVRSXNBSUJya0JqZXB2?=
 =?utf-8?B?ZFdGOTRRM2VHNGZkclVReGNuWUp1RVZmZW1NdGh4ZUVDckFpdHd3TkU3OUVE?=
 =?utf-8?B?R3R4aGxkUWV2Z25GT1hCZlp2R2JqT0t1T2kxOGV1NEE3bXZKNUM0UHhiTEtX?=
 =?utf-8?B?dGVGQjBaNCtFR3hYU2R1SG9qVWJkSWJ3TnRJQWx3UTlUcWJVNktsYmhwQTcz?=
 =?utf-8?B?QkxmR1J5MW5melk2VGp1QjRWbGFUN3ZDbCtQVkE3bWtRUDNRWVBGTWs2eENj?=
 =?utf-8?B?bVVFbjhETGRONit6WDBWdEJNbUl6OC9pNVcxQThabmhzUHZZY2g1VUJvdzd6?=
 =?utf-8?B?cjAvSDNBVGNmOWVjODhHcDA1MGQ2ajJiY1krendIVkhwT1FkQ0lBSG1XOXB5?=
 =?utf-8?B?VWJrUTNvR2tVbGwrT0dsYUFBS1JQM1RlVzFqbDBwc09FYmc1M3cwekY2dEFC?=
 =?utf-8?B?OHI0UkYyNTQ5T0tYRUVDTzAxSFdwVFE3OVNOVUpEWEdkeFYwNzAxRWFaZTRy?=
 =?utf-8?B?UUROWlVCaGVpeGdjK1Z2ZStDRHI5cU5Wc1hhT2dBc3VQYkZZcmZWNGZhWFZB?=
 =?utf-8?B?MkxzY1orcVpPWUUvc2pEbUY2aHFtL095NGM5SmljUmFGQ2Fyb3E3d3JibHBk?=
 =?utf-8?B?UE53VVVqQUlBM0NZejNybFBYTk5FWlJXU2hDdENyWlVvemEzOUY0ZURUUDhF?=
 =?utf-8?B?WDVNZU83QnlRYWVyU2pUNlFGb25WbUdSSTFVbkZxcDVwbTZEZzdIQmJTSFBq?=
 =?utf-8?B?UE05ZXVpdWh5ZXN1d3JmeTlPcHdhMGhDZWI1Tzd1cS9lajVGVVZ0VDFoRm9W?=
 =?utf-8?B?aUphSzBDSDRFb05zSTQxMCt6NjRYMVoxMlFFRFNKb2JmNjU2dkcrQVRaQ09w?=
 =?utf-8?B?MWhFOVAzMXpmVFkzWlphM0ZMZWRuVkxxUE5sdVJaYUNhQUNKdmlMN25YZUlQ?=
 =?utf-8?B?NFhWVXBIa21BSlpMS21GdU1teUhRb01KQXJkbDluRlpCZmVla0xBNnRON2Uv?=
 =?utf-8?B?TENIOWZhdEpyME8rRXVjS090bnZWbEpFK1FmNW9GSmt4amhlcE1EbmxhYWkx?=
 =?utf-8?B?Q05lSGpTQ2JrYlZla0JmNWpkMXRWUU5YdUNnQkVwb1lGS3VwVXZSb0pkRERZ?=
 =?utf-8?B?UTZwanpseGlmcnp0cVliQ2t5UzZOZnZ3MWRTb0hwRG5xOXEyUWJKVWhsR01R?=
 =?utf-8?B?NmxFaE1EUnFjVXN4M2lWRFg1NjFOa3NGeFVRaHpPUHJzZE15b2NldFJKWjhw?=
 =?utf-8?B?MnBRS0l5dXBtY2QvRlFQeE9xMzFpQzd1QTduRUlQaFU5SDZSOG5yZVg4MHJx?=
 =?utf-8?B?MDdaeW0xbXlNN0xxNHBaRWVpQmVzVjBnSk9ZRXNVelg3b3FlS3VwWDRZWXlu?=
 =?utf-8?B?UXZwVEJ1VnpjOWxVRWtyRUZaa1lDaEM2ZDIyUFVsUjhyMGFOMityMk5xZGd4?=
 =?utf-8?B?THR4MnlhLzNQRDhibUZHendwSXNpSGxQYk0xQm94WUdtWGZxa09xMkE4UjY3?=
 =?utf-8?B?VXdIOEEyeC9PME5vNEVyNnh0MTRVNUxKRVVsbDhYUFdoUVEwMS9BTEMwMHJX?=
 =?utf-8?Q?l7clp21E3jO5NjNc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	f38hshwkqL0wIa9pxFHoGBAS1TsGz4E9WA5kDB4jFv8fR2GmTggNisthc3oaVI+yEasS+Q1gMl3vjqAF2XiXSX8SlNybYcrwgf5jeZxaeB6oeMW0/y52tJxT4gRoxAnfObNh7DlHhuJNhYtChYzjmpMpD8OCBpartS7cG7+wtCUAMD7Wh+JqO2kVa+kO2XQRcPeWtmEp0TVD2xZGnASwAydy3V01qTlD0+71BXayc00qGIEglU3hUgsXc3x8S8v8fyVaS/SJR4ZnGs8pLCfZEtOWiUDT4ayVtdpiWa0CNw5hlu8w6AINEH9/SEN/GWUK8zOeA+BcvkQvMBAKfXJN9A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943bb29c-c0e2-4f41-67eb-08ded80b730a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 07:28:01.9218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XExJvBeTWeeBQiDXaLS2o65xQOBVeXLOKWKAuKnw+ZoDGU6KZ63NreltV3XB6BTzgdAt82S+R8s1j3RI0CK+rQiKz8Yt91vhooP2REwH+n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8360
X-Proofpoint-ORIG-GUID: MXDp8JgtCNmdu5GIKGTM0hcZ-JPpn5va
X-Authority-Analysis: v=2.4 cv=O/sJeh9W c=1 sm=1 tr=0 ts=6a461304 cx=c_pps
 a=BToDjy1G2hQwEUS1Uhc31g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=i1jtY_C2_aQASInNcGEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MXDp8JgtCNmdu5GIKGTM0hcZ-JPpn5va
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX4zPoz/qTNNsB
 qgqh2gwtD5Zio1a+TOU409Cu+0NRbGd5HC5vooQ8n8RlBjwObIo066mpo7Nyhvak4QF3I78h9iT
 WZNdUfHYyEYeUF+EddDyhm71sPrBLna9VpLnGrW/cDBqD/g/00+oWgauxeTx8azsQqZOpWNbUcm
 IcUUX72joD32WYvZOIbL28n+xoKF5fL0Ch4oIlsZvzNH9ifit3lAEmQtqv6cBTJqC2rGbZpqWgp
 YJ2kwuY97Z42WFnqXzJnLGM339/7cK6s0XWpVOz/bnq6GidhyMT7zQQ2Lnv78UQK4OcFq/+UUGY
 7DRzIhuysgi3SgI7UhKtJt53hHMMruYzukSfcVX45p7vJJY5mdMrPPEaI4/6aHH+TSskujFMz3+
 nsCjNfvvlNy8TjUHankir3Rju7w29gyAXQurh8g9a7Slzm7iFX6IsnwwLgMb5fD72HTm04OXk6B
 oBk8mVo6Ge6OUfxzW5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX0DyJcnEO8X2j
 XZWrgtVScJ8w6L6sXt03jowKfXKKSEISiJ4ESLwLzPE5Kj2sW6zDIjwh5KyHHuY+uWo41T3Fvp9
 ZKpNcYehYkSfbLTXqut1uv0cW1VnVeyxc7slUc7IzVUKJBdIjKuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075

DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBt
YXgyMDgzMF9vZl9tYXRjaFtdID0gew0KPiA+Pj4+PiAtCXsgLmNvbXBhdGlibGUgPSAiYWRpLG1h
eDIwODMwIiB9LA0KPiA+Pj4+PiArCXsgLmNvbXBhdGlibGUgPSAiYWRpLG1heDIwODMwIiwgLmRh
dGEgPSAmbWF4MjA4MzBfY2hpcCB9LA0KPiA+Pj4+PiArCXsgLmNvbXBhdGlibGUgPSAiYWRpLG1h
eDIwODMwYyIsIC5kYXRhID0gJm1heDIwODMwY19jaGlwIH0sDQo+ID4+Pj4+ICsJeyAuY29tcGF0
aWJsZSA9ICJhZGksbWF4MjA4NDBjIiwgLmRhdGEgPSAmbWF4MjA4NDBjX2NoaXAgfSwNCj4gPj4+
Pg0KPiA+Pj4+ICJhZGksbWF4MjA4MzAiIGlzIGEgZmFsbGJhY2sgZm9yIHRoZSBvdGhlciB0d28g
Y2hpcHMsIGJ1dCB0aGF0IGlzDQo+ID4+Pj4gbm90IGhvdyB0aGUgY29kZSBpcyBpbXBsZW1lbnRl
ZC4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEkgbWF5IGJlIGluY2xpbmVkIHRvIGp1c3Qgbm90IHVz
ZSBmYWxsYmFjayBhcyBpdCBzZWVtcyB0byBiZSBtb3JlDQo+ID4+PiBjb21wbGljYXRlZCBhbmQg
YSBiaXQgdW5uZWNlc3NhcnkuIFRoZXJlJ3MgYWxzbyBvdGhlciBkZXZpY2VzIHRoYXQNCj4gPj4+
IG1heSBiZSBhZGRlZCBvbiB0b3Agb2YgdGhpcyBzbyBpdCBsZXNzZW5zIHRoZSBjb21wbGV4aXR5
LiBXaWxsIGVkaXQNCj4gPj4+IHRoZSBiaW5kaW5ncw0KPiA+PiByZWdhcmRpbmcgdGhpcy4NCj4g
Pj4+DQo+ID4+DQo+ID4+IFlvdSBhcmUgbWlzc2luZyB0aGUgcG9pbnQuIFRoZSBmYWxsYmFjayBp
cyBwZXJmZWN0bHkgdmFsaWQuDQo+ID4+IFRlY2huaWNhbGx5IHRoZSBkcml2ZXIgZG9lcyBub3Qg
ZXZlbiBuZWVkIHRvIHN1cHBvcnQgYWRpLG1heDIwODMwYyBhbmQNCj4gYWRpLG1heDIwODQwYy4N
Cj4gPj4gVGhhdCBpcyBvbmx5IHVzZWQgdG8gdmFsaWRhdGUgdGhhdCB0aGUgY2hpcCBpcyBzdXBw
b3J0ZWQuIFRoYXQgZG9lcw0KPiA+PiBub3QgbmVlZCBhIHNlcGFyYXRlIGRldmljZXRyZWUgZW50
cnkuDQo+ID4+DQo+ID4NCj4gPiBDaGVja2luZyBpZiBJIHVuZGVyc3RhbmQgdGhpcy4gSSBuZWVk
IHRvIGFkZCBhIGNoZWNrIHRoYXQgaWYgRFQNCj4gPiBjaGlwLT5pZCA9IG1heDIwODMwLCBhbmQg
aWYgdGhlIEhXIHJldHVybnMgc3RyaW5nIG9mIGVpdGhlciBubWF4MjA4MzBjDQo+ID4gb3IgbWF4
MjA4NDBjLCBkZXZpY2Ugc3RpbGwgcHJvYmVzDQo+ID4NCj4gPiBpZiAoKGJ1ZiA9PSAibWF4MjA4
MzBjIiB8fCBidWYgID09ICJtYXgyMDg0MGMpICYmIGNoaXAtPmlkICE9ICJtYXgyMDgzMCIiDQo+
ID4gICAgICAgICAgLy8gdGhlbiBpdCdzIGFuIGVycm9yLi4uDQo+ID4gfQ0KPiA+DQo+IA0KPiBU
ZWNobmljYWxseSwgeW91IGRvbid0IGV2ZW4gaGF2ZSB0byBjaGVjayB0aGUgZGV2aWNlIElEIGlu
IHRoZSBmaXJzdCBwbGFjZS4NCj4gWW91IGNvdWxkIGRyb3AgYWxsIHRoZSBkZXZpY2UgSUQgY2hl
Y2tpbmcgY29kZS4NCj4gDQo+IENoZWNraW5nIHRoZSBkZXZpY2UgSUQgaXMganVzdCBhIHNhZmV0
eSBmZWF0dXJlIHRoYXQgZW5zdXJlIHRoYXQgdGhlIHBoeXNpY2FsIGNoaXANCj4gaXMgc3VwcG9y
dGVkIGJ5IHRoZSBkcml2ZXIuIFlvdSBjb3VsZCBkbyBzb21ldGhpbmcgc2ltaWxhciB0byB0aGUg
bWF4MzE3ODUNCj4gZHJpdmVyLCBpLmUuLCByZWFkIHRoZSBkZXZpY2UgSUQgYW5kIGRvIGEgbGVu
Z3RoIGNoZWNrIGFuZCBoYXJkLWNvZGVkIHN0cmluZw0KPiBjb21wYXJpc29uLiBTZXBhcmF0ZSBj
b21wYXRpYmxlIGVudHJpZXMgYXJlIG5vdCBuZWVkZWQgYXQgYWxsLg0KPiANCj4gU29tZXRoaW5n
IGxpa2UNCj4gDQo+IAlidWZbcmV0XSA9ICdcMCc7DQo+IAlpZiAocmV0ICE9IE1BWDIwODMwX0lD
X0RFVklDRV9JRF9MRU5HVEggfHwNCj4gCSAgICAoc3RyY21wKGJ1ZiwgIk1BWDIwODMwIikgJiYN
Cj4gCSAgICAgc3RyY21wKGJ1ZiwgIk1BWDIwODMwQyIpICYmDQo+IAkgICAgIHN0cmNtcChidWYs
ICJNQVgyMDg0MEMiKSkNCj4gCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmY2xpZW50LT5kZXYsIC1F
Tk9ERVYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlVuc3VwcG9y
dGVkIGRldmljZTogJyUqcEUnXG4iLCBidWYpOw0KPiANCj4gc2hvdWxkIGRvICh1c2luZyAlKnBF
IGJlY2F1c2UgdGhlIHVua25vd24gZGV2aWNlIG1pZ2h0IG5vdCBuZWNlc3NhcmlseSBoYXZlDQo+
IHByaW50YWJsZSBjaGFyYWN0ZXJzKS4NCj4gDQoNCg0KSSBzZWUsIElsbCBiYXNlIGl0IG9uIHRo
ZSBtYXgzMTc4NSBhbmQgc2ltcGxpZnkgaXQgc2ltaWxhciB0byBjb2RlIGdpdmVuLiBUaGFua3Mh
DQoNClJlZ2FyZHMsDQpBbGV4aXMNCg==
