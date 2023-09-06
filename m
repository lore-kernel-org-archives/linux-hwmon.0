Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1A2EB8FDE
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Sep 2023 14:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236549AbjIFOqG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Sep 2023 10:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbjIFOqF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Sep 2023 10:46:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B18DDD
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Sep 2023 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694011561; x=1725547561;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rJmp1VOVoLzFfvWBAy/lfyvU19n+PvCr1sMBZ62phAk=;
  b=Fgad7TMEH7HJDjDsjyRmspNWG3eBvAgf9sKUTAI/OxpPQcze1vstfPrE
   +G52S+KmyoraDfrUJJter+w0sCVM0FLcFHE8zZBYFH7otQ2QyWAKMN+NW
   SgKMr5CkBFJLtUParucwLzo/P4vQ04ukZ9FGaWK+10gDMClVeUwfJ/aTZ
   TzS6ZqisjE2P1GVSXBoorRcVWR4SxXmKG2uf2EptqS5a/69rI6VkCtYXa
   NNAwaf0J5+EGqxdxf3HPGOQ6snpdWmG0H47348s8OHOA+1ivGPALVf/IF
   SdH/ZHbZDiWU4F2cE2UyIJDcQrlrfAGH4J7FmUClrUCGpGr0qPSm7kvQk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356568548"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="356568548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884734965"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="884734965"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2023 07:45:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 07:46:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 07:46:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 07:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvYU6368ZwCg5JRwjjbUbNU0uSPG9upJCZNOX9PX0cYCq9h7/clRtmrjWjt7DSptJDq5fQSjPBPeOiW6QZcLDxu0WyEAxq1whXu+LLGXBE6cJciKXUucHAX1F+W4oS+bfUAbITWfaTiPD0kKPOOR1gVqUJD7gkdG2iKXSTN5gy8ixJqOqXkRY3Db06Acm2De9ERQhGwswbsvKUik6pfIbr4zTRGTYTgccflK46v6x6+s440BWSS340k0qiIpHLwONrqfdjZSYBds8ynGiU6RC3R7Ec6aF9feXmGy+FYX0rUeTdwQM6l5hrz/zIGQWUN0cu14LtgURaCuzRf1Wg60DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTYU2ifuT+FJ8ZIfl7gwDwTAn9VcCxFUpe52p7nCaEQ=;
 b=Kho87NMO3YJgMHSnVgu2GcLlA/vP3Z+5z/OHBJWUwIfYhdW87UB8H3p5LEeCxVxKXTCOsVwY37CWURzDPTJRz+EVKWTyOX7wZNXMoSJVCG5I/6/aC1xGBW027iNOZhXYcmUwu0l8GVbtvercAH5yUi2yOg0F1ZqlF9RUYCSB37xRBMdeHlmhVFZHrFFI06154IZlDlZWCp4Kysc8kE3KudflBlCPH5QgTWW8qPJ697oVk/9MhqUFLQJLoYxp+dxReLA5Rr/8Q52W7Jux054d4macXNL2ZvkpfDMemFZoflfTv9lOE7/5seAfnAyvzLtcVnPOHq8tNgNh4L564ZmegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:45:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 14:45:55 +0000
Message-ID: <f5abb2bf-2e5a-eee8-7807-12d79f3e3fda@intel.com>
Date:   Wed, 6 Sep 2023 20:15:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/6] drm/xe/hwmon: Expose card reactive critical power
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
 <20230904182258.2291881-4-badal.nilawar@intel.com>
