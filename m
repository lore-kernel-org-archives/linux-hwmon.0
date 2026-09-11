Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBD469851;
	Fri, 11 Sep 2026 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134776; cv=fail; b=R69TG6PICQo7bMpjzTMM/C/R0JN4YDIvUZBl8qFPANbJy/1ScdZYAuDKEclZ5HDdzUrokVb7N3ez/J5l4HPAVxeU2231h4EDcK22AfFzucB5Ob96Kdy2B9G7UdSRzMD3qE/skOyzL6VDkDug0F7H72Nvc8vePhm9LZ/jQQBBSmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134776; c=relaxed/simple;
	bh=rzZhxhup2Y8gYKvMUb1Qtzije1sxLFNX99C0PJYJMHQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=F1z1JgXpDjPFZExoloBAxMGzZdBmqBh+AjdXb9LsNNWr0bDdTQwab5wk8rqGDrqF35MKlJ9ZNZenGQxE1IoQiQhXty6LXGTvLw8mdq1V95zghABRj6GbtZXpkAt/m1g1MyaW9rWrghX+JXZKYJ3AMWmrslKgx7BYDNHsgNEYrAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=sPfJU8Lx; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="sPfJU8Lx"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCibQi381997;
	Fri, 11 Sep 2026 09:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=e1Nj0
	ybc/Ar22kXHQCuK66LtFYHDNhKCmfdnEgz5Z5k=; b=sPfJU8Lx/4uvEFE/DCH9M
	otCsfGMeI3FYm4JvwMCppTCdSRBz23O1OC1B8whr44FXN29YdTxi5zk5Ob5dpgR+
	RPBVd6QPvw4HyJVi5Jm38nRQcx02hdcZDXhMT2oOsZz/+yyJjRPJQ6dLFY3BKlzS
	uo6PnY15ft7fdakQIMTBie1bYTngIa47RTapJPaFUFrZBr3zSYWyGSUR8aksumrL
	luUKE9/RmmqapNECxHpWvtgIeyZK/3zmENSgLhunUs/k2PbU1bFXYZeEZTCpOqxG
	xV3MtEd3vv/vngP4wf/wBNibd/mdAM1efkkLccR7uPiRUqJ+KzsTh4Z+lO9i63Wv
	w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx97mbt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:52:29 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjbp28nR2/bi+Rv5+KBd/E4oK7OxwZcA106IFnfgCXKxqRq24x2AdDppm1aJc5EY6+sd9zTl4xS5/vPbjigo7pfoQWAj5p9UWneC8EwWyZm4tGUTkpAysTUeeOfHngh+hECbSKxpXvoR2cAkANcCszN9mvgidW2nQPHA0Ejmo4mmKJrmGsA/Hhrnh223JlNInxHv15qyh7QbSU/9AiO065+0JPX2IXIXRCQhB0wNppIliZDp4B0LN5ykTHunzu7mpM7D0SqhtulnknN7Cv+F4XEaEDXqyYBaMjDmfEcf+MF1vPsSci2yQ+QjgZKC5sXHVO9wrpKtwQEbTlxvaVwYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1Nj0ybc/Ar22kXHQCuK66LtFYHDNhKCmfdnEgz5Z5k=;
 b=xPV63Plk4lMspff28CTmep988J7H9jEKx5lzH9Qa+F0DlSsMNLnQctLU69vvu7ZFHJu6SWuoNbhX7TltR3weX/Q8WKrQeiUPMyrWmCiS3B/1dCVE2LW95A/iCZVXShv3pXaYGl5KHb97ea+VrYtH6ej237dCfJ2XPfBqxdtq+wOCQIw8RR/Rp9LPsIodS8DB/bcrpw9LMH3bXy4OAF2VKMFbiuDyq9ziDwoXk6xrm5r0NHNYChaRsnpAXlmVN5EZMWltZ7OxpAEJfyTT+bb+BwUXdrrm8coik8c/SgUHHkGuHFLo5hUkqneCPfUmiSrh/Ptc7hc7/cQ0E1onWjWm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MWHPR03MB989357.namprd03.prod.outlook.com (2603:10b6:303:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:52:27 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:52:27 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 14:53:37 +0100
Subject: [PATCH v2 1/4] hwmon: (pmbus/core) increase number of phases and
 add new mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
In-Reply-To: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134819; l=986;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=rzZhxhup2Y8gYKvMUb1Qtzije1sxLFNX99C0PJYJMHQ=;
 b=W5No0kUJWx3lP3PMm7/24SRwOu9jfLy1zzgluh+FyNWHCcHm42bS+Mju34JbY/kANnXHfRy/z
 GAkTtLfn4HOC9E9KHcg9Nn01hX8ZevvtdykUjIyKpRaQVWoLrkeLwzU
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MA2P292CA0003.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::20) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MWHPR03MB989357:EE_
X-MS-Office365-Filtering-Correlation-Id: 8388ae1b-538b-46fc-f34a-08df100bea8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dxk7CNzIgrhrk8r4o5/dRE1mi9az9tNahR1Q/gY6Kxq0BElLDvfarNE4T5HgI+lapSERvdeWRmlSLDaBdRZfCDsG8RwaK3EZyPQRMTenad4uVZ0mb2zipgupH5vpGhUdgilsCW0hBy2ATNxupv3YIIkJg0ji9MAu6uunJnER3qObRnp1OLtwkB27v2V0+GD9zJTyDo3w0FsiTWwrCDRE/B0Y2cp5sBsRan4eN+WbUZeW2yWMIg4G6QSRAy8CjhrX5xSutEhtKWvaor2BAOICdG+ChcPJY/xZuv733oAFpcUjKMvpbeuZisX3c9jCuMDizhT7LGE6pwHnxS8ATwFydY9KL/Qj+fT7nLiy7NhI9UYPNVO12o3oaPNAUg+2ypX3bUhNxzUf4/siAbcwLn6GIvy8EP3ckmMliP4CqZhVf+9pB5y4KkZEmy2eBScHNK09hsbJ/FaKuTeey0V9kykgQxDqOEaoYjrr3foh57nbKKYI2juLjWweywReEj2xBcBLH5b+HWlUeIjxQbLkmjLO3cQIROQehNZkKKsKodixkj5oA4q781nJQRXNIo+dINAgKLswLRf6HtgYwCs/F8Eg4XNNKalMOhPabuPQSOxcPzHLfnnfOZyEzVmrzUCDIq5VglBDPfM3lXGr5WUWpDC5LvCYIGkZmvyXjMX9dvo6+mc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0dBd2l3S09NRFhDQUN5aFZhYXZGL1ZjTkdKa0hHREtNSmQwUnNmMzRpY0xn?=
 =?utf-8?B?QllxRW5zdGVsb2cxUnVJc3YyYW56ckpZOG9FMHFlQ3kzcEhuNjF0U1lKMEF5?=
 =?utf-8?B?TUljMU9OempUVzF0U1Z1TXNPSEwxcUdyalFGUUlINXBORldTRXlvSzZYL2gz?=
 =?utf-8?B?UVVCOTRKRit4dHpvUWhOMWRGVlpWY2d3dXIvUmN1TTUyYzhSdHlWRTRtMkpI?=
 =?utf-8?B?RzhmbkM0dE9yb3RrbEFwazBOQTdWTFZ1VWNvTjJrRUJVZGNiN2RjcXB6cUxM?=
 =?utf-8?B?TWtHSlNTUE1QTjlRZmc5YzVJcXFxd2gxU3cyT0NmOVRTVHBBTXkrMUJpQWlJ?=
 =?utf-8?B?V1FUT2t2R0RNU0pqYXRZdnE0KzdsbTBRRi9PQ2JoNDhzMTFVVjNvbnBDZmJJ?=
 =?utf-8?B?RG5KaitRZ3FWL2hqWW10NUNTNlYrNHlocTY5VlUxcDBHUG5MYjJ2QmRSSW9M?=
 =?utf-8?B?Y0ZmY3kwSUIvcXhVeWxGQkMrNzFIRzJROE8vRUFwUVV2VGpnL2FvVHozSkhL?=
 =?utf-8?B?MDhaeFpPL0xndVNpUjc5cjZUQmxXQzRCNVNxeVNNclR3TUVzZDdYQStFMElo?=
 =?utf-8?B?ektyYkk4blg0QmlQS245M1ZpU1FuL3E1WDZTSlZxNE9WOEhhYml6ek1LSlZW?=
 =?utf-8?B?R1VFWnhmWG4ra1JpOEhkY3REZkFDV2JpZGs4WHFkWjRHTjJBcmVSUTVMS0E1?=
 =?utf-8?B?ZnE3NlF2RS9hM3h1MVRIM01Tam11ZHE3b2V1KzNrb0NMTXB2LzVMcDdoaEZ3?=
 =?utf-8?B?Smp4d2NPTDJQMWFiVXhNZUFxVzFsd0p4Qi9BbDdFM1ZObkpVU1JlRjlyTGhG?=
 =?utf-8?B?bEZWclNRT2gydmdiNHVRZG00RHBLNTJFdGZkbGhsWGNLWHl4M2JzMjRYK1pC?=
 =?utf-8?B?NEQrTVZjMGp0cVg1RUdqMFQzUzY2dFNPZ29HaHFBMUp0SHNjUndQY3FIeGJp?=
 =?utf-8?B?d29iSVRCVW5TVzFlMlhhQmlwaStOMkRUdW45a3pjQVgxYTJ6S3hKVW9mZVRp?=
 =?utf-8?B?cGtzWVZTYzhiRTQxb28wa2lBUDNXSVZPK3IvSzc4VERKQXZoSysyN2pHTHlG?=
 =?utf-8?B?d05DOUswYVpYbVJ2ZExIK1pBWlBzQVBwcEovUzMxYzZLTFQ2ci9FOXRGbzFG?=
 =?utf-8?B?djlyTHVsbHlvYzNzamtMZC9CdFcrT2hzOVVJUm5DVUNhcDBjR09LRlRVRDVS?=
 =?utf-8?B?WW1PZWJwK2s5K2JHWnpiK2tWMG5LcFY0cWdyU040NitIL0QvTXQxNnZOejJx?=
 =?utf-8?B?b1lZRGlFWHdhOEpyNDBrbU1EVjlsQVJVbDBjejBIM3lYYnYwMlh4cHU4OEhI?=
 =?utf-8?B?c2VnK3RUMFQ5dVNMK1NUeTdBOFNXRGtpQ0czaWM5NUVLRW9LY2JoN1NDNm1Y?=
 =?utf-8?B?SGw5dm9HdEVqVkREcFBhQ3BabUpBMFBJMWVNY0IwUWJkUE5kVmFSRnlvMHpQ?=
 =?utf-8?B?eDlLYU5wYzhXdjlDSzFrL1NhV0lHcFFDY0RsczVCaDZkRkFCMmFwaEZDNXUr?=
 =?utf-8?B?SHJ2YU9ONnFvOG5RNlgvdk05VCswNnVINFcxWXJHeUd6dE1Dc1p3TStCbHkw?=
 =?utf-8?B?MDIzT0RiN1BHZVpvM3RNR3RXbTQwMnkrWVdQcnlTMXBmQ1hYZXdCL3YwMm5v?=
 =?utf-8?B?SklQdGxJdXltdkFDaWhHdjdmREdJWnNHNjg0RmdoTlk2Rkd4SUF2d3hESFRm?=
 =?utf-8?B?VmtSQll0Zm9vYW5GdVAwZ3NkZmFxaURoQ283ejBOTlAwVVNjUVRESFh3VWo5?=
 =?utf-8?B?RFgzUHh4d053V3JLNmpYUm5TRzFPclRONGNybU52TWtmdm5jTVMrdHBXbEFz?=
 =?utf-8?B?Z2EvazFzMXZBQzJ1Zy9Vc2FyWFdWRXVNNzE3alBwbUpHNWVQYnhqVU9IWTFU?=
 =?utf-8?B?KzJtNGdRb09pK1kyMzQvZUJtcVY5V1lxQVpyekJjRm4yQzJLUEczZnZ6MmZh?=
 =?utf-8?B?bFVuRytqVUNITjN3a3FPbFFudjF2WFFBZ2d3WGFta0VETWxEVjJWYTZ2N1Nz?=
 =?utf-8?B?MTBubFdHU3VMRFFqSFVRdGhhUWE0b0JiZWE1RU9LdkRwYlAxZWZMVkg5VFA0?=
 =?utf-8?B?QlZYTGFuUmoxemg4UXlVMWprazBxSmNwQ0U2bCtLSUx0QUdGWVBJblhIODJI?=
 =?utf-8?B?UUIvT2k3MDFmci9RU3ZZQ0F4ZDlOS3RoOFRFTExMY0s3eDZ1N3lkV21WZ1BI?=
 =?utf-8?B?S2tLeVlkYXdvRkdpZXFRZHpnaW9jU0xMV29pb3JTa3BIdGd0ZHdobnZKWmZl?=
 =?utf-8?B?RjlZZThReFFMdEtUTDRWVDhQaFZESkRvTDY1VmZvOHVqU0cxYnNzVExJY0JN?=
 =?utf-8?B?djlNWXFDdlJsVHZTVFRYQjlzRU04cnBiS0hOdXJMZDhYcTc0Mm5lQT09?=
