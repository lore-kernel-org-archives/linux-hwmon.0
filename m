Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBB5CD4F46
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Sep 2023 09:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbjIVJtz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Sep 2023 05:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjIVJty (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 05:49:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9318F
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Sep 2023 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695376185; x=1726912185;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZkIIk5TB2EyUx4fPt8sicay53pVGi4nUG/FvCVvIYis=;
  b=BUOWRcu+9y8IY2O31is1/TwTVQqAhAgEbVtKEiOpNUu1QucwDWCqhJuQ
   1fJzU7yvA0/vr+Yhgw0icW/e/+3W+O8OiBPuwRNds8/irCepHQk0Xkwfj
   4ImXJk+juQDq1w1Tr7E4MRP/WZkOAn2TirDOsOis25mpMHLYBtqbjn27X
   1Z/lHGFQOeTNqyd3hPzic3qBWZPiFiC5I8CXfosG/N0rcnInHtrdeS+yi
   ScXzTrXa4CgPrqePsgofSaJtcg42EwyHMOCFhE8r0UCgpg68phtdc4mKk
   LCeE6MmqUI9EHDsRC3ne8UwWmU/mMsohRc4VvZ2L38Ut1oQS5X6/NJLsL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411726669"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411726669"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="750788124"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750788124"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Sep 2023 02:49:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 02:49:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 02:49:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 02:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePqWgwkxY4RaPj9iZYNhUC5lkYXL4snLrHFGe+plqK4OHudgrR+SqgzHwQPOfXVIJ5yZhW7CIaG6DHkgM/GlywLj656igJ8R9zetA5/rPiRehVlxAXRdabAN+NekihdP113tY054oAK1PqhAVqXcBSZkPpH6mTU6/1Bh7kwT0dSAVibqg+b9cNNqXGSPPNwMppzkl2BQfgpgUMdU1CpHVKmVAO0CkMH5y3p4IpBxYAX9bILK4g54S8PTUJ1Hwss+EXrFeM3uwUxg83T/4+N3BsWEGUiUKwNBTb1o7MA4L73P328Ay1vn6RA1YtDAFI2JSH1sFjfsybynJ+fYGSD03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCgJXVwis+ebv1Ggv8cuVA/jtWj7VLViLYm96nZkGrk=;
 b=ccgtuqpGbvX5z//LZBUTQKpAGZUFLWphirW1TiHaYvMc9ngvlfVIRKCSjNXP2U3M/BnecQcIALOg36VA3GkAz/PvaNt87Kl/s06elWQQCDykWkRk/zG4gM5xotYxXe78XFHlQOHDI+eREIorR3iDxF8e2HD8M0c+I3mph6W916ZMZBoGM/nDg/F4OBQxz25YKp38H0Hs8uILFQlOfdQjnVsKTHRoNqIjjb5M11rN6sFv010pxxg9MZ/LPh54Ll8Lg+qFrMUezRaBhKzKATO8fe8EKSSHI8Za5AQt9VZZ+5JdUzst66olAEig5q0c9AnOHcnjN4MwQ3WcC0N02Xvn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6492.namprd11.prod.outlook.com (2603:10b6:208:3a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 09:49:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 09:49:40 +0000
Message-ID: <b1a0568a-61d6-b5b4-0406-d091817e1c29@intel.com>
Date:   Fri, 22 Sep 2023 15:19:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [PATCH v5 6/6] drm/xe/hwmon: Expose
 power1_max_interval
Content-Language: en-US
To:     "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>, <rodrigo.vivi@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-7-badal.nilawar@intel.com>
 <a5ae8a00-4ff8-495a-851e-9c830131ac35@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <a5ae8a00-4ff8-495a-851e-9c830131ac35@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 33770657-98fe-40a5-0b2c-08dbbb513d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6GUn2X92doPVHI5U9OrqvlXIQHM95KxvtqTJY8c2a8HpXTiQXHJEl6svIXzCCEnixXsc6tdGWE4sZ5CrOy4fh4OVbuL7g33C0jMj6YRMP7BfEC1K9VxoVGh1OQ9hWYiFbt4s6U+08nGYkMsfvz94jcbbEchoqddaLWSM8CN+BFzB7e9+FL5J95WjQswQiBVh2EEM8aqIMOqqdK5RYrpZyF1mTczrBO/N3H0ktxy0uzJNE8hFLQhutiujS7o5MjBlVIMK3VKsjfbJJRPefqk+bMA6rCYEGV6ZfOOREqK7/dhCkal2RO49brIh5sujO4nbnvjbsiGEX+9phZaAzp39MG0Fi9WRXC/asP5Um9qbGu0uwKqGsPrZWE4+pkP4NFHZ2KzekC8kUIOIM1LGgGc3Av+d7d+d6m/GjWGLULJu8ohX87Gu2Zd+OI7co37Uysfy6S2m1hNbvXfMA2aRUb2iJ5P4cuqyx7HGWDzTp60SuV/HmYMs2dLIA9xBx7u5I/Sg62yu81OK6AIgwTFAHchv2uUkKgY2Kfg9XocUnyYypPxyJPecqnO4YXltlFwCKG+7U/bWzCbYbhNwujOoTyoRawCACdRYs5m3utpxPGukPN9cQNI8yX17UZ6D+d0cX57DPbJLOjbznuP5at/crEjpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39860400002)(1800799009)(186009)(451199024)(6512007)(107886003)(6486002)(53546011)(6666004)(6506007)(38100700002)(2616005)(66946007)(66556008)(66476007)(31696002)(478600001)(86362001)(83380400001)(26005)(82960400001)(5660300002)(2906002)(36756003)(41300700001)(316002)(8936002)(8676002)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RThmcG5IUmswRHVjSHREaVgzWWVjN2FTU0Jac3YwRHdYLytsaWpyOXdwQzkr?=
 =?utf-8?B?b29XV08rTVQ4ZjdCSE5BSGllRmM0ZytCWXJNU01iQ29XK2xhN0VqVmhSdXky?=
 =?utf-8?B?QWUzU0pJME1KV3kwQUE0M0lGdXZ5MThvcU5SK2FXZjM1elFoY0ZNbVR5d1Bt?=
 =?utf-8?B?MExOTnRVY0Q3ekQwY1pnak9aN1BzdWh2VU03V01YTUszc0o3dDNCVkVkTGEz?=
 =?utf-8?B?ckViUDJrcEhmZnkzY2wxRURtNnBDVmZiTTRleVl2bmJ1YVlpa0VXRXVLUVdt?=
 =?utf-8?B?enRXR3FwbU9RcVBGRDZNSVhkYnJJajNYOFJiQTZ3ZkpETFlxZll5NjVPdHZ2?=
 =?utf-8?B?dE53ZDJyT0VTbGNnU2ZEOWpOZVh5dXFjTXBsb091NkVZQkE0ZHVORk5PRDUx?=
 =?utf-8?B?a285L2gyVGQ0RFRjbHhvUndoNzVWdUJpdmhFYWd3Y1pEZkg0a2xsbWxuenNx?=
 =?utf-8?B?N09mb1lyQ1lhL1RZNWUwYmNLY3VTZmpweFFnNlUxbmFHMDVkbVUvOUlsSnNI?=
 =?utf-8?B?dytIS25jWUNCRmlIRUVXbldqak85K0ZFQkdJSm45aW1XS3ZiWDl3dlF0ekNP?=
 =?utf-8?B?ZVFLTVg1RFdnVXl4My8raDY5Y1dPaE1oM1ozZGtvRWsweUJFOE9DMWg4aC9M?=
 =?utf-8?B?RmhBVmlDbkdxaUxWb1VSemZNQkwyRitCRkZ1RVI5d244VXBXeWdVWnp5WE1K?=
 =?utf-8?B?MWRnZDRMWkcxUTI1WWZnOWFRUncwdS9RTEV2YjRSL214ZGZ4SVJ5R25zWXdC?=
 =?utf-8?B?MnViSVVncnlSNUt1QmpYZ294SmhrakJRaE5uY2U2U1lkVUZMbHJobDBVZVkx?=
 =?utf-8?B?TzBHMksrV0ExWTVVelhTOFJYWktyNEljcTE4SExpTU9VaWpuV1l1eUFYV1JB?=
 =?utf-8?B?UWVUbitoNitGSmxEUndCVW9qcS9DWmFaMEhvcVdpMTFsK2RneDdrVjlkNTdU?=
 =?utf-8?B?VWR1eXZVd29uL1pHczkzRUw3UVlFM2MwM2NYNUFUOE1pN0x0R0JqTWtZVDZs?=
 =?utf-8?B?ck9rQzlJc0R0OTNUVXdkM2Vva2RFTmlKYXMyQ1k1Y2FCVjhzVk02RFR0STFJ?=
 =?utf-8?B?TnVhVWxvQmZsZXRBTU9OUEw3SHVqTnZnRUEyZzNldXNmNzNodlJxcCt5Z0dL?=
 =?utf-8?B?blh5UFdZYTVXQzh1by9lMjA4Zi9WK2xMcDJmTWw1aVhreCtOTFM0QlNBZ054?=
 =?utf-8?B?cmpPUXd2TUpKQ0dYQlgvWEZBZ1VsMjdicjFMbjhucDZET2NTQTBaZ1NwM1hT?=
 =?utf-8?B?VkJCczRtSUwra2hURHBEYWoxdHQ2Y09ncTUzek5EWitsa3dXY2orQmkvaS95?=
 =?utf-8?B?a1A2N0UzbzRvL2wzWWF6cmdkaWlvY1dxZXJNcjMvRExWbVJibHpaSFI2dXNy?=
 =?utf-8?B?eHg5MzNxZktqaUhnR0IzMWZ4M3pucHFpZjJML0ZLdWZSU0RDbmdrWit5dlJn?=
 =?utf-8?B?U2s0MjROWnRhemRzOWJrd2FuNVhhU3JOK1MwQWVqZHBRcW9XNStXZlZTSEJX?=
 =?utf-8?B?bFZWVVB5d3JpTzV6T21uL280Q0VWNGFhRWF0OW5pTkE1dmhtVzkwN3k4OFNi?=
 =?utf-8?B?Wm5LSHpuVGtwb0RJdjFJNGlRSXpHaFlJaGZJVU1rZXVkd1RVQzFjVlBNUHpn?=
 =?utf-8?B?TDhiWTJaemtINERWMnM2cHlhVURuVVZZbmhWN1FsaVc2blV0Y3dER3B4WVFh?=
 =?utf-8?B?bnZubmU2WW1Ia3pvd1RKdi90YnFPZUJoNGJrczR2dXFDWDdVL2hwVjV5bWFM?=
 =?utf-8?B?V04rMG1uRnJUeGgvbldvUVAzVzdaTE5jTjdrbWd1UkpIZzBISjN4dFpydXow?=
 =?utf-8?B?bXBtdUN5U3JOZW15OGdiRDZRS0l5ZVBhaGlJY0ZLT3NKS2Z2dFkvZk9LQU9Y?=
 =?utf-8?B?cWZtazdjYkR0NDQ1VHg4ZkdyUDFzZDBibzdHV0JwTk0vS1YzckJCTHEzV1kz?=
 =?utf-8?B?VUVtMVphK3RGa2FrZExIdXM0L3U5dzlEN1pEUDZ5MnpSTThGSUNlZFBJV0Rr?=
 =?utf-8?B?NFoxdnNCd3ZYNXFCTVYwQjQzcUlodFJFbTZWS1hwSEtTdlI0ejVMU0hiWmFS?=
 =?utf-8?B?WnNJazA1NEpIOHFGVm5WNTlzaTRJSVBsYlNZcG5qTHEvN1VWMERmQ1RuS1Rw?=
 =?utf-8?B?VEpOOE0yS3FienNFejhLQTdoclBjSjFsVU9ORFArVk1XOVhFNmtVeGJTaUpu?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33770657-98fe-40a5-0b2c-08dbbb513d6e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 09:49:40.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 487Yz8R4YPA8sm3KBGyyVUawUgOYAjnsDVUOuGczqaapbPvff0EUqUo0SZg5l6GGHkqBQf55ifN59RQHme/Qaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6492
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 21-09-2023 17:13, Ghimiray, Himal Prasad wrote:
> 
> On 21-09-2023 15:55, Badal Nilawar wrote:
>> Expose power1_max_interval, that is the tau corresponding to PL1, as a
>> custom hwmon attribute. Some bit manipulation is needed because of the
>> format of PKG_PWR_LIM_1_TIME in
>> PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
>>
>> v2: Get rpm wake ref while accessing power1_max_interval
>> v3: %s/hwmon/xe_hwmon/
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  11 ++
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 138 +++++++++++++++++-
>>   3 files changed, 156 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 1a7a6c23e141..9ceb9c04b52b 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -59,3 +59,14 @@ Contact:    intel-xe@lists.freedesktop.org
>>   Description:    RO. Energy input of device in microjoules.
>>           Only supported for particular Intel xe graphics platforms.
>> +
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_max_interval
>> +Date:        September 2023
>> +KernelVersion:    6.5
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:    RW. Sustained power limit interval (Tau in PL1/Tau) in
>> +        milliseconds over which sustained power is averaged.
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> +
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index d8ecbe1858d1..519dd1067a19 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -22,15 +22,23 @@
>>   #define   PKG_TDP                GENMASK_ULL(14, 0)
>>   #define   PKG_MIN_PWR                GENMASK_ULL(30, 16)
>>   #define   PKG_MAX_PWR                GENMASK_ULL(46, 32)
>> +#define   PKG_MAX_WIN                GENMASK_ULL(54, 48)
>> +#define     PKG_MAX_WIN_X            GENMASK_ULL(54, 53)
>> +#define     PKG_MAX_WIN_Y            GENMASK_ULL(52, 48)
>> +
>>   #define PCU_CR_PACKAGE_POWER_SKU_UNIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>>   #define   PKG_PWR_UNIT                REG_GENMASK(3, 0)
>>   #define   PKG_ENERGY_UNIT            REG_GENMASK(12, 8)
>> +#define   PKG_TIME_UNIT                REG_GENMASK(19, 16)
>>   #define PCU_CR_PACKAGE_ENERGY_STATUS        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>   #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>   #define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>> +#define   PKG_PWR_LIM_1_TIME            REG_GENMASK(23, 17)
>> +#define   PKG_PWR_LIM_1_TIME_X            REG_GENMASK(23, 22)
>> +#define   PKG_PWR_LIM_1_TIME_Y            REG_GENMASK(21, 17)
>>   #endif /* _XE_MCHBAR_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index cb75b9a386c0..dfa638942d47 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
>>   #define SF_CURR        1000        /* milliamperes */
>>   #define SF_VOLTAGE    1000        /* millivolts */
>>   #define SF_ENERGY    1000000        /* microjoules */
>> +#define SF_TIME        1000        /* milliseconds */
>>   struct hwmon_energy_info {
>>       u32 reg_val_prev;
>> @@ -50,6 +51,7 @@ struct xe_hwmon {
>>       struct mutex hwmon_lock; /* rmw operations*/
>>       int scl_shift_power;
>>       int scl_shift_energy;
>> +    int scl_shift_time;
>>       struct hwmon_energy_info ei;    /*  Energy info for 
>> energy1_input */
>>   };
>> @@ -255,6 +257,138 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long 
>> *energy)
>>       xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>>   }
>> +static ssize_t
>> +xe_hwmon_power1_max_interval_show(struct device *dev, struct 
>> device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    u32 r, x, y, x_w = 2; /* 2 bits */
>> +    u64 tau4, out;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +                 REG_READ, &r, 0, 0);
>> +
>> +    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +    x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
>> +    y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
>> +    /*
>> +     * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
>> +     *     = (4 | x) << (y - 2)
>> +     * where (y - 2) ensures a 1.x fixed point representation of 1.x
>> +     * However because y can be < 2, we compute
>> +     *     tau4 = (4 | x) << y
>> +     * but add 2 when doing the final right shift to account for units
>> +     */
>> +    tau4 = ((1 << x_w) | x) << y;
>> +    /* val in hwmon interface units (millisec) */
>> +    out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>> +
>> +    return sysfs_emit(buf, "%llu\n", out);
>> +}
>> +
>> +static ssize_t
>> +xe_hwmon_power1_max_interval_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    u32 x, y, rxy, x_w = 2; /* 2 bits */
>> +    u64 tau4, r, max_win;
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /*
>> +     * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 
>> 0x12
>> +     * The hwmon->scl_shift_time default of 0xa results in a max tau 
>> of 256 seconds
>> +     */
>> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> 
> Do we need to determine r, x, y etc for max limit ?
> 
> Why cant we simply define MAX_LIMIT 256 ?
PKG_MAX_WIN is field of PKG_PWR_SKU but it is observed that for some 
platforms it is invalid and for some not populated. So fixed the max 
limit. For future platforms if PKG_MAX_WIN is valid then it is prefered 
to read from register, in that case below equation is needed to 
calculate max limit.

