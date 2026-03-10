Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33798309DCF;
	Tue, 10 Mar 2026 01:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107637; cv=fail; b=rLwIUfvJMF6Wb37O7dGr8t9vmv6e775KwObthjASelbbnDAAFzNHNIF9YcKqz0VDfrsx1u772asmiaiUbARqb3SP2sBxPccOFQy6oqjcUJtQnclxiFLSk+WEGVG41/tp/QgcolZVi6ATf1ymEEhdIlz1T7B0CQHM76BuPBUpEkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107637; c=relaxed/simple;
	bh=k8pfJkv52wIsdxgaqwsGCj60ClyZ2kTsZCfPl3N5hE0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PxLj2kHs0Aj4gT+njfjHe5SE/SUpdIwBEg8c4DOtUDkkEDCJNtgJM/TOWNnWAmVKnlCGmrX9OuOQDRuGFNVHjVqlYPPsOh6qMTvEM1e3asPZf+Kn8d/M7PILnuISKNsecbanflNt5RrCfsl0bRvZ5kz1UeNVLDqZSc/JU38RCrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UPdMBlLM; arc=fail smtp.client-ip=40.107.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UPdMBlLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KViQGHPenulyXUGX+dMEK5rgOfltxj68bErgC/sQMoHeKfcYpbz62DbOd/KM9wdORMlBvX/1yc/pMr+8og87QBmNpvIyW5Cm0giKCYt3ozlpqHn3FN2hroGb8ORyBgHGWYODn459nCkhEhO1dMt9I/BJH4yz6IWcwWR1qE3QMIdHgDn0SbUtdodieXGuCYJ2eCI48bM0RzYIVFhFmWkDYP7s0XLOVGisYrFg0tO77ZLyoppx0zBWL4YJ2oRBBcFMc/x87PEZxtDuZR3+7JaAeA2my1ORHu4vSF64O+yRxh+tu00Enfk6dK34IMnnr65RXEi07fRXtQHdtSFbANre1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nri2UTGdKzE2eUxU51AYS8dy3XdXyG54OdRBqOs+iGg=;
 b=jZfDvW/LRWQ6FMM2iPdYub7VxpGklV9+oppy5gM6eNSiVlbCies5XyiKak43rk7xX0SMFK6c2CFrYNJpfX1fTZPNO9NUTj8uFXF4QAAsNJ0O0qv1uxWhKf4u1Hd5Apti/OFhCrrKyeNld+pjtJ66PMVJT8h0rJRbdQXgKunCaEUSXIbjyewykVdJchGlHTy0kKH8zbMHLy9cX+rXo+VEhrVOXyMUD0zMi59or0AMGNnMymgWvbKFTuRPMolkL2iAk6KUB8M5oJpCdOdjx7On/HqdIis97Kydh95RI/59M4Y4UnQXUv6LvPT489+kuOF00YK3lYHcZfpQpmgKeqSJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nri2UTGdKzE2eUxU51AYS8dy3XdXyG54OdRBqOs+iGg=;
 b=UPdMBlLMOiwwG6xXMeD9ypolyhxizvAwlT5uVaNPQjlUR46qWUrWjFQmP/FevJRi3MJ56S48v2fWyoDTcIDrZ9LdYgF2kreVsraZyHujygFw1Se8qvuxw14vwu3Av8GglhlwasnE3lb6FhGH0uzXPn2RIZShTZswY2N9g+sJlfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Tue, 10 Mar
 2026 01:53:49 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 01:53:49 +0000
