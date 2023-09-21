Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32ABE7D0A2
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 20:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjIUUA3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 16:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjIUT74 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 15:59:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBA25493C
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695316636; x=1726852636;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jRdJ69295YWNeDLPcd08pL98WDDOMpBE6kgAocB+1z8=;
  b=UXviUqyo4DzVvfgnQHVVQykXkZF5x2GNPyKlhxp6C+LxN+KSCHHCOEog
   bgvkAhmIVaxCMLN676WgRMJrKQI3nmx+51KbrMJMWIYQ3rPSzt2BHy3dL
   h2pMnb+S1j7OsrSgI+lMAjsW4C46+dIYCBiySjueNKV3FbOWSzpgS7P7J
   NbbV4nNaS6VhPlJLNtIJvRN7fhimoGn8MARNrKUklnPldPrv5OicYxxY9
   fNpeSiVteWmSpbMLfraN1KUdYWo+Bg04fxT0DLxJsfgZPYmQMxm8SEwEo
   Lmr2vle/uUr9BJm5X/kVtQb6zTt6enggwXlgaFnCmorcwjhOqHhwIENEQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="444634312"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="444634312"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 06:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="812644437"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="812644437"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2023 06:22:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 06:22:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 06:22:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 06:22:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 06:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHn6fluzHkpxig9nYQq1mQEHbd3Urhr7QzPxxfVq65Kp4uVf0RJg6XIh4xyPkW8eaBPVgkHnV0VJmm2wPynuSNQmIptWR1nNM16lj5jI3KFq6Q1jzgakC78DKiqa353FUqm3GEL1nP4FWMV7BYHbnNTbEMG/24ToP+Ig9OOOFQ6C5JOd2Zl26cGPS1DlXd7ZUTrArn0pFi4KNxW5rHkfsi2KCeWmPhc5MKT25p7hUGmFXZqOX1/JlvvF+zPKVX5cCRcHXHrBEZqmpfA3tfTQU6HAUZ0g2oVZGA0kGwQuiV0PGOupZGgIlh9e00SW1CpM8KWgAX2dj7PVDdEwy7lCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kkz/GQKUo6Dd7nEI92pYhFum5V+BusKB2mlYtj7mZiw=;
 b=DpbuNISIG7VTxzhSL5y+ITDvy8e7Su75nYhJugCnOv7cX8du8BCb7vDEmYiryoK0id63WMmliZv5xQ3jtHXZSIsik7pYglLRToCYM5Iqt69jOkKbpdKrC9LYjVTMK1iVecn/WQ2xFCoQb9GzbClBqTfAtDQGXL/ghxLTV+qpxP1GNAXH8yyqoMm8jCj9Kw2X07DfvGEsFyL6GhLVLTDIr2As7pEZhQu5CzWXit2/H3Uz4/RzM+vuIkYORhfkKYN9NzK17Srre2JuE7ngXXqMpb/ZtRWI+km1BDA0V8BBWmJ+tRyu8wrY09yW/ivOTjVamm5P3lGrJCVdXVjxSYqGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.21; Thu, 21 Sep 2023 13:22:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 13:22:32 +0000
