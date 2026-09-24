Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021096.outbound.protection.outlook.com [40.107.208.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E91A2C0B;
	Thu, 24 Sep 2026 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237848; cv=fail; b=XWdO/btrIWlGb/lFI2lN8NIfHdJqFxsIILp2qHTsWU0AT3/esvVIr8g3ds//Ud95XMSO8duAzx9E8S9F6t9qTKqRl2SMsbeUMslPR5/mDh6Vbckfw8K/I5EI/9IUVEO9aqScijJTYbuvUl9u1qwMEy3aVSsitxQai9u7UjgTYNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237848; c=relaxed/simple;
	bh=wEqLbXeBrTlOF4l2H+MeZSAseMy541CN/JP6e3QdsAM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=stzpw8GsvA5smF2Rrpoiq0WG37FFiWBnVTwe6Q4cj9q/J3IeF0d6tGtpfRRX8RCIwuZWIvqh0IkfDsWETCaBJkXd6ZDri5CnzCBH8C/4XLO80ci9zL5ztwHgq1VYEyD4nbUFKU8J/O/RTszca+bI3WyaKZFrd7t4Tte7Vh6IoHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=v++i91jN; arc=fail smtp.client-ip=40.107.208.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="v++i91jN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfH/dHxfUkwzv13alhpzll58wkI3VcsMh18ub/UZwuR8ER+C/QWbciXaf2QUSoeZJRkHjlJcMt59yGJhQDsTT/B/C5mgApysYdun4kQKK2Pul/CnXfHGf5ngjyVwPcq5vhK/FjOePctNCafhH+0cuwf4sWdS+ppZ4uXIFkaOEQAqP4YXqDUixjGUufBLSpewTUX0dOYWvv2h0IjDldZg95qLfWzCOqjFkJuJRA+ZUKU7hl57kSKnNu/b90Nojx+YWTHytf4iwIM45PzToOwviPqy3Ck9cUxQGyXmdS9CQChMceK7zdm/I8v3tzHvyghQSR2v69OnNxeiefSjcxL3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkZRO4rqQnDYiQvDdGP+YNto/eNCihdz6Mnmb2jWMiI=;
 b=PQ/7Jv7DI3tw/QOZfp0ZMcgxZTxtvL/Udofs4qdpkKsqRQ3h/0bySuT6HQKjSv8aFfsfSxrN7o4Iuspw/lmbSAXVyNsrgJzjaBtmdwbO43CnzexM2sOSFsWFVaii465QWOuqHohlRZrAdN74RSVkRnPfNgvDeu6X/jqWw7TWbBY5gBUz/K4tfWzetUPwabeXFzIie1JgRQlMS877avTStzYGROCbUgv7y5rRYEwYdTeP5lGaWfMlZVE3PBdV0CO5/3v8kjL+YXN8Iq6MEMDQNnuHzgYMeqSKooMagwpX+HrGLCvHgg3tq/JJ7awFPJr73uLV0KgoXNtuuKINBJ3acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkZRO4rqQnDYiQvDdGP+YNto/eNCihdz6Mnmb2jWMiI=;
 b=v++i91jNieIWJWWSt51zFAQ4LI+p8UBNpOzKcTvAv8YJIQQ2f/67WlcK7gFLmgttZwIYC+IVZhGbC4GzmIxW4bN/NGqrQ9OYs+TMIFtBWhOLQjZXH3O9di9cU9zosnobsFDZSxuxHjMwarqFHDdeZ1Zsp5YMA6k2uRUST5KcN9huYoHXRGf0F8XvDDB286wEBnf72Vn+u+7K55GwdXeeOENiOFRewB8PclslUfN3Banpk5WNMKKJWlG1wcDPUBH/eUEqWtyfDF/dzsSGsKst4HG9iKYDv0EsM55MyiDYblm+pGlWChvaHuvDq0dw6ycL3P/Xg9Z0rob43QdwKXBKyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 DM4PR18MB5075.namprd18.prod.outlook.com (2603:10b6:8:47::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Thu, 24 Sep 2026 08:17:22 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:17:22 +0000
Message-ID: <132fbf1f-014b-488a-ab9b-2144052a41b7@axiado.com>
Date: Thu, 24 Sep 2026 10:16:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: axiado-pwm-fan: Add missing documentation and
 MAINTAINERS entries
To: Guenter Roeck <linux@roeck-us.net>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Tzu-Hao Wei <twei@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
 <8b761904-27e7-4e03-bc37-9fb048368b2b@roeck-us.net>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <8b761904-27e7-4e03-bc37-9fb048368b2b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::11) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|DM4PR18MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 631c7577-a0d3-4588-7471-08df1a143deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|10067099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2NmpFNH2MB8rBknjbZ/TMW6XjxvIZIzjhnTczQJmVsX6FXF6b/vHZW+YXaVhLORxytCm29KoAJH/NrBtf/CXqVA76VOXpGvUeqJHDHPa/m0NwOcFUFjCGCc+YkobLmLfu7uiVhKvY5DLmBdOiFI5CFHUVo1Emk6L0offs7k3rgnUkiSWDioEJFt8cRxKpmyjIACVyCv2Mmc7mdfVBqos4a7n08SWrZhNrYaqVjVFWu4DAPINW7EYzPabGCCUnrKG7c5fqH9juJSX3QE/bFxHx+6Sqi28YDgWGzOHgHVA52WskS/TwMLy7U2iY8UUoYb8Ewviv8/IWraBQgZVPxWA9862NkFuomr2cPksgaL6qKP1TqpjKfvtd+vqpMtUmUe8A+ZCPiXkfgej6u0ND7+r8kHAnxv3M3dDdK9JozvQZ+Fdap2n/0SOpdfcbMjcadOznPMUQ0H2hCr0oUO0d2yhaVwKVMq68iECfm74zf3sUrb5ml5LA9ExTvtseqizfEEn95ulAhQETpezPynZUaTv6v96Nkq9T5g0nvY3LzeuDyBiOl6giVQkCEmmkOv8mbzB3pVW5LOy0sbVA1L200qmR3TMPC08bZVr83NaIvrQ7sMlc4XN2ztc56LTRefvFaQqPWvRSOjzB3pPZ/2ms1z7rkvXrUfadQDDzOhyEXHwfk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(10067099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXJpcGc4eEZnbml1VDFRU2pNdkFQa0NBOU5NeFhNMnhlZjhxMHl2SzZOekJw?=
 =?utf-8?B?eFJOeHFrMWZHK0dwcnIySWRPMk1POFU1bXRoNXptVGE4NUFZNnA4Vm5rTmhZ?=
 =?utf-8?B?aEpjeEVPZStNVWQrWWl6VHlTV2lBRnJyM1JmNkJwVXpEK0dXYVoyaWpkYTNp?=
 =?utf-8?B?R3BBKzQwUlpqQWFoWm5iNmhnWlVNSXRmY242elFmclhBcHBrMVVBTDludEs0?=
 =?utf-8?B?S2NEKy94bHRmSkxFYWN1clViRTc1V3lER2Y0bldPMlRQd2phMjc5VG1FRFJk?=
 =?utf-8?B?QTBORkpCeDZMbmZqUHVyejRxNnBXWXpMSDRPZ1VzbDMzN2tneFVpZzMxbTgv?=
 =?utf-8?B?K1F0SmZkTFYwbFJFYXdzSytVT3NObTEyYXhYQWczejJWQUZjYmlZa204WGtS?=
 =?utf-8?B?b0h6QXZSZi8wc0xDWHBralhzZzNQL1lRT3JaT3R5K1NOWi9ORVFPNW1Vd2M2?=
 =?utf-8?B?bDRIOE5FRTQvbDNZQ2RPY3FrRWZoYTB5aHoxc3JsWVMwL0l6RVFHK2VSVk45?=
 =?utf-8?B?dHljZjJSSWJ5TWNiSFRIRVJSTEQrT3FYamtMallpWlV2MzR5SW9kbFRycjBs?=
 =?utf-8?B?TEdxdE8zRjg1WXg2Z1VXMjBQWWk0YlpqQ1owSHQzNi9zWTNFR2hEeW9OV2VT?=
 =?utf-8?B?bi9LblQrWjZPOEo1VE5DY1FxOUlyZm03Y3RuS0RrWUNaUzBZTUJTWUJEclRB?=
 =?utf-8?B?VTlYL3BtUlluOUZrQkpuOXhER21IclR1U3VnN1pYZ2pSWHJxYnJodHJHb1Rr?=
 =?utf-8?B?YzJoaERlTlRSK3NqTGhOdEwwbkxERkN6VmpPUHkyTDhtWjhnbGVPWkZSM0ZR?=
 =?utf-8?B?VldUOWd6allOMWxSRU12TU5rZkovSy9KdTkvTzAxNkZTWVhuV3p3SkZWSGRK?=
 =?utf-8?B?SG9tWStyZmxKM21QbmxBc05HSjZoSmtPOFNHY2ZvQktZNUlYcjFjcXpZMU5m?=
 =?utf-8?B?SEJOVXYvQ3JkMUZOK1hEZ3UwT0FRM3d3NVM5SS9PUkI0NTdmVGJzd2w2K0Z6?=
 =?utf-8?B?a3RqczBJUFNPR251dGp1QzBJMGRJM1EwRjEwcUxqazAzTjEwNVlWWi9HeFcx?=
 =?utf-8?B?ZHE1WE5FUW9UMTZnTnk5enBFRTVUWTcxRXVFcjl1SDlKK2R3QlpKNGFmYXNr?=
 =?utf-8?B?cnNtTUdwRUo5UXRYQzJZMHlaQTJURk5qUk9aY3ZwQ2ppZ2ZCS01ZaWFyU3Rh?=
 =?utf-8?B?cHdTMjMwK1hOK2Qxd2dzZW5NN2ZqOTV5cW5MVVhHcXpzQmxKQm9jTG54NGZw?=
 =?utf-8?B?L3lMMjdwQnJyY2hmSHJ3ZnVqazVIeU5Vek5xdXk1eXZLYTROekxCc1F6c1VQ?=
 =?utf-8?B?K2I0dStlQjZsZGY3R3BGSWtCQUhLbGFDZGNReXFoWjNFSWpCcE5MVmp1bXk0?=
 =?utf-8?B?a3pXQXI5SFpLY2ZwTVJ4Nk8xTFVhRFRIc2RtaE9PSUdDZGFDczdtbWZMaUha?=
 =?utf-8?B?eGRZWU9Ec3NUL21QZUNGNXl5Z1c1Vi9tM1EvMEt2Z3NyVkFCOGxnanpXcyti?=
 =?utf-8?B?N3B6eDgxZ050bmd6QkRRaHQxNjNLclFvYS9sMS9ZUEhPRHZRTS9NSWJSOUNW?=
 =?utf-8?B?UEh2clRxeXJwZWE4cW55VDFxUlI3R0pVWlZiYjVmc1QwcnYrOWNSV3JBOWpY?=
 =?utf-8?B?cHE1bkxKOHNMb1g5ZjlmZFd5K09nMkt0Q2RMbFRHSU5FU2tJbWx0VmIvR0xm?=
 =?utf-8?B?R005NDBPUVp5REhqOGJwNXdZNFkrVGsvOXp4RjN6Y05OMnJ6Z2tzdGFneDhP?=
 =?utf-8?B?djZacW1ETjNMcENhYjhwUUVDTEs5UjIySkloVlMxSzhKbjIyMFNtSU1aM1lz?=
 =?utf-8?B?TnBsRDBQc1RJd21laWIrenQ0dG1EaWhNcktwSHVKbzVXYlpGSjBMR2d0S3V6?=
 =?utf-8?B?TU15Q2Z1ZEhCWnRER2h2VWVKQVRRSlA2eXNmenRsODFrb3lESEZHYTA5emox?=
 =?utf-8?B?VmlOMU12a3UzandROTZPczNHN0QrV3pmeVNTWSt0UDhydHo2TkJaNE15S1oz?=
 =?utf-8?B?VkFJanNwTlZaV0xnMmhXOCthQ3NETHNvQTNnelFjSVBzSHNaU1pxcDQwa2px?=
 =?utf-8?B?RVlsUHJHUHdMck5TeUQvMjZUQk05MjhHSG95U3FlVzBPenRtTWlwQ0Ztbmdk?=
 =?utf-8?B?blNNQXBKR2NMTEYrMTVjSGxTbTlsbG1UUmNXMnp6SGFxYnhDN1o3YTBQaGVy?=
 =?utf-8?B?ZnBNZng4MjdudEw1VUg4ZmZ4czZqNitHMFRhWmdjV0h5MWVvN0FaSFA0ZVFl?=
 =?utf-8?B?ZjQyVHIzQTZCNkxpVXJ5UGtxNnFMVkRrV3BnZXUwc0N4amhlUjI4Y3pCUm4r?=
 =?utf-8?B?WUtYbHlsemV2aXRVZVJnd2xQNXFDMXBsMmRmdFM0NmR4SWtVdXhkdz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 631c7577-a0d3-4588-7471-08df1a143deb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 08:17:22.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/n8TQSs8uYGW2EKww7O1khQtsoOwk4tVlE52COw6K17igxNt7N6sGdOfUjWt6YYLxf91lSBwTvZp8nVK4aApg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5075


On 9/23/2026 4:46 PM, Guenter Roeck wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> On Wed, Sep 23, 2026 at 02:58:41AM -0700, Petar Stepanovic wrote:
>> The axiado-pwm-fan entry was added to the hwmon documentation index, but
>> the corresponding Documentation/hwmon/axiado-pwm-fan.rst file is missing.
>>
>> The MAINTAINERS entry also only lists the devicetree binding and is missing
>> entries for the hwmon documentation and driver.
>>
>> Add the missing documentation file and MAINTAINERS entries.
>>
>> Fixes: 2d52742f408f ("hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@intel.com/
>> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> Sorry for that. The patch did not apply due to conflicts, and I had to
> apply manually using patch. Doing so I forgot to include the missing
> entries.
>
> I'll fold this patch into the original patch introducing the driver.
>
> Thanks,
> Guenter
Thanks for confirming and fixing it.
>
>> ---
>> This patch adds the missing Axiado PWM fan documentation file and updates
>> the MAINTAINERS entry to include the documentation and driver source
>> files.
>> ---
>>  Documentation/hwmon/axiado-pwm-fan.rst | 38 ++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                            |  2 ++
>>  2 files changed, 40 insertions(+)
>>
>>
>> ---
>> base-commit: bf92ea2a46120fd0809f24d39ad3482d0f20876b
>> change-id: 20260923-axiado-pwm-fan-doc-fix-new-d0e42bbb0cbc
>>
>> Best regards,
>> --
>> Petar Stepanovic <pstepanovic@axiado.com>
>>
>> diff --git a/Documentation/hwmon/axiado-pwm-fan.rst b/Documentation/hwmon/axiado-pwm-fan.rst
>> new file mode 100644
>> index 000000000000..d110e170b0df
>> --- /dev/null
>> +++ b/Documentation/hwmon/axiado-pwm-fan.rst
>> @@ -0,0 +1,38 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Kernel driver axiado-pwm-fan
>> +============================
>> +
>> +Supported chips:
>> +
>> +  * Axiado AX3000
>> +  * Axiado AX3005
>> +
>> +    Datasheet: Not publicly available
>> +
>> +Author:
>> +
>> +  * Petar Stepanovic <pstepanovic@axiado.com>
>> +
>> +Description
>> +-----------
>> +
>> +The Axiado AX3000 and AX3005 PWM fan controllers measure the rotational
>> +speed of one fan using a hardware tachometer block. Fan speed is controlled
>> +through a PWM signal supplied by an external PWM controller.
>> +
>> +The number of tachometer pulses generated per fan revolution is configured
>> +through the ``pulses-per-revolution`` devicetree property. If the property
>> +is not specified, the driver uses two pulses per revolution.
>> +
>> +Sysfs attributes
>> +----------------
>> +
>> +The driver provides the following standard hwmon attributes:
>> +
>> +=============== ====== =====================================================
>> +fan1_input      RO     Fan speed in revolutions per minute (RPM).
>> +
>> +pwm1            RW     Relative PWM control value from 0 to 255. A value of
>> +                       255 selects the maximum PWM duty cycle.
>> +=============== ====== =====================================================
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index eb3cc6c81bcf..5ad12c57ca5f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4504,6 +4504,8 @@ M:      Prasad Bolisetty <pbolisetty@axiado.com>
>>  L:   linux-hwmon@vger.kernel.org
>>  S:   Supported
>>  F:   Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
>> +F:   Documentation/hwmon/axiado-pwm-fan.rst
>> +F:   drivers/hwmon/axiado-pwm-fan.c
>>
>>  AXIADO SPI DB DRIVER
>>  M:   Vladimir Moravcevic <vmoravcevic@axiado.com>
