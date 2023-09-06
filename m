Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D90EB8FAF
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Sep 2023 11:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbjIFLOI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjIFLOI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Sep 2023 07:14:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A27BCF1
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Sep 2023 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693998844; x=1725534844;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wY4it8+M4OQCSquFBHnLTi974sjx93ykorbrY8zY+7M=;
  b=CcqGe6Ooaty0ieUvPDGOeERddWIpb+88TzUZf1bFZVeZgCkmFgWTOyfX
   I7cnR/8O+It5q5vn+oq0/5IE3aX2B1kvFUrFQoSBfTAiB48Nv1hgpdODk
   HXpSTa1PbVrLKbjKi6CNDzudFfc9s682grKgnCycHkeJcUvLVQ6FyF9D+
   kHdPYuCkcQkiGt8pLCAgWiA9+5gbzXyPV1QAHt1E62HZKs/2U6CXFjNCs
   kitaLLqpiNYfUqdsWJ6SG0hNH+cFzvZxdguKWNZygB1aZXNYnAkkTb05T
   CMIkFvK+RI21LRUi5bVnwPXMn0xiMWBRgTltHvovVbUTOaH/ToHcs4rO7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375940360"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="375940360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 04:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="735009205"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="735009205"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2023 04:13:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 04:13:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 04:13:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 04:13:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 04:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxaHcG3z6Ov7AMZBNADh/61k+nVGTvfiWFBf+GHBvoOzizXzGny6hQONnTLQGulir5JDgSQXAHefeQjy6UKgsU+akanjOkrhXScgbbhQmHJ0YOoqiB3XMCEOhwrWUJ815HbybetNlQrQMNtChSEcxg2DDnHylat3TCsorK7l0t97edx+CJx6WEmjUFfOZyOxyctWqZOZOjMcAeH7AD0RxBnXQBEOeWIzESxWImjN6nb3x3Ur/K+mJlEyg8tm35Sm5nqBoa5TJcNTVuZMbEkfbaohAbEUfqXtYBFuK2DCJajVavyrDsY93dH6PBYSpZSlUxDMHoS/Zm3YKKD0JiV1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPRjeigYooVL1a6WgDR/tcfjALHBrFoDOQdSOzNpcac=;
 b=hcDVDpLHsOqMYcbgVXnxAEWcAFFSr4gcDSuU9qEr4PZuczMRsw/tTB43+EAyP4tSUY5WSiWADBuI1HK7pgSYRUA+hFNJXGFPjrSQo81OMJEfBvmo8Ow62i9+CUzVV0dqv4h4Ac8vMhueXtZOu3e2YylUYKYKvK8wT0sO8R1uE25ncVkjsDKSzUUGP+VncwZ8ekvb/+OvQMS4QgKw4YyRgPZvPq+7eEU+xHk+R9nRRm4tXNOccFW+ynPP1A2yg5BtFO61ar6B5SBc0dQjPzhudHOktrLb6Dmm6sTu2Wtxr02RQf04NzrA6G5fVbfJanTH4G36Akv3f1/PSFV5wabC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 11:13:46 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::c0ea:337:35a:a9cc]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::c0ea:337:35a:a9cc%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 11:13:46 +0000
Message-ID: <25e2f0ea-48f5-7fe0-4b7a-1e8d91b6eced@intel.com>
Date:   Wed, 6 Sep 2023 16:43:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Intel-xe] [PATCH v4 1/6] drm/xe: Add XE_MISSING_CASE macro
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
To:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
 <20230904182258.2291881-2-badal.nilawar@intel.com>
