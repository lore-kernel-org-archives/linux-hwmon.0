Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF8EB8FB7
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Sep 2023 10:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjIFKXp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Sep 2023 06:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjIFKXo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Sep 2023 06:23:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984E510C7
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Sep 2023 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693995819; x=1725531819;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XRuN52fKoGtQKRT9ACUswg3tSRRdHPLORBmO1xmEwRc=;
  b=TVrFs50138yWocKmeZ0ZynRaH2G+t9Xw89HwnExiVljUFT1v+/JK67Cj
   lt8pLRR5hudLDQgToa2ewD1Z00L7wQdhu9ygU1MfgltozKB6uB9hmlFdi
   hzTV6aWxLHiuQwsPKccF44flL6rCEyipZZMdPVhE1F5G9V/sMSjoLlwGh
   EwCdKRwVKOfwAumCUeed31gsfcLxNkpCvQoPphG/sESMa6s2peo1vMLkY
   GUr6alDzqUxKP+1mebgw03aNdRFhrYfRblIn94ENXO+OqrAh0AhLuoQZy
   EmuwC6/PxZ44vYEy6NxCraaPLuawg6zewrN/21ggbDNh3rJ2ZyGfLlllz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374422888"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="374422888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072331385"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="1072331385"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2023 03:23:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 03:23:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 03:23:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 03:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvG1YJUucp1zI4Dam5RTd4sx8Ff+z24MIXb4CA1Si0+w4arELxvMrw+Mel8adoG3zwjvEanzTEXQJLrRS6PV4e8dJi6k73diTu8ZOyRHsoKzcPdK5UL6iv7eApwxIA73JUiTCzWhuwxtn9SYr+zUJp5umR5vEG2k9yWaBM5eAA8wvDXzfBdUQow/V6A1v5v8cbGeDfncpoieb4/rnAd9bNbeEiY5Gq3rj4aBNW7MMo+kYt/64IW1EbOqY1lzfPf10VushSEnFELSxEEvydH5Ylxa+Sw+58ao4ufENDJ30uphIF1vhNJFdJFgL4pjsXvDIIB9TueYD9NSOAJ9/tEP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYaUAp6/y8E3VgSDKIFXpEbtbzpx5h1lGhojUdLj9Y8=;
 b=dZCJnkqYEdNYMbOM3JnrEmyt2KjCcngfg/U31/OJOs54725uCA7TUphQEeq1NLSQu0DEt1DOeb5rlsV9ze3mNG5aaMQ3LHOi+Y993cy3sMCncz1CyzZMOVqkhDpjPn0ndJX/m05anrVx2OvsBmGKiIfyYUGrD40ljXfgHjwlWv8VbUfVVXOk3ijiHlY8eQcjSC/EJkYAq08YctU9YO3xY9aWqYPGRpPMMyJ8DnM2qPJHG5XgnRT54+V2WpIlTIFGDoJtr2mbXxsEbvo8cr+C1MvRaixVV7Q1v5HkXayZEOpsy+thCqEjRJefJJjygwF2S9x9r7J92SiMVB6Sabtydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL1PR11MB5381.namprd11.prod.outlook.com (2603:10b6:208:308::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 10:23:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 10:23:29 +0000
Message-ID: <c362dcd0-771f-39fa-9ab5-3a137dd3d51f@intel.com>
Date:   Wed, 6 Sep 2023 15:53:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/6] drm/xe/hwmon: Expose power attributes
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
 <20230904182258.2291881-3-badal.nilawar@intel.com>
