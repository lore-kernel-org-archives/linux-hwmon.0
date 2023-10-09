Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE040E95A91
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Oct 2023 13:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377212AbjJINgt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Oct 2023 09:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377203AbjJINgr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Oct 2023 09:36:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F7999
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Oct 2023 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696858604; x=1728394604;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=riNa0oWZAJ8lXO0y8HHfiz18Xp77/ILMdYQ654gwS1o=;
  b=d034f65xky9LFLVig6Nsbdxiuq1pG1isdPv6eJu7cyBe8iRQXbwkhg+6
   gnNydM8CPcJiu0TD92BWEiCcmdYSafRQZt4CTm9de+edwVr/sNA0oUwCc
   m2MA0V96Oo3J2JUj5973L+BwYCBHgj+lXeUks4pAGHtkA87tE+9AaqVHv
   pZUNxsNS/IT4vz2G4drT5XIPqHwGb2CdOoKG425eZPOL+1hdjHHNj1Bgo
   xTMSbm8S7K69GWv4DlZtGPrWTaBOzgEYF+3C8bnsHKJLjxQHm0eC25vcD
   1NWIMoOTjs1Niwyk9mQdqtTJ31IQWoaLlNP8LuGS7PAY6t/hac7R+RppJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415133225"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="415133225"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 06:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823348349"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="823348349"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 06:36:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 06:36:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 06:36:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 06:36:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhbbJV2WLeifsK/du9rL6Q8UxE7f3vgB9dsVAkxtYcnWSnzke2A3AR0sO0Aa+21HZNW4uuzxoC0WzNfQcCUej1QCzY37S8zjYaw9ZH5x910Hkt7zyGVEvKVL9ayHZSTx5VxT4IGIrTpjO2eEXSKiOFz7hjTq3WDzGYpcRFzVe9KIBv+Oec5VeWk2uvqR8E2BCZ2NCieQoU9VpqxJ8M8Zt341b80yYdovkR27wCdTSZ/8XkichJV1JnUa8Zs99/MOLk5Lwdf0yLEreBZFzTWvYQfCFdB1QrOpo2yAfCG3OLvZLSiU50BD1YYdhxLPZClajSJkELogAHDgoIc3ZJabjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIXHj55vpPo9/NpWiNlck2IXl/QCEPoVElS1tfPfDqk=;
 b=le6zS/VV+tUP06gNfdWUO+6H5oOCH2WGjVpI9hzjoxeVxU/XgQm+7o+gBy43Zg0WHn4BYMGne/Qhwy6IpqeOHvYm/h4By6pS4QxEGGL+i0Nr588ztdCUYknDlvohysAB7Q3siYopmqEb1iqTqGXQw7K+Dd1cqrx/mdhI4R5QL5wmqcZUQNzuhYbV8nW3J4iQSxyvFNm0E+1txqaB90dwgpF7KAqKrMgakrmuFqIQejse4byWeLoYFvDAEcG7a80oEUSfoP3MAIlazu49hUWK7MI6eDKxSsBlqCv0/ZKXEe1L09z3/8VTGcqJ0W1mM8VZ2nASsZcWjK5frw6C8WkQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 13:36:22 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 13:36:22 +0000
Message-ID: <dd836c61-4576-44d6-82bd-0c743e987b58@intel.com>
Date:   Mon, 9 Oct 2023 19:06:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Protect hwmon rw attributes with
 hwmon_lock
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <ashutosh.dixit@intel.com>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
 <20231006170205.4136927-2-badal.nilawar@intel.com>
