Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5387CC04AAB
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 17:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjIURKs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjIURJ3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 13:09:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549D06EA2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695315930; x=1726851930;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7d2BlqxYd06TefC9ED9BRKDTXrElIvsqrar7DGlWzKY=;
  b=BSsRRVFiOYA9IRq2X1JOE8M4MpU8WktkhR1ItVHhl17DKtKQ0cV/UAY0
   DfsyH6x41kRrizB1YQsIGSx8zs+TIqrUob/OWywtnZFukYVwLFUOsWA1W
   YS9NXklir4/tkuZTpN7UjXlhzGVTKmS6QatL1eCTqFuBUDgH+WYpworf3
   q637i4AZbW74nKar4TfkQbDzdvV7MY1huEUSj1eOIv/uugsaGp8FfcvIO
   1Kk3fUgj3wUm5FYEKyP7Qpd5x+xNw77YQumS+B4Q+LcZmt/S1zEW83gS1
   HbvDWVCyzht7BGQ52C8BhoKFDUOOattW1TNrx1PS4TyOYTApTChQ7ue5I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466804934"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466804934"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 04:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870781198"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="870781198"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2023 04:43:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 04:43:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 04:43:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 04:43:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 04:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE2hyZ3Nhd+bv7ugWDkfUTj3l1sfuid0MuCdLXPm4utHT2jmngW4JpLM309IgEfl7mW38ZhWjf/8qCVJ1ohLuYK7dWgwcPtb8KXI0MkpWgQRGCv8n3qhVvqpMWP5/D7QXEFzSRdWwut0eHstQLtPKzQCFr6dN8vI97cfKdn7qomnutKsFTAVED/7T2ZjPC1zfPwEBJAGXFrkarsYmy/kKkaHtCXt2VMDxj1Ao5ZZzRhuaCevEWFrZ8u4jx++n190h5hIJKI1iVSx8W3peNEJVwXfLkQ3hScjOH3p2HD6YoU7riuOt4lXJkqPJGeOyezP3d9Kl0kNHjZs39WPG1mnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoIWZ3DAUND0IUeL8g9xfikDRTu1500h5AywtdVKv8o=;
 b=YlQtReRH2Upgg+K1zCvXv09dr6o+a1pbR1H62DkLqSLlUVNCwloCfyODuap4sg0mY8kM0A+JVz2ehAdwqQi8dmfeANuYneVZahYUK5ChmodJSanVRj8r+3r1RaveWH5yidRf+5P+VdPRkckv8E2FS9kWMQLGorrNCvUWm9RBzgbUFv7DWmjgeoO8/oGCogQy0W93CtIQ0kCZg+1R9hz//p7KXPIw6SF1v6ky8PVUPEM77bMBOykLf1aZlRcsx6bfxY74KG+W96ofg8VSslA6lcnBCtJpoPuept6kTHEy6XvKrdGa3JlwiD+bSnst8xyYWfytjVqqAgWRM6VD139OAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 21 Sep 2023 11:43:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 11:43:28 +0000
