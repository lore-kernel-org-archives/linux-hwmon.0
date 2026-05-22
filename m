Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021116.outbound.protection.outlook.com [40.93.194.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9225B09A;
	Fri, 22 May 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455443; cv=fail; b=DT8Uxha755Yj9zknBFnU06+VcfG6Mn5u2DB8cVmbcn0Y40LCn/DWOh8DZ8RHMnNlqXky7NVdhO5rspZ1UCjeysmrv1eRZJ9N/JwKKGiciX3Br4usVhV0i1bpu8+qJZBBOv6+qBY3rtVXKkC9AVP9jnxfsyp9CbLsSuKbofVBVcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455443; c=relaxed/simple;
	bh=1SJiI6tqg3m2YLRytW+iyJJN7CSMjnsvmDcPjh68O1c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U4W4Vkgw3LwLakTlHdaXfTIM2YrqKOxGOkEa6WIOSlfeatonBKZ0K8op4RzPYKsfFyB5xjpcQOonct+n3G5FHQszJgV5mXQwRdHlFsTxd06+3pb7TRplG3M1lr20SnkYWW71K6o6DVsretj/mbs4ZeCWsHVTyk7PIiPZJFORfOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=iluOo+EW reason="key not found in DNS"; arc=fail smtp.client-ip=40.93.194.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="iluOo+EW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju02/Q0G4XGhE5U9Eu0Es5ns8Nx0zeY8rbH9w24e1nabuK/5C5P3YTiBpn8hUXeFd/pAav7EP5ilBVbeUtMJx6YK739xlrRnwYmYTaIlFfEFcyVmvI2OPhKqQgs5tyDUAS0P6kV1XKgF96115YIXO6lvhWp0iUyR7fPTLNstHZ4v1ev2Z/GE+GkHezVIF6/uzM/LwwHemQ6DWUNSf1KiZD0pEjFTAPPccbMcKvEY66q4Hax7UbjjCrJYEis3PsUXky5jE8/AUs7mZKxBC7sC2X2LADifWFtOhhsv7AlUutBppUG7Rqam79Gw0Qo0sEDXDRgJRwal4yaiOTE78ubB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHE4oHsFWrUht4+EtusFh9+ZBZjQM/WsixSpt5+c/F4=;
 b=lNisaZtivNGY9zdVm6HGNxG92aTLWyB615h1LdGcD83kmbit8ZanXAHcpyWbBf2HJtlkZxfp4CR1fq+dEXXiiLfWe8B3qP/hG9E+6q7TNp/9rHiWNxQ5bQ1CvHMZo1stFnARqMfEERyi3VIzd6qxxlB2EJV7m13Tp66uSFAmYIpcCSOjkMlHOyrxXd2NWbTcHir43NnjaeBf9fIeIaMIE24zpuN0oSNoZhgIrNNSl1jq71lVnOarnjeiIEk+QsuvvPlZ+r7Vaut/8VHj2fwtHAGjY7MnOO+n+6aBRR2lcweIZOE8EPV950vjpVIzjeKND9xz/0s7ac8n1WQnRlPElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHE4oHsFWrUht4+EtusFh9+ZBZjQM/WsixSpt5+c/F4=;
 b=iluOo+EW5ltPcDKcOn8SI/BHXtPe/epG6jBSQMPEufLbNqqBpDD7ayVCHdTa6KatU5vXZBfuq3K4BzIPADjm8x3Xh/CQjH4NrxweJAaRRW6DUU2c/fu6lTR5gu0ZIydABR9Wv6QUB1qny+2CmIJdF0CjY0ogp6wh0giK+1XYtLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 DSVPR01MB994872.prod.exchangelabs.com (2603:10b6:8:3ac::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Fri, 22 May 2026 13:10:38 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 13:10:38 +0000
Message-ID: <cbbdb86f-b3aa-4a8d-8257-b56a06ee91d2@amperemail.onmicrosoft.com>
Date: Fri, 22 May 2026 09:10:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox/pcc.c move shmem unmap to teardown
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Adam Young <admiyo@os.amperecomputing.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
References: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
 <20260519-annoying-athletic-mustang-cf3f02@sudeepholla>
 <05347a7f-ce9c-41da-a4ba-fbd27bd9f934@amperemail.onmicrosoft.com>
 <20260519-conscious-beagle-of-virtuosity-3f5660@sudeepholla>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260519-conscious-beagle-of-virtuosity-3f5660@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0297.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::32) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|DSVPR01MB994872:EE_
X-MS-Office365-Filtering-Correlation-Id: 536df1c5-0c05-4872-5ae1-08deb803848b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|22082099003|56012099003|18002099003|11063799006|6133799003|4143699003|55112099003;
X-Microsoft-Antispam-Message-Info:
	CGrM5bu05wVsUEAgfg5gTIzFv+ObTIpq97+/4JB5XhY9GUko0SDTw8EFSx8NhcNLbgLfpgpKmU6rZZ8Z4+u4kj2E+IMScouW8iZtHU8WLJgrovKNe8+dKEFQ+vlLO3Kz3hnqeql+rQw1dWnY756q5X4lJDZVWfl+R9yrrByx0S5zB3OmWwRw+q04KnQlLve/61WVbBPbqjrz7195yGxE0+aJs2kM3nzNbGSd30fxb7rrclhanVhaoIUJKIUpu6MqHb2IR7aOEPhMP2l4fSIJ7OkR80SvscvQmxApQ2Mstv/fZ2zqZR/5333TbyrunI46jYjNqSF0uqLZOsKJtnZiZNFZNgS39ER7kfpoDTSo+huuZCftDZr6rVk1nIWF2F1c6RM7FNu8+xcvL8K3lGeW5R18pmZL6ZJxHK4LtlAzbun3NCyatWfxjtmocALaEgcj89S0HHLQE2Y+ON6Dd/7+ODDislEQRQ2aWDxlu28OfbxY6PEN8Iv7QHBVtLjc3zLb6SWlTkUXB+eSi08iqyeBwC0F5x1OCCJ+jsr2K/iSM7fVGV8A1OnZRunMyg8ICF4dX0wcSCra0dEBPbsB5xdTv4XvWzhKUSE7ZMo7945hW4hh2RPOaSSPRwkFwyeu2g00SfEQnJKE2Acui0MNyGjgZmt5hDppuWaQYPkQh05wFKrfd0RWqNvaHLbGpBW22ikT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(22082099003)(56012099003)(18002099003)(11063799006)(6133799003)(4143699003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T096NFVuMHZYY20wNXZYOGhSSFVTbVozWlJWaVVqTXV6QXBFVEp6NENlVSts?=
 =?utf-8?B?VE5ibzl1d2VLTEhMNUsvOGZ6NlFVT0VhQnRSRU5pd0Z2M2FQYnAxaTZ5empI?=
 =?utf-8?B?bWN2cnp5dGJSK3RRRzMra1ZwdmwzZVpkN3EyT3VsM1hhM3JOa0NTQmJFU0VT?=
 =?utf-8?B?WUVWcElxOFcwaDNXNjVnQnZmLzBMU0lSRC82ZFBQdFRyS05yS1BhNG5la1J4?=
 =?utf-8?B?amVaSDkzMUFOZHBDb1c3eHNIVzd0b1FmbWd3VjRHdkUwRGdMUzZDOVlNVXlK?=
 =?utf-8?B?M0VlU2UyYWRTK1h2Yk5CRktoSHlReG5RRitJN3JMK3FGUXZjUlJjYVllQjdP?=
 =?utf-8?B?ODRJZ3pKdlJob1R4bmZWQU11RTJqRXV5Z3ZSYnFkOGw5U21ZbjdnS1Q4VHJD?=
 =?utf-8?B?TFZXOTAvUFJNcVZ6cEYzc1ZVVFRtanFjb0p1RDNaelUzL29mYXhMMUQzZGE3?=
 =?utf-8?B?Q3ZvSXg4ditTRmVHNjYvamRXT1NKdGpBczNQeEEwcE81QUExZTlPenpwamtl?=
 =?utf-8?B?cDZHN1NsZHhKR0tJZUFjYytUb3NuMnA1M0JjQnNLVERTSG1IMkt0dU5QeCth?=
 =?utf-8?B?S0RjcXZXa2dEYVpPaUVpQU1FMXlWQ01HN1NzVElYellBMkJUY3NrUzU3ZVlM?=
 =?utf-8?B?M1NBM0JiMDhweHpjTXQ4Ti9EOWNPUzlEdkk4RklFTzlrMFA2dms3Nk1hWjcv?=
 =?utf-8?B?RllVcmVSUXE2UlQxV252VDRaeThRK3NQdUpVVHVtMm1TNG1LOXRiQWljZlUx?=
 =?utf-8?B?V1lJQ0RWN01WTGNBNlJFOEN6ODRYMjFrRUIzbWR0dmJJbGh5TzRlZHhYb1h1?=
 =?utf-8?B?M1hYL0NuY0tqN2E3cGZGcVVvcDRUcWlGWjI4STVMQWNoRjlwb3pNL1VlL0Qr?=
 =?utf-8?B?N1AyelFMQjZWNWx1ZTE4QzNxTWhKTUZaRHg4OElwMDRHaTdHdE1qU0ttbDBQ?=
 =?utf-8?B?K3NZc2wxZVZKWVVkTmI1WnJDTDJKSzE2YkhZSVRlK1AvbHhiNVRwUytoY1lz?=
 =?utf-8?B?bGMyWnM3dzZUekRIL3ZlV0xvRGpIWTZDbXd6cjBMY1UwaHlyeUw0N0FJVjhP?=
 =?utf-8?B?K0g4QzNNT3d4RkVvUURTYS8rbStLV3pSSmJZbkdlQWsxWFpqR2JYSnpjdkha?=
 =?utf-8?B?N1ZxajlDb2F5bGJ4S2dUbWRYSjdvdUVPWWFHeGNEMW1hR3ptVVpQSXJVdW1Q?=
 =?utf-8?B?NjVpVi9tUXBEUHhwWnRQQWhqT0lVN0xWbXdDSnZsK0FxZjVQcUV6bUUxMVdY?=
 =?utf-8?B?NkFSdGI1RWhOSkpQWmJjZ3BMM0F6WnVVOXBVMHFoR01pWTNxSzZ2dEFOUFMy?=
 =?utf-8?B?QW9TVERmN3ArTUl2K21OT2dkUVJBMlQybFRzYVNJMUxob0VGZStnaXlaSFE5?=
 =?utf-8?B?VWtPdy90R0dLWGVuUGlkMGY1NXN6bG5KRExtQm0yOUtHMjVQYUpSSUVRdVZ2?=
 =?utf-8?B?dGpkU3dsLzVKWGVEYk5VaklrMS9mSmxRalpwWS9VQjVuTjBHQTFSc2FNT1N4?=
 =?utf-8?B?b1pxTzkvWVVvb3NWbDBmemVTU0V1VTU2QlNsblo2QzdTYlZmb0JnaFJlZU5m?=
 =?utf-8?B?ZVhtY1luS3JWa3RuaVQ0MHFibVZNc1BNL1ZFTUl6YnV0YnljQzRqYmdQRXUz?=
 =?utf-8?B?Y3NFT0Q1OU1WRzd4NFZnWC9SVVR3WmhtN1hPejlTclVyQmpWMFlHeWxiRmdx?=
 =?utf-8?B?a25yQTdLZW5YNWtxdi9SdUxxTzdRRHpYd0h4b29iRzZldVJtaFNYbDZnbXZJ?=
 =?utf-8?B?a0lQYXNSbFJ1d3RDR3Vma0hPWGJJYkdrdVNQdEY0THlsRnd5eitnZUhod0Zo?=
 =?utf-8?B?NTcvRDJwU1pCUU5Pc2ZRUnNtaVhFcFB0WjladXVsL1Vsd2hXbWFJWnVhcjVo?=
 =?utf-8?B?RVlRb1k5Rjk1OG1mNnNvZXU4R3RWZnVFcUNRc0RqT0JEOEZIM2xidTB1eUp5?=
 =?utf-8?B?cWtsWXAwTmQyenMvalFlM0dUL1RwaGdYQkpDRDdZVDcvRWFsTG9CSjhrZnNn?=
 =?utf-8?B?ZXQwUWwyZ0VJVFIvTmExeGhNc1p2QW11aDhvWkhDYTArcVEvOUhCdm9sYTIw?=
 =?utf-8?B?bkZwWElZcTdyRW9DZ1hYdlV0cGZZa1h0MzNMenRFYktMZ3RHZGw0YlJzY0xh?=
 =?utf-8?B?MGZqMzRmZWIzWEdvNDJ3UC9HaFc3WERPYU5NOFFZbDBTQktKODlOdDBQR3px?=
 =?utf-8?B?cDZoQlY3clpwZkgyUVJBSUE3MStWMi9qeFdlUW5oQWVtTWJ0aTlMRHJKWTFL?=
 =?utf-8?B?ZkV6TFNwcHVubFVVbHphVXdKMm1HTUFtT3kzM0lqUnBQdHl0LzhsOTd2eGJT?=
 =?utf-8?B?Vjk5dytxdlhCaCswOS9OZVFOUS9pWVhMNi9QcVJQVjlkTHMxd2JVekJuTmk3?=
 =?utf-8?Q?exsGxcYaAAJyXfqY3TpqPsu1YPVq5O6TmmJBN1kMhVR92?=
X-MS-Exchange-AntiSpam-MessageData-1: juebJJeb1yEcfg==
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536df1c5-0c05-4872-5ae1-08deb803848b
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 13:10:38.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdUCdbzNxJkI718U0HVTYU5JA8aYtZi2CdSW0/Wl+Fc43GHLdHWNDvD3oD0Bzv7/Xj/SnPra1AHNprgg8KJ6cPAMXlFLlVorFXRLxflHFUjbdMj5iM7S4j1ELhoB9RJ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR01MB994872


On 5/19/26 11:53, Sudeep Holla wrote:
> On Tue, May 19, 2026 at 10:26:21AM -0400, Adam Young wrote:
>> On 5/19/26 08:18, Sudeep Holla wrote:
>>> On Fri, May 15, 2026 at 12:10:01PM -0400, Adam Young wrote:
>>>> If the mailbox IRQ and shmems are not cleaned up atomically there is a
>>>> race condition. If the shmem is torn down while the IRQ is active, a late
>>>> interrupt can trigger a write to un-mapped memory.
>>>> If the shmem is torn down after the IRQ, and another thread requests the
>>>> channel again, we can end up with a channel that has had its shmem
>>>> unmapped.
>>>>
>>>> By moving the unmap to the teardown process, we can let the mailbox
>>>> mechanism prevent re-entrance into the startup/teardown functions.
>>>>
>>> The startup-failure path now pass NULL to iounmap() in
>>> pcc_mbox_request_channel().
>>>
>>> __mbox_bind_client() calls mbox_free_channel() before returning an error when
>>> ->startup() fails:
>>>
>>> With this change, that mbox_free_channel() reaches pcc_shutdown() and clears
>>> pcc_mchan->shmem.  Control then returns to pcc_mbox_request_channel(), which
>>> still unconditionally calls iounmap(pcc_mchan->shmem) in the error path.
>>>
>>> The startup and shutdown calls are symmetrical and similarly the
>>> mbox_request and mbox_free. This change is removing that balance.
>>>
>>> NACK from me.
>>>
>> Yeah, I saw that (since posting) as well.
>>
>> I have an updated version that moves the map to the startup and that removes
>> the unmmap call from pcc_mbox_request_channel which seems to resolve the
>> balancing issue. I will post shortly.
>>
>> I was trying to minimize the change by not moving the map portion, but I
>> realize that both need to be under control of the mbox code to get to a
>> multithread safe design.
>>
> But you fail to explain why after shutdown, a late interrupt arrives. I can't
> follow that.

We can't really control the platform.  We could be in a case where the 
platform is taking a really long time to process a task, and the user 
gets impatient and attempts to restart the link as a debugging step, and 
the platform completes and sends a response interrupt, or sends a packet 
on a type 4 interface as a response.




