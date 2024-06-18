Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1C18B1A
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Jun 2024 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695089; cv=fail; b=UuWI6vAb9rIFQF/5mb9qkNp6Wf0+1wOtuEV9B/vbbxVcTeI1PdgQmnXPzwKsLNqCudhxxivvzbvR7tJexxJwu4gLOVSMeOzVtJLSS8s5xocy9zSUA5B0Gj2RY/XfDO5dteTG+TXeM5rPtCGPGMEYXoje+y0+nryGCZI091Z4FP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695089; c=relaxed/simple;
	bh=tLuutwcXpOdnAnd2z8L7i6AaX11A9287gaN7fK6Jrxw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DyDtsd7hGF491A/UxP9TnxQ62n5DGisjPTMeSMhRfWHK7rys/2NCocIBqcwh2hyxeVFuNt2f5Pj6wfT7gBqtfvcfDo1LJRDD6trVAoIROuzQwqoPXNj51NurfTxkJ/qv1kNqk54MqhWInM/DDdCc+ld1wREq3fuijK985m0C4U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QBqC60/f; arc=fail smtp.client-ip=40.107.212.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QBqC60/f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BubkiTsqx1LmEFkr8yL4IV3foh7hIzn8k0DFkWc6zlR0i+tq4yGNHAnKqvCtjUx3V6lDde/xeg4rU6gWOBOk7D14rYIaqU40pcJ2Cg/AYEYYFoX9/cdZmhBK0zYO34B1mquQ5PJCEJ6tJ6BewI6G3kqpWJhAagfceEd3CCMcOeng9f+amG+ZWnIzzY+Tw+wKC9+3ccU1nR9ayxQ73qqgu7HFk6iwhvq6Ar0iMmsjeMZYnWaaKbEuJpIOT87qkC77amPGEf5Xd2tOQAV78gXm40HBc/Wj9BhRZJR8K4G6HjgrZOgCmlh1fy50K4IWeYyeaXBjRPRdv6cwDqw0YsMepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Igq2xvjA5AsRdQS/BxIRfIaeZ/tborFzHw4JJYV8OFM=;
 b=OqXAJal+DW6VwnxEWzj/iI8uxw5bINZ5eCMp4YfpJK7MkF5UTPNmZxdxfpCowLsT+ckMhmY3LA86a8PueA1wX0fjpQ2ijp9w4ahc1azs0hXqwO375fZsWlHCaGUdJXepTbgixMZcKf66S75biUFszv1BezJwtqLPRI4ICKc11Pf6rVadEyZut4oDEI5q1StcnAyrnGgu3dl1tpaCMEVF3BiUt/h+QidEYytXp/MrxIidDX0XMntOiJc064S2bZlpRWBprRE/Sd7bIRZwntM35Ata9eRi8uKMbPr6k/6tmV5gqeBXtUU/3aue7GMd+IxmOy+HOyMs0bi2CKabAbNM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Igq2xvjA5AsRdQS/BxIRfIaeZ/tborFzHw4JJYV8OFM=;
 b=QBqC60/fhi5jJSWNwbtHcRoq1kI+5SRKOnuX94tSOAnj5sWEFfcz+i7o8msMmSgI6a4H21ush8weAxPY3T4CIgLZbuTPhLNMY7thwxHB+TDiqZCpBdkf1bvbRqRnVHy4PqUdEYBuUSf5DPmFR+i3hgSwOQq1tKlhOnHet4dYA8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 07:18:05 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 07:18:05 +0000
Message-ID: <19708a93-be04-4163-b111-68d5f71487ef@amd.com>
Date: Tue, 18 Jun 2024 12:47:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] mfd: add amd side-band functionality
To: Lee Jones <lee@kernel.org>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
 linux@roeck-us.net, gregkh@linuxfoundation.org, arnd@arndb.de,
 Akshay Gupta <akshay.gupta@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240613170514.GQ2561462@google.com>
 <e37f0503-0ae2-4651-8e32-1e6444e852c2@amd.com>
 <20240614144930.GJ3029315@google.com>