Regards,
Badal
> 
> BR
> 
> Himal
> 
>> +
>> +    /*
>> +     * val must be < max in hwmon interface units. The steps below are
>> +     * explained in xe_hwmon_power1_max_interval_show()
>> +     */
>> +    r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>> +    x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>> +    y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>> +    tau4 = ((1 << x_w) | x) << y;
>> +    max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + 
>> x_w);
>> +
>> +    if (val > max_win)
>> +        return -EINVAL;
>> +
>> +    /* val in hw units */
>> +    val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, 
>> SF_TIME);
>> +    /* Convert to 1.x * power(2,y) */
>> +    if (!val) {
>> +        /* Avoid ilog2(0) */
>> +        y = 0;
>> +        x = 0;
>> +    } else {
>> +        y = ilog2(val);
>> +        /* x = (val - (1 << y)) >> (y - 2); */
>> +        x = (val - (1ul << y)) << x_w >> y;
>> +    }
>> +
>> +    rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | 
>> REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
>> +
>> +    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
>> +                 PKG_PWR_LIM_1_TIME, rxy);
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +    return count;
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>> +              xe_hwmon_power1_max_interval_show,
>> +              xe_hwmon_power1_max_interval_store, 0);
>> +
>> +static struct attribute *hwmon_attributes[] = {
>> +    &sensor_dev_attr_power1_max_interval.dev_attr.attr,
>> +    NULL
>> +};
>> +
>> +static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>> +                       struct attribute *attr, int index)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    u32 reg_val;
>> +    int ret = 0;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +    if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
>> +        ret =  xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +                        REG_READ, &reg_val, 0, 0) ? 0 : attr->mode;
>> +
>> +    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +    return ret;
>> +}
>> +
>> +static const struct attribute_group hwmon_attrgroup = {
>> +    .attrs = hwmon_attributes,
>> +    .is_visible = xe_hwmon_attributes_visible,
>> +};
>> +
>> +static const struct attribute_group *hwmon_groups[] = {
>> +    &hwmon_attrgroup,
>> +    NULL
>> +};
>> +
>>   static const struct hwmon_channel_info *hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>> HWMON_P_CRIT),
>>       HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>> @@ -573,6 +707,7 @@ xe_hwmon_get_preregistration_info(struct xe_device 
>> *xe)
>>       if (!ret) {
>>           hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>>           hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, 
>> val_sku_unit);
>> +        hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, 
>> val_sku_unit);
>>       }
>>       /*
>> @@ -612,7 +747,8 @@ void xe_hwmon_register(struct xe_device *xe)
>>                                   "xe",
>>                                   hwmon,
>>                                   &hwmon_chip_info,
>> -                                NULL);
>> +                                hwmon_groups);
>> +
>>       if (IS_ERR(hwmon->hwmon_dev)) {
>>           drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", 
>> hwmon->hwmon_dev);
>>           xe->hwmon = NULL;
