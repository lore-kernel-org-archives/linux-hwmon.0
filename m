Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EC25763
	for <linux-hwmon@vger.kernel.org>; Thu, 28 Nov 2024 04:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.156.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732766655; cv=fail; b=kVJK6QRS0qXpXCVlxOjyW9T3VxtelSrD3FgEJCfr67vWl1h7NU4EcDfECKYfFzpZ1LrdfVr2RO8bF/CUfLsI3hV23wWPD4/Dmxdv2lyvrrvCoyejZw70GDrj1WwsQ1dizhWjXnuh65uQNAg+P5VydbyD/IgSbvk7olpOvjQS/1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732766655; c=relaxed/simple;
	bh=GCT3VJDDQdIzGSASrzCAAu2IeLfQn1LGwW5ePrALinI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AfIDjK7aJjAAsKk/Rw7UHKxlUGJwdbf2D0yPJxXqNwFrLA9N1JJEAZDbzc3nlU3788FMaUcRIuu0oHQ0SWKHnpdYykk/SAItiv+e5oeEad2sYQq/BgNKXjhBV9WE+AygMyibJTRf/JVI+XrhfFSQZGfMpcNQnsQ5mMy5/YDYZa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=J0w4HXNi; arc=fail smtp.client-ip=68.232.156.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="J0w4HXNi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1732766653; x=1764302653;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=GCT3VJDDQdIzGSASrzCAAu2IeLfQn1LGwW5ePrALinI=;
  b=J0w4HXNi2x+4FkkOKPdzK/xZfCmUzo4XXoxu8Ahhc0qv0kHHOP3KAx0p
   y2+2fjyzQpMIemP5C5rgNVqF8hheD1o6oy5ts72npN6AFDjQqn7Bo7oSB
   2p1Iw1WcYwiKd9cD97hmye9fCxDePWsV6wBymJpWHx05jnRiUcw+QRu4V
   4Fb9hkpI1plQoL+ffKwJwSj/FaEpeTp6iAadpuHpbSyK2/8SF2fkvv5qJ
   Qed2dy/Oc1dZG9vwffRq4SG5MzCgHI2zavGVHP1EMdtb9CWjjBugV2YrQ
   atowJ2BoRM7x5UQ0ccjeoksqHc8irLhT5bSuv4jrki4g0NYWP/yaS1VkA
   A==;
X-CSE-ConnectionGUID: Q4vlsfucTO+zoB1bzcNSdw==
X-CSE-MsgGUID: WfDB6kJMR5KRxU0mVY7AqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="137966199"
X-IronPort-AV: E=Sophos;i="6.12,191,1728918000"; 
   d="scan'208";a="137966199"
Received: from mail-japaneastazlp17010004.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.4])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:03:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDSY2KeO9/OpXa2TjVVITT2M2daxD7AIowAxQNz44dVCIxUFWqK0zW4yzr3901LWIUVB+QWIsDTayaI33/FdeqHqUVAkkwXjzY+FcVnRisogAr4nuBQHxnWgoqufhiEOYGHQcWEdSC22w9MssV6GMFQfEbaWkZ8JYyp9luxmWoFieq5Bp5qLDRYEZH7lHo1fLWbaTllokB6Db9d/3zvYB5plEY6oe2UU8zoNwrZZJDBPpoL3T7q6Kwm+4/8eW8fg4FAFufK/vpEcKbwlPm8YDqAbJTX8gT3tDMjt6dZwM0pvgVu3Dk3NMqhUYoQj32J3lHGkH9+vg3x7MSSSFK2ccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=010gthmswFd82PxUWGvu5Pt2yOinmMw8sCbk06Yrycg=;
 b=iircdvxve9T35WUOmAfP2yvPXGg1/brWBUnsC3+fMR5Ld8koB9EiOwqEtx4zxAfEYyiTk5p+3//tplp0IcbkJ/supCJdFeW3T0YkTdf0RzLJJIPia3IiW3C1/cHgcR0UfnLeq/kUMTyTbxMOVo+QIF4tjblA7PQrC2BktHAo90jB9IEFJLt/hv9QjC4EhRH1bjjo3Q6NnjJXf/nNwbpytFHQf4s5nJh0yEwJQmCR8s3pQsVZLIJZdkd3RKeD3hM8t202hUD9vieMI26MgqeiaZolQy1GfP3d8We+8ryMh2FH3+YWs3RjO+tfh6ElAXIzuDg/rgyb/qk/n65aj+Hmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6)
 by TYWPR01MB7188.jpnprd01.prod.outlook.com (2603:1096:400:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 04:02:58 +0000
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a]) by OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 04:02:58 +0000
From: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>
To: 'Jean Delvare' <jdelvare@suse.com>, 'Guenter Roeck' <linux@roeck-us.net>,
	"'linux-hwmon@vger.kernel.org'" <linux-hwmon@vger.kernel.org>
