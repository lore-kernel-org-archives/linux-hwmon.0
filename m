Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679A22126C;
	Wed, 24 Jun 2026 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295394; cv=fail; b=pR/t7nllrrOr7fFBfBHYKs1xFCe5F6DJbaT5vTM5tYVKDgt3iN4WJsMXoQxO4KfFNEPKxw1cFEbR+H7mrwd024nMWRccb8Z+mYq7TUrCH+JIW1BOPA/PrMrbZZy8QY/kqlJxH3T/VMfmpNOx0dGWoMhQ3L+4NwbIHKYB5Xi/b30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295394; c=relaxed/simple;
	bh=wbDtlVWUzj3oeY/wLaRx5vvux5Xxs5qI0mSL86SC4UI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l1k5gIzChTWB5ljr0EuGbnPfddSnXc0n63aWOq2C7pmz2ZMllyZLIHVnO0b9TP9poF61XK7QsFLmXjGCFnyhv3BNaAepJjgvvlbDNSWRqGWI6Dmj+uWvzabDng2O2eb4AIsdM59jE056VfLi3f3PyVUF2H1mDZT9p1RvDAEDvXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z4nG47xS; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z4nG47xS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS+TCZErov7QiNSk0GI+LxG2CJiANuYRysE7Hlw8zboMFKX/2BwRuQsI/XX6wGQY7K36DqctlxFo8v+gWe+2xf49pBEyB0QS57O5la8+Qgl0yjpKfiFm8xFRw5HuEDy8buqvk9shzQytoXmyukUJv5ByBIb2j29PSF2FIf4dpnVT1eUXkhI/T5kOVZdMw5Tu0UTwM4vNoQjzSDf6BStp5D5kMEcQpElBs6wkfJ4EFGCiFbIT04tbc39HPXMEFXSJzxFnJ7IbxwqsgMPhUALRMyVL0acJvu6y8CoRb86m/gNgWOnJGQ/jfld1DHdnjjOgnGjBz6cZUs4H7SdP/ZqugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVzFdpLHHp//lzX/njWUkdFDmv1gFKiw08aJYS4gWuE=;
 b=xno3oKPNdJItQwbHpI4IRhR2yGt8fof0YgM8KI2jupMkJjIMsO0qTvXR2Jqoi/bwa/igzxUPwVR1XoTPgImNAXBOr+ehP1wBJYQKwiHcmoNjdQH7PQJG8EFEy+z7XEuGy7Hznsf9u5HRCAsKuAk4ygxzbss1dWK+QVpEWVKquTAss92aXUbon6okj+aT6w7kPhdWUnheW7fOs52mPNXh9WnHKo1TL7ughsDYg1gCm4p1cGtLpy3hvjjxJiI1i4eNaf7GAK3sqKmFMQJjJqnHqQL+qGyG/hiy6k/rPAt39YjI0T6CfNUWfyKTVDxcdKMyWMCANrYodZyvCr2SRP2jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVzFdpLHHp//lzX/njWUkdFDmv1gFKiw08aJYS4gWuE=;
 b=Z4nG47xSAt4zNP2hCOuOb+FCX0KheN2H4srzFa9CSQ9vH4997BsD76KukaqhFH33aEjynVCHhsYCUImD1lY6NQXmTsxWjLvJgQ1t9w/0xmKM+KfR/9EEOt43RsI49Ec+cRPfsnYgDYVvblxOjoil6LHY79NfAsQQd/n/jWn4LI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:03:08 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:03:08 +0000
Message-ID: <a77e8e56-f290-49cd-a636-16dada60390f@amd.com>
Date: Wed, 24 Jun 2026 15:33:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] docs: misc: amd-sbi: Document SBTSI userspace
 interface
