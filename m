Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFF3CCFCE;
	Mon, 16 Mar 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680607; cv=fail; b=F8h/ym11JjXxVAQSD0XghdMApSWpA3rFhjpCK1m6ivJKZ3tCfJWcBVLlxKUD7UOS8BtobD9djopSPokLWf78ZqQiqvcvXT90L6VcvR5UOF34ycc+tdiuCNr2cJEpFW9Z8zZ7GW4JlqANjwtUj12Ms85DqVZ/2Hms8B19CAJ66bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680607; c=relaxed/simple;
	bh=q+rxObNlE5OjrASxUa/B7l/V6k00kHHs/2MATPJndy4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iTCEMktWngKvCsRTMdi/gg+Wzf8F7Rp6IqWrQ0xWYadlbn1UjjEtfQuBHUA7RpWwMlXSU2A0Tz+7ofdjwOtI6itoG5DpLdXk/iArOjYdPxzyTvjhwcBHFsNbow6SkAF/RHFFzlcV4F2ODMayhyT4lv9uQx91dnJugdAJqjcmpHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eTO6U6x6; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eTO6U6x6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkZiH3qxc5WsrxNnb6JUgIZ7nQwsPJlPBo0qV/vAYnvgHqPrPbNrS2dMjgkXoNFn7vRwbmRZyYegJ9Il1T3mv18K6Zc/6x6lUnVJVj0EnEykdtlIjC2V1AWwZ3xitF0zR8W12udcXaB5QsEFWXitj1PJKp6deWqg8Ll2UfVzRWOZl3AvlHJGtqxZdhDR8h+XQyPtDz7u1ORYYPXcnxhLciNGII3Zi9+WM75KWdXLp4pDrLDpD53DITlNrf9bMuIroiPtVIk9D56d8F38oAcinyKM+PvsISW6txh3r75YfMDmGknI29xZFyHUWR8zJzqw6NUsP8x+d0YkFKv4EvKs7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Llv6ah18yuHqMOUNt7vhyUpTCoWeq1JbBCJs5SJbuJM=;
 b=T7/4ZO4jW8ay110g12flARzGEgdr/gcYosdsg4KAorH+lXowOi8bdRnNkwMuITZvmTp2RJkOtJLZaWMiIWhB8f4OMoaTuMqXTSitQW0+wJV57JgNuQQBngqDxDGgLJGJIeOeieVlXxQcpQcl62B5LN3criVr5ekQ7xwMa0AASil9LktjJdqmer4Ot0K02gRETxYidvFQ3T6Hfr2Q+RbaUal9dBCxYG74KXj0uCOblIJaNK1OB4QphekehVvstSyVFCHf7PbxIGyRoVDZW/KXV13/3UVFGXVF7Y6eFGAuS/Z150EjjCVMOJykN67Z31vOTq+Gtv7QkoB9aItb+MlqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Llv6ah18yuHqMOUNt7vhyUpTCoWeq1JbBCJs5SJbuJM=;
 b=eTO6U6x6efxxahXnxR82TycUhu/r1EowtyPQh3kqBCsQ+qHQf7NdqvQb8tHEOnYj65Ejr0hJH4LJPEILiAHHIMOh7FFQHN/lUYwtCNEq9j/I8T7lIn7ORAiCqbTGTC9Bg1GYnUnM5d6SvW6Cxp6EbqDi0517KnTL4hNyCMNXTOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 17:03:23 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.008; Mon, 16 Mar 2026
 17:03:23 +0000