Content-Language: en-US
From:   "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20231006170205.4136927-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SJ0PR11MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a63810a-aaf7-4ee6-626d-08dbc8ccb99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rvHRhY1bW0zR7+s4Z10EALbZCyEHoOE0NTlWXn4tNA8quzK2Jl8fZlTzB6wnZKj1q++LxDDB6l6kEwMZtp6Rn0yf63PBrEpuAAMYaVheNDLU+xlAVJDrpwSFiii16cKxE0fIYsdhLXC28qMv2991HZKzxj1iThfvndxOQWCkMj79jPYqYhM0PL3OMsOmOwJtAXVEjvVHCP78BqKM0co1A24dWiTDxxBvNY75RzqhjMr3+5iYfUyTIPbHtr7wErTHtyweeHmVblb/Gt6qYajQg+sXEFjvTRyNKbLiyNaf0p9ALZ+MdvZng670OZn/5xP6qKk+xtAC+Szk2NJ8B6sHKz6JztF0WB4AxGHEaQJ9ffhPCV75cqvobn6VMApuzsljqWWAkT75AAql4s4WVggYZc6dtzQ0DG+FTan8IPxp14fvPa1eXcXl9sSw+IDkwnRxPv315cUytkz4Z3c+zyumHJdDPdPwVlzgU8g/E6DHKojUspXtN8Nh7GNsfOKx21SZ3xwb0HVAuWVCVKo6M16x3h+bBNL0MVh3sk31biVyF8vAaweT9xi1ig3nh85Gh7sc38DIZ6cKgs5C2PpAg3ImORrhFQYhu+0SKPH25SK1Gf27+08GhxMXd1nLKZo/DJ3hV4sy+rgvnhQ074yw5LNWbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6211.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(36756003)(86362001)(31696002)(31686004)(30864003)(6512007)(53546011)(2906002)(5660300002)(41300700001)(66476007)(66556008)(66946007)(478600001)(316002)(6666004)(6506007)(6486002)(2616005)(26005)(4326008)(8676002)(8936002)(83380400001)(38100700002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1J5cURBKzBWQUkvTzlwTkdCcEVxQlAwTFhDdHViNUJzUS9JZkEvT1h0cC92?=
 =?utf-8?B?UjZLOHhoMGdxb1o0VGlYM0dVbkREM1plZ0hmanBWeTQ5dWpad0J2V2tOdHZn?=
 =?utf-8?B?N244TjBRMFFtY2FNaStVYjFyUk4yUW9mYmZsRFd0TXhWZjBDQlUzM2QzZTBx?=
 =?utf-8?B?eXhjdVFVL0pHdStFMkY1QThLSzN5Mnc0Z3pwSE8xMHpzNW9jeTU0bnlnVEM2?=
 =?utf-8?B?RXZXUm5rZnp1QUtNMTR2K21mSFBGWEVUc1YxdGNZVGJ0blFmb0hWNDBGcmxB?=
 =?utf-8?B?Ulh1WFpveDlrZ0dzenFYMGtDMG5uWUtlMnBZVEsyRE5FaFlEbnVFMmFiZ3hD?=
 =?utf-8?B?L1VZQzhwUVZEbnpUQmsvM1A0YVNoQXRRcCtTSi9tOFROalp6VldzVm00RUpH?=
 =?utf-8?B?WGFTY25udFF5QzlCS285WFdRd2lEV3hNbzFXd0hoNUFVcHp5ZzU5YVVBM1dM?=
 =?utf-8?B?NEczRXNQKzVwTVBqMEJ2WWxHWSs0TTNGaHhwL3VRMzNUWTEwVmVERC9zVmg5?=
 =?utf-8?B?RW5kcGhxOGU4NkpvSm15YzBIMDRpMG5VSll3d2RrbzBOUkFzeU8wOG1lR3FY?=
 =?utf-8?B?bk1ZRTJvU2JWeFYyLy8vS0xGL0hXdW4yWERSWGRmTlFBWWNwOG93L0ZKUkc0?=
 =?utf-8?B?TFdUclliUUxHTjFXS01yV21iY2RhTHR6YzNpenIyRWNCUDdRK1FvTVV3ZjFV?=
 =?utf-8?B?b2xpYmUrelE5V1RQRHRsMVV0aHVpL0R5blliSGJZMHY1TVNJNkJnb2pPUDNy?=
 =?utf-8?B?TFh0bXhSK3FXWGh5aXhjYmpvcVk3UVlTaHp1aHY1dVpwYkd0RktrQ1hEdnR0?=
 =?utf-8?B?UEpZN0ZKdEJQSVZvd1dmVGp3VEdUcjhEMFZMQlZVYVl2TThtMWNHcktpcW9V?=
 =?utf-8?B?NE9yY3RQZWtpL1VmSXI1b2JuQTViNXo1dnNZTkd2bGZYYTZ2Y0diaDZTbm1F?=
 =?utf-8?B?dnRXMURTLytYaE1uSHNiMEtBek9WaGxNNFBFdkFhU2JIMGhiSWFIRzlNaFo5?=
 =?utf-8?B?NDZxc3B1d2taYTcxQW0rUWticG92c05nODlzQlpNV2dVQ0l5azE5NFpHMWo4?=
 =?utf-8?B?YkFPYkVBNjQvRk1PWUNxeGNNSysrbm9FQnR2TndURU5LVkNiT2ZLOEpRdjhq?=
 =?utf-8?B?eVRmakFuL0N3blV4L1N5VnhoZXZZRXBzUTVSZjlFd1BlbU9pUktTdk9GR2FM?=
 =?utf-8?B?ZVd3WnN3UzlLZjdZZEZZZ0k1RVBTWHVpWGp2eFE0b3hEV1FuSXhFT29sUC91?=
 =?utf-8?B?enNiY3hQYnA0L2t0SjlUKzZZU1RJVVJEb2FFdXJ6NVBBcXJlbm5DLzZUaDUz?=
 =?utf-8?B?S2NsRWhTaXFKeHgrbHROTjQra1FqNk1JbkUzZ3Y5d1hLTmI5eTAxT0NGVXhQ?=
 =?utf-8?B?ay85VDh2OTZHVTN2dkxrYjBqeTBQeC92VllYbFJjMnV1YnlSNUR1Z25KMytN?=
 =?utf-8?B?VS8vZ2RCN1JRdHFGVU5KYTA2TDRnVmdnVXJOalphd0UzQVhEN0NuMFloYzFH?=
 =?utf-8?B?em0yUEQxU2tvTVpnN3I2Wm9WWGtzUUp1RGRKai80SFdiSnhBVEdzOGh5bXFr?=
 =?utf-8?B?azNaMi85NkE3MWdCU0Q1MlhpYjlzZEIyaTNoZUJlOUROVGVPQWY5ZjZyT0th?=
 =?utf-8?B?Umd2QkhMSGsvOTlUU2FzMElmTzRpUUptUHRDTWxUNzB4SGEycW9BZ1M2T0ww?=
 =?utf-8?B?eVJzYUcrQ2ZyRlFjenpvYlE5SVJ3TDA0UnpUNHFUYVFDRllPYjRLWEpiK2NL?=
 =?utf-8?B?ZTFaRnhJK09BTFZlWkw4MGpOYit1bjZ4ejk4a1ltNTBZRDlrREZTVkJEVnlY?=
 =?utf-8?B?QnU3ZTcyd3ZXRnowY3J0VE01NFBINjJESkU0K0JUQVBzV2dSYU1iVWJFdFBD?=
 =?utf-8?B?bVBnZFNQQXIvVnVLTmhqK0ViZU1RRFNFbE5MTlIzSy80TFNyUkhyclBRR3da?=
 =?utf-8?B?Rkk2K2c4RkUxQVQ4K3JKbGNpbWJUSTZYOUlNcGxlV3FKMWpIeHhwTExEWGxG?=
 =?utf-8?B?bVNETGFpMkdXbUhObWI3d1FKT3ZSeHdoK2oram0rV2loaHRnWURFUlEzYUFI?=
 =?utf-8?B?K3ZWVlFPK3ZvYzd4YUkwZ1NFOElCenNZRm9oQ3JNbldWdHVUYm9GUlpmL3FB?=
 =?utf-8?B?Vk1pWlhKZnZHRVBqUHRrZEQvN1Vla2tjanZVa2xHVzdseTl2OXdjWTRKVk93?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a63810a-aaf7-4ee6-626d-08dbc8ccb99c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 13:36:21.9485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQrTOdMkQy3kiD4EffmyulIsmr+INnoOROY6QH9uQKlNzMyieFZmtHni/UhrbDILVMdJhMjbSwIGrqv7RljPtgu63PpqI5ZVuw4rsfnVZdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 10/6/2023 10:32 PM, Badal Nilawar wrote:
