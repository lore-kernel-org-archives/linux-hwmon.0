Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26493302165;
	Thu, 28 May 2026 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947374; cv=fail; b=Qsvew22RxUZ2kM+sFOAsLTulSscqPWULDShlCvGJJK3Z1PzVdC1fCtngqWakHxAqCqXOMkih0Z/pVpby2WRILTq2LtXMK0YyfjpS7/cfbF07oAw2lJ16r2f2Y+DR5p5XC7NAwwObUFLkU7WHV/RLxt8PYxwQoOt+izKd1CFoCyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947374; c=relaxed/simple;
	bh=OcF7qpmCHBHvjbCpXD7ilXC3KXlOmuG1tKg4OptqG/c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=apgQtWGwrJs4vYuCT3bJzpCd3RaYzpBe94cnDG7yKTnj+46x3IJv+O2DWcQIHYoO5ZEN/t3ASUBm321WcO7MUoF2i07XMtnxB4Nq7yoB4NMraz/r3Wc5IyXQBF4C7f2ym/T3Hynbu06clNWa7NG74dc83t5GF4KeCgNPyvC1JVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mps3MZY3; arc=fail smtp.client-ip=52.101.56.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mps3MZY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne/jCIjY+/kgFqWyFznBc5bl1is/52D4eFYwiLXAG50vZKpFMXNE7NjQFPYw7oT+NeYzklKoOd9M8FJVSKChlJBDwtcmhxD4EBFHlipCIS4ZzHSSx9AoC+MQVQqcctLEGcb64PpssRmWw48Th00tZ4wz9bvt24CYxrvJP+LC72vciTSb2EIyQI0uTrtegxDZ8qF4evYQRG1C+43nhBq8dK70RZMS4dMEFhW+nqNCZWvtMhUdnqgmRORXc/coeQOEPwlEayRZPsy1W8Lt32Ky7bIOGVP/2SnZ4ZG/RxEpzRf5suIKd1mvfchYwdvTrng40q9hie6/fU1BFFQo2uwePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPQ1EsQIZ+dmmGVY00mb9ZXXNEXofkp2MSJ/OsFo7Fw=;
 b=n5kE/K/WbWwO7umUSzqiglyQmDMJwa97ktyS6dp+9rqbqZqCX20Gee8ITGq0ApMtJSfmdgx/H4j/SzxWhaJwsa5SkPQObAgH0Bzoum3wQBuamA1eau/QR82zXkTrarpU7F6ZEl8fw2Raqm5MYkRMtMJsvpD3lTRNs8phDZZUFRRFeZQBu0XHEnXSRWCHP+wQjg5OvHU+ikHI/LsrpcNvr+xyy1uWAhtEyskULnhROD3YY/beDe926zIWV6K+pS8hfh4zXKM5mwYQYEr3eCIACEypdpDY1RrI8iZ4PcWSaa9VeHr7zmU2sWMwTImUcDhds29nk5OXgntDEfeYCNO1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPQ1EsQIZ+dmmGVY00mb9ZXXNEXofkp2MSJ/OsFo7Fw=;
 b=Mps3MZY3kNy6qim4oE0zW52agHoPcvxTtc8tHeuzLZBEOtij+o2mJB88n/JuTyN3iG+JOfk0G+xPV6+6so77XU0k8VzbvwbV0RPtrbBwlgCgbeh4zvfMHCAzQEabkNdJ4+HEuHjLJrSrRunldHcY6Cg+SYC3z4PzgUJjnxdEwx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by DS5PPF7671D5CC0.namprd12.prod.outlook.com (2603:10b6:f:fc00::653) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 05:49:28 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 05:49:27 +0000
Message-ID: <ec31cb51-89f9-4c6a-bfa3-183dea782897@amd.com>
Date: Thu, 28 May 2026 11:19:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] misc: amd-sbi: Add SBTSI ioctl register transfer
 interface
To: Guenter Roeck <linux@roeck-us.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
 "L k, Prathima" <Prathima.Lk@amd.com>, "Umarji, Anand"
 <Anand.Umarji@amd.com>, "Kevin.Tung@quantatw.com" <Kevin.Tung@quantatw.com>