Message-ID: <62e0d0b3-eb6a-4372-a2e2-9a43213369cd@amd.com>
Date: Mon, 16 Mar 2026 12:03:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
To: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: soyer@irl.hu, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20260314175249.16040-1-W_Armin@gmx.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:610:76::6) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5dc844-c351-40b5-3dc8-08de837dee8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gIeqrp2GqGvmBreN2XjfkD1Zce4u2Cvtc8B/0Oc3Q+vdLoSSbjw+lT7N0VuviHoCjIRQph2XpeybB5Qu+KZjzHIqfEiv+4TaSkx5MjV8E3OY6r/4SOAsi0lp7nstW/Qbh23gbIiJcoD+WdsJnuv3+HvhRrJwFTT6A4gUlgxISYzBIychUS9VoBxbtl8AxO6Xm3BQn/B3eGICIvIg8xLHfSWXTn1hDwdyLtrJ/IWJztM1U+o4RGIy1BX3dI/eO4B30hKaXnUybP0Q5ehW97Ss6m0GCZThdcFYtl8OdMe3GpRQU4wiPJPsj5YOhtC+PljZqahXgdx+1HRPPusJjqiyMVMmkZojdr6i8P6x+gzJ///fOh6zMF+4p9UcyJXVzC/WApxOaZlVAaQIa1rrYQmrMDJBMz7HUbDo+5eP33Ruei5ZBYHSqfTHSkekZ7PntOkOibhZdWfjteihK47tmvj02uwCJi/LZtjBq52T0kQlCIMbibQv5D8QC1J1H8xFXGtYaeSCVzXt/44MYDQfvy3qF0IfVt7N37blrxoRStZBey93MGpB7RFjK9rQaZjkQCsYfTHBbfjriTf6d1gmQvd+c1fN7tXDwBhUe4XjEbZyPbopclnZApqQdSjyZI0CrnZA3J64hDAor3Sx9Z5GePFrW/JdrLDHjq12rRQDC3dQhKWV6n+7njtDHlcjGsDHmn5iXKtyOT9bBTg4Oco2Nnej9ST6vfNO5EmM59Jvbg4tj3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2xGY292R3owSkhvdHFwRDVaL2o5bW9vOFlxb044UzFIM2JXR041b0F6L3hn?=
 =?utf-8?B?aEVoeWRyUFRlYXZQWTNLbWdreWNrMnZuemE0NzA2dCs4V3pXSHV4dTZCYnB0?=
 =?utf-8?B?QzRCeXBhQ1BkQmZJNXVrQ0pUem5zN3dScEVobVVudmhSR2hiSTZPVTFqZ2hl?=
 =?utf-8?B?NUc2eS9tUTdmcEJmWFhJYm5GYXlnSzdIcEp3S0JuQk5vbTlHWk54c0I0Z1dE?=
 =?utf-8?B?TXdvQnI2M1h4c1dOYXB6cVhlV1hsLytjT05JaW9jcnFRR05QZWhPa1JOdFRB?=
 =?utf-8?B?VzhCU2JPSWJ4ZG03d3J2MEF2cThZVGMyUWxzbnNzM1JKUUQ1SldpbTdFRTE1?=
 =?utf-8?B?Qno5YXhjTWpockw3aS9admVieVdZQ1gzVy9KaUUxcFphVlMvMzl6ZHJpV1ll?=
 =?utf-8?B?aDRtbll5ZnlCcFdjMk1ieEV3aHRSeHF2S0JjSHYwTytBbCtlanJ0K3IyUUpN?=
 =?utf-8?B?YVdXZFNLRFVDOElrNFl4TTlmZGh6N0svS1gwZ25hSjlIS05scDNGQ0d1R0py?=
 =?utf-8?B?ZVBXRWtEL1ZOWHZCeU9QY1ZpUENpWE1OcEpVMEcxY0RXcHkzcHoyYzUrbElF?=
 =?utf-8?B?WStpSlB0Zm5iZXVhdkVrTnNrS3REYXpOZUhCc040a3ZLUm1KeEZ5enl4cjlW?=
 =?utf-8?B?SkRHUnVxdXhDbjB6MEdVRGFQQWNKbkxRY05UTDZ1VmpOZDZpaWZhR2FvbllW?=
 =?utf-8?B?RVJsWTkzVElqWDhhTG1DQTZKd1R6TGNISFhqK2FLd3k2VXMrNDNFRDdqK2Zq?=
 =?utf-8?B?YnFKWSs0MG1CY3dRMlp0TGpRR1p1ZVFDYy9xeEtZN1ZxbDlDaWs1bTlPbUpk?=
 =?utf-8?B?My9ka2x2ZFNhWllrSzR0OHd1aVZsWXVkeml4UTRzWGFDZ3daYlhIcTByRkd3?=
 =?utf-8?B?S2RycmtjcmJRWGo3UW5PWFBqRnJPcDZCbTNSYW85c0JZZDhWQTRXV21IWm4z?=
 =?utf-8?B?NVd2U0tqMDczWitlTEhtWnJZQVhjbSs4TzZhZmJKOEg3Nk5pbG5QZTQzVkhw?=
 =?utf-8?B?L1RGSGVFZ1JCMkI4Sy9HdTRVZWxIVm1Lc3VaMnZFSlFEakt4YzYxTVRBUTNT?=
 =?utf-8?B?TmNIdWtPNTBISzRuRGJtcXNoUTdCUEdFY21YYU1pWjhJalNOOWtFaVJVem1q?=
 =?utf-8?B?cTBzUWlKOWRKa2pQTUdZQ0VVdEJDaHVpNUJhUEZHcW1rTlpuanJoS2NrRXhC?=
 =?utf-8?B?M0J0TC9od29oVEw3dFc4eFE2WVA2b3g4VXZiTTdPMWRaLzMxSWZhTzFWRWVp?=
 =?utf-8?B?a3U4bHdpYUZkMSttT0RsTnkyVDIzZyt0S1llV08wNTZsckxxcmZvNjduVmtD?=
 =?utf-8?B?QVc4OTdjUTB5dnhrUEp6YVQrYytHa3g0TjRkNTUvaFBVM2FtRjVNY0dvdmcw?=
 =?utf-8?B?c3lpSkpybStaOVJGeXlWTi9odmZkQSsxdFh6ZjZTK0NuZnZraW10V1JRNUNh?=
 =?utf-8?B?aTMwRnVFSUtVUWFjeFlzdFc0ZGlGMGQ2WnE5QkpkVkhpMjc1Vy9pMXROMGZP?=
 =?utf-8?B?OVBLazFHMzJYMENOa2RHbnBnM1FYY0Rkd0VHZ1ZvcmNwdGtkOW9vSG9FTkZS?=
 =?utf-8?B?SUlGcjdIeW0xY012STRIYm5UQ2FQVk1tc3Q1U0lmeXh2LzhhTUhYQnlrajJm?=
 =?utf-8?B?ZVBZUzVSYUpiTzUzMG9TRmN5WVFmdnlURWRtSllYcFVEZXRkMU9ZQ094a2tT?=
 =?utf-8?B?R1UvWlI5V0cwQXNISTd1M3VtMkEvNzh4QTg0ODZxRVMzOUQxTHp3NVVCQ1pJ?=
 =?utf-8?B?c1V0eVEzaEtMMnliZUpMZU1rMEVzY3BLQjVZUjV2bGtuc3VyMlRXTVM5VjZl?=
 =?utf-8?B?UVVsNDlUaEtaRG8vbGpBbFdsVWJIVEtBZHJSRDJWMHZjSVM0YWwwa2luQXVO?=
 =?utf-8?B?c3p6WDNuU2RKbkV2c09GOExlemFlWmRDeHdjRmpiMFIxV3dzVzh6UHFJTmlo?=
 =?utf-8?B?UHFnY3FYSmF5cXpKUTFUUjhPQVErbHBUR2RHbk9nSDJQaFgyaTBVZHBRN0dT?=
 =?utf-8?B?ZlhmRVdwS2ppQ05kOXRGVmhPN0ZNaFdycDVyTC8zUWM5VTZ2b2VCL29NV2J4?=
 =?utf-8?B?cG9xYnVUV3RNcDc5SkErdDV0OFovdkdIc01EM2ZHVW9YTWFpUFBCT29CRHNS?=
 =?utf-8?B?YUI0MTMxQTZvOHBJbXowdVVFM3k0NXpMOWNxWXM2MDlOMm5FNEVUT3NOL1Rw?=
 =?utf-8?B?RWdMd05VT04zKzNSa1orUjAzVVR5MUgrVkZkdkdlOUxnVmtmL3FmR0JJeFpE?=
 =?utf-8?B?Vjg2UWNMVGFPU3hOckl2WkpiNUxmM2NPWk9GTENqdStVK0NvMjB3RFplaWda?=
 =?utf-8?B?cEtmSXhnalZJd05yRUhhbzdFdS9INzVmWGd0ZUNBQjhFL0FiZUJpQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5dc844-c351-40b5-3dc8-08de837dee8d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:03:23.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9D108cZcG8Reh/K4jL0Cs1CEU5R6VPUtOXDVHpGpQouGPVEL2UBu6EsOI1UlVmz2UwM35F23k7B+g8n5pHcSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330



