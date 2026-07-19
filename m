Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23473806CA;
	Sun, 19 Jul 2026 23:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784503807; cv=fail; b=Z5vg3D7H2KePWPphBXQQqfbOLwyE2MgwdqsJvhHvHjG34UuALgP8zAUpEjZHVhIujPvGnwiHhj8smhDFUXBUiGpZl5eypLUc/cukZ/hKttuwSDpWsYp1IuwFH9j8SqSPmp/cPkn4nnJBU/3NGCHlMRCvYSlVm3+cvCyCAk7GN8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784503807; c=relaxed/simple;
	bh=aKNTA0RTOWMK0NLpIglxWPfC03xYU1cuCRbOJwD06AA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kGVs9l9m/pBoS12ubezmGWI6TiDeuJbI+2+u3Bp0UMdAPS0/guvSAMSEwQ5lqJTfnhuYX/obe9WN/F4QZGAiU/43Ir4UB/tegIkaM6Y+RYm3QJoBBV40hFLW0xxgBj3VeBFf5Wef/vx54dHs78buep3wgQtwC93FYKQLgHQURQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fy8OivYW; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fy8OivYW"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKRwsa4159046;
	Sun, 19 Jul 2026 19:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=aKNTA
	0RTOWMK0NLpIglxWPfC03xYU1cuCRbOJwD06AA=; b=fy8OivYW8T/fem1jvyWTT
	XFaVE6nDJbpykGlock1cd4EDt+z7SX9f0XnL6rcEufaDbjMeKnil/+Qu5Cx4FRGG
	gRxlJ11B+jemsBmEQ8D4NLiSYP3Bu25BL0iDGOYDC3NLhFmfVmlwA8n53wobFZuC
	Qs+Lt/Atl5kMb50YbepOVXA3bk6/Dx6hqMnMsyOv6tCmmN18wHsd3b5HjAGeEEzS
	/wXgjcgNppxxQsEpMjHEpLrSDb2lc3XVEBp748j9k25G9JbgTV95ASYD9KV2QK8r
	Z5SmAHQTlIjecEyXoQI76XU9PeokiJ4hMi0tBunRhZfPX+M93pgiiJJwxhvZcmGK
	w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fg6d1c0q7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 19:29:59 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaFaelVDSNd78Rf0wGHqc4qmFc/IhNJnNW9FBhbD04jf+4iHC8EWDPy+tzJwrJuNN0ZetJPELSzsXw2RoLV728gxJGecsU5PoqjTLIgj+PMl6LHyY5Tmo4r1amVlK0uAGKkp8PsK2IiDj5pC7lDcAApw2vqzQnYJVBnIHwPccLUtF8aIVeKWUuZnOY+XCvJKVy8uex1J23B8LAgNpOs5dYn5LFaHpZMz3GTugQeuZ7oZqzt5cpBdzba6blbr2jFLmUcTcYu6IdX3PRPkaF0i1helUsIN5xzLZ96yX0V+ugpYgZ2bvYCa9QZyJjR2JP5aOVu2HTf9OyRQW+02e+qQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKNTA0RTOWMK0NLpIglxWPfC03xYU1cuCRbOJwD06AA=;
 b=G6d5Z7iQBS8uQZzqjlINhyDFJs3KoKenvDul+VJK151fwLn8sbh7EOoEgbzeSF1ij9hyzf7zUGSuWhinIZi4HMm10UoJgrI3VwG3mkIgiNFNZF58KrRTBVDWP0ZzxZ+zzfAKaLozqJaBfDObCFsCBYxGOjS8WvPxRFwk96WvAbj0uhtixEYshJprcC5PLJZeDv6olphxGcr5ZMZ2rffqBsJDrDgL5ode+5aHdwakNnK/AYm8bX337BTo6H392HbC3ylBpjxDTNJqKYvv/U3WA17f81t2IhfsGtHaYDMtNuyggQ53k4ZK/cytbx8njFXW8slfa2/TII0SihQfVQydPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA1PR03MB6339.namprd03.prod.outlook.com (2603:10b6:806:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Sun, 19 Jul
 2026 23:29:56 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::1578:4572:29b5:2442%4]) with mapi id 15.21.0223.015; Sun, 19 Jul 2026
 23:29:56 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Topic: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Thread-Index: AQHdFP0KHG1nLTwPxUSiOhrbWS5u6bZv0jOAgAWwehA=
