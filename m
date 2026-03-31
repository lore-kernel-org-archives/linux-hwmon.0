Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23203A6400;
	Tue, 31 Mar 2026 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953996; cv=fail; b=IOMAita9NX/tJ1zsoISfWPewF3tTqf4Dnbc2ml55LgSi4DH21ESyfI4bHHsNttm9qsZPYFU0EgGtQCJeS23LCoTOkltcqGg1T5akA+ZcRaN+xnKW1xJHP9dpcDArL5qL9MzzJm0L1gt15+r3LtBNqZi2dat+ezSiXqvabp54lCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953996; c=relaxed/simple;
	bh=ffXS8ici44jOeQ9njRMSkxhEid95rou3Qt4rhLhPUL8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=frp2RfLcQKfnCqfvq6PuQjZ7OUlqkkswI8iTtWVYDe2DVBcpgCxzMte4hC9L1w3r0fGZL1PrGB1IqeJzDB4YpBKr3QNn7bbL34KFsX3eM7VqHyBMALVaHb6eFI7BFNvmR/6VKwavBdmdfPJUx+HVcTFF0F9Hq6MxAA6J7wysoIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BG9zvLYl; arc=fail smtp.client-ip=40.93.198.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BG9zvLYl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpkPrlQmah/2QmtzZFHSIk6tUV07/IRGAZTR3xoSbgNHCVK+vgrCq86esCh/DO+xxRRUseP9zI3IDFHE01HtVuOypZBAFWP6BJ/cdaQDcuMaMIaO5xyeOc/LoMDQBWKH11xbBjPiB8MbdBCUxzjmVvYPmM0K6YAbSavvmX/GEztGEhzxG4Ffyd4AexEPt7tcGOdbbRFi47S3IhOdlq/iObj8/WAZOtqputlobgt0/LBhUe9Ubm6tjvk8GqKfLTXZ3tJUFzKfB66FNwWSfp2h2bF3D2lXbpXUn9W7Ehfcd049gsFzZlTjKC7+XW2st12tuI7t1Sy3xDZLfYGr7gjthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyreGbr6inYYURNjVgEE9wGw2NqosNXQqDHeVBHEOWM=;
 b=d17MQngs3SsjtPuXln1uW1Q1IkWR97BnyWlXWjEVadyDPskkSRoD3FlaJtzQ/Qkkm0CCHkgUyHFaVcWlPjuOpL1ROpT5b4ERdzjzr14oM6zZZAN5MCjliMZfa/x7/Oa+PZa0zJjrTSBeyYu/+H5i2a8ab/A+S4w9Vt5M4+69QrnwaArkDTgltko7MQ5xBAkEL5wL/I/LEkmQfx5hriuHpfvnQlwX11QqBvjCMrDw3LyhcwaQNiyrgYiJc2hlEBlP1PnOkhhl54LwZSoVgTeILZy7t9m3OCK8odycwJiB5lvSCmMzeR6MOJF0D+LbDbS9RkLXpoTUX8vBOw4X084+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyreGbr6inYYURNjVgEE9wGw2NqosNXQqDHeVBHEOWM=;
 b=BG9zvLYl0WtiZ9AArSPS/WlBQdjmo6l/R36nD4aMuauN3/fP59m7rfi6nGRhCEWA6B3h4QFlSuZF5yM5RymbLCeRampCpCgAI71eO/Wl/Yd2IOuEsqpcjvL7CnBz+5XbH4Fs5bzsGPaIBMLZmWYs5ZYh8K7OeQDgJDN2OBzkeB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 10:46:31 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 10:46:31 +0000