Message-ID: <edcafd08-3e84-11cb-99df-11165ac01cb2@intel.com>
Date:   Thu, 21 Sep 2023 18:52:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-3-badal.nilawar@intel.com>
Content-Language: en-US
From:   Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230921102519.3355538-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e8723e-f1f0-4c48-901b-08dbbaa5cfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlvow5VCgh2jO7nmEYg8DsfaSM/HkhOk/x9dxxHYWFzx4QKPcw56LjpW7hKKdQVIAcE7ykeXOi5qE8wj9Uvv0wDD43ottFTBCU/YRGVGszElvxXMMUn/P8iCvzNWx6HNNX0P4x4to5t9Q6+RLxnElAYCyevcDnQA6P1CYax1Ok1Us4BlfT6r7TKHuGeB5qzIybz4E7FhkcLnM/TI+TMQeNbBGnakl41xpqG//DHUbNtA6w0mdyDQfpLNWaW44Y5UCky+CHpIJPKvSo7RxItd/igLhGsFk/vcA7EuMLcqEw/tZjMF8ayUgo0DuhsQJWuYgNMjORZxXrIytJuPoqVdLYnjX/R6DwXJwjkG7E9foP2KyFw5DEFkHLiORgKJeFgc/f3XXFO1k9nbIS1RoH+BIuQZlJCuaIJXj/AFciu3OWxmCBGm7rZ4Yx/LHa2iwxQbTUwx+wL+LQvsnEtsGI6X5goXtIm/V/oPu4vrTXsDUH24g8DnLR4XT17hA13Tt7synVe1wKNL9labbR/K7ZPCKowCFm/wJ8NrH31gYuQFRzeHgy/2av3ymwMnCRUfyM4zgNUwCUohSaWFg0Y3ZubFVmqX9rHMYer4xbmnmbYK9yXX3OPII9vcaZWEhevb+KxqB9KI17AT9E5W93SBiIvIMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(186009)(1800799009)(451199024)(36756003)(6512007)(2616005)(82960400001)(6666004)(6486002)(6506007)(53546011)(26005)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(38100700002)(31686004)(83380400001)(30864003)(31696002)(86362001)(5660300002)(2906002)(8936002)(4326008)(8676002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejdLTlZBaFdrTTFGL1VncG1JdGZzREc0MGpXQUhOVGRRTW8wOFZMTXdWaFdo?=
 =?utf-8?B?MHQ5MlVnR1NZNkc1akJIV21mZ2tPeGt3ZmlMUmp6V2dqU0xaaUI1UDBjTlVn?=
 =?utf-8?B?RWY2OHQzYkdpUERqUVpSYkErRzZKMzVXSHBxVzh0TXhxRWVJTHV4ZXd3RmNy?=
 =?utf-8?B?QzlhTUZXa0RweStydUJnc0kybWY2Zk42RE1XWHIwZWRQTVE5Y0pyeGZPem1k?=
 =?utf-8?B?TkFDS01ZTGpGUGFkQ3dSTmZlYTJYNDBrNTc2Y1ZDMTRDYVpqQTVQekdmUnRR?=
 =?utf-8?B?S25wOERNbFZhMlp6VDFQWGZFSFl3Rk5iQVZqNHZrekhvU2xxb0VlUm5xZlhi?=
 =?utf-8?B?a3o2bG1Od3BrZWlnSjM2ampJLytCczdvSGwzZWtvSHd3cHI1NWtES3p5YjV2?=
 =?utf-8?B?L1VEV010bXpib2t5Sy9SVVlxUUxiMFNMY2Jic2gvVEo3S0NSNG84RXhRTXUv?=
 =?utf-8?B?cmt6ejVyVkRCSCtkcXRlTi9JRjNXa05yL2RmQ1FzNEpZc2wyME5MbXNsdmtL?=
 =?utf-8?B?SnZLVkpnNFUzVU5KZStaRVVCb3ZzeDhPclIvQmZoS3IrMmpvNDdhQU16OTQ4?=
 =?utf-8?B?Ukl2S2ZCTjFiTlN1YmlNUTBiWVhhMHJVbEtJd2ZXemZsMUh4bG9YQ0ZVWVMy?=
 =?utf-8?B?aTc4NlFKcmJwM3Vxb1F5SjFZSzB0S2FaSVV0eVBWNlhXdzRrR2NwMnpUL0o3?=
 =?utf-8?B?S3hVZ1Q4WThnL3hqNWkyS3ZhWnB4V3VpL29XTTRoNGVjNXBZK3NPdzRZUDJO?=
 =?utf-8?B?b0tzMVlGRG1SSXg5YjJhUVJVMUVjbmRQNVpwWjVZL29rNk56VFE0OHdzSWxY?=
 =?utf-8?B?cWhpbGM3VytLNVdqT0N4VFBoVzZ2Mk1iN0cyQzN5ZnZkbjFaWEYvYmJYdy9h?=
 =?utf-8?B?SHFLMzBqUmdFaXJOdkUySGlqalpGZElmVHpGamR6MXlZczdDT3Z5SVprWWRW?=
 =?utf-8?B?NFR3QjFOZFZxaUkvUjNRTVdtYVN3QkJLNmFibGJGbVhoVUtYMjh5R3A1bW1k?=
 =?utf-8?B?QWIya2RrVGFKdVBxS0NnOVAxVmdmZlpTOXFIbjZBV2YzcHNITjJjeEJ4c04z?=
 =?utf-8?B?L2MwQjVzbVpTTTRzdG1CeTZkWDcyTGtLNGFkNFJaWW96ZUZOSmFFKy9XUWxV?=
 =?utf-8?B?QmRmeFRWeHl4MUw4MURrZ2cvZnVVcGNkSmhZaHlLYnp3M2RnaGFyQ0pnVFF5?=
 =?utf-8?B?d0FuMWpuaVMxdVNYcVdQOEdoOXJvNFduanFGUm5oTkYxajJ5SnBRYWNVc3Iv?=
 =?utf-8?B?TzRhK2YzaVIveXdVNGo4VWZLYW5WWkJ2TTdSaGYyT1V4eFIwYytORDZRdzdu?=
 =?utf-8?B?WUNpbmwvcklrbC92dW5xSVgxdFRJZUM4dThxTG1lQWxDY1FzVkdNVSsrL2wv?=
 =?utf-8?B?RmZzRWUwalUzcW9objRMcG4rSmpKSXp3ejNPOVpNcmt5eVFlNDdjYTVUS2xS?=
 =?utf-8?B?NXI2M2FZT1FzWmZaNHZNcmN1YUJJZ0V6Skc2YjRUYXpYSzZoSTRyNVRpZDRs?=
 =?utf-8?B?RENlanRWM25hWXk4eGwxZ2pFNFczdjNKSmhGczdTYVAvQ3pUYVZvbmMwUGhZ?=
 =?utf-8?B?MUlKQXZOMC9EcTRaUUtCdW1lYkUvUmNSV1FUbnRzbTNsVkVJRjF3SVBGeTdY?=
 =?utf-8?B?VDZFZENieCs5eG94NHc5UVJJaWg1OC80RURvdHhJd2dCRzVmbUJ0THF5eThl?=
 =?utf-8?B?QmRHeGE1c0ZhcDdYUGtDRnF4UXo2aUsrL3RlK1huckxId0swR0liMktoeDE5?=
 =?utf-8?B?dWt6bmw1aTVnRHp0U2VOeTZnZzFCMTNUMEQ2ZVljbC8ralV5NTVyakZQaVZi?=
 =?utf-8?B?Zi84MHVON25TNG1jK01FZnMzZUVpdmdKM3hNL2hQTklIKy9wblc1UlQyRVdz?=
 =?utf-8?B?dUkwNWxwMzJkb2dsUnk4R2NtNzJISE9iWFJETnJkUTRXNjk1Q1VUWFd2djlX?=
 =?utf-8?B?QkZnbFlpVys5SHVuMmdzb25uNjFUb2FhSFVkSllWVVd6aVl1anp4dURHUWFn?=
 =?utf-8?B?TmQ3eUwrbW1UeFR6SmZ1MWVKa0lZZTlCVmFDMTlCdmUxWGp4dUxLNytjZHFR?=
 =?utf-8?B?SUNzL0txZ2VuTSszejNqc1dPQWNnNFcrLzBqZ1NPNmtHVlJGYk9lck9hSXJu?=
 =?utf-8?Q?0yKOsgHislWQBJiQyKdhn43Ev?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e8723e-f1f0-4c48-901b-08dbbaa5cfb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:22:32.1924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm5F9GLRbR0icqcGVB2qcSj6RFtBs/OilCXJyynrkPs2uMDo9StVx9OCfNbdFH2PutT7ZSM5v+z35eWx2stYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 9/21/2023 3:55 PM, Badal Nilawar wrote:
