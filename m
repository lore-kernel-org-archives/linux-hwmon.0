Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A903B14D2;
	Wed, 24 Jun 2026 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295203; cv=fail; b=ArnV/4MZJ+cJ9DgpojW/uPN0TzscJ1fB5rsiqF9gMB1KnIGV5PK1GAMVknX23KOx/py0x2RheUarle4itukpXWIFPWo7S8RsYtXKGm6AgeUoqNKUpSWGXfzCGrqKuIBelV/L5ubbNjFZflizeCM8URlVeQLym88cJey3KUDi3tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295203; c=relaxed/simple;
	bh=CXo6UDKVmjTweMBp9GriTLpbtmn56JcOyQ8xtyUVVq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cyy9aCPLBgl+gkwX6n8zB/jJGpXdAq1tXHlenhF1+TOe80mKnqEIXnqgNJSRukJua2lBxBjkLCmmpNh67il0w6gfezn1YXi/4AJPjQW/jtdgxgdy1ZENcQ00soxurU1FZqmDspbWTBGoWsj8jaeyTBZbieyiWuLCwk9UTCMS/Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4iCc+bsW; arc=fail smtp.client-ip=52.101.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4iCc+bsW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riBhnKEi3D7flzuaSRb+fi3XFEhBEsq3nP0RxE1rKhYDoswpnsmKjj9F3C04Ka4VY92uCd/S7SzJqwvIR5c4uprfSCxpnLW3B0Cf0D6LxhxXWdsy8vDtfnLS4Oi2gxBN7k/V4mfFXd7YNUQ0TcP97+bD0mO9YiH8nzk79erOzxMvx4NK86ZTKCtkXSEmozeMvQ7+Y12FWWlpql/NRA15ucjewOi21Zn3UyL3BgcNYwev81V1+4+ZFLLc1MQBFvPgHU6sIvfs9pjTbh9HjuaKbewGYQBMxqNbeZj4U9LqbOf/rJnFm3PKyojbkCkF0+2tEAChKjMSbW8WNyW6Keta6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pgx3Jaoq2lvcueNLwdcXXL9q09AnMJ2EeZpP2DHFLMM=;
 b=C5GLZq76DX5ihtiQrhadD4plwjriart7YbiKuOMyMNiQMD0VskHafRC0BciQ0wQuBNnMdwQx+A+Izj+klfLkEhYx3lfRXr0r9HNBvMFRzUdXra4CbiNglnNAsenwaLM5M2xfTNZQ9cCgZ1UO1dBPCWplJwjS1GSU0qvC3TyAdmnP9IsNrp5hWfQJKfvttJ3SNDhXFm6mwZ2uIruR8INzpWoa0WrabImhrOjTnDPvIxwKYByIGQEvEdCMzR0YFVchxN+jh6b6MRyD18GM0n9wZNH5Q0366cu9K6Fcb5Tlir61Na3aNgRjozWblxjW3X6ypt1LBn1RHH/Vf/gw27Lsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgx3Jaoq2lvcueNLwdcXXL9q09AnMJ2EeZpP2DHFLMM=;
 b=4iCc+bsWv1mfeXgbNAzSRQAFdYTy2vTwAP8o+1uklbswZUQCxAqI6a0Jm4Fx5WjxWjU/3wT0HUUSFYFxKIC3Fdj08A8sd+K5FOeqUtBIB/xF7mc/9fLV/rUIp8dOpkuIc0vmAxmtsZNX1SDhKHqaICynjiILddUsoYeXKUKyhPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 09:59:55 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:59:55 +0000
Message-ID: <663a1818-8255-44a3-9b2d-a2008b3c7bfa@amd.com>
Date: Wed, 24 Jun 2026 15:29:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] hwmon/misc: amd-sbi: Move core sbtsi support from
 hwmon to misc