Message-ID: <c82e0025-d5ed-48e3-8017-aac9c270a6de@amd.com>
Date: Tue, 31 Mar 2026 16:16:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] hwmon/misc: amd-sbi: Move core SBTSI support from
 hwmon to misc
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "L k, Prathima" <Prathima.Lk@amd.com>,
 "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
 "Umarji, Anand" <Anand.Umarji@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "kunyi@google.com" <kunyi@google.com>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-2-Akshay.Gupta@amd.com>
 <86ec222b-d252-4586-a1cc-2a7a5674e1b4@roeck-us.net>
 <d0ed96aa-529d-42fb-a680-917c325998ee@amd.com>
 <91e527b8-f753-411b-bdf5-7439edb48c34@roeck-us.net>
 <9e05e255-6245-415c-8c74-ee4f1809976c@amd.com>
 <60ab1803-accb-4ac3-91bd-f6d24354c19a@roeck-us.net>
 <2026032744-humble-festival-0943@gregkh>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2026032744-humble-festival-0943@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::14) To MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3fb687-600a-4c64-5fb5-08de8f12c4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZisUQTJFe9e9zQANdT+ryQ8UaDPAS9Sc9KhSCk1BB1FRYO9aPFmhmgNnL7mdcKa45ufbbX+YwCTmEDTaGlfqevFJCS25Pwm44xj4nOwZiiF8L4u4SEUDgg23P8QV2I6ILC7YdRiRSyBJKWu1NWLN3nf2oTggpg5Wu1iJK+PNYNkFSpPnKeWEr9XkKNxDO4zx/O97j5+6pmhMoHO46Qg99gH92oDGx+cuIBFM/6O4ZxQlDtkqeBd91Is4vPQsmeDPuL1gtZzBfpM6sTZopwDCwJ4BP5H176ulRsVvps2tPRewNxTjalzeTr2CMfYrrW5tAa20ux2bLYMoQyqbSMzBFCOgqYvT16JLMeiipsovkvWD+OzMP8PJ1Fchpwd6hr2Geki0I0Q8MxW1NYGW4z9BnBM3JfIJkzCw8t/iqE1EnbzrvhsYKzCyVMWpaEQcOYQghGCb6QV0Ezy+udS54qTpKh3eI0oOHNuyMjmdoqSzOKfQnwjLSobbZrPabpISJFXDHBHSNCvUsrnCIOoXgjE4GUEMRIPTd6Ow4P0YCeIw69G8mwI7dovwmT3Os1Oxz/B0aeEPxpixj7cFO3K2OZLkLSwk88i1W2soV5zFXy0iyMwTrEu2SlXg93KyhBdzzmM8p247R/4dqAul8bF3bPKcXThIO5qhlP3Rx7c0m8y1mznUaYCTCIHioKmjewDlSK/Mi73IHsqJaqksOpLKwBozeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eldRMjYvTnlNb1ZRUDNod1BJa2RZTWM0bndlQkduZnNNSGhvR0JSWGFFSERG?=
 =?utf-8?B?Mksva0xOY2dPbDQ2OG1JcmlwNEYvR0NsNXFOelBFTTdNS1hrMnNGUHgwcTZq?=
 =?utf-8?B?ejBEVnNsM0toODBqeXhtcXhPKzFlZFg3REkyR0tSNmdkMjM4ZTdkaW5idjdq?=
 =?utf-8?B?dXAyWkFMWkZkcWFLMkVNOXYzZ1JHRnF5clJVOFE1VDhzV2NKSlVNME42R20z?=
 =?utf-8?B?WlZ3cWs0T0hTWXBlQVl1SVMvWDBpZ1kxWWdURUt4YUFScGpEUFBFVTVab1Vs?=
 =?utf-8?B?RkNGckorY1pXWGFjLzFkQ3ZlVDExcDRTczhqcUM0b2hkN25LZW9ldEoxVXJG?=
 =?utf-8?B?bUpreDBWLy9CMUlmNUNCenNWRWdkYmllNzVNR0UrL2ZqcVA0WmVsM0pnQ1Bv?=
 =?utf-8?B?ZHBjU1JtWjQ5SFlXTlhyZ2Y1WGZ5Z3pBck1pTm9KVndZblY2eWJ1ekZNeEcz?=
 =?utf-8?B?SHNodDBvOXNxd09qcFRxTmYvR2NpSlJZeU1SRkxYVDYzcDJlckdPSVkyaEZB?=
 =?utf-8?B?M0dhYm5ZdWpQWGUxeFVINTUxbngyWjhjMElhbFBNOFdPdG5CSGswL1Fqc0J3?=
 =?utf-8?B?WEZOL0I4NW5ETkdMMDdFY3ZNU1N3U0ZtbDJjTlpWYzBwbG1adVdNNHU2Sk1F?=
 =?utf-8?B?QmxYTWluT3FPcUwwVU42Q0VVNmZmOXRLUEdYR3duVFV2ZFI5VTNsb3pxeGhj?=
 =?utf-8?B?cnIydEh6c3FrajBTZkhTbzBNRUtLYnZ4aW5vRGFyL0RtNjU4amlIOHhaUEp3?=
 =?utf-8?B?bHlCU0x6b3Y1NHRFd0huVm9uL3VnaXIyOVU2OWtrOGRtWnp6M3ZLL3lINGRK?=
 =?utf-8?B?amZDbHd1allzaWsreGVubFh4V1RDZnNCTm03UndBN0t4QW9ZVC81VVgrb3N2?=
 =?utf-8?B?aG5UczVCNGhxRStlOHVLV0Q0VnJSTUpvczl6QllPdDVPaXovQW9VZ05LUndT?=
 =?utf-8?B?Z1dVUEFTbHA5QUtNR01JbTFyVUl6T1QrK1JHNGd4NTBEMDZuUUNMRzVRTE43?=
 =?utf-8?B?VjF5TkhtZUQwSVNUWlBibktSdFJ5aG42M3pkQ3BldGdxZ2NocDFxTjY3Q2FG?=
 =?utf-8?B?OVd4TFNXTHJLNHZicjV2blorcWJoWWczUiszNGx6cEkvVElhSGhxbFJmN3RS?=
 =?utf-8?B?YkpWa3htcy9KbEhHY0R4OWNOU3R4cWtEY1JSMnBtcUtBdHd3U2VQT0tSOTRl?=
 =?utf-8?B?VzdkZGd3YS9lbm9mbG4xQ3hoUWdYcWxsTGFuRzZMTXNGbkJYTzFITjBrWmp5?=
 =?utf-8?B?QWI2OUJhZ01NZUttSDhuMlJERmRPdURmbUwyUWdrckt1eTdLT0pMZ2RmNGw4?=
 =?utf-8?B?RTcxWjV4T3dMSHhMYU8yY1pXY0F3TG81aTdsL0F4UHVKemY5dzJURGd6Z3g1?=
 =?utf-8?B?OFFhZng0Sk93UlgxSytXRmUzQWZ3NVAzZVpETTdlbUtaRzBKclNMc3ZtUUZl?=
 =?utf-8?B?UTRxQ2VLaExRK2JDWGpZcXY1SnF0T0dNUU9zbHVvV05Odm5kQWFZbkxkT2tT?=
 =?utf-8?B?dlM4NFU4MGhRWE5TOVJWbFh5d1MrRzJPMGlBTVYrUURDTTZYQ3QwU0tZUjFn?=
 =?utf-8?B?aDdiMkR5cVEwQUwrMUJIRTZRZEJmYUgyMHJSeVd1aHJuVXllK1I2LzAvbFVM?=
 =?utf-8?B?eFhaQnB0c3pKTUtsN1Q3dDFiNlRjdFlEemxTOG9WYWljSVc4YTNQNU1ZY3Fz?=
 =?utf-8?B?dzdBMjNRSUlDODZxL3l3bzUvU1VpcVBWSit5ckNDSHhlc2pLZlE3UDFGK0Rv?=
 =?utf-8?B?MGNtcWRNOGREMHRGb1FzWWJHMDhIUXlvMllyMVRjSlFTaWwwRlowSDVveTVF?=
 =?utf-8?B?M3JjNUp4dmdaTWlrcjM0eUxPcGx3bUhyS2lKYnorU2FvK2pDQzBHR3BleWZp?=
 =?utf-8?B?TXJuQkg3T2pGNjRlTzJDZVhTck1RRmdSZ3p3RFJGMWxycTBWQWFyemcrbzFL?=
 =?utf-8?B?ampYSS95ZlNoUXJvZXVlK29KOGQ4Ny9vSGFoY0V5UkV0ZWtRV1BpN3d1Y2x4?=
 =?utf-8?B?WU5rOHh6RnlOb014RzdyTXhKLythM3piZFZFTWZoRXRWZE9HQUJkbXV2UlFp?=
 =?utf-8?B?TXRvWkQzRFZrKzU3T3l3cU5pNjNiY2VjT3hoNEtiOGREYWNJdTRkR0ZhWkx1?=
 =?utf-8?B?ZjdyR2l6Q2J6MkVvMG5aNHdYK2VlcUttTitXbnRnMUt1dVphWHBycDZPb0to?=
 =?utf-8?B?WFRVZWVBTlZGWTJQRndoZ29oQllVUkkrVHJ5QW5QeE10UlpscWVROTdSZUNl?=
 =?utf-8?B?V2hQVFhZNWNGd2Ztc0t6WDZla0RZN1p2TW9iSllCZ1lFcU5Tb1B2WWFFZVAv?=
 =?utf-8?B?Qkp5Wjl4NWNPOHI2TFJiRVl3d2JadUx1d2pSVUtKOENqak9DVFVNZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3fb687-600a-4c64-5fb5-08de8f12c4eb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:46:31.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kecrbS5mJ8RvSDWm5vH3fiBiHrmH2UjnowhEsQzv1Sl8jQbsScPPkm5KaM19PQrTZiEu6FOXHCOFc7oMmZBVdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919