Message-ID: <36dc7af6-11e8-4fd5-80fa-657b005a0b21@amd.com>
Date: Mon, 9 Mar 2026 20:53:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Dell.Client.Kernel@dell.com, mjg59@srcf.ucam.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-2-W_Armin@gmx.de>
 <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
 <20260309172309.a3ukif3bejbicywl@pali>
 <c1957ff4-964c-4651-93be-056ea4d9004d@gmx.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <c1957ff4-964c-4651-93be-056ea4d9004d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:610:76::11) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 2494ede1-e5a6-4364-aa00-08de7e47dfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	jAsa9pV9EXM9yqRngqXV4Dzy2VJy79uYC8P/b0gp+Mkt5x55gqZaKn6Q9E/Uu7WXbDKPNMUlY7V5HUnEQDzv85UviJ1PCFYR6SxP72y3TrUwDhn2ydtJnjxaZeI4SEPWueop+fGFbZ6zAep9ouJy4yLFqlbuc302Wr25Vk49/ONRksQU+9wvSLE9nRZpl9vSy0TkHEXErkXtA+Hhq3fkvAIGmnJyrqlZQu8Xf+PsuVNdUAylTRgX5ESOkBE/QHbjyRT/bIxs7YorPUluwB/CS1MNxoEw7grl/Ai/PGnVgeXKlnEBPjRUWq/SAFYj32hL0nR6zu+AJjZUMhNb24DpXQIFDktOXOOtrwgjev36fr2ppSUTEK8N9hkUuq6guZJDBqc2YynFpQ2/UJK1I1euuGkbEP3T4yzXnYVlCUQ41IMjsJHzqIndfa9Pq2Vhqb3hId/8X4qKMC6QiYu0sc2ix6DjrtHS1tch8ilJ0FErAz+uut3piWXiIWiBXrG+JkXWFJzSy5wEdZPstVeUKvIwJ3sgF0pqVND1bOdKI3tvJSRrULwezP7A/E0C0/IARCSdip+Lt5gNHx0ol7m0HH4vJi+xUYvJ6qoQKEyZpKbQIb3GxFyaX+5Qp4OP9/QlMn723fxgrbVBIY47bib2w+exhQ24nKNU4/LPZYtm2/Op9kNSDcnrsTSiCFCGUxrBCG3E+wBNQoaRgFpoPyO075PXoxD+SGmjBRzEuYEcp0o6p30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVBCbm1MMGFBcW9pUmZITzRlRUU1RzhEbko2NzMvNmhkb1JWeGV6TW9tdUhW?=
 =?utf-8?B?RklQUFpXajZiNXRSYUlNZ1Z1bmo3N3laYmR0bzdOOVNYWVBYbzVRUndNY0pX?=
 =?utf-8?B?RGdGQlBjN3lOU09aK2lEOGVIV2creS81akpTZmpCdVN6d2pRY1I5aFRWVldC?=
 =?utf-8?B?V1pDbklsTnkrMkk0Mmh0dU9CZTlSRUdDS2FTUWY0ZHZGK2pMM0dGZDVMbDk4?=
 =?utf-8?B?WlQxeERnaVRDNUJvZFd3UUM4R0hLZlJMYjg4Y2lFK0ZGTnIyK0xHU0tlN1Mv?=
 =?utf-8?B?bVk0TnljOUU0eG1PSXhtY3NNNVU2TlpEeFV1NjV3MVVHSWVFYkRhUVhkNkwx?=
 =?utf-8?B?dlNFWDNwV054d01IWVBHeDZnOXhEcUovamV2SUhFaXJpUHJrVzNIcEhMUmhv?=
 =?utf-8?B?aGFWL1hiT1Zlc0UxTUNGaTBBM0dHVmR1VGtwaGtpaHJzbkhpT21rVWpoYUNL?=
 =?utf-8?B?MFdDU2RMVW5saDZpRUVkSlR4ODlVK0Zid0N2RzlRZVVXKzI0Z1lTNllUeWlX?=
 =?utf-8?B?L2xtSjVlLzhsQWRUN3NnbVgvdkcxTDVvV3UzWkxRL3RDNVp6enNJTVZlbFFo?=
 =?utf-8?B?YWNrTUhaY0gxSGx5V0t5SURRQXBMd0xqYzEydDd1QWRucXZlajliUHdJMmRZ?=
 =?utf-8?B?NndwaHgyTk1QSEZWNTVJQ1lJSmh5aUZDcEdUY0t2elkvbVBwNi9MdWJ1MFFm?=
 =?utf-8?B?Qm9mTEZKWlE2eUNIY1hSR08vZytSa0htT3RoRFhEc2RmUnJpUEw5YjNwaXdZ?=
 =?utf-8?B?YTVUS1l6U0JBZjBiMUZDQ09ISnpZbk5JODd5UzB0UzNCVTFtQVloTDJ0NURx?=
 =?utf-8?B?ekU0VTN2bUFaaXVTd1NzT25TbUcwdnNldy9ncWo4RmRETDRKNmcwVTI2clAx?=
 =?utf-8?B?Mm50UU5jUzlTU0Z2eUpqbXpHSE81dktoWUJVWXMvQjAwOHoxaElUVUd5bmxE?=
 =?utf-8?B?NE5aQy9XUDgwQXJQcU5lOFRqTnpnNVFrekhiMWtiTE9JOXUyaDBRWTBPc1FS?=
 =?utf-8?B?TkRZZ0VLMXN6SDdvM0dWVUtHUzZPNWh4NW85ZWFVa3UzWjV2MG5jTkZTYzdZ?=
 =?utf-8?B?RlRvVitUUlUzaCs2RWYxNFBDLzhEbE1CeGpxMWp0M1pNTElDZHlOclVWODdS?=
 =?utf-8?B?VVVtZDBhTHN4UFZ5RFhiT05XcFRUeVZwNytEQnh4UmVyUnRDV2l1YUpKVXJO?=
 =?utf-8?B?Q0FTcHZpRnlOT1pwK2VsSnl2SlF1R04ydDI1RHl1M2pBQURDNzdwT01aUExw?=
 =?utf-8?B?c3ZKRmlERXZPVkpMTjZldys4dVowRHE0OXhBbGVsUmk0Z2h1QkhsTFo1SGRD?=
 =?utf-8?B?OU8rWk81cHJ2aXlFdDQrREJ0YkgrakRpemtuSnpwanNINm5uZisyd3Qxb3NN?=
 =?utf-8?B?dzFBMVZZUnlmZ2hNYjNGaWsvMStGZXJnbGcyNkkwQnE1bllTTzVmMFhuUE9s?=
 =?utf-8?B?MDBLNk14OWZqQnloa1c2UXFnK3FzUVQyQjdtVjlCbSt6V01tNVBKWm9hVFdw?=
 =?utf-8?B?T3h2S3U4dXlhRVZ2eExySmlDQnZtVi9Ya0psMzNtVmxvbnEzdXJwQmZKOUd3?=
 =?utf-8?B?cmxQbkxuQ3c0QzN5azVVRWZPalVpc0Nsd0xtWUZja0xTRkFKRi8yZmJ3ZEx0?=
 =?utf-8?B?V3BJV0svMVVYNTBqSGpyM29VRXd2OGNoNFkzK01vcFdQTDZjYnFWVnBWZVFs?=
 =?utf-8?B?WnJOVWxwWkFYWWtna1kxTDV1emVISFJkMGJ3Umk0ZlZZTE9td0JVdDhhRnJz?=
 =?utf-8?B?cmpBTTlneE9FNnJrWHNkT1BtRFhBV0l6VmlsZjRscTZncmtGSlZpc2oybjk3?=
 =?utf-8?B?WnRNeTBpSmpPVnA3UVJmajc3MVJWT3dKRkZuNGxJQ1NkL3NYOEw5Wml5WWdK?=
 =?utf-8?B?Z3ZFSDhLekp1TFpFRi9jOTEyWlk0djJXZnBuVHlMek1QOExUUU56ZnBpMGcy?=
 =?utf-8?B?YU1peGZOa3VBRGhaZGNDME5tbHJzSnNWU00rWDNIOVVHMVRyV2JPOEtRc0pn?=
 =?utf-8?B?cm1lckpjTFYzVUVYLzI2RmkyRWozaHFlcGFYcStKczZ4WEtoZStlSDhLRFpq?=
 =?utf-8?B?VTJWQ1U5aFNOVGhWRE9FZFJacUNXeTlvdEFObUtFcDJib2xGbmNzS1BnZVVm?=
 =?utf-8?B?WDZSeW9PbGQvZjg0UnZyemtvK0FEblhaOWVZbGtvc0w1L0VQaktPeCtWQS9k?=
 =?utf-8?B?RHJjZVFIUksyYzU3N1BEVlVFL2ZFOHBWWDV6YjAzZUlubmgrNnhqUHk4Vi9D?=
 =?utf-8?B?QkswZUM3Q0g3RHB5MmNNMWlpaXJ0RVgrR1E4NDl1My9PVGxtRVRITEgxM2hi?=
 =?utf-8?B?N3paTjNRaHh1UDJwcHRzSGQ5N0VPNi9rdXBGeDExY2U5TmpMTnRRQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2494ede1-e5a6-4364-aa00-08de7e47dfb7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:53:49.5706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IskYrT3ssmxA7HNeoZQDhSxy44xLrK4mWxvFmg8kK82uRPyVe/k2bVJgrOS/VK7/HKHaJlyLVLiFUE6fZ+CLlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552