Content-Language: en-US
From: "Chatradhi, Naveen Krishna" <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20240614144930.GJ3029315@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5286:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6c4512-8738-4578-43e8-08dc8f66cbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTU1VFluemVpcmVTbk1SY3VYcnF6K2RxTElBUDJqK2ZtSzZRZ0VXNzhKK2o4?=
 =?utf-8?B?MHppSis4Ym1VRURiZnpwbTNONjc3bm5FZzBOVURGdGphUU5aRlViNnNwNGZy?=
 =?utf-8?B?Y1FGUi9iWU5nRGZWRi9CdDcwenhnRHFNWXBqMU5pZGhpZCtRRlkxeFZZUDFD?=
 =?utf-8?B?QjNtZ2VQbHI4OG1TeXp2YUpvclZlcXNnbjZwc1B0VDVZNlFLUzlJczNDN2Fr?=
 =?utf-8?B?WCtZejd3OTBxWDY0NEY5UFhPcEtpYVpNVkNMRlZDR29QZ2JHa3h3TjBvKzc0?=
 =?utf-8?B?b2R0elZQMmtDamJIeDVwUk9QZXlmQ1d1K1prUTdvZFFDM3pQSkQwT0JGSllk?=
 =?utf-8?B?TGY1RU5XUjJ0SHNIVktVZGlPZ2tNaXF2OHdmajNqOWRIYW4yWHErVnltM0ta?=
 =?utf-8?B?Vkw4dmp4SXlwYmZoczlxbWl4VGNZN1Z2SUQyWE1kYTZQSEU4ZHBLa2s4bDBX?=
 =?utf-8?B?SVJJenVJUllzLzZHSzRtZlo1dDhTdDlMamJSMytjMFNyYlRwRjcwYThGRU9l?=
 =?utf-8?B?YzdOWE9CMU9TZSt6K0dNUldBVU9kRUlIM0REN09mbnRvQUhhaTJGRXNwL29a?=
 =?utf-8?B?M3pGVUp3d01tWFdZQy9iUmJUendoMWFHc0J4dXNHNUs1Y25JT2c4S1Q0TnNQ?=
 =?utf-8?B?akkrdmJHV3h3WSt3SUZYeUlXMlc5ZUdGK1U0cmRHQmpoZWIwNW1ab3VpL3Ez?=
 =?utf-8?B?YlNSSW40c3RYS2VRWTdoNEVRUXVMclJ4ajR1L3lIYU1jb3JiQU9PcXdwdlJI?=
 =?utf-8?B?bDY5aFFCZlNVNFNReXgyeFc0VXVhN2NTUkwxbGRFUm45MHEvTnR6VTFycER1?=
 =?utf-8?B?WGZZdHd6YTNQQW5DZSt1dGZwd3NmdGM1YU9VMVl1OU9aY01UbEQ0eTNjbWhl?=
 =?utf-8?B?SmdiNE5yOC8ydkJLVG53UE5SQm5HSzdMM2pDU0wweG9FV2MxTFRrODhTbi8v?=
 =?utf-8?B?YVNET3BvVFBxU0hiMXZ2L0ErOXhWTmVXalJnQjVPTUpjNnZhck42dnMweFgv?=
 =?utf-8?B?STJEUVpwRWZqSWVmWkt0WjFaK1k4c2FvOEZwdmREV1AvRFhMaXBET0puVmFY?=
 =?utf-8?B?bnNrMVo0UlBVNUhiK0FZQ1E5RFJjYXc5TDY4RVlId2lyOXRvdFVxeGQ0WTdK?=
 =?utf-8?B?ZjlWdFZXY3dYRmVCZFJCYmhOaHdSRU1WS2ZkVkRZcFVZM2lPRXE3ekVmbnR1?=
 =?utf-8?B?cEJ1RURCMUpIMEZUa0h2OGpweXA3NEV3UWVBUWxkQTk5ZnZtMEsxTWtPZjBa?=
 =?utf-8?B?UkJjanh4dXJCQnNVbmpxYnBRWnQrd1BNM3BaTTBnMTY5cEtuM3F0TGc2RDhV?=
 =?utf-8?B?eWpuWkIxOERlT2NOWjFXRjEvMFRNZ2RrdkNJald3WVFyRzhYditUMmE4OXRT?=
 =?utf-8?B?bjRkcVpiVkxQRE9lWFJHUUM5d3lWZHNKUEowMm9veVJlZU4rYXRTRG9KZ2R6?=
 =?utf-8?B?MWxWSm1nV2grRDM0cVMwbU9MQzVkUTM0cTNycGlDZ01lU25ZeWVSaXVnN1pi?=
 =?utf-8?B?OGZ0YXZnd3FaRUsvNGRqeldadmNRcUlDQUl1dXlMdlo0aXlNS2QzMml4aU4w?=
 =?utf-8?B?YUpKNzlmK0s1V1ZMV1ZQcTI2S2VQdnVsNkZjRHZhUmR1bGhOUHRYZG5vZFU4?=
 =?utf-8?B?dHlTWTRrMy9DcjJjcmI2alBvMW9EZUhCdDRHeERNZHFadmNEcERCUzR5NEdn?=
 =?utf-8?Q?GGBJ02lXThxiU3Zt+Txb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJQNWRmbVlhWWpOQUNhL1BZYlNtWWVsMmw2UFZoc25iNlNwdllJVjh5OXhR?=
 =?utf-8?B?azc5YklhSjBpWEFrTjVLUGs5SFJKL3dJS3RYZXBXN0hsZFYxbUZJOE1uczkv?=
 =?utf-8?B?UFdrV1d4SmlUbDd6SnZLS21PMllsdTl3VGJUTmNOMXdSblc1ZU5UVDVEWVNj?=
 =?utf-8?B?MHJ3QWNsNC9KNk94Y2FZODcrL2ZMZ0lFUnMyZEJZQVl1RXdaVlIrWmtsdFBT?=
 =?utf-8?B?dnhTb0RUQnBaUGZqWmZxRVJqa0FxS3FlYUJxYnRtUUlYdW8yZVVDekhVWDZi?=
 =?utf-8?B?TjNyOXNGMG16U3p3VmlJblN2enZnTWt4Wjg1RHd3RFhmS3JvQU9hcHV3RzRI?=
 =?utf-8?B?VTdHdHBWRmF6VHpLOXpzbTF3aXZ6S24vQWV5bzJvTmFTeXJEOTRscytKT2JB?=
 =?utf-8?B?ZDFFNERGUWxzQ0FNUmlqQjNKVC82TmhrSEY3TU5WazgrSm9DUUd3RFpqK1o2?=
 =?utf-8?B?ck0vSmc5a2ZJMnBEYnFpNE5oV1ZXMmR5U3JpVzUySDdhS1VTOHhLb1d6Tzhn?=
 =?utf-8?B?elZuTEYzMUhhYUs1MUNYTDZSMWdITVFsemJKVXhEZmpiLytodlFSQ05pNUxE?=
 =?utf-8?B?SHFWbjVoMnpkZnRFT2ozRDlERnZMQzZJWmErUXBOdnF5dVVOUjh2QmxqWlVw?=
 =?utf-8?B?blZocS9HL2FJeHhBWUl5R0ZwQWVZakRuamx1ajh4dDdjSVAzSWExTXcxTWdn?=
 =?utf-8?B?S0NOZmprVW5tYU1Od1U3NFZBYkpaZ25YMElQNVAxUkl2RjJObHZPczFFa3hX?=
 =?utf-8?B?UFptdXpIV09RbXYrUml2N1FDU2cxTU9UQUpaRm5qV3NISER4MjE3MzVIVlYz?=
 =?utf-8?B?czZjUElpcGp5V0hnMWJXY01DL2VVOHhJVk1hZ1NNZTZIU00ydThPUlJ0N3Jm?=
 =?utf-8?B?ZW9pLzVkaCtoNHRMdkZURjl6dUxzU0E1WDMxNFFZbmFyazdsbU1pZlErZ3Zx?=
 =?utf-8?B?eDFlbDJhWTd2SjFjVENiaGJWWWM5ZllGU1hFUkx2SGMwMnlwcnFxOVJwSitU?=
 =?utf-8?B?TkhrcGRMaUR1NGYyUDBoN2oxSWpnblNrR2Q1WTdNeldadThEdXMzRGpEVkNE?=
 =?utf-8?B?MWNWVHVsN0pWYmRjNm41d3BLWUE1ckMxR25oalVWWSsyeTZSdzdtTmZCSExT?=
 =?utf-8?B?SnZOdURrZ005ayt1aHNWQ0tZT3Y5Wko5NDlsRm9FblR5VWZ3alROU04yNDhI?=
 =?utf-8?B?NGtGZTdyaVBZZm9TQkczejNlS05DeDNtOTR4TTYyYVArU3A2NkZaV2pqc014?=
 =?utf-8?B?ZTJqTC9nTlh5Q01YeFVpTGYxMyt0Q3RtS29MOFdncEFXS0szWThHUFZOQzlM?=
 =?utf-8?B?bUdNRmZKcVdFU3FiS0FjMlRsZzRiMkpVblhWL0pJcDFaOTJnNWhPSk44NnhV?=
 =?utf-8?B?U2NrRlc3Y1ZsMXpJSjBiQXYzRzdpa0tlSE8xS21jaVJZQkdQci9iOTRBak80?=
 =?utf-8?B?TXZuSU9KTGRIZzBQWFhIbFBFcms1QXJLNVoyRFNpbHBBRVI0VkR6bUxmZUox?=
 =?utf-8?B?SGltc3FRclE4ZmNWUXpxODVoWTRnVnhkVFFlWkNvbVVmdTFjVVhDamRhTURN?=
 =?utf-8?B?THdoeUF4cElRdkxnRkhoOThQQTVSMUdTVDJwUUt3YTViRHZDUnZid2I0dFdS?=
 =?utf-8?B?cnhCekJaRUpCUUtyUnBISjdLN0wzSFFvVWxzQ2h3T1JFMFBCZXphUm9hbFRS?=
 =?utf-8?B?T2ZXZzYrU0poRTVxaVd6Q3lPOXdkT25PS1p5YmJLMXdDUUtEUlI2Qm9sL2dk?=
 =?utf-8?B?SnNTVURZOHFUTlF4Y2h2MHdPc2h0alJnR3EzVVY0K2NUb1o4RHd2TGpqeVpn?=
 =?utf-8?B?TE5zK2pIRDlBWDgzL2RERmNUbXM1NUNwSWJDZkRiR043Z0JObEJmR1NuWUtv?=
 =?utf-8?B?aTVtaGFFci9GakhIS2xabXFFSXNkb2I0Q1A2QkpJMUlDSFE0UkVZL1k4TDRa?=
 =?utf-8?B?bTBGWVdkUG1KQXNUcTZYenhYZWlGVFMvWk81dy9mSWxhY2ZqWWljMnBNekFT?=
 =?utf-8?B?Nmd4aFlrRHdXTHlZNEpDVkRTWFgwNFZ6OGdIN3o3MElja21WY0tsUVErZHBQ?=
 =?utf-8?B?dGZwbzdtanpkWUFzaG5nMHRMNW9FYVE2dkJXYXk0K2ppaE9RU2dBaW5OK0R6?=
 =?utf-8?Q?8AgPsPLfrvfen8e1HkIJ898X5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6c4512-8738-4578-43e8-08dc8f66cbc9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:18:05.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slGVzgc48DYV7xMvmLkGgZ5SoHqRHqOJlMzDOsIpWNRL3HQ2zlsInmnu3WElo0ujOoPmpBfM7W3rrTr6w79k6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341