On 3/27/2026 12:53 PM, gregkh@linuxfoundation.org wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, Mar 26, 2026 at 10:52:29PM -0700, Guenter Roeck wrote:
>> On 3/26/26 22:07, Gupta, Akshay wrote:
>>> On 3/24/2026 5:03 PM, Guenter Roeck wrote:
>>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> On 3/24/26 03:36, Gupta, Akshay wrote:
>>>>> On 3/23/2026 7:45 PM, Guenter Roeck wrote:
>>>>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>>>>
>>>>>>
>>>>>> On 3/23/26 04:08, Akshay Gupta wrote:
>>>>>>> From: Prathima <Prathima.Lk@amd.com>
>>>>>>>
>>>>>>> Move SBTSI core functionality out of the hwmon-only path and into
>>>>>>> drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
>>>>>>>
>>>>>>> This split prepares the driver for additional interfaces while keeping
>>>>>>> hwmon support as an optional layer on top of common SBTSI core logic.
>>>>>>>
>>>>>> This moves the driver out of hwmon space into misc/amd-sbi which,
>>>>>> in my opinion, is completely unnecessary to accomplish the stated goals.
>>>>>>
>>>>>> I assume this is to be able to make changes which do not follow
>>>>>> the hwmon ABI and/or to bypass hwmon subsystem review, similar
>>>>>> to what has been done by others.
>>>>>>
>>>>>> Obviously, I think this is a bad idea. I won't give it a NACK,
>>>>>> but I won't approve (nor review) it either.
>>>>>>
>>>>>> Guenter
>>>>> Hi Guenter,
>>>>>
>>>>> Thank you for your quick response.
>>>>>
>>>>> At present, TSI supports a range of functionalities that cannot be exposed through hwmon. Additionally, a new protocol leveraging the TSI endpoint in hardware has been introduced, which, to our understanding, cannot be accommodated within the hwmon subsystem.
>>>>>
>>>>> Since we already support the RMI interface via misc/amd-sbi, we believe this remains the appropriate place to continue AMD's out-of-band support.
>>>>>
>>>>> I will update the commit message and cover letter to clearly articulate the rationale behind this change.
>>>>>
>>>>> Thank you
>>>>>
>>>> That is neither a reason or an argument for moving _hwmon_ part of the code
>>>> out of the hwmon subsystem.
>>> Following feedback from the Greg and MFD subsystem maintainers, we introduced an sb-rmi driver under misc/ that calls devm_hwmon_device_register_with_info(). We are considering the same approach for the sb-tsi driver. Would you recommend a more suitable alternative?
>> I would have suggested to use an auxiliary driver, similar to PECI,
>> but who am I to argue if senior maintainers suggest otherwise.
> Sounds like an aux driver makes sense to me too, I don't remember saying
> that you HAD to call devm_hwmon_device_register_with_info(), where was
> that stated in previous reviews?
>
> thanks,
>
> greg k-h

Thank you Greg and Guenter for the feedback. I will explore auxiliary 
driver and submit the changes as part of next version.

This way hwmon sensor will remain in hwmon subsytem and new 
implementation can be part of misc.

Following the discussions at 
https://lore.kernel.org/all/01c95139-dfeb-6983-77d2-4382ffb50896@amd.com/, 
https://lore.kernel.org/all/8aa17f38-a6f6-4ba9-b38c-767ed39c1c92@roeck-us.net/, 
we plan to adopt the same approach for the TSI driver.