On 3/14/26 12:52, Armin Wolf wrote:
> The new buffer-based WMI API improves the compatibility between
> different ACPI firmware implementations by performing marshalling/
> unmarshalling of WMI buffers like the original Windows driver.
> 
> Convert most Dell WMI drivers to use this new API. This also
> removes all ACPI-related code from those drivers because the
> new buffer-based WMI API uses abstract WMI buffer objects instead
> of ACPI objects.
> 
> All drivers have been tested on a Dell Inspiron 3505 and appear
> to work normally.
> 
> The last three patches contain some misc. cleanups for the WMI
> driver core itself. The most important change is a fix for modprobe
> to verify any WMI GUID strings from WMI drivers and convert them
> to uppercase if necessary. This should fix autoloading for WMI
> drivers that use WMI GUID strings with lowercase letters.
> 
> Changes since v2:
> - add Acked-by tag from Guenter
> - rework buffer parsing in dell-wmi-descriptor as suggested by Gergo
> 
> Changes since v1:
> - do not perform pointer arithmetic on void pointers in dell-smm-hwmon
> 
> Armin Wolf (9):
>    platform/x86: dell-descriptor: Use new buffer-based WMI API
>    platform/x86: dell-privacy: Use new buffer-based WMI API
>    platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
>    platform/x86: dell-wmi-base: Use new buffer-based WMI API
>    platform/x86: dell-ddv: Use new buffer-based WMI API
>    hwmon: (dell-smm) Use new buffer-based WMI API
>    platform/wmi: Make wmi_bus_class const
>    platform/wmi: Make sysfs attributes const
>    modpost: Handle malformed WMI GUID strings
> 
>   .../wmi/driver-development-guide.rst          |   2 +-
>   drivers/hwmon/dell-smm-hwmon.c                |  47 ++---
>   drivers/platform/wmi/core.c                   |  34 +--
>   drivers/platform/x86/dell/dell-smbios-wmi.c   |  46 +++--
>   drivers/platform/x86/dell/dell-wmi-base.c     |  68 +++---
>   drivers/platform/x86/dell/dell-wmi-ddv.c      | 194 ++++++++++--------
>   .../platform/x86/dell/dell-wmi-descriptor.c   |  94 ++++-----
>   drivers/platform/x86/dell/dell-wmi-privacy.c  |  78 ++++---
>   scripts/mod/file2alias.c                      |  28 ++-
>   9 files changed, 315 insertions(+), 276 deletions(-)
> 

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
