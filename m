Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B6EEE14D3
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Sep 2023 05:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjIGF0I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Sep 2023 01:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjIGF0E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Sep 2023 01:26:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7FF1FF1
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Sep 2023 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694064337; x=1725600337;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZbqXMlYKCHQUJbtFqajZ2YbJQ1yw/5V1upN8BiQoBdE=;
  b=mi+Jw+MCdXTQODkx8t6vaQURvNLQNsg2RzyTdt5lYZJOaE03yCY1rBrf
   aHwA2PacZNnCsoeTviLHAtPDur/mX2HrhZXhmvULoiFz8SL4tTtfTfXlv
   4cDDsCj/8x0awhu811ldATGgcflruaxIKYAw/OlNOzfHl/VA9fmazhPHP
   P+PrsuynxqpdrEbJ3+m+R5Np4CXOk2vVBxDThZlOBH70047GzlvjqcB+m
   edpAZqY2QRmQPMdJKe0v5HGILjaJxQ4ZU8yT2JHeCxfQXV1mG+r0WtNDV
   3vB+vLiPQHjHEwW4xYQWtxdodU0tcEsu/kljDOcZx1jFsLNTdkewgAcWc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463639032"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="463639032"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 22:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865475205"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="865475205"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2023 22:25:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 22:25:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 22:25:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 22:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnwvidkNy5gYy0WNZpNsfxf28Lo3LJzE8aXAvSMYrJ0e7z9MT16hS5W6NMDcdHqrgJ0pTKU9C2K+3dyZUue4Ya73dSJrLq9SD+yLqsy2LkGE+pbn8VWa1RoTY3cFmMFKwKMF2ZUXdwTQKcUw93kCfVbrBKkTa6Gakv2P3iEVifxyCMyjsSbIszIIUhiPWNKaP7U9pDCin7gotsAnx9pjvRdncpGH+yVX1pZoNsRU7SgbiKS6P0gC2y/hSOzS8k16XsbaPRVY9MXXfLTQqqGrlrpycjmRwxuc34y9g1UsX/N9mvMZ+lIGA5in5lLbwgojYZuNKnZ55bBBkob1IszydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwO6kGAVQ+Up6IwQYJFxbPLuMXFJcm72wFijdsJhkU0=;
 b=buJwCvOsxk/p9bI/Q/tPQaG89ERU8dlKr2Fgs5YL3Ha4DBi1cO/PQe7HdVARXnMkSCeb4NpVhl+YcH8YFKKOsuisECWvyuuK9K1ftt9gkB9tf1F/SYrBoM+lf8FY+AwoEQ5H2BPcBInkZbq8RU4J0heMP+UixrlSiGNG2BxNwiry/0DocSlY9cFsZ3SUTYcAXU5eAv2hlJPg8Zwb1/Ymzq8x0e7TiyCSYP2XadCLB0hYm+WBViclBYkfGL8pIIn/tO9Y1jCx0+wu8+i4dN7pohX4hxUMYYUvYd/8BoMDn8i3+6bfwTjMBqg1FLuiE4nNfa5ZryQ6fh/dUKhumwkW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 05:25:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 05:25:08 +0000
Message-ID: <098c5a91-99f6-eb85-7890-b9bb09e6487b@intel.com>
Date:   Thu, 7 Sep 2023 10:54:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
From:   Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/hwmon: Expose hwmon energy attribute
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
 <20230904182258.2291881-6-badal.nilawar@intel.com>
