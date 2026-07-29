Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59849367B87;
	Wed, 29 Jul 2026 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292133; cv=fail; b=qfLmMr3elEqVyQxSXoQrwK3JlbdbwiPWciH6QYJGOsq7n0TvU08xbxSIR2GFGioFCs6fMia4GNJPMJ3gjfXPh8wpBS4cu6ka2CF8Y/WsIWkNd4QIxDWaVzFUTqCvrQ26SwsXQnskMRzRpG26tq63yhrnW6wmCp3u4a3PFm+VWsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292133; c=relaxed/simple;
	bh=h8a3oAoE05AU7Y2KwmLxO5K5g/BTJPRASBYQeRXsRS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b1xoveNwC3WBYqkIr6pH3JfkGnbJgnZGTQ/jQkD60Lnyf5Z1qwQRmJ/lrfoXayuWhgWKIeQ2atN5quroCudAmBQCt4yx39VJ5zJr0Sir7Mwbf97RRJkvzPrM646Rkyl9BaafHQMMbXHah9xtvukrnLGv8Zs9ZCJ95U99kUnZnJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=hYbIvazJ; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="hYbIvazJ"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Hmo92974134;
	Tue, 28 Jul 2026 22:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=h8a3o
	AoE05AU7Y2KwmLxO5K5g/BTJPRASBYQeRXsRS8=; b=hYbIvazJs8KY8zt5ogWsh
	Hg5LMEtKOa5S66lV4x6kTKJn4udhdS81E+1AYfu01RwHYm3dY3+l2fzO/FKFkLi3
	k05tJGfDmMYV5ltGlUGq66JGrwPPwaNwyyUc5zSaUQU/r4x+NEUzLuSkO7y81gNx
	g3ydeGsGHWL+xRTnhZr/AoPjk03tq7S7GfoIaLKAC8kMH4cpCd5hROHH+hiY+rDr
	OwYyERy/DliTEdlTMtc+UPxfO5erSFcVp8quO56m8esyVGPCtvpjH7dd1vwURl8R
	KfsYXsWtPCx9vTijAGpWW3SZMUvf9+86GqCr/VNogxrXvkNuRHRQjU5YHUW/Q5HD
	A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013015.outbound.protection.outlook.com [40.93.201.15])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fq1ggh9mf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 22:28:33 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geXu0fi83fo95R/waAEFlxblejms7ld6n+LUZrPCbV2NvZt1vUnl8HAncLu5FUvItPuwVjMtdsvJlkLkSbkQ8Yf5xqnvXHOaprEMzrwRjczJsUZvv+4iO+85GVrm0Hk+C3q0t/ayCvG6W+RP8jExD5O1AxrQrT+ApaNwu+3Xk+G9v+JO7gmprhtEPRDjfuGVBH1SU165RXooTwL6ORJvgnJToDDt2BmCWcO6HhKuRopy2mfZubQVG0spKsm+6MZD7/411Ob5LVCKTm1Eb9hQPHPM9MnquVQH6+RV/eN7M7en8GhwJQ4oc5WzuSlyo7iUH55FAooR78t3DifsApVfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8a3oAoE05AU7Y2KwmLxO5K5g/BTJPRASBYQeRXsRS8=;
 b=fiB0UWaDtcAiMHm3ziAOT4MAUsPSsed1EjSez9Dgbn46cjeoR6YIlxwdseNKhUiesxpdhwF0lZZfN73o0mk5uLBWCFE5OPFMUMvp5kGBlCHPvxvpgCUtNl1sxkz4NYqGppuVPI0npA7AiFK9dOVOcSy/8FRl73cRu6DoIQymb2JNgFQBHiWXLKnNbJgYEFO4yioJaMGCF7cH+F/C80DDcHMt7rWhxnT46uGJCmQV0Ni96VdUtNpmUUboAIF8JiVHGyLN1gePWgsz6WQ0JGTwWa/RcJfVah1YpHpR+mp98GLzl+JjFccOXfzCqHqbFGOcNYnFlyskH6F+wwmbdaDw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by DS0PR03MB7584.namprd03.prod.outlook.com (2603:10b6:8:204::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 02:28:31 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 02:28:30 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Thread-Topic: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Thread-Index:
 AQHdHkHk/3XB76thsE6nF0Lg9EJuILaCV3qAgAAFY1CAAA53AIAABuQwgACLHACAAKTrcIAAFlMAgAAOhNA=
Date: Wed, 29 Jul 2026 02:28:30 +0000
Message-ID:
 <PH0PR03MB63518E58F7B56744399CA98EF1CA2@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
 <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
 <PH0PR03MB6351D7369AB790714DF416BDF1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <9559d319-4b44-45c2-ae13-f92099de4c89@roeck-us.net>
 <PH0PR03MB63510057D496CBE8EBFAE246F1CB2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <9812bc9e-75c7-49b8-82c3-1e9162d53ccd@roeck-us.net>
 <PH0PR03MB635177B2B6831AFFAA2C30D6F1CA2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <354c3535-71a8-4058-90fc-a991657d1e80@roeck-us.net>
In-Reply-To: <354c3535-71a8-4058-90fc-a991657d1e80@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|DS0PR03MB7584:EE_
x-ms-office365-filtering-correlation-id: f9258363-799a-42e8-dfe6-08deed19145e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|38070700021|56012099006|11063799006|4143699003|5023799004|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 4HIJh7F2LKF4Gfft7J8btKr02nWwZUp+trb5fNyIKvkdKdXscXQKzL4Y1x7Hzg1uOtmDt7LRsH82gk80SvHN/Gx7d0HejZ/iC5GFVCSBIs5mDu2fn0F0deQ/hfQb8V9/DAT/PvkMGoj8cFbrDgOec7fUbH1dhVN05rRXzPBCifZO+7hgAybfkujU+uFTMwyKz9gfsFAdjUaT+xhbOom4MWbxHHy/3s6mUO1TZct/OcW+3zvaijF+/J2V54lPhIHBH46cphJoY9jWomvku5gh845yy84WuTL/LJK3zXHGD3UXHqaTTYgrfM7bdnKXbtl85TBYB7igCb15qj32i00yz5WLEFf6V+uvSjhqcFYohDbMu6j7bs6Jqu74z1HbI6WsCzrVsS7vT32n9WSndIf9p52t7yDYYRu6RBNHnyoGUY8zDLuTw1LOnYApMN4E5VTwiR/4FpdTjFLm0Mz4JRmVBw5/XKBRaof3E52/ly2uByiVaHAvJZEirQAaHM+COVLF0WezaQzhUJgKnaxx1QGYRO0bnVJEI7px8qCKyisBMJ9ST4uSuYzwAgYA/qicdtnWJJvAlQuINlLIVZavLeTjD/nGmnFkTIUJ/LkI/mo8ahKy6u4nXL9u+caM6MGcf9qEH+lhlXlKvjYy93GHnj3X4L6YqD3GCvnaVnA7FfEaGD5/r74ZvmI70xHNK4si1anHYuwMwy0evp/sqJBoj/GmqGFr5rZvnV3zc9V6FhIda2Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXhiUWErRXNRV1p2WElpSjF5dXpGZHV6THpsTVJzUml0U1B5VFFaSzI5VHhv?=
 =?utf-8?B?WVhTc3lMZi94K3A3S1h3TDdnOEcvVkVJaTZqbWVBd0ZhSXBmTjVMdklEOW91?=
 =?utf-8?B?Tkw4dkFPYkpzQW5ZMFd0ei9sTVNaczFIZzdNOHFwOWxrZm8xeXVjRjVDNC9s?=
 =?utf-8?B?d21WQ3NmQk1uS3NTOWVicFhKcFZzRXVJTVVRY3BjMDR5VERUcTA4VDNFcHhr?=
 =?utf-8?B?b1ByckxLbGZoVmZCZ0NzWDVsTUJyemY0SUZvSFRlWUxWL0hlYzAyNllBbVBy?=
 =?utf-8?B?dlVVRGp0Z25TbXlTYlBEbGhrZDJTNllZNWtVbDN3VDI2b1RPRXB1UXh0VnVU?=
 =?utf-8?B?dXhrNXRMOFhFT3M2dStTVDBKdnZvZUk4MGpGYjVwdm1CRm1rWGNsaXA5cE1G?=
 =?utf-8?B?NlVXMlBrYko0Yi9nc1hGVjB4Rzc5NU13ZnBwNVdNQUg0QnhvZFBvamdWaUp3?=
 =?utf-8?B?bmZwMkluUVIvcHpraWRGL2x3QnA4V2x6VXN3VmRPeHBEN24ycEtzNS9Xam9r?=
 =?utf-8?B?UnlWYUY4RXJKTFJHMVdGSGRETlpLM2JOOUgzYURCaitFR2F6WWFvaVVqMEJy?=
 =?utf-8?B?Mzc0TWwzM043MVJ3a1NmbDRObzV2Y0xSR3p0aU5DenFaQWsvNkF2cTFzVUJQ?=
 =?utf-8?B?SjQ3YkwzdnBrZDVNWVhXS2RWb25wV3l4RWpyY3l6bTUzMlFDdzhoNll2ZEFC?=
 =?utf-8?B?Qm5YK3FhanY4ek5Velk3QVRkVHlkVFgxRzNkY0FVVFV6VEFzanVwQ05RZVZU?=
 =?utf-8?B?ZUI0MHpKN3VUTXA4MzMwRnNSS1l5MFVZbjA5R3RZNzdKSmRwdXZiN0lEakRy?=
 =?utf-8?B?ZzUvZTBDc0J5UG4wS1l0N2NBNVhPcTV6UHFxTytLakdINXdQcEZtay9Bc3Rs?=
 =?utf-8?B?clpmWlVtTUhJZHJuTXhISzZhZndnc1N1WG1qMkF2U25rcmhlaGpvR3hxbDdO?=
 =?utf-8?B?dzJRSXlHK1JMV0Zub3JNRUNocDJKRE93Mjd2MUVYVHZNQitZUXdpMjA1RS9C?=
 =?utf-8?B?cjNHL295bzQ5bGdKdi9Fd3V4SWsrR25yaHB3aWNJUXo5V0VjU1BHaGVqMGxU?=
 =?utf-8?B?cUFRKzl1aFJNQ282bUtsaDJYSGxTMExrNER6WFdJSENJTTAvOExrbjFEc2RN?=
 =?utf-8?B?SnNxVDJkNkdhYUNoWWkvRzBKRmY4NXV4aU93TWpmbFJOMUlvcUgyYkV2UmRz?=
 =?utf-8?B?UURwNHozYzJJc1RNekRySmpnZWorQjN5aFpuaUJJTnFhMW0zWG44ckszSUJL?=
 =?utf-8?B?eXZ1Nk93VXhoUDRvNlF3M201ZWw2YXhyNWxYNEZtbktTR3JrSTFEdFdha2RD?=
 =?utf-8?B?S0lSNkdOeTFrSTg0SXpNSHIvNkdobXZjYmhlc0owUFYybVlRS2RBWFpPUlVl?=
 =?utf-8?B?TE5SQi9FQTBMZi9WRnpWOVBiMkRIa2FJQ3I1VGRmRzVyMFg4N1ZiWmpDN1lX?=
 =?utf-8?B?TVZudEVIRDJmdEdKY3NBYjVoZDB5d3lBTWFGRXEyTmpoWER4a1NIckVXcTJu?=
 =?utf-8?B?WFBWUUMvN1l4RHNsQkFvalYzOGRhbkE5aThoVVlsQ01pNVN0T3lPVXhGQjFT?=
 =?utf-8?B?RGR2b3djaEc2a0hlRTkrRmJHQzJoRUIxOExLdFZIY2Z1N3ZsN2VqRGRNY01w?=
 =?utf-8?B?RjZZbW9OTTZCb2dXMjBmYTV0emM3eFlWNllocnRmcHMzNjM0ZXBScWQrV2s2?=
 =?utf-8?B?Z1pCZk9Nb3VTUVFCUHdIQVhNdW0wSksvSGU5MkQ2NHNxaU50aFUyVkZ4azlu?=
 =?utf-8?B?dXRyaE4zUm5mQWJmL3hzS2RqTHIzVHBkc2wxb0pqTlRWM0tjMS9MNTcxblFR?=
 =?utf-8?B?cmVRYnlWVzI4THF5RHp6VlNmQU9hRWY1OVBiUEhJbTFFWHVHZjlGRkpmVEZy?=
 =?utf-8?B?VWNVMkU5TzAxK09QOGpoWmgxd2VwY0RHY2dEbVRFeTVEd3p4WTRyU2J0MUdY?=
 =?utf-8?B?Nk9SUEgvcUdVSVQ2U0tTWGMwL1hKR2hJeWNaU2p4NndTK3A0S1NJTk1GQnRV?=
 =?utf-8?B?SDN5V0VydHJQcXd2c3FrNnVjRkp2bHFuZHhHTzdPREE2SCt6WWczNFZCNUl1?=
 =?utf-8?B?cmFVd1RjS1QzQjNLTlZ3Z2xzNktnUENOb2NmTGZ5bU5Uc29seUhnQTA4Skxn?=
 =?utf-8?B?R3U5ZDR0bTBXTmhjTzlqbTBZbmFkYWh3WTRiR3B5SCsxdlN6RzlNZ1AvS2l2?=
 =?utf-8?B?em5wWXJSdHBCZ25vbnFibmROTE5HanZySkFrcEdUYWsyWG81OFlzRDhCbEVn?=
 =?utf-8?B?a3RHL1BLZUdRYkg3R1VxVWJCc3VPL2hxd0JsbjhXeWg4K1lTMFplV3QzbEpF?=
 =?utf-8?B?MEVIVjI3TDNPQnh4SkRHVEdnclY3Y0hONmExcm83TmZMb3VqMjVPVTNNTVhx?=
 =?utf-8?Q?JG00OCUcitnPwT0g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	aA8xICmPjzXTNYf44+GVxl1KKzaaFWbVlhGKUnOjVs8P5TqhxjxZeuc4w2KEUkktPd8zCKMurlaOAI/1w3KJaI7uhHiqLxpUY89+SAjk+XiOUB6eCEZYWrRoN8S8uAtwJF65tqqV+8rgZBV3Tm7LtlPeLVG1b8lPFA1X2ptH5UxqKCymSe4p0adInL03u31ofgJGkRRMY5oIyBxriiXhcjQ13Y73MBbY2Q5Yeoof/9vy0kehccGXn1G+wA/dErXK1GsmHHzIItiYRoWMHPUFPjnzWWFofSqSsGGjvjDdneyqB95a/LTHhy7CYEaFgFWbjYzPTDTbx8ZAfzfsIukQsQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9258363-799a-42e8-dfe6-08deed19145e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 02:28:30.4301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QSdJ0JwmzE7MWCUxlHOzH1DmCCzFFxp1mtC+8eNxiGlL7uYPhoLoWMgMJO7JQqQc5kqcul6MYEcHV76NeOvaxfYfViBOPtW84j4JzNwBYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7584
X-Authority-Analysis: v=2.4 cv=CZs4Irrl c=1 sm=1 tr=0 ts=6a696551 cx=c_pps
 a=vvCUPcqovLgrcFR9lHNvxw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ZQxX5BWu6Z8IJBb2zLX7:22 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=07d9gI8wAAAA:8 a=ag1SF4gXAAAA:8 a=c_wqKvb0w6jYVBYwW3MA:9 a=QEXdDO2ut3YA:10
 a=e2CUPOnPG4QKp8I52DXD:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxNyBTYWx0ZWRfX7YdTZWdjOWjL
 e15+AlW4pOt5EfsXwyIeB/RljmZEtsEpBFX3nJh4SzKbQDHZdSAhbrUvKUw4rytD3f3pdzHluam
 He7+f+oamjUG/eIc2uqo+aHAFz2c+6Ju5PxxDpQn/129FJyJ5Xra
X-Proofpoint-ORIG-GUID: enIbMEVzO2H0nW5HLUgMtt6ktjzQGmkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxNyBTYWx0ZWRfX9fT3PgT0apJY
 85iQpj1/4A3hwmimvzcd93fqoZGjIzBxo70q0owZk50dYpz610LRZys3OuAC6m6H+kNFmEcHWQQ
 qxdl8FWAQgHDi51KoxdFBTsyLHKpGkCdkC6zRwsPmjbDUKhyPpt3kmcOyu0C1JO9TD+8Wr835A7
 eiiLX11AkleRxhB4EjinwQKlS9euVURjHMSlnjYoHFHzgYauzh0xnn2OdlSo+yJV1TcJLmRLgED
 uCuvHS7oGmbcbVppNlvOhPMkcDi6J81L5Qwn+FG5mnSc2utjOqrmd1YoEcqD65JMISc9FSiVuMe
 wUqhMCiQIZ15YN5xfFL0ZYpHzZJBrYLF4bnZ7Awvqda0ycYmTIzjETPQhgOOQqftzVaxAY5opno
 jubgzu8RTzyW2EWp5k60dFrNCsqZSrmfT4DaGkQ/ssUmkiiI22JO1qI9ZOrIEENSKBbBGgw0GsB
 bpeWK0xqd3tBe47QUqw==
X-Proofpoint-GUID: enIbMEVzO2H0nW5HLUgMtt6ktjzQGmkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290017

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAyOSwgMjAyNiA5OjM2IEFNDQo+IFRvOiBUb3JyZW5vLCBBbGV4aXMgQ3pl
emFyIDxBbGV4aXNDemV6YXIuVG9ycmVub0BhbmFsb2cuY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJv
YmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47
IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEpvbmF0aGFuIENvcmJldCA8
Y29yYmV0QGx3bi5uZXQ+OyBTaHVhaCBLaGFuDQo+IDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3Jn
Pg0KPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzRdIGh3bW9uOiAocG1idXMv
bWF4MjA4MzApOiBhZGQgc3VwcG9ydCBmb3INCj4gbWF4MjA4MzBjIGFuZCBtYXgyMDg0MGMNCj4g
DQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDcvMjgvMjYgMTc6MjUsIFRvcnJlbm8sIEFsZXhpcyBD
emV6YXIgd3JvdGU6DQo+ID4+IE9uIDcvMjcvMjYgMjM6NTgsIFRvcnJlbm8sIEFsZXhpcyBDemV6
YXIgd3JvdGU6DQo+ID4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBBcmUgdGhvc2UgY2hpcHMgc3Rp
bGwgbm90IHB1Ymxpc2hlZCA/IEkgZmluZCBNQVgyMDg0MFQsIGJ1dCBubyAiQyINCj4gdmFyaWFu
dHMuDQo+ID4+Pj4+PiBBbmQgTUFYMjA4NDBUIHByZXN1bWFibHkgaGFzIGFuIEkyQyBkZXZpY2Ug
SUQgb2YgIk1BWDIwODQwIiwgbm90DQo+ID4+Pj4+PiAiTUFYMjA4NDBDIi4NCj4gPj4+Pj4+DQo+
ID4+Pj4+PiBJIGFsc28gbm90aWNlZCB0aGF0IE1BWDIwODEwIGFuZCBNQVgyMDgxNSBzZWVtIHRv
IGJlIHJlZ2lzdGVyDQo+ID4+Pj4gY29tcGF0aWJsZS4NCj4gPj4+Pj4+DQo+ID4+Pj4+DQo+ID4+
Pj4+IEkgYmVsaWV2ZSBzbyB5ZXMsIHRoZXkgYXJlbid0IHlldC4NCj4gPj4+Pj4NCj4gPj4+Pg0K
PiA+Pj4+IEkganVzdCBob3BlIHRoZXkgYXJlIHJlYWxseSBjb21wYXRpYmxlLCBhbmQgdGhhdCB0
aGUgZGV2aWNlIElEDQo+ID4+Pj4gc3RyaW5ncyByZWFsbHkgaW5jbHVkZSB0aGUgIkMiLiBUaGUg
IlQiIHZhcmlhbnRzIHNlZW0gdG8gaGF2ZSBubyBUDQo+ID4+Pj4gaW4gdGhlIGRldmljZSBJRCBz
dHJpbmcsIG1ha2luZyBpdCBhIGJpdCBvZGQgdGhhdCBpdCB3YXMgKG9yIHdpbGwNCj4gPj4+PiBi
ZSkgYWRkZWQgZm9yIHRoZQ0KPiA+PiBDIHZhcmlhbnRzLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4g
WWVhaCB0aGUgVCBpcyB3ZWlyZCwgYnV0IEkgZGlkIHRlc3QgdGhlIEMgdmFyaWFudHMgYW5kIHRo
ZXkgZG8gcmVwbHkgdGhlICdjJw0KPiBjaGFyLg0KPiA+Pj4NCj4gPj4+Pj4gQWN0dWFsbHkgTUFY
MjA4MTAvODE1IGFuZCBhIGZldyBtb3JlIGFyZSBuZXh0IGluIGxpbmUgYWZ0ZXIgdGhpcy4NCj4g
Pj4+Pj4gQSBkaWZmZXJlbnQgcGVyc29uIGlzIGhhbmRsaW5nIGl0LCBidXQgdGhleSdyZSB3YWl0
aW5nIG9uIGhvdyB0aGlzIHBhdGNoZXMNCj4gZ28uDQo+ID4+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBZ
b3UgYXJlIG1ha2luZyB5b3Vyc2VsZiBtb3JlIHdvcmsgdGhhbiBuZWNlc3NhcnkuIEtub3dpbmcg
dGhhdA0KPiA+Pj4+IHRoZXJlIGFyZSBtb3JlIGNoaXBzIGNvbWluZywgdGhlIHNlcXVlbmNlIG9m
IHN0cmNtcCgpIGlzIG5vdCByZWFsbHkNCj4gPj4+PiB0aGF0IGRlc2lyYWJsZSBhbnltb3JlLg0K
PiA+Pj4+IEl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gY3JlYXRlIGFuIGFycmF5IHdpdGggYWxsIGNo
aXBzIHN1cHBvcnRlZCBieQ0KPiA+Pj4+IHRoZSBkcml2ZXIgaW5zdGVhZCBvZiBhZGRpbmcgdXAg
c3RyY21wIHNlcXVlbmNlcy4gVGhhdCB3b3VsZCBtYWtlDQo+ID4+Pj4gaXQgbXVjaCBlYXNpZXIg
dG8gYWRkIHN1cHBvcnQgZm9yIG5ldyB2YXJpYW50cy4NCj4gPj4+Pg0KPiA+Pj4+IFRoZXJlIGFs
c28gc2VlbXMgdG8gYmUgYSBNQVgyMDgzMFQuIERvZXMgaXQgYWN0dWFsbHkgbWFrZSBzZW5zZSB0
bw0KPiA+Pj4+IGxpc3QgdGhlIHZhcmlhbnRzIChDL1QpIGluIHRoZSBmaXJzdCBwbGFjZSA/DQo+
ID4+Pj4NCj4gPj4+DQo+ID4+PiBXaWxsIHRoaW5rIGFib3V0IGhvdyB0byBtYWtlIHRvIHNjYWxl
IHRoZSBjb2RlIHdoZW4gYWRkaW5nIG5ld2VyDQo+IHZhcmlhbnRzLg0KPiA+Pj4NCj4gPj4NCj4g
Pj4gU29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyBzaG91bGQgZG8uDQo+ID4+DQo+ID4+IGNv
bnN0IGNoYXIgKnN1cHBvcnRlZF9jaGlwc1tdID0gew0KPiA+PiAJIk1BWDIwODMwIiwNCj4gPj4g
CSJNQVgyMDgzMEMiLA0KPiA+PiAJIk1BWDIwODQwIiwNCj4gPj4gCSJNQVgyMDg0MEMiDQo+ID4+
IH07DQo+ID4+DQo+ID4+IC4uLg0KPiA+PiAJZm9yIChpID0gMCwgc3VwcG9ydGVkID0gZmFsc2U7
IGkgPCBBUlJBWV9TSVpFKHN1cHBvcnRlZF9jaGlwcykgJiYNCj4gPj4gIXN1cHBvcnRlZDsgaSsr
KQ0KPiA+PiAJCXN1cHBvcnRlZCA9ICFzdHJjbXAoYnVmLCBzdXBwb3J0ZWRfY2hpcHNbaV0pOw0K
PiA+Pg0KPiA+PiAJaWYgKCFzdXBwb3J0ZWQpDQo+ID4+IAkJcmV0dXJuIGRldl9lcnJfcHJvYmUo
JmNsaWVudC0+ZGV2LCAtRU5PREVWLA0KPiA+PiAJCQkJICAgICAiVW5zdXBwb3J0ZWQgZGV2aWNl
OiAnJSpwRSdcbiIsIHJldCwgYnVmKTsNCj4gPj4NCj4gPj4gVGhlbiBhbGwgeW91J2QgbmVlZCB0
byBkbyB0byBhZGQgbW9yZSBjaGlwcyB3b3VsZCBiZSB0byBhZGQgdGhlDQo+ID4+IHN0cmluZ3Mg
dG8gdGhlIHN1cHBvcnRlZF9jaGlwc1tdIGFycmF5Lg0KPiA+Pg0KPiA+DQo+ID4gRm9yIHNvbWUg
cmVhc29uIHRoZXkgZGlkbid0IGFzayBtZSB0byBhZGQgTUFYMjA4NDAsIGFuZCBJIGRpZCBkb3Vi
bGUgY2hlY2sNCj4gd2l0aCB0aGVtLg0KPiA+DQo+IA0KPiBPZGQuIFdlbGwsIGd1ZXNzIHdlIGNh
biBhZGQgaXQgbGF0ZXIgaWYvd2hlbiBzb21lb25lIGFza3MgZm9yIGl0Lg0KPiANCj4gPiBDb2Rl
IHdpc2UsIEkgZW5kZWQgdXAgd2l0aCB0aGlzLiAoSSBndWVzcyBhbSB0cnlpbmcgdG8gYXZvaWQg
bWFpbGluZyBhDQo+ID4gdjYpDQo+ID4NCj4gPiAuLi4NCj4gPiBzdGF0aWMgY29uc3QgY2hhciAq
IGNvbnN0IHN1cHBvcnRlZF9jaGlwX2lkc1tdID0gew0KPiA+IAkiTUFYMjA4MzAiLA0KPiA+IAki
TUFYMjA4MzBDIiwNCj4gPiAJIk1BWDIwODQwQyIsDQo+ID4gfTsNCj4gPiAuLi4NCj4gPiAJZm9y
IChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc3VwcG9ydGVkX2NoaXBfaWRzKTsgaSsrKSB7DQo+ID4g
CQlpZiAoIXN0cmNtcChidWYsIHN1cHBvcnRlZF9jaGlwX2lkc1tpXSkpDQo+ID4gCQkJZ290byBp
ZF9vazsNCj4gPiAJfQ0KPiA+DQo+ID4gCXJldHVybiBkZXZfZXJyX3Byb2JlKCZjbGllbnQtPmRl
diwgLUVOT0RFViwNCj4gPiAJCQkgICAgICJVbnN1cHBvcnRlZCBkZXZpY2U6ICclKnBFJ1xuIiwg
cmV0LCBidWYpOw0KPiA+DQo+ID4gaWRfb2s6DQo+ID4gLi4uIChwcm9iZSBhZnRlcikNCj4gPg0K
PiANCj4gSWYgeW91IGRvbid0IGxpa2UgdGhlIGV4dHJhIHZhcmlhYmxlLCB5b3UgY291bGQgYXZv
aWQgdGhlIGdvdG8gd2l0aA0KPiANCj4gICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc3Vw
cG9ydGVkX2NoaXBfaWRzKTsgaSsrKSB7DQo+ICAgCQlpZiAoIXN0cmNtcChidWYsIHN1cHBvcnRl
ZF9jaGlwX2lkc1tpXSkpDQo+ICAgCQkJYnJlYWs7DQo+ICAgCX0NCj4gDQo+IAlpZiAoaSA9PSBB
UlJBWV9TSVpFKHN1cHBvcnRlZF9jaGlwX2lkcykNCj4gCSAJcmV0dXJuIGRldl9lcnJfcHJvYmUo
JmNsaWVudC0+ZGV2LCAtRU5PREVWLA0KPiAgIAkJCQkgICAgICJVbnN1cHBvcnRlZCBkZXZpY2U6
ICclKnBFJ1xuIiwgcmV0LCBidWYpOw0KPiANCg0KTG9va3MgbmljZSEgd2lsbCBzZW5kIHY1IHdp
dGhpbiB0aGUgd2Vlay4gVGhhbmsgeW91IQ0K
