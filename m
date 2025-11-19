Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023123.outbound.protection.outlook.com [52.101.83.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9534D913;
	Wed, 19 Nov 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548819; cv=fail; b=oxBHuLccustZKZuFIN5MwMzvXQuN8dKlpTkf0/lce7Q0OCcPy0z5dFj4jbxJTlOa4TuFGv2nX/8TW8cj470kuiI3oGrxMBkt+TEqkOQgYGcwwmM6EJbQiYP6TTnn1shrm492lGtuBgl/ejH4L6kpqe8sFL5GJEB53e+jXZi5VZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548819; c=relaxed/simple;
	bh=VSErjFkjv8Lrjh7a9BZ9LvBSaMvdZvC72gyzjJlc2lE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZHltvlRw39LFpdcqmWXnD32vtBnCNFxdJHBZB2pDb2pzg+G8oxGtR8Fw9eoVF8Z9XY7iHd2nZMztEv6pb8aHhzNGvWxkx0NICL+197F3DOiuHPnZtiBvAjzFjfKWs5B4zP+YNHW2T4RGhuo0axX9ceVPWZFoX29OeUMWE7BqqRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com; spf=pass smtp.mailfrom=becom-group.com; dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b=guba5sni; arc=fail smtp.client-ip=52.101.83.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=becom-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becom-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BECOMElectronics.onmicrosoft.com header.i=@BECOMElectronics.onmicrosoft.com header.b="guba5sni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGH3B7+vRYBbQI6+7OE2Y5qR0jvqy4czToxuRID+jBfgovMhpBwOZQX00lqqpDUTt5DRAHdh1TdaFWEwK2DAkDpBt4/94zJG27VgwFlLsiDgtH2qDFKOHk/FLutZmXx6NCUXoZ5T/O6X0ZctyO4lFZyQFxU9QLyMJhV6XYdYE2hJ3XPlTVka9FemLLDRbF6a3q13EPZeR1RLAWJ7WK0uyrd65qMwWBUrGneGGcfF+8IQuVTOJe2Ag1It5CrvOyqZjvEh8NXXfNk09iphlOR/a/Zm67xQro6sdOLrn+Hm7UgFJEoizB61MJWhE8+A/0fSmeoIuV7QyW80mSsjJ0k1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxpxXPb7yDkaKuhOsqMWRXG6YixhKiqKUbkodVkVzY4=;
 b=q9SfgNLpbNvWR/9Idn8auEW2ELk5C6q6pE6q2GhVbaaXlb1eBDjbUG1B7iAwHySaAdLegQ8u65zRauDlvqPYkzMtZJX82yn3S/RQmXZTP9vVWYULsO92IUHF1yjs3sBhOeETnXURikaxIt9y9yrw29gXEyxMA4mRxr+mX4UJBLXM3AWj7sCXLhAVG4e09yxjp9vlcCe1MuJJgKX9saDCBh3AnoVV0bSvtSpnmrssq+I3qkp95shvZWf7I6wVp6W3LjbUst2iSoJHWJ+IbqcgrLQh2JPKwKU3mNPpjeOtLcbukhNJmXTA1+BqI6V2ZjMZMvW1HHLpH35NqdarzAjxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=becom-group.com; dmarc=pass action=none
 header.from=becom-group.com; dkim=pass header.d=becom-group.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=BECOMElectronics.onmicrosoft.com;
 s=selector2-BECOMElectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxpxXPb7yDkaKuhOsqMWRXG6YixhKiqKUbkodVkVzY4=;
 b=guba5sniSTrwhpIJgLLYJJKcsCanG/3Ar4CEIAD6PJB0re7BzF4MSsQ/UfyCIM3sfFbjUCtPHZnN/fdKGPaIDt/7EqK/6v5weKfzzXxnottl6TYOq1PW/ryEjzsvNEntDZrm5NdVcJsPhx2Aq4kVk36yGuiPNjyyo3fh5zjSGq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=becom-group.com;
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12) by AM7PR01MB6740.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:40:10 +0000
Received: from PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab]) by PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 ([fe80::5ca2:88f2:e3ee:8eab%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:40:10 +0000
Message-ID: <fbde25e0-eb1c-4c78-8478-6f9de03d3060@becom-group.com>
Date: Wed, 19 Nov 2025 11:40:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH 1/4] hwmon: Add driver for wsen tids-2521020222501
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 Jonathan.Cameron@huawei.com, Frank.Li@nxp.com, michal.simek@amd.com,
 rodrigo.gobbi.7@gmail.com, chou.cosmo@gmail.com, wenswang@yeah.net,
 nuno.sa@analog.com, paweldembicki@gmail.com, apokusinski01@gmail.com,
 eajames@linux.ibm.com, vassilisamir@gmail.com, heiko@sntech.de,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 kever.yang@rock-chips.com, mani@kernel.org, dev@kael-k.io,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251117123809.47488-1-Thomas.Marangoni@becom-group.com>
 <20251117123809.47488-2-Thomas.Marangoni@becom-group.com>
 <77cc198c-10a4-4b10-a420-88a30f9e5282@roeck-us.net>
Content-Language: en-US
From: Thomas Marangoni <thomas.marangoni@becom-group.com>
In-Reply-To: <77cc198c-10a4-4b10-a420-88a30f9e5282@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0233.eurprd07.prod.outlook.com
 (2603:10a6:802:58::36) To PAXPR01MB8613.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:232::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8613:EE_|AM7PR01MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: ad974466-73b5-4c10-ee11-08de2758039a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjFZcEFpRThzcWkzMzJjVTJsdnVvcjNseGRaVXkzQXZVK212enM0ODRxc2lE?=
 =?utf-8?B?R2pjLzNsMDlEYXlSdUdSUmR4SityekZZWWZIdGdpZkJ1SklMYjhEbHB2WkY2?=
 =?utf-8?B?S1BUQzNKUEVTMU5ScE5nYVBtTkxibHpnNFVxVFJCMFhKTEN0UXRkM1ZjejNy?=
 =?utf-8?B?NE12UnVtbUprL2Z2Q3VZek4xd2xDQXNCaU1XYXJITkcrdHlqcXI4MlZqRGls?=
 =?utf-8?B?OWxRbnBUZnhacHRiTjF3bWZVcENMbDBHeEoyVFhMSVd4TlM1ZkpLQ05FNG9i?=
 =?utf-8?B?TmZsamY2M1VXd2MxWkJxcXNqd0ZBNkY0WDg4cTFLVnRpc1lZd3NSSE01MU1t?=
 =?utf-8?B?UXNLMlJsM3RSTjNCVnlQQTJkUzVkNXFLSDlQdERlUnJmb3RtNEczNm5Xdkgw?=
 =?utf-8?B?VXBFWTRLdEVEZE1vdjQxUGtPdE9KckdMYjlWa2lDUGJOd3cvdUNkWmcwQWFD?=
 =?utf-8?B?MkE4VTR2VFlPN2NkM2Eyak1RRWc0RG5kR3VlSThYTWtTcnc2S1lGMFl2UUxx?=
 =?utf-8?B?c0RsMlVKeUVFOXZwS3U3LzA2YmxiWE02U0VLYVVxOUJjVktYbTdJTUNFWXJh?=
 =?utf-8?B?aXJ0TUtIcUNzRWVLa3hTRDdkaDR6VkplZXdrSWJhM1NXWXRGRzVORlF6OWhC?=
 =?utf-8?B?NUgzRDVBUjljT1dWSTJFeFhxallLa0JRMkhNTnJKai9WT3FqQkoxV1dCUnlP?=
 =?utf-8?B?VnljZlBocGp3Z0dFYjZDaCs5L3hxeG9mREMxWUJtQXc3eDBBYnpEbFI4S0RO?=
 =?utf-8?B?ZzFaaVBwc21YU1lJYUo4MzVnbGFVVUFsR1dHVWs2N3pTakh2YjNkbHY3YlhM?=
 =?utf-8?B?dXowWi9ERE9icGJCYVJsbjVFOFltVWN6b2RkOWIwRGF3YUdMb2xJb3BEVlp6?=
 =?utf-8?B?bzBDVGhUMkZwSHBFTVJYVnNIV1lZUWU4U0h2RU1SUm5QdW5CbHUwZEgvSE4z?=
 =?utf-8?B?RGxaRzVkbWZEakYybHNJb09hQkEvMUhKbnQxQ2h2dUZCOExNVFpZdTVRUkdI?=
 =?utf-8?B?RmM0T05kNHdvemYwWHd2V2dodjFxMytXM3lpNVpnSHRYaG1aNDM1Z1dHWE9W?=
 =?utf-8?B?Q1o2L3ZIK1BqTW5DQnpRWENicmhpU0RFMEpiVTAybFBSaW16R1pSYTZEcFl0?=
 =?utf-8?B?dnk2ZmFqUFkvQ2JDdHV5cEJodVlBSU5KUnViVGZiNENWbDNqRTlMTlJVZzFr?=
 =?utf-8?B?YkpGdGNSc2NoQVFwY0t6dlhGdEw3b2NqRXlmOGovem1jUGpRVTlxK3dJL2g1?=
 =?utf-8?B?Kyt3RXlIYTI0OU44ZERDT2pNaXM4M3NVM21Uc3BlWmVqbkowTVJxNTAvYVlT?=
 =?utf-8?B?TUpDQ3NVck5CMHF5Mk81cmxvR2FZeS8zYWR1eWE4SnlITk1ydGlnTmtZN2Nj?=
 =?utf-8?B?TUdEcWZWNlByUTF3NzdwQ1QwNEh2VkhEVFhIc3V0Rmk0UEY4WGJ0akVZS1pY?=
 =?utf-8?B?TzRqVksvSExSQlppUjdFcFpBM2hWNDNBVHhPV21tbWt2TWhTdG5OVW1PNWo0?=
 =?utf-8?B?Tndvb3RkUlo3R1dYeURXSDhOYSs2OFJsOFMvRnVreHhkbnYwVDRVR3JvOEta?=
 =?utf-8?B?K29mQXFJTjlaNTFzaGxIdit2VFo3bjlwNUwvZWpwcXZ1eGp2cm01cUd2SlMw?=
 =?utf-8?B?WFBpSVVhUFRISytlRDRNOEVLeWtFc2xxeGNFMzhQaFEvbG13OEtjU2RJblNL?=
 =?utf-8?B?eXpHUGtaTUl3OVRxS0JVTU5PUFROdWE5NFZWekhDc0FzRGNLbXZndWxKai9i?=
 =?utf-8?Q?WBio1Gk+yTu6fjmw4IpSpP8RdMWGhU8MAr/N0g/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8613.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3ZQVGNId0lvaUg1VzlVaXdCSTg5MktkNGJYZGR6U3JzODdEQ3Z5c3E3d1JT?=
 =?utf-8?B?U2tmUUdXNnN6YjROUVN1OFQ1QUk0b2NWK2thZ0RaUmltdmR4WGpHNk5yK1pW?=
 =?utf-8?B?ZVlpZytrdkFtTUVIYjRJMzFvN0ZHbHdFVW1mK3NWZ1Q1dEQ5dHFnRDN6eW5R?=
 =?utf-8?B?dVZkNUpMaGFSQ2JWa3ora1N0YTZzdzhMdmJNSUw1WUVoYVk0Z0Rwb0tkUHEr?=
 =?utf-8?B?SkJiTFhLTk1XQ0pMeW5VTHFoSnZXSzVlZkt5akRuNVVWT2RhTW5KZzRVa1o5?=
 =?utf-8?B?RlR3NDgyMmhBdTVKQzNST3BYbzhqdTNEa1pmNERKVUJ0dFZ1RVZ3c1VuUVlC?=
 =?utf-8?B?U0d6L3FXRVJRQXJ6NHpZeHE0d3R5cjZiTkZlc2pMSnBEeFNEN1ZvdjlBVFNZ?=
 =?utf-8?B?YzNnVVF4VUZMTDNBb3RIY0Rrem5vN25xNjVZYWlQWlZmUVpvSnphbXhiaHZR?=
 =?utf-8?B?MlNKRGkvdThXdDRDTHBSUTcvRGFTSEo2UWl5NkwybGhOdytaLzRrVGp2bGR2?=
 =?utf-8?B?RXd3Z0p5b0hDd0dmL0lkSzhtKzcyMmFNbk5uakdMU0ZmUTJCajAxblVBQ1Bq?=
 =?utf-8?B?Vk9RRndlU0FNWkFrM0pJc25DTi9JYzJqVjJOOHhoSlZxYi9NbU5iQjZzTXA1?=
 =?utf-8?B?UUg0eUcwUmhtVmZuYnJSUTVWc3lDTXcvN2txblBMZUNTUjJYZEpLL0JDY2dl?=
 =?utf-8?B?R1RBTXRYOXl6R1RNZFZpUWh3WWxIL2E3bjZvWk44b0VSbW5ScXprMWJxRTUw?=
 =?utf-8?B?N2trWTBrRGd2K2xMNWE1S0lVOXBBQUtqQisxeXh2MStlYXJrNzB4VEFiMmZ1?=
 =?utf-8?B?V3kzT1pCNkFUKzVhTFRwQzBjUks3by9YbTZvSnJJQW9YZWQ5Qk80b0dlTnBa?=
 =?utf-8?B?UVA4ZDZ1WHFrRWV6c05OL2ZqNEMyOHliUnlkN2NISWlQay93ZDJXbnBlcHJu?=
 =?utf-8?B?UVhkbTdscTVlNnd4UlhMbFJSUkFVMDA1L0RRTEhDcHU0dHBoRVAvRERidDVP?=
 =?utf-8?B?NTZscXZQelM1cDgrTlIrbzJHMG1iN3Qxemc1WVhQcWRkSlRjT1JHdFVtOE96?=
 =?utf-8?B?Mzc0NXhTV21FaEZOUGplaCs3UmdvZyt0ZDZSdFV1Y21QOEliem9ZSnNsSWl4?=
 =?utf-8?B?MHpiVFJhTnYzZ1E5Y2M1Mi9JU09OWVl2em5ZMVBVaG9tc0pweEZFaHhMK2Zm?=
 =?utf-8?B?UThSTXJNdW9IMzhUelNxejQ3S0JYellTUEc1YU96ak9lT1ZtdjJqQTN4ZFFQ?=
 =?utf-8?B?cUZSYW5uOE11ME5FVEtHdlhhVk95TXJDOWpTRkxtQm1Xd0U1L2RneXlQRWhp?=
 =?utf-8?B?YlRmTG1EZ29URFNlNExBYWR0OVBYMS8yWUVqVlNTSjlGVm1HYmpMemNhZG9h?=
 =?utf-8?B?Ym5FMnp3TGoyeDN6ZThrY1lLWFVzNUZmb3FJUnkxbGoybk9jdm1TNnpFZVlE?=
 =?utf-8?B?MVVwQjhUZ0FjR3RXazk3VzNmcnoxVVBvYjJWeitYbEFFRnB2eW1PWWRHVnZj?=
 =?utf-8?B?UzFyaDlEaVdHVXNlMENqRVhLd3NyWnZScW9JYkFVOVV3Q1IxejhzcnhoeXZP?=
 =?utf-8?B?RHRlakxjV0ZQWVdoM1V5c0djMlNWMThJa3VyQ1JQV3NqTGhUNXlDaUZOSUdi?=
 =?utf-8?B?dytSNUxlRE40Q1hsbUxFTzNMems5ZGxsK1ovNWpJMmRucUVDMEFxdUhNYTcv?=
 =?utf-8?B?NVRUdUdHcks0UlhDUlY0RGZtL2xXRzJNcVZVQlVkcUhZRFhkQ2g1S1M3Vk93?=
 =?utf-8?B?ZjlNdlY3Y3VGejYydi9PQVZ1dHRVZHpXUmYzL2lOT2pPMWVmdDdNem92dmk3?=
 =?utf-8?B?LzU0NVRwWkFPb0duc1lkVnNpTTdWanhra3h2aHRKdk5nYXloRU42YXFvbkU5?=
 =?utf-8?B?YXRDbmYzSzhXYWtGbmM4OUlWczVMTEZWNy9iMGZCeGtmREYvRDdKdWx5Vitu?=
 =?utf-8?B?Y1owRm1GT1dGQVdUTVdJZklHMjFWSXprUEVUSDFEb2RuZHFQMWxrRmF0dXRM?=
 =?utf-8?B?VEwzM3RrYkRORTR6TGtzNWg1UzFjeWdkbnRiUitNWENnekY2MkdxR2poTzRE?=
 =?utf-8?B?a01zVm01d0x1cnlGN1o2dHVQRXJOY29ZQmNOZHVIUHBUMW1uUUFvT2ZRS1Q5?=
 =?utf-8?B?QUhrQzlSRGs2QThIWUxwZk4xdUFhdjhPUmhzOVIxenZiaEhXbmJSWHBEVVJT?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: becom-group.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad974466-73b5-4c10-ee11-08de2758039a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8613.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:40:10.5932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 738f6472-f50a-488c-ab88-c200fd976533
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OcqreR8IE3L63IX3MGV5cfSKMxD1xkPf0eu2Pj64zBoYc3zKFMD+41HwzKj6UdBS+yuQP66hXeS87CtEQoenu/sXtru+5mNgzKrvrYv7ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6740


On 11/17/25 17:24, Guenter Roeck wrote:
> On 11/17/25 04:38, Thomas Marangoni wrote:
>> This commit adds support for the wsen tids-2521020222501. It is a
>
> What is the relevance of "-2521020222501" ? As far as I can see it is 
> just
> the order code, and the sensor is just "WSEN-TIDS", as suggested by the
> documentation. I would sugest to drop the number unless it has some 
> actual
> relevance - and, if it does, provide a rationale for it that is better 
> than
> "this is the oder code". The order code can change anytime, after all.
>
Yes, you are right its just the order code. I've removed it from the 
next version
of the patch.

>> low cost and small-form-factor i2c temperature sensor.
>>
>> It supports the following features:
>> - Continuous temperature reading in four intervals: 5 ms, 10 ms,
>>    20 ms and 40 ms.
>> - Low temperature alarm
>> - High temperature alarm
>>
>> The driver supports following hwmon features:
>> - hwmon_temp_input
>> - hwmon_temp_min_alarm
>> - hwmon_temp_max_alarm
>> - hwmon_temp_min_hyst
>> - hwmon_temp_max_hyst
>> - hwmon_chip_update_interval
>>
>> Additional notes:
>> - The update interval only supports four fixed values.
>> - The alarm is reset on reading.
>> ---
>
> If available, please send me a register dump so I can implement unit 
> test code.

I don't know exactly what you mean with a register dump, I made one with
i2cdump. If that's not enough can you refer me to a documentation or give me
a command I can run?

This is the i2cdump:
         0  1    2   3   4   5   6   7   8  9   a    b   c   d   e  f
00: 00 a0 00 00 4c 00 80 0c 17 e0 00 00 00 00 04 00

>
>
>>   drivers/hwmon/Kconfig  |  10 +
>>   drivers/hwmon/Makefile |   1 +
>>   drivers/hwmon/tids.c   | 560 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 571 insertions(+)
>>   create mode 100644 drivers/hwmon/tids.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 8c852bcac26f..5e578241001f 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -2647,6 +2647,16 @@ config SENSORS_WM8350
>>         This driver can also be built as a module. If so, the module
>>         will be called wm8350-hwmon.
>>
>> +config SENSORS_TIDS
>> +     tristate "TIDS"
>> +     depends on I2C
>> +     help
>> +       If you say yes here you get support for the temperature
>> +       sensor WSEN TIDS from Würth Elektronik.
>> +
>> +       This driver can also be built as a module. If so, the module
>> +       will be called tids.
>> +
>>   config SENSORS_ULTRA45
>>       tristate "Sun Ultra45 PIC16F747"
>>       depends on SPARC64
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index a8de5bc69f2a..def052b2bdfa 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -244,6 +244,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)   += w83l785ts.o
>>   obj-$(CONFIG_SENSORS_W83L786NG)     += w83l786ng.o
>>   obj-$(CONFIG_SENSORS_WM831X)        += wm831x-hwmon.o
>>   obj-$(CONFIG_SENSORS_WM8350)        += wm8350-hwmon.o
>> +obj-$(CONFIG_SENSORS_TIDS) += tids.o
>>   obj-$(CONFIG_SENSORS_XGENE) += xgene-hwmon.o
>>
>>   obj-$(CONFIG_SENSORS_OCC)   += occ/
>> diff --git a/drivers/hwmon/tids.c b/drivers/hwmon/tids.c
>> new file mode 100644
>> index 000000000000..0176a5e8b574
>> --- /dev/null
>> +++ b/drivers/hwmon/tids.c
>> @@ -0,0 +1,560 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/*
>> + * Copyright (c) BECOM Electronics GmbH
>> + *
>> + * wsen_tids_2521020222501.c - Linux hwmon driver for WSEN-TIDS
>> + *                             2521020222501 Temperature sensor
>> + *
>> + * Author: Thomas Marangoni <thomas.marangoni@becom-group.com>
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/delay.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>
> Unnecessary include.
>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +/*
>> + * TIDS registers
>> + */
>> +#define TIDS_CMD_DEVICE_ID   0x01
>> +#define TIDS_CMD_T_H_LIMIT   0x02
>> +#define TIDS_CMD_T_L_LIMIT   0x03
>> +#define TIDS_CMD_CTRL                0x04
>> +#define TIDS_CMD_STATUS              0x05
>> +#define TIDS_CMD_DATA_T_L    0x06
>> +#define TIDS_CMD_DATA_T_H    0x07
>> +#define TIDS_CMD_SOFT_REST   0x0C
>> +
>> +/*
>> + * TIDS device IDs
>> + */
>> +#define TIDS_ID_2521020222501 0xa0
>> +
> Not used.
>
>> +enum tids_update_interval {
>> +     tids_update_interval_40ms = 0,
>> +     tids_update_interval_20ms = 1,
>> +     tids_update_interval_10ms = 2,
>> +     tids_update_interval_5ms = 3,
>> +};
>> +
>> +/* TIDS control register */
>> +static const struct reg_field tids_reg_field_ctrl_one_shot =
>> +     REG_FIELD(TIDS_CMD_CTRL, 0, 0);
>> +static const struct reg_field tids_reg_field_ctrl_freerun =
>> +     REG_FIELD(TIDS_CMD_CTRL, 2, 2);
>> +static const struct reg_field tids_reg_field_ctrl_if_add_inc =
>> +     REG_FIELD(TIDS_CMD_CTRL, 3, 3);
>> +static const struct reg_field tids_reg_field_ctrl_avg =
>> +     REG_FIELD(TIDS_CMD_CTRL, 4, 5);
>> +static const struct reg_field tids_reg_field_ctrl_bdu =
>> +     REG_FIELD(TIDS_CMD_CTRL, 6, 6);
>> +/* TIDS status register */
>> +static const struct reg_field tids_reg_field_status_busy =
>> +     REG_FIELD(TIDS_CMD_STATUS, 0, 0);
>> +static const struct reg_field tids_reg_field_status_over_thl =
>> +     REG_FIELD(TIDS_CMD_STATUS, 1, 1);
>> +static const struct reg_field tids_reg_field_status_under_tll =
>> +     REG_FIELD(TIDS_CMD_STATUS, 2, 2);
>> +/* TIDS reset register */
>> +static const struct reg_field tids_reg_field_soft_reset =
>> +     REG_FIELD(TIDS_CMD_SOFT_REST, 1, 1);
>> +
>
> I seem to be missing something. Why would it make sense to allocate
> all those regmap fields and not just use regmap_update_bits() ?
> I don't see any benefit in that complexity, especially for single-bit
> "fields".

