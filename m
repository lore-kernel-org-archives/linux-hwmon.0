Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91321C0015E
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jul 2023 18:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjGESbq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jul 2023 14:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGESbo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jul 2023 14:31:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A161E1
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Jul 2023 11:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688581903; x=1720117903;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=66ajukBWJwMrTxUxWuVQjlFGPnywCaa3yde8zCDtYn8=;
  b=n9sfagEtRb9y9g9GrnULLt5AAbwK1+iD5Mh5Gem8kqIqZRXngxuB7pdR
   CgPhd0Tyz6nboeOWMuDF2w0iuXvTHikQ3G7AVFOvkgQwP+OPR3HkTDeV8
   ZOpCiqJwnDgDZKwJDchv3TA5avpAOYOfir4BzlP9lnes+DRhdFkHP2TwQ
   KK9b79yNCCr/QRA/8Bc+rCjOTC0701wZKHYTgPI9Nb7MBwA+ioUgdgirl
   ZeXEln/Xf40gSVb1gJDlvnOme2ccQ6RAKWKZ215gzVGhpEQwvktPjRx8d
   rNnPIa9Ox1eXiNfEQog95lvvbHMTeUKMFeFc/jiozqHLytBm59TDPKjIi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362283670"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="362283670"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 11:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="748825260"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="748825260"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 05 Jul 2023 11:31:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 11:31:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 11:31:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 11:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8QokGLAGtfSXGaZsc20JYd49ssXZ35E64mFKvL6hKuHan2/D+Cb7czDqFNxucuWZSo2RJlsbWxHl2Z7T7VvyBbqyhSs2f/Zfl8J+80DVMKMFApjs9GtzaSAEMZ792O7FjMuppRJr/CkyzbUy403/rNwPcnSxLRp9mug1kNYi/S3oFzijnJNrHNTC3sxUPw4ISTrmwrfTtZmfWyW/Lf+5oYEaw/OAPSqvLJRN+8mgxAeUcvx7eHq37M/evagfyqItLkdRGQ2nT4fWTn8mxSzSOD9iDghd9WcDUIt8RPM6rZiKJvH1XDYS/3Ayw2XUINpeGehf6vtbk7ZNBJxtWx0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5JKgEtTEShNYGPQOYNbY7SExnsLEXUOs+EUC+EjAeA=;
 b=YQVr+wJPfI3HSypKYLYpyL5deEHAnoTsp4V2jHSNuP7ME1ut9R8opMKPh/ZtohJ5KV1f+XSzXIrCpXmMrPPTMyuU9xzUWHt8COLYf99ne4KsFGG//idYefuU4M4wDaD8LmtxKNgNbgt+f62yNwyiny8fKUqV4uPc6cDIpxgbVVqdqUtyhl6NxL/JWWcUEWvBo08B9u81bTnxqFLxsGcLFle51ktp9VBhuZY0hP4Q7TDGlJZlvyqgvGr5eOBw85EhnCSWj1+y2vwTLxJQfXd9A2vdoxRkvWaK3i0K6hRcERCYE+HSrkc2CeW0aW4YdBizvd68e/Mofs/3qQEz+QMSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 18:31:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 18:31:06 +0000