Subject: Question about enabling ACPI power meter capping
Thread-Topic: Question about enabling ACPI power meter capping
Thread-Index: AdtBSjp7ozFZFqBERQu+lwfTXdtHeQ==
Date: Thu, 28 Nov 2024 04:02:57 +0000
Message-ID:
 <OS3PR01MB9382B4EB50C4C797AD47F73AD9292@OS3PR01MB9382.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=6c6a0520-51c1-4c60-96b8-d0e24e65861b;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-11-28T04:02:48Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9382:EE_|TYWPR01MB7188:EE_
x-ms-office365-filtering-correlation-id: 7d4a5426-2708-4043-168c-08dd0f618b0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?Vjh2emtqT1JQVE5sbzEzMVZYUkd5eHZTWmV6NXk4UXZLc3lkaWtIQ0Z4?=
 =?iso-2022-jp?B?K3VQRFJ2M0hDTzhBVytQTUcyZWM2UStYaDFtOW5NNXdSenkwTEt2cTV3?=
 =?iso-2022-jp?B?TklzVXY4UjZZZDhOMSs5cEs1aUxHQzFTQUE3WWRFYldqakNuaGhkTEtZ?=
 =?iso-2022-jp?B?K1BmWmdsa2ZzdnlUZWZNeFp4bFpyYnRDb0F3TXMwbk50bnM4aTFsbDBU?=
 =?iso-2022-jp?B?RFVDbzdoYXRnc2JsREJlUEdaVHViMXFDTmpzQk5iWHlSeG9ubi8yWWNi?=
 =?iso-2022-jp?B?YWxjdXpoV1FWTUEwTXBZV2tpZzJKbXAwMS9DbXlieDBma1ZHYTUyUG9G?=
 =?iso-2022-jp?B?Sk5HbnpsTnM4SzFYVklzUENJWDk4Wkk5M3FLQncrN2hRNDZmcG9BT280?=
 =?iso-2022-jp?B?ejNxSVl4NUpta3Z0Zko1ZU42S3pITEl6VVZxZlJGSzJad3kvZ2dSaUYw?=
 =?iso-2022-jp?B?VHBRclVzbVA0RldqQlpqNE1hZENHWUhQaDUrR2pweldjb3J3QTdiUlhk?=
 =?iso-2022-jp?B?T08zUUROM0xOeEpuZzF6cExOWmNDbEtLTVJvV1EvemR3WDMxblg2cnhh?=
 =?iso-2022-jp?B?cUN2SW1FdFJFY3c3NzcxKzZETzBLRW9IR2s0MWFUMGhid2NRR2toZm5F?=
 =?iso-2022-jp?B?NVN0OVZOZ2UwWmhGOEIrUS9Qam1ZSjZCUmZXay9RQXZMcjNPcjJYTU5w?=
 =?iso-2022-jp?B?dlVxTWJIa1lFWGYzcTNQMTBITzFDei9XWENFZmxmYlE0RjluOG5qSWd0?=
 =?iso-2022-jp?B?R3FqbnFUZnU5MktZSTVqdEdpUzRoclhxT0dWQ1E1bkxrUURxK0hDMHRi?=
 =?iso-2022-jp?B?VFpTMnBLdmNMeWNFL2tJNTk3SUVYbGZxUnY0TFY0dTZlMHNKeElXT1F2?=
 =?iso-2022-jp?B?T0RsNU1sS1Z6cjBUdk5JRDFUd1lwZDJnRk8wN2NyOUVtcW1GMEZCdGM0?=
 =?iso-2022-jp?B?d1AyUWs4bjhvZGZoa0prTEdyc21ocFhrUFVNblc3RlRETmJ5d3MyYkdQ?=
 =?iso-2022-jp?B?Ylo4eXUzL3pCczMwQjF6eHdmZkhUUXg2OTlnQklkQXVDTkR3V25LOHhw?=
 =?iso-2022-jp?B?RjJ0Z090Wmt0TUdOR1RJaGF2eDBQS1hpaHVxSVpMY096cFg1QkVhWVZs?=
 =?iso-2022-jp?B?akNQcnloeTBLL1B1czlENXI0dmVEZW00eTE3Wm5EV1ZmcDlBOGVYZ3lM?=
 =?iso-2022-jp?B?Q0dtb1pPZzdOSlFZdXJxNi9GQlhmQjEvbUVJbmwybHNLRC9FTkF1ZHRL?=
 =?iso-2022-jp?B?Q2hhc0ZzbUpQL2t4cDgreWRPdzdOTURLK2hUTys1RFVHVFdyYzdjaFNO?=
 =?iso-2022-jp?B?ODhxaU9tWjkvQTRSVzVHWERoaVo5alVQUmJncGZvTmdQbmhGeTMzRlhE?=
 =?iso-2022-jp?B?K2dCQWhXck1TaDczQVJVZG1vMk1TOUZBckYvTVNxWkV3REljak5kVTJV?=
 =?iso-2022-jp?B?eW8xWUQrTjh4Yzd2VXc5U3BqbVcrT2pESkZxSFNVcjhXR0xYdDNDZk5R?=
 =?iso-2022-jp?B?bm5WTVJ2NWRtbVFHU2tmMFlEekdXQ3R0ZktkZjU0MkE3azVSTUt3TkhR?=
 =?iso-2022-jp?B?Y1VQYUMrdlhQYjRqTDlycmNJOXd0b3VDZHY3MFBrRFRwbHhvdEg1MVk4?=
 =?iso-2022-jp?B?eHVLN3IzYXFuVmhyOENjbVp4Sm1wMUVYZE1YQ3RPQW9rN3V3Y0tBV0Zt?=
 =?iso-2022-jp?B?UktGT1VkdllQeHlEdXM3dkl5aGxBQUsxZnNScWg4aUQ2T0dpaUpEZ0pJ?=
 =?iso-2022-jp?B?OTd4d0M5aTRMc0FEMnZCNlYzcG5pcnZ6OWhkRldXdG1qbjBVYlVZYnZ6?=
 =?iso-2022-jp?B?OE9GTy9oRlBnc0VBdHFtVkJUR2t2MlN5WHlkUDFDbFhMcmdWeFhldDZY?=
 =?iso-2022-jp?B?WmVpelVlR3BNOG5jMkV5UDJpR3VNb2FyTEJGY2YvenMyNTZiL1poVnlT?=
 =?iso-2022-jp?B?REora2NEMDBZRS82SEZITEJvK2U5QlZXTHpvNGY5eHppeHpSbnJvRk04?=
 =?iso-2022-jp?B?VFJmSHpGQW5zSzNqRlhCT2dJVENmbW4yY283RFFyRTN3emQ2ZS9YRVBI?=
 =?iso-2022-jp?B?OWYxZGdpSHh2a0duTDhkc0hjRmVTTHVCejJvVmVpenhSSnlsY0RKc3cy?=
 =?iso-2022-jp?B?NlU=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9382.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?aHhlQkZDNjZLU1JRRGQ2Nmd3SnZwZEU0b2J2WEJ6VlE4a2RMM1cxWjZo?=
 =?iso-2022-jp?B?TXB2M2M1NTJXR2ZZbWpQSzFraWpmTjBVb2tYLzR4WVhGWWt4QldUYTlO?=
 =?iso-2022-jp?B?WE1QdGFVNU5MWnJlY3ZvSm1ISGhDTElyVW1uREJCWUtSYlhQM2hYd2s4?=
 =?iso-2022-jp?B?OHJXQmVDeHFNTEh5NUtMSjhGWTFXMmxIR3B4N1ZISWlLTjVOb21PMFlN?=
 =?iso-2022-jp?B?RjJOK2RZaG9MMmVuYXpvcUZnTWtaL05UMFFqRlZqNE9HRVg1VXZUYSs1?=
 =?iso-2022-jp?B?bHFIR0dlRHF2cEtDRll2dWpzckNybTcrWlVFZ3pDaFZPWDJ1NHJENFJD?=
 =?iso-2022-jp?B?WlJzZW05QitiMjNWdlpUMVI5WFh4UmZDWUJxeUNJUEJ6Mmd6S1oyMGlF?=
 =?iso-2022-jp?B?N1BCTmVoTkh3SHJWWlhoenVEbjNNNWpKdmZPdk5nQldidzRaZXdiek92?=
 =?iso-2022-jp?B?TU5pRi9vb08vM1h6b3Z1blF5VDZSSmNsM3pMektocHFxcG9BSGJORXJv?=
 =?iso-2022-jp?B?TDQ0YzU4QVNYQ3E0dkxxUmx2bWlocmhUZ1dWVWxtVDQwRUFtN0VqOFZX?=
 =?iso-2022-jp?B?VGtBRE5DMEpJNDZFUG9rRkRRUWZRZXZRVHA0bzlvamZvUldrcXBURHBY?=
 =?iso-2022-jp?B?aWNiR1VEd3hoR3kwUjBMdnJ0K1V6Qmh1Y2FQR2VpOWFKcXIrNk4vS0Ra?=
 =?iso-2022-jp?B?Rmc2SVhaOW5IeGd2SU9yN1RFNm0wY0dMdW94eFU2SkF4MC9VUkwyUVlX?=
 =?iso-2022-jp?B?RUkwbTB0VFJodUU2cXJiditKVkFXZEd6eEZSeElwcHhDNE80MWdYelZ2?=
 =?iso-2022-jp?B?d3QvUXE0cnFGN1dvWWQ0WEFPSjdZOUJMNUd3cGlCN2ROL0hXenNaaWc3?=
 =?iso-2022-jp?B?NTgyOUp3Z2FtamNZbDZwNUw2NDh4UWtrZTY0MDl4aGJPanFLUDdWOWV4?=
 =?iso-2022-jp?B?VWhPSXlVRDBxc3FsUWNKeHJvTzIrNUR5MnRtMnRkZkpxRndqNzhNWGR1?=
 =?iso-2022-jp?B?cGVyS1MzZGZEL0VQbWtmSEkrcDZPZFhqcEhsZGZrTnJ5aG1ZVWJXU0xn?=
 =?iso-2022-jp?B?K2ZyQ2VmUTR2ZkgyeXlSM0MrWktPVXJ6UUhicFF2MmFSajNDMWFEb1M0?=
 =?iso-2022-jp?B?Y0oyTzBScExDanpqSXZPMmdja1NteW81SjliY0ZGbkZBaU9Kd1FDM3pa?=
 =?iso-2022-jp?B?bWJMbmhCZ29kaUJFWGVUY2lhK2VJaWl2c2lRdzdjUEF6cmlJK2RWRldS?=
 =?iso-2022-jp?B?ZmNEM0tydDlpRFY5Q2pMV0dvRU9wT1BiS054eks3WS9QZ2JGTUJpZXZw?=
 =?iso-2022-jp?B?ZTlxME92dktsT0xmWEtmc3lKS2pKR3dLWWFvbkkra08rWDN0c3ZreDZ5?=
 =?iso-2022-jp?B?cktKM3pYY1loKzFRLzlkd05xaDJSaTFxVjNHaU00Ukk0dGFqN2VvcEt4?=
 =?iso-2022-jp?B?eDNkaGlnMWpjUHdob2F5TE1UWEVtT2gvOTlONFJXLzdMMkhLalRISUFE?=
 =?iso-2022-jp?B?bzBzUi84NUExeTh4RGJibzZXTCtzL01CcllOQi9EL0wzc0ltOXh5UzFz?=
 =?iso-2022-jp?B?clRzV3hPTHJRTlpWdmovSlNOVnAzQXN3WFE4OXV3RDFrN3FDZUhyTWo4?=
 =?iso-2022-jp?B?dlF0dFQwWm1tNGhvNDJOeTZ3ZDYvcGlIZFAzVTFzbzBLSzlDSUM0aTdF?=
 =?iso-2022-jp?B?Q2VkY2t0NXkvVzYyTHRUcDVTdTRvNXJvNlM1VGR5MnZkRVJVTVN0K210?=
 =?iso-2022-jp?B?RTVIejNDcVBqd2VHQnVDU0FNa1lsTGlSM1BKNktLUkozZ3Nwa21nTThK?=
 =?iso-2022-jp?B?cDZzZVJBbnVVRU5HUHg5UUhsbU1kTDlIVXZ2UHhLS05qVUc3WXpteG5N?=
 =?iso-2022-jp?B?Y2dTQ011eGJhNitMRWwvRVMwbHdURGsyalphVlNTbWEreVRSbHlHZGpK?=
 =?iso-2022-jp?B?Q2xmVENJNU8xS1JwS2d4OWl1R3kwZFVTcjFnUTYrM1d1VnoxUU5OU3RV?=
 =?iso-2022-jp?B?WWVrcXI2azd4RWh6ZEhUbDhmYVpKQWY0eUgwQitpNzE4bkdQVnNsN2dp?=
 =?iso-2022-jp?B?Q0Z2UG96UkhtN2JGbzRQaFRZM2hlNWdkWFdXTmxzY1FFeDRxOUdQeWl6?=
 =?iso-2022-jp?B?aFdxeHI5NDdRSjJJdmRvZy9FYWtPdHRrZStEWnRzUHVqK1BIY290UHNi?=
 =?iso-2022-jp?B?Nml0WFNiWXJGTk9yUWF5ZnMrYUwzYWxaU0w1dmF0R1RuSEN6b0JTSmhK?=
 =?iso-2022-jp?B?WGIyd01abzNSdDdBUFIvMjlRZlJzTXVSeHZzNTU2NmJKNGppN091cHJH?=
 =?iso-2022-jp?B?NUh2Mg==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AXT+drNvA5mZFiiST/bXVlkjU4o5IcgUgBBZWQOslxUxdRNTY7n0JqBrHUn+LhMntsforQy2q4uaUEqz3CABv0XlhcwkDtkJLX9Zr3PxsXhjJEJdVjlqI2vPQfO9pBMDzigL8hj6u6WXRVxA+Aeg1r5N/pwtEwzdxbABtJsMmWNkG8Ueu4szA3Ws6X8nrEvIb2TenUyQ4HKJxrDI/vYP/OogkwxhYIWRm5n3qykLfCtmfUHs7nxWGzT+imN4eSc8lmRSHjgSFUr+GWicnU8QmqEfLUHq2qiufoaXND/z1D1kxzK7NVFk7FzE2+ApJW2JJEuPZFm8VEvZqWw3SJHekVWLzVzUhAOisS06i2u3/1pM+h0awLRFryM0OY5jm1GutjCSbM4Xy/+7mIf8Uml1WO4FBuBZeccq+eslMuiSyuyRG6qVpIXwyKKdfW+fw/ibACUekTr3ECEio+yqQpnKFlNln+6vsu3AZQKvHrQ09E61Ys9Q3kavp02Gk8872M9wVQICIRt6uuyybjbqFJ2ph2b4/PrQV8U56qDrkrUX5SUMTlQvgjfRiO/MZw+hjmEhup1ZOUS5EAObeLCgCGeNaMGM3dxyjgfwChhQSM1YSmSXFkq3+P7ruPfspgtYjCbV
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9382.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4a5426-2708-4043-168c-08dd0f618b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 04:02:57.5611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gqKx3g/eCc5uPojKjOJLaqzQSAuCpZioYwA1CNDRcTiIjnmU5ZqfsOQlNp0LofuEl4kwUNNGw12yQExlmhS5yi4vrBm/a+6H+Rg5I5mkIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7188

