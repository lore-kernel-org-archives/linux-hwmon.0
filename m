Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3C38F249;
	Mon,  9 Mar 2026 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072459; cv=fail; b=BrCYE+JAqbvILtLNOzdcD7Fkg+1a3RwKqUIFnbS1eELFMiiXwyGSPDORny3sVcBEm1MiT9CdamrwxpODrZyQ8NjhyLeJURytbdKvX+Jzzqjcy2Kwagajtqy6gkLkjiQVzuj3Rji34yExq15atXdw3aZh7J6VVB+89cZXdgewAac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072459; c=relaxed/simple;
	bh=VzC4inSSEyWCEvsXF6aqGv2BRvX8s7nAHZ2CtfpkbuY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wk+V0nMR3RniqK3bg4vkl7LT2e6+lUxCtcIgCumkn8r2E156jNS1V7FcnM4IQvSWK0kzQLF0I6NTRYqbwdoLTxONxz9buA29Wb9+EBqIm/cy3YoWv3JNGup2uHGvSXhtoox8kEyCXh/iKgYjIdsXimy22JP5l2wnJm063zxP3rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O+np/qQQ; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O+np/qQQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrOahbHmENmpbr9m2qeSwteP/uzdSR15kq6Jym8DpjQT0jQgzKjBvYz1P8BYyISwUoz78QSb8BngES9LcBXjH8p9jsMgLwh3U4iIuwL/77ZYCfHMRVV6QJJ203vGDHzjEf12qK+Ky9JZ8rxqRVYZmjrHNfMad/rZzALLnJBE+ks7fWEjBqS6DKr5eYnNF3zA7wo8YAFzpm7bq4vRTVNZ+mGVJYeoAnFftdhHRBbo8CmZ5GODERbGHwGrAbgLatdN4K6vgyNSc8spQdvnwZJpnmQOGBaj3joXRSmJcXF03Fie/kDLKU5uSt449wmcUaGmPDIG5SpHYd8sZ2dRCF+gbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va+1bqlcGnFbfLz6FtCh5lfGxjWS3LNqkzYELMMtP5I=;
 b=IWsy7GBXZjj0iB7PkqYIGpwybc4XSUEHpQTPxQQW4czjTLMI5tmnlfoRq3m4BF0svIvFA6McC1cLv06p2FaGKilyyScXoxGXxG7zuUzM0ovFl4495ovM5OMPP8znf+YamW88h1zZkFMulxO4yFz0tMaEENj/3af70stBIE0ilwAGfNjQX9S92hDrGKyLyIOsVuKjqstwAh8R7X87UJu19NWIComkrxUDNPW9gil/3X+V+BcuEZpb+gTYFDmgwTAHSJ0rdUjwkd0rFEyy/tIXN5Lu0TguqRxv22d9NB50DU9wfFt3RkMUWJgBMvmqy4Fvn7NMnnIIHbnb/ZvJ1WoUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va+1bqlcGnFbfLz6FtCh5lfGxjWS3LNqkzYELMMtP5I=;
 b=O+np/qQQ1aeEe2E8jbRhJQkiqk5rGkO8VApccP0olIVRC1R2MI5NNnF/i2bHaJyb1+ZEMlPeBUqQ4Bi3sOinM9lsyUKwYnv4K6a3F2zuJXRJYdQoETQTCInmvIOzAXNE0C055JBIvPxgVv/jnd3398l0nY+yajydVlLf1VhIFxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 16:07:34 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 16:07:34 +0000