Message-ID: <a5ae8a00-4ff8-495a-851e-9c830131ac35@intel.com>
Date:   Thu, 21 Sep 2023 17:13:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v5 6/6] drm/xe/hwmon: Expose
 power1_max_interval
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>, <rodrigo.vivi@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-7-badal.nilawar@intel.com>
From:   "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230921102519.3355538-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: f955520e-c557-4629-ebcf-08dbba97f900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y30IO0IBk73mVWFE8AL5ul8kbFL8Mj6z5nc3PqohlxuwyY6ReB75UuQPCf/lzPpWyCgVP/riMC7latS/jR9rEF59pJolzH7jCURVqVbG+3OahSMXGRx53ZT2+P7++OT1C7yl/NPNTHBlHm265KHP6pXhYbN2YKTs/kmYypByEhWgD6hn1N2qoXHbG0fIldvhXYgTF+wc+H2hPQFqbhFIGCCrhh++0oiPlFzm2axYxZ2BYgk6tNUGJ96iYHc5IPlADVDOLnO4dThW+5NhRrqzZ4NiFIGteq+JpZj4zI/HlP1bAIBqP0iP7oDbi0wZCHo+Efj9ab7Lz/UcjUmfN+gFEGv1Z4Zj1+L/lQ4DG5bujIhjEWcGPRGci691/msNc5bYjTKqU30tSEnMWeo8hzTLxCye20r+VsWFbP6zZ1ffLtAG2vzu7lMzhY44QTDqm0ZtKDjQwPRzGWpLumpyrz62kD6BdBdHjQD1dIvu0qREqwlNrN3IlT0q2M7kRPOYPs6W5r2Ms1RmTJ017ofg/4YPzzdoYtmGoV6OxEaUJfFgSsZFk1D/GQfw9FzpsKRAC3b1SfIkIEK5TBlFsMQ9HC33N9uy/J9aaaTiizWD7zcZXRrra4kzQFYw9DhhkB0X18ja0fMR/TWrpfX6vVblP8nEvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(186009)(451199024)(1800799009)(2616005)(107886003)(6512007)(83380400001)(26005)(6666004)(478600001)(53546011)(31686004)(6486002)(6506007)(41300700001)(38100700002)(66556008)(66476007)(66946007)(316002)(82960400001)(8936002)(8676002)(2906002)(5660300002)(4326008)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25Ubk1KdEJWNGd5NENHa2FxVkhaTlI4WUsydVZ0K3FWWVB3Y1JsZWtZQTEx?=
 =?utf-8?B?Y1dvcXF0ZUM2QmRUajJibzNtdjJCbEVTWHlNVUk1eTRBMXN4a2p5VjkzSlRv?=
 =?utf-8?B?SzBzekRqZk9pcFovYWdsODBtSkJ6bTZpNXVvMnVsaHduQytIOFlNV1JyNGg3?=
 =?utf-8?B?ZDVXZlBtR1Rrb0k5NGYvaktTdndiNnc5TjlFZTNVdCtrNEZ4cSt5ampNYWNF?=
 =?utf-8?B?SlRFdW41R0JpQUNaVkloWmtCTWFHdUFuMkgxZXh1K1RyZmhoT3k4N0E0dHlX?=
 =?utf-8?B?WGFELzFWbVptWTFNa2U5US9TTTh3RjYySWNGSUdYenlSaEJRak05SDdhcXlU?=
 =?utf-8?B?WFNhU0V4K05kWGZmRVJDcUJPTkl3QnBUOTQ1N0x3OE0wY1ZVY2pwaVhCbHBT?=
 =?utf-8?B?MjJuWWcyMHlYYTRwT1p4Ym5KaG02ZnR5T0tZZ0JpS0xqSDlUaXJxaXVJOGRV?=
 =?utf-8?B?UDFpUURtd2tEYVA2QUs0cHh4SDZaRDZNMXQwNTNHeHJieC9ubStGVFdmeG1m?=
 =?utf-8?B?eXRERzZQWmxnRkQrRVdpckVSNnFIdHBRTk9SQ1VhY3FwSGhwQTE3UVRKa2FV?=
 =?utf-8?B?d2VWdGlqUXdLQ2s1cUFrZ2JlclZGYkgyL3loV3M2VjZYUWNYYXVmK0tpSy8v?=
 =?utf-8?B?dWRXWFZLS2xoL05zanNrVVNXUHhXcDU0VXY5ZjU2SHJYS25wdUpUVE45SDgy?=
 =?utf-8?B?aGU5UmROSCtMbGNIbkg3K2hTUzBZaVh4dzlnMzE1ajI4ZENYa3doTDhLS2hh?=
 =?utf-8?B?aXZyUGxaZWJoWGkvVjRKNWpHcGxpQUZXbDBIOC9Va1l6LzcvcWFtNTR5Wk5y?=
 =?utf-8?B?NXhHVDNqMmM4OGhrQ1BwT3loMHFBeEdUOGdlNmZBNDNIWVA5YWJWdi96TEM1?=
 =?utf-8?B?Zk1oa2FVS3ZyaWZUQ0Z0c1NRK2VNWHdpVXZtNEM0N1ZOMjAxekNZVUxweXZJ?=
 =?utf-8?B?MDVMQWtGcnlxdE9vbjA2K1lJSXI2VjYwaEVxbTVwQ1dPeHB1cTZ1cG1mV3lq?=
 =?utf-8?B?MGlmcGp5NkhIY1lYOHdJMEVFcTN3VzlRZm1JNGhuRjRkUGZKSTlwc2V3bUZR?=
 =?utf-8?B?V1ZDNzl0OU9aODEvYmF6Sy94QUg2ZWVzK1VUQVN0aHV3QTBOMENUcW1QQzlO?=
 =?utf-8?B?WHYvT0gvSVlMTFhZejMybVkyZENLVCt5dWZvVlVqK1E1aU1hWDVxWm5ZYTl1?=
 =?utf-8?B?UTR6MWdVZlBESUt5WWh6cDIwb3NCTHFSU2loNFdiSXZyTHdHZkRKbVQySWt6?=
 =?utf-8?B?L3AwRXR1a2hnNGJUS0orbndCcU41TU9UbVFQL3QrSXhwOG9NRmZ2M0RTc1Vi?=
 =?utf-8?B?RTdRaC9CbzUwa3JtaVZuaFZHMDEzQ0VBSDlqaG1PNCt0Nm51M1IxcTk1Q3li?=
 =?utf-8?B?c1R4TnZJbUVpS2VIaWFTTHViS1pLMC9UQWFZZ3M4bXRHWVU2dk1VOE9IU2E1?=
 =?utf-8?B?TDRlQ0NTNXpjbFBjS0pKOVVacitUa2ZPdDdZYXE1WkIxZXN2WnBYdlBFdDBG?=
 =?utf-8?B?UjRXSkNONytmN1hBaXljOW1Sd21uTWNLbVgvdS9kbkZNVEtuRkgzSUJGb0hK?=
 =?utf-8?B?MWNBK1lEeDNMc0NhQlpzY0JlTEdnMFhKcEJyODNCUVIvT1FmYnliUEZLQU1m?=
 =?utf-8?B?b0didFEzbmV5dDlWb2RYVHErWVZvd1RGNzhmZ2s3bklHdFRyNWI2R2NiVkVO?=
 =?utf-8?B?Tm0vd2N5UDNnR2JxRFphcytXN1RjeTB1SC9ETk5ONWRmVHFWRWNmVGlLRW4x?=
 =?utf-8?B?ck9mcFMxRnhXK1I5SmRXR29jN0JPK2N2WCt5L0l1bFF4eDFnYzJZSjAwR0RV?=
 =?utf-8?B?RVZnMzJaL2NqMXJ0c3o3bFM5NWdBQ1RaUGE5NFhBYW5PUWhGMHhIZDlZck1x?=
 =?utf-8?B?RysrcUMrTnZ2MnlST2ZQaFZsS2pTcTR0V1FCaTJuY0tLRmZNcGVzM3I5eEho?=
 =?utf-8?B?b3J2VkpIMXhRdEk3NzB6SjZlSGMzNmJHV1ZoMFhRelhTRDRPNW8yNXRmRVdw?=
 =?utf-8?B?OGdaWFFkNU8vc3BXelp3QTdZUTFRMGVhZmw3cDladUNoUTNDc2hQK0p0TmVM?=
 =?utf-8?B?MUN1a1ZOOWJ4RU4yNTY4Nkh0UFdjaHZTMjlqSWkrRDgyYXdmbXlIZHJvbHFx?=
 =?utf-8?B?eGl1TFJ6MnZLdGh3R2F0YUIyLy80WUtOdkQ0dkFCMnlTZU55ZzZJYTJDd1NL?=
 =?utf-8?Q?ln2QZW6fwVbE3gILhELzlEc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f955520e-c557-4629-ebcf-08dbba97f900
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 11:43:28.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Kblp2h8UqaRU3llClU2m+1Qm0g+WmL1MaDuTRyXU2IjCXkhdcFmyvmOy387vEIAMdpOgIp+76sXI724m5u3RjGOhQrXoGFMrR383l5qVw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 21-09-2023 15:55, Badal Nilawar wrote:
> Expose power1_max_interval, that is the tau corresponding to PL1, as a
> custom hwmon attribute. Some bit manipulation is needed because of the
> format of PKG_PWR_LIM_1_TIME in
> PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
>
> v2: Get rpm wake ref while accessing power1_max_interval
> v3: %s/hwmon/xe_hwmon/
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  11 ++
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 138 +++++++++++++++++-
>   3 files changed, 156 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 1a7a6c23e141..9ceb9c04b52b 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -59,3 +59,14 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Energy input of device in microjoules.
>   
>   		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index d8ecbe1858d1..519dd1067a19 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -22,15 +22,23 @@
>   #define   PKG_TDP				GENMASK_ULL(14, 0)
>   #define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
>   #define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
> +
>   
>   #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>   #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
>   
>   #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>   #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>   
>   #endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index cb75b9a386c0..dfa638942d47 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
>   #define SF_CURR		1000		/* milliamperes */
>   #define SF_VOLTAGE	1000		/* millivolts */
>   #define SF_ENERGY	1000000		/* microjoules */
> +#define SF_TIME		1000		/* milliseconds */
>   
>   struct hwmon_energy_info {
>   	u32 reg_val_prev;
> @@ -50,6 +51,7 @@ struct xe_hwmon {
>   	struct mutex hwmon_lock; /* rmw operations*/
>   	int scl_shift_power;
>   	int scl_shift_energy;
> +	int scl_shift_time;
>   	struct hwmon_energy_info ei;	/*  Energy info for energy1_input */
>   };
>   
> @@ -255,6 +257,138 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>   	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>   }
>   
> +static ssize_t
> +xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	u32 r, x, y, x_w = 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +			     REG_READ, &r, 0, 0);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	/*
> +	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
> +	 *     = (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 = (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 = ((1 << x_w) | x) << y;
> +	/* val in hwmon interface units (millisec) */
> +	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out);
> +}
> +
> +static ssize_t
> +xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
> +	u64 tau4, r, max_win;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12
> +	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds
> +	 */
> +#define PKG_MAX_WIN_DEFAULT 0x12ull