X-Exchange-RoutingPolicyChecked:
	1rzMKBPjL5PRsGf2CTmrOQ5S4I+6eosE8epAs8kEgH7djTdFwoP/zbt+nNjyEALt7Fpju6f7pOxcgYlmu/5eCBMu8sE+ZFdZtYZ5Nf/A2vxr7QgrMXDM2jFlWkZZcKFliqwIleZ7R6EzSvuOx7eVTGO4420mLpDWf3vNBI6zcSIDNvHlEF7vDdHqLKAxZ5T7y+Bn3ye9bRmXUSMc4e2p3CohoketUMsin4kNpjXbbgPeiYMj+YFzcjuqjZP3Dioq+EgkeoNkHgtYhWh3IzmfrEGrApl+7R9WcloeccA2syjeZgU1rFTukKUZeA1lW5ABAGG22ifALBwoKAPSHYsiXA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8388ae1b-538b-46fc-f34a-08df100bea8a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:52:27.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxG0UPA4erIoXEzY0msG2gFNSdht0eNUgJ6svp87D0QbeT9nsDQ0/BxHlENkbm5vYzo73d3RlYmQ1haGNE2X+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989357
X-Proofpoint-GUID: xqf54tG6oHQC_3gilR-1kusN99nsajY0
X-Authority-Analysis: v=2.4 cv=DPMacCNb c=1 sm=1 tr=0 ts=6aa4079e cx=c_pps
 a=pBF/iFUSQWMAsEqgfgMJMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=tJ0stoMY4fr_anPV:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ugNRTJOwpmtT476g4l8T:22 a=gAnH3GRIAAAA:8 a=hyX-LaOQUYohgLZ5MeQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfX1aF6byZFty/i
 4ZG7H9cXMLAjXrCIhjD8uV9lk3rrjLbuRjUGnjB2fGM4l9GaCc4Os5TZkrwjAUUIwKZEU/24mbC
 GreLqlFY2+2tEys5+FILDKDrYaJz3DRxrchsebD8el5KzQ9DURvs