On 3/9/2026 2:45 PM, Armin Wolf wrote:
> Am 09.03.26 um 18:23 schrieb Pali Rohár:
> 
>> On Monday 09 March 2026 10:41:20 Mario Limonciello wrote:
>>> On 3/7/2026 6:25 PM, Armin Wolf wrote:
>>>> +    /* "DELL" */
>>>> +    if (le32_to_cpu(desc->vendor_signature) != 0x4C4C4544) {
>>> Do you think you could come up with a helper for matching an expected
>>> "string" like this?  I /suspect/ it's going to be a common pattern that
>>> vendors use and it will increase code readability going forward if a 
>>> helper
>>> is possible.  I see it at least twice in this patch alone.
>>>
>>> Something like this prototype:
>>>
>>> bool wmi_valid_signature(u32 field, const char* expected_str);
>> When I read your comment, I come to another idea. What about introducing
>> a macro which will convert 4-byte string to u32 number? For example:
>>
>>    #define str_to_u32(str) 
>> ({ _Static_assert(__builtin_types_compatible_p(__typeof__(str), 
>> char[5]), "wrong type"); (u32)(u8)(str)[0] | ((u32)((u8)(str)[1]) << 
>> 8) | ((u32)((u8)(str)[2]) << 16) | ((u32)((u8)(str)[3]) << 24); })
>>
>> The whole conversion would be done in compile time (with -O2) so should
>> not cause any possible performance issues.
>>
>> With it, the condition could be written as:
>>
>>    if (le32_to_cpu(desc->vendor_signature) != str_to_u32("DELL")) {
>>
>> and no need to use magic number 0x4C4C4544 and write comment that this
>> number in ASCII is the "DELL" string.
> 
> To be honest i do nothing think that having a helper function for this 
> inside the WMI driver core
> is useful, especially since most vendors other than Dell do not use such 
> magic numbers.
> 
>  From my perspective assembling the two constants ourself is fine here.
> 
> Thanks,
> Armin Wolf

Oh I didn't realize no one else is doing this.  Yeah if it's Dell only, 
agree - meh.


> 
>>
>>>> +        dev_err(&wdev->dev, "Dell descriptor buffer has invalid 
>>>> vendor signature (%u)\n",
>>>> +            le32_to_cpu(desc->vendor_signature));
>>>> +        ret = -ENOMSG;
>>>>            descriptor_valid = ret;
>>>>            goto out;
>>>>        }
>>>> -    buffer = (u32 *)obj->buffer.pointer;
>>>> -
>>>> -    if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
>>>> -        dev_err(&wdev->dev, "Dell descriptor buffer has invalid 
>>>> signature (%8ph)\n",
>>>> -            buffer);
>>>> -        ret = -EINVAL;
>>>> +    /* " WMI" */
>>>> +    if (le32_to_cpu(desc->object_signature) != 0x494D5720) {
>>>> +        dev_err(&wdev->dev, "Dell descriptor buffer has invalid 
>>>> object signature (%u)\n",
>>>> +            le32_to_cpu(desc->object_signature));
>>>> +        ret = -ENOMSG;
>>>>            descriptor_valid = ret;
>>>>            goto out;
>>>>        }
> 