On 6/14/2024 8:19 PM, Lee Jones wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, 14 Jun 2024, Chatradhi, Naveen Krishna wrote:
>
>> On 6/13/2024 10:35 PM, Lee Jones wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Thu, 30 May 2024, Naveen Krishna Chatradhi wrote:
>>>
>>>> From: Akshay Gupta <akshay.gupta@amd.com>
>>>>
>>>> At present, sbrmi under hwmon subsystem is probed as an i2c
>>>> driver and reports power.
>>>>
>>>> However, APML interface defines few other protocols to support
>>>> OOB system management functionality.
>>>>
>>>> This patchset the following
>>>> 1. Based on hwmon maintainers feedback, move the i2c client
>>>>      probe and sbrmi core functionality to drivers/mfd/
>>>> 2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
>>>>      report power using the symbol exported by the mfd/sbrmi-core.
>>>> 3. Convert i2c to regmap which provides multiple benefits
>>>>      over direct smbus APIs.
>>>> 4. Register a misc device which provides
>>>>       a. An ioctl interface through node /dev/sbrmiX
>>>>       b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
>>>>          will continue to provide user-space programmable API for the following
>>>>         - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
>>>>         - CPUID access
>>>>         - MCAMSR access
>>>>
>>>> Akshay Gupta (5):
>>>>     hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
>>>>     mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
>>>>     mfd/hwmon sbrmi: Use regmap subsystem
>>>>     mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
>>>>     mfd/hwmon: sbrmi: Add support for APML protocols
>>>>
>>>>    drivers/hwmon/Kconfig         |   1 +
>>>>    drivers/hwmon/sbrmi.c         | 284 +++-----------------
>>>>    drivers/mfd/Kconfig           |   9 +-
>>>>    drivers/mfd/Makefile          |   2 +
>>>>    drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++
>>> It's not clear to me what any of these 500 lines do, but they do not
>>> look like a good fit for MFD.  Perhaps I'm missing something.  Can you
>>> provide some more information about the device and why you think MFD is
>>> a suitable location for it?
>> Hi lee,
>>
>> Data center processors from AMD provide a side-band (often called
>> out-of-band) path for manageability
>>
>> called Advanced Platform Management Link (APML), which consists of i2c/i3c
>> client devices called
>>
>> Side-band Remote Management Interface (SB-RMI) and Side-band Temperature
>> Sensor Interface (SB-TSI).
>>
>>
>> We have i2c client drivers upstreamed under drivers/hwmon sbrmi.c and
>> sbtsi_temp.c reporting power and
>>
>> temperature via hwmon interfaces. However, sbrmi device can also provide
>> performance, telemetry and RAS
> MFD knows nothing of these characteristics.