> Expose Card reactive sustained (pl1) power limit as power_max and
> card default power limit (tdp) as power_rated_max.
> 
> v2:
>    - Fix review comments (Riana)
> v3:
>    - Use drmm_mutex_init (Matt Brost)
>    - Print error value (Matt Brost)
>    - Convert enums to uppercase (Matt Brost)
>    - Avoid extra reg read in hwmon_is_visible function (Riana)
>    - Use xe_device_assert_mem_access when applicable (Matt Brost)
>    - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)
> v4:
>    - Use prefix xe_hwmon prefix for all functions (Matt Brost/Andi)
>    - %s/hwmon_reg/xe_hwmon_reg (Andi)
>    - Fix review comments (Guenter/Andi)
> v5:
>    - Fix review comments (Riana)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>   drivers/gpu/drm/xe/Makefile                   |   3 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  33 ++
>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 358 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
>   8 files changed, 445 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> new file mode 100644
> index 000000000000..da0197a29fe4
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -0,0 +1,22 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 and <= TDP will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 86c8bd4c05a3..ca77aff60d48 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,9 @@ xe-y += xe_bb.o \
>   	xe_wa.o \
>   	xe_wopcm.o
>   
> +# graphics hardware monitoring (HWMON) support
> +xe-$(CONFIG_HWMON) += xe_hwmon.o
> +
>   # i915 Display compat #defines and #includes
>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>   	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e13fbbdf6929..679cdba9f383 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -410,4 +410,8 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> new file mode 100644
> index 000000000000..27f1d42baf6d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MCHBAR_REGS_H_
> +#define _XE_MCHBAR_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/*
> + * MCHBAR mirror.
> + *
> + * This mirrors the MCHBAR MMIO space whose location is determined by
> + * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
> + * every way.
> + */
> +
> +#define MCHBAR_MIRROR_BASE_SNB			0x140000
> +
> +#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
> +#define   PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
> +
> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +
> +#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +
> +#endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6bcb6c3482e..2acdc22a6027 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>   #include "xe_vm.h"
>   #include "xe_vm_madvise.h"
>   #include "xe_wait_user_fence.h"
> +#include "xe_hwmon.h"
Should be alphabetical
>   
>   #ifdef CONFIG_LOCKDEP
>   struct lockdep_map xe_device_mem_access_lockdep_map = {
> @@ -337,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_pmu_register(&xe->pmu);
>   
> +	xe_hwmon_register(xe);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a0..d1e319f305ef 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -365,6 +365,8 @@ struct xe_device {
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>   
> +	struct xe_hwmon *hwmon;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> new file mode 100644
> index 000000000000..7f4599d98541
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_mchbar_regs.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_hwmon.h"
> +#include "xe_mmio.h"
> +
> +enum xe_hwmon_reg {
> +	REG_PKG_RAPL_LIMIT,
> +	REG_PKG_POWER_SKU,
> +	REG_PKG_POWER_SKU_UNIT,
> +};
> +
> +enum xe_hwmon_reg_operation {
> +	REG_READ,
> +	REG_WRITE,
> +	REG_RMW,
> +};
> +
> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + */
> +#define SF_POWER	1000000		/* microwatts */
> +
> +struct xe_hwmon {
> +	struct device *hwmon_dev;
> +	struct xe_gt *gt;
> +	struct mutex hwmon_lock; /* rmw operations*/
> +	int scl_shift_power;
> +};
> +
> +static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> +{
> +	struct xe_device *xe = gt_to_xe(hwmon->gt);
> +	struct xe_reg reg = XE_REG(0);
> +
> +	switch (hwmon_reg) {
> +	case REG_PKG_RAPL_LIMIT:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		break;
> +	case REG_PKG_POWER_SKU:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_POWER_SKU;
> +		break;
> +	case REG_PKG_POWER_SKU_UNIT:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		break;
> +	default:
> +		XE_MISSING_CASE(hwmon_reg);
> +		break;
> +	}
> +
> +	return reg.raw;
> +}
> +
> +static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> +				enum xe_hwmon_reg_operation operation, u32 *value,
> +				u32 clr, u32 set)
> +{
> +	struct xe_reg reg;
> +
> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	switch (operation) {
> +	case REG_READ:
> +		*value = xe_mmio_read32(hwmon->gt, reg);
> +		return 0;
> +	case REG_WRITE:
> +		xe_mmio_write32(hwmon->gt, reg, *value);
> +		return 0;
> +	case REG_RMW:
> +		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
> +		return 0;
> +	default:
> +		XE_MISSING_CASE(operation);
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
> +{
> +	struct xe_reg reg;
> +
> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
> +
> +	return 0;
> +}
> +
> +#define PL1_DISABLE 0
> +
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in REG_PKG_POWER_SKU. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read.
> + */
> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +	u64 reg_val64, min, max;
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
> +	/* Check if PL1 limit is disabled */
> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> +		*value = PL1_DISABLE;
> +		return 0;
> +	}
> +
> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &reg_val64);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*value = clamp_t(u64, *value, min, max);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
> +{
> +	u32 reg_val;
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +
> +		if (reg_val & PKG_PWR_LIM_1_EN)
> +			return -ENODEV;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	NULL
> +};
> +
> +static umode_t
> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
> +	case hwmon_power_rated_max:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return xe_hwmon_power_max_read(hwmon, val);
> +	case hwmon_power_rated_max:
> +		return xe_hwmon_power_rated_max_read(hwmon, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return xe_hwmon_power_max_write(hwmon, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t
> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		    u32 attr, int channel)
> +{
> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (type) {
> +	case hwmon_power:
> +		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
> +		break;
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	      int channel, long *val)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (type) {
> +	case hwmon_power:
> +		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	       int channel, long val)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	switch (type) {
> +	case hwmon_power:
> +		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static const struct hwmon_ops hwmon_ops = {
> +	.is_visible = xe_hwmon_is_visible,
> +	.read = xe_hwmon_read,
> +	.write = xe_hwmon_write,
> +};
> +
> +static const struct hwmon_chip_info hwmon_chip_info = {
> +	.ops = &hwmon_ops,
> +	.info = hwmon_info,
> +};
> +
> +static void
> +xe_hwmon_get_preregistration_info(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	u32 val_sku_unit = 0;
> +	int ret;
> +
> +	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
> +	/*
> +	 * The contents of register PKG_POWER_SKU_UNIT do not change,
> +	 * so read it once and store the shift values.
> +	 */
> +	if (!ret)
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +}
> +
> +void xe_hwmon_register(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct xe_hwmon *hwmon;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(xe))
> +		return;
> +
> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return;
> +
> +	xe->hwmon = hwmon;
> +
> +	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
> +
> +	/* primary GT to access device level properties */
> +	hwmon->gt = xe->tiles[0].primary_gt;
> +
> +	xe_hwmon_get_preregistration_info(xe);
> +
> +	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +								"xe",
> +								hwmon,
> +								&hwmon_chip_info,
> +								NULL);
> +	if (IS_ERR(hwmon->hwmon_dev)) {
> +		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		xe->hwmon = NULL;
> +		return;
> +	}
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> new file mode 100644
> index 000000000000..1ec45cf1d19b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +
Remove blank line

With the above comments

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_HWMON_H_
> +#define _XE_HWMON_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void xe_hwmon_register(struct xe_device *xe);
> +#else
> +static inline void xe_hwmon_register(struct xe_device *xe) { };
> +#endif
> +
> +#endif /* _XE_HWMON_H_ */