References: <20260515134506.397649-1-Akshay.Gupta@amd.com>
 <20260515134506.397649-6-Akshay.Gupta@amd.com>
 <54160fbb-01d9-400b-80f7-bf340997a8d0@roeck-us.net>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <54160fbb-01d9-400b-80f7-bf340997a8d0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::17) To MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:EE_|DS5PPF7671D5CC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 79497b27-e1a8-4714-6186-08debc7ce122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|6133799003|4143699003|11063799006|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	exBxYbtJjwo2AFGZRrTtoXCOYOVw/i6nxEJzLZRJeMYLhmSgXp4r669n4N83MZxJeHPfyHoCgp9Apepi9zWAfV8diqjqvefz5k3EDOFdTN34LhbJMQxOejXPTlsy1cImkuy7qSynmmtQYH4t3X3n3UbcT/5MpHsMpaYqaXvyPHwTVklg6UncbTJLe7PhubIRMlsCSNxfq3tq5F10wotrhKJTkqmYBBYWvz6+5eYDpD0dg5jzxl36q96FFfLNnfO9r7cQ4lGIYgsgMApFPmieqAlrc1mqYndopZ0LZXUeTXM3d1PrV1pCOzulufl3RecIKBMkdZatuwwh9m7CI2OpUJY5M18skjgFqlnGjHhEvHOUA67EjxxQzJNOXkjgq2T4f2intXyE/B48MTA6qC9DwYzSQ2/yNOfW3oR+0lddLb09gg+r9jXT74YI2gfvXVnEC+dWIhIdfQYTZ5TNwGKsUdwmE43CcGAkY6e+xykdQC8gcfuDVdek8zXB7hTfRMTmb7+nQMYA8uIX6IQnk0BHP1665z5CnxKPPtzUFyaozoYAcZ19Wn7Hz9r+vNeLIea0WpkOQBz6Rx2WSbqVQHMqn/MwD7aRjpmmU3bzJhFILzcBR8b1vvsNuY0hxl6nt/rizYLs7Jaoy7INA6uCmUbFfbz4g3RTYsHRQxlydhjxnj7+IR3PLu5u1Aj4McPk9i04
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTluYlFWMnpzbWdvNGZQOXk2dVZCclVmdllmb2FhcWgzb0dlN3hFd3BISmdW?=
 =?utf-8?B?Vi80K2FocDVpRWlTenB5dlF2cXFtR0pqSTlSMnBlZ3pLZENnM0FTaWg1L0pK?=
 =?utf-8?B?RGZQcjAwa3A5MFdPQ0VUMGJBUkNUY3I0YTRWeWV1RjJTNEdYZkdWWEYvaTVq?=
 =?utf-8?B?MTdSTVpaV2t5NjNQekQ0M2JSaXlGc09mSmFQQWhJZ2xXbXVtR0pSV2Y0STdW?=
 =?utf-8?B?czVRVFBkUU94b0ZBUWgvRmJ6dzBlazd3bmpYT2pvQlJKNUZlQnlVZUtSalhX?=
 =?utf-8?B?ZUZiVTNnMSs1b2Mzb2VCczhmVTRVUTBJZFM3R2JCeERWM2xIdDVnMGNvVkdt?=
 =?utf-8?B?SEZ1K0pBdlJvaDFORW9qQ2pYU2IwTHVVQUNzalRWVnNtK2MvT0lKVjRJNXcy?=
 =?utf-8?B?aVBKWHVQMmdISlhkYmRabDVMeW11alZNUU1yQ0pOMjNNUHZFZHJ0Q2RBS3VG?=
 =?utf-8?B?OWkyeC8rTUNicFlhSk56M2YzazZqU0M4ZUUwaG5nUjhrbjc3a2JOVURSU0Ux?=
 =?utf-8?B?aHNGaWxTUitaaXpHSmlQLzVjYjFsd2dub1ZHZVRrL3FxcnF1NWFoV1hCNjdl?=
 =?utf-8?B?MlU1SS9wbTg2bDY4OEc1UnhVR2xHYUx4NG9HM0VPRWF0aEVHTGpPWGxHdStx?=
 =?utf-8?B?SE5Id0wxdG5kSHNaNG1ML3VhdEVkK20rcTJoV3I0Y1c1TVc1aStveGpnM3U3?=
 =?utf-8?B?OERYRjN2UWRUM1c2QnFRdlgzT2w1WWMySFc5TzV5RlRJK2wzTU5HdmpKbG85?=
 =?utf-8?B?bUcwUDdGNWh3QVlGdVI3b1ZKRXo2dUNSSUZyYVlMVzIydXE1dVBtMzZLd1VP?=
 =?utf-8?B?MnpRRFE0bmdBd1kwd2NsTStPYlNOdUgyUGF1czRxS3hDUEtGWG5lR0FjVmJG?=
 =?utf-8?B?bWllQjNGZ1JQQlljRURZc21wMzkzWGw3NzlQZ1FDR1ZKMUNYL1ZTYWpyejhx?=
 =?utf-8?B?bmU3NTJ6SCtpcXh6SDJ3N2p6bGlTTTc2dlFQZkNtOFBjK0ZvRHl4WnZrcXVY?=
 =?utf-8?B?cU91UnFMaml2RUhObFZJYlFHT0E4L1ZGanVrMnkxQlhOTXFnU2FpSnBSZFZi?=
 =?utf-8?B?ZlBwa083cEtWajFRTlpTNmpxc05RZGRZNEdhZ2pZaUt3c2pYbSs4SS8zNVZJ?=
 =?utf-8?B?WGsvYVJWbERtNDN2QmVMd293Q0wzdlZWSzgxaUJKK29ZYkthcnFEYkI3Zi9h?=
 =?utf-8?B?dnpKN0xISEtsNDZmZmt1emlCVWVuTS93eVRxcTRPZWIwcFpOek44Y0xqM2hI?=
 =?utf-8?B?T2poTWZ2cjR0Z2U1U0xvRG9mZDRtL29rZWx4SGk3aHBhQ3A2a1VaaHlwS3JK?=
 =?utf-8?B?ZTVuUFlKcFE4Y1Rtbi9YWEdtRTJMR0JRd3dvT2pLckJ3aHQ1emlHWGwwRGdV?=
 =?utf-8?B?dEFoR09DWjl0Yk5mbVR2RXVVZGc2TEZEZStxNGt5MjdjL0FjTmowc2FkdDVs?=
 =?utf-8?B?bkFqT0J6V0JxTTRXdUxneG9Ca2lmRUZQeXFURHdmdmRjellSNnFodGlSN0J1?=
 =?utf-8?B?RDI3elRWSEdHbDBwVTNTZ2RmVVFPTlkyYVJSRFl3NGhuSjBLZjBtNTUxbnVs?=
 =?utf-8?B?L2Y3M2lBMnBuVndkMVA0cEdUS3AxOUtxSDhFSUxib3JIcGpad1hIeHZWcE5z?=
 =?utf-8?B?ZUgwZC93ZE4zclBMeUNwMlNoWXo5M2VyNkNLQitGQjNGbG51a2F4L1cxVUI0?=
 =?utf-8?B?dkFESVd3b0t5UWNaa2RTdFo2cWZiYXdMeFdOODdPbFZUcGpYTFJHMmxuME05?=
 =?utf-8?B?WWpVK21VcHhNY3RiR0Y0d3NuZGFSL1lLcnRxS1l1THVYbHdrbmlXSjZKSW5O?=
 =?utf-8?B?T3llRGhkMVF4TWZzS1ZYVjFuQ3NDL2VZcE9DM2dVUXpyR0xQdDFVcTJaOUk2?=
 =?utf-8?B?WDEraTJQVmtKWWdtK3RTWTVMeG8vTStDcDFHMEVYSGJGVDEvLyt0aVY2WkNn?=
 =?utf-8?B?SGlmRWJFbUZqckVXU0p5M2lteTVVRkVDWjhLRGVqeFNpTFA5YnNNYW1SUVZR?=
 =?utf-8?B?STlTNzFHeWRRb01CbkhPQWlHc25TRUZ3bVRCRWZkcVhwRURCTWhJZ2w0THd0?=
 =?utf-8?B?VklpaEp6YnkyN2tYVjN3OHNiWXRNLzhlVzBUY3FvMXA4UTVWV2xoMVdzYmVy?=
 =?utf-8?B?RzFEK3FoOVk0MFNvYWZGZmVTOGdRWFBZaGxQRFlyajNKakJ6YlpiQXRLb092?=
 =?utf-8?B?UHFsQWE1R3JNY0J1WitkOTY5UWZrM3I5dzVGZjBZdm8zUnFTalZadEQzb29Y?=
 =?utf-8?B?RFV0V0JpYTJIUE5KdWNjc3YyRTc0WW5oUzRXUTB3YVpIY1BRTXlpUGRqQlBW?=
 =?utf-8?B?STluellTZmV3eURtaG9CMGp0RlVSRGpRWFY2SlVrejJWNGJ2TUUzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79497b27-e1a8-4714-6186-08debc7ce122
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 05:49:27.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEKjrltLC1B8bEsiAz1OkQMuBVlTrbyHbBDfDoP00h6nlu2zo6yJ7LEtqGquOXz8JLBmjx6pE7Xb/MnXaP4Tsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7671D5CC0


