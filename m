Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AAFCD4F46
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 09:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbjIVJ6G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 05:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjIVJ6C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 05:58:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9377B1A7
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 02:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695376674; x=1726912674;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X6i2yAZV8u2jMm9fvpfR5fKWmuUnIggfOlh9PAvP9fs=;
  b=m/bDlDOAM3qvUjjzE8GoTnV6whq3cJ0VfU1o4jSwASI7FTCgBOJGR2dG
   ajsmZjGh3T0DHVGD5/j7lax2kJUYhj8Zc0JW3sa03S8Pb5QQc9q2cRE/s
   0v+PcZWSd9LkOSzNEYzv46B0tQFBI6uWeemtxUBtxsBAIgGYJ9UiHJ24j
   mTWpNFaqCSNlDA5YbjRvn+yVJkaATksNeZRSR0rKawVcvFZlHcR4v30Cw
   PgO4oP879q6wyAE1wU4VvOZvCWg4NaaSN4wCWxX2ZVBpW4/Qz6maBeTPq
   lzwmGR1wCoV9nLb7vLJxYQ0DG0Y2Nxxdx8ixuq2mDrpXR1O7MmXUdYY55
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371111894"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="371111894"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="813017658"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="813017658"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Sep 2023 02:57:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 02:57:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 02:57:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 02:57:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 02:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/c9f0YdssHnUDd2ZvfYJKKKOk2zyiPcVL2oD3ZjhUfJzcYCc/K7VxkIF+GzzZPmqyVdzcX9bWDhNc6Bv/eAAgCJac4JBDPwA5mI771TFSC+1aVehOTLJdm9rgjmSsrqvofrl6pxDjx466jDVL+t4ogfqcul4fOs7OIXkE2vlzV7NoQ2sV+KrPTKvkRF1Du5gdXELgLxjOIg25EYNI+CcmsJ2Po3290HB1kqblEdF95vGHxykCbyyMmdYS5/+FajB7j1shsalWhyVGNB6n+hDVBCqkvHSidXlyesDbfLZBaWphXMgCgxvI+OGRZ75TI1PRlQ4n/Bqu1JKZB8V4QDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWt4DsE2+NlVtu0dh0s0HLvwj9W0JM9j6s+Zn/vw8Vk=;
 b=Dn5I+bd4Gj5B51VO0UJgk7O1WFsT/bamHL0WP5jibo2Ivdd/4b9q8M4HfbhU8GtFcxK42bUhZm5TdyKwKAlysjYXwz2f77XN6LsYGEa+gnSK1im4YKn0/GyRm18yI9ZmkFkRsy5ihZ765Y8OmtEgIS/xrnTgb2lgLnmoT62mqdNcEeyN++tc5eUeUuedhUiO/b9jzAJ3n2/++aYziay4GN2w4nkHXobHYO1Rtx5c4xhHopvW5h6CnVmR0qwi8qPDW2NpU/3jlwLd8VyRZVud6XVuBKjsLicrKtZTIriU254zENHM4WMPXgm0Su5EfDTYvwQTrR9mR+yhmsUHTRy6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 09:57:50 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 09:57:50 +0000