Message-ID: <7f61364f-c860-49b6-91c3-9aeca6744eac@amd.com>
Date: Mon, 9 Mar 2026 11:07:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] modpost: Handle malformed WMI GUID strings
To: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-10-W_Armin@gmx.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260308002522.4185-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:610:54::13) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: df4692f1-0b67-49d4-af07-08de7df5f99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	B/8aj6E3n9BlE9Y4FJ2XU0ySMSdYETc2U+DlmL7wJlddd7k7Z54mzQ95lkh7sO3aVfaWYkdp4D4t2NsNeCmDJ27AlhNY0r5o7F1y+tgDn/g9dDC7OcHUm2fUrOsa/TMI07qEXyR5LJ8l7tRLEm6T0uICuhE/ZcZCgxAbmP2dBR0IQC478tO5kRFJY8rkiWnsxHlOdymJy/dpJT9DuAMZ13SM1Z+o+I0eO4AMVsvHGZkfPIEFcB+QmZ26gx3Z3AKU05To9/D2JLJRS9+H+OJckAXmUdLAPm8npXkRFSDSKvf9FFkTboHbwAKcdZimk0M4gjNL4vtnyeOfix0QZsawgYjKX6iHvvJnSn1jHZvkB9lkzSyoFuDAOoPgnXHF8ZFH3JmEbM5x5jiSe8U1g1ItrQCIwIzpGTx3K9tzyozhNJ3SHTdmntPagbvSBdvIIu9SAWt15Y1pTDlPPOcUIiwBPFmVXUqQbzuII5uV6XMyNYGX0ZuNiFENQ3z+EoAiL8KDLwqAcJgYZD544qqaCpDvrD6Woz4JKm1Tg9LRIOPowbSdJwRNyuDPRBqpK7JD8cpaz/648esloKgQ0HrgyuwsAbGHLoN/oteYlnFz2VLLUxuortNuDjAttNLQlJHIPNIqQrjcq+vXapTzctOsS+n4RLPLijBOga40F+1WT58TeDqSssO0Cq/vNbX2E1yEtvpPlLXL/2DtjyOtUW3EwkqTb+rU5kiFlqHuyqX6Il8TS4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGxNTHZEbFgveU42L2ZLUFVFU3FXVmpvL1VkQUVaMWRiTGp3Y2swTldrMEtm?=
 =?utf-8?B?QUIzbm5SYy84Umt1ZElxUlo4cjhkMVB2dmdEcDNQbWFod0hyaCt1WEhaQ1hH?=
 =?utf-8?B?eDVCM3B6VVpOWTdLd3ZMMjUvMzRxbDVSMmxPd0VCaDdRWTNsMFFBZXhFWmdS?=
 =?utf-8?B?RUxEVkYyN0VMZFRKY1UvdE41N0pRK2NuZnpXbTU5TW1maEN6cG5QRUd5YUxI?=
 =?utf-8?B?WC9RZ3NDaVh2Rnp4VGwzNTR2RHNUaE8rV0RsYnBmRlpMeW1DeWRCZmhlekN0?=
 =?utf-8?B?MlRETC9Pb1JnRXF6S1pJUXVMOGdqUWE4KzlzdU1TQjRmcjhJa21FdlAybmpy?=
 =?utf-8?B?Y0lsVmM4a3A0TEl1THY5SDNXd251ZVNidHRHR3Q4SHRWZ3JBMVVGREcycDJz?=
 =?utf-8?B?TklSS1BHYnNJOXJQMStvWjFDcFpoOUtmSTF4VmtTZnhVWDdScndDNHZqT1dw?=
 =?utf-8?B?MllTK0tRU3Nmcnp0Sms0SndQbWt6ZStMTDZESWV6LzFSajJlZ1JIeG8wZVlm?=
 =?utf-8?B?Z3orSHFNQTR6L2F6NzUrdzlVZlBvRmFjWSttTE1Mcm9zQnVPSCtqNVF6QklM?=
 =?utf-8?B?bnU1bjd4S2FVUXVYNnlDMG9vWHg3cnpubFQ1NittQlZ1ZjBMZEFQSzRKQWY1?=
 =?utf-8?B?dFNHKzVqNm9VMmZab3BwTnptdlFreHRQSHFTOFlTVVpxVTM1RUJhQ1dCYWRk?=
 =?utf-8?B?NkVGZ0NuRFljZ2VxeVFqbGtXUnFqVmVHYXE2YUhqVEZvU28rYlRYcmNpTDA1?=
 =?utf-8?B?Q2RLOHpNTHdKUGJTV3ZZQ3BTYlhLTFRrdXVKQjJpRE5keG1mY2RmUWlnblND?=
 =?utf-8?B?cDFzTHdCZ1ZveU5tekVOWXR0aVhVbEJyMEtSMmNlZjJ4azJuYmtJRkhORU1l?=
 =?utf-8?B?dGJFREVUbkxqazNFY2dYbVVZa0toTXh0SVZkL2Nzc1czWm1XNFBXdVVOeEYx?=
 =?utf-8?B?ZzJVMzNobTRKQXRHUXJXa0JZRGZtdkdpSUprNVpCY2FPRmdZZ083d1Y0ZDNt?=
 =?utf-8?B?SldJbllYVTRTcDBhc3pWQVRSeWtXVmZoRFdYemlseVhUR1Azb2xnc1c3RU16?=
 =?utf-8?B?ay90L29Ob2dFY3BDNG5CbE9ReXI0N2Nmam1pSWMvVlArR3RxMFNnY2hTSXg1?=
 =?utf-8?B?K2M4WHc4dlJFaXd3K09sZW9keHJHVkNncVg4TTBBWFNhSmFxMktuSGN3Mm53?=
 =?utf-8?B?YVMrOXpxTkx0MjhwNUwrdXNvTW1mY1Y1UCttcmZxNWdmNjlnbEJ3MWhKSDI3?=
 =?utf-8?B?QzRCSHpPcmMrY0FMSDh1dHZZNnRVdDQ5M3d5MWJrWVhCdmFUV1lpREtSTWc5?=
 =?utf-8?B?QjNoNEJNUlowcGRSaG5XdHY1NSsvS2VMYS9XTDVodDUxSmhuRXYxQ0xqbXdZ?=
 =?utf-8?B?Y2l5MGp6RkNyQ1hCTGxuUGcraGJydzhiMitSZHltR0xiVFlQTzU3TURmdFlH?=
 =?utf-8?B?dVBzZ2pmMFNLOGVSdlFLb2t0VVZiUDdUdEVncWFmQ2g3dm5qclFDZ1QxVVha?=
 =?utf-8?B?YnhFMHhqUVBDSXhRYXh5aEZzTVBuUE5sallwUnR5czduNExuVHRia2tPd24w?=
 =?utf-8?B?Z21Vd1J5U1pPWkdRaFh3dWMvVHFEclI2TkFMNlZ5bkVMeGl3S3JWOUk0RStS?=
 =?utf-8?B?T1RVcjJaZ0Rkc2t2RDF2aWZjUHhINkZ3bmVHcHNGd25ma2dVYjJNSS85RFFj?=
 =?utf-8?B?Y2hSWWxRQzkybFVTZmRnalZxRElLYlhCZlpxaVdLMGFPQnU2QzNZblBubVZH?=
 =?utf-8?B?RjJtQXpha0pyejZEMlZQTGxSaGUzUFNXay9jWDZVOUYycGUyV2lIKzR5V0kz?=
 =?utf-8?B?cXBjZXhtUGRLcy96a0VjWU9NOTdqVmxNbWgyVGs2WGRUSmNxZjBKYUNPNEty?=
 =?utf-8?B?aVhTWTJrZkM3QWoyV0xDN29xVkJXZVVQZ1ZJSndsUldwUkVjNE1XZ2c2NkRl?=
 =?utf-8?B?YzFxSWhvRVFOTlJzbzJ5bGJ4MDlnVDlNUXJQVDZpbTNSVlMyRXNMYnN4dFRv?=
 =?utf-8?B?Z3ZPalBGNWo3dlk4NkR6VFhhc29aN3d6R3d2WU83TjRZa0Q3UHc2MnpSYWR2?=
 =?utf-8?B?ZlIraG40d0dOUkM5QkM0MzZCMjl6MmJ5bWNiVW9RYlA4bXJ5RnBlaC9XTEJR?=
 =?utf-8?B?bkpkVmpVTmpxVG1LUFVLYnhlQVU4SCtBMWxmWFI3T1lrbzhvZXV5TVU2Wk53?=
 =?utf-8?B?K0J1WFBLN3crdG45ZTRLOFZiZUh1bG1yTjZYcVdiblVWU0hRaCtHdGxtVTZP?=
 =?utf-8?B?WURhcXZOYW1rWGowaHk2MVp3TkpHWVlKbjJUdzVSYVk2R0NXRGdNU05NeTdo?=
 =?utf-8?B?L2ppVjVnbjFtQ3E4a1dNTDNTbTZ6MGxtU0l0NHMwWnNNK2hWOHlmdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4692f1-0b67-49d4-af07-08de7df5f99a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:07:34.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tt8ZEQlB0Wj+ZFzhAv1KWIAn93ySo8BwiECy0SWmKEnoR810911fVWsSQ7yW7QYSa2/Y/tvZVdVWtxlNHxAQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139