To: Julian Braha <julianbraha@gmail.com>,
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
 <20260622135821.2190260-2-Akshay.Gupta@amd.com>
 <458e0f2f-9997-42b5-8f43-68799ff9d4e7@gmail.com>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <458e0f2f-9997-42b5-8f43-68799ff9d4e7@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba087994-d997-400e-96e3-08ded1d75788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|11063799006|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RW5IolcNwh+SAXEZ+SBns8gxw8rrJCrSiFZTb8YWFXDWDBR8hIW8Z+nQio1sZmrS/QeFMCK2s2hue/dwOchDYP5eCsl6LMwijLNekhZrOanjTLW8nok76TRfqOhDXNHdz1ugcYnyKiAcyPH3b2k/7X6eJImbRxbmNCFOwFhPgQBUP/qrN3dHIXNNA8Iee5KJplnRqGFo98bp9CGSlRf6AEtqG20eQxTTcAHcEp2N+rPGtpcgFjXO0+Q7a7U4Jy8dGLC0dvhfabBCRO5znRRyGeo3gFPftMacZHMMpupAXNdoCya/HJmMlsY/NtFv/QgmsecF5cbOz9qTW9+FnzyMxF4GSM9sczCAKr6rENYo6wViaqLTTKDZx5yx8nV3XWI8Yfu3jGKeM+AxUa4JpE38Y5QillakO446ufNpXGVf2GbkHz/F1FSweGcngHs9FIsHUyWQ0nJo8q21dKrkSyJAKJJ2N3PqrHgvGp/kCDQiOXuV9r2sZKN9SaytlLXhAbr4nukyq6HDqI3z/k2OYreh2kNK2gBWa4RlLeezqZsy+mVLdC5n1a1fHXtiOZ9CF91Q0F+FtBB/ZH0/X7CrsHyx/CylZgsUpQpr0uENC4hW992TSHoAbOfEF/t2zwkG0Q+yHJ+IMkO6ijlZo8Q08NrxxrLtqlktVFJ6BJZaeUsOetA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(11063799006)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U05KTy8yTjBTNnlMWFVXOEhSS0xCb3JoUXA3cDZrMzNmemtxb1lRT2l0YVUz?=
 =?utf-8?B?ZG5rSGo2THAvRVptWlJhd3pySjFFanZwQ0Q2bmVKUys3K2hZSmQ0amFCdnp6?=
 =?utf-8?B?cEhicVo5YmQ4eEl0TEhVdElKTlBtUTlrc1hzME5VanRNeVFHRHd6YTFLcmFV?=
 =?utf-8?B?NW9wTXJjNi9vWjhOLzJDcVV4cENrcXE0Z2J3VGx2OEM3Q1dBOXNFMUhrVkNa?=
 =?utf-8?B?alg4TnVlNmI2anB0L21tU0MzVE5vTm1YTGNpNnhBYkJ6YUQwU05HbTNNblBN?=
 =?utf-8?B?V3htcHFUcHBlQTAvalEwT2FjVDIxMmxWaS9LcllPSkVvZDkvSlFLVTRuT1N0?=
 =?utf-8?B?U1RqVmRyV3hrRUM4dkZYMmJNTmdVK3hPMk15dDRrTnVtckdJbmtwaTBpQWkx?=
 =?utf-8?B?QXc4Q28xZXhaMm14OXUxUVdvVklWVmtjajFmWEVCQ1orWFdHUE1rZUlCTkZ1?=
 =?utf-8?B?dXltOWIrWUh4eERxQ25vY2owT2VLSzBvTXFJUVVlSGJyRmVzY0tqMHNJNHY4?=
 =?utf-8?B?b3EwV0RoQk94VFZISkNHZmxJMWN1Y3BUNHB1MUlzTHBFWnhzcmdQcTBsMzlV?=
 =?utf-8?B?V2g4T0VTWFBZV2FCSWlwVFczZkFUaGNubWREU2JjVkhUdThvSTgvZC80UThk?=
 =?utf-8?B?d2VLQUl2eGJ3a25vN1JnVmUrOHhSM01QQmtRTEpXTUlXQWNKQ2FIdXNLamdD?=
 =?utf-8?B?NmNuUFZ2UDZQQWN5UjdmSVh4UXlrV1JOZ0J6bE91dXQ4WXBOK2VzK0VEQWRK?=
 =?utf-8?B?MDgwUTJ3NGp2YWRsbVZZcHpOTTJWZVovcWgvVWo3L29zVUhxU25sendPS0dp?=
 =?utf-8?B?eGYwVWV0cmdDY01Ha3Jacm5ZQldBS2JzU0NLN0dFK1ZaR2xnc2MzcDM1alVF?=
 =?utf-8?B?dU9OMlZlYlYzQUJMN0UwRWxQdkZleGlwMzZ0c1gwZURGczl3Q2V6ZU1sS0Zk?=
 =?utf-8?B?aVJpUnV6SEtSbm1adkxkY0FnTHVRSGRsWHgrSndIdG50WUJ3VUJzSExsSS9Y?=
 =?utf-8?B?QXAvbnlTSDJrd2FUaDNMQmV4Uk5ObUh1WWFJVXBLbzh3ek9CWUZhVzlkM1NJ?=
 =?utf-8?B?VHJXdnRJVGh6NWFQQzhQWmlJbWRWTUh1WjQxL3cvbW5qbmQ0LzcvUDF4a0h3?=
 =?utf-8?B?ektnTk5BZ1hLdWlROUMrUU9LYUxLdmF4eDZOQm5UcnpFeVk0dkQ4a09nUzlu?=
 =?utf-8?B?RFJTSTVrbHZ2M2tsbkk5eTJwTUZNSytlOFZyeUl1TlNOcDkraGQ4VHFqYmhn?=
 =?utf-8?B?WEZKYllZSk1VV2xHb3B3V0JjSEoyVzFTR3krVDJjOWdzY2FiZnluTGFILzg0?=
 =?utf-8?B?dXhPWWRwVmZhdUN4Sk55QWxZYkhhdlZnM0ZoVm9xVUkreTExS2FJcmZibng5?=
 =?utf-8?B?M0N0MXF4RGpuRE0yMXcxVk5Ud2Era2pudHdXTjRmdzdjZWU5Q2hmUmRVQXVY?=
 =?utf-8?B?b2p6L2VtVlpHcEozTVVqNDNNdEZiT25zVXduNE43MVA3eFdsbloxSTE1dnZT?=
 =?utf-8?B?TjVzS1B6Z2dvVys5T3IzaFBYWlp3cVpnSWwzOTY5Tkk5VHArMFNra1liVzJC?=
 =?utf-8?B?UHZFNkgveTBKKzFiWFRFTVZiKy9lYmQyNjlmYjVvRHltS295NEJNeGFOeVgw?=
 =?utf-8?B?cnNTUUNKY3VwRjBJdGRCTklEdG9KNDh4K3NlWmg3NW81aGFSNytaaDU2WlVR?=
 =?utf-8?B?eUlHR1ZSK1RMR1lnZGE5T3F1YnNSTGoxL1VNUzhsQmczVytEemdvZmRsNVE3?=
 =?utf-8?B?eVAzVTRFbUJqaGRndjZRSHVVaDhoUzZ2TEY5K3ZnUnRCYS85aS9FeWIxbVgy?=
 =?utf-8?B?V05FY0lUWDhITWNob0xrYlhoOXAyQWEyUEgxTG5FSjRJYjRuTm1obkJpMHRN?=
 =?utf-8?B?OHowUThRSFkrcU5Ga1ZSaWJZZGxuVXBXUlZZNWFLaDFHZ3FJQ085aDlmenJL?=
 =?utf-8?B?eWFPVVF1S0pmSHRJSnRvb1B6dE9VaHNTQkhySWJiZzBvT3NTbDVMVU5razdI?=
 =?utf-8?B?ZFNmUkdWd0crc3NJRXNTeXZSQmhJT2FUUlpwYWg5ejFWb3hMell3L014SUh2?=
 =?utf-8?B?YXM1TzBvaG5tM09EVUxpc1FwTm44U3AyZll1NmExQVVleUFKSWg2VndSOWJr?=
 =?utf-8?B?UmJoVXUrQUU3Wi9zUjUyNkpxWnU4YnZEajNxcW5iZ3NCS3lVZGEzaUVnY3B0?=
 =?utf-8?B?MXRPbjA4THdESlQ2SE5rOENyWkV2d2hNYTVsOHBENGY1Y0F1a0RVK2JRLzhS?=
 =?utf-8?B?SDB3SEI2WU1yeDV4eUhCMG1YTkVUYUZSenQzaE15M2xDUkNvV2RPU3l2ZHEr?=
 =?utf-8?B?Y04rMjlZWEcwaUxUbmxudFNPNmhoS3dWcWgzNERSSjNDMTVEanZ6Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba087994-d997-400e-96e3-08ded1d75788
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:59:55.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cea38HUD1Mce2IuT/B4dj8cIiWev0jKvLBHt27xexfwpbphYpFsh86gGU2RNyVp1h/hzSq2uWmnPomytnPnRxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940