Message-ID: <85fd9c66-77ed-369e-0920-df6d37b306ec@intel.com>
Date:   Fri, 22 Sep 2023 15:27:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
Content-Language: en-US
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <linux@roeck-us.net>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-3-badal.nilawar@intel.com>
 <ZQxuZLgY4r6Gtitx@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZQxuZLgY4r6Gtitx@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 874c5668-3cc0-4182-c417-08dbbb526166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMvSOuHB5Kf54nUfoNnFEdqJPP6J39bDBQNaeFRaJCiOYbUbbaaYf2bgYqW86RfXrsuIJWU3unBmQZwXmQXrtR5z6CU44Vc6JVSJfshtUVm1h9IUZv1RI/j8a6FwJgyZ4+zdOZA4ekErJqZ5Ya+AK1X19bL5aC/V1hIvm8/zsPA5z0xYKxvZOsjm+ucMKeVZrti5kqQboZQtIpM+nzPxsafTSuJzcK6Y2ZFvQc71QkLZpuVfFdGAHCNW8hcLgNwRD/8tM/F/ICGvo4DPxNJSOWY4qPMunQBrK9R9sVy61ZIz2jrHahfXoFMachMEUZQIJitdB4ltG05zILyKkdfKianhUQpDFKRqEifOjDQO76dp+9A9O1TJKPFOgsz0cc7bxM82yQz7LM9G5ktPcCynTXP20OxOybonZjHQZaM3WBGHdunDhPKoC0tIJVUl6xXHtJA4cs6la8fBJBnQw9lJ1CCgsOscpoOJbVEpKTwBEer6Gvfd/0RAIYvvv5gcwRhFbWwqzokfL0tK9eJE/o35xbSHWHXdV6vI9QCc+wVCOOWsBdQ0EFwP6E4hmfbaSupcpTcLhQMI43yflExe4a2dv8Eo7Tbvf1Smf/Tvheyyb4/GYbowEDdwg/p4/LK87DN7lmSjW/uZ94MN/it3xRMAZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(2616005)(478600001)(38100700002)(26005)(6512007)(82960400001)(6506007)(6486002)(53546011)(6666004)(8936002)(5660300002)(4326008)(6862004)(8676002)(36756003)(41300700001)(316002)(66946007)(37006003)(66476007)(66556008)(6636002)(86362001)(31696002)(31686004)(30864003)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmtVYzdsWUpTODdQZG1ObFdnZmc5NG5ReEY2ZFFNUVZzVTEyQmRUTUM2c01k?=
 =?utf-8?B?N3RQQ3g0amRjUkJBRGJ1MHdHQTJUU0R3aEszenpUYWMxbEw5WGtJZHVpVGNM?=
 =?utf-8?B?aHM5b1ZCNTgvdk1xeUJJOHk1ck1xQVV6QlNGRmFrNXBZT3VLRWgrSGZTZXAw?=
 =?utf-8?B?ckJXeDhZQU82UVkwL2ZwRmlUdkQyQ2RBN1hZVTdIM1F3RCtiZHpranRKcmRJ?=
 =?utf-8?B?SkRvK0ZubkloRzZtOVEvc09sbXhaUC9aMWZpRmZoSHozSFc5Mzh6eG9YQUJv?=
 =?utf-8?B?dnViTkliVzl6SW5PR1BrV29TMDlZazBzK1UvYlFFMTFTMCs2a0plMEhNeWt6?=
 =?utf-8?B?dVhpRi9DVXNmZGx5d2tDcFpzbW43VDlmZ3FJb3pMQUVzUVdlSlBnTkRQeFpy?=
 =?utf-8?B?YkxkRXo1b3NyeURCRitwdlpkbmE0ODdTOE1jd2hQc0dMajVsL1FtZm5iSFdX?=
 =?utf-8?B?VThNdjQ2U3lxeGJQNy94aVpOaHIrMHFXRUNqVEpONytReWxuK0dkSlFqWExC?=
 =?utf-8?B?amxLbDNFK3kyVWttSjU0UWNkODJQRjBZaDBIWU54ZlZGOERQcmdhdmpjbXhr?=
 =?utf-8?B?MFRySUEzMmo4S1g4b1pqVkpVWHYyYUFzb2tRY1ZWRjZoMUJvdjlibFZmNFZI?=
 =?utf-8?B?NWhzajM3d0pkRE9LZERudFFlWlF5ZGZoSDdtSFdXZ0RpQ21xOTJ4NWh1RWZy?=
 =?utf-8?B?NHczSGxhaDZmT1QzK2hvWVpvQnMzeTJFR0dEd3JRQi9ZRWJpd2V6MkJrT3Jz?=
 =?utf-8?B?cDEvMXBTcGZ6MEZDM1FraUpYUmI5YjlhMm1YZ3VIT1VNLytzWTlTN1FUQTlz?=
 =?utf-8?B?UzZVTEwzNGlvc0RYZlE4cEJ2MnhqR1RFQ0l5L1pJUWVjekdOemxOcFVYT2hM?=
 =?utf-8?B?eXZRaWljOThPSStsOHFhWDZWdVo4U3drWUVPNTRJNVdKVWNjL3VRemp1L1pk?=
 =?utf-8?B?TXBYVUFRZW1rVUxMNW5CV0Q5akRkNy9jSG5QR0FaWDlQVVh1TEVyL2I4L1Nk?=
 =?utf-8?B?K2hIam1INCsyMGUwZVRWb2NnTSt1REJKdlBKRXc1bzJyM29yZEZEb0IzK2o1?=
 =?utf-8?B?eUhMM2ZzdzM3Q01qbFZLUFRjVXg0dkNKalhuRkllcldINmNDYlNhYnkxRndj?=
 =?utf-8?B?eUZsRUxoTTRRYWlkUlQwMU12QmZsZ0YyQUw5NVVyenlHU3ZCeGkxVmV0V3po?=
 =?utf-8?B?ZEFvS2VoYUc2Z3h2eGduWGNqMlFxVGlWQThkS0ljZm0rSUtnTGJ3dm01a2tq?=
 =?utf-8?B?b1BXVWprN0RkTXJJWUFyTnEzQ2k5MVhxWTJYVXQyME1FZUxqSTVVUVZtMjVY?=
 =?utf-8?B?VWxUb0ZGZStvaU5xL1RTZWVoeldWV3FiSVBGU1RmNHZIdE14VmRSTlB1WG44?=
 =?utf-8?B?U1VWTlp3STdObDRhVUl6U2RRN25Pdk5NVGw5bzQvRkdvY0FBQmNZUWxiRXph?=
 =?utf-8?B?SWZwWStNaElUaWxoak9tVytqWnJrd1lKemxnN2FFNEJnWVBoUHRraGVhRVcr?=
 =?utf-8?B?aFRCOVN6TFJvQmRqUUZXVjlFRUdKeVZ1UlRZL3FjYnY1azBHcUFkMk9zYWp0?=
 =?utf-8?B?dGwwbnRGTmV5djJLYTltL3pQT0dHT1llTUhMd2R0cDFrN3hNakxhM2xpZHR0?=
 =?utf-8?B?TUNFalBwQ1VCc1U3cTVXSDB3ZXJsRnpEV1c1VGNublhBbmp2QnR6dXBMSlgv?=
 =?utf-8?B?ZVlOcWMwSVo1NWpFYzF2bWI0VjRuTytmRFVHMm10OTlnQkNkbnRlTm5zY0RE?=
 =?utf-8?B?UXNoVFprR0VmcjZJK1MvVnZSZmMvODVLZVZlSy8ySW1ETTB2Y2dEZ3JxZVhY?=
 =?utf-8?B?TmZJSlVnVFNyZjM3TkxyZytoSDJqaWdqdGpvOVhZMGZ6QU5DM3h6NmlXQWdp?=
 =?utf-8?B?ZTJXWnlzWlduMzNtUTRTdGxYbG9rdkFMOGZxbmFSZTBWazNJSVllRk1YTGor?=
 =?utf-8?B?ZkFYVGhvTkZZYXh1bVl5bFhuTEROZkZYWk1NU2VyK2VNMXRMd3dIRjd4QVNr?=
 =?utf-8?B?VWhuSHRTMG5KSGlsbEtZL3BIK0xpYkI0MnhkM09CL0hHVUFhN0F0UGZ5d2RX?=
 =?utf-8?B?eWZqOTdGMXRBWlA3cGtsMGNISEdnaE9HREJodUFUMm0vNU1nSFVyLytqRFVN?=
 =?utf-8?B?TS9JZm1RMDJ5UWV6bXpPdWlZcEVVNE5wV0JlWDlPeWlVdDI4ak9SdjdzVnlM?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 874c5668-3cc0-4182-c417-08dbbb526166
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 09:57:50.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBXekOIvgnfqCrIPpIF2s7Oie31I1+Iak2hvS5zVUAlCJDxhGAB53YSLrottQW/ZdxsIWMQTNSAGif6UTEN4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 21-09-2023 21:55, Rodrigo Vivi wrote:
> On Thu, Sep 21, 2023 at 03:55:15PM +0530, Badal Nilawar wrote:
>> Expose Card reactive sustained (pl1) power limit as power_max and
>> card default power limit (tdp) as power_rated_max.
>>
>> v2:
>>    - Fix review comments (Riana)
>> v3:
>>    - Use drmm_mutex_init (Matt Brost)
>>    - Print error value (Matt Brost)
>>    - Convert enums to uppercase (Matt Brost)
>>    - Avoid extra reg read in hwmon_is_visible function (Riana)
>>    - Use xe_device_assert_mem_access when applicable (Matt Brost)
>>    - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)
>> v4:
>>    - Use prefix xe_hwmon prefix for all functions (Matt Brost/Andi)
>>    - %s/hwmon_reg/xe_hwmon_reg (Andi)
>>    - Fix review comments (Guenter/Andi)
>> v5:
>>    - Fix review comments (Riana)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>>   drivers/gpu/drm/xe/Makefile                   |   3 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  33 ++
>>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 358 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
>>   8 files changed, 445 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> new file mode 100644
>> index 000000000000..da0197a29fe4
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -0,0 +1,22 @@
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:		September 2023
>> +KernelVersion:	6.5
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
>> +
>> +		The power controller will throttle the operating frequency
>> +		if the power averaged over a window (typically seconds)
>> +		exceeds this limit. A read value of 0 means that the PL1
>> +		power limit is disabled, writing 0 disables the
>> +		limit. Writing values > 0 and <= TDP will enable the power limit.
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> +
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>> +Date:		September 2023
>> +KernelVersion:	6.5
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Card default power limit (default TDP setting).
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> +
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 86c8bd4c05a3..ca77aff60d48 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,6 +117,9 @@ xe-y += xe_bb.o \
>>   	xe_wa.o \
>>   	xe_wopcm.o
>>   
>> +# graphics hardware monitoring (HWMON) support
>> +xe-$(CONFIG_HWMON) += xe_hwmon.o
>> +
>>   # i915 Display compat #defines and #includes
>>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>   	-I$(srctree)/$(src)/display/ext \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index e13fbbdf6929..679cdba9f383 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -410,4 +410,8 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>>   
>> +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>> +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> new file mode 100644
>> index 000000000000..27f1d42baf6d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MCHBAR_REGS_H_
>> +#define _XE_MCHBAR_REGS_H_
>> +
>> +#include "regs/xe_reg_defs.h"
>> +
>> +/*
>> + * MCHBAR mirror.
>> + *
>> + * This mirrors the MCHBAR MMIO space whose location is determined by
>> + * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
>> + * every way.
>> + */
>> +
>> +#define MCHBAR_MIRROR_BASE_SNB			0x140000
>> +
>> +#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>> +#define   PKG_TDP				GENMASK_ULL(14, 0)
>> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
>> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
>> +
>> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>> +
>> +#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>> +
>> +#endif /* _XE_MCHBAR_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index b6bcb6c3482e..2acdc22a6027 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_vm.h"
>>   #include "xe_vm_madvise.h"
>>   #include "xe_wait_user_fence.h"
>> +#include "xe_hwmon.h"
>>   
>>   #ifdef CONFIG_LOCKDEP
>>   struct lockdep_map xe_device_mem_access_lockdep_map = {
>> @@ -337,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_pmu_register(&xe->pmu);
>>   
>> +	xe_hwmon_register(xe);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index a82f28c6a3a0..d1e319f305ef 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -365,6 +365,8 @@ struct xe_device {
>>   	/** @pmu: performance monitoring unit */
>>   	struct xe_pmu pmu;
>>   
>> +	struct xe_hwmon *hwmon;
>> +
>>   	/* private: */
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> new file mode 100644
>> index 000000000000..7f4599d98541
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -0,0 +1,358 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/hwmon.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_mchbar_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_hwmon.h"
>> +#include "xe_mmio.h"
>> +
>> +enum xe_hwmon_reg {
>> +	REG_PKG_RAPL_LIMIT,
>> +	REG_PKG_POWER_SKU,
>> +	REG_PKG_POWER_SKU_UNIT,
>> +};
>> +
>> +enum xe_hwmon_reg_operation {
>> +	REG_READ,
>> +	REG_WRITE,
>> +	REG_RMW,
>> +};
>> +
>> +/*
>> + * SF_* - scale factors for particular quantities according to hwmon spec.
>> + */
>> +#define SF_POWER	1000000		/* microwatts */
>> +
>> +struct xe_hwmon {
>> +	struct device *hwmon_dev;
>> +	struct xe_gt *gt;
>> +	struct mutex hwmon_lock; /* rmw operations*/
>> +	int scl_shift_power;
>> +};
>> +
>> +static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>> +{
>> +	struct xe_device *xe = gt_to_xe(hwmon->gt);
>> +	struct xe_reg reg = XE_REG(0);
>> +
>> +	switch (hwmon_reg) {
>> +	case REG_PKG_RAPL_LIMIT:
>> +		if (xe->info.platform == XE_DG2)
>> +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>> +		else if (xe->info.platform == XE_PVC)
>> +			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>> +		break;
>> +	case REG_PKG_POWER_SKU:
>> +		if (xe->info.platform == XE_DG2)
>> +			reg = PCU_CR_PACKAGE_POWER_SKU;
>> +		else if (xe->info.platform == XE_PVC)
>> +			reg = PVC_GT0_PACKAGE_POWER_SKU;
>> +		break;
>> +	case REG_PKG_POWER_SKU_UNIT:
>> +		if (xe->info.platform == XE_DG2)
>> +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>> +		else if (xe->info.platform == XE_PVC)
>> +			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>> +		break;
>> +	default:
>> +		XE_MISSING_CASE(hwmon_reg);
>> +		break;
>> +	}
>> +
>> +	return reg.raw;
>> +}
>> +
>> +static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>> +				enum xe_hwmon_reg_operation operation, u32 *value,
>> +				u32 clr, u32 set)
>> +{
>> +	struct xe_reg reg;
>> +
>> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (operation) {
>> +	case REG_READ:
>> +		*value = xe_mmio_read32(hwmon->gt, reg);
>> +		return 0;
>> +	case REG_WRITE:
>> +		xe_mmio_write32(hwmon->gt, reg, *value);
>> +		return 0;
>> +	case REG_RMW:
>> +		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> +		return 0;
>> +	default:
>> +		XE_MISSING_CASE(operation);
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
>> +{
>> +	struct xe_reg reg;
>> +
>> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> +
>> +	return 0;
>> +}
>> +
>> +#define PL1_DISABLE 0
>> +
>> +/*
>> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
>> + * "typical but not guaranteed" min/max values in REG_PKG_POWER_SKU. Follow the
>> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>> + * clamped values when read.
>> + */
>> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>> +{
>> +	u32 reg_val;
>> +	u64 reg_val64, min, max;
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
>> +	/* Check if PL1 limit is disabled */
>> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> +		*value = PL1_DISABLE;
>> +		return 0;
>> +	}
>> +
>> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &reg_val64);
>> +	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
>> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> +	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
>> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	if (min && max)
>> +		*value = clamp_t(u64, *value, min, max);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>> +{
>> +	u32 reg_val;
>> +
>> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>> +	if (value == PL1_DISABLE) {
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>> +				     PKG_PWR_LIM_1_EN, 0);
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
>> +				     PKG_PWR_LIM_1_EN, 0);
>> +
>> +		if (reg_val & PKG_PWR_LIM_1_EN)
>> +			return -ENODEV;
>> +	}
>> +
>> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>> +	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>> +{
>> +	u32 reg_val;
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
>> +	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct hwmon_channel_info *hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>> +	NULL
>> +};
>> +
>> +static umode_t
>> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>> +{
>> +	switch (attr) {
>> +	case hwmon_power_max:
>> +		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
>> +	case hwmon_power_rated_max:
>> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int
>> +xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
>> +{
>> +	switch (attr) {
>> +	case hwmon_power_max:
>> +		return xe_hwmon_power_max_read(hwmon, val);
>> +	case hwmon_power_rated_max:
>> +		return xe_hwmon_power_rated_max_read(hwmon, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int
>> +xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
>> +{
>> +	switch (attr) {
>> +	case hwmon_power_max:
>> +		return xe_hwmon_power_max_write(hwmon, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static umode_t
>> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +		    u32 attr, int channel)
>> +{
>> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +	switch (type) {
>> +	case hwmon_power:
>> +		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>> +		break;
>> +	default:
>> +		ret = 0;
>> +		break;
>> +	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +	return ret;
>> +}
>> +
>> +static int
>> +xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	      int channel, long *val)
>> +{
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +	switch (type) {
>> +	case hwmon_power:
>> +		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>> +		break;
>> +	default:
>> +		ret = -EOPNOTSUPP;
>> +		break;
>> +	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +	return ret;
>> +}
>> +
>> +static int
>> +xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	       int channel, long val)
>> +{
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +	switch (type) {
>> +	case hwmon_power:
>> +		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
>> +		break;
>> +	default:
>> +		ret = -EOPNOTSUPP;
>> +		break;
>> +	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct hwmon_ops hwmon_ops = {
>> +	.is_visible = xe_hwmon_is_visible,
>> +	.read = xe_hwmon_read,
>> +	.write = xe_hwmon_write,
>> +};
>> +
>> +static const struct hwmon_chip_info hwmon_chip_info = {
>> +	.ops = &hwmon_ops,
>> +	.info = hwmon_info,
>> +};
>> +
>> +static void
>> +xe_hwmon_get_preregistration_info(struct xe_device *xe)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	u32 val_sku_unit = 0;
>> +	int ret;
>> +
>> +	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
>> +	/*
>> +	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>> +	 * so read it once and store the shift values.
>> +	 */
>> +	if (!ret)
>> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>> +}
>> +
>> +void xe_hwmon_register(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct xe_hwmon *hwmon;
>> +
>> +	/* hwmon is available only for dGfx */
>> +	if (!IS_DGFX(xe))
>> +		return;
>> +
>> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>> +	if (!hwmon)
>> +		return;
>> +
>> +	xe->hwmon = hwmon;
>> +
>> +	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
>> +
>> +	/* primary GT to access device level properties */
>> +	hwmon->gt = xe->tiles[0].primary_gt;
> 
> So, what happens with the other tiles?
> We should get them in since the beginning since that will impose
> interface changes and bigger changes on IGT tests.
For now gt specific attributes (Gt energy) are not handled in this 
series. When those are added those will be new entries with label and 
shouldn't affect existing entries. As discussed offline when lables are 
implemented for energy will consider adding it for other entries as 
well. As suggested I will drop first patch and resend the series by 
adding your acked-by.

Thanks,
Badal
> 
>> +
>> +	xe_hwmon_get_preregistration_info(xe);
>> +
>> +	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>> +
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
>> +								"xe",
>> +								hwmon,
>> +								&hwmon_chip_info,
>> +								NULL);
>> +	if (IS_ERR(hwmon->hwmon_dev)) {
>> +		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>> +		xe->hwmon = NULL;
>> +		return;
>> +	}
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
>> new file mode 100644
>> index 000000000000..1ec45cf1d19b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_HWMON_H_
>> +#define _XE_HWMON_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +
>> +#if IS_REACHABLE(CONFIG_HWMON)
>> +void xe_hwmon_register(struct xe_device *xe);
>> +#else
>> +static inline void xe_hwmon_register(struct xe_device *xe) { };
>> +#endif
>> +
>> +#endif /* _XE_HWMON_H_ */
>> -- 
>> 2.25.1
>>