From:   Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230904182258.2291881-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL1PR11MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: 971fdac7-4d0e-498e-99f2-08dbaec34fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hOk2Deci043OQR0hiiatEXEP/a/dS8Oxx/wsczYsrzKL57fXbBG6B3hdGeBRT9bhyFn2bCR6qBOyvmhmxgR73IlQwvlFs6RB+tEY9Fp/kRtxdd/pd58ycpU4aKTGULvN1nS4JzvqlOYoXObJ3rPQyoHw9TEb56WNdW0HgVVmTVX0yLiVDt4SFHne3eqTak7r6Mnv9qJeaQ75QzLb3L2aKb2bcL55O4BKdyZbm+qIw9/YFcvSR0lWEuDEr++BQuxEr5oh24DbJRvC3V8CGld2u0wNnAIo0hWr+1/0YqU3efiTnqZNz2U74pG826GshfWoEyzYqN9sWsCTp5KNuL6uvt/DWDd0EdlE4XyHZuZNHG2H8sU3XNR8xGpWF3ozHqEmorulJTCZKexUkcCz8J0jypp1u0KnfSThwjlDnZY4lkQmuQdtlAuyi/P286w2RauN4R5v7JH5JOsKhnz8KZENWGxlHytj6LwXA9ytY1kPSaqJ090cJ9vrYy5jtbkcyys91IwVlOhnBwRpV8MtntM2/U0YRhLNHbZJSJS8ialYgmfBAPLGv5q4H8b5m2ud+rRfRBiZ2/s31gu9xU/pHsgpeskuvQsJ8DHFM6HIqgEHQezUMJYY3R7ZmSXWfAl6C09AwcZhV5/7sGaJAaiI7ksOVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(186009)(1800799009)(451199024)(82960400001)(2616005)(38100700002)(26005)(6486002)(6506007)(53546011)(6512007)(36756003)(83380400001)(31686004)(478600001)(4326008)(8676002)(30864003)(8936002)(66946007)(66556008)(5660300002)(44832011)(66476007)(31696002)(86362001)(316002)(6666004)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEU4TlNEdGxPa0h2YzFKZGRSdWt5a0dMeWJHQ2NZeUVJMWd3WVRXT0ZGKzla?=
 =?utf-8?B?OEwxTk94ejRkMTZvQWoyRHltVXluaTFnVkZQcGZCWVFYZjdodE1pdzBaZDl6?=
 =?utf-8?B?b0RGUzNBRmpXRlFWbEk3YnBuOElKV0FKWm1JY1UvdklUVURqeVhWWUFwRnJy?=
 =?utf-8?B?T0tHZkRHUGh2c1lGSXNVMEVXN1FJZnUvejBra1lpbEJjN2t4VEF4UTdCN3RW?=
 =?utf-8?B?NFZLZHhvclpXOXlkN2dZbzBSYS9NVmtGRzJ0OGErL2VveVllT2dMMnBqZm5j?=
 =?utf-8?B?dEdCYzRDRFZKTXRZM0xOaUp1NnVTWTFpT1NsU1dIejdmV0Rkc1Q4eDg5SzUv?=
 =?utf-8?B?Q294Yy84N1JDTGlGTzlyL09qR0ZxcEIvdXZWV3dnK3lpcWJJeERyMUs4dzZy?=
 =?utf-8?B?MCtpU0xaRXhlaFVHaHFxeU5seW9EQkQ5ckhpK2pSYU1sUVB0bTArbEFRK2Y3?=
 =?utf-8?B?KzBLK1ZmTkpTN2hza0paVkFHZU51QXlITm1iTzNFcGdXWllSTUVsY0IxMWE3?=
 =?utf-8?B?MzZ5U0hIdnpsdWVrUWhCQUJqbmU5YlNRVlRMRUVhSjdHTkJyWkVzcjRNK3lV?=
 =?utf-8?B?TVd1RTNOSHdEbG1idFVtYXcxNStrN0tmUXdkMUdwZk9pWTMzNklEYkx6Tm93?=
 =?utf-8?B?V04zRFgySTk2NlZWcjZwVTJ2RUlxOUNhVmVIZC9OTFYzZWlkcEhscDNGNmtQ?=
 =?utf-8?B?ODVSNFdXT2VITzhlWWJGSkR0MUtzN0x3UE5SbjlYbXRYWFhjeU5iek1qNXZp?=
 =?utf-8?B?MDhOaEVhMjFvN1JTc0Z4ZEVsWjNuQVdxbittSEVJOVlLN1pEZU5BdlNUSHU1?=
 =?utf-8?B?VjlKSHpFUDFlYzBpVWpiY3JSMGZqU0N3RFBSTm9BemRTaEJxNkVQOXlMZXRy?=
 =?utf-8?B?NE1xVUtMTW1wWEhOcWNTektjMFJtSzIwVGcrRVNKcER6TlZoQlAyMTlhOXdj?=
 =?utf-8?B?WEVHS0ZSMXRWbFNSdEIzdE5hblpnUFZWSkFHOWRtbzRUZXUyVXlCZm5rUVZK?=
 =?utf-8?B?cGRWVHdTeFo1UXd0M2hKb2NETjAxL1Ywb3puMTFuTzltQTA5VG9LTlgrSTNP?=
 =?utf-8?B?K1VkUWo2djhrbzFsQ2l4ZkxjeEoyNDFSbWwyRHlYTk5WYmdPVytGdkVmUHY1?=
 =?utf-8?B?a3RHVHA0WEQ4ektVWmtyLzZ5c1N4dEQyQ2JBc3VLUi9LUFhKTmZ6TnNzM1ln?=
 =?utf-8?B?WVRhdzFCREoxMWV2RDcxNm5iNG9FYXR5M3BoK0FmNDl2Tm0rbEhJRmd2ejNp?=
 =?utf-8?B?c3JZTWNsM0J6U2k0c2lCUU9mdzA1bEVrV0NGTDRMcFExTVNlakxaWURzTEx0?=
 =?utf-8?B?VkxtN2l6UXpzQlNBRnhaMGJzNUUzYm80dExCQUk5SFlTT1NtT1FKUU8wZ0x5?=
 =?utf-8?B?S043WnFyRU5leDZQYlcyNWs4STJ2SzJ2dlg4ejNqOHdFZnA1ZG41aSt3S0Y4?=
 =?utf-8?B?WUFPWVRQY1FjRVNhWjcwMkFvYi80bUhtd0s3bk14blNFeFdIUGdra3d6NkFC?=
 =?utf-8?B?VG5xL3Z3cDk0VTMyWk1NZ3FRVTRXU0wxbFhhMFRLeGI0Q0t2d3lMc0ZrNVdQ?=
 =?utf-8?B?bXVLRDZSUnlvOVFkNTB1U3J3S1pYemR3MVpZdUVzTU5YWC9VanI4TnZ3Mllp?=
 =?utf-8?B?WHU1UG9nK3JSbXZyeDVIN1lWeGgyeG9odzF2WGxwMTd3NkIvczVFaGM1emZk?=
 =?utf-8?B?SjZUZFFOVmRFeGExMzE2S3lqS3FsbkJyS2wrUFlGU203Y1VqZ1R1U3MvdU5h?=
 =?utf-8?B?dGNGRjZ1NTNsSXkrT3hkVTd6VGxXSUl4ektCTVI1a3plWE1qRGg3QW1xVU9E?=
 =?utf-8?B?VGFYU1JCK0paNEwycjh5dEZyd2ZWb3lBSUFJTW50NDRiWm5rSGdmZjNQdzJ3?=
 =?utf-8?B?R09zT3M3ek8zYVJNU3U3SGFza0RGaUFZSG15dE9iYmZ4cFQ5WU51bFVzWDgy?=
 =?utf-8?B?WElkeVB3VXJRVDVyNDdlT09XL1I2ZERHMkhYa3Btamdzelc0eUhLblU0UmIw?=
 =?utf-8?B?MDZSYllrR3NVbVRocnFxcmpsSVVkdXNyMitWSXp4blRqbDlhUXczbVdQeEpl?=
 =?utf-8?B?ZTdWOEdWVWI5UGZvN3lMUWkxZ0YvZGZZeWhUejlCZnR0U2hwUnBVSmU2eTdy?=
 =?utf-8?Q?m1t3GSSNIMVWUITy3Zii7YFUT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 971fdac7-4d0e-498e-99f2-08dbaec34fd0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 10:23:28.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSe6PkcMOAvvq2AEO8XOqdnCTQCxGXZ7NcnHbDc7D0MpnXgtadAhsgvHYiV84BrV9eHIgRMqBU5KGvn7Nw/iYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5381
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Hi Badal

