Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07B37C90F;
	Fri,  7 Aug 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104251; cv=fail; b=jQB8ZrUoQi/BJvRs7RmupF0mgvQ89LYih4rq6grWdUxJWeCVJwiO7alvJk33AttBKtCLrd99CGntzkbCpXjhXEDo8c58lQ9ln4IT0eeSpZuuYbo+mPmq4BBCg7LFYlyp7g/wtxlNa4E/XTjgPKpYgdIoNhLh9X0M5svQrlN8mJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104251; c=relaxed/simple;
	bh=7fn3nk9b5Fr+2hI4/52bltpPgkr6fmLOd5ox9f5PAz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h/NarK/dDViec4r55hIh4QJUpeYGrORqkOR5tQjfiA8j+LxdNDxymWSWz6y2O5SRdm/pQF6OGyS0fHKv7vSU347+QeS6jfyltu0cq/iNlsvxyN+fTpTfcr40pJ8Y/s0olPOH9wk2uNTc3Lc4HryPUhbMr2SnR6Wf0MILY3Zo+I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pDAj4iJ8; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pDAj4iJ8"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777UCFm1637886;
	Fri, 7 Aug 2026 08:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=s2tvq
	Qe8kYod4z/EWIWbITA2wLs6h+gRJVJ7naWXdCM=; b=pDAj4iJ8b/4lR9xdfOW59
	2smTNju0gisUggHj9JBQZO8aI56IpjYMjS9P6pmRkGmOkXdoPma/Zd1QFWFP7fAp
	L42q2MFnqDMGh5uqOOrLYp1yyY3t8vGq87qbckJHIEbt7uY1QtbzewkGMhJ6sKyR
	8eAPaJtAttOum4FpPC8y4s+E3Sgiu2usmXtBE737nCRXLFB42+Iaw/0Q2uvrq0q+
	ZG8/exCysQU6LBXugt/xFZprin806PGYe0XNQyeSIktXHXNVP5QsbVqCS1Sj9ktV
	HhxyM2je9/rdrXpOWdt4AIYQIE12ykepC8K9jb10yAoJ99ha7W2fTV8cqTlwUIdv
	A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fvrdf5rgw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 08:03:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awJNECxQ04XyDkVZpmugVJ5ok2kUGpcSPxPdr9iT+aOjGa627vybDsfrc0I7YPwolWdSpg5KTAxnNJIftcritsZWsfyUjVa/JuWXXOAG2djnXphjcr2N8n+pR2U2VbO3subgkJuxiEV8VZYOErHfi4Lb6vhlsZ6UHFl8GMSUoulgBn9A0qetnQr3/umhBJAuj/HQR96axpWwCCWYX6ZUnqdvxIZj4HBPE9YlM2lzYYqC5a9264JVjssKkLm1uF8///mqcTW/r3ucB8J5oeJccFwOnLD0J2RmzvAuR/kMwgP4otL0Bd9cfncrxgD7kEMJ8EMvbD7t8LKtLEN1ZGrsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2tvqQe8kYod4z/EWIWbITA2wLs6h+gRJVJ7naWXdCM=;
 b=Adm9y4U0LgCJqcGKbihq8GcTFw2TbeZHj47SCJAhwVS+IglyKSKNBj9uvu+NKEMJWGbnBtWYjtGrF1YGHFMF04gcteZIazZj6YVPIoL6Z64YbYjZpeFMOuuB7kkGTR/pXNQdN/wgxfJ+g64+6E/V212GZtxawhlCML/ncw4wGw5FUG22p45wrYD9/vY/YxBmSwR50D5B/ztJu19uQYtZgN2zbFwM8JA7X5KEtVTn7RUKfeWPTOELt7gIzUFXanSimWM82SIYDFQ/nzt9ZnlZl9WHjZ/j8UpE8YFb+NN7ZcnTHst1MGVW/noklfGylMQXnO8Brd0Ozhml4VpL3imLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SA0PR03MB5499.namprd03.prod.outlook.com (2603:10b6:806:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 12:03:11 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 12:03:11 +0000
Date: Fri, 7 Aug 2026 13:04:18 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Message-ID: <anXIyLOqFTieSeiq@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
 <15f4a141-7e69-47e2-b584-9c1490447e12@roeck-us.net>
 <anGsbjdpV_qw3QDp@nsa>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anGsbjdpV_qw3QDp@nsa>
X-ClientProxiedBy: MA3P292CA0058.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::7) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SA0PR03MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c7914b-72f1-47b8-8437-08def47bd9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GGSE2nFFp0+cs/uAgiIUeBHQzjgO1AsxgJtOWfMQy7vNeHO8O6paZO1A5xRQW17aB2sinfARuf0W9WLeCtKv2rOGsE5wpe5A5vK09JeIPbbI7f9+6HI4rz7RmhplrwWhlpaVOkHfq1XLHAqxM35Kuj26fomWkbPtT6XeQDWqdkwAgyP66SZLi63Ucb0f1ZohmTvnma350kTbaI10RO+zEowq+toQm5OJljcm2bfYs8bcdcIcJzNynvf/aY/cev+z0yy7TFSFKvroB29YONpdRhYDp7tCSRCT1CA13bsCCy8Cjz8/SFtATxWv8pDVT5cDzsKX7bR/KCW2aC3oqJKnULShk5sq4A4Sit5BZh43rgD3RXxys5qFZd6IlhPfcpmpQavnW/KJICBpFkgE7fGzEaR0hnM+FLcVnq/pUpSUgXjuYZIuPOmVA3U0kLUBSLgMse+uTgJvjTgrQeNGkVYMS/YjgLPOytwe2jwUj5pRa3fjs9Nvu89AUpTC8LUS6L0nuZlZFKgThryWvozAkIXy1nEh3oLv6ZML8PwlsUy21iTR7QEJf3aiMwGDEwTG9dkHRpYYLgD4XwvvsL55OYE5BPECxQA/cUwq4En6syBz4vDoT1TdF47kwoMiU8tO56FFZRywCQhPYu1bhdYcviMKXy4jE/b/ctz/hXJeoS/BCQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnVGY0tKZ3hkRkt4TnB1cjJOZkxYRzBsSGd0V3RadjJNbGdUbG1xZ2JHVkZZ?=
 =?utf-8?B?QTkxem15Q3h3Qzk5R29tTk5YeDU4WnRldmFRdzVqbEdLWUdKalIrUHFoT05Z?=
 =?utf-8?B?OVc5UFowNkdxSEIycm1qcGRJcXdjQ2tMWXZIUndaYzcxY2xGYXZHdzM2L2gw?=
 =?utf-8?B?anYxR29BdUNJTjBGdlVRWHRCanpURVlabmVKRFZvd2I5aHg3bkxKK3BEUkRs?=
 =?utf-8?B?ZG9oZ3VaVU1FUVlDYWM0SGRFR2sxRVpKc1MxY2xIRUNXSDlNSDJ3NTZveFQ2?=
 =?utf-8?B?VzBXTUtUbmpmbVZ5RkZ5dFVQVndPNzZrdjBibXBGekYzSzd3aG42Tzh3bkRF?=
 =?utf-8?B?ZjMwKytsa1FYN3pJaWNhdzJ3TUw4THB5Q0ZGd2RWOU1PbWR6dGtlL2prR1Zs?=
 =?utf-8?B?bDR4dlIyR25kWUg1U0JrajZvanJSVnpNUmQ0MFNWaHVqZEREZXVjbGpLeVAv?=
 =?utf-8?B?V1libnVYNDNUV0Y2R1RFVFlSMk5pRnFLSW82RnpxRXIzSlhWdk10Yll1TkNs?=
 =?utf-8?B?b2lNUFF6T1BuYXhsbit3QldtMGpESWJ5QXBsR0h6NFVDUXBXSVE0OUNKYmp0?=
 =?utf-8?B?RDgvbTFISndIaWREOUN0UnlodkE2L3FmKzFtYi9rb1JRZGo4SzBpUC9MNmZq?=
 =?utf-8?B?Q1JEOWgwNGdEVW5CcnJySmpYZ0xjeis1YmtaQmhUVndBSHFtUnBqMVNCTEZu?=
 =?utf-8?B?ZEM4a1RyQ0FMbTNnZWVJVW03TFYyMWV5eUZsbmZPUk5kOTZ6WldkR2pWSnFz?=
 =?utf-8?B?U3F4U1hmQWUzbGRzcjhsRE1pZ0VmVGR3ZlBVWVkwclJ5dnM2WFN1ZDdhWnFX?=
 =?utf-8?B?T3F5N05mV2NPQXpJNndzcEthZE9MNXNXbWk4VWpqVkhuMVYySXNwZE5nRC81?=
 =?utf-8?B?VjF5azFtSzkrcUhpR2I1cThTclNHb2prd2djN0V5c0tqdmYvS2UvalpJcS9i?=
 =?utf-8?B?L0I1V3lEZVNqanVnN1VKSHA0aHJhMTFlMHIvWmdFQlVxaS9LdDlUU2RDV3BF?=
 =?utf-8?B?cHBRTmtFc1pGUXBwbHNkSmJFUENPQ1pCZ1JaRSs0ZXFaUnhQaFFMbmluZ0FO?=
 =?utf-8?B?dDhCbVNPSUFOdUdyV3Q0U3NCN1BCWDMyYlhaZXRtNzIrMjlNdVI1Sy8xakZ4?=
 =?utf-8?B?NjFUclRXQVpPdEdNVTBORG1YRTNUWVZTT2ZyQWsvYmpKWEdOSk0wcnp3TWtk?=
 =?utf-8?B?ZVd5MHJVd1AxWXVKOXNuRzBCR00vaWhaU1FGZkkxcUp4b0JwMFhuNUhFVE5h?=
 =?utf-8?B?Y1gySVl0cHZrTlNsc0ljUGJ5eVZEdTJnTzl3WW1tUUNGQlptSDZNWWcxcjY4?=
 =?utf-8?B?WFI1Wmw3RUdObmliV29mYnBuQk9pbFZCOHhOa1lMRFB2N1ZvM0xNODUvcm9B?=
 =?utf-8?B?dVoxSjcyOFhuYkZxcFhLT29lR0k0R3RjSy9LYnM3K3hwQ2FoNmtLZS9GY01y?=
 =?utf-8?B?b2xMVWIwTlFKWUcyUGQ5TXIya25KemJmMUtBSEEzWEQzYW1lRUo1VzV4NlpD?=
 =?utf-8?B?Rk5VTEJTOUR6VUpSM3BnS3Q0ekdkbFNXanUyV0RhOFc5bUx4NGZiUVZhREVP?=
 =?utf-8?B?MVNVdHJHOFphR2Z1QysyZTRCbnBiWlZHY1EyZEFScCtkRk9neGxKK2d4OG9W?=
 =?utf-8?B?WTBwdU1WZXQwb1N6WERFSWlyTXVWanhzNGpDMVl6UW1mYktSYkNsamhsQjhs?=
 =?utf-8?B?WC9RdmRGV0ROb2RKbm1NUWhqQ0V0MUJkL1A1cUZLUkNiVkFseUR2R2hYUEdp?=
 =?utf-8?B?bm50NThlbUJ1WTVOOXpyOVhWa042bFFwOUpEcUQ2QVcvNDR4QStGc0dVRUVV?=
 =?utf-8?B?Zzh1K1RuNmdkMzExNTFGOGZjeFkzdTlsTy9EUWU4T2pWWDVrdTdKZjZvRzZU?=
 =?utf-8?B?aUxGbmoxdlI5R29Gd2pQRWpGVHdiSll6dko0ZHpPc0Q0eVR6cDFYalpLb1Rk?=
 =?utf-8?B?NGJDRGdKNzE0dlR0dzdDMWVVRHZObnUzaU9JVGY2Nmh0WStLTFhJUHlELzJy?=
 =?utf-8?B?TXB1azFqTTRDSmh0VXZlbFdvVlpzV2ZwUW1ScDRJTFNtRk5LMndOUUpHZkdK?=
 =?utf-8?B?MjNLbVZlaVovblFqMEVjNUt0NzZIUDg2akN4eUM4aVJvQmZoRWhpZFV0dUVz?=
 =?utf-8?B?R3A2azRMV0pPTkdEa3Q3Q2Roem1YQW84N296VkFHZ3JWMmRzNERIQXB6Sm80?=
 =?utf-8?B?dnFPT0pidWVkc3JrUE1PdlJTZW4xM2tnTWp3bkZFdVYrQWxXZVFIcWN6SU1L?=
 =?utf-8?B?cjhyaitwcmhTUXphclNtUWwzNHVkY0RhNnRrV21ZVURIVzVtdTNidkNKMEdm?=
 =?utf-8?B?cjRuTjFOVWJ6MVZ0SkhRRUQycE93bjVtV1hWbUF1dnUxU08rSGY2Zz09?=