Date: Sun, 19 Jul 2026 23:29:56 +0000
Message-ID:
 <PH0PR03MB6351842B9B81C8B436AAC5F9F1C42@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
 <20260716083544.1B5B91F000E9@smtp.kernel.org>
In-Reply-To: <20260716083544.1B5B91F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA1PR03MB6339:EE_
x-ms-office365-filtering-correlation-id: a806bf78-3050-44d6-7798-08dee5eda49c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info:
 YYd+OHxOArAy46YPuT3p8AL5VJswGPwj0InfHA6EHMNROukQhoi0iZJFhc5JTBWtRSmNFRTGhv2HAli/Qti32hBYnJwKXMrPsf3uS95eOaPdDyHErhCTIccTyHA2HjpGdVTP+brsLBYC3ltD/vLfc+M60ekWfq7q22b9gbqCNE/vhPEAsdC4s63sOhUQGWM9Sl7mDbeobKLHaYpANmpcBoQKeWLbhq+53LuWufWnMHVp1NEp23tUaT6DUFnu/hmzEsr3dJiEtY726Cj07tuBqukGlUDJtkUHdYBjaWNSFTc1PISvmSa670Y/py4mRCyI4mu8VVmWb+lx+Yrl/qTtzcfeaOj+FzHmO2LcFz+so6U/46r+E6+sVltgCRBiBr7fQjsVAhvr5s3QwfGYD2Wbv8RDDnjTVATD8YOdSqInr9S/uvJDz8V1dCyfLj0cQtFmotlDw2FCleiiJF5kH4NOrHrmIn4oe3XClrlRbs74WDducnquXfxFHxR1eBA02uDU8mTV+V2GA0p5ik5eziRohUMJMXbos57PTii2kyUdSe7oM5oq5dLsSXzQwYGPNGmBQu7Vb9CeO7qsQMaaqlcLy0gLfPsTyIWCDrm1eeaygQZikfZK1fT3ztaSQQrHeG/x/GTk3JKcZwSp3fb6UfcPFqQzBdDyobRtpto9n9Okq6g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OU1qUE9Ib3VUTTh5YXhXOGtjejFNcU1WZm5zMC9pSXBvTGhXblV4R014Z21s?=
 =?utf-8?B?ckdYdlNZUFU0UjkwOHA3aXQ3dmlKMjdGV3oyd2V2bGlnZTJ4ckJwWlg2WGQ3?=
 =?utf-8?B?QUw0d01NTlp2dmNLT3dsTDc4WS9SWUR4bU9ERFFOOHhCcjI3TTdGSnFlQ1pp?=
 =?utf-8?B?aVM1MjlNWUtoVW5tK2xHRExibnhoNDRrcmxJVko5T0s1N0lxbkNLZVVEV3F1?=
 =?utf-8?B?WmtobUZOSFhXbzJLVENIN0I0WlFQWCtSeldTa0FjYlMyUVBDUFppRzNkdFdq?=
 =?utf-8?B?WEdNYTU3d2tkWDhLK1NDMkRRSGs4VDlvYUJCaFBrVksxdFpmSHhQOFJycjFm?=
 =?utf-8?B?ZFd0U2Z2SFd6QklVc05GcVgrU2pVZnZHNjVpbUczMWZ0UHA0dzU1aTh0UlpW?=
 =?utf-8?B?dWoxSkQ3SW9xa0x4R3RVZUEyOHlrVy93b0RaNTVVNzVieVBCa1NOTUJYQTV5?=
 =?utf-8?B?QWcyS0FEZktSMHVQTXJIZEU5clM5eDJmbUVkaTgrUklRYll5V0hxTHQzbDVw?=
 =?utf-8?B?UHFjRjV0dCtSdHhlcGl4NGl1WUw1bVBBWG92eGRVM0pYZjM1VHNSRGVCc2Fh?=
 =?utf-8?B?V1hKT3VZdVdLYVRCN1QzL25nS25jRk16NERGd0NlekZla1FpeTdScC90YTlF?=
 =?utf-8?B?Z1o1alpJR0lCQlJPeGNBeDJrUTdkenZFUGVsYkRwV3Z4QTRrV2hKU1lPVFcv?=
 =?utf-8?B?cVEwVmFEb0I1WS9vZll6bXpFd3VpQVhUcSs2dGV5SHNEdEhrSkdRWnM5Ungx?=
 =?utf-8?B?akJNQnp0NU9VVURWRjlPbWtIb1BDYU85SFNSSFJGdG5XbkxFU2oxTzRPY0Y4?=
 =?utf-8?B?VHUveEcrZjZ5a2gxL0RsaXhTSXhIRTdTZ2FicWRpcTJ2K2o5cWFCRTZqb1Bh?=
 =?utf-8?B?OEhWbXdqVWp5MmY5Z21IbzRsNjBBbVljMGhiWVJWMTlaVktrSjRCb3l0N2VP?=
 =?utf-8?B?R3NldUV6RWR6TjFRUXlHQmFoRVpuUllGb2RHYnV1Z1h0NUdPY2dXY1hWRjNy?=
 =?utf-8?B?Tk1ST0VuYWNYMkd3SnhSRUpXd2JIQW8xZ2pnZzV5dWczT0hlVmZ1RDBzYmNz?=
 =?utf-8?B?aVBQN0Y3VmFDaW9IRE8rZjdJTW9WV09UaG0vaVhKOTNidG9Wci96ZmNpVndR?=
 =?utf-8?B?RGg5T1JvaWpmaDlWNVRVaktXN1BqQW54d2lsVDU0c0wyYzR4R05idHJ6NDRm?=
 =?utf-8?B?TDJJdXJ5TW9mdWM5ODdUcWhVNWNPbloxbm12SjJRTDNhSTRrODhYRGliOWZE?=
 =?utf-8?B?anB5cUFVUUUxRndUM3BEVGJabEl5SkRLVjBqTzJjMDhmalB2ZnVkRGQyVVUy?=
 =?utf-8?B?WnpVc2IyT3FwQUtwRUVWalRYMmVTa2pRaU1laGVzZFp3djlCdXJGQmRMdnFN?=
 =?utf-8?B?WmlLckI4V2d2c0lzelFXaGJ6TDRtRUkvTDllVnd4cDFSbnpPYzNET3BzdDY4?=
 =?utf-8?B?cjlrUlNoZXp3Znp2N01WaE1kTmRQU3ZTa282bEdXaG4vYTN5c2EyNkQvQU1E?=
 =?utf-8?B?VXRKY2trM1E2OEkrNWdxazJKMFcvYTIrYS81S2N6V21rZFRTdlFXcUhuSTZi?=
 =?utf-8?B?MjZVZWdXMVVxMVFYQU5TeGxDQ203bUpWVE9ZT3UrVU1YRmtjd2NVSFIrNDhn?=
 =?utf-8?B?WEdrTEtRVHY4NnZFdWhCTGVHUTZtYjFLSUlJcTlDYzNJU1NneHdpYWFJcCts?=
 =?utf-8?B?azhoL2xpZ2VQSTU2UW5IZ1B1OEZFZmlxaUxScU5TYUxuTWJESGJkRkUvRmU2?=
 =?utf-8?B?akVmOGxKNG9oUE1HaWJ3M3dma2dkY3ErUHF6WWd1R2htQlQ2VUl0RFZ6bEZY?=
 =?utf-8?B?Zzd5ajRTRm1qdzc0NGtwMXJkbUZYN3Evck1ZTEZLTG42VmpiZldUZXBSY28r?=
 =?utf-8?B?MG9VUm45b2tSMlA3cm1JWm9KcWN1NWFCelZZQnFqRXBuc0NDZTNHdVVFdUFV?=
 =?utf-8?B?aVE2MG54TENtUzVqRFpSV1gzQThDelZaTFlJUEJSeTRocWxkdEQwUXdibzNV?=
 =?utf-8?B?bFZFQkUyOWRkcEZsbWpwalk3OS9PY3NSSDQ2Q1ErdVhSb3Z1cS9Oam1oMWZ6?=
 =?utf-8?B?R3FYUjBvNGlkVngzR1NvNUpuT05GbktuYmRQelBWZTdWRm1PdVdFT3V2dEs5?=
 =?utf-8?B?eXRIbTlnRERiT2V6RzUyOEJPRTc2WVRYOFZvNmR1ejdhQ3lxbTlGS2ZBRGJU?=
 =?utf-8?B?bGlHcWdjaWcrQVJmdFdBTjNJcVAwdHh2eGk3bDlad0xLSVZ3WERYYzAwelhI?=
 =?utf-8?B?ZDNyOThaTGM4MXRjaUJWS0J6RGFxTTBlRlhSQVVTU2pKM29nN0tlL0U2OC9C?=
 =?utf-8?B?N3JCMW55N3p6UFZjeVJMeTVwOVVGSGNKRkR3eklZNUVidGk3SXh4TUZJNG55?=
 =?utf-8?Q?H/DuXo4a0ZfpKFp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	opQzu7QeHSLK8qos6RQgLBJZqs/4kJbq0Bdhozbwk1PNQVOOx1gUV1PrvF19J/fiS3009GlnpTAVc8VgEyp1SPzCWBxjWVDkPo32VW73Yo13KrvBgSPmBnwbJ9u5wqyfbMaU2D3edI+18OWnHIZlM+7oFXBwAnTEkYMLuA4u/SAFyYcoYfrMjklAFO3IHngZUYbiizrhv1qMaH7upSpw5zchSgI79ca5HdFEJPAEfUwov96PTLUFiceHK5AvCMkYgwMNysw0jf9b2a2jCIVlYe1h095fyLUveW0stVYnLlHxcP2bNBVwkwxfJfHFll90PBxw7wvUi3JpIPwvA8dOAw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a806bf78-3050-44d6-7798-08dee5eda49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 23:29:56.4507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PA3N7Sp6SV6WyiWEYB1VNJF6cTeOxlMOghqjGD6/vo3YbXpGGms4ZLMixBf2qpTfFie9nsNVG6goX7KR49CrxYBJcCvCTBJZp+ZJvUnoUR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6339