On 3/7/2026 6:25 PM, Armin Wolf wrote:
> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
> 
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../wmi/driver-development-guide.rst          |  2 +-
>   scripts/mod/file2alias.c                      | 28 ++++++++++++++++++-
>   2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentation/wmi/driver-development-guide.rst
> index fbc2d9b12fe9..74bb156ad9cc 100644
> --- a/Documentation/wmi/driver-development-guide.rst
> +++ b/Documentation/wmi/driver-development-guide.rst
> @@ -54,7 +54,7 @@ to matching WMI devices using a struct wmi_device_id table:
>   ::
>   
>     static const struct wmi_device_id foo_id_table[] = {
> -         /* Only use uppercase letters! */
> +         /* Using only uppercase letters is recommended */
>            { "936DA01F-9ABD-4D9D-80C7-02AF85C822A8", NULL },
>            { }
>     };
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 4e99393a35f1..20e542a888c4 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1253,6 +1253,8 @@ static void do_tee_entry(struct module *mod, void *symval)
>   static void do_wmi_entry(struct module *mod, void *symval)
>   {
>   	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
> +	char result[sizeof(*guid_string)];
> +	int i;
>   
>   	if (strlen(*guid_string) != UUID_STRING_LEN) {
>   		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
> @@ -1260,7 +1262,31 @@ static void do_wmi_entry(struct module *mod, void *symval)
>   		return;
>   	}
>   
> -	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", *guid_string);
> +	for (i = 0; i < UUID_STRING_LEN; i++) {
> +		char value = (*guid_string)[i];
> +		bool valid = false;
> +
> +		if (i == 8 || i == 13 || i == 18 || i == 23) {
> +			if (value == '-')
> +				valid = true;
> +		} else {
> +			if (isxdigit(value))
> +				valid = true;
> +		}
> +
> +		if (!valid) {
> +			warn("Invalid character %c inside WMI GUID string '%s' in '%s'\n",
> +			     value, *guid_string, mod->name);
> +			return;
> +		}
> +
> +		/* Some GUIDs from BMOF definitions contain lowercase characters */
> +		result[i] = toupper(value);
> +	}

Minor logic change that could drop the boolean variable in the for loop:

for (i = 0; i < UUID_STRING_LEN; i++) {
	char value = (*guid_string)[i];

	if (isxdigit(value)) {
		result[i] = toupper(value);
		continue;
	}

	if (value == '-' && (i == 8 || i == 13 || i == 18 || i == 23)) {
		result[i] = value;
		continue;
	}

	warn("Invalid character %c inside WMI GUID string '%s' in '%s'\n",
	     value, *guid_string, mod->name);
	return;
}

> +
> +	result[i] = '\0';
> +
> +	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", result);
>   }
>   
>   /* Looks like: mhi:S */