X-Proofpoint-ORIG-GUID: xqf54tG6oHQC_3gilR-1kusN99nsajY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5MyBTYWx0ZWRfXyQ1gESM+obuu
 1Q3DCHBeDz8PV//BCrxD5ZWy/mlyoZFq4X2kVP7DsHsbKjuuLAb0boq1HaYs8ReUD83IaLFhw4A
 /SZ/z6OozPoTCdxvvP7GicghSty8no8rTo3hI5Zm4g06H5qIDvGTbYht7TpXf+y8eQowCyxtAFN
 2s5UcwQFHThq3O5hfvTbK2Ce5E16yOzZoDTey2uzbW7OoZYeALlMXaIa4Jr6PZv9z7igqdHkLJ/
 kRBSSre26EbkM33WdzuU64JyMs8dwemR6lpXeWG3A7HdDYgZHIPkLqzLTZogI8M08aRbbOEK7Bo
 I529OYKDli7pa0Ki+dMtQiYcRko/r6eKN2YyrN9W07rZuSb4aGpjuPq3aJZo6jR/lg8KhraG2pW
 SSuQrixne8iuAKbfLglv0cIVK+aqMxGOR56iJ+A4LmXuQRO9b5/nR5fIBM1pEPPgrcFWgKUegx6
 T4bOabyYWKOCPKQm7yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110193

Increase the number of phases to 16 as a new upcoming device supports
such a number.

While at it, add a new mask for controlling the source of the output
voltage.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/pmbus/pmbus.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 2cd3216b3cd9..920c1102ab6d 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -242,6 +242,7 @@ enum pmbus_regs {
 /*
  * OPERATION
  */
+#define PB_OPERATION_CONTROL_V_SRC	GENMASK(5, 4)
 #define PB_OPERATION_CONTROL_ON		BIT(7)
 
 /*
@@ -386,7 +387,7 @@ enum pmbus_sensor_classes {
 };
 
 #define PMBUS_PAGES	32	/* Per PMBus specification */
-#define PMBUS_PHASES	10	/* Maximum number of phases per page */
+#define PMBUS_PHASES	16	/* Maximum number of phases per page */
 
 /* Functionality bit mask */
 #define PMBUS_HAVE_VIN		BIT(0)

-- 
2.55.0