Hi there, We are planning to support ACPI power meter capping in our machin=
es we are manufacturing, so I have a question regarding the capping code in=
 the acpi_power_meter driver.
For the capping feature to be enabled in the current code, the following co=
nditions for the setup_attrs function in drivers/hwmon/acpi_power_meter.c m=
ust be properly satisfied:

         if (resource->caps.flags & POWER_METER_CAN_CAP) { // Condition 1
                 if (!can_cap_in_hardware()) { // Condition 2
                         dev_warn(&resource->acpi_dev->dev,
                                  "Ignoring unsafe software power cap!\n");
                         goto skip_unsafe_cap;
                 }

* Condition 1
The capabilities bit3 (indicates that the power meter supports notification=
s when the hardware limit is enforced) of the ACPI _PMC object is set to 1.

* Condition 2
The then statement is skipped if any of the following conditions are met:
+ The module parameter force_cap_on is 1 The Manufacturer string of the=20
+ DMI System Information information has "IBM" embedded

After checking the ACPI specifications, I understand that there is no probl=
em as long as condition 1 is met.
It seems like it would be better to enable the capping feature as long as c=
ondition 1 is met. So, can we remove the condition 2?
I would appreciate your opinions on whether condition 2 is necessary.

By the way, I investigated the past background and found the following arti=
cle, but I was unable to properly understand the reasoning behind it.
https://lore.kernel.org/linux-acpi/20101124232159.GX14383@tux1.beaverton.ib=
m.com/

Best regards,
Shinji
