Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24733EE57D0
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Sep 2023 06:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjIHG52 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Sep 2023 02:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjIHG51 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Sep 2023 02:57:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B9C1BE9
        for <linux-hwmon@vger.kernel.org>; Thu,  7 Sep 2023 23:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694156228; x=1725692228;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ua/k175NCO3hTlYp2ac90TxZp/lxyMFD1O5WDyasqyA=;
  b=Xwj+rQ13tNfhB0Fdc+K0rCTrk5EPYkkIzGWglrBGByKTgQ7fHDe8u+X8
   10skaps+GxhoE1sntyrGAoCFYUg238g2bGrV2p/W3WaS08DU43sEUZG5U
   9bL+FwKTlSmxbe6nnCGWJE1ESD7FtZh7PG5KmsN6SeB5Fybi9dGiM8Vzt
   38BGcxWurSVtlWI/+zh0gRCmgBnRY2vKXgL9e2Y2NaNcwRIm2clt5EnYj
   5JW+OXgHW+R+jDcNCztw6ZiBNyGuM5+jR1+Svdz8sUxku7FZ3b4/69vqF
   20GPhMhVNK/JQFM1c9sQXcGFpN87IRS6HuH5m5fcQs7/UdEePrgL/chxb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367841167"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="367841167"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 23:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885564804"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="885564804"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Sep 2023 23:56:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 23:57:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 23:57:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 23:57:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 23:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDJWF7xSOfo1Ty1Ym7E0n0uG6qXADeGWqBjK5dKUTnuVagq/Tu7c6iJmrqrbxiH8zZ4xO3Gvbxdd6RleP+tUqR1MaeIi892mN9lL2PL5Oe+HLUPqk/OctVhh7Sb+S5Kb5LOsjeOPxxwgmUp5ABFx9XoR54fIZ04WwZOM3tZUh9Lw1ljV/i/xVb3XFx9Ig8RkenCVmtNTW4+44t56YDONAJ+3d0hF6bmLU5Fwuc5YURdsWhtTHNUAZSd+/zL40FVZuJuYK5SsrrSW/MmV2dOLu1XMevHzioAj6HFrr/LaAlEb2tEYSt95UtkbSi0sabOzjyEWSiIMVOo3yqwb2O9VJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+JJDktxOhMiyhv8mo7RKVvPSXAXO0hD62y4l4edsQg=;
 b=ImZ6aLk5NXIEfpkMHuomAjbHi5SFX6R+hKPeoWFbW9Bs77b5CjF2DVfRGvIVMek1arKMSBCxe2XPustxLghVJCaN3Ula6+tgR3qq3bPfSQ2enE/OcVtGKHYJuJChA24Qqyv/nC352o3Hg4STH1suYmJ2t2QlWK18Va4HXkhITBQHRpg0FQzNJEPTkaRDisAjDyYKu0txXwJwJrHR8J5lt21BDAmIsGYH218J/pLRtmwBAm92mzEWIpf2LKCyopMPZqwWv+ECSO2M6InMiK8Pe4FhoQJGxNMD1ePNe68pdvkPA6g/BWvHs6y7tEPUuU5HC4UR76YhWuy/hzNIEjsyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 06:57:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:57:02 +0000
Message-ID: <a1472f2b-2c8d-8213-72eb-6e5f60ce6d15@intel.com>
Date:   Fri, 8 Sep 2023 12:26:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH v4 4/6] drm/xe/hwmon: Expose input voltage attribute
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
 <20230904182258.2291881-5-badal.nilawar@intel.com>