On 6/23/2026 11:15 PM, Julian Braha wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Akshay,
>
> On 6/22/26 14:58, Akshay Gupta wrote:
>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index e4c4f2b09732..8f204cf49b6e 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1963,7 +1963,7 @@ config SENSORS_SL28CPLD
>>
>>   config SENSORS_SBTSI
>>        tristate "Emulated SB-TSI temperature sensor"
>> -     depends on I2C
>> +     select AMD_SBTSI
>>        help
>>          If you say yes here you get support for emulated temperature
>>          sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
>> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
>> index 30e7fad7356c..512251690e0e 100644
>> --- a/drivers/misc/amd-sbi/Kconfig
>> +++ b/drivers/misc/amd-sbi/Kconfig
>> @@ -20,3 +20,16 @@ config AMD_SBRMI_HWMON
>>          This provides support for RMI device hardware monitoring. If enabled,
>>          a hardware monitoring device will be created for each socket in
>>          the system.
>> +
>> +config AMD_SBTSI
>> +     tristate "AMD side band TSI support"
>> +     depends on I2C
>> +     depends on ARM || ARM64 || COMPILE_TEST
>> +     select AUXILIARY_BUS
>> +     help
>> +       Enables support for the AMD SB-TSI (Side Band Temperature Sensor
>> +       Interface) driver, which provides access to emulated CPU temperature
>> +       sensors on AMD SoCs via an I2C connected BMC device.
>> +
>> +       This driver can also be built as a module. If so, the module will
>> +       be called sbtsi.
> Your kconfig changes introduce an unmet dependency bug. When I enable
> SENSORS_SBTSI without enabling COMPILE_TEST on x86, I get this:
>
> WARNING: unmet direct dependencies detected for AMD_SBTSI
>    Depends on [n]: I2C [=y] && (ARM || ARM64 || COMPILE_TEST [=n])
>    Selected by [y]:
>    - SENSORS_SBTSI [=y] && HWMON [=y]
>
> - Julian Braha

Hi Julian,

Thank you, will address this in next version.

>
