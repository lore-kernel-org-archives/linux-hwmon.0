Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E070224A7C9;
	Thu, 16 Jan 2025 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.156.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736993975; cv=fail; b=F+wBbWF5STa10rFsyQFzNoQB5NU660DYArTcBs+IWRBqfIHZvxl/fxTAN4rrfHtAco+HPLI94I7BBl+eixPTjYAnX26WgUa8a/XqHYhcT+bQ0T+1IIpya2btf4CPcLTx/bOz7GCTi/zI7LNyyTkKr5kWGpiXInJkVXqWWqGSct0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736993975; c=relaxed/simple;
	bh=87rR9GVBVSBQY2/q2jA5p3yN7Ds+HKjyvdZW/mn2U/0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nR/m66Z6pSPGs7vs2GaJKnMwOk/ReWanO+o6X6Htf6Q99zsiyAUVnAC4CyfwOoPC3r7CxikuuyKmkof/uZqEbqZ4h7Q0fbVEt5mzUVyI4UFilfXJP6eLtJ6twJXOYpur0q5JebZ8tnUm/tuQxgvEZaujry0i02pVmlabIjyrs6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=H9FilFBG; arc=fail smtp.client-ip=216.71.156.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="H9FilFBG"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736993973; x=1768529973;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=87rR9GVBVSBQY2/q2jA5p3yN7Ds+HKjyvdZW/mn2U/0=;
  b=H9FilFBGp3t1phlRIH1xcTxlABfv6/QP0Kk3LvNLRKJkAFQFBGEbOHct
   2Vo7Dne5x9vodIT8GxeFTnjtwxqMiHJpJmVDwgvHkJpOoX2GbZCLGQw2b
   Swkgr8Miff+jRHc1PIbNJloU+CCAkVmtIoPX8pCD4SEeTOaYc4230OpRo
   6MrrtkyMF22gAX923gEhsqtItqLKClSpO/jE0NcV7X4w58Yp8n+0Aptr2
   Cag+OI/Lzx/wcWWk9BF7rA/sx/6V9edzHIfwNDQR3fWHKQ50aZxkYsmjU
   KqwJOKqZzdsZuGMabOVWXDp4nhNazA/mAc6CC2FSpNvWTaMx1vDxV0j4A
   w==;
X-CSE-ConnectionGUID: +tiG/cH4TY+6UaHCMrnk6w==
X-CSE-MsgGUID: tqAfNMyxRjK+EQkmOiet/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="143193179"
X-IronPort-AV: E=Sophos;i="6.13,208,1732546800"; 
   d="scan'208";a="143193179"
