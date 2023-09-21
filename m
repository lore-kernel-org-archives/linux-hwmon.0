Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7CCE7D0A5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 17:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjIUR3h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjIUR2z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 13:28:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC89F54907
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695316629; x=1726852629;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vSuqBx1dLAO4E9D3i0J3xhqpToCEfluHZRnjfQWKV70=;
  b=mmGk6QAzYti7PMNgjFx/L4FRUxhCgInzG8m1LAIAAdGdVEtnYDw9UV3S
   KSNHt+H3xW41HkNfS038jrfcN12wiSFrdygSSvdvDleavNZ4K21LsSdmg
   ZHdypmB2P9NUQTB39MQNGAZ5QdPwBFaN8/W1MZhihOPemjNLcaAvKngtQ
   CHgiaFSijGy2yIMN9TlGCMTTpFUjZasLtncaq15sXkBJDGN0zBhMKNIIP
   zLW1ALFhZh+c94SOuXgJ89OD/QuRpR+PJ3hvWt0Z6K3DKHi8dCVzeE+W4
   AyX+j9XK1/QxvdClFfvjgCM/lDHsZ67FF+GgRyYhS7rO3MGafV2PBoxRR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380438472"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="380438472"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="747126711"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="747126711"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2023 07:09:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 07:09:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 07:09:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 07:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTIABQ0+tM1eaiDh2XslfSHRJpqqU8MXsOU9ByWGkief2pAVS9BJ6Nwrde72DXf/ZUlTlk4YoYGgP4XMZhrNB8qSDgPu/1DESoyWiVU84sxQFR//TLJ54T5n9sNXxeV4wKZ7CMEH34CAxRc+a+8QSmncHcA8eCAzP5Hs7bDcXGyTWrifnuJrdCLLn8M6eEThhhMY8kZsuF4aq+iIdw9s2rIpJbP2kKYkc+nMLlTLN+LXznVehZzpyxn9+I28+xTM333L+vYm6mlXIMAUVxHJVLcAiGn6N96WxjcdKNnWjzVBfYCnmCIg1HtygWbOdG3DGMAIBDmspRhkuQ+FnqPtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h27fxy5WueY9Ei8oApWzItwHlmCS1slDb/w3OYbtm38=;
 b=FnwKXVj/+0PmLjcXfgmDwKvgswHlQxljvBwdpnlatRuF1x1+nxrDUzj4RMsQ1tV1NmhOH6QlKQZsMejjl12q+v6rpJ03DumPWJapX/Arnq+5FALRICalwAYcxeALfX8iynQ1dOFP49p6Wobs40yDFfcstv/svYBKuNMCkqjzc6i1gS/YQUBqpSva+J/T0cTc+916GbJoA47PtCWFJ91aXOvgPgvniWf7JMv6mivVAK3QDyzSMmA1ddXFZtHZHDmY6BjfkL5L5lHPwYF2qcdBViQDTMmUgSti3MdD94Ygk10trrPDiWRplMxsbEcoAB8p+kpW42adCL2IlmPIpuT8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6143.namprd11.prod.outlook.com (2603:10b6:8:b1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Thu, 21 Sep 2023 14:09:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 14:09:35 +0000
Message-ID: <ae591302-4c1b-227a-5a4e-b8e726144447@intel.com>
Date:   Thu, 21 Sep 2023 19:39:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH v5 5/6] drm/xe/hwmon: Expose hwmon energy attribute
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-6-badal.nilawar@intel.com>
Content-Language: en-US
From:   Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230921102519.3355538-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::34) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: a5de4779-792e-4631-ee0d-08dbbaac624b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpVy/7gc7eSCg6YTgrg64qPztUPWiTrtrvQ2bi3d+VEPG0o8GufkXC8wNgsOa03f9xv92Ny7EthMw7EtRvo7enS5MnWqiIfFas1fyCITTuBUN0Yb+NJp/tnVrRY7odSB1CaWlSzGDRTqfTEI+B03q+Ohi/QKacT5VFucjlimusEq4SC9u/Am1iFKDLOvn4vqUbw+H2Zh4T8U3hp1ChZhrjrP3PIy2JXGGyaThZZqmNbmAPzDWYh+LFhknQ3hPusr5RNYE09e+n3bw0/uUNvWrYUpMGGp82pTuWm5CSRujKTV6FelzNxkoLR64xvyDolrXenjRtIbkI3/l4cLtVBhG3jgfwds0HQD1gpdBmjiRlEa3ys1eGLwi2UqgShcu1KMa0Eg+pzYuJ0jh8Fl22ZIP3BI77Hh0zVLaUqmP5WdjQB33sToYlr0dtWU86muJt9C/XEJGYsXrzcunhSVoQ38eXkmD91neQHu/i74zkb9vP4o68WlTeg7cfDAtG7e+W3P/6H+Uo/jQIR2g66WvjZjWKJxops61103fy1w8ZyqChE1Q/GxRh+Y2xv0am30iYrACRKv18IW7xn/rG3IZ8x8XpvND1em32+//dIYKg6awEzJQ83HEK6r4Myl6D+VA23+GI5EHl085xV6o3cwP9rQuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(478600001)(6512007)(6486002)(44832011)(5660300002)(6506007)(53546011)(86362001)(66946007)(66476007)(38100700002)(41300700001)(316002)(66556008)(31686004)(6666004)(82960400001)(26005)(8936002)(2616005)(83380400001)(31696002)(36756003)(4326008)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjdVWDdnbkl6VkFrVVYzQzB1SytCbGFIdkI3a0xjM2dQN3lvQ3NZdHlhaExC?=
 =?utf-8?B?Q01HaWNwbzVvemZEV2g1cHBucTU1MFlGcVJEWnA3eFMwVkp1b1FiTFpIRVhn?=
 =?utf-8?B?SkxndFYxbFQrRzltZlhIZ0lrZkQrelAxdkt0RExzRnBOUVhuakJIa2ZxaHIx?=
 =?utf-8?B?RWlib3hNV3V3T1BiazRXelZ1dzRZbnliQzJKcElhWWJXdklDcUNqTHlFSjZR?=
 =?utf-8?B?c2NKWi9oOFhpemROaGttOW04UzEzaE13Vm5XS3pWQlkrb2NIT3hwdEpFRlJC?=
 =?utf-8?B?UE5aMlRGcGErWUlIdXNIT09WT1k1ZzhqU3l6NzB0M3ZPU1QxbnlFRUdUdjZZ?=
 =?utf-8?B?akp0SVVsNzdjMTRFVE8zTXc2b2M3a1hHcHNXdml1R2E2alBlM0o1cjB4VVUy?=
 =?utf-8?B?RCs0akFUR1htM0tJZmxBS0FpZi9tMnhla0xMc1IvdDZKLzZhNGtDY0N1SVhk?=
 =?utf-8?B?THB4bXNIbFgxRllnSzFQR29nWHdiblkwZnpvSjdBYzg3cStCSlI4ZjdnVjlF?=
 =?utf-8?B?TE5CZ1hPdEdEYXZxamk2cm9ORERrbXZNMkNqZjdBdGN1MFQveGRKQnpSdTJk?=
 =?utf-8?B?U0xwZGRpRnQ5d1d2VWpiVUpVYy9rbWV0RmZYelFuYjZRZFBXNUV4cVpwOWFC?=
 =?utf-8?B?TGdGRUlZV0I1N0tPRmVCY21kd2kxL0NHOTVIRHlWM2NLaHIxVkErSlBvZ3dG?=
 =?utf-8?B?TDVDZXFKZi9Ka3hxTVZ4RUc1Mys4MnhDRkh3NVV3OTd6dDVlbjQ2Y2UxZzk2?=
 =?utf-8?B?TE1zTmhwVVI4V1l6REkzTGpTSnlLTFBRSjNQanFxbDNBemU5QjRyL3ZFdnlW?=
 =?utf-8?B?QzdjdDFQQ1llbTRLTkx5SDZRZXZkUHBSTVliamdUZGZEblh6TC83T0pscFFi?=
 =?utf-8?B?alNkanZIZzROV3B6ajMwL213djZHSnRoSzhldDA2UzhITml4eWJWeUJaV0NS?=
 =?utf-8?B?bWcySTcycHpCdHFtWjlmQ09pL05tNEhVT01ENGlCNzg2WFBFaWYyK0l3QnQ1?=
 =?utf-8?B?YWZjSS9DYlhzcUlZK3ZOa08wWmZSSk1sYW9jVXJZT0F1TTRnRTFXaEcvN3Ex?=
 =?utf-8?B?M0t2QkN2L2RVV0ZRTXRLeW5ZYk5ZQ1ptQVluTzJrbllwSUNiUEszUDVqR0x6?=
 =?utf-8?B?UWJ6d3dVZzJoWFhFeVI3TVRoL1FOMml6Qmx3UW9PeG5JYmZ3V05PcXU1anlv?=
 =?utf-8?B?bEcySGVTelpFTllaMFZKcFgvTzlqaW5YUHBEZThkYThTYS9icVlXSXlCcjh4?=
 =?utf-8?B?K2R4eitacXorWGsyaTJaYW9YZFlsSmgzaXJlZlF3a2N6ZTVVNmpBU1ppbjg1?=
 =?utf-8?B?WXZmelIwcDVIS0FRd2l2K2p2RkpUbmxjSGRVTU1TRGdxUkxzMjZkVktjZGg0?=
 =?utf-8?B?ZkRNbVJnUkdvTTNGanBjNVhkMFI4SzRadk5TdGY3MXVZdGFlMHBmbHorODVO?=
 =?utf-8?B?M1lYd05jOGJscDBEOW5KdWpJSlFjM0s3U3J4N1NId1pPN0I2YWVwZkk2TXZm?=
 =?utf-8?B?RlBzbXdkWTl0ZG84ejFmaGNReklKWEQyT1VoTlorOTF3TUlaMG9XY25SK0kx?=
 =?utf-8?B?bUZXeTJHbDB3b01ZZ2tLMlRRbnhOUmlicXI4dHNuWWZNRHdLWk83MnJkZDVK?=
 =?utf-8?B?bk9mVkRyZ0dDaHVpeXcwcmpkbVVBVWRJNmphWDFQSnpZUVhRQkVCK29hb3Ra?=
 =?utf-8?B?bmpNUlVtanNaMDdvWEdNZmZqQ1NGVU14dE5IV0dCaEswSXZvNzJuV0JMa3Vv?=
 =?utf-8?B?SDR2RitVNkE4V0MxbmJkTzhaVzloMkY4R0pka09WOGRjTVc5Q084Y1czOUly?=
 =?utf-8?B?SVRINUlkOXltdFJHVUoyTXpWYjRVZDZ2TXllV3RrTzRySjJRNi8xeDdhVDNQ?=
 =?utf-8?B?a3V5b3J2UU1uVDFTZ1RQSEhkdlJFWDZBZnI0VDFOYUZLVE8zOUQ2cVYxc01L?=
 =?utf-8?B?T2Z6Z1VUWUtObStjTk9tMlRiYmVoeUdCZWZVazQzLzBpQ1AraDZpbjB2SDNq?=
 =?utf-8?B?UW5xM3kzRW1QK09WTnhkc1FpMFF6VzVRU2tNOEg4eEo4bmd2WDBwTDFsWUxR?=
 =?utf-8?B?djg5emNreU5BbzkweVVpN3d6ZDF5cjdIaTM2ZmtuQWJEUHJvRmYrakdqWktI?=
 =?utf-8?Q?lE1p+q0yVnHQAerZZYZpL3jeC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5de4779-792e-4631-ee0d-08dbbaac624b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 14:09:35.3588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIsfHhEe1W1weHSvt2/bGmyTXnuUR66p+oBgxBBxfU5TWp+uwh3l+qYxxkqgA2fPBVqATQiL/dEfvPtpI82Xfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6143
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal

On 9/21/2023 3:55 PM, Badal Nilawar wrote:
> Expose hwmon energy attribute to show device level energy usage
> 
> v2:
>    - %s/hwm_/hwmon_/
>    - Convert enums to upper case
> v3:
>    - %s/hwmon_/xe_hwmon
>    - Remove gt specific hwmon attributes
> v4:
>   - %s/REG_PKG_ENERGY_STATUS/REG_ENERGY_STATUS_ALL (Riana)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   7 ++
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 105 +++++++++++++++++-
>   4 files changed, 116 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 7f9407c20864..1a7a6c23e141 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -52,3 +52,10 @@ Description:	RO. Current Voltage in millivolt.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Energy input of device in microjoules.
> +
> +		Only supported for particular Intel xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 102663cbc320..9e6ce74fdd68 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -413,8 +413,10 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
This is not used in the file
>   #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>   #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 27f1d42baf6d..d8ecbe1858d1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -25,6 +25,9 @@
>   
>   #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
> +
> +#define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 431995045faa..cb75b9a386c0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -22,6 +22,7 @@ enum xe_hwmon_reg {
>   	REG_PKG_POWER_SKU,
>   	REG_PKG_POWER_SKU_UNIT,
>   	REG_GT_PERF_STATUS,
> +	REG_PKG_ENERGY_STATUS,
PVC register above has it PLATFORM. Is PKG okay incase the other 
register is added later?
>   };
>   
>   enum xe_hwmon_reg_operation {
> @@ -36,12 +37,20 @@ enum xe_hwmon_reg_operation {
>   #define SF_POWER	1000000		/* microwatts */
>   #define SF_CURR		1000		/* milliamperes */
>   #define SF_VOLTAGE	1000		/* millivolts */
> +#define SF_ENERGY	1000000		/* microjoules */
> +
> +struct hwmon_energy_info {
Better to retain xe prefix since all the enums and structs have the 
prefix across the file

With the above changes

Reviewed-by: Riana Tauro <riana.tauro@intel.com>



> +	u32 reg_val_prev;
> +	long accum_energy;		/* Accumulated energy for energy1_input */
> +};
>   
>   struct xe_hwmon {
>   	struct device *hwmon_dev;
>   	struct xe_gt *gt;
>   	struct mutex hwmon_lock; /* rmw operations*/
>   	int scl_shift_power;
> +	int scl_shift_energy;
> +	struct hwmon_energy_info ei;	/*  Energy info for energy1_input */
>   };
>   
>   static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> @@ -72,6 +81,12 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   		if (xe->info.platform == XE_DG2)
>   			reg = GT_PERF_STATUS;
>   		break;
> +	case REG_PKG_ENERGY_STATUS:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> +		break;
>   	default:
>   		XE_MISSING_CASE(hwmon_reg);
>   		break;
> @@ -192,10 +207,59 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>   	return 0;
>   }
>   
> +/*
> + * xe_hwmon_energy_get - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static void
> +xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
> +{
> +	struct hwmon_energy_info *ei = &hwmon->ei;
> +	u32 reg_val;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ,
> +			     &reg_val, 0, 0);
> +
> +	if (reg_val >= ei->reg_val_prev)
> +		ei->accum_energy += reg_val - ei->reg_val_prev;
> +	else
> +		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
> +
> +	ei->reg_val_prev = reg_val;
> +
> +	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
> +				  hwmon->scl_shift_energy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +}
> +
>   static const struct hwmon_channel_info *hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	NULL
>   };
>   
> @@ -369,6 +433,29 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   	return ret;
>   }
>   
> +static umode_t
> +xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		xe_hwmon_energy_get(hwmon, val);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		    u32 attr, int channel)
> @@ -388,6 +475,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_in:
>   		ret = xe_hwmon_in_is_visible(hwmon, attr);
>   		break;
> +	case hwmon_energy:
> +		ret = xe_hwmon_energy_is_visible(hwmon, attr);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -417,6 +507,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_in:
>   		ret = xe_hwmon_in_read(hwmon, attr, val);
>   		break;
> +	case hwmon_energy:
> +		ret = xe_hwmon_energy_read(hwmon, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> @@ -468,6 +561,7 @@ static void
>   xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   {
>   	struct xe_hwmon *hwmon = xe->hwmon;
> +	long energy;
>   	u32 val_sku_unit = 0;
>   	int ret;
>   
> @@ -476,8 +570,17 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>   	 * so read it once and store the shift values.
>   	 */
> -	if (!ret)
> +	if (!ret) {
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +	}
> +
> +	/*
> +	 * Initialize 'struct hwmon_energy_info', i.e. set fields to the
> +	 * first value of the energy register read
> +	 */
> +	if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, 0))
> +		xe_hwmon_energy_get(hwmon, &energy);
>   }
>   
>   void xe_hwmon_register(struct xe_device *xe)
