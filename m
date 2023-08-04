Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FE0C001DF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 13:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjHDNcg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 09:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjHDNcb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 09:32:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262844221
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691155935; x=1722691935;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LHk1np8nHuoc3ps+WjQNP5D8ChU5323YP+R+bRubZrg=;
  b=k5ClBXMhyWZkYq5xo6OL71JL4t7gewmasTv8FULKLvljOZNJZfw/nHWY
   s/3arIRrpj2WszzSn7shOieUDAylje7lcUSYF3GdlgtrtctGNeTEr/C9n
   h8FulEyrC3TxRHTBgVEp5YIzJB6/KQo3jJERynVHHArvEF4S7hl0Nyqzz
   jfkMStPtgAkfaokUH7PC3RRc7prJSr2FVq125risGhUgUBMXmixqoKup4
   Dw93K9eOyh4ldZAjz9qUNJdIUiMWSAEqwa08+qEAHhrcDQ90/Wtc5bK4W
   Aia+F32VoGu/Ge2j3qbJK8MdNtobDXk0ZeeFA+FWcDkaYp0LZyDSfwLp4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="355087477"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="355087477"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="730072528"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="730072528"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 04 Aug 2023 06:32:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:32:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:32:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 06:32:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 06:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNVksZcNvaVKx1GOPFgi8/7xeBbtZ4+E4iEzbcs//R/ak1X8mGkmgcmKMab61xjmLjYQybtegAon3NiEJ6c6YqxLOf7K4poNtFPP39JAJHFXQy61pFWxJq8u5/MtmanlebLddqSgFboXliFcQvHDOBsmevJ9Jp+qVA15XS7uX2lXfpIztgg/Ffo89wQas6s5Ezs1QEhZHGl7fkquqG9M6uvUW1/8A2sOqXag2ZvuTxqgRP1Q7PDVrpwtU1fN0x3H1WaLPuS+dPCf+OiVuOaOzyZHBxREnHPFjAueDotZtAwRP+xwj88oKdQepZMIFsxNT5MtyRw62DrVP6dnLYUElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfFaKYNcocoeFcuj6Dd8tqXkj33dOFPw781xTeidJZE=;
 b=EYBsqG8jW8kpCO1QmdGFnjN49ydk/ndSPD3HAiJwwkrWl9QU8GSZpWrI29ZgGewyRHP+XBHADeaNUBFQKXcfGKJ7m5Y9N/4/q98nhwn4KnZ5y/xqOk4lnx9H6YXRdk5kpqmj3gTQ3EicRCQtBOzPV+Xjw9lPgYJgPGk3M9L3b57pTC/fD/vqgTlnKsfy8jGBU2MPnWFH2rsqKoJm/XKDxhOw09Vwa8VsggA/wdHjkU0CF2e0vfR71YoDdxgJly5Yuk2adsp3/3qnSVPTYlxG8rBPE3zO7x2mkgbOjVU0+0QWoGk+IHL4VxxGeKVrzsNGMGKTc1lR+somH++OWWMP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB5507.namprd11.prod.outlook.com (2603:10b6:610:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:32:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 13:32:12 +0000
Message-ID: <f2ccce13-3ad0-3a41-0341-d6b593eb111b@intel.com>
Date:   Fri, 4 Aug 2023 19:01:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/6] drm/xe/hwmon: Expose card reactive critical power
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-4-badal.nilawar@intel.com>
 <ZMrmj9PsP4H0b+ZM@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZMrmj9PsP4H0b+ZM@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB5507:EE_
