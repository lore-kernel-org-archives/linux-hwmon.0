Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC53D9045;
	Mon,  9 Mar 2026 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070888; cv=fail; b=NhL0bIbuSPBRk0vnGsgCRkFKnVyWZr8Ecdll+OxihZcZ7MlhA+8jmNQ/TuqzjMuS4ozGezCj78lxe5IBXxY2lm/vy6WiIvObpYbvrF8u9ik8RBYLJCtqf7uHY5zOo9RFGwLWyVceC8SBrHFMhH29nUF/KY7IaXAW/zbbBdLDwtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070888; c=relaxed/simple;
	bh=na5MVNFfiNciV9r3sJJdgC80pfXAoV328RsuhJ1fpBs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p8ysTwPQO5y6Qpikd5gHZkuxisgOB6UAXXT1TgN/kwF3iLahAdfjzMjQw2FJP8AcmK7BaNa9jUE7IcXv+8Dxcjgv0a+PvyY+XG+votDXjoUXIIS+kvPAr4oaG/1KQcdX4Z4knOwPgrLu1D0NDCybBh4otSvySeUWUOHrfkc4muc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QCtAWiKz; arc=fail smtp.client-ip=52.101.57.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QCtAWiKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAv7MedS8k86ZkkFREf7aeneoI2Ys+Zj6tRSaxn6nCoLgZGVBZ8NOUlHhl5DqEcAxyHAlGnSvPyrqAqhN3Nq8OKi3irnuBqza9rI87gGZ/DJAo/7iCfCh4LZVqdkjwvihhCHl4wy8scnCjKmskntYRMmpY+wt5Kw9XIHJ52CZxwKI9WErqEgPQsxN8XH68caWhpo7sUjDKcnos/yoKfixm36c7Px3UXORA/V+0hR7QdLdDERbs+E+x59W4ph5DB6+IshJnENnSlSrCfMqLSbBgyHap/m0Pv3av8estBLCvUJnI4+HZDL9T+IaJ3E2qBgJejzDnjZ+x+RP/M7SkHzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv34+U3uIcVEA9ZGaRk2DvvyrXI88OYfo+2KzJpnaNs=;
 b=pHO8wpCNrLGWbdZZmTnq4yqaSGpjvqEn/ElqxVvkKAkotuXw9/dO2hl0zH0GEMH3kASfTpgN38t39AzudSaPeQmZJjzoteJTzbc0nLQvm5EXr8vLyzn4H5BSXi440nyu7DyiMwmPcE8krgKI4tGKoBZtHZlykxrJlWzVS+x3Oz8mQX62M1KnIXV2nNnFuOPgEO5RIICucMkE9uRQSfrzInmfayOYDmbP82ueC/t5xKhIEh7KCkXl3abd1ccrEeygiGf9tdGOdIUVL9y6NBBdbTFaJTksnKsxQooAgchl0Vm+maN2Ok3L6WPtDmiuI2lzDAEPq8LEc3U6UYFhHA8DjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv34+U3uIcVEA9ZGaRk2DvvyrXI88OYfo+2KzJpnaNs=;
 b=QCtAWiKzLc2USXUxHvx2ZC52xss8rKoERWg452k8P2+Gb+YluSE0c0W17QOBmDHCc19VcbR5YbSpLTAAp1jqSSDvCnhlV/jeUA7eHB49qpDXyz8/S62A0yK9NIj/i/a7ZISlPTn3Av6TAct5JNsIcxltXr5iG+/7FeQq8bwNQ+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SA3PR12MB7973.namprd12.prod.outlook.com (2603:10b6:806:305::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:41:23 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 15:41:23 +0000
Message-ID: <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
Date: Mon, 9 Mar 2026 10:41:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
To: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-2-W_Armin@gmx.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260308002522.4185-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:610:b2::35) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SA3PR12MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: a516af3d-b561-4f0e-607c-08de7df25151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	38YCcDxIzPoq5N+UDzEzT0Z9ZqW5zoHUpc0vna+1EUpUlhyGwOp5bilnVobJN9wpfPOTn9HTbamtn82cmTRWzIekmpT6zzGb2SLpKya7z395b1npD4jNXj7FwpbDdJXy/HCPwctnK7UlC9RpvDQHig7rNEcLLKZNkqA+sqdIh3vJdLO8RpOXaCQSMQGVrqiirmHl8hthFR8BvCM+mCEvrBlNRgT2i5gLnmwWwqTWLTVNYwfOltnwzP6NeVm3mMPcfP906jSQQDXWsHBlEE5Dp4VKIp4rqVfw88a557Est7lTN3YJSkSnVtI4p/wlx2lwtqT9MmT4pMl73h+B+527EoDcMM0iVsboaHan2G+wGXFoqwLTT1mBSO2J28328SwmBjyf1BqPGhs+tZYBaNqzql9NOWjZ7md4+ILq8xXNPFkPkaF0GazS2nsOi/qRQU+3xicU3rF5r+lv7SNjZ5dW7AglN5YwcnPEzrDj+8bt6jlQM6mFOFW77koOzcJv9zwwko1g2Eu/73O+YNv6FdAeXnWaz9Zhd2MEYPAgHMiwJPuwAvTH+IBqMgKa1gKhflXOfmIjSM6QoWnhJoZtovGswpRpqmrtpkycBCf2YYux0FOFMwOEOpFzGPASV18AHl2PbjqyxpIVvA1BpkZzLco42y1RZQLKcPLbcpHtYsV2+AKx9SEHQHGRSUgwjYoE8GXxMTc7QXGWuTfAY9h3AfmTIjNIqLmo9KnIpyG6N+VRz18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEV1MElpbUpPa29RcnVpaGZIY1Vxa3R3V0FFUlh3NU5IRUhzMXArZlZBTWlK?=
 =?utf-8?B?dTJ0ZE1HOTZCb21GQU1GcHJpZWw2UXlmRzBQd0FtSFhQNkM5UUk0QTZ6MG05?=
 =?utf-8?B?RW0ySWhnWGVGckQ1OUtXNHhuaEtmN2dCSWFHKzVNQ0ZMemZTbXBmQzRraFk5?=
 =?utf-8?B?OFFQQVRzOXhpNVVFVmVqeC9CR3NoL3h2OVBFclNlWG5PcjROSy96cVBsNVA3?=
 =?utf-8?B?bnJQQzJSWjVLSi8zVDFlak5aMVVuUjYwN0xaSy8zaGFpRUxzemxlU0FvdjBD?=
 =?utf-8?B?TWpiTlZEdC9nRGVBb3NBUTdSbE1HcHhVdVN4Nm4wSWd3bjhsT25LWGZoU0Q0?=
 =?utf-8?B?VE9xbjV3dHBEREV0Yi80dnd1cFNKd2NKWkUyVjBYWUNkaHhjQjhlQUVDSEs0?=
 =?utf-8?B?RGhtQ2Rnc1lMUHNNck91a1VqeUtoRGNaODhrczIwbHpQTEZIVTBHSnNPelB0?=
 =?utf-8?B?bkF0QkRFOVQ4OHVHQVczU0I0cnRkRVhEbWdIVlhoeUl3K0hqQ3VlcVJsa0Yv?=
 =?utf-8?B?TGFmV3dMVElia3NxaW44Yy9sSGFZenBYNi9FZlgxbHdqN0ZGb0RKdXhMOVZx?=
 =?utf-8?B?TjF2ZG5ybjFIODFsdHdKVDRtTFM4UHZ3WnRnVWRnMHVHNXMvSFRkTGtHcHhT?=
 =?utf-8?B?Uy9HUzlOVnZ5bkpOOVcvUEViY0U1KzJ5TDRoNU5yYmVZYUZwYzMvU3NkYXJL?=
 =?utf-8?B?U2p4bFc3RnA1MFkxMWVaaExHUmNheEg5NzdVRW5nNDE2WlhHbEdncENTWU9s?=
 =?utf-8?B?T2pvcUh2bTk3TVg0TWlRbHNBcW9BbU9PMEVXajBkdmhYTEIxM08vTXdlVnZs?=
 =?utf-8?B?bFlBUy81Mng3cVZETUhOaHZNUkRyVm9uK3FhcFBIdG1TS3lxengrU3RUZVFH?=
 =?utf-8?B?RS9RVWRxd01mbmI1SldDYkJUTGFLaTczTlN6djlpYmxLd29YOHlnOGlQQkxG?=
 =?utf-8?B?dEpNMi96OXI3cC9OdHJJYmRPQUp4MjZ5MWlFajRHZmd3MmdUMHlKVXpGT0pm?=
 =?utf-8?B?Zmcvb0ZrbWhoVmdjcWZFb0FmYWtJRFNkQTF3eXZoTVdDaXVSOERGTFZrUzVw?=
 =?utf-8?B?R0hTM0VQUndlL0pVa01YejNvbUlyWmZvaVdJdUJ6U0ZxenBSZTFKU2swSHNp?=
 =?utf-8?B?RmYzbkZyQTRuWDJuWXJFWTgzcXJCdlhVUmd2MWc4SkJPLzNvbmdPVEpUR29J?=
 =?utf-8?B?R3BjNm12N2RpRnZnRSt4cm1zMldQbmNOMk9VMEJyL3ZZcitLUG50QnkzZTdq?=
 =?utf-8?B?Q0Y4Rzc5YzZjN3hWSWtCTEVvbXIzYm51VGVwdUlkaE1GeElLVzNUY0NzeUJM?=
 =?utf-8?B?SEFSMDBVeFhTaHNPdHBpd2VQTGVzVENMNnlsdDJ1RlVFeWlMcmR4UC9TQWFl?=
 =?utf-8?B?czFoTlRRUUFzQ1VyTUtkNWZRTWR2ZjJCcnRIQ0YrVFFiRHRkTDRnK20vSGJF?=
 =?utf-8?B?Zm5qWnFrQWNkc09rNDJ3RzVpVlE0c21iZXVVWVhBZ00wOERNZ1R6UkFSRXhP?=
 =?utf-8?B?QVIxQjZWQndsdHdhL1B2NWdXN0FVUVJObm5sZVEvK2h5R1l5K0FtM3IxM2lz?=
 =?utf-8?B?ZllkWWFWYmJoc0NhRkowMEtFTFNqY2lmZkZQWkpRUVRkd2lBaThlQ0tNSnB4?=
 =?utf-8?B?Y0dwREpYVTJjQVd0UU5qV01NVlhRZWhTelMrNWJsUndYcHRlbnE0dHVaK1NQ?=
 =?utf-8?B?TmxIeDZ1cEZjdUlmNEE3djJDbnc0WTJXTFlyMUppSTlrZVNKM0JQeUgwSTA2?=
 =?utf-8?B?a2JPVERNeVpmNmZDVllZQnlnOVl0UWRoaUg5aSt1a2JGUjVmZjF0eFE2T3J6?=
 =?utf-8?B?WEgrMXRUMXVORkpoWnBZbWZUK1ZZYWlqOWRuTUNvVGxMaHdOOWpJK0pUS2hU?=
 =?utf-8?B?ZUpNR1VtUnNaUmJ6U0ZCZVlTQlA3Mm43UW9tM05NaVcyR2pEU1ZYL3pWSWZU?=
 =?utf-8?B?Vm8wS0J3eWhiU2kxbVpzSysrbllxaWV6aGVNMU13d01sb093L3R0NzdJbGdW?=
 =?utf-8?B?bU5mWE8wb0NsUnlGMlpOQnA0M2JnZm5lcHpvSFZJSjhDZmlDcVRLMGVnaElU?=
 =?utf-8?B?ZnlGcmZsdGpnSHd1cXA0cXNVZlUxRExXRTl0RUw0aFEzNm05cURQWVUvQXJO?=
 =?utf-8?B?Ym02THQvV3M1a1lPaHJHOFZEcDhEK1V6MXBIK3QxbTd3UERYY1o0TWRBOEtB?=
 =?utf-8?B?dG43dU9hZFJQSHpTZWpmREh4Wis2QTBZbmZaUWV1UDNrK1g2bjhVdytSNnlR?=
 =?utf-8?B?d2JkcG1tWTZGNjEwcXNzVTBRb3RrR28zem5CSFVsK3B2ZU5nY1E1ZFZEVmtQ?=
 =?utf-8?B?elNrNGx3QmZWZGdDVCswanJEbkZkUk13MEJod3crQ3hTZ0xZMnFzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a516af3d-b561-4f0e-607c-08de7df25151
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:41:23.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEbxN8QZz5PRF1R859+l21pCEs4PgQu+h79xSaZhBj8XwiZCCutO/tJ6Cw3TdC5sjadbBc7kYvJktsEKbon3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7973