Yes, we will modify the implementation to define ops structure with 
functionality that

can be called by platforms drivers in hwmon and other subsystems.

>
>> monitoring, management using AMD defined protocols. One of them
>> sbrmi_mailbox_xfer()is defined in
> I large portion of this should be moved out to drivers/mailbox.

we have explored the mailbox subsystem, APML xfer is not a ful-fledge 
mailbox interface as such,

it is a custom protocol, which accepts inputs and provides outputs over 
i2c/i3c. It does not support

multichannel (tx/rx) or have IRQs or a memory mapped IO and it is one of 
the protocols supported

by the RMI device.

>
>> drivers/hwmon/sbrmi.c.
>>
>> Patchset would do the following
>>
>> 1. Move core functionality from hwmon/sbrmi.c to drivers/mfd/sbrmi-i2c.c as
>> an i2c_driver.
>>
>> 2. Convert the hwmon/sbrmi.c to a platform driver.
>>
>> 3. Use mfd_add_devices() API to add cells which will probe the platform
>> driver under hwmon/sbrmi.c
> How many devices will mfd_add_devices() be registering?

This patch is adding one hwmon device.

We can add additional cell which probes a platform driver in 
drivers/misc which handles

the user space interface part.

>
>> 4. drivers/mfd/sbrmi-core.c will contain the common functions which can be
>> used by i2c and i3c based drivers, such as
>>
>> core protocol definitions, creation of misc device and an ioctl for the user
> drivers/misc?

We will move the misc device registration and user space interface to 
drivers/misc and

use the ops provided by this mfd device.

Regards,

naveenk

>
>> interface.
>>
>> This patchset is an attempt toadd support for these core protocols in such a
>> way that Open-sourced and widely used
>> https://github.com/amd/esmi_oob_library will continue to provide user-space
>> programmable API. regards, Naveenk
>>
>>>>    drivers/mfd/sbrmi-core.h      |  37 +++
>>>>    drivers/mfd/sbrmi-i2c.c       | 165 ++++++++++++
>>>>    include/linux/mfd/amd-sb.h    |  55 ++++
>>>>    include/uapi/linux/amd-apml.h |  74 +++++
>>>>    9 files changed, 871 insertions(+), 246 deletions(-)
>>>>    create mode 100644 drivers/mfd/sbrmi-core.c
>>>>    create mode 100644 drivers/mfd/sbrmi-core.h
>>>>    create mode 100644 drivers/mfd/sbrmi-i2c.c
>>>>    create mode 100644 include/linux/mfd/amd-sb.h
>>>>    create mode 100644 include/uapi/linux/amd-apml.h
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>> --
>>> Lee Jones [李琼斯]
> --
> Lee Jones [李琼斯]
