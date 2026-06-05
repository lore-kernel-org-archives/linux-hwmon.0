Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023100.outbound.protection.outlook.com [40.93.201.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE42BE03C;
	Fri,  5 Jun 2026 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679975; cv=fail; b=S9lsTL7Ab9bbcEpH+MnQJel+zZ5M2L5MhNNQiCAbPDTKWCWZmr9hOSXlh979aYpXsuSn7GutkdIjc2IPFSOp3DhJpcdziDBVDamwLRi9U0PqNH9ebOHfe9tco5kxfR7ZIAccME2SxW00sNDa69PV1ql49wNnnObdgjwoN5I3QUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679975; c=relaxed/simple;
	bh=UtnfbXxEEl0+ubwYdG5V960iXpMqjyxyG5koRNe8Ysk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JwebwgH+DWcwNyf1eRUDAo74Tre7SaDYvB2jA1vwhX1XM6BZTrtqr4cKhezj8aF2+U1nC0PwpPvLX7H5D+mIQeUt+S6WdWgCWaVC+dLLYfKr3mM/pH8Is2HE85TpIEsVw9vm93lRNwUs2MrQRzIgWYoUUfLoGnx+2hJElctx8Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=5WDR6O+k reason="key not found in DNS"; arc=fail smtp.client-ip=40.93.201.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="5WDR6O+k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onh12lNzYmFMRxVxYEFnz24DU1r32rkQ3qRdmzrI2XuNdVFxylMc96Ww0nrE34+5SKpxNvMkzQIw8RgvcQe468ViUA+KdOgva2zETAZTlb5r4CYK7RnVcWpXuiMk0W9vwWiwDX3UiDFvOxRT+TCc0zeHrdfs3nJ1FZI45da/a1r59lNGCErjw6baxtYpZnH5BWTQupynCHR0Ai3yOPVdNJxY8Fs6YHaWfApnVj1Yixw1waIukfs1B38/kGaboeMBxK7MrZWtidBEwAQFy3j8ips0ISwh6BtA8cVdWJTmRqpC/f4YbhNiZU212Aa7Xnep+kOHDEhOVC9mtRkV7guZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLR5zKm8dZ4Kkc1x2lngYopx3ogo4QcKPMe+rIOGwRE=;
 b=kb/nb9N9dby/kbGNl5EP7DEJjnUpCMd4pyBhOHQsl9sazLxP795/0mlqNKQsTqJ/R7sZjn585kKxjSxhrpz2qVQ3L8GDn+6l/2OigJ2n/K/gypln6weCMUxRuFj8x4a/ysfvlwLAF3fWDWN+8zyHdTqmk3V0Q8BbueYffTy1g+JE5DbvCWsszhIWOJQc32egc6tvEhIvqcRSIM8cvcXPPiOE8k9Ok2PbJNpYt1SAg2zDNbj+fooZj/gOXKNAie9gM/yoSO7t1yGY2m3Tj/4zPUHtD/ZQu/vk8FjG1mfqCjaxmmip7AEy6B7jW46ARuC4ReFmGST5+c17ZuSfE4QlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLR5zKm8dZ4Kkc1x2lngYopx3ogo4QcKPMe+rIOGwRE=;
 b=5WDR6O+kyEJYjK4FVpiT64Wei3kSI8JOhGUk9qmjcTGxIMxPhhihozw20B2VANjErRa8vGvWl+USr78X3NlY0Go+RCdscFhpCNWCLWiD9V4MPCQn7j/13twi/kTJ2TWKWisrNMT4oAcPQl0WpgidDnla/sAVtXfw6QwBBtKGGlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from CY3PR01MB9194.prod.exchangelabs.com (2603:10b6:930:109::7) by
 BL3PR01MB6803.prod.exchangelabs.com (2603:10b6:208:33e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.10; Fri, 5 Jun 2026 17:19:29 +0000
Received: from CY3PR01MB9194.prod.exchangelabs.com
 ([fe80::4005:a1db:71b8:dc8c]) by CY3PR01MB9194.prod.exchangelabs.com
 ([fe80::4005:a1db:71b8:dc8c%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 17:19:28 +0000
Message-ID: <8edb79f5-7a9e-4ab5-8a43-4017cf7b70f7@amperemail.onmicrosoft.com>
Date: Fri, 5 Jun 2026 13:19:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Huisong Li <lihuisong@huawei.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
 <c61fa285-01a6-4ac3-82ec-2a6357a9e76f@amperemail.onmicrosoft.com>
Content-Language: en-US
In-Reply-To: <c61fa285-01a6-4ac3-82ec-2a6357a9e76f@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:930:8b::16) To CY3PR01MB9194.prod.exchangelabs.com
 (2603:10b6:930:109::7)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY3PR01MB9194:EE_|BL3PR01MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b83c0b6-3c13-4b09-2b92-08dec326991d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|55112099003|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	mgK2chqmSj8JIH/42LMTae71OBcHUUqFCa9fMMYLtPQ5usxgsYkJm9K2/eeDVz43xnsl/0LciK+KTFZA+ju9Jl5At89YWC+g/sxOoGQ4EGHQciHFSaLwkM+ljgH7zuKR2rdXxg9jvJdmskCUb+HHuhYeMrOiTEfg/NpY5qkUo/PNpJsnAQJ6lW27xz4l/xSdAKtJYZyRThAhbkSxdZakYrWzueT9XwAdcpr8ii73DPTwTWy9ZkgEJOPpIlfFb5+29DIPjFCl2vdWj119fAsuBFDXSr2wfUY4F7ow2ShZ5rKF9H9YpJH+Bf8VhcmHVi22+LWfM1b0LLDyjnRdsBEoC6xAWxdsbcROBe/KR6Bc0Xk5nqGXQlvLlfqxbYTpgCGRUcqVSYU+m+8YamBTnxehoSxT5PCcWbmUu7Qyb+JhujMywP+zpR9hSWkYwBwBX9ix5eFBGTj/dp0tmmgJPkK04lH++c/HRFuygsLWJcDqpp+2p/2mRa65Z5ki7CXtI2Xkt1N64zIXY0Gedaf1YOsgIbWR0d9cTiQOQrWE7OOWrkHBKsidZiF0+7M1KQRaokw+P58+Misq/hyTsiluaAMqZasz0t+epJuwt3//+8qoZlda6d9XvaLIszdl1KpaYMw2WqFGYA7TpoOPgIVjDgdemDZwEC+tF8++Dx/GJZ1taFw1wUuGF1Bdoh8axBZpkCkf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY3PR01MB9194.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(55112099003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVhPT0NhZHF6dTZDd1ovZmZLbkxLUitEV0JHMmxUZHdJUHduU2hSWS9jS0dF?=
 =?utf-8?B?NmdYYk1IN2dPWjlwSG11Z28xRFUrczZQRk1JWEV3eW40eVY2bGM2RGRtc2Z1?=
 =?utf-8?B?OUt4bGdhMkwzdktpU3JJS242eDdkeGZIV29SRFZCUDB4SUhVcVNhVXBCaWJF?=
 =?utf-8?B?aTlGS0tGQTRYWCtSaDl5SWxQaHVZTnlVNkhHVnhmcTRFSyt5SG9oM1ozb0tD?=
 =?utf-8?B?WS9PcDNQOEVrdmJwRWh3ZEZMd2V6bTZIMWRSOTdCQklZV0RiNmU0Z0hRSWFX?=
 =?utf-8?B?bFVLR1gvNCtNdFlGU2p2Z2ZjTS9rSDJJWTg3QmUrVDNXWHRFNDBydFB5QmZV?=
 =?utf-8?B?VGpmSjdQSDdKREc1OWc1NWdaZkFMMmZVc0tpWVpLOUxqVmQ5ekJJRWRjTFBz?=
 =?utf-8?B?azg1MXlIUjV6aG5lYW4zWDZHQTlFZ0Zka2pJQlFJdStkM3BUT3R1OVBWM2VV?=
 =?utf-8?B?ajNMUUl2RGtxb0JYVldPLzJHOWxUaWtwZXhpcGYyMGJmSnF1V3h4WHRCUktE?=
 =?utf-8?B?aHc2Smc3eENCMG10bHl6akp0engrcXhUbEdaT2d6cXZzaS9vSTNZdDV5cmJV?=
 =?utf-8?B?bVFyZVJsbklEdmY2VjhRN3dwYVp5NC95aVM5b3E0TTRQazVGSmQ5ZlZIOTBz?=
 =?utf-8?B?dkxVSDlMVEVRcFZlZCs0RXBhR2NGS0g3Ly93SXRidHZ2ZFVLclMvVkhaMUcx?=
 =?utf-8?B?OGVrRGdUMnJwRDZGVTZtdld5MC9TK1J5THNsMURqYnFrdHF4TUphTXNDZUxZ?=
 =?utf-8?B?bjROaDcwVTFzRDZQa1RvYy9aWCtCL29OMXg0eUNHcE5TSVNwYWt1RXYrb3Zq?=
 =?utf-8?B?cXRRV01VeGlkQ3NCM1JKdWkyOGhUNVExRVZiZzVmM0luWXRiTEtKL01xWVBu?=
 =?utf-8?B?TC81VFRhOEdaZldreG5kMWV1SSt0RlpUbjFNaXN5eng0cVZxVjJ0RzdUWHQv?=
 =?utf-8?B?TFVCZHA5MEpNRlJUczd0L09mcU1nZTllVjBvRUdCS2k5RzNVbXlaeW5abGk5?=
 =?utf-8?B?cUQ2bEFoaXZGMXNRZHhKNnd4ODBtN05VTjJMR3VjS0xhaFJhcWlCMnRxS3Nt?=
 =?utf-8?B?S2tQNGl1STN6a0pGMTUxT0xQWUNHczY2eS9PejlzemNjUXdvYnZESmhtYlVT?=
 =?utf-8?B?SEl4T3hrbURRZFpXWm9hOWFKQjhNRXorQ1VibTludU9PN2k2dEZ4cklvVlYx?=
 =?utf-8?B?OE1hNFhZNWFTS1hlWldvdjYvWXdaK0VpdXFJQmV3YUhOMW1LUTNjRE5JK0xF?=
 =?utf-8?B?R296M3FLL2sxL2IxOHc3YTkzbHRJSDRUazJpbDM3ZlFreVUraDc2VnBySFZl?=
 =?utf-8?B?TmRtU2lhVnFOenNXMnU2VkVSYksvQWRsQkkvUXlFSEoxdnhPRFk5WUJvUmFh?=
 =?utf-8?B?R3ludENEM3Y3UXRYMERwM3Q5M3VJV2NzTHNweXkwR2JqakJyK252T0hLd0FR?=
 =?utf-8?B?YkZlbjdOU1RzblhIeUV4L1NwbmsxTWN1c0RtSHZsQXZ2TFRFN1c5YVF6UFpD?=
 =?utf-8?B?T25ZUjJGUGE2amcwSUxFUE9nUGlUTG9JWUpYdmxydHpYc3k4aVJzcHNWemM0?=
 =?utf-8?B?MHFmdVNFaTBtOWNnYXdlaTZGUGZKc095cUtKVTRSVUdNYTNDZEo4RmJORzRt?=
 =?utf-8?B?VThzaGJFZXp5YjIvVGpoYVVBd0RVbFBzcFR5NkkrM3NIRXJxZGg0eFJsRjEy?=
 =?utf-8?B?clBrUDdzRk1ScEgraVVOWWhmZU05dExzTC9MUUF3aFg5NUgxbHdXeDBvMXNB?=
 =?utf-8?B?UmNua1lDSlhyK2tsK0ZuVDFYOC96THpyWHAvc09NNFJnRWkrYVU1SStMWWdy?=
 =?utf-8?B?TFltSmQweEpzOXQ5SzB3WnhucU9LeEc5NnpWN3VPTmMvbG4xMUpKVkZkelVw?=
 =?utf-8?B?WjdCRm14eHEvdmhHU2pQTG5ZMWUzbmVQK0FyTlRRaExyWjN2alRHWTdERzha?=
 =?utf-8?B?OVM3TWZmOE1QUXVVdkVRV3JTREEzd2taWVY5N2FQZFNUUGNJbExtRjE1MlhG?=
 =?utf-8?B?U2plYlBhbW9tNUNZWE1RVld4RTZqZm44djJCRTBaMUwrL1Vpa29kbnErRk5q?=
 =?utf-8?B?MFJMVEZuUzhRMUN0Q05Ma2NhbVc0RmxrTnhkcWJCMGc1RXBmS2d5MHQzK1B5?=
 =?utf-8?B?MVlWWERvS1Vxa1haWll6aHY2VWk3bmZqZWdFRDlhVmhqT21GVW8xSTFEbzBT?=
 =?utf-8?B?dUl4VHp6THhTMm12SlNtRGNLeDBJc3ZtZSs2RjFRUG55b1Y1S3JrRWFLNkha?=
 =?utf-8?B?VlptTXNNTmlwVzVpdVkzREQ2Y3hqTGxIOFVqeVVJNHR4c05ybHF6QjVreWs5?=
 =?utf-8?B?dnBWeC9PZVdKVElBOVEvUmluWWN2SmhHR0c3b0Z1Tk1USG9rZ3NvY1Ftd21M?=
 =?utf-8?Q?XjCC8/4H7I/BB6kSO4duxSXzE2MULTWPkIshjUoovVaus?=
X-MS-Exchange-AntiSpam-MessageData-1:
	fxUntkIVGcIdBFtZ4bRCPJ7MYVlou0uldzLEfKUh4nDQ2UWwvDARb7Zq
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b83c0b6-3c13-4b09-2b92-08dec326991d
X-MS-Exchange-CrossTenant-AuthSource: CY3PR01MB9194.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 17:19:28.4821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4xleS5vvbj+dDqBwEkiSKoihMjxgF+4rCm7hbqgtC80YTwim6P9/MRhoU2PF4JlzEiy+QWDsCLqCNJGsHpb+q/bN130e7tTsJEGnVeBa91rfow1go27VT4jxiY1y24G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6803


On 6/3/26 11:15, Adam Young wrote:
>
> On 5/19/26 09:23, Sudeep Holla wrote:
>> On Mon, May 18, 2026 at 03:30:06PM -0400, Adam Young wrote:
>>> The tx_done callback function has a return code (rc) parameter
>>> that the tx_done callback can use to determine how to handle an error.
>>> However the IRQ handler was not setting that value if there is an 
>>> error.
>>>
>>> The following clients are affected:
>>>
>>> drivers/acpi/cppc_acpi.c
>>> drivers/i2c/busses/i2c-xgene-slimpro.c
>>> drivers/hwmon/xgene-hwmon.c
>>> drivers/soc/hisilicon/kunpeng_hccs.c
>>> drivers/devfreq/hisi_uncore_freq.c
>>>
>>> All of these only use the error code to report, so they
>>> are expecting an error code to come thorugh, but they
>>> do not modify behavior based on this code.
>>>
>>> In the case of an error code in the IRQ, the handler was returning
>>> IRQ_NONE which is not correct:  the IRQ handler was matched
>>> to the IRQ.  This mean that multiple error codes returned from
>>> a PCC triggered interrupt would end up disabling the device.
>>>
>>> In addition, if the error code IRQ was coming from a Type4 Device 
>>> that was
>>> expecting an IRQ response, that device would then be hung.
>>>
>>> Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended 
>>> PCC subspaces(type 3/4)")
>>> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
>>>
>>> ---
>>> ---
>>>   drivers/mailbox/pcc.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
>>> index 636879ae1db7..16b9ce087b9e 100644
>>> --- a/drivers/mailbox/pcc.c
>>> +++ b/drivers/mailbox/pcc.c
>>> @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>>   {
>>>       struct pcc_chan_info *pchan;
>>>       struct mbox_chan *chan = p;
>>> +    int rc;
>>>         pchan = chan->con_priv;
>>>   @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>>       if (!pcc_mbox_cmd_complete_check(pchan))
>>>           return IRQ_NONE;
>>>   -    if (pcc_mbox_error_check_and_clear(pchan))
>>> -        return IRQ_NONE;
>>> +    rc = pcc_mbox_error_check_and_clear(pchan);
>> I think we may have to skip the check inside 
>> pcc_mbox_error_check_and_clear()
>> for Type 4 channel as the spec expects OSPM to ignore it. It is a 
>> separate
>> fix, just noting that here.
>
> I think that should be in this patch, for correctness.  It is a small 
> enough change.  I'll update.
>

Actually, it is a fix in its own right, and can be merged regardless of 
this patch, so:
https://lore.kernel.org/lkml/20260604163306.160017-1-admiyo@os.amperecomputing.com/