On 5/15/2026 7:41 PM, Guenter Roeck wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 5/15/26 06:45, Akshay Gupta wrote:
>> From: Prathima <Prathima.Lk@amd.com>
>>
>> Implement IOCTL interface for SB-TSI driver to enable userspace access
>> to TSI register read/write operations through the AMD Advanced Platform
>> Management Link (APML) protocol.
>> Add an ioctl command (SBTSI_IOCTL_REG_XFER_CMD) that accepts a register
>> address, data byte, and direction flag. Serialize access with a mutex
>> shared between the hwmon and ioctl paths to prevent concurrent bus
>> transactions from corrupting register state.
>>
>> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
>> Signed-off-by: Prathima <Prathima.Lk@amd.com>
>> ---
>> Changes since v1:
>> - Use of devm_mutex_init in place of mutex_init
>> - Use of guard_mutex in place of mutex_lock()/mutex_unlock()
>> - Use of devm_add_action_or_reset() for clean removal
>>
>>    drivers/hwmon/sbtsi_temp.c      |  6 +++
>>    drivers/misc/amd-sbi/tsi-core.c | 84 ++++++++++++++++++++++++++++++++-
>>    drivers/misc/amd-sbi/tsi-core.h | 15 ++++++
>>    drivers/misc/amd-sbi/tsi.c      | 20 ++++++--
>>    include/linux/misc/tsi.h        |  8 ++++
>>    include/uapi/misc/amd-apml.h    | 23 +++++++++
>>    6 files changed, 151 insertions(+), 5 deletions(-)
>>    create mode 100644 drivers/misc/amd-sbi/tsi-core.h
>>
>> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
>> index d7ae986d824c..00e982f4c716 100644
>> --- a/drivers/hwmon/sbtsi_temp.c
>> +++ b/drivers/hwmon/sbtsi_temp.c
>> @@ -64,12 +64,15 @@ static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
>>    /*
>>     * Read integer and decimal parts of an SB-TSI temperature register pair
>>     * The read order is determined by the ReadOrder bit to ensure atomic latching.
>> + * The mutex protects against concurrent access to the shared I2C/I3C bus by
>> + * the hwmon sysfs and a userspace ioctl
>>     */
>>    static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
>>                           u8 *val1, u8 *val2)
>>    {
>>        int ret;
>>
>> +     guard(mutex)(&data->lock);
> I would suggest to hide this behind access functions such as sbtsi_lock(),
> sbtsi_unlock(), and the matching guard functions. That can be done in a
> separate patch; it should not be necessary to include hwmon in the patch
> introducing the ioctl.
>
> Thanks,
> Guenter

Thank you for the feedback, Guenter.

In the next version, we will address this by implementing the matching 
guard function in the ioctl patch and creating a new patch for hwmon.

>