> Take hwmon_lock while accessing hwmon rw attributes. For readonly
> attributes its not required to take lock as reads are protected
> by sysfs layer and therefore sequential.
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 143 +++++++++++++++++-----------------
>   1 file changed, 71 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 9ac05994a967..391f9a8dd9d7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {
>   struct xe_hwmon {
>   	struct device *hwmon_dev;
>   	struct xe_gt *gt;
> -	struct mutex hwmon_lock; /* rmw operations*/
> +	struct mutex hwmon_lock;	/* For rw attributes */
>   	int scl_shift_power;
>   	int scl_shift_energy;
>   	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
> @@ -95,47 +95,45 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   	return reg.raw;
>   }
>   
> -static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> -				enum xe_hwmon_reg_operation operation, u32 *value,
> -				u32 clr, u32 set)
> +static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> +				 enum xe_hwmon_reg_operation operation, u32 *value,
> +				 u32 clr, u32 set)
>   {
>   	struct xe_reg reg;
>   
>   	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>   
>   	if (!reg.raw)
> -		return -EOPNOTSUPP;
> +		return;
Don't we need to report this as warning?
What is possiblity of code path landing here.
>   
>   	switch (operation) {
>   	case REG_READ:
>   		*value = xe_mmio_read32(hwmon->gt, reg);
> -		return 0;
> +		break;
>   	case REG_WRITE:
>   		xe_mmio_write32(hwmon->gt, reg, *value);
> -		return 0;
> +		break;
>   	case REG_RMW:
>   		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
> -		return 0;
> +		break;
>   	default:
>   		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
>   			 operation);
> -		return -EOPNOTSUPP;
> +		break;
>   	}
>   }
>   
> -static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
> -				       enum xe_hwmon_reg hwmon_reg, u64 *value)
> +static void xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
> +					enum xe_hwmon_reg hwmon_reg, u64 *value)Isn't it possible to pass len of void * value to xe_hwmon_process_reg()
so we can wrap this fucntion in xe_hwmon_process_reg ?