In-Reply-To: <20230904182258.2291881-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::22) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: e1362834-f72f-4976-a3c7-08dbaeca5699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAGgVp/aUiOwNOcHgpEvb0IJBK3jpyUSPZ4ezeIzgJcCZ60u1QZWJ1rURQh6ir5Oyuro6vfLqRkmh+jYMG6qjfOj2GQDLOmVfcsNhaXhp/ElPQ+19fg7tdKDthpkqYE7hNkcob3xTi6y3XI1Evv8StcYVUM11LvsUMh3DsG2yfpjjr9e3Xl84KHbJxFMKcdrkG16r+BVUR5vZFtrfSFBSQZN+JBtXdVjtqz504fWTRGe1AGf2y/zFTuGXvhzNOSXg5sYAZ64aI38wDzuaGpO/4nnZV8fqqI7fW++Gu6EkP8tONGCf6K24POkLBdR+leTxwilr5h/5VBdY4hxy/gWSTRT3d/GLIMMzk/3AAyO5kgblIOuwi/f2hYQJHMWEb/VV7/q7ey7jca+y8GdfuHlaGNie+tKHXpraT25Am6874bq7I+6deA2jjV9ZtF45OioHSX2hdcU0+ELvxn1VtFCYf1VskS/1vpSTMyTu5rvHBaaYxtVOGcP/NdAbunjdqK/J8OEVMjSw1PJV084km2SdgSpnHtST/MFJTk3t7g0gxJ8LCeeDeCf9NNujGzfU5vNGvWsyJBBcVmu5x5zCyX7hsk9NNJB1fR3DHSMtep18AfhfwW7mjK7bfJ8fUy3pzXRw+E4OXM4lnwASothoN3pTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(8676002)(8936002)(4326008)(2616005)(41300700001)(26005)(5660300002)(2906002)(4744005)(6666004)(478600001)(316002)(31686004)(6512007)(6486002)(6506007)(66556008)(66946007)(53546011)(66476007)(36756003)(86362001)(31696002)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckQvZlNydVdTMVJkWWJPV1ovakVDZjVrTCtrVFkzYkI0SENCMjMzSHJhOGE4?=
 =?utf-8?B?S1BPcU9PWExNUkg2ZXcyRXN3dEErcGdRMGYyeXM1a2MydGt0dG83c2pTbUF0?=
 =?utf-8?B?bGcyQlFTRkNZb0FLUjNpY0lmVS9hdGM2SWNWWC9Wamx4RzYzdGN1SE8xRjVX?=
 =?utf-8?B?UEM3UkowZTJ6YS9aaWd2dVQ2THluMjQ3ZGNubnBzd0pTdEtab0dqODE3UTRI?=
 =?utf-8?B?b2pLdzQrTHgxSEp0YmFpbDZwUHpaUTRUem9uOGVEbFRiNnl0RzQzUGVYUmF4?=
 =?utf-8?B?THR0UmlQMmVlb0wyc1ZReUxXSDl3VmN5RmpvbVRxeXU5cHB3dkJZTVUzN2FX?=
 =?utf-8?B?ZWl6eHl4Sm52Z1BxdnMwdFQ0cUxhcVdONXl5S201ek5RVWF5WjBVOUpaNm1K?=
 =?utf-8?B?QnpzVDNCMEpMdmF0ZFdsaEJBVEVkZTRGN1dwVU9jcm9jNjI0VStsOGo2cXRK?=
 =?utf-8?B?bm1yYmhjM1llZVIvV0tSWG1kbFM3cXAycytnQ2tzTU9qNzV2RXdmcFRBR2h4?=
 =?utf-8?B?SlM5STUra3AxalJXaE8wRUw4cVZQeGI5VkNsWDV5YlEzSXJXUTc0ekdDL3hv?=
 =?utf-8?B?M21IZ1RJdmFEVk9jbGFsbTI5bXRFNmNjWE9WUUltblhuMTBLcTkwZWNoeWtz?=
 =?utf-8?B?RVptbDlyeDdVc2pJc2dwRzlMNjMxZnBpWVM2d3hqWC9qUnVsaUFMOEZ2OE5W?=
 =?utf-8?B?eGJvWSs3ZnlaMjZvenZNd2xNcmd4eXhTUXR5R0dDM0p2WXcyNTVEYm5QMW5T?=
 =?utf-8?B?K3RxTjIvZnEwN3l1OHVqVCtzOHQ2MzloUG9INW0rNnZUclNITDFyOFNSWEJx?=
 =?utf-8?B?Ym9jaDBOSlprRktRYldjbGsyM1Zkc2IzZHl0TUQyaTNyWnlFeVZJdXBoVzBj?=
 =?utf-8?B?RVVFYmExU1gxVVFKQTJQNy9kY3Mzbnl5VEd0eEUxcXoxbXVMNkUyMjRxWVB2?=
 =?utf-8?B?bENSaFNnTzd6dXFSdjRrd0NJYjN0YjJmRGk2MC9IRUZqNWpIY2o1U2syRGtx?=
 =?utf-8?B?bU1iWk10amxacEVENEUrTUhzemJRT2dNL0ovQ0Q4V3Q3NkJkRXZIOTNSZk11?=
 =?utf-8?B?WHJGOWpCRHVISEdoeWw5d3pNTTN3ZGJVQmhTRmU2TGtqSHU5ME9lL0NPUU00?=
 =?utf-8?B?TElZMHF0V2svcnNQRHpPR0liREhvQThYdHRHdUxQQi9ia0E2MVhPVnJQZnJM?=
 =?utf-8?B?VlVyZWcwM3VpNzBISzdQc2dOTTVtTDV3OWRHczk5Q3NmK3UwbmVVVkh3WkVj?=
 =?utf-8?B?TDBrZ05GWDlBUzVVRDNxYlJ4dzVYNkpmSjBCWkhwNWFrZmNLVE5pa0J5Ykl1?=
 =?utf-8?B?NFh2aVN1TzRKYjA3RlVCVFRRa2ExejQ5OGJncERQaTRjT2ZmL3FRSE1rVUdC?=
 =?utf-8?B?V0dvQVgxSTMxVnBtb2MyakVSbTV2Z3dJQkVSRWJJWXZWcmFWVkpkV3VBTlgy?=
 =?utf-8?B?dEtIOTZOVjU4YmpCbGxoczI3dXZlZmdHaVc1MWRzVzYxWmR0M0JTVThQaEFN?=
 =?utf-8?B?eDNaclk4Tlo5SUV6UVp4TEhmNFhsVGxMbXhNZ2d1VzZlTWIzYVdqNjBRaGJV?=
 =?utf-8?B?M21TWDB3RXdBUmRYZTNRSHVYT3RoVEl6M0N5NjJZSkpqL0lubVlxTmk3U2pi?=
 =?utf-8?B?OHpueSt4TnVCUmlJaGVvUWlMZFpLSEd6UHVETFYySDZQWVBzamNSVUVFZW9W?=
 =?utf-8?B?UnZTb1NmbEsrdlR4bDZsOVdJOEx3NzFZRk1qUmI3ZlF1U2pFTkZ4U2Y1TWFI?=
 =?utf-8?B?VmM5Y3VZYTZJaS9nVVd1WWJ3Ui9wM0VsbUx0cDJITEVoMkRkbE05OTdkcnFn?=
 =?utf-8?B?aklDS1BuTlNpUlc2ZHAzRVE1eWQ5Z1VXWG5rb09jcUE3YnlDeWgvdkFZL245?=
 =?utf-8?B?bGZ1MG54eG9zZG04YUdUQnFzdDVLUjRiQURoVUhQTjdlOWdjYWV4UVRSamdN?=
 =?utf-8?B?Z0d0eEh2N1EzaVkxWDMrd0NRN0wzb2FiTkdldkRxUUhOTjYxZ3ZhM21kenA0?=
 =?utf-8?B?WW5VZzd1ZzUzWFM0N0NUcDl2T0ZUY0dIWkoraDZDSHEvb2VsdFNUVTZRYnJN?=
 =?utf-8?B?U0kyWm9LUXVWRVJwMkg4R1pKNVZsTFBHTm1mTU1XNXdVNVRmQjZTMlI5UjB3?=
 =?utf-8?B?ZDM4TFdDR29TV2xOd2ZqazNTNWNnQ095MnB0WnI2d2NZaDhCVG5Rd2NURzRF?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1362834-f72f-4976-a3c7-08dbaeca5699
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 11:13:46.6145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61Th/XbwdgzEblsuYjgzQtRFrDr5Xu+1PXWjOsblP9txuprPVQBsbGFL/qZ9DjuceGosmflZ7S+YEwkMgccEPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Andi

On 04-09-2023 23:52, Badal Nilawar wrote:
> Add XE_MISSING_CASE macro to handle missing switch case
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_macros.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index daf56c846d03..21ba859d5f80 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -15,4 +15,7 @@
>   			    "Ioctl argument check failed at %s:%d: %s", \
>   			    __FILE__, __LINE__, #cond), 1))
>   
> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> +				__stringify(x), (long)(x))
You suggested to reuse MISSING_CASE from i915 but I couldn't find common 
place to move it so defined new macro.

Regards,
Badal
> +
>   #endif