Content-Language: en-US
From:   Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230904182258.2291881-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f183c4-690d-4030-d83e-08dbb038cde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZqKrA1uoKhj1CuuANk8zyq5KXkvs/8fqYDPh/sI+nwRn3cAD266xm2PrNMixvM4vL9gLDAdwRMvhP9MOEKJZvxh59lbbMIE81V24VqnoX8t5Ucx6RxJgwsGHE7Tsoighi838Ujb7GYFwQlRoibqPCKZiEaPn3M/9Z3phDHHtusM9Y9MU6DXj9BXsaoq/oqR0sZlwzukJUW+GqUgYs5ZCMS12QOjX0nUQCycnIXPPv2QO7s8li21/+9RF28LNvpHZYxrK+xkCO9orJCOPu0dgDFqRu1gLQEcotOdwIEm08ssmvag2Vnlk+w2WUylt739/TBOx/UR5Cfi+UxYI/2B5hMrxqsH2DysifH5xBj1yAJ0IAWz4JSmYmeRPdXWawSnunWzSHxlmse0vQbkAp3QjzSFU8RDFs2umEkGKk18K8PWZw5nRUvhlcRM8wQTZ76tTh/KFm/NHiq9W2ENch/9BUXM21nVZG4Bk3srnFIjhv6PPn9HB+SlFm5TYBGSbyqzpjjwB+1BlXrp2ZdWLDzvqz6cEM2IDqz9yxv5OEWvbcuA702aS1dKAXWoLXaRIXHa6wisFrGUxmbEdntMicMqCpc7yAb62jCns5vP7WiHTtpurSu2hv/QRPPxYn7a4I1psMybz3u/n7joOvSxC5w+vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(44832011)(66476007)(316002)(2616005)(6666004)(86362001)(31696002)(66946007)(66556008)(2906002)(41300700001)(8676002)(4326008)(8936002)(5660300002)(38100700002)(478600001)(6512007)(26005)(6506007)(6486002)(82960400001)(83380400001)(36756003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlMc1RZQktJd25xMHJJV0hTcDByQW9WWXBUcjRYMHNiNDRmRS9DejF0dUcy?=
 =?utf-8?B?MExCd3pPakd0dnREOFFkNllFVXBpdUFtNzRZZnNXRDA2bzYrMlhaTzNpT3Ir?=
 =?utf-8?B?akZsaUFYd1pGLzZoenhXc2wxR2dyOVJrRzQ4Wk5DYnhoUmlRb3BhS2hFMTdt?=
 =?utf-8?B?WTJCRGpObExmK25XSnJCbWp5cTdDNDJnTVlpckVaMHB4S1FWNTh4bVBNNDZY?=
 =?utf-8?B?Q0pLTHdtZlFCVFl0Mk9tT2xwdUdhYSttblIrZDR6OUxobEpBdTU3YURWNUhw?=
 =?utf-8?B?bXpOeHJDQ2JVVzZNejF0UjZGUjdxR2RweW1NdnFkUXRpQldhSkU0bHpYRm1E?=
 =?utf-8?B?c0cvQ1p4T1NhMC9uV3RWT29nK2tMeWNxa1FxWloyNFZJR3dvR3pTbk5LWUZW?=
 =?utf-8?B?NVVTbU0vRC9VeUtnc3RQN1RCeC9qSDRta1o0dzk0TjF4amk2YThySzNTdU10?=
 =?utf-8?B?UHJ1UVlWZEJaRnZSVmVDU3FLSnVwbVF2N1JZUGM0WmhLbElkYVZlbTNCVUUx?=
 =?utf-8?B?WlEveXNEdFpQa1ZHbkFHK2tUNjd6VThoVnY3RkE1bUlBekxIU1l4ODVJVlNX?=
 =?utf-8?B?Y1RPUVVPRlNLTlJQeEJiUHB0WG01VFl6NmhpZG1hNHpDWlk4WnpKWkFxLzB1?=
 =?utf-8?B?Lzk1MHVWcTQwQmdaLzBQTnZIdjNQN1JYUGdCc0VVZHJBaFNXb1JWNG11VW1w?=
 =?utf-8?B?NlM3WTVuOW1BYXBpM0F3RjNQektDYW8xZ0FBby9VOU53ejBCbEpxL1ZZdWVx?=
 =?utf-8?B?NGZqVmFwNUxJRlZobkdSNXBmeVR0ZXpLWmRRV2dhVnpBS3M3b1luOHU2QzBS?=
 =?utf-8?B?SnJwQmNPSVY1VkVkNy9mcEM2b2dHNjBQakllZWNMc0hnczFSY25tN01HWmxI?=
 =?utf-8?B?dmVaMXd2RWxWaEkxZ21lcFF2R1NzUTUrVEJEenRkeVo0ZHFMVlZpQkRMTFZ1?=
 =?utf-8?B?KytaeVBUeUovZ29uV3dJeW9JUE91TlZoMUlTN1d1enBNcWUyTTgyTHFOUXlp?=
 =?utf-8?B?QXVUaENKU0VKVGJXZXJySEo4ZWxsdmhIODVwL3NEeEhrcHUwcE01eHQybEVN?=
 =?utf-8?B?NHIxRzhaRlFvWUxzQjd5VDBiSEpTUm9aeVczd1ZwZVlwSDFKVUdDQ09rSmF1?=
 =?utf-8?B?OGR1dzJPRVQvRnNNVFVWU0tWUDZKYWRqZ0ZKRndkUk1UWEVZbU1qRlBZRXF3?=
 =?utf-8?B?K2NmVitPSTNtZmJXb292dGVCS09jRklYaDhFK2JTQjV2NjF4WnZjSlg2amdu?=
 =?utf-8?B?dUtjQ212VnhlQWV2R3QyaFRqR2NQdVdWdHlRVFhubWZ4K1RJMVB2Y0huWFIx?=
 =?utf-8?B?amZIN1V0ZW9wUWlvaEZZZGJDVG8ySmR0SG8rNHFRRlVZczdBMTJDVkdGdVpw?=
 =?utf-8?B?cm9oZGc0YnhSQWFhckVuZkJpeEZJZy9NVWFDSkdtZVg2UFBiNTNKSk02Ykpo?=
 =?utf-8?B?MXgyb3BhN0RTcSs2MXdDNkduMVR5dzBmOHE0S2dKeEg1SldWVTJjV3BpZHZO?=
 =?utf-8?B?TlBodkpldm9HazgyY2k2OXRUdnFGOGc1V0FiSU9MMVFpUnVxbWJVQUFWR1hB?=
 =?utf-8?B?TTlHbVg2cnprbnBDUms3SmxuZlZ1elNSMlRDWG5aaGp6aDZpc3NCRnB0UElV?=
 =?utf-8?B?ZCtUclRuRlRHNHI1R2tTc21YcTBWZkNWV0RmeUhKVEdJUDdiYUJrcWluUnMz?=
 =?utf-8?B?ek54TjJNbzdKUVE1MGJqTlZBRzVYYnlwWUNqY08xZFJJZkFpVE1UbDlsQTRh?=
 =?utf-8?B?ZTVCZ2l5SnlYckpYamxPbnVWWmRHQnFXODU4WjdBWUplYzlXaCtNTy9KNWp2?=
 =?utf-8?B?MHhvc0lCdlNuQmdPRVZJeC9Cd3pGakRQaWgwNkdYOXpkc1BtdHloeVRQTzA5?=
 =?utf-8?B?MXl6ckNBcjBHQ2NLdlZHY0M2UERmVEx4dGpxN3VxYjZZMEs1Vy9oWHJxbGN3?=
 =?utf-8?B?ckhNY3FNbnhEeHcveVBUaFZVWnJDZUkrK1FEdTljcStxNGZtMjE1RXJnZENN?=
 =?utf-8?B?a0pjZ0FMV1dVWStqSml3dlVMbnZWYTYvbUlVWlZqM0t3bVJJRks0c0lFbVYr?=
 =?utf-8?B?aStmZ0lLU1lsN2FsTlFPeUJuUlRkUTJHSkV1V21xNnVFektoNllpMWk4bEF4?=
 =?utf-8?Q?wY52hAea8BBlhw2pXnMMaeHNZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f183c4-690d-4030-d83e-08dbb038cde7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:57:02.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFPmep0cB/eA85MW6jEFq8BYqUaRuGqlTno5uMAw/OPHsuT4NSCaNHOygn9TS1i1tlxTiHHrQKCIR2X5jnN+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 9/4/2023 11:52 PM, Badal Nilawar wrote:
> Use Xe HWMON subsystem to display the input voltage.
> 
> v2:
>    - Rename hwm_get_vltg to hwm_get_voltage (Riana)
>    - Use scale factor SF_VOLTAGE (Riana)
> v3:
>    - %s/gt_perf_status/REG_GT_PERF_STATUS/
>    - Remove platform check from hwmon_get_voltage()
> v4:
>    - Fix review comments (Andi)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  6 ++
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  3 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 58 +++++++++++++++++++
>   3 files changed, 67 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 37263b09b6e4..7f9407c20864 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -44,5 +44,11 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
>   		the operating frequency if the power averaged over a window
>   		exceeds this limit.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Current Voltage in millivolt.
> +
>   		Only supported for particular Intel xe graphics platforms.
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 32adfce8b2db..7ca84a710ce7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -369,6 +369,9 @@
>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>   #define GT_GFX_RC6				XE_REG(0x138108)
>   
> +#define GT_PERF_STATUS				XE_REG(0x1381b4)
> +#define   VOLTAGE_MASK				REG_GENMASK(10, 0)
> +
>   #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
>   
>   #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 12298a0e8636..48621a6ea224 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -3,7 +3,9 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
> +#include <linux/types.h>
>   
>   #include <drm/drm_managed.h>
>   #include "regs/xe_mchbar_regs.h"
> @@ -19,6 +21,7 @@ enum xe_hwmon_reg {
>   	REG_PKG_RAPL_LIMIT,
>   	REG_PKG_POWER_SKU,
>   	REG_PKG_POWER_SKU_UNIT,
> +	REG_GT_PERF_STATUS,
>   };
>   
>   enum xe_hwmon_reg_operation {
> @@ -32,6 +35,7 @@ enum xe_hwmon_reg_operation {
>    */
>   #define SF_POWER	1000000		/* microwatts */
>   #define SF_CURR		1000		/* milliamperes */
> +#define SF_VOLTAGE	1000		/* millivolts */
>   
>   struct xe_hwmon {
>   	struct device *hwmon_dev;
> @@ -66,6 +70,10 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   		else if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>   		break;
> +	case REG_GT_PERF_STATUS:
> +		if (xe->info.platform == XE_DG2)
> +			reg = GT_PERF_STATUS;
> +		break;
>   	default:
>   		XE_MISSING_CASE(hwmon_reg);
>   		break;
> @@ -189,6 +197,7 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>   static const struct hwmon_channel_info *hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	NULL
>   };
>   
> @@ -211,6 +220,18 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   			      uval);
>   }
>   
> +static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +
> +	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> +			     REG_READ, &reg_val, 0, 0);
> +	/* HW register value in units of 2.5 millivolt */
> +	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
> +
> +	return 0;
> +}
> +
>   static umode_t
>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>   {
> @@ -319,6 +340,37 @@ xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +{
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		ret = xe_hwmon_get_voltage(hwmon, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
>   static umode_t
>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		    u32 attr, int channel)
> @@ -335,6 +387,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_curr:
>   		ret = xe_hwmon_curr_is_visible(hwmon, attr);
>   		break;
> +	case hwmon_in:
> +		ret = xe_hwmon_in_is_visible(hwmon, attr);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -361,6 +416,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_curr:
>   		ret = xe_hwmon_curr_read(hwmon, attr, val);
>   		break;
> +	case hwmon_in:
> +		ret = xe_hwmon_in_read(hwmon, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