Content-Language: en-US
In-Reply-To: <20230904182258.2291881-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfcab64-d534-4366-3b28-08dbaf62cc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhtKb6xv19W2OF2oD0v9Ru06vJkRovS9M1LhiSnbQj0JEKrPdw2bk52YDpKzEDJBsbK8pPM/Xc0hx0oSFJwmYxK7pA7Et69sR8FXZz6xS9J+YB4z3eD2HXbCHKAK0CLamiXGSaHn1ZE71YQiKbktgI+eWWTspLdjzxGxFx/w8b2agrHnakFP1xpHQ4JYWVuFYLZOGHSntok741qC6aVhG7QeewqCpFtzDu3vIOteCXiW5ncb8MWSIJLK3/7420bpGNtM6MvPuW5pV3ddFKlXtY9jio/Hrigop1lW/nDTyr1go/rqxWhTS3IYRMouAvotNiJ4HHckTTOmfaxMX8RUP3Pa5TJCoFAgFV1MKL/xw2y3DbAWOG12/v0rrsv5md2Gfm3RhVIVX4Mx9cjQQXwP17GQzEUEiyGRPM8IQGTq87X5PATNfIKIJh/HskqopvASLzhPHQDTkq6jl8FkqAH4rSZps2ngjQskOyfG8npvwi+donMiKOh3Rl64hu7RF2JHfjOU4EcOnRxFdtF77fGUFvdF7cqpuGbc8LkZcVHqm1EAEXi7RtB5eAMXjCFJ2T+JTTxbqrNom649nBcGudjSJ7U1us40ZDeFYdW5ZY9Ss1oqZ5XWqImy8OckmXJbwrPGQ1s2WU9hZz8qCSX0YFqYUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(6486002)(6506007)(6666004)(53546011)(6512007)(41300700001)(83380400001)(2616005)(26005)(44832011)(2906002)(316002)(66476007)(66946007)(66556008)(5660300002)(4326008)(8676002)(8936002)(478600001)(31696002)(86362001)(82960400001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpNZTlNT1hhcFo4aE5INXdFV2NGdnRva2I2czBhRmw4WWozTE1YVTd4MVM5?=
 =?utf-8?B?NjRKYldxZUQzUDVnNjdMbzkxOUVRa2dkVTRnbGh4QkZrR1J4eEZMZGZRdlFi?=
 =?utf-8?B?UUNHMDhjZzdKZlpiZmRXeWR0S2hVNWgvNlBhZDRSaTBxcXJ4ZUlxQWNSRGRs?=
 =?utf-8?B?QUpwSTFxejhwbXpLeHFET09XYktGNCtIZFpybklNYnBQNk1kQlNEaFV2bDN6?=
 =?utf-8?B?U2RLU1l4RGFNZlJOZWhZU21KZndENVA2cEZFcDA5OG1jcHkwN3hTY1htbE5a?=
 =?utf-8?B?SzdHZnNJTWhmN0NoQ1JGc2F0cU9vTGdBbCt4Z1JzNzhMZGFvSzNwcE9hV3F3?=
 =?utf-8?B?M0dJSCtjNlpQYytFWnlweUZiSDFoZTJKTWVrUG9yTWtOU24vK0RZbjV6ejJr?=
 =?utf-8?B?ZzRRSUtPNGFDV0tNMW8rMWY0a2NPQVZaT2JQVnFkMFNlUm5BcTFOVUo0Tmdv?=
 =?utf-8?B?dVVIYjRaSWFhRFdlL2xSdU9ydDRRMDQrSDZDckRMcVo2bmxMK2hSaktqaHJG?=
 =?utf-8?B?Q0lQUzRXY25WNWtaYjNHakNaRDh2ZGVXMUNUei9PN3RMeE1ta3gxejhRcWRG?=
 =?utf-8?B?cFlYdXQ3U0orNlpSTnhoODdVT25NZmtNenQ4UUJ1RTRQakkxWUtkWHQ5bUpY?=
 =?utf-8?B?ZmhZR1hOK1k1NHNhSFlleUF0MkVZRVEyRlNTWlk2bXZFMk5LYU56emJjSDEv?=
 =?utf-8?B?TG96Zy9SQUovcnlERmJGOUZRaWNHNjc0RnE4M1pubi94aW9BbmZEZ2RsWUox?=
 =?utf-8?B?cCtrQk4xYlBRSGlLeXRZdXRkSVFCLzJqY1JZWWhwMlBnTStiSitETlVSYm9q?=
 =?utf-8?B?L0h6My85bFU1Q0llSGFCN0tRZGgwR2J3dFVYWCtuMEVoMGMrU1p1V0FnUDh2?=
 =?utf-8?B?VzRZcUpabUdUVW5RU21WTk5peEhkcjU5Y2d6dFF2MmNzbVUyMjRWNnJQb01B?=
 =?utf-8?B?NzdjQkRRcDVoc0RwVHlxU0pHUjIrQlhhTU0rTnZkL0JJdWl5ZExNa0RtdUpy?=
 =?utf-8?B?N2QvMEl2TDJmRjNnT0NUTEsvOEtFZFVQYkV4MHcxQTJ5UkpGMTJiMEJxdy9L?=
 =?utf-8?B?YVhWQ2lmaWZrVXlrak9yaEw4ektjb1JLQWJTdGdyMFBqbTZUeUZTcEpUeitI?=
 =?utf-8?B?Y0N0N01CbndrV1hpamtXVHAyVVpTUGJoSThFdDZRZ1Fxbk5nZXZXWW5NQ21N?=
 =?utf-8?B?UUU3Q2JTYlhUNkVVS0taL0JuS2F2ZERmRk9vRlR4cGovSEhickpEalRoMDZ1?=
 =?utf-8?B?OFlEQi9VT2JLTyszWVZkVTkxb3FsWEF4ZExwdk8zMkNHL05UOG5Md2Ribmxz?=
 =?utf-8?B?WlNNd0xJUWJ3Y0JWNG1CZDJ4TXZtUFUwc2M4ajdLZHFGaFdpem9ZTUlCTlV4?=
 =?utf-8?B?U2oyNExEQ0NFR0Y2OUNjT0NnOWpBbkE2S01iTFlydVpyWFI0V3FwTTZyNGR3?=
 =?utf-8?B?NjZ5Z1pJeEpDakQ0b1lLMmxkNUYrZjlRKzZFNER6Z2ROTGsranVlZGJHd3hz?=
 =?utf-8?B?bWZGcDN6WTlhNzZTRWZrN3hIMmlOdjUwRkVRekZqNDRuRlFVTGV6UTFZdkFy?=
 =?utf-8?B?cGNkR2dJaElFazZLTnNKeXlWdE4zc1pDMlExL0Z0Vm1tTzZYeWNYZ1N5b1ha?=
 =?utf-8?B?OTBjTnd0NlRPaWt3aGVsNU1GNndjNzc0WEFpa1hzVTZ3UXI4bzhWdnEvQkhW?=
 =?utf-8?B?RlZjNGgvNDdCcjdKUTc1bklheTFISGY0c0JVVWlBVmw0MmM5K0hhV0Y4TWhx?=
 =?utf-8?B?SVM2a0wwaWVvS0RFMGthUkQ2QVlpYTZ3b1c4RW5vSHQvTXVKemFpSGF5NFhR?=
 =?utf-8?B?aGFzS1pDY3RRRXFMUTkyZTM5bUowNmJab0tla0hmaGswQ1dia1NNSmVYSDVL?=
 =?utf-8?B?NlhiYmNtU0pSMG9RMDFMcnZxRkFOZyt6UUo4VVVQTkR3ZTlOUmFFT2RtQWww?=
 =?utf-8?B?UGM2dk1WejZJSzJKK2FvZ1hmNHVCVExjVzZ5Rk9VZVZhMC8zMHBDSkVzNDVn?=
 =?utf-8?B?cHZQNzRqMjJrTXFmci9kZTVNeE12YmJzeFM3WXhZRXJPMVV0eHE3SzdSaFFk?=
 =?utf-8?B?M240VTRlV3pXSEdSaWd3MGFsaHRYRmlUNFJSOEFCLzBSbVNTVjdtRVJ6Qm1M?=
 =?utf-8?Q?wT29u1r+2dsKjRpsgM3Mkk0Hl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfcab64-d534-4366-3b28-08dbaf62cc62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 05:25:07.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D62TtSatM9U7ZF8yNYWuSDwl6NelGUH0xuE9wA1Hf4pOMvzUMMX+igIY9qsQsOXg5fQW5XIUZR7NuPfMg28kHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal

On 9/4/2023 11:52 PM, Badal Nilawar wrote:
> Expose hwmon energy attribute to show device level energy usage
> 
> v2:
>    - %s/hwm_/hwmon_/
>    - Convert enums to upper case
> v3:
>    - %s/hwmon_/xe_hwmon
>    - Remove gt specific hwmon attributes
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   7 ++
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 110 +++++++++++++++++-
>   4 files changed, 121 insertions(+), 1 deletion(-)
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
> index 7ca84a710ce7..9e9bd4cceea9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -408,8 +408,10 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>   #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>   #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 6cd39a721bf2..d9d3115ade37 100644
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
> index 48621a6ea224..e2677e916824 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -22,6 +22,8 @@ enum xe_hwmon_reg {
>   	REG_PKG_POWER_SKU,
>   	REG_PKG_POWER_SKU_UNIT,
>   	REG_GT_PERF_STATUS,
> +	REG_ENERGY_STATUS_ALL,
Instead of ALL, can be renamed to platform/sku/device
> +	REG_ENERGY_STATUS_GT,
This is not exposed in below code. Should be removed

>   };
>   
>   enum xe_hwmon_reg_operation {
> @@ -36,6 +38,12 @@ enum xe_hwmon_reg_operation {
>   #define SF_POWER	1000000		/* microwatts */
>   #define SF_CURR		1000		/* milliamperes */
>   #define SF_VOLTAGE	1000		/* millivolts */
> +#define SF_ENERGY	1000000		/* microjoules */
> +
> +struct hwmon_energy_info {
Retain xe_hwmon prefix
> +	u32 reg_val_prev;
prev_energy/prev_reg_val ?
> +	long accum_energy;		/* Accumulated energy for energy1_input */
> +};
>   
>   struct xe_hwmon {
>   	struct device *hwmon_dev;
> @@ -44,6 +52,8 @@ struct xe_hwmon {
>   	bool reset_in_progress;
>   	wait_queue_head_t waitq;
>   	int scl_shift_power;
> +	int scl_shift_energy;
> +	struct hwmon_energy_info ei;	/*  Energy info for energy1_input */
>   };
>   
>   static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> @@ -74,6 +84,16 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   		if (xe->info.platform == XE_DG2)
>   			reg = GT_PERF_STATUS;
>   		break;
> +	case REG_ENERGY_STATUS_ALL:
> +		if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> +		else if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> +		break;
> +	case REG_ENERGY_STATUS_GT:
> +		if (xe->info.platform == XE_PVC)
> +			reg = PVC_GT0_PACKAGE_ENERGY_STATUS;
> +		break;
REG_ENERGY_STATUS_GT Not used

Thanks
Riana
>   	default:
>   		XE_MISSING_CASE(hwmon_reg);
>   		break;
> @@ -194,10 +214,59 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
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
> +	xe_hwmon_process_reg(hwmon, REG_ENERGY_STATUS_ALL, REG_READ,
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
> @@ -371,6 +440,29 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   	return ret;
>   }
>   
> +static umode_t
> +xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		return xe_hwmon_get_reg(hwmon, REG_ENERGY_STATUS_ALL) ? 0444 : 0;
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
> @@ -390,6 +482,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_in:
>   		ret = xe_hwmon_in_is_visible(hwmon, attr);
>   		break;
> +	case hwmon_energy:
> +		ret = xe_hwmon_energy_is_visible(hwmon, attr);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -419,6 +514,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_in:
>   		ret = xe_hwmon_in_read(hwmon, attr, val);
>   		break;
> +	case hwmon_energy:
> +		ret = xe_hwmon_energy_read(hwmon, attr, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> @@ -470,6 +568,7 @@ static void
>   xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   {
>   	struct xe_hwmon *hwmon = xe->hwmon;
> +	long energy;
>   	u32 val_sku_unit = 0;
>   	int ret;
>   
> @@ -478,8 +577,17 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
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