On 9/4/2023 11:52 PM, Badal Nilawar wrote:
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
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>   drivers/gpu/drm/xe/Makefile                   |   3 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  33 ++
>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 362 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
>   drivers/gpu/drm/xe/xe_uc.c                    |   1 +
>   9 files changed, 450 insertions(+)
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
> index 9d2311f8141f..c86577c6e222 100644
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
> index 271ed0cdbe21..32adfce8b2db 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -405,4 +405,8 @@
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
> index 000000000000..6cd39a721bf2
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
> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
PKG_PKG doesn't seem right. Should this renamed to PKG_TDP ?
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
> index 109aeb25d19c..e851b8773b54 100644
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
> @@ -335,6 +336,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_debugfs_register(xe);
>   
> +	xe_hwmon_register(xe);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 750e1f0d3339..7ea5704048bc 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -361,6 +361,8 @@ struct xe_device {
>   	 */
>   	struct task_struct *pm_callback_task;
>   
> +	struct xe_hwmon *hwmon;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> new file mode 100644
> index 000000000000..d66d633724a5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +
> +#include <drm/drm_managed.h>
> +#include "regs/xe_mchbar_regs.h"
> +#include "regs/xe_gt_regs.h"
Should be alphabetical
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
Should this enum have the prefix REG?
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
> +	bool reset_in_progress;
> +	wait_queue_head_t waitq;
reset_in_progress & waitq not used in the below code
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
> + * "typical but not guaranteed" min/max values in rg.PKG_POWER_SKU. Follow the
%s/rg.PKG_POWER_SKU/REG_PKG_POWER_SKU 

> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read.
> + */
> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +	u64 r, min, max;
meaningful name instead of r
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
> +	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &r);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
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
> +	u32 nval;
meaningful name instead of nval
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
> +				     PKG_PWR_LIM_1_EN, 0);
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &nval,
> +				     PKG_PWR_LIM_1_EN, 0);
> +
> +		if (nval & PKG_PWR_LIM_1_EN)
> +			return -ENODEV;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
> +{
> +	u32 reg_val;
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
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
Since there is no error code returned. Should have a warning here?
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
> +	init_waitqueue_head(&hwmon->waitq);
waitq not used in this patch. Add along with the patch that uses it
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
> +		drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
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
Add space between if else and contents as suggested by Andi in previous 
rev comments
> +
> +#endif /* _XE_HWMON_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 9c8ce504f4da..e82c7304724b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>   #include "xe_huc.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
> +#include "xe_hwmon.h"
include statement not used

Thanks
Riana
>   
>   static struct xe_gt *
>   uc_to_gt(struct xe_uc *uc)