X-Authority-Analysis: v=2.4 cv=ds/rzVg4 c=1 sm=1 tr=0 ts=6a5d5df7 cx=c_pps
 a=rA8xTxhMCG4Q6PG1LLvkJA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=6qIfmrQ-uDjTnqxQwCAA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI2MyBTYWx0ZWRfX3yqF3lJoOpjy
 jfi/jW9sM/zvZ3G/m2gojkNVLHdrbjCaBx9VQpGs0dVrjvRPPyn0FCTfLMB2rsaKBt7SnVzEFcX
 K/uG8TaLeq7VtBzbWYB0yA3fmkFHy1vA2tosgXQnWhVJZZkqsIdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI2MyBTYWx0ZWRfX7ke0OzCDqY8R
 JVazigIAEZz9bwgxdYDwug693N/Wcv7Iv5KlJ2gdH45L/v4otRxoB1KF4pzmkPXn9c87I0eHHjy
 UReeZx16AJnMdb/GDCHLwmRVP+yOuM/wlg1vIXkQ0UGJLO745ARgVAJfW8fHapXqP/y9+5TXq67
 ZoS5enk7MuQuWbkwOa+faA0DlTndURifIzMcW7fdMCs2Lz9krzBXcJzeHIU9kK1W/ZYHBVRe80g
 0waEsuLMqHbJukfHEStYvRZiRZwH+6gCqOXiSH2gG8l8u8zsG1/2QlpTViDalgE+GbfUhwmhu1f
 OrsUfmpVoRY8UUTZTO9M2uhIpXhSfMYs75ZjPjMSZmfewhugTo80iO/vEpH14GdQ5bo96C53Czr
 qhi3OfGoJPVEw6ZOz/M7TNjSKuygR8H3IjCxTcvJSRMwWbCFz0omYsIDKwLaurGdCUvLcCzv4HJ
 3pGzSAI1O0cGwWMa6Hw==