Do we need to determine r, x, y etc for max limit ?

Why cant we simply define MAX_LIMIT 256 ?

BR

Himal

> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in xe_hwmon_power1_max_interval_show()
> +	 */
> +	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 = ((1 << x_w) | x) << y;
> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val) {
> +		/* Avoid ilog2(0) */
> +		y = 0;
> +		x = 0;
> +	} else {
> +		y = ilog2(val);
> +		/* x = (val - (1 << y)) >> (y - 2); */
> +		x = (val - (1ul << y)) << x_w >> y;
> +	}
> +
> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
> +			     PKG_PWR_LIM_1_TIME, rxy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  xe_hwmon_power1_max_interval_show,
> +			  xe_hwmon_power1_max_interval_store, 0);
> +
> +static struct attribute *hwmon_attributes[] = {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
> +					   struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	u32 reg_val;
> +	int ret = 0;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +
> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		ret =  xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +					    REG_READ, &reg_val, 0, 0) ? 0 : attr->mode;
> +
> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> +
> +	return ret;
> +}
> +
> +static const struct attribute_group hwmon_attrgroup = {
> +	.attrs = hwmon_attributes,
> +	.is_visible = xe_hwmon_attributes_visible,
> +};
> +
> +static const struct attribute_group *hwmon_groups[] = {
> +	&hwmon_attrgroup,
> +	NULL
> +};
> +
>   static const struct hwmon_channel_info *hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> @@ -573,6 +707,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	if (!ret) {
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>   	}
>   
>   	/*
> @@ -612,7 +747,8 @@ void xe_hwmon_register(struct xe_device *xe)
>   								"xe",
>   								hwmon,
>   								&hwmon_chip_info,
> -								NULL);
> +								hwmon_groups);
> +
>   	if (IS_ERR(hwmon->hwmon_dev)) {
>   		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>   		xe->hwmon = NULL;