>   {
>   	struct xe_reg reg;
>   
>   	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>   
>   	if (!reg.raw)
> -		return -EOPNOTSUPP;
> +		return;
>   
>   	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
> -
> -	return 0;
>   }
>   
>   #define PL1_DISABLE 0
> @@ -146,16 +144,18 @@ static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>    * clamped values when read.
>    */
> -static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>   {
>   	u32 reg_val;
>   	u64 reg_val64, min, max;
>   
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
>   	/* Check if PL1 limit is disabled */
>   	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>   		*value = PL1_DISABLE;
> -		return 0;
> +		goto unlock;
>   	}
>   
>   	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> @@ -169,14 +169,17 @@ static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>   
>   	if (min && max)
>   		*value = clamp_t(u64, *value, min, max);
> -
> -	return 0;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>   {
> +	int ret = 0;
>   	u32 reg_val;
>   
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>   	if (value == PL1_DISABLE) {
>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> @@ -184,8 +187,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
>   				     PKG_PWR_LIM_1_EN, 0);
>   
> -		if (reg_val & PKG_PWR_LIM_1_EN)
> -			return -EOPNOTSUPP;
> +		if (reg_val & PKG_PWR_LIM_1_EN) {
> +			ret = -EOPNOTSUPP;
> +			goto unlock;
> +		}
>   	}
>   
>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> @@ -194,19 +199,18 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>   			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> -
> -	return 0;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
>   }
>   
> -static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>   {
>   	u32 reg_val;
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> -
> -	return 0;
>   }
>   
>   /*
> @@ -235,10 +239,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>   	struct xe_hwmon_energy_info *ei = &hwmon->ei;
>   	u32 reg_val;
>   
> -	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> -
> -	mutex_lock(&hwmon->hwmon_lock);
> -
>   	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ,
>   			     &reg_val, 0, 0);
>   
> @@ -251,10 +251,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>   
>   	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>   				  hwmon->scl_shift_energy);
> -
> -	mutex_unlock(&hwmon->hwmon_lock);
> -
> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>   }
>   
>   static const struct hwmon_channel_info *hwmon_info[] = {
> @@ -284,6 +280,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   			      uval);
>   }
>   
> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u32 scale_factor)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> +	if (ret)
> +		goto unlock;
> +
> +	*value = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				 scale_factor, POWER_SETUP_I1_SHIFT);
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u32 scale_factor)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
> +	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
>   static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>   {
>   	u32 reg_val;
> @@ -317,23 +345,15 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>   static int
>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
>   {
> -	int ret;
> -	u32 uval;
> -
>   	switch (attr) {
>   	case hwmon_power_max:
> -		return xe_hwmon_power_max_read(hwmon, val);
> +		xe_hwmon_power_max_read(hwmon, val);
> +		return 0;
>   	case hwmon_power_rated_max:
> -		return xe_hwmon_power_rated_max_read(hwmon, val);
> -	case hwmon_power_crit:
> -		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> -		if (ret)
> -			return ret;
> -		if (!(uval & POWER_SETUP_I1_WATTS))
> -			return -ENODEV;
> -		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> -				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		xe_hwmon_power_rated_max_read(hwmon, val);
>   		return 0;
> +	case hwmon_power_crit:
> +		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -342,14 +362,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
>   static int
>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
>   {
> -	u32 uval;
> -
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return xe_hwmon_power_max_write(hwmon, val);
>   	case hwmon_power_crit:
> -		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
> -		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -372,19 +389,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
>   static int
>   xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   {
> -	int ret;
> -	u32 uval;
> -
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> -		if (ret)
> -			return ret;
> -		if (uval & POWER_SETUP_I1_WATTS)
> -			return -ENODEV;
> -		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> -				       SF_CURR, POWER_SETUP_I1_SHIFT);
> -		return 0;
> +		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -393,12 +400,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   static int
>   xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
>   {
> -	u32 uval;
> -
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
> -		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -420,8 +424,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   {
>   	int ret;
>   
> -	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> -
>   	switch (attr) {
>   	case hwmon_in_input:
>   		ret = xe_hwmon_get_voltage(hwmon, val);
> @@ -430,8 +432,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   		ret = -EOPNOTSUPP;
>   	}
>   
> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> -
>   	return ret;
>   }
>   
> @@ -565,14 +565,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	struct xe_hwmon *hwmon = xe->hwmon;
>   	long energy;
>   	u32 val_sku_unit = 0;
> -	int ret;
>   
> -	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
>   	/*
>   	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>   	 * so read it once and store the shift values.
>   	 */
> -	if (!ret) {
> +	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>   	}