I was thinking it is a bit cleaner in code-style when using fields. In v2,
regfields have been removed and replaced with regmap functions.

>
>> +struct tids_data {
>> +     struct i2c_client *client;
>> +
>> +     struct regmap *regmap;
>> +
>> +     /* regmap field for ctrl register */
>> +     struct regmap_field *reg_ctrl_one_shot;
>> +     struct regmap_field *reg_ctrl_freerun;
>> +     struct regmap_field *reg_ctrl_if_add_inc;
>> +     struct regmap_field *reg_ctrl_avg;
>> +     struct regmap_field *reg_ctrl_bdu;
>> +
>> +     /* regmap field for status register */
>> +     struct regmap_field *reg_status_busy;
>> +     struct regmap_field *reg_status_over_thl;
>> +     struct regmap_field *reg_status_under_tll;
>> +
>> +     /* regmap field for soft reset register*/
>> +     struct regmap_field *reg_soft_reset;
>> +
>> +     int irq;
>> +     int temperature;
>> +};
>> +
>> +static ssize_t tids_interval_read(struct device *dev, long *val)
>> +{
>> +     int ret = 0;
>> +     unsigned int avg_value = 0;
>
> Unnecessary initializations.
>
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +     ret = regmap_field_read(data->reg_ctrl_avg, &avg_value);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     switch (avg_value) {
>> +     case tids_update_interval_40ms:
>> +             *val = 40;
>> +             break;
>> +     case tids_update_interval_20ms:
>> +             *val = 20;
>> +             break;
>> +     case tids_update_interval_10ms:
>> +             *val = 10;
>> +             break;
>> +     case tids_update_interval_5ms:
>> +             *val = 5;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>
> Reading a value from a chip can not return -EINVAL.
> EINVAL is "Invalid argument", or bad user input, not bad data from a 
> chip.
>
> On top of that, the regmap field is defined as two bits. The value 
> returned
> can not be out of range. A simple array read would do the trick.
>
> static u8 update_intervals[] = { 40, 20, 10, 5 };
>
> return update_intervals[avg_value];
>
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static ssize_t tids_interval_write(struct device *dev, long val)
>> +{
>> +     unsigned int avg_value = 0;
>> +     struct tids_data *data = dev_get_drvdata(dev);
>
> Again, please avoid unnecessary variable initializations. I am not 
> going to
> mention this again; please fix everywhere.
>
> Also, please use "reverse christmas tree" (longest declaration first)
> for variable declarations.
>
>> +
>> +     switch (val) {
>> +     case 40:
>> +             avg_value = tids_update_interval_40ms;
>> +             break;
>> +     case 20:
>> +             avg_value = tids_update_interval_20ms;
>> +             break;
>> +     case 10:
>> +             avg_value = tids_update_interval_10ms;
>> +             break;
>> +     case 5:
>> +             avg_value = tids_update_interval_5ms;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>
> This code should, similar to other drivers, approximate the provided 
> value.
> instead of letting the user figure out valid values. I would suggest 
> to use
> find_closest() or find_closest_descending() to determine valid values.
>
>> +     return regmap_field_write(data->reg_ctrl_avg, avg_value);
>> +}
>> +
>> +static int tids_temperature1_read(struct device *dev, long *val)
>> +{
>> +     int ret;
>> +     u8 buf[2] = { 0 };
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +     ret = regmap_bulk_read(data->regmap, TIDS_CMD_DATA_T_L, buf, 2);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     // temperature in °mC
>> +     *val = (((s16)(buf[1] << 8) | buf[0])) * 10;
>> +
>> +     return 0;
>> +}
>> +
>> +static ssize_t tids_temperature_alarm_read(struct device *dev, u32 
>> attr,
>> +                                        long *val)
>> +{
>> +     int ret = 0;
>> +     unsigned int reg_data = 0;
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +     if (attr == hwmon_temp_min_alarm)
>> +             ret = regmap_field_read(data->reg_status_under_tll, 
>> &reg_data);
>> +     else if (attr == hwmon_temp_max_alarm)
>> +             ret = regmap_field_read(data->reg_status_over_thl, 
>> &reg_data);
>> +     else
>> +             return -EOPNOTSUPP;
>> +
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     *val = reg_data;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tids_temperature_hyst_read(struct device *dev, u32 attr, 
>> long *val)
>> +{
>> +     int ret;
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +     unsigned int reg_data = 0;
>> +
>> +     if (attr == hwmon_temp_min_hyst)
>> +             ret = regmap_read(data->regmap, TIDS_CMD_T_L_LIMIT, 
>> &reg_data);
>> +     else if (attr == hwmon_temp_max_hyst)
>> +             ret = regmap_read(data->regmap, TIDS_CMD_T_H_LIMIT, 
>> &reg_data);
>> +     else
>> +             return -EOPNOTSUPP;
>> +
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     // temperature from register conversion in °mC
>> +     *val = (((u8)reg_data - 63) * 640);
>> +
>> +     return 0;
>> +}
>> +
>> +static ssize_t tids_temperature_hyst_write(struct device *dev, u32 
>> attr,
>> +                                        long val)
>> +{
>> +     u8 reg_data = 0;
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +     // temperature in °mC
>> +     if (val < -39680 || val > 122880)
>> +             return -EINVAL;
>
> Please use clamp_val().
>
>> +
>> +     // temperature to register conversion in °mC
>
> You are using c++ comment style for single-line comments and C comment 
> style for
> multi-line comments. I am not a friend of C++-style comments, but I 
> accept it.
> However, I do ask for consistency. Either/or, please, but not both.
>
>> +     reg_data = (u8)((val / 640) + 63);
>
> Candidate for DIV_ROUND_CLOSEST() ?
>
>> +
>> +     if (attr == hwmon_temp_min_hyst)
>> +             return regmap_write(data->regmap, TIDS_CMD_T_L_LIMIT, 
>> reg_data);
>> +     else if (attr == hwmon_temp_max_hyst)
>> +             return regmap_write(data->regmap, TIDS_CMD_T_H_LIMIT, 
>> reg_data);
>> +     else
>> +             return -EOPNOTSUPP;
>> +}
>> +
>> +static umode_t tids_hwmon_visible(const void *data,
>> +                               enum hwmon_sensor_types type, u32 attr,
>> +                               int channel)
>> +{
>> +     umode_t mode = 0;
>> +
>> +     switch (type) {
>> +     case hwmon_temp:
>> +             switch (attr) {
>> +             case hwmon_temp_input:
>> +             case hwmon_temp_min_alarm:
>> +             case hwmon_temp_max_alarm:
>> +                     mode = 0444;
>> +                     break;
>> +             case hwmon_temp_min_hyst:
>> +             case hwmon_temp_max_hyst:
>> +                     mode = 0644;
>> +                     break;
>> +             default:
>> +                     break;
>> +             }
>> +             break;
>> +     case hwmon_chip:
>> +             switch (attr) {
>> +             case hwmon_chip_update_interval:
>> +                     mode = 0644;
>> +                     break;
>> +             default:
>> +                     break;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return mode;
>> +}
>> +
>> +static int tids_hwmon_read(struct device *dev, enum 
>> hwmon_sensor_types type,
>> +                        u32 attr, int channel, long *val)
>> +{
>> +     switch (type) {
>> +     case hwmon_temp:
>> +             switch (attr) {
>> +             case hwmon_temp_input:
>> +                     return tids_temperature1_read(dev, val);
>> +             case hwmon_temp_min_alarm:
>> +             case hwmon_temp_max_alarm:
>> +                     return tids_temperature_alarm_read(dev, attr, 
>> val);
>> +             case hwmon_temp_min_hyst:
>> +             case hwmon_temp_max_hyst:
>> +                     return tids_temperature_hyst_read(dev, attr, val);
>> +             default:
>> +                     return -EOPNOTSUPP;
>> +             }
>> +     case hwmon_chip:
>> +             switch (attr) {
>> +             case hwmon_chip_update_interval:
>> +                     return tids_interval_read(dev, val);
>> +             default:
>> +                     return -EOPNOTSUPP;
>> +             }
>> +     default:
>> +             return -EOPNOTSUPP;
>> +     }
>> +}
>> +
>> +static int tids_hwmon_write(struct device *dev, enum 
>> hwmon_sensor_types type,
>> +                         u32 attr, int channel, long val)
>> +{
>> +     switch (type) {
>> +     case hwmon_temp:
>> +             switch (attr) {
>> +             case hwmon_temp_min_hyst:
>> +             case hwmon_temp_max_hyst:
>> +                     return tids_temperature_hyst_write(dev, attr, 
>> val);
>> +             default:
>> +                     return -EOPNOTSUPP;
>> +             }
>> +     case hwmon_chip:
>> +             switch (attr) {
>> +             case hwmon_chip_update_interval:
>> +                     return tids_interval_write(dev, val);
>> +             default:
>> +                     return -EOPNOTSUPP;
>> +             }
>> +     default:
>> +             return -EOPNOTSUPP;
>> +     }
>> +}
>> +
>> +static const struct hwmon_channel_info *const tids_info[] = {
>> +     HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL),
>> +     HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN_ALARM |
>> +                                      HWMON_T_MAX_ALARM | 
>> HWMON_T_MIN_HYST |
>> +                                      HWMON_T_MAX_HYST),
>
> Why do you use "hyst" for limit attributes ? A hysteresis without 
> limit does
> not make sense. The datasheet says that those are limits (thresholds),
> not hysteresis values. The datasheet doesn't even mention the term
> "hysteresis".

The documentation of the subsystem wasn't completely clear to me about which
one to pick. I changed it in v2 of this patch.

>
>> +     NULL
>> +};
>> +
>> +static const struct hwmon_ops tids_ops = {
>> +     .is_visible = tids_hwmon_visible,
>> +     .read           = tids_hwmon_read,
>> +     .write          = tids_hwmon_write,
>> +};
>> +
>> +static const struct hwmon_chip_info tids_chip_info = {
>> +     .ops    = &tids_ops,
>> +     .info   = tids_info,
>> +};
>> +
>> +static bool tids_regmap_writeable_reg(struct device *dev, unsigned 
>> int reg)
>> +{
>> +     if (reg >= 0x02 && reg <= 0x04)
>> +             return true;
>> +
>> +     if (reg == 0x0c)
>> +             return true;
>> +
>
> Registers are defined. Please use the definitions here and in the 
> functions below.
>
>> +     return false;
>> +}
>> +
>> +static bool tids_regmap_readable_reg(struct device *dev, unsigned 
>> int reg)
>> +{
>> +     if (reg >= 0x01 && reg <= 0x07)
>> +             return true;
>> +
>> +     if (reg == 0x0c)
>> +             return true;
>> +
>> +     return false;
>> +}
>> +
>> +static bool tids_regmap_volatile_reg(struct device *dev, unsigned 
>> int reg)
>> +{
>> +     if (reg >= 0x05 && reg <= 0x07)
>> +             return true;
>> +
>> +     if (reg == 0x0c)
>> +             return true;
>> +
>> +     return false;
>> +}
>> +
>> +static const struct regmap_config regmap_config = {
>> +     .reg_bits                       = 8,
>> +     .val_bits                       = 8,
>> +     .max_register           = TIDS_CMD_SOFT_REST,
>> +     .writeable_reg          = tids_regmap_writeable_reg,
>> +     .readable_reg           = tids_regmap_readable_reg,
>> +     .volatile_reg           = tids_regmap_volatile_reg,
>> +     .use_single_read        = 0,
>> +};
>> +
>> +static int tids_probe_regmap(struct tids_data *data)
>> +{
>> +     struct device *dev = &data->client->dev;
>> +
>> +     /* Init regmap */
>> +     data->regmap = devm_regmap_init_i2c(data->client, &regmap_config);
>> +     if (IS_ERR(data->regmap))
>> +             return dev_err_probe(dev, PTR_ERR(data->regmap),
>> +                                  "regmap initialization failed\n");
>> +
>> +     /* Allocate regmap_field for ctrl register */
>> +     data->reg_ctrl_one_shot = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_ctrl_one_shot);
>> +     if (IS_ERR(data->reg_ctrl_one_shot))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_ctrl_one_shot),
>> +                     "regmap_field reg_ctrl_one_shot initialization 
>> failed\n");
>> +
>> +     data->reg_ctrl_freerun = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_ctrl_freerun);
>> +     if (IS_ERR(data->reg_ctrl_freerun))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_ctrl_freerun),
>> +                     "regmap_field reg_ctrl_freerun initialization 
>> failed\n");
>> +
>> +     data->reg_ctrl_if_add_inc = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_ctrl_if_add_inc);
>> +     if (IS_ERR(data->reg_ctrl_if_add_inc))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_ctrl_if_add_inc),
>> +                     "regmap_field reg_ctrl_if_add_inc 
>> initialization failed\n");
>> +
>> +     data->reg_ctrl_avg = devm_regmap_field_alloc(dev, data->regmap,
>> + tids_reg_field_ctrl_avg);
>> +     if (IS_ERR(data->reg_ctrl_avg))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_ctrl_avg),
>> +                     "regmap_field reg_ctrl_avg initialization 
>> failed\n");
>> +
>> +     data->reg_ctrl_bdu = devm_regmap_field_alloc(dev, data->regmap,
>> + tids_reg_field_ctrl_bdu);
>> +     if (IS_ERR(data->reg_ctrl_bdu))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_ctrl_bdu),
>> +                     "regmap_field reg_ctrl_bdu initialization 
>> failed\n");
>> +
>> +     /* Allocate regmap_field for status register */
>> +     data->reg_status_busy = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_status_busy);
>> +     if (IS_ERR(data->reg_status_busy))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_status_busy),
>> +                     "regmap_field reg_status_busy initialization 
>> failed\n");
>> +
>> +     data->reg_status_over_thl = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_status_over_thl);
>> +     if (IS_ERR(data->reg_status_over_thl))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_status_over_thl),
>> +                     "regmap_field reg_status_over_thl 
>> initialization failed\n");
>> +
>> +     data->reg_status_under_tll = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_status_under_tll);
>> +     if (IS_ERR(data->reg_status_under_tll))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_status_under_tll),
>> +                     "regmap_field reg_status_under_tll 
>> initialization failed\n");
>> +
>> +     /* Allocate regmap_field for software_reset */
>> +     data->reg_soft_reset = devm_regmap_field_alloc(
>> +             dev, data->regmap, tids_reg_field_soft_reset);
>> +     if (IS_ERR(data->reg_soft_reset))
>> +             return dev_err_probe(
>> +                     dev, PTR_ERR(data->reg_soft_reset),
>> +                     "regmap_field reg_soft_reset initialization 
>> failed\n");
>
> Following up on the above, that is a lot of code just to avoid using 
> regmap_update_bits().
> Again, what am I missing ?
>
>> +
>> +     return 0;
>> +}
>> +
>> +static int tids_probe(struct i2c_client *client)
>> +{
>> +     struct device *device = &client->dev;
>> +     struct device *hwmon_dev;
>> +     struct tids_data *data;
>> +     unsigned int value;
>> +     int ret = 0;
>> +
>> +     data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
>> +     if (!data)
>> +             return -ENOMEM;
>> +
>> +     data->client = client;
>> +
>> +     ret = tids_probe_regmap(data);
>> +     if (ret != 0)
>> +             return ret;
>> +
>> +     /* Read device id, to check if i2c is working */
>> +     ret = regmap_read(data->regmap, TIDS_CMD_DEVICE_ID, &value);
>> +     if (ret < 0)
>> +             return ret;
>
> Why read this but not check it ?
>
>> +
>> +     /* Triggering soft reset */
>> +     ret = regmap_field_write(data->reg_soft_reset, 1);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret = regmap_field_write(data->reg_soft_reset, 0);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     /* Allowing bulk read */
>> +     ret = regmap_field_write(data->reg_ctrl_if_add_inc, 1);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     /* Set meassurement interval */
>> +     ret = regmap_field_write(data->reg_ctrl_avg, 
>> tids_update_interval_40ms);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     /* Set device to free run mode */
>> +     ret = regmap_field_write(data->reg_ctrl_freerun, 1);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     /* Don't update temperature register until high and low value 
>> are read */
>> +     ret = regmap_field_write(data->reg_ctrl_bdu, 1);
>> +     if (ret < 0)
>> +             return ret;
>> +
>
> Please move this code into a separate _init function. Also, is it 
> really necessary
> to write all those control register values bit by bit ? If so, that 
> should be explained
> since it adds a lot of non-obvious complexity to the code.
>
>> +     hwmon_dev = devm_hwmon_device_register_with_info(
>> +             device, device->driver->name, data, &tids_chip_info, 
>> NULL);
>
> Just use "tids" instead of "device->driver->name".
>
>> +
>> +     return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static int tids_suspend(struct device *dev)
>> +{
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +     return regmap_field_write(data->reg_ctrl_freerun, 0);
>> +}
>> +
>> +static int tids_resume(struct device *dev)
>> +{
>> +     struct tids_data *data = dev_get_drvdata(dev);
>> +
>> +     return regmap_field_write(data->reg_ctrl_freerun, 1);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(tids_dev_pm_ops, tids_resume, 
>> tids_suspend);
>> +
>> +static const struct i2c_device_id tids_id[] = {
>> +     { "tids", 0 },
>> +     {},
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tids_id);
>> +
>> +static const struct of_device_id tids_of_match[] = {
>> +     { .compatible = "wsen,tids-2521020222501" },
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, tids_of_match);
>> +
>> +static struct i2c_driver tids_driver = {
>> +     .class  = I2C_CLASS_HWMON,
>> +     .driver = {
>> +             .name                   = "tids",
>> +             .pm                             = 
>> pm_sleep_ptr(&tids_dev_pm_ops),
>> +             .of_match_table = tids_of_match,
>> +     },
>> +     .probe          = tids_probe,
>> +     .id_table       = tids_id,
>> +};
>> +
>> +module_i2c_driver(tids_driver);
>> +
>> +MODULE_AUTHOR("Thomas Marangoni <Thomas.Marangoni@becom-group.com>");
>> +MODULE_DESCRIPTION("WSEN TIDS temperature sensor driver");
>> +MODULE_LICENSE("GPL"); 

I've gone through all the other notes and included them in the next 
version of the
patch. I will send the next patch series within the next few hours.