To: Randy Dunlap <rdunlap@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
 "Umarji, Anand" <Anand.Umarji@amd.com>, "L k, Prathima" <Prathima.Lk@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-9-Akshay.Gupta@amd.com>
 <f1e4c8f7-b3d9-46a3-b42f-710dcbcf15c0@infradead.org>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <f1e4c8f7-b3d9-46a3-b42f-710dcbcf15c0@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::10) To MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c02eb13-6fb9-4674-6247-08ded1d7caad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|11063799006|56012099006|4143699003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NXy16pK+lw5ilRrfaAAQJPbsahnIduXpT4SeFxa6Qew+sNmOl60Ih9+c+CVqnu1dhlik62IfruQ/dY305FWG/uzUk47tSytEpadr63+kGhcJp5I08TDO5f6RNx4fNdGJim1fpdCJE/mFzbTzqg06yyoxCKHy4voBATW4KLY0h1HTKFV7HSQ1X0n88IigXEm6kuSmQX7ghvrNvrQOM89+t1kuywUdABH8/bK/nYbhXOtgyt6uZHt9h91NWK6TzICShlrnD5k0ln+sBmLJhNcTWdIrjleNiUnIajR6k79BqWGzUcZ7uBEfo4ILQrdbbNai5sSxkDG0OOn0KElDxoVjtjHV39pn0icIFTRp0zTzv983zuaxxC7dQac8hwXuSAUNOZY5Iv83O/vU+vmcw/VkBkvzy9Jio8amcG0tKVpa7IXq6EsXKUbYNlQMpvjptEow1mUfnVPvmz4wbtOKCMepIOJphCONFsbOTiSKA4eMP+vTVhnmjk6I9/MoAR3yUz53qCSOI+chFN4JX0LmtbATBtRtmf+KmgTo5wdT73o3j6ZLApwX51JSnQFo6PB9F9zMKWncBAnwwcJ/szAOE/AGySUz2fYLJiSpMH3r24u94pLueiXU7W/l8/UQIAq2kgsBtMRvJFYBGPzuVprQ1BBsD2Q9vaIjVjaJEGLZOtjzesI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVdjb3BFRVdqazhmNEJlMmhhbjJtY1dNNU1WdUg2QlIyZ0NJbUVZRGZEQXo0?=
 =?utf-8?B?WUxHaDNMZ01WNm5HYUJVSmd3L2JwWjlSdGdDb3pIbTZiTnZrazNMenlKdmhp?=
 =?utf-8?B?QUVwYjdLTUVUVWI0eUpxc01WNGFpVVJrK1ZYQitJTmUzaFp3b05UeUdtKzUr?=
 =?utf-8?B?RHlaNVUxMWZoNXNob1pNNkQ5NEtxeDNDdUsxdm1YeTE5TXBDdFd3SmJtL2tW?=
 =?utf-8?B?V0JRME1xQzlTcENaMURIR0p0emE4UGFQcFRzZ2dhaVpieWprT1ZYNDBiM1Iw?=
 =?utf-8?B?bFlMejVZME5PSFpRTzlZWGtrZXl0SzVHZ3R5M1FucDY2cmhqYWZxaWVCMEV0?=
 =?utf-8?B?T2FZcFhSM3dtRzVSQ3hJd3RPNnFUK3dNTlNWd2g2RjZ5RzBHUndWK3pkOWZH?=
 =?utf-8?B?TzR0Q1V1ZmxFZnhTNHhJYWcxeFYwa0RZK0NneEROcDlHRFpYWlNIWFI4STVk?=
 =?utf-8?B?V1BoSzlVY04vWjc0WmdlUDBKRjJIcDdtdlNqV0E2d1RpT0tHWEROWU9JTzgv?=
 =?utf-8?B?eTNmcGEvL2M4djFhWjFxMUtwOXpDU1UzNzZGcEtGdjFhV0VzcWI4QUhnaUxY?=
 =?utf-8?B?dXZWK2xGQ1RoTDZwdlY5Qlh1djFaWXEvemZudHFpd0N6c0JHNVVjaDJBaXAz?=
 =?utf-8?B?QTBNUy9JSWdvVWg3Zkk3ai82MTAwTmlteWtnYTZYcTkvdGhmdnR5WUp4SXJD?=
 =?utf-8?B?N002Nk1uZ2RFbW9meEFKbDdOVXQwT20zNjBxRmwxNDF6MW5CYnI2ZklMTjkx?=
 =?utf-8?B?ejRkaFZOU1RXWDJiZDNWbVpnQ0tjMmc5Ykd3UzArcWYzSy93VG1VM3dldkRS?=
 =?utf-8?B?NzVzNTRiOVlwWk9PYk15eHFmR2p5VVV5Ykl0N0JCVUI0U0lYSTNWenpTUjdl?=
 =?utf-8?B?WDFQaDU4VkdPa09pWHVkUXFFM1V1ZmxmSmErM3dvVGtRdVgzTXQ4UC9ncm5B?=
 =?utf-8?B?aGQ4bUdVSFcxSUdJSWdQaUZ5SEtOcmFOVFozb09TK1k4N1R6QXBzRTRmbVdk?=
 =?utf-8?B?WmMrd2RmZnlNUmlpWkY0WHpEblp0aEFOU0JaRFh5Q2J2UVkwdFNpNFdFSCtq?=
 =?utf-8?B?blhLNnJNYmdwZjYrNUJWWUhsNmZMSTBIOUtSekFEb3lRMHlEWEM2QXVaeHcz?=
 =?utf-8?B?bnF5UjRkYWw4aUpKV0M1RVhjMmh6NkNwMEhCYnNORHRxK0hGbHJDVWo3dWJQ?=
 =?utf-8?B?aDYvQXR2TlNRSHJoZllZZDhrMDJGRjNjKytQZ0pCbk5Zekc3MERsaW14QWty?=
 =?utf-8?B?d2xvb083YXFMcmxlaFVZOTcxUndVSmVQVldqejFUc0VqMDg2WW9XYitKK1pO?=
 =?utf-8?B?NzQrTUE4NmZSK1pCNjluQUJkUVhFOXMrOVhuanJFcWp5NW1XNmVIOVcvV1RC?=
 =?utf-8?B?eSt3T1I3RExxTUN4b2lQbS9yZnlmOWJ0VTgxeWhTZEZNREZTNUlHOXhZdzJP?=
 =?utf-8?B?U29WQjdGbWJVekpERStNWTVMNVZ1QitIcmF4Qk9jRjdKUVg1RkJXUUlxUGVs?=
 =?utf-8?B?UVp0MVVlMm1QMjduVVZ0SHhZWEdOeTdaTzRwOEVpSFBSajlEd2F3Z0lPVVIw?=
 =?utf-8?B?NHNMekoyaHpmRjBZeUVGMTVUZ1czb2JQY2tueldnV3VDR3piQXBmQzF6MExE?=
 =?utf-8?B?UTVLU0MvRHBvMHk1Z2hHVURad3N0azhmK3o5a3J2bTIrWTR3eURHS1duOVhV?=
 =?utf-8?B?OHg3cmdQL0MrSzVaSkhraTcvdnV2VFdOck1pV3pGYUEwRStENWZNM05uT1lW?=
 =?utf-8?B?RFZYQW8zMkcwUWdKTFJUT0xBOTQxTXBzb281K2pwYUE5dW5aSENHS2VoMjhT?=
 =?utf-8?B?a2Y4NXVJM3NGZ1VHU1NacXAxNUpNbTYyMnFuU3UxeVYzZWtIU0gxV3UzRW1Y?=
 =?utf-8?B?T2ZNMEhEZXNIN2NKditmUGt0bHZTdEJQaC9ud2ZJVDNVY1A4UDk0dEliaXJv?=
 =?utf-8?B?ZFB5S25GWXdremlQcDR2MWFsZVUwazc1TC95MW1kaVFqdGRKSUt4aU5nakhS?=
 =?utf-8?B?VkJ5TG9qUHFKRGFnRjdpS0hEYTNEZkVsbkwyNDdvVW1IQjdrUkhZSGFuZGJ0?=
 =?utf-8?B?KzVjNmZyMGNoVzBlL3lVQXR0ckxPSTJhOEMzSjJvM25rQXV6eWszSk9NUURB?=
 =?utf-8?B?UFA0Ukc0bWtVMmNHSS9MNXh2eVdYMmZ5UERDUnRWUkRxaitHMjdIQWpDOWZu?=
 =?utf-8?B?MVhKR2ZURmdTQWZCUzZodkZ6YVdVRGtiTGJoMGRwZWRUQzJ0eGMwRk5uUkdN?=
 =?utf-8?B?YUJGNFp5eXdPYlk5eDNUbm8rY0UxYlpRTEFlWnFLNFg1L3hYd0lZc3lrNDdi?=
 =?utf-8?B?eUYrQ0Y5U3QrUUdGY1VhUTcyT1dSdDd5VGpMcnlPTEpiRUdCdzMrdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c02eb13-6fb9-4674-6247-08ded1d7caad
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:03:08.3150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ho0bUptdayvgkuXRkW16rLqLKnnbdkx1jOdLbpIz9NW3s9BYhcM/srFoiE9/E9rPQeP7tRVswlcAw15/wCMyhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940