X-MS-Office365-Filtering-Correlation-Id: 5769af8b-cbe6-4848-4e3f-08db94ef353e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pYObfsfvOk7nOGCn5MoYUJijx16XRYiK+p14MMMNIN86wvE/5uFi8B1OnFRudYh2rsIWkO4xl9ZIXcGnVmRzntIltm4sfDJKqkJUHC5axohpRQ7AtEAo8gCvsHnwH5CsEcI8mQcZhUAy5mhr2Ze3DBSaq2fvmrTbjm3jkAXash6PZSi/55we+dWhwTrwyFU00+ofoakA3fE+igX0d8uKb8CXiREL0GeN4cQXIQUt+05pZqaduXR2vVlBsF40LkAhljmJOkk+3tq9cla38vpRVf7JV7c7kIyEbGKHn/5/SaSKNwmNMA8oi5AQf+sNmYhibQ3eB9keKLRBS9aRtvfDM69vd1+ysdAU9laMDuKhJtOQ6tg3ZgCXmTvc0bYOXhAoN+CFOAS6YJLpWrjasZmnHVa3tNPB2uokF+PQJiP/haHj4u5ZROuMlEEAa+0MZX+4MIjPDHYkSwzzKT8pFBb0ljhx27r1+8915C9f9U8xsKohGOqxvwzu2hYbBGO8Smsu90Vv4aGKJZI9uXeFlkCYU346I1blXMIT2KowUkeCCKkLwqpvIipt/GhBuJECQFf15zl2WVslSFWXgqRteQq/+sZKGQIu4vp1YWrCM2cPH29jhV1BjRQvJH6r7tpCy0W5z86PG/ll/B34TzDZ3HFPQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(186006)(451199021)(1800799003)(66476007)(66946007)(66556008)(4326008)(6916009)(2906002)(82960400001)(38100700002)(2616005)(53546011)(6506007)(83380400001)(86362001)(6512007)(31696002)(26005)(478600001)(36756003)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNnUzdQVDZ4NXVOUW8yclllbWoybnA0TitMOGtRcDNWK0lOcDVMNkFLakU1?=
 =?utf-8?B?WUhwSWp5ZWxnOURnUGFOSEhuenYvNFF2Wm5JbzhMTVhCZUFIZHlPVGR6VnF1?=
 =?utf-8?B?K0Y3SHl1WW1scVBuRHlWR2ozblVxUVU2ZVFVWDFTYkRnQWxMaDVjY3BYSGoy?=
 =?utf-8?B?S1RXTndmQnpDNjJ2N1JEbmt4V1cwZmFrMW9zazEzamJiYXhrZ0R4aDg5aUx3?=
 =?utf-8?B?ZnVWS1pjTjNyK29QSXVMcE14cGxScnVZZWVZalRwSVRNVVdFR285MEcrZEdz?=
 =?utf-8?B?enZuL01TRG5yNGRpZ0kzQVJuQWxQWVhueWhnUHVuSUpIWVdKblUydnM5OTY0?=
 =?utf-8?B?NXBQZkFPVU1SdU8zUEhtMnFKNFg3U0ljblI2QTBRbFVjYmdWaTJqcG0vNnZV?=
 =?utf-8?B?ZWRnMGhWK2pyODRzeHNLTFM1WUJaOE12aThDdnFtelR3YjRiUk5WTjZ2Vnda?=
 =?utf-8?B?cTVuVlpJQzNReHEyTHAzWGErZGRqZmZxdGhRaWJ1U3hPMjA2Tjc2MU1DaEJy?=
 =?utf-8?B?TGx4ZnJSVlJjQzYvMUNxMWwreFRHTGVnK3lqcjFvbWNFUHVsYm5KR1NpR1Er?=
 =?utf-8?B?MEtBaXpUUEovN0I0aUwzSUF2eFltaXpZcjFNbmJIVFRBcWkvaVdEZ2FvQUJK?=
 =?utf-8?B?NjloOE9xZXcvbTlPSTYwa2tQVTNzQnRxOTdib2Y2blg5dFFMdC9vdnM0aC96?=
 =?utf-8?B?aUJjYTFVUVR6dU42SURaSGJvZ0VTbWhreUVaTWFYZGwxaXlwVWxSYkI2bnoz?=
 =?utf-8?B?STNjMlZsdElvSDBkQ2dZcG9ua2I5Y3ByZ3EveVBYWlpmSUhpeDdRSzFZcDdS?=
 =?utf-8?B?Z05Jb1B2ZGdnc1FRZFRXOVZlQWtCRm1RTEpMWnN2dFR5T1drTTRWbi82dklv?=
 =?utf-8?B?QVV6TmpTQXVlbGRZOEJ2dm9YdmlGdGdZWDhWL05QMVBVcVhwSEtqM010eTVJ?=
 =?utf-8?B?NVN0WDIyNVl6ZjVxZVFSbGsyTlNIVzFNb3dVRTE0dEFlMG1Qam9JcDBtaHRJ?=
 =?utf-8?B?WHdNTEh2a1o3L3h6YzVxakthR0xUcUsxRmQ4L3ZwTE1QU0EwaTJBbjVTUzhx?=
 =?utf-8?B?S3R6TTljY2xacjFDMXZ0ZEg2bWJtRW1ZcGE2QXJYdWZDL0c3VXpvem1yYVFy?=
 =?utf-8?B?bGwyTWhiL21aa1NiU0ZBSmxCUXgreXBJMy94ZUhBQmZDbG41b3M1TU9WUGZL?=
 =?utf-8?B?dWRJMXlmS0hiL3luR3ZUN2lXL1ZPSVdFcTFkMDVpYUpCRVg4ZXZvN2NSSmd5?=
 =?utf-8?B?TE9qamRQNWpVMXhzVXZnNFRDUXJueDVCL2JzekZOeWN2eVpCTzMrMk1aSGNT?=
 =?utf-8?B?bkZZTGJyNFdKcldsNEwwNndiQi9FaFZxVm9XT25tcEVEM3ZyNmo1ZnpkaXdv?=
 =?utf-8?B?b3VVcTJMc1pBNGpqZk1kcGZlUzhReG56RWVmdzBkdklodmVmYm9FWnhncmFO?=
 =?utf-8?B?Nk9XWFJKMHhRLyt0K244TkRoT0RhWjRsbStDTXBGTUtoRkNoRlIvVk1tMFpl?=
 =?utf-8?B?NzdCVlZnRmJlSWhnc2F6RzdoZngyKzNDcU04c2pCemYvQjVOVjVSRERVU0Qw?=
 =?utf-8?B?UmV6WWhUY1RQalZvZ2tuZFlYVTBsMDlOZVlEVGY4NStqclgzSnFQT1QrTFNS?=
 =?utf-8?B?TmpQb2NBNU5JVkRlWGFjK25NbjlXMXlGT3pSRmNXSzZ1bXlleDkycGg2OFhE?=
 =?utf-8?B?MDNHM01CRmIzNUtOV0RPRU1Sb2NYQTc1SHd1NjAxWG84R2Q2ZGJnQTNjV2xJ?=
 =?utf-8?B?UVFKM0JXcWM1VUNnVmFneHlYUVUrZCtLRVZ0NWRuQS8xYlFtMEVoendJN1U2?=
 =?utf-8?B?UFZkOGpXWkJLMmFEUGNXVVU5V216OEtSQVdlU25RaDRqc3ZOa1RQVU1CdDNH?=
 =?utf-8?B?L0FQS3Y3U0xGR0tpa2ErSmJEellZOEVNdlBDQlFLNVBHOHpqNjhQZmJsZXFI?=
 =?utf-8?B?bXVubkpRSU1CVkV5czZrZlZxOGFqTnJ4eGFCRXRHK1lOYzJHcU5zSnNkM2tt?=
 =?utf-8?B?eUhreW1YR0VoR0FIcG5yY2pzOXM0RXpzdnZVSjVnank2dEV6SHJKdERoR0Yx?=
 =?utf-8?B?MVAzKzJNaTAyazVBbCtDbkNQek42MHhHR3FGWXZsUmMrN25Fc2NOeks3bmFZ?=
 =?utf-8?B?NjVlbHROOEs3U096bWVxbHdDcElhTEVEUkhTWU1ZMHlOQ1N0OThROWlxQkdE?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5769af8b-cbe6-4848-4e3f-08db94ef353e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:32:11.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEsPQRST1eqXKe3VjxLt16wEGttgmNkhkHPO7TaUZz92SfTlu/KQLAkAIR4tukaZQ2CalEWRfIRURvBBHi4ygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5507
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 03-08-2023 04:58, Andi Shyti wrote:
> Hi Badal,
> 
> On Wed, Aug 02, 2023 at 07:22:38PM +0530, Badal Nilawar wrote:
>> Expose the card reactive critical (I1) power. I1 is exposed as
>> power1_crit in microwatts (typically for client products) or as
>> curr1_crit in milliamperes (typically for server).
>>
>> v2:
>>    - Move PCODE_MBOX macro to pcode file (Riana)
>> v3:
>>    - %s/hwm_/hwmon_/ (Matt Brost)
>>    - s/IS_DG2/(gt_to_xe(gt)->info.platform == XE_DG2)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 106 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
>>   4 files changed, 143 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index d48d98f903ed..ea60add73743 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
>>   
>>   		Only supported for particular Intel xe graphics platforms.
>>   
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>> +Date:		August 2023
>> +KernelVersion:	6.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
>> +
>> +		Card reactive critical (I1) power limit in microwatts is exposed
>> +		for client products. The power controller will throttle the
>> +		operating frequency if the power averaged over a window exceeds
>> +		this limit.
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> +
>> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
>> +Date:		August 2023
>> +KernelVersion:	6.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
>> +
>> +		Card reactive critical (I1) power limit in milliamperes is
>> +		exposed for server products. The power controller will throttle
>> +		the operating frequency if the power averaged over a window
>> +		exceeds this limit.
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index ce8dac2168f6..ceab142f6d42 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -12,6 +12,8 @@
>>   #include "xe_hwmon.h"
>>   #include "xe_mmio.h"
>>   #include "xe_gt.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   
>>   enum hwmon_reg_name {
>>   	REG_PKG_RAPL_LIMIT,
>> @@ -28,8 +30,10 @@ enum hwmon_reg_operation {
>>   /*
>>    * SF_* - scale factors for particular quantities according to hwmon spec.
>>    * - power  - microwatts
>> + * - curr   - milliamperes
> 
> Ah... it's a table...
> 
>>    */
>>   #define SF_POWER	1000000
>> +#define SF_CURR		1000
> 
> ... you could add it on the side
> 
> #define SF_POWER	1000000 /* microwatt */
> #define SF_CURR		   1000 /* milliamperes */
> 
> The rest looks good
Sure, will take this in next revision.

Regards,
Badal
> 
> Andi