X-Proofpoint-GUID: 5m4N0rCKhWf1BUqwzB2JqTzOHioaS32K
X-Proofpoint-ORIG-GUID: 5m4N0rCKhWf1BUqwzB2JqTzOHioaS32K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190263

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkg
MTYsIDIwMjYgNDozNiBQTQ0KPiBUbzogVG9ycmVubywgQWxleGlzIEN6ZXphciA8QWxleGlzQ3pl
emFyLlRvcnJlbm9AYW5hbG9nLmNvbT4NCj4gQ2M6IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gaHdtb246IChwbWJ1cy9tYXgzNDQ0MCk6IGFk
ZCBzdXBwb3J0IGZvciBuZXdlcg0KPiB2ZXJzaW9uIG9mIG1heDM0NDUxDQo+IA0KPiBbRXh0ZXJu
YWxdDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbTWVk
aXVtXSBGb3J3YXJkIGNvbXBhdGliaWxpdHkgaXNzdWUgaW4gRVROQTgrIHJldmlzaW9uIGNoZWNr
IGR1ZSB0byBzdHJpY3QNCj4gZXF1YWxpdHkNCj4gLS0NCj4gDQo+IC0tLSBQYXRjaCBbMl06IFtQ
QVRDSCAyLzNdIGh3bW9uOiAocG1idXMvbWF4MzQ0NDApOiBhZGQgc3VwcG9ydCBmb3IgbmV3ZXIN
Cj4gdmVyc2lvbiBvZiBtYXgzNDQ1MSAtLS0gY29tbWl0DQo+IDAyZTQ2YjY3MjU1NTYyMzkzZDE2
MzgyMDU3MmNjNTJhMGNhYmUzZTcNCj4gQXV0aG9yOiBBbGV4aXMgQ3plemFyIFRvcnJlbm8gPGFs
ZXhpc2N6ZXphci50b3JyZW5vQGFuYWxvZy5jb20+DQo+IA0KPiBod21vbjogKHBtYnVzL21heDM0
NDQwKTogYWRkIHN1cHBvcnQgZm9yIG5ld2VyIHZlcnNpb24gb2YgbWF4MzQ0NTENCj4gDQo+IFRo
aXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIG1heDM0NDUxZXRuYTgrIGhhcmR3YXJlIHJl
dmlzaW9uLg0KPiBJdCB1cGRhdGVzIHRoZSBkaXJlY3QgZm9ybWF0IGNvZWZmaWNpZW50cyBzcGVj
aWZpY2FsbHkgZm9yIHRoaXMgbmV3ZXIgcmV2aXNpb24uDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2h3bW9uL3BtYnVzL21heDM0NDQwLmMNCj4gPiBiL2RyaXZlcnMvaHdtb24vcG1idXMv
bWF4MzQ0NDAuYyBpbmRleCBlNTYwNTdlOTI3M2MxLi4wMjQxMDlkZjI2ZGI1DQo+ID4gMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9tYXgzNDQ0MC5jDQo+ID4gKysrIGIvZHJp
dmVycy9od21vbi9wbWJ1cy9tYXgzNDQ0MC5jDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IEBAIC0z
NDMsMTIgKzM0NCwyNCBAQCBzdGF0aWMgaW50IG1heDM0NDUxX3NldF9zdXBwb3J0ZWRfZnVuY3Mo
c3RydWN0DQo+IGkyY19jbGllbnQgKmNsaWVudCwNCj4gPiAgCQltYXgzNDQ1MV9uYTYgPSB0cnVl
Ow0KPiA+ICAJCWRhdGEtPmluZm8uZm9ybWF0W1BTQ19WT0xUQUdFX0lOXSA9IGRpcmVjdDsNCj4g
PiAgCQlkYXRhLT5pbmZvLmZvcm1hdFtQU0NfQ1VSUkVOVF9JTl0gPSBkaXJlY3Q7DQo+ID4gLQkJ
ZGF0YS0+aW5mby5tW1BTQ19WT0xUQUdFX0lOXSA9IDE7DQo+ID4gKw0KPiA+ICAJCWRhdGEtPmlu
Zm8uYltQU0NfVk9MVEFHRV9JTl0gPSAwOw0KPiA+IC0JCWRhdGEtPmluZm8uUltQU0NfVk9MVEFH
RV9JTl0gPSAzOw0KPiA+IC0JCWRhdGEtPmluZm8ubVtQU0NfQ1VSUkVOVF9JTl0gPSAxOw0KPiA+
ICAJCWRhdGEtPmluZm8uYltQU0NfQ1VSUkVOVF9JTl0gPSAwOw0KPiA+IC0JCWRhdGEtPmluZm8u
UltQU0NfQ1VSUkVOVF9JTl0gPSAyOw0KPiA+ICsJCWlmIChydiA9PSBNQVgzNDQ1MUVUTkE4X01G
Ul9SRVYpIHsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBXaWxsIHRoaXMgc3RyaWN0IGVx
dWFsaXR5IGNoZWNrIGNhdXNlIGlzc3VlcyB3aXRoIGZ1dHVyZSBoYXJkd2FyZSByZXZpc2lvbnM/
DQo+IA0KPiBUaGUgY29tbWl0IG1lc3NhZ2UgbWVudGlvbnMgYWRkaW5nIHN1cHBvcnQgZm9yIHRo
ZSBFVE5BOCsgdmVyc2lvbiwgYnV0IGlmIGENCj4gc3Vic2VxdWVudCBoYXJkd2FyZSByZXZpc2lv
biBwcm9iZXMgd2l0aCBhIG1hbnVmYWN0dXJlciByZXZpc2lvbiBncmVhdGVyIHRoYW4NCj4gTUFY
MzQ0NTFFVE5BOF9NRlJfUkVWIChlLmcuLCAweDAwMTUpLCB0aGUgb3V0ZXIgY2hlY2sgcnYgPj0N
Cj4gTUFYMzQ0NTFFVE5BNl9NRlJfUkVWIHdpbGwgZXZhbHVhdGUgdG8gdHJ1ZSwgYnV0IHRoaXMg
aW5uZXIgY2hlY2sgd2lsbCBmYWlsLg0KPiANCj4gVGhpcyBjYXVzZXMgdGhlIGNvZGUgdG8gc2ls
ZW50bHkgZmFsbCB0aHJvdWdoIHRvIHRoZSBlbHNlIGJsb2NrLCByZWdyZXNzaW5nIHRvIHRoZQ0K
PiBvbGRlciBFVE5BNiBjb2VmZmljaWVudHMgcmF0aGVyIHRoYW4gcmV0YWluaW5nIHRoZSBuZXdl
ciBFVE5BOCBvbmVzLg0KPiANCj4gQ291bGQgdGhpcyB1c2UgPj0gaW5zdGVhZCBvZiA9PSB0byBt
YWludGFpbiBmb3J3YXJkIGNvbXBhdGliaWxpdHksIHNpbWlsYXIgdG8NCj4gaG93IEVUTkE2IGlz
IGNoZWNrZWQgb24gbGluZSAzMjg/DQoNClllcyBnb29kIHBvaW50ISBXaWxsIGZpeCB0aGlzIGlu
IHRoZSBuZXh0IHZlcnNpb24uID49IGlzIG11Y2ggc2FmZXIgZnV0dXJlIHdpc2UuDQoNCj4gDQo+
ID4gKwkJCWRhdGEtPmluZm8ubVtQU0NfVk9MVEFHRV9JTl0gPSAxMjU7DQo+ID4gKwkJCWRhdGEt
PmluZm8uUltQU0NfVk9MVEFHRV9JTl0gPSAwOw0KPiA+ICsJCQlkYXRhLT5pbmZvLm1bUFNDX1ZP
TFRBR0VfT1VUXSA9IDEyNTsNCj4gPiArCQkJZGF0YS0+aW5mby5SW1BTQ19WT0xUQUdFX09VVF0g
PSAwOw0KPiA+ICsJCQlkYXRhLT5pbmZvLm1bUFNDX0NVUlJFTlRfSU5dID0gMjUwOw0KPiA+ICsJ
CQlkYXRhLT5pbmZvLlJbUFNDX0NVUlJFTlRfSU5dID0gLTE7DQo+ID4gKwkJCWRhdGEtPmluZm8u
bVtQU0NfQ1VSUkVOVF9PVVRdID0gMjUwOw0KPiA+ICsJCQlkYXRhLT5pbmZvLlJbUFNDX0NVUlJF
TlRfT1VUXSA9IC0xOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCWRhdGEtPmluZm8ubVtQU0Nf
Vk9MVEFHRV9JTl0gPSAxOw0KPiA+ICsJCQlkYXRhLT5pbmZvLlJbUFNDX1ZPTFRBR0VfSU5dID0g
MzsNCj4gPiArCQkJZGF0YS0+aW5mby5tW1BTQ19DVVJSRU5UX0lOXSA9IDE7DQo+ID4gKwkJCWRh
dGEtPmluZm8uUltQU0NfQ1VSUkVOVF9JTl0gPSAyOw0KPiA+ICsJCX0NCj4gPiAgCQlkYXRhLT5p
b3V0X29jX2ZhdWx0X2xpbWl0ID0gUE1CVVNfSU9VVF9PQ19GQVVMVF9MSU1JVDsNCj4gPiAgCQlk
YXRhLT5pb3V0X29jX3dhcm5fbGltaXQgPSBQTUJVU19JT1VUX09DX1dBUk5fTElNSVQ7DQo+ID4g
IAl9DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9zYXNoaWtvLmRldi8qL3BhdGNoc2V0LzIwMjYwNzE2LQ0KPiBt
YXgzNDQ1MV9maXhlcy12MS0wLQ0KPiBhOTQxYjI3ZWFlY2JAYW5hbG9nLmNvbT9wYXJ0PTJfXztJ
dyEhQTNOaThDUzB5MlkhN1RsaUlXLWYtDQo+IGFIM2FPelExSmd0SGY4TU5HSFF6ZjFsLTJCNVd3
RmU2VmgydGptQ3ZVc3BYVF9VNGIzdjVxN25vWThnSUljZC0NCj4gRkNkajNMUW1qWks2M0FaRDVh
NmtmdyQNCg==