Message-ID: <7ec3728e-2f11-35d1-471a-dace65397112@intel.com>
Date:   Thu, 6 Jul 2023 00:00:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/6] drm/xe/hwmon: Add HWMON infrastructure
To:     Matthew Brost <matthew.brost@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-2-badal.nilawar@intel.com>
 <ZJy5ShcLc40EFGq5@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZJy5ShcLc40EFGq5@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d4d85c-9e5a-42b9-ea92-08db7d85fe61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVjGLOMjtLSCuWQOtur/tT33kXEI6tJ1RjRdlJ5bvJMkKhFselIKLUYuLZIRkzgrygQWmi3jrKS4iC+dPrpbT6dR30fQOwiEaHMQ3r2HiPrj//oIy7CG31BYfatnwkREjfk132pBhqy66blNsTG72rGjbhIUnolmYiC2UI3cZaNJoBYGiECVF6Bai7ZV8sMd1wTsC62QsLUpxeLYrbQEwQxUC9KpNet2bcxEOlJScXLD6j1F1CNHERCln5kqzlPb3ms4DLyvTF0mFJVj9A0CdNYWFHL4lvyckIj3m9S4iEQdpwziIlSUiL0KqN2RZUoOZmu+VenuC3xdbDOG+95Tz3k0POLc27yblSBINkdXbLGaXSe114Pu9sWCgD61qrG+drHi4eMEYI0VRzq9sz3mwgAol3zu4/gcXVn2CJV2EqBuGxqbF7grezLHKSCeIRtbqbdL1g2MKgA+XffI8ocgvxUSIBKp23lpJB39dq4ay/r6TK5GPv0/Qh2hRz4tpO2SAiXHpWl5CMgBkuj6Ie1M+qMXuIeRnqtHtCpVrNWk1fMwVIutBd8CR3Qb8fYcLDMVbxVIUr4uotxWzMRNauXdUHddCBcSvV4s4Bz0vESI8FJF+bfj93rJFgLh2l22jy5QzNZc7fC2rAqxaUME6KwY1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(53546011)(5660300002)(2616005)(8676002)(31696002)(86362001)(83380400001)(38100700002)(82960400001)(41300700001)(316002)(66556008)(66476007)(36756003)(6636002)(66946007)(4326008)(186003)(6512007)(37006003)(6666004)(478600001)(6486002)(26005)(6506007)(6862004)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWU2M1k2QWJTRGwrV21YWWRQck1NdE5kNVVSYlJXUGxDWlc2N2l2cHZiVDBo?=
 =?utf-8?B?R3NtWTJleE05QWxOYTJMT0hLdXdtaWZpQlVndkRMd3RQZjMxZlJVeFZkNzRK?=
 =?utf-8?B?cG1CbzhKcy90RlovMnNoOXY3bEd5VTlON21ETkQzSXl3MFlWZ0xndGUyWlFV?=
 =?utf-8?B?aHNHK1JYOU1rNjNHRDV1WThiMUpsb2kyMktUNjJBWktQWndmSlRWQzlYMlc3?=
 =?utf-8?B?THhLbjVqbEZlTFUwOElreHVFait0NHBnOXJRK3hJWElBck5VaFAvVTZsWmx6?=
 =?utf-8?B?dnl1ZW1GL0ZINXBrRUV0QzVmL0FTUFhZaEJDd0FXcjFTbEVzSFRRUjhnSmhM?=
 =?utf-8?B?ekdJS255OWdXamZsV2lTWitTTFNmdm9wbW5GWGo3eWRlUmdXT2ExRVRuTGVM?=
 =?utf-8?B?TzdFKzlFSkkxUEhDK2RWdDljZlkvUTBGSVBwbVpCQ1I3aWxaY2xvRjUrcUdE?=
 =?utf-8?B?OGp6R20yR25DVjFDSG1WYUxkZ0ZnVC92M21CMlRLV2RFUzRNTGRDRUdwNnBT?=
 =?utf-8?B?R25leTVJOWJsbm1qQXVJcDljTktHRDA0ZkdhcDNCMDMvYlR1TU9JRG5LMnVt?=
 =?utf-8?B?VXZ0bVVweVZJb3g3Ymp1R1RScjFuK1hEZVB3eTNyWTRzSzN3SXhyanVTdlBy?=
 =?utf-8?B?dGxHa0VvV0Q1OTNaM0xkMXpuK0J0cjN4VTErR3EwZ1RnT3FEb3AzODFKbjhu?=
 =?utf-8?B?enl4V2xkZ3J3aGs1T21qRFNFTm4rN1VpRWZ5UnZhTHI4UURGMDI0YlVkRzFs?=
 =?utf-8?B?MkJxelYyanlyUXI4NUhZQk80ZjJRNUdIVDFhdHYyNStHcXQwUGhmVFVtcFl2?=
 =?utf-8?B?VVJiRHU1QnJjUzhwRS9aTWluZk40UXhTYmhIK0Zqa1dPd2U0UTlTR0U1N3JV?=
 =?utf-8?B?dG9LQjRMbCt2NHloUXgrWGVOOEVPSGRmR0t6VUN6b2tJVWtrd2hGYWgxdGdp?=
 =?utf-8?B?L3hrcFR2Y1FmeEFxRzQ3anUwZFEyQlhYWSthZlZpT1BYVzE0b2lvck1UMG5a?=
 =?utf-8?B?ZmpscGVKcldWVlZLeWZIWVlDSEVZd1NmbHdkbTRTUHorcUJzZm0vNFZuZmlv?=
 =?utf-8?B?ZzVlc0hYejZNZ2JmdjQyb2V3RVJra0NyTkVabXovNUpxVmQ3YWR2aUhlOE4r?=
 =?utf-8?B?dENENnVBL1llb0ZXTGdxSDhVMGZ4cTFiOFpSUGhEaHhEYWVBWHUvN05pUGlz?=
 =?utf-8?B?NVVyMUdsVm1YZzdaL3l6UUwrdTJjMHUrek14WDVRdDFEa3RlSVJNbjhHTmZL?=
 =?utf-8?B?NHEyN3dKOWJKMXNBWWlTbXcrR01iRVZPdVVLUlJEQ2t5bzlZMFp2QnByYkZv?=
 =?utf-8?B?M2VmUnB3c3ZOSVFrcWM3bk9IUzN0S1hhejBmQXYxK0JrU213NHk1OUoxZWR0?=
 =?utf-8?B?Y3hkNXgxSFRscGV6RjZpRzJXVTFycGNpQ3E3STYwZTNnT2R5UVFvTlR4SkxW?=
 =?utf-8?B?aVhQUi95NE5pek96bmwvSmZDbkxORHRlNjgreDR0TjFPZGswTiswZHZBY2lz?=
 =?utf-8?B?V1lXckUvc2VNSExyNVdIM2trN3N6Q28xN3d5NDZEQ000d3VLY2NFZW1oSDMw?=
 =?utf-8?B?eC9DckxvK2ljQWZpTE8rWldoRXZoYTV4OXIxNkFveWs5VkJweU90WXdoS1dy?=
 =?utf-8?B?L1lDZHlnR3JhNkYwT1V4dXVuZVB5L20zWDlQZEErZndiL2pLTkltTnFWVVZz?=
 =?utf-8?B?a2Z3UElxY1U2MWRyckoxaVBVbjExWXBZZitRcmxmUGVDKytOd0pueTNUczVz?=
 =?utf-8?B?SFFDbnhjOVdIVjJRTlJQdExsUk5JM3VXTmQ0MEpzUlBPNnhuenlMQzVxZDdv?=
 =?utf-8?B?bGlEUmdBSGNhR2dQZVRhWXVqSE5NQzZlOEZJQnU5WGtSOTB6TEFMUUlOdHBt?=
 =?utf-8?B?YlNWaEpuTUdOcFZMWnltMXpIa1RRYmdwemh0OHlQQ0ZnNElQdnlFanNWRkN6?=
 =?utf-8?B?YW5UclN6aC92SXNtM0g5TUl4eUFYRHFFTEdOVXhRQzNISTkvL2dKVUxOZGxt?=
 =?utf-8?B?T1RycGJrM0dKL3h0Qk5SK3FSUTVHZFhVYnYxME5BT21mK1VUeW01NCtudW15?=
 =?utf-8?B?SEtKNFVZYzViRFo2Ylc5M0NFWlI2RG1JbURUSFEzRkl5T1pZWGdKbktlSXpB?=
 =?utf-8?B?Y3oyYjFJalB0RTdxN2pheVBHOUNjdUQwOHY4ekN2MW0xZDdIZ2NlaUVRbDR3?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d4d85c-9e5a-42b9-ea92-08db7d85fe61
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 18:31:05.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fa1aXq3eW4STmzrDS4r1fIBfxQMX/wIbJhlswnn3I/ChhpP3FuutvY6xe0tEEkk1D+KrAUI4/sfGnKi0zU5nYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Matthew,