X-Exchange-RoutingPolicyChecked:
	jdpQKVm1YvIqYd6h+UCyteD36q4fMfKpmfu2sz/DHRqnsXLjPbJmJL252bVXY+Iuf124nqme60kPQMZ772z0czXVYz6RgvriABgQi33Cnyg2AlfLBuES3C1Acp18VXck3janNPfWcR+YN60hJs4HAfGSfQabeqxMzTWueZ+6r5UXlXMgcaczreMwT15GEwciY88dwAHT6o/OlOea9HDJAxP2Oqgh/J3bJwu9yok+i1Gqw02hsmrt8hFB45uxM5UICvMWKwwtmsPrkOpX84tGP2Mk12qFUytGurvewSFUscnl8NQ5p3NfbzMvjKrk8HO/8JEpqmsnuY3CGc8PeDhaXQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c7914b-72f1-47b8-8437-08def47bd9b3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:03:11.0692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re1Vwq1HqjaIi7x0oY/gg8Xu07JCSp1aIQIAz7lO3X+FzX2rHGxKsZJp636qHylaFoNntWxYPyDxLoR2suQLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5499
X-Authority-Analysis: v=2.4 cv=eZcNubEH c=1 sm=1 tr=0 ts=6a75c983 cx=c_pps
 a=6S8oBaZAy1iJ2l9u/b2bLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=rpMERFFlQqmfovjchC8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Y0f7zfrjlqgncPi1ApMFVmVqSn842sQ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MyBTYWx0ZWRfX9qQ97cRSOn4n
 kVIppSHGJdfRaUXGqCDhH0zAtodnDSEsX0VH5FLgfh7jJzxO/7vAdNe2KAExCaBXRxByW03mMRG
 YgGNpsUCNYtmpu8on9Zs2X+9OxPv+CAAs1tyQHZdtlEJIH1syswW