Content-Language: en-US
From:   Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230904182258.2291881-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: 3910648b-40ca-454c-eb10-08dbaee7f91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPA0DgKlGK5MoibpEUVykzicTrHS1/dWI8Mm27OmnHmqPmRjTPJHg5hs4yOHyn2msItYqnMw+oZhs3CGFEwnlrs8LOHQcdC0PxSwDqfSUL8c7nHEN6u4/bTxTImhGiodXPiMX5MnfMsoR5J3gedP3ckJ87auK99aJMlaHK9B7FlNwztaNaA6oIbyN4NH4rJk2J1yQ3vyB8/mapHnaJ1gN8bUo+QWT7mSyDFyURvR4ONjZxzL/hRfSer9yK9xysFsABL6vI5ZMKP/2S3XI+ohdyBW47hlSX9KKEbXHcjXdxHKNn0hkwy2Mse45wMpUgloVUJb6WGdFMwxo/zedLueNrXyPOBNQqyCl2JtNjO24dGJUh8nkkBcSibcFqSINYrr2wOLPvJXb9vkkLxZrpDlRICdPQnfyNk0jIzJHa6qjby5ala1DSKhmyEXfDh4R41LIjmCFwzLkZppnTC4a2XwNl2odF8xoQZk4/oM5Y3uTk55pJa/quz8Onw60/3wiqeU0qbBQPiolSelaGMlLdQmoAJn0cL22SDGPLUuC/NtYs4rTmt1CWoaJRdXWQCehU7qC9FbD6hqxVqTo9my946/2h95TtPKgKsl3n36I7Pg0cto9wXWDTky4TwAwM0VyzRLP8wLBrv+nnt0tFod32c4+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(366004)(376002)(186009)(451199024)(1800799009)(31696002)(86362001)(478600001)(66946007)(66476007)(66556008)(316002)(2906002)(36756003)(41300700001)(5660300002)(8676002)(8936002)(4326008)(6486002)(6506007)(53546011)(6512007)(26005)(83380400001)(44832011)(31686004)(2616005)(82960400001)(6666004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCt1R0laM1hubzlzWmI1d1hYMkxBaXpJYVBwbENmSFVGZW5YWEltZDkyOHQx?=
 =?utf-8?B?eFNsNTR1NEM1NkltVzN0WVNmK29mTkh2U1BaNnBhMHNQTjBtYzFWb0I1TkM1?=
 =?utf-8?B?azVMYWdhdklZQ3Erd2FVWXJidDBHZk5wcS9vT09vMGxnYVNtMTc2R016bEdu?=
 =?utf-8?B?cVlBMTNnTlBibTQvb3VIUVpOQ0dNaHBpRWJFRjhMbTBtSERvTGZweDc0clky?=
 =?utf-8?B?VExKTWQvWDJDdnVrYW5xaGJvYmd4N3JhK1cvOE51THM1d2FWM0FRV0xwTVZi?=
 =?utf-8?B?ZzVaUVpad0hUN0pPQW5SczZENUo0eTl2Y3ZCOVd5azRQSnpDZXVuL3VQTUE5?=
 =?utf-8?B?RmJiczFXNVJFbHJVdlpram5jb2dFRmpidzNHeDJuR3ZnaWtiVmg1SlNGdndo?=
 =?utf-8?B?Rlo3em5jZW56RC9hNlhFa3gxK2RlcFFxNWRBbjl1V0lNSlI4NTRtVzFkbTBi?=
 =?utf-8?B?NTFRVFdTM1JhYkJrWDB0aHdzU29pb2tpektKcUh6NWFEZ2hORzZ1dXBXeXp6?=
 =?utf-8?B?NTVMSmxBM0JIY2x2OFFsMWdReHMvVnNsREQwYnpaTzlMMlQxQ0piNUtWSUhZ?=
 =?utf-8?B?THZ2RGp5c2RycktuVTR2dnNtVVZJUUU3ajNKaEdldkw3ZUE4Nk1yeFhsOG5D?=
 =?utf-8?B?b2x5UVJYQWEybFB2bXBYUWhlZmwvUExhcDFWbFpzL0RoaGdwbWVGdElHUWxQ?=
 =?utf-8?B?YVZVWFhvT0dMYWtlclJ6QjYwS3crbmJCa2ZqQ2dmWjhuenZndy9RWFhBSXRi?=
 =?utf-8?B?NDl4cVJ2Nkk0aXhkeUQvcDhRSXlKT0NFRHE4UXAvMWpDYUQyMnlvenVMeUJE?=
 =?utf-8?B?VGJwd2hKT1F4aDJUQnhkOXVnZzA1L2tQTWQvNGFJSi9LdUZ0ZVhKalJ0MmFx?=
 =?utf-8?B?ZkwvUTlNTnJIM3F5U21RcnlMUEdrdE5UdytyODFqOS9hMWFBb1hDZFpLL3pm?=
 =?utf-8?B?QloxdFR4NlRuTjVleUNhZTlPeHp2VUZhRG4rdzZsNDBtOTZtOTBjVGc5R1Vh?=
 =?utf-8?B?cW9vRHJkMUY5SE5SRytKaEdIK0R3MEtMMER4WmZ4U1h3Rjk5NUVacG5wMTY3?=
 =?utf-8?B?Z1BRUkJPZkgxcTEvZEZCaHpIdGFOY0NWc1BCVDZJUnRXZ01wVnlmZjU2b0Nl?=
 =?utf-8?B?WGU2eTJvOUlGR2FhLzFveE01aVZsNHpUQkJNcHM4ZExXUkdvSlhiTnA1bTlE?=
 =?utf-8?B?YkpCQlBhNHZuNENkRFRmSXpoMFREbzg4b2oxK1ZRemZsMDFVUmF5c1hlNGQy?=
 =?utf-8?B?OHhxTTFlQkRScGhEbjhzWXhqRUlJOHBCR244dWZKWi9qcDRla2ZMczVXYitJ?=
 =?utf-8?B?a1U1QW5Xc2hTaFdFa3R4UnVuTVpQSkozdmNVNEFVY3I5WVBJRjFMSVpML2lD?=
 =?utf-8?B?SmhDWjdzZy9rREhlMGF0cFZraUlJNjRXY2tGMktXMUtmc3NzRm1kV1lyRStJ?=
 =?utf-8?B?UWNrVlZiUGJaeHJ5NWVFK1JCOGYwVmtvRTVqbnNRMGtIODk5WnkxWDVSNnVG?=
 =?utf-8?B?QzA0WXFwYmpNQXNnUDJZbkdYeG9TQ3Z1MUZzcTQ0djQ4bVhHcHZaTitCTlFZ?=
 =?utf-8?B?Y2haQ1NkZ1p4NE1kUXhNS2hQNy9UeFdReC9MeGtvaUtzaDAzbjFQTS83WlUw?=
 =?utf-8?B?V2ptNC9lSzlhNGdEdHEwTy9yL1JvV3hHTkwxZWRmZERhQ0ZpcU9FRk1OWlpT?=
 =?utf-8?B?bmlEd1hxTjF0NGx6UWhwbzhrdkVvd2FMV0tndkdXQy9SRkJOQVN3Z3V3TDdX?=
 =?utf-8?B?c1BLMWJZTlE4T2xSNDR4NnRJN2tpcm1aY2FsRVF5blVrWUd2WS9WM2l0emJI?=
 =?utf-8?B?K3k4VWppTUo1MVBXNjVLbHpzbmNqakh6R1FUWXZTM0dhb1JGNGxuQ0hnbFU3?=
 =?utf-8?B?QXVwWXRleVhrZ25CT2d3LzdtSFZ3Qmd1YjB6MFhIbU05OXFZZTljTWpCWWdZ?=
 =?utf-8?B?TXpubjRUdTV6b083S3JSdjdMYzlrbmJGbEJrTXp0djNNVnZwRlQ5d2dyQ1Rj?=
 =?utf-8?B?RGtzeDlZSi9FRUcrUC9WTjBuZlNLVUZlNllxbVZqTnV0K2MrM09YT2YrdVQr?=
 =?utf-8?B?Yzg4Y0tjYk9CS3g2TS9KaHRXT0NTS3NWcEJqczJ4aVMvR003ODVxc2tOL1lM?=
 =?utf-8?Q?m8/gFqupS5SnkRR1LRrfgznhn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3910648b-40ca-454c-eb10-08dbaee7f91d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:45:54.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRw/75UZXlJMacrYwmR++NScOTZAKTBay2DV4ptmxBlznd2WvfBVl4R7SMgMmPWVnoFyvIKd3erGK5ECp4RqEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 9/4/2023 11:52 PM, Badal Nilawar wrote:
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> 
> v2: Move PCODE_MBOX macro to pcode file (Riana)
> v3: s/IS_DG2/(gt_to_xe(gt)->info.platform == XE_DG2)
> v4: Fix review comments (Andi)
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 105 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
>   4 files changed, 142 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index da0197a29fe4..37263b09b6e4 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index d66d633724a5..12298a0e8636 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -12,6 +12,8 @@
>   #include "xe_gt.h"
>   #include "xe_hwmon.h"
>   #include "xe_mmio.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>   
>   enum xe_hwmon_reg {
>   	REG_PKG_RAPL_LIMIT,
> @@ -29,6 +31,7 @@ enum xe_hwmon_reg_operation {
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    */
>   #define SF_POWER	1000000		/* microwatts */
> +#define SF_CURR		1000		/* milliamperes */
>   
>   struct xe_hwmon {
>   	struct device *hwmon_dev;
> @@ -184,18 +187,43 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>   }
>   
>   static const struct hwmon_channel_info *hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	NULL
>   };
>   
> +/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
> +static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
> +{
> +	/* Avoid Illegal Subcommand error */
> +	if (gt_to_xe(gt)->info.platform == XE_DG2)
> +		return -ENXIO;
> +
> +	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
> +			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> +			     uval, 0);
> +}
> +
> +static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
> +{
> +	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
> +			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> +			      uval);
> +}
> +
>   static umode_t
>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>   {
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
>   	case hwmon_power_rated_max:
>   		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
> +	case hwmon_power_crit:
> +		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>   	default:
>   		return 0;
>   	}
> @@ -204,11 +232,23 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>   static int
>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
>   {
> +	int ret;
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return xe_hwmon_power_max_read(hwmon, val);
>   	case hwmon_power_rated_max:
>   		return xe_hwmon_power_rated_max_read(hwmon, val);
> +	case hwmon_power_crit:
> +		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> +		if (ret)
> +			return ret;
> +		if (!(uval & POWER_SETUP_I1_WATTS))
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -217,9 +257,63 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
>   static int
>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
>   {
> +	u32 uval;
> +
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return xe_hwmon_power_max_write(hwmon, val);
> +	case hwmon_power_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
> +		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t
> +xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> +		if (ret)
> +			return ret;
> +		if (uval & POWER_SETUP_I1_WATTS)
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_CURR, POWER_SETUP_I1_SHIFT);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
> +		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -238,6 +332,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_power:
>   		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>   		break;
> +	case hwmon_curr:
> +		ret = xe_hwmon_curr_is_visible(hwmon, attr);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -261,6 +358,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_power:
>   		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>   		break;
> +	case hwmon_curr:
> +		ret = xe_hwmon_curr_read(hwmon, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> @@ -284,6 +384,9 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_power:
>   		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
>   		break;
> +	case hwmon_curr:
> +		ret = xe_hwmon_curr_write(hwmon, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 3b4aa8c1a3ba..08cb1d047cba 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -22,4 +22,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
>   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>   		     u32 reply_mask, u32 reply, int timeout_ms);
>   
> +#define PCODE_MBOX(mbcmd, param1, param2)\
> +	(FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
> +	| FIELD_PREP(PCODE_MB_PARAM1, param1)\
> +	| FIELD_PREP(PCODE_MB_PARAM2, param2))
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..5935cfe30204 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -35,6 +35,13 @@
>   #define     DGFX_GET_INIT_STATUS	0x0
>   #define     DGFX_INIT_STATUS_COMPLETE	0x1
>   
> +#define   PCODE_POWER_SETUP			0x7C
> +#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
> +#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
> +#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
> +#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