Received: from mail-japanwestazlp17011031.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.31])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 11:18:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUgmdTGBnA6JwxgYZ2wZ2+5Sxp8HHyD5HkYiXOeQHkDikVgYW+nAgLMR5aslvkGu4zenquYlWY2JeNJ9K44JcG0payPs/t/R/+mzeEDRzzR8F5ECu6dXAUHHnkTU9D5r673TOyxUGZLfXmXtW+E2aQIfOW5CUCaXZypSd7LDPgyqI8EOxHbkOE/jkvInL4c4lND3KCw8RLzSFSLln8UYEGxxpsLkzZns2eNy42bK95wdqp+XEnxE3MOgPzScO4u9H029xy4J/dsQw6NTb67mO1B0JesnjOLAlBRMfNidI8iZFWJ1i+j+LeOE4eNuMb/G+UQ3oBiKBnzz6qEdAyhgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q86e+hyyIS8o5v4oJogF1FwPjkEmeFmw1C+DmIyu1wY=;
 b=qMy9OQP81rmX9ACmnGPqnWiHGBdAskBUwhmvN3GIAKnNYEj5nsymvNat+Fxwk6sOxO2FPfTpxl1XbfwHEyp2rvgPsuPrvqKfn33Cljn7dbLQWBx9ZoGA6/3dvpiw7ljvH1uxxuJx/BHlHFMVjIjZnn6/GRFGAyPib8Ua96xEUe1l/Fy/9BRYq7UTX2Jdp+5LjI3BuYGmy6FBr4SDf+MSZwJ9nVO6hubJyW6r73RW2lyYtsWXzM2OIPcHFH8mEiEPRJETNpn7ayWegHJlCtzemXmn0PzwrgjbXkFQMhGuE8VtlmXQ3h6eBhKCQ2xKHiefKs4TdPTf3SMxWamP4YqIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB6834.jpnprd01.prod.outlook.com (2603:1096:400:b5::5)
 by TY7PR01MB13680.jpnprd01.prod.outlook.com (2603:1096:405:1ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 02:18:07 +0000
Received: from TYCPR01MB6834.jpnprd01.prod.outlook.com
 ([fe80::13a5:3796:ba62:4e2a]) by TYCPR01MB6834.jpnprd01.prod.outlook.com
 ([fe80::13a5:3796:ba62:4e2a%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 02:18:07 +0000
From: "Kazuhiro Abe (Fujitsu)" <fj1078ii@fujitsu.com>
To: 'Guenter Roeck' <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Huisong Li <lihuisong@huawei.com>
Subject: RE: [PATCH] hwmon: (acpi_power_meter) Fix a check for the return
 value of read_domain_devices().
Thread-Topic: [PATCH] hwmon: (acpi_power_meter) Fix a check for the return
 value of read_domain_devices().
Thread-Index: AQHbZyAaefeucUwtTEOgzxEbV0IiurMX4uSAgADGCzA=
Date: Thu, 16 Jan 2025 02:18:07 +0000
Message-ID:
 <TYCPR01MB6834678EC75B1736CD6AFB5ED51A2@TYCPR01MB6834.jpnprd01.prod.outlook.com>
References: <20250115073532.3211000-1-fj1078ii@aa.jp.fujitsu.com>
 <ec1cb50c-0cb9-4d7a-af2e-2cb1a7b47129@roeck-us.net>
In-Reply-To: <ec1cb50c-0cb9-4d7a-af2e-2cb1a7b47129@roeck-us.net>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=a29d409d-af11-4707-a4c6-f82456f9fff8;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-01-16T02:09:01Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB6834:EE_|TY7PR01MB13680:EE_
x-ms-office365-filtering-correlation-id: 94b4a80e-e854-4a45-0691-08dd35d4042d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?djliWis2cVVESlJCRWNUT291ck9uMUREYjB6ZlkrY2lTWmsvaDZWWEZt?=
 =?iso-2022-jp?B?MmZhK09FbFVWVmdKN0pLUWlpYkZoRnRYOWkwUDlybnEwUmwwcmRERjJ3?=
 =?iso-2022-jp?B?cDZMamhrd2NLZEMyVmZOYUdRNVgvVndZb3AxQUVFRDJLR1I4RjlmSFdi?=
 =?iso-2022-jp?B?TjBweTduNEJrR3pkSUo4QXdDaFlCWEE0N2prdytLY0lvNkZrNitIc0J3?=
 =?iso-2022-jp?B?cS9obDlQdEJzcmtzcEZPYThQTDJvTkx0dTdXSmtpaGVFWEkyNUhyZkRG?=
 =?iso-2022-jp?B?ZVJmT3NqTkIxRjlldHNRa2JuNUQwNW52UUQ0cDYzcjU3WU1ycnkvNjg5?=
 =?iso-2022-jp?B?NkFnYWZDRnA1THFySTVNbG5RQTRWeG9HNGtsTng5dVhjYTNiTjRmQkc2?=
 =?iso-2022-jp?B?cG9CRjUvUk1oWVF2dWJjS2MxWDFpY2JpZkpPdy9qOXhMdGtCYUlqSFRl?=
 =?iso-2022-jp?B?V3lrZE56K04wRzc1SXFZRlRrWHRWNnBTVGlWdFhCNjFQNWJJYm9TR2Uy?=
 =?iso-2022-jp?B?NE1JZy9yRkFIOFlWYU5WdFRRcmpCa3dHaU1wT21uSXBrU0d3eExiaEp5?=
 =?iso-2022-jp?B?SGhkNmp0aHJucWRORVo5c1BPWWlUbjlXUVFoeHNpZGN6bEhwVGNPUTdM?=
 =?iso-2022-jp?B?TWZzNFVxVjJnVFM5VCtBcXBWakxnUmp1SStwNnRkVkZSYWw4VksraldU?=
 =?iso-2022-jp?B?MHdHUkk3QllYTVJOR0VzSXNBdkFCQ2lOTW5KRFcxK2YvdmUwMk9BTXZr?=
 =?iso-2022-jp?B?REpXTk9PUmFWckdML0x0NnBEdll6UFVxWVIzNmNob0xraUlrbFQ3ZUp1?=
 =?iso-2022-jp?B?dGdzSzdXUFpGakVWZ3dsOWhMeTJXeFg1L1ZqTjVONWVhUVRRZ0RNSkVK?=
 =?iso-2022-jp?B?Mi9EQmhCNy9xNXdoR096c3hTZEl5SjFqdFBYakFUR2hSbW5YemZYUHpR?=
 =?iso-2022-jp?B?bVVIZFJEd2dTK0duUVBSRmF2RGxEeU0yam5heTNybTZSNDVIV3d2VU40?=
 =?iso-2022-jp?B?ZkpwelJ1SnFpcDM1RVhrTjd3OVJ4bExDYjFiQityZG9zWjRXZG5wM3Uy?=
 =?iso-2022-jp?B?dTA5VW8yRm5BalJacTE4d0lFU0MydWRCbEJKeW0xaHRDRTZoTXhIcWZY?=
 =?iso-2022-jp?B?VDRwVjVvcVNXRzJSVEw3dlMySG93WlFscHlmZ3ZmVlkzMk16b0hhM3Ur?=
 =?iso-2022-jp?B?T295SVQzL1U3cGs5UzdpbmpEM2hoODNOSlpobGxkeUF4b1pmNXozZi82?=
 =?iso-2022-jp?B?Q0NTcnRVK0xXMG9iT2EzVHZON2d1NDViWE9DcVE3bFFsaHlrcWdCZ3Jj?=
 =?iso-2022-jp?B?MVl6K1RaSk14RFJrTTg0TFBkaThHeUdCS0puQnlmMzU0UkhDb0ZCNDAz?=
 =?iso-2022-jp?B?N3oxamJScFRabm8zQmVhbXYzeU53UnVrZzR6WGordzVtRzFxUmV1ZXFp?=
 =?iso-2022-jp?B?N3VvS1BsaUl4WlQ3WkdvZVg1a0hrMHJ6T0FRNGYxY1B4azFnVDA2S29J?=
 =?iso-2022-jp?B?WGZGQk1aaEhadVVLaSt1Qy9Yc2lraDFhODlwdjFxaXdLNDlyMi9oNEtx?=
 =?iso-2022-jp?B?WWxNOFpqTVJSdVNKNDcvWWNvYzVMdS9hKzBKdUpySTFPR1ZZLzdzMmZa?=
 =?iso-2022-jp?B?V1lyQkQyZVRMQlZnR3BwRGdadzE1clJjeDBQTjErWk40MzVuNnlJdDNv?=
 =?iso-2022-jp?B?T2RwSHMrQ25ZeWJSU1lvQTJWM1Y3OFFxY1NlaTlGS1lqYzhlY3U4K0FP?=
 =?iso-2022-jp?B?Y01PT1hFdkp6SFZFelZKSnJlSVUxUkFTaVdiYTc5S3JzSjJoM3R3NURI?=
 =?iso-2022-jp?B?QzczaklBNGtuNjVmaDVBTk9xd3Nqc09jazZJLzNSZm4rem1QWGpQcENQ?=
 =?iso-2022-jp?B?TDA0MnoxeXh0S3NUYUVLNXVBVFJWc3FjMUl4OE81VzlnR2lYc3R4NXlh?=
 =?iso-2022-jp?B?MVNlVHYwc2d3U05nb2NzZFBSbXN2RFZFTFBZZER1RVVOR2ttK1Z6all1?=
 =?iso-2022-jp?B?MFpnZXFwSnorTVNtbEhPOHgxQkoxaDFPNDEwK3ZlbmJaR29RNDhGb2h5?=
 =?iso-2022-jp?B?M3pRdVlKOUJIVSs3RmRZUjdBWFBDMjdod2Z3UUd3aDZCcG5lcFZZSHQ4?=
 =?iso-2022-jp?B?RjY3UVp6NFcvTmdZWlBGRVBmcWRnZFhRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6834.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?YXFKcHBMYXBxMEhyN3dWcW1ZUjVBbFJkZXBnM0ZQMDQ3UzRKZGNKT3lB?=
 =?iso-2022-jp?B?MHpsS0tTOHRyMUhFam8zbFkzWENDc01zOGM4N3RnWWZqelZNcGYrWVNw?=
 =?iso-2022-jp?B?Rkp5L2dkUXMxVmlINGoydUdlWS9WTWM3SUc3eUs4YkFmWEZWZ0ZubHc4?=
 =?iso-2022-jp?B?QnY1YmV2Q1hjTkt4R3Y4UE5IWUl2LytrRHhSWnFCZE95Nm5aNkloRk5u?=
 =?iso-2022-jp?B?bzZKZlUwUXVHeGk5OWJzVDVFVzFXbjl3a0xBLzZvbnVtRlNLSXIvUWov?=
 =?iso-2022-jp?B?dGllUFlGNXlRWXRFazdWWVVmR0MxNG9aY0N2Yjk5d0oxUE9nVmVQRU5Y?=
 =?iso-2022-jp?B?cVRtSVBuOUd6b2VRakluQjRMdDVHR3p1S2xxZEREWnd5dHdCWHNyb1g4?=
 =?iso-2022-jp?B?UjNHY1Ftc2dkNU9zQm1MT1U4TVFpU2hNUjBPMWVXeitpVjNDYkNjbk9T?=
 =?iso-2022-jp?B?SUJvNGlXNWt0T2JEai9BQjcrWWJrdXBtbkkvSUVaUmtoblJZdTMvTFhM?=
 =?iso-2022-jp?B?OVFxVFBPbm4vek1TbG92RWNKNTJ1cE1mUEowOEpsUk1TQUhmbk5xU21I?=
 =?iso-2022-jp?B?T2xtNEN1ZlFPOTZFaFRsQ1VzSmtVQ1lvOWUwZG5wSUg0R2JVV1p2SU5t?=
 =?iso-2022-jp?B?Q3ordVpoenF2NXUrSE4zZTdkLzh6cFJCdTk3YWppUkkzQWRCZWwwM2xj?=
 =?iso-2022-jp?B?YThWdjRxcE5jY3FOT1dUUXJ0ZERmSm9tbVVOL090WUFFVHRkZ3RQM3BQ?=
 =?iso-2022-jp?B?N01jcUFpdWMrVmQrQXdwcjdWdGtvQ29YbVNUWUo3NUJFc0wwTzlXMXJD?=
 =?iso-2022-jp?B?UllROVZ6d0VBelB4eU5PSllvRUFHUnpMREJseCt1RGpmbEdZa09nWW1N?=
 =?iso-2022-jp?B?Y3llWGgveHRTMUEvWFFzcEpjN3E1K0tPVmJpbDFkUkdUZS9RbHQ3blEy?=
 =?iso-2022-jp?B?NkhLVTl1dms2dkdPekpTcDR1Y2VTaWtoKzZsdldadEJ2cUo5V1JoaU9a?=
 =?iso-2022-jp?B?MXBocHI2U3NBQXMwTFNYZHRzb3VKOFBNZFpGYlJjZXZ5T0t0NzFocUlZ?=
 =?iso-2022-jp?B?NndHNWZoUGt1M2h1cGVUbWlrSDRqOUMxZ3QvREhhRzVPemZFeDNzMjVF?=
 =?iso-2022-jp?B?Qk9YRkZQZkc2d3FUekZpN2xOeTZnanpSaEU1Zm05anFsejhsNU9tdjJD?=
 =?iso-2022-jp?B?aTcycGxyMzJxM3hxYldXR3lQaDdjY3RzWVFBYlVsNjBXUmtvTVRNMk5Q?=
 =?iso-2022-jp?B?amRrSkp0alFLU2lDVzZGa0NiV2paL2RDdjU2T1hNak81cUM3SnllcGQw?=
 =?iso-2022-jp?B?azFJYlAwcWQ4a1drdVppc3Nhbzc3M2p4cDlLaHBBQk5IclV0WHZlSjJE?=
 =?iso-2022-jp?B?bGVGZ3IzVGFsUGRCWjBPdkJpN3FKUjYrdjVpT2F3V2I2U0pVeHNYREFJ?=
 =?iso-2022-jp?B?MVUveVo2b3d4K2hpYmVZTmNUTG9GdEovYVpuWFIvcUlPcTFKWTNrTUt4?=
 =?iso-2022-jp?B?ZWFoREpoc0xSbWdoOGlLUE00Qm5Kd3pkSTViMUFMZ1VsVnNYazc3YUNT?=
 =?iso-2022-jp?B?ejBoTk84eWE3eU1IUHdoYnNKTUFDOWdpbURSYm5tT3ltQWRtTEI3QkRF?=
 =?iso-2022-jp?B?L05BOStOd3dyTnNnMmdseGxNWkVpSS8wQ2c2eFVta0hqRnBmdnpTQ05I?=
 =?iso-2022-jp?B?YlNQbE4xeTlMMkYxSTlEYkZoTHZtNS9Fd0JjVWpXNCt5cHYrd0ErVU03?=
 =?iso-2022-jp?B?NXp5YTRoK2s1dVVxbm1wc1orK2FnLzJ1R2dMMFV1ZEdhSGY1Q3dOVFVh?=
 =?iso-2022-jp?B?SzJOVU1OeURtdFJ6WmgxYzlETFJVQ3BRVWlMWHZCV2pmZFhPOFlWMjdx?=
 =?iso-2022-jp?B?di8zSng2WmE0Y092all4NEJBdGsyYWo0aGRnVlBvVFltb3BPSVovSWdx?=
 =?iso-2022-jp?B?NDAzWkNkK1JCZmhSSkM2NktJNzNhNDRZZCtGUzhhbWJ1L1MxMTZLanFi?=
 =?iso-2022-jp?B?MFo4bEJYUWxXMmYwcjFoYTl1NnJHckh0NjlxdnhvT1RqbmtKVlRhZlpG?=
 =?iso-2022-jp?B?K0xJUzg3cmxRUlpTcmhFMXFiMVN6SUROQkZOclJCUVRCenJNNHA3NnVH?=
 =?iso-2022-jp?B?WUdxNDgzbUpueGZleTF1THFrZmZsRkRiQTdHT05ocytERTY1L2tYWERO?=
 =?iso-2022-jp?B?L1FzY3cwVFN3QlJOaDQvcDUwY3hLQjRvK0lGbmVmYTJBM3pUQ2c1Qk8y?=
 =?iso-2022-jp?B?ZzU4YUxMZ00xTmhhWElYazI1L0RPQ3UwbzBsaXZOd205ak9Wb1BZc2Yy?=
 =?iso-2022-jp?B?MU5STEliVGpGbEJuZGZaTEo1SEFIR0N3L2c9PQ==?=
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
	QJo2a/yfSKDLZaJ5p+x7S90OfVjKmkdNtQWrJTx2NNxr/Xs60rvYHSeq9OI/GBAl2/V90jRS8NLP/FypyvgnQWXOY9RAre3Pv1g0RK9tSawg9tNFdUbboPmipsgMTT9qhGsx4eChyvF0VvUDYI+k69poNFeTJc6Gu61Hduqw33OiPvF5zpEKZ+y/7gorVnQUr0BDb6WwZBAqbG8ffAi1JpYrrCDXP18SwPt1m7okYefWyC3r+9noR5vpscHqy5TYvWi6YIHfcWElP09gduZE1piEkn6f131mir42qk4nbP3xv5ua33Md+vpebGN+fHnxzO5n8z0XFtpTuEpKPwh3xpBSaMS+rXNcAxW40RD+LLRPzv/fIXKbUdI2YquSSicg2lkEWD1tvkAwJTWlKaSAULIABureFyF7+iLfRNVKhHj/BcL4tZiAYinvh27mL0fFf1kyw6L9jhdDZOqDZ/yHRYajqsrfWRPV92dCISUeJ3/jbRSQuy0BYBu8ml2Fl+ePaSuJTFXC2MlJnSn5PydTE2izHAGxpSyUeJZV8pZPsh8knvIs3jfh7rzuLMzFWhib5LoE9K5lslb0qyn9Vh13RoRpxVvxGETeCBBRVrVW0WU9YKwIUlbUz+TnWdWrokzK
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6834.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b4a80e-e854-4a45-0691-08dd35d4042d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 02:18:07.5674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8pZ81zwo50JU2wAB7qk/CPpRfgIqJ9NOazx1E8PPGrv3JPr5UC3LbDFf32FqqCSESdu2xdO0MXN4J1+6u6cjri/Jvdv+3RswLXpaqFoHRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13680

Hi, Guenter

Thanks for the comment.

> On Wed, Jan 15, 2025 at 07:35:32AM +0000, Kazuhiro Abe wrote:
> > After commit fabb1f813ec0 ("hwmon: (acpi_power_meter) Fix fail to load
> > module on platform without _PMD method"), the acpi_power_meter driver
> > fails to load if the platform has _PMD method.
> >
> > To address this, add a check for successful read_domain_devices().
> > Tested on Nvidia Grace machine.
> >
> > Fixes: fabb1f813ec0 ("hwmon: (acpi_power_meter) Fix fail to load
> > module on platform without _PMD method")
> > Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
>=20
> Checkpatch says:
>=20
> CHECK: Unnecessary parentheses around 'res !=3D 0'
> #108: FILE: drivers/hwmon/acpi_power_meter.c:685:
> +	if ((res !=3D 0) && (res !=3D -ENODEV))
>=20
> No need to resend, I'll fix that up while applying, but please keep it in=
 mind for the
> future.

I will keep it in mind for the future, Thanks for review.

Best Regards,
Kazuhiro Abe

>=20
> Guenter
>
> > ---
> >  drivers/hwmon/acpi_power_meter.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/acpi_power_meter.c
> > b/drivers/hwmon/acpi_power_meter.c
> > index 2f1c9d97ad21..dbf2c606fe15 100644
> > --- a/drivers/hwmon/acpi_power_meter.c
> > +++ b/drivers/hwmon/acpi_power_meter.c
> > @@ -682,7 +682,7 @@ static int setup_attrs(struct
> > acpi_power_meter_resource *resource)
> >
> >  	/* _PMD method is optional. */
> >  	res =3D read_domain_devices(resource);
> > -	if (res !=3D -ENODEV)
> > +	if ((res !=3D 0) && (res !=3D -ENODEV))
> >  		return res;
> >
> >  	if (resource->caps.flags & POWER_METER_CAN_MEASURE) {