X-Proofpoint-GUID: Y0f7zfrjlqgncPi1ApMFVmVqSn842sQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MyBTYWx0ZWRfX44etD6ne8oBv
 4Vgmopd+DY7Ex5sHvaxI6LckZQeh0DA0wldjgg5yXDbi23EKZ81OJjdqWB5eXXdZOle5oLT/IT6
 RT0PgexBjjZzxIPnZwYxeDY4QFn+0OfZDbgFZ7oKLZBdBippE0xz0czS80bh98gTV1xustvN50C
 VqUlRcV6rZZ89eb/rjyg1v61030uCeATA/8WpFvQjJ50ZzV83H5uWzTTxk2UmB6mGnGImLq3lEk
 D9ZddlFniWlnb0quZJFGK+DW2tr/OC2BzQMRTNwrQlYxsk+3j2/MKf++U91qr1Gz49rRRvdCq2N
 EuxKXMhPJDJsy/sbrzsYJJm8ksE5wA/r5wRk388Tz5zF0Lz2DntnyC6HA+LNgNLpU9dFTlDPc/C
 3fZPD1vo552V3yCvjRAQkCDcpXjMqHzFFcdsFBgCbWOY+whZp8hiibnkJhPYQ1vCdunYW9biK39
 lWiMtXP5QWbSVQdqFYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070093