On 6/22/2026 10:27 PM, Randy Dunlap wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 6/22/26 6:58 AM, Akshay Gupta wrote:
>> From: Prathima <Prathima.Lk@amd.com>
>>
>> - Document AMD sideband IOCTL description defined
>>    for SBTSI and its usage.
>>    User space C-APIs are made available by esmi_oob_library [1],
>>    which is provided by the E-SMS project [2].
>>
>>    Link: https://github.com/amd/esmi_oob_library [1]
>>    Link: https://www.amd.com/en/developer/e-sms.html [2]
>>
>> Include a user-space open example for /dev/sbtsi-* and list auxiliary
>> bus sysfs paths.
>>
>> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
>> Signed-off-by: Prathima <Prathima.Lk@amd.com>
>> ---
>> Changes since v2:
>> - Update misc node names info as per socket
>>
>> Changes since v1:
>> - Elaborate the document
>>   Documentation/misc-devices/amd-sbi.rst | 68 ++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
>> index f91ddadefe48..fbbbc504119f 100644
>> --- a/Documentation/misc-devices/amd-sbi.rst
>> +++ b/Documentation/misc-devices/amd-sbi.rst
>> @@ -48,6 +48,60 @@ Access restrictions:
>>    * APML Mailbox messages and Register xfer access are read-write,
>>    * CPUID and MCA_MSR access is read-only.
>>
>> +SBTSI device
>> +============
>> +
>> +sbtsi driver under the drivers/misc/amd-sbi creates miscdevice
>     The sbtsi driver in the drivers/misc/amd-sbi/ directory creates a miscdevice
>
>> +/dev/sbtsi-* to let user space programs run APML TSI register xfer
>                                                                   transfer
> ?

Hi,

yes, will update to "transfer" in next version. Thank you.

>
>> +commands.
>> +
>> +The driver supports both I2C and I3C transports for SB-TSI targets.
>> +The transport is selected by the bus where the device is enumerated.
>> +
>> +Misc device:
>> + * In 1P socket 0: /dev/sbtsi-4c
>> + * In 2P socket 0: /dev/sbtsi-4c, socket 1: /dev/sbtsi-48
>> +
>> +.. code-block:: bash
>> +
>> +   $ ls -al /dev/sbtsi-4c
>> +   crw-------    1 root     root       10, 116 Apr  2 05:22 /dev/sbtsi-4c
>> +
>> +
>> +Access restrictions:
>> + * Only root user is allowed to open the file.
>> + * APML TSI Register xfer access is read-write.
>                          transfer
> ?
>
>> +
>> +SBTSI hwmon interface
>> +=====================
> [snip]
>
> --
> ~Randy
>