On 3/7/2026 6:25 PM, Armin Wolf wrote:
> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the descriptor.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../platform/x86/dell/dell-wmi-descriptor.c   | 96 ++++++++++---------
>   1 file changed, 49 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> index c2a180202719..621502368895 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> @@ -7,7 +7,7 @@
>   
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
> -#include <linux/acpi.h>
> +#include <linux/compiler_attributes.h>
>   #include <linux/list.h>
>   #include <linux/module.h>
>   #include <linux/wmi.h>
> @@ -15,6 +15,24 @@
>   
>   #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>   
> +/*
> + * Descriptor buffer is 128 byte long and contains:
> + *
> + *       Name             Offset  Length  Value
> + * Vendor Signature          0       4    "DELL"
> + * Object Signature          4       4    " WMI"
> + * WMI Interface Version     8       4    <version>
> + * WMI buffer length        12       4    <length>
> + * WMI hotfix number        16       4    <hotfix>
> + */
> +struct descriptor {
> +	__le32 vendor_signature;
> +	__le32 object_signature;
> +	__le32 interface_version;
> +	__le32 buffer_length;
> +	__le32 hotfix_number;
> +} __packed;
> +
>   struct descriptor_priv {
>   	struct list_head list;
>   	u32 interface_version;
> @@ -88,76 +106,60 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
>   }
>   EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
>   
> -/*
> - * Descriptor buffer is 128 byte long and contains:
> - *
> - *       Name             Offset  Length  Value
> - * Vendor Signature          0       4    "DELL"
> - * Object Signature          4       4    " WMI"
> - * WMI Interface Version     8       4    <version>
> - * WMI buffer length        12       4    <length>
> - * WMI hotfix number        16       4    <hotfix>
> - */
> -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
> -				     const void *context)
> +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const void *context)
>   {
> -	union acpi_object *obj = NULL;
>   	struct descriptor_priv *priv;
> -	u32 *buffer;
> +	struct wmi_buffer buffer;
> +	struct descriptor *desc;
>   	int ret;
>   
> -	obj = wmidev_block_query(wdev, 0);
> -	if (!obj) {
> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
> -		ret = -EIO;
> -		goto out;
> -	}
> +	ret = wmidev_query_block(wdev, 0, &buffer);
> +	if (ret < 0)
> +		return ret;
>   
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
> +	if (buffer.length < sizeof(*desc)) {
> +		dev_err(&wdev->dev,
> +			"Dell descriptor buffer contains not enough data (%zu)\n",
> +			buffer.length);
>   		ret = -EINVAL;
>   		descriptor_valid = ret;
>   		goto out;
>   	}
>   
> -	/* Although it's not technically a failure, this would lead to
> -	 * unexpected behavior
> -	 */
> -	if (obj->buffer.length != 128) {
> -		dev_err(&wdev->dev,
> -			"Dell descriptor buffer has unexpected length (%d)\n",
> -			obj->buffer.length);
> -		ret = -EINVAL;
> +	desc = buffer.data;
> +
> +	/* "DELL" */
> +	if (le32_to_cpu(desc->vendor_signature) != 0x4C4C4544) {

Do you think you could come up with a helper for matching an expected 
"string" like this?  I /suspect/ it's going to be a common pattern that 
vendors use and it will increase code readability going forward if a 
helper is possible.  I see it at least twice in this patch alone.

Something like this prototype:

bool wmi_valid_signature(u32 field, const char* expected_str);


> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signature (%u)\n",
> +			le32_to_cpu(desc->vendor_signature));
> +		ret = -ENOMSG;
>   		descriptor_valid = ret;
>   		goto out;
>   	}
>   
> -	buffer = (u32 *)obj->buffer.pointer;
> -
> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> -			buffer);
> -		ret = -EINVAL;
> +	/* " WMI" */
> +	if (le32_to_cpu(desc->object_signature) != 0x494D5720) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signature (%u)\n",
> +			le32_to_cpu(desc->object_signature));
> +		ret = -ENOMSG;
>   		descriptor_valid = ret;
>   		goto out;
>   	}
>   	descriptor_valid = 0;
>   
> -	if (buffer[2] != 0 && buffer[2] != 1)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
> -			(unsigned long) buffer[2]);
> -
> -	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
> -	GFP_KERNEL);
> +	if (le32_to_cpu(desc->interface_version) > 2)
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
> +			 le32_to_cpu(desc->interface_version));
>   
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv) {
>   		ret = -ENOMEM;
>   		goto out;
>   	}
>   
> -	priv->interface_version = buffer[2];
> -	priv->size = buffer[3];
> -	priv->hotfix = buffer[4];
> +	priv->interface_version = le32_to_cpu(desc->interface_version);
> +	priv->size = le32_to_cpu(desc->buffer_length);
> +	priv->hotfix = le32_to_cpu(desc->hotfix_number);
>   	ret = 0;
>   	dev_set_drvdata(&wdev->dev, priv);
>   	mutex_lock(&list_mutex);
> @@ -170,7 +172,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>   		(unsigned long) priv->hotfix);
>   
>   out:
> -	kfree(obj);
> +	kfree(buffer.data);
>   	return ret;
>   }
>   