On Tue, Aug 04, 2026 at 10:20:03AM +0100, Nuno Sá wrote:
> On Tue, Jul 28, 2026 at 03:12:59PM -0700, Guenter Roeck wrote:
> > On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > > From: Nuno Sá <nuno.sa@analog.com>
> > > 
> > > The MAX20826 IC and similar provide a high-density, flexible and scalable
> > > dual-loop solution for high current cores for AI applications. These are
> > > dual loop solutions multiphase voltage regulators. Between Rails A and B,
> > > MAX20855B and MAX20908 supports up to 8 phases total configurable from
> > > 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> > > and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> > > 
> > > Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > 
> > Very incomplete review; see it as first glance feedback.
> > 
> > Guenter
> > 
> > > ---
> > >   Documentation/hwmon/index.rst    |    1 +
> > >   Documentation/hwmon/max20826.rst |  124 +++++
> > >   MAINTAINERS                      |    2 +
> > >   drivers/hwmon/pmbus/Kconfig      |   19 +
> > >   drivers/hwmon/pmbus/Makefile     |    1 +
> > >   drivers/hwmon/pmbus/max20826.c   | 1037 ++++++++++++++++++++++++++++++++++++++
> > >   6 files changed, 1184 insertions(+)
> > > 
> > > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> > > index 29130df44d12..c63992b292c1 100644
> > > --- a/Documentation/hwmon/index.rst
> > > +++ b/Documentation/hwmon/index.rst
> > > @@ -164,6 +164,7 @@ Hardware Monitoring Kernel Drivers
> > >      max197
> > >      max20730
> > >      max20751
> > > +   max20826
> > >      max20830
> > >      max20860a
> > >      max31722
> > > diff --git a/Documentation/hwmon/max20826.rst b/Documentation/hwmon/max20826.rst
> > > new file mode 100644
> > > index 000000000000..be97312dc612
> > > --- /dev/null
> > > +++ b/Documentation/hwmon/max20826.rst
> > > @@ -0,0 +1,124 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +Kernel driver max20826
> > > +======================
> > > +
> > > +Supported chips:
> > > +
> > > +  * Analog Devices MAX20826
> > > +
> > > +    Prefix: 'max20826'
> > > +
> > > +    Addresses scanned: -
> > > +
> > > +    Datasheet: Datasheet is not publicly available.
> > > +
> > > +  * Analog Devices MAX20855B
> > > +
> > > +    Prefix: 'max20855b'
> > > +
> > > +    Addresses scanned: -
> > > +
> > > +    Datasheet: Datasheet is not publicly available.
> > > +
> > > +  * Analog Devices MAX20908
> > > +
> > > +    Prefix: 'max20908'
> > > +
> > > +    Addresses scanned: -
> > > +
> > > +    Datasheet: Datasheet is not publicly available.
> > > +
> > > +  * Analog Devices MAX20912
> > > +
> > > +    Prefix: 'max20912'
> > > +
> > > +    Addresses scanned: -
> > > +
> > > +    Datasheet: Datasheet is not publicly available.
> > > +
> > > +  * Analog Devices MAX20916
> > > +
> > > +    Prefix: 'max20916'
> > > +
> > > +    Addresses scanned: -
> > > +
> > > +    Datasheet: Datasheet is not publicly available.
> > > +
> > > +Author:
> > > +
> > > +  - Nuno Sá <nuno.sa@analog.com>
> > > +
> > > +
> > > +Description
> > > +-----------
> > > +
> > > +This driver supports hardware monitoring for Analog Devices MAX20826,
> > > +MAX20855B, MAX20908, MAX20912, and MAX20916 multiphase voltage regulator
> > > +controllers with PMBus interface.
> > > +
> > > +The devices are dual-loop, multiphase controllers. Depending on the device and
> > > +configuration, the high-speed processor voltage-control interface can be
> > > +Nvidia PWMVID, Intel SVID, AMD SVI3, or AVSBus. PMBus is used for monitoring,
> > > +configuration, status, and fault reporting.
> > > +
> > > +The driver detects whether the device uses PMBus page mode or direct address
> > > +mode. In direct address mode, rail B is accessed at the rail A I2C address plus
> > > +one. If rail B is present, the driver exposes a second PMBus page.
> > > +
> > > +The driver detects the active number of phases and exposes per-phase input and
> > > +output current attributes through the PMBus virtual phase support.
> > > +
> > > +Usage Notes
> > > +-----------
> > > +
> > > +This driver does not auto-detect devices. You will have to instantiate the
> > > +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> > > +details.
> > > +
> > > +The optional ``avren`` and ``bvren`` GPIOs may be provided to control the rail A
> > > +and rail B hardware enable pins. If regulator support is enabled, the rails are
> > > +also registered through the PMBus regulator framework.
> > > +
> > > +Sysfs entries
> > > +-------------
> > > +
> > > +The following attributes are supported. Limits, alarms, and per-phase entries
> > > +are exposed depending on device capabilities, rail configuration, and detected
> > > +phase count.
> > > +
> > > +=========================== ================================================
> > > +in1_label                   "vin"
> > > +in1_input                   Measured input voltage
> > > +in1_alarm                   Input voltage alarm
> > > +in[2-3]_label               "vout[1-2]"
> > > +in[2-3]_input               Measured output voltage
> > > +in[2-3]_alarm               Output voltage alarm
> > > +in[2-3]_high_speed_en       Enable high-speed voltage-control interface
> > > +in_high_speed_bus           Active high-speed voltage-control interface
> > > +currX_label                 "iinN", "iinN.P", "ioutN", or "ioutN.P"
> > > +currX_input                 Measured input/output current
> > > +currX_alarm                 Current alarm
> > > +powerX_label                "pinN" or "poutN"
> > > +powerX_input                Measured input/output power
> > > +temp[1-2]_input             Measured temperature
> > > +temp[1-2]_alarm             Temperature alarm
> > > +=========================== ================================================
> > > +
> > > +Notes
> > > +-----
> > > +
> > > +``N`` is the rail number, starting at 1. ``P`` is the phase number, starting at
> > > +0. The exact ``currX`` indices depend on the number of present rails and on the
> > > +detected phase count.
> > > +
> > > +``in[2-3]_high_speed_en`` is a per-rail read/write attribute matching the
> > > +standard hwmon voltage channels for the output rails. ``in2_high_speed_en``
> > > +controls rail A / ``vout1``. ``in3_high_speed_en`` controls rail B / ``vout2``
> > > +and is only present if rail B is detected. Writing 1 selects the high-speed
> > > +voltage-control interface for that rail; writing 0 selects PMBus voltage
> > > +control.
> > > +
> > > +``in_high_speed_bus`` is a read-only attribute reporting the high-speed
> > > +interface used by the device, for example ``Nvidia PWMVID``, ``Intel SVID``,
> > > +``AMD SVI3``, or ``AVSBus``.
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index fe8808f3ee4c..8518d55800e9 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15843,6 +15843,8 @@ L:	linux-hwmon@vger.kernel.org
> > >   S:	Supported
> > >   W:	https://ez.analog.com/linux-software-drivers
> > >   F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
> > > +F:	Documentation/hwmon/max20826.rst
> > > +F:	drivers/hwmon/pmbus/max20826.c
> > >   MAX20830 HARDWARE MONITOR DRIVER
> > >   M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > > index c8cda160b5f8..8d3568f7347d 100644
> > > --- a/drivers/hwmon/pmbus/Kconfig
> > > +++ b/drivers/hwmon/pmbus/Kconfig
> > > @@ -393,6 +393,25 @@ config SENSORS_MAX20751
> > >   	  This driver can also be built as a module. If so, the module will
> > >   	  be called max20751.
> > > +config SENSORS_MAX20826
> > > +	tristate "Analog Devices MAX20826 and similar devices"
> > > +	help
> > > +	  If you say yes here you get hardware monitoring support for Analog
> > > +	  Devices MAX20826 and similar devices.
> > > +
> > > +	  This driver can also be built as a module. If so, the module will
> > > +	  be called max20826.
> > > +
> > > +config SENSORS_MAX20826_REGULATOR
> > > +	bool "Regulator support for Analog Devices MAX20826 and similar devices"
> > > +	depends on SENSORS_MAX20826 && REGULATOR
> > > +	help
> > > +	  If you say yes here you get regulator support for Analog Devices
> > > +	  MAX20826 and similar sensors.
> > > +
> > > +	  This enables the MAX20826 to be used as a regulator device,
> > > +	  providing voltage control through the regulator framework.
> > > +
> > >   config SENSORS_MAX20830
> > >   	tristate "Analog Devices MAX20830"
> > >   	help
> > > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> > > index ffc05f493213..15601443470b 100644
> > > --- a/drivers/hwmon/pmbus/Makefile
> > > +++ b/drivers/hwmon/pmbus/Makefile
> > > @@ -38,6 +38,7 @@ obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
> > >   obj-$(CONFIG_SENSORS_MAX17616)	+= max17616.o
> > >   obj-$(CONFIG_SENSORS_MAX20730)	+= max20730.o
> > >   obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
> > > +obj-$(CONFIG_SENSORS_MAX20826)	+= max20826.o
> > >   obj-$(CONFIG_SENSORS_MAX20830)	+= max20830.o
> > >   obj-$(CONFIG_SENSORS_MAX20860A)	+= max20860a.o
> > >   obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
> > > diff --git a/drivers/hwmon/pmbus/max20826.c b/drivers/hwmon/pmbus/max20826.c
> > > new file mode 100644
> > > index 000000000000..1b481cdd8c93
> > > --- /dev/null
> > > +++ b/drivers/hwmon/pmbus/max20826.c
> > > @@ -0,0 +1,1037 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Hardware monitoring driver for Analog Devices MAX20826 PMBus device
> > > + *
> > > + * Copyright 2026 Analog Devices Inc.
> > > + */
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/hwmon-sysfs.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/pmbus.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regulator/driver.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/sysfs.h>
> > > +#include <linux/string.h>
> > > +#include <linux/types.h>
> > > +#include <linux/unaligned.h>
> > > +
> > > +#include "pmbus.h"
> > > +
> > > +#define MAX20826_REG_RAIL_PHASE_CFG	0xB1
> > > +#define MAX20826_REG_CTRL_MISC		0xCB
> > > +#define MAX20826_OPL_EN_MSK		BIT(7)
> > > +
> > > +#define MAX20826_REG_VOUT_RES		0xDB
> > > +#define MAX20826_VOUT_RES_MSK		BIT(7)
> > > +
> > > +#define MAX20855B_REG_VOUT_VRM		0xD1
> > > +#define MAX20855B_REG_VOUT_VRM_MASK	BIT(4)
> > > +
> > > +#define MAX20826_REG_C_MODEAB		0xDC
> > > +/* Byte 1 bits 7 and 6*/
> > > +#define MAX20826_C_MODEAB_MASK		GENMASK(15, 14)
> > > +
> > > +#define MAX20826_REG_ADDR_MODE		0xEC
> > > +#define MAX20826_PAGE_MODE_MSK		BIT(7)
> > > +#define MAX20826_DIRECT_ADDR_MSK	GENMASK(6, 0)
> > > +
> > > +#define MAX20826_REG_OVERRIDE		0xED
> > > +#define MAX20826_OVERRIDE_MASK		BIT(7)
> > > +
> > > +#define MAX20826_REG_PHASE_DETECT	0xF3
> > > +#define MAX20826_REG_PHASE_READ		0xF4
> > > +
> > > +#define MAX20826_REG_STATUS_MON		0xF9
> > > +#define MAX20826_PHASES_NUM_MASK	GENMASK(7, 3)
> > > +
> > > +#define MAX20826_MAX_PAGES		2
> > > +#define MAX20826_MAX_PHASES		16
> > > +#define MAX20826_PHASES_PER_PAGE	8
> > > +#define MAX20826_INTF_PWMVID		1
> > > +#define MAX20826_INTF_AVSBUS		3
> > > +
> > > +#define MAX20855B_PHASES_NUM_MASK	GENMASK(7, 4)
> > > +#define MAX20855B_MAX_PHASES		8
> > > +#define MAX20908_MAX_PHASES		8
> > > +#define MAX20912_MAX_PHASES		12
> > > +#define MAX20916_MAX_PHASES		16
> > > +
> > > +struct max20826_chip_info {
> > > +	const char *vendor_bus_name;
> > > +	u8 max_phases;
> > > +	unsigned int phase_num_mask;
> > > +	u8 start_index_iin;
> > > +	u8 start_index_iout;
> > > +	bool is_reg_addr_mode_block;
> > > +	bool is_vout_direct;
> > > +	bool select_vrm;
> > > +	bool has_avsbus;
> > > +	bool has_opl;
> > > +	u8 (*count_phases)(const u8 *config, int page);
> > > +};
> > > +
> > > +struct max20826 {
> > > +	const struct max20826_chip_info *chip_info;
> > > +	struct pmbus_driver_info info;
> > > +	struct i2c_client *client;
> > > +	/* RAIL-B direct mode */
> > > +	struct i2c_client *client_b;
> > > +	struct i2c_client *curr_client;
> > > +	struct gpio_desc *avren;
> > > +	struct gpio_desc *bvren;
> > > +	bool vendor_bus;
> > > +	bool high_speed[MAX20826_MAX_PAGES];
> > > +	bool on_off_ctrl[MAX20826_MAX_PAGES];
> > > +	bool opl_enabled[MAX20826_MAX_PAGES];
> > > +};
> > > +
> > > +static u8 __max20826_count_phases(const u8 *config, int page)
> > > +{
> > > +	if (page)
> > > +		return hweight8(config[4]);
> > > +
> > > +	return hweight8(config[0]) + hweight8(config[1]) -
> > > +	       hweight8(config[4]);
> > > +}
> > > +
> > > +static u8 __max20855b_count_phases(const u8 *config, int page)
> > > +{
> > > +	if (page)
> > > +		return hweight8(config[3] & 0x3F);
> > > +
> > > +	return hweight8(config[0]) + hweight8(config[1] & 0x0F) -
> > > +	       hweight8(config[3] & 0x3F);
> > > +}
> > > +
> > > +static u8 __max20908_count_phases(const u8 *config, int page)
> > > +{
> > > +	if (page)
> > > +		return hweight8(config[4]);
> > > +
> > > +	return hweight8(config[0]) + hweight8(config[1] & 0xF0) -
> > > +	       hweight8(config[4]);
> > > +}
> > > +
> > > +static u8 __max20912_count_phases(const u8 *config, int page)
> > > +{
> > > +	if (page)
> > > +		return hweight8(config[4]);
> > > +
> > > +	return hweight8(config[0]) + hweight8(config[1] & 0xFC) -
> > > +	       hweight8(config[4]);
> > > +}
> > > +
> > > +#define to_max20826(p)	container_of(p, struct max20826, info)
> > > +
> > > +enum {
> > > +	RAIL_A,
> > > +	RAIL_B,
> > > +};
> > > +
> > > +static const struct regulator_desc __maybe_unused max20826_reg_desc[] = {
> > > +	PMBUS_REGULATOR("vout", 0),
> > > +	PMBUS_REGULATOR("vout", 1),
> > > +};
> > > +
> > > +static struct i2c_client *max20826_select_rail(struct max20826 *st,
> > > +					       int page, bool probing)
> > > +{
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * If in direct mode and we want RAIL_B (page 1) just return client_b.
> > > +	 * Otherwise, set the proper page (if page mode) and return RAIL_A.
> > > +	 */
> > > +	if (st->client_b) {
> > > +		/* if 0xff just return the last client */
> > > +		if (page < 0)
> > > +			return st->curr_client;
> > > +		if (page)
> > > +			st->curr_client = st->client_b;
> > > +		else
> > > +			st->curr_client = st->client;
> > > +
> > > +		return st->curr_client;
> > > +	}
> > > +
> > > +	if (!probing)
> > > +		ret = pmbus_set_page(st->client, page, 0xff);
> > > +	else
> > > +		ret = i2c_smbus_write_byte_data(st->client, PMBUS_PAGE, page);
> > > +	if (ret < 0)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	return st->client;
> > > +}
> > > +
> > > +static int max20826_update_byte_data_unsafe(const struct i2c_client *client,
> > > +					    int reg, u8 mask, u8 value)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_read_byte_data(client, reg);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	value = (ret & ~mask) | (value & mask);
> > > +
> > > +	return i2c_smbus_write_byte_data(client, reg, value);
> > > +}
> > 
> > Why not use pmbus_update_byte_data() ?
> 
> Good question! I think the main reason at the time was
> max20826_high_speed_en_store(). But now that I look at it again, not
> really seeing any reason why I can't use pmbus_update_byte_data().
> 
> > 
> > > +
> > > +static int max20826_read_block_data_unsafe(const struct i2c_client *client,
> > > +					   int reg, u8 *block, u8 size)
> > > +{
> > > +	u8 block_data[I2C_SMBUS_BLOCK_MAX];
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_read_i2c_block_data(client, reg, size + 1,
> > > +					    block_data);
> > 
> > size can be up to I2C_SMBUS_BLOCK_MAX (32). With that, the above code
> > reads up to 33 bytes, which would exceed the size of block_data[].
> > 
> > > +	if (ret < 0)
> > > +		return ret;
> > > +	if (ret < size + 1)
> > > +		return -EIO;
> > 
> > No, this is wrong. The function needs to return the length of the returned data,
> > which can be up to <size> and does not have to be an exact match.
> > 
> > > +
> > > +	/* byte 0 comes with the block length, discard it */
> > > +	memcpy(block, block_data + 1, size);
> > > +	return size;
> > 
> > This is expected to return the actual data size, i.e., the value
> > in block_data[0].
> 
> I see and in theory I think it was returning the actual data size even
> though with the above code block_data[0] would be size + 1. Anyways, all
> of the above will go away with the new helper.
> 
> > > +}
> > > +
> > > +static int __max20826_read_block_data(struct max20826 *st, int page,
> > > +				      int reg, u8 *block, u8 size)
> > > +{
> > > +	struct i2c_client *rail;
> > > +
> > > +	rail = max20826_select_rail(st, page, false);
> > > +	if (IS_ERR(rail))
> > > +		return PTR_ERR(rail);
> > > +
> > > +	return max20826_read_block_data_unsafe(rail, reg, block, size);
> > > +}
> > > +
> > > +static int __max20826_read_byte_data(struct max20826 *st, int page, int reg)
> > > +{
> > > +	struct i2c_client *rail;
> > > +
> > > +	rail = max20826_select_rail(st, page, false);
> > > +	if (IS_ERR(rail))
> > > +		return PTR_ERR(rail);
> > > +
> > > +	return i2c_smbus_read_byte_data(rail, reg);
> > > +}
> > > +
> > > +static int __max20826_write_byte_data(struct max20826 *st, int page, int reg,
> > > +				      u8 value)
> > > +{
> > > +	struct i2c_client *rail;
> > > +
> > > +	rail = max20826_select_rail(st, page, false);
> > > +	if (IS_ERR(rail))
> > > +		return PTR_ERR(rail);
> > > +
> > > +	return i2c_smbus_write_byte_data(rail, reg, value);
> > > +}
> > > +
> > > +static int __max20826_read_word_data(struct max20826 *st, int page, int reg)
> > > +{
> > > +	struct i2c_client *rail;
> > > +
> > > +	rail = max20826_select_rail(st, page, false);
> > > +	if (IS_ERR(rail))
> > > +		return PTR_ERR(rail);
> > > +
> > > +	return i2c_smbus_read_word_data(rail, reg);
> > > +}
> > > +
> > > +static ssize_t max20826_high_speed_en_show(struct device *dev,
> > > +					   struct device_attribute *devattr,
> > > +					   char *buf)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > > +	unsigned int page = to_sensor_dev_attr(devattr)->index;
> > > +	struct max20826 *st = to_max20826(info);
> > > +
> > > +	return sysfs_emit(buf, "%u\n", st->high_speed[page]);
> > > +}
> > > +
> > > +static ssize_t max20826_high_speed_en_store(struct device *dev,
> > > +					    struct device_attribute *devattr,
> > > +					    const char *buf, size_t count)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > > +	unsigned int page = to_sensor_dev_attr(devattr)->index;
> > > +	struct max20826 *st = to_max20826(info);
> > > +	struct i2c_client *rail;
> > > +	bool high_speed;
> > > +	int ret;
> > > +
> > > +	ret = kstrtobool(buf, &high_speed);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	guard(pmbus_lock)(client);
> > > +
> > > +	rail = max20826_select_rail(st, page, false);
> > > +	if (IS_ERR(rail))
> > > +		return PTR_ERR(rail);
> > > +
> > > +	if (!high_speed) {
> > > +		if (!st->vendor_bus && st->chip_info->has_avsbus) {
> > > +			ret = max20826_update_byte_data_unsafe(rail,
> > > +							       PMBUS_OPERATION,
> > > +							       PB_OPERATION_CONTROL_V_SRC, 0);
> > > +			if (ret)
> > > +				return ret;
> > > +
> > > +			goto out_success;
> > > +		}
> > > +
> > > +		ret = max20826_update_byte_data_unsafe(rail,
> > > +						       MAX20826_REG_OVERRIDE,
> > > +						       MAX20826_OVERRIDE_MASK,
> > > +						       FIELD_PREP(MAX20826_OVERRIDE_MASK, 1));
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		goto out_success;
> > > +	}
> > > +
> > > +	if (!st->vendor_bus) {
> > > +		ret = max20826_update_byte_data_unsafe(rail, PMBUS_OPERATION,
> > > +						       PB_OPERATION_CONTROL_V_SRC,
> > > +						       FIELD_PREP(PB_OPERATION_CONTROL_V_SRC, 3));
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		goto out_success;
> > > +	}
> > > +
> > > +	ret = max20826_update_byte_data_unsafe(rail, MAX20826_REG_OVERRIDE,
> > > +					       MAX20826_OVERRIDE_MASK, 0);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +out_success:
> > > +	st->high_speed[page] = high_speed;
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t max20826_high_speed_bus_show(struct device *dev,
> > > +					    struct device_attribute *devattr,
> > > +					    char *buf)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > > +	struct max20826 *st = to_max20826(info);
> > > +
> > > +	if (st->vendor_bus)
> > > +		return sysfs_emit(buf, "%s\n", st->chip_info->vendor_bus_name);
> > > +
> > > +	return sysfs_emit(buf, "AVSBus\n");
> > > +}
> > > +
> > > +static SENSOR_DEVICE_ATTR_RW(in2_high_speed_en, max20826_high_speed_en, 0);
> > > +static SENSOR_DEVICE_ATTR_RW(in3_high_speed_en, max20826_high_speed_en, 1);
> > > +static SENSOR_DEVICE_ATTR_RO(in_high_speed_bus, max20826_high_speed_bus, 0);
> > 
> > Those don't look like the values should or would be changed on the fly.
> > Should that be devicetree properties ?
> >
> 
> Devicetree makes it easier to handle but let me ask around to people who knows
> better about these chips usecases.
> 

Ok this is what I got from apps:

"...Once the CPU is set and running, you're right where they may not want to switch the communication
mode from SVi3. But they still might want to have this flexibility for debug purposes..."

So plan is to support this as a DT property and turn the existing
device_attr to debug ones.

- Nuno Sá