On 29-06-2023 04:20, Matthew Brost wrote:
> On Wed, Jun 28, 2023 at 12:00:38AM +0530, Badal Nilawar wrote:
>> The xe HWMON module will be used to expose voltage, power and energy
>> values for dGfx. Here we set up xe hwmon infrastructure including xe
>> hwmon registration, basic data structures and functions.
>> This is port from i915 hwmon.
>>
>> v2: Fix review comments (Riana)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   3 +
>>   drivers/gpu/drm/xe/xe_device.c       |   5 ++
>>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c        | 116 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.h        |  22 +++++
>>   5 files changed, 148 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 4b82cb2773ad..e39d77037622 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -113,6 +113,9 @@ xe-y += xe_bb.o \
>>   	xe_wa.o \
>>   	xe_wopcm.o
>>   
>> +# graphics hardware monitoring (HWMON) support
>> +xe-$(CONFIG_HWMON) += xe_hwmon.o
>> +
>>   # i915 Display compat #defines and #includes
>>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>   	-I$(srctree)/$(src)/display/ext \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index c7985af85a53..0fcd60037d66 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_vm.h"
>>   #include "xe_vm_madvise.h"
>>   #include "xe_wait_user_fence.h"
>> +#include "xe_hwmon.h"
>>   
>>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>   {
>> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_debugfs_register(xe);
>>   
>> +	xe_hwmon_register(xe);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>   	if (err)
>>   		return err;
>> @@ -354,6 +357,8 @@ static void xe_device_remove_display(struct xe_device *xe)
>>   
>>   void xe_device_remove(struct xe_device *xe)
>>   {
>> +	xe_hwmon_unregister(xe);
>> +
>>   	xe_device_remove_display(xe);
>>   
>>   	xe_display_unlink(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 0226d44a6af2..21bff0e610a1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -332,6 +332,8 @@ struct xe_device {
>>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>   	bool d3cold_allowed;
>>   
>> +	struct xe_hwmon *hwmon;
>> +
> 
> You likely need a 'struct xe_hwmon' forward declaration at the top of
> the file.
Sure it will move it to top of the file.
> 
>>   	/* private: */
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> new file mode 100644
>> index 000000000000..8f653fdf4ad5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -0,0 +1,116 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/hwmon.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_hwmon.h"
>> +
>> +struct hwm_drvdata {
>> +	struct xe_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +	char name[12];
>> +};
>> +
>> +struct xe_hwmon {
>> +	struct hwm_drvdata ddat;
>> +	struct mutex hwmon_lock;
>> +};
>> +
> 
> These two structures look very goofy, e.g. why two 2 structs instead of
> 1, why a back pointer in 'struct hwm_drvdata' rather than using
> container_of? Just make this one structure?
In energy patch to cover gt specific energy attr there are multiple 
instances of hwm_drvdata defined. which creates saperate hwmon entry for 
each gt. But I will think about adding one structure.
> 
>> +static const struct hwmon_channel_info *hwm_info[] = {
>> +	NULL
>> +};
>> +
>> +static umode_t
>> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> 
> Nit and matter of opinion but...
> 
> s/hwm_is_visible/xe_hwmon_is_visible
Throught out driver prefix hwm_ is used for static function and for 
global functions prefix xe_hwmon_ is used. Instead of hwm_* prefix 
hwmon_ prefix can be used.
> 
>> +	       u32 attr, int channel)
>> +{
>> +	switch (type) {
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int
>> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	 int channel, long *val)
> 
> s/hwm_read/xe_hwmon_read
> 
>> +{
>> +	switch (type) {
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int
>> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +	  int channel, long val)
>> +{
> 
> s/hwm_write/xe_hwmon_write
> 
>> +	switch (type) {
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static const struct hwmon_ops hwm_ops = {
> 
> s/hwm_ops/xe_hwmon_ops
> 
>> +	.is_visible = hwm_is_visible,
>> +	.read = hwm_read,
>> +	.write = hwm_write,
>> +};
>> +
>> +static const struct hwmon_chip_info hwm_chip_info = {
> 
> s/hwm_chip_info/xe_hwmon_chip_info
> 
>> +	.ops = &hwm_ops,
>> +	.info = hwm_info,
>> +};
>> +
>> +static void
>> +hwm_get_preregistration_info(struct xe_device *xe)
>> +{
>> +}
>> +
>> +void xe_hwmon_register(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct xe_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +	struct hwm_drvdata *ddat;
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
>> +	mutex_init(&hwmon->hwmon_lock);
> 
> drmm_mutex_init
Sure I will change this.
> 
> Matt
> 
>> +	ddat = &hwmon->ddat;
>> +
>> +	ddat->hwmon = hwmon;
>> +	snprintf(ddat->name, sizeof(ddat->name), "xe");
>> +
>> +	hwm_get_preregistration_info(xe);
>> +
>> +	drm_dbg(&xe->drm, "Register HWMON interface\n");
>> +
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>> +							 ddat,
>> +							 &hwm_chip_info,
>> +							 NULL);
>> +	if (IS_ERR(hwmon_dev)) {
>> +		drm_warn(&xe->drm, "Fail to register xe hwmon\n");
>> +		xe->hwmon = NULL;
>> +		return;
>> +	}
>> +
>> +	ddat->hwmon_dev = hwmon_dev;
>> +}
>> +
>> +void xe_hwmon_unregister(struct xe_device *xe)
>> +{
>> +	xe->hwmon = NULL;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
>> new file mode 100644
>> index 000000000000..a078eeb0a68b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_HWMON_H__
>> +#define __XE_HWMON_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +
>> +#if IS_REACHABLE(CONFIG_HWMON)
>> +void xe_hwmon_register(struct xe_device *xe);
>> +void xe_hwmon_unregister(struct xe_device *xe);
>> +#else
>> +static inline void xe_hwmon_register(struct xe_device *xe) { };
>> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
>> +#endif
>> +
>> +#endif /* __XE_HWMON_H__ */
>> -- 
>> 2.25.1
>>
