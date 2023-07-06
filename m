Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC91EB64D9
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Jul 2023 10:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjGFKhG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Jul 2023 06:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjGFKhF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Jul 2023 06:37:05 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871EA124
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Jul 2023 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688639820; x=1720175820;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jycRoehC22u+sSCNqommUj32OzGxgkSoNaUB4tNbYaI=;
  b=FrTX/o5HAFQYor08vbCF+sM/Mm3v1JEU34YO87BS3zKOBpOzEF23+obs
   8btuQqFxRijtW6P1Ny9cs3i+ycbLEH+tVrOnr48+bYY7eaKMxVzI2BmZW
   tA2Fz8LujuyA+hOEi7/Q7VWfNjTEWUPOMWpYnYo8xWuSOSHyZ1CpEHbgG
   cGIOAoy70ZEg2TjXSuiVBq1K9YZC4ktQVhXKq+NByiPWp6vlDifxU2W5y
   /sTUnXeOhKV93Qbie1nvdvDE8MHIJ4znOm+jk77nhYrMFI7jXkGNLh5gy
   ZOP+FmEzyEwf4/TQWacWmMbv2oMHuRLUX8NoFmBr2yvLdjw6Lc0Wh+idi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="394322915"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="394322915"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 03:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="809595107"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="809595107"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2023 03:36:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 03:36:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 03:36:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 03:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ0/gJuU88aA2m38vNGRv/u3EjKeRTPIAB/2qBoNkLmi4FJhrrkrXmTD3WmToJvquY6H7YFQjYxGE/Df++X9z+JV3zewzi+UrQ++Hn6GOLaiXyCOj9tN5HoZIAHaljzxOOzeeuVnVAcGnDh6HloVbka0bnJCuD4IPnIt4xmWQypUz6xiPJMYc8qzVco7i2S7aRtd5dvkk9yFlood4akfJO58O1mB3LFs/qvarwKLn2t0/MS6mhHMsVDax27bifLbGKbixz+HJIRUsKxYPllJf7My1uLcYcyaohUjweyYteKlBhbUz7xfBfQIEkwgui4uz5A4nKHCd4bERYvulZYKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9O7Ojj7xiIs9OC+UziSugIawOxWrfJfd97i6wKBJeFs=;
 b=OPaCA3xEADb63TvFw3td2TgJlP9PrSV5FTIlzdl5d2sN6iXTT8cIxpfYBF5iFhQbPtCBC62hDzH3yEdj9ttDzrjCkkSDmXC3sr6IsfrEH4wyGBd+svYIubPI7AhymRkN1tORWeGcU7/VfF4EeXSrb8CNsjoEUBty25cFCy2GLQvDNWMsjd/biMtdRzbSaxDw1UohDNE+bOC0dq0u3opFoqR5/M+RlQBkgxmBAge3hj4QvogUzBl6uzG4BW0WebgKz7kFNhOEfJC/ok0+FheWoSEnUEN7Z9JUUVEwAyfXCwOMy91rdIOInhszQu29wNq712PhvViRPPx2STl/tZvbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 10:36:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 10:36:30 +0000
Message-ID: <fa251df0-7afa-f504-8185-798ea7250dcb@intel.com>
Date:   Thu, 6 Jul 2023 16:06:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
Content-Language: en-US
To:     Matthew Brost <matthew.brost@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-3-badal.nilawar@intel.com>
 <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CYXPR11MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d46e39f-5d68-4719-b913-08db7e0cdc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RIqiIDy6M/DzkJcOvSuqdbCC3x/qHYUUARykyvJpzxwbvaE8KFhM0Ff8ir5oekweyTKxzilQxumsagK5tSi7cUFeWk75AIJCpLpyJKjwdGRP7wfheSydv8CZs0wKyy89I7Szxkps2tPSjdY48pLG1IuUKJmU5g7p9blacLt4vVP0bmPV4Ua5SxFGujVZCXTC1fzXGUww1vkF9/O9n9rjKP/y5Mx/EB/IFlPF0WaNH4rqY9UFpwwyfyznXHcBJf+LNwnMW2fh163mjGz8R4RhWrVmmurY82ZXqePGLQ732Nw4P1z+iSkIHVyPcSXCh0AW/7tOGk7fQqLxXbTTBdDVzE13LbDoCjfEr8Yy9pM/OrnX8rmx3oLWiK1fTzHcRAyvD0nzyiR6fppyCFNfhopu6GX1SVqBqkvXKlnEd7zvnhnAclUfbpfFUds+VDm/0bSUZZRb8dxOfX9bkr6HfPPhioBLFdAFEwno+uDXdQS7kwlkS1iRZq90BdAAxR9T1UK7Ak5IW0I3pFpALhXbt1ibdzjM7e6kvdr0YHtil96X3s+1D8OV7fa/6788ERp2KaFFBlQjT0xwOEPgPSIRCOlBzcG+nKFMHzNPqOKG6/MnO6jPgeC803jeaskLmqiyc33wFyHq5V7U09PrTJpX1oAtd246OGKhVz8EyekipAgi7I7UoOYv4EmSRPNuTsbNVrCO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199021)(66556008)(37006003)(82960400001)(66946007)(6486002)(478600001)(4326008)(6666004)(8936002)(8676002)(41300700001)(6862004)(38100700002)(316002)(2616005)(6636002)(66476007)(186003)(83380400001)(6512007)(6506007)(53546011)(26005)(31696002)(86362001)(2906002)(5660300002)(30864003)(36756003)(31686004)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRUVmNLQzdiVGlCSjMrWDdnLzQxTmNjUGk4TUJKNTVheis2MDM5d05HWitz?=
 =?utf-8?B?N3ZsSXJOMW1ZYjd0NHUvbVhaOVI3WnFIeVhlS3RYUk5jcDZxRFRBTVQrbjcv?=
 =?utf-8?B?RjVaNDJCNGh5elBIbzJHbitHVS9RaUtJOTZJeVRQMTFOT09LSUUwTGtQbVJn?=
 =?utf-8?B?Z0pwejNVVjgwUUNKalFCYXVtNWJMb0wyYUVkRW1rd2k3NmVtMDFKQytvay94?=
 =?utf-8?B?Z05DNWJLa2RudmRCNHhqVTErWll4aEJLN2g4NzUvSFg0ZmNwWWJsUURJdUFr?=
 =?utf-8?B?VGJ0b1ovVXlaWTNhZEd3NmlrRnovQk9sMy9TMEwvdUFjdDU2VEtCanFTdURk?=
 =?utf-8?B?ZytMdUkwUi9VSUN6WGpoRHl6Tnd5aDhuTXN4UmU0cnhvVnRtR3ZZa0Rjdk51?=
 =?utf-8?B?ZGNzOVQxdGt6QVI4dFBheC93MzN6dkhTQ1lKT2hEcFhISUNmYXhmQ0NxUWVi?=
 =?utf-8?B?NHoyVHJ2bWhMOWt0cWV4c3FjekxwTmhJb3NFUVRBNm9xN1pqTjlFSkMyRUFY?=
 =?utf-8?B?OWxhUmZGY1NHc3JuMFR2NzA3Z1gvQ3pocDhabGQ2WmRWYlRtb2ZhQXExL0xy?=
 =?utf-8?B?U3MrT0UwMCt2ZVhHbnd4T09lbnZQOFZ6MkZySDlvNlU5eHBTYlJMdXhCTm9k?=
 =?utf-8?B?MURNajBuWG5DTGJhV2hSYUVmSi8rNmQ5UVlYa014aENmZkp3UUNjYWx5MFJB?=
 =?utf-8?B?YlVUeVNOaEdJUHZFaE9IUkVxVGQ2aEJ6ZklvMlMzZ2preWpGWUNHRWhQU1hu?=
 =?utf-8?B?aVBoaFBRWUVBNzVLTmxPMjFBbXBjM1M1ZXJuYkIvbzArcVNGdHF0ZktLVEx6?=
 =?utf-8?B?a2NQcUhFeG8wc0xTRis2M1E1UHBJTmhMbGMxZFNraXB4blQzUE9UOUk4bnZt?=
 =?utf-8?B?VzRITHhGN2xEeXZZbUw2d1RFeEd4YktEcC9DSEx1NFVSWnRXWDZzZ2h3eVo1?=
 =?utf-8?B?clNxYzVzcklQTGI1OUx2STBldTJrMFp4cUI3dXFjS3RyUEZpU0RQODdhd1BZ?=
 =?utf-8?B?S2MyM2NPaFk4bW1MRUdVcWU3dTdpclFXalBiTlAzL2FvVHV5dlJVeG1vYjdj?=
 =?utf-8?B?VTNZcHk1enVvanNRNWQwZmdObUJJcEtNaGUxcHNqVGZvZFpvbEdER08yOTAy?=
 =?utf-8?B?cXVNWTdPYzRLbkI0ZkpmRlViYkhQdHQzMGptUWY4L2lBR1VjNmMyR2E2UjM5?=
 =?utf-8?B?MGFYaXV2ampnL2JzVTBSeXlucjZpdFdOMzRhQzI0QjJPZjlqNjY0d2hKc3Rq?=
 =?utf-8?B?dW9BQ2kzT1BXejdwS1I2RFBVbVZ2M0R2dXp6eEx2U0dkSTFRVmM0akM4akts?=
 =?utf-8?B?aWxTcEhqMGEwNTRoS1pYY2JacHNzcEgzVGo0aVFDZzJlOEl3MkRIalRRWlFG?=
 =?utf-8?B?c0pESWJWd2crci9pelN0ckh2RWw4OXZUV3IxQitJdUlFQTk2RFFmS3JHT2p0?=
 =?utf-8?B?Sk1lUmgwbWc3cGtVTVo5dXJYT2JldEZ4NTJlcVcwMG5xQ2xjMkludHR6eno4?=
 =?utf-8?B?empMYk5nRlJvdHVWWmpOMENMUktHUU5FU2pSVjd1d3hUQ0k0aEk2UGlGK0Qr?=
 =?utf-8?B?Rk9lMzl3Zkg0YzlaUGVjM21lbnIvVEREWURvNWdCcDZHck5RTFJoWkVwdFV5?=
 =?utf-8?B?MW00ZjNiK29EMTdWaXJvcTdiNS9Jb2JGM09wMzZqME5sb0tDVGhLd21sdzNr?=
 =?utf-8?B?aVpDdytUemdzTW92K2c3elRFQzg4djhwRi9DeXF1TTFhOWkwOFFIZlc2VjBE?=
 =?utf-8?B?RTdpck1hRDNYR0pFSm9EcVhhTERybXlGenpRVXkwZ0VGQUlNRi9wMWZMWW9S?=
 =?utf-8?B?VzBsLzFQYjRHT2ltUVd5R2g4VFFVQ0tuc0xIdVZBZU9MSWxKaXZXY0E1SndT?=
 =?utf-8?B?aCtFOC9nM2dtTXV4TTYwTG1mM0lVeXhJK2E2a1U0aUtkWjFUWTd2Y3lGR1hM?=
 =?utf-8?B?RURFQmQ5bHRWNngxeGJOQnBSbERPK3kzdDlhVkFKSWpqNXNQWmJ6Uldnby96?=
 =?utf-8?B?OUNPeElLN2V1N1BMSnRmanBKRlZGYTlZSXR1cUxlTnhFZU0rcUkyWWVNMG9q?=
 =?utf-8?B?blYza3VUTEwrR1l3Umo3d2pmNnVRSENPUEZqT0lWcVlTdWhFOUVacG5qd0NF?=
 =?utf-8?B?TDd5OHVPS2NmajRpNWprYlhJb01hOGJURUxVR0pIWnJ2L010UnBBWm0vN3lD?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d46e39f-5d68-4719-b913-08db7e0cdc5a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 10:36:30.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVRP+CoYehXluoejcaPcOTtjUyJRSC51c4ZJfvkhAaQTr34NhzIUxCm5NEbCE2EZWT3M5uw5ClyHFbTeCzgYMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Matt,

On 29-06-2023 05:48, Matthew Brost wrote:
> On Wed, Jun 28, 2023 at 12:00:39AM +0530, Badal Nilawar wrote:
>> Expose power_max (pl1) and power_rated_max (tdp) attributes.
>> This is port from i915 hwmon.
>>
> 
> Not expert in this domain but this statement makes be nervous as
> generally shouldn't just blindly port things from the i915. Doing an
> initial review but will need a domain expert too.
This is not blindly ported. Just for reference I added that comment in 
case if someone want to see i915 implementation. I will move that 
comment to cover letter.
> 
>> v2:
>>    - Move rpm calls (xe_device_mem_access_get/put) to hwmon functions from
>>      process_hwmon_reg to avoid multiple rpm entry exits during consecutive
>>      reg accesses
>>    - Fix review comments (Riana)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 372 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
>>   drivers/gpu/drm/xe/xe_uc.c                    |   6 +
>>   6 files changed, 435 insertions(+), 7 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> new file mode 100644
>> index 000000000000..ff3465195870
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -0,0 +1,22 @@
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:		July 2023
> 
> Future?
Considering review time frame added future date.
> 
>> +KernelVersion:	6.3
>> +Contact:	intel-gfx@lists.freedesktop.org
> 
> s/intel-gfx/intel-xe
Sure.
> 
>> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
>> +
>> +		The power controller will throttle the operating frequency
>> +		if the power averaged over a window (typically seconds)
>> +		exceeds this limit. A read value of 0 means that the PL1
>> +		power limit is disabled, writing 0 disables the
>> +		limit. Writing values > 0 will enable the power limit.
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> +
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>> +Date:		July 2023
>> +KernelVersion:	6.3
>> +Contact:	intel-gfx@lists.freedesktop.org
>> +Description:	RO. Card default power limit (default TDP setting).
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> +
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index d654f3311351..eb7210afbd2c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -397,4 +397,8 @@
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
>> index 000000000000..cb2d49b5c8a9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MCHBAR_REGS_H__
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
>> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
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
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 8f653fdf4ad5..a4fba29d5d5a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -5,53 +5,394 @@
>>   
>>   #include <linux/hwmon.h>
>>   
>> +#include "regs/xe_mchbar_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_hwmon.h"
>> +#include "xe_mmio.h"
>> +#include "xe_gt.h"
> 
> Nit - includes should be in alphabetical order.Ok
> 
>> +
>> +enum hwm_reg_name {
>> +	pkg_rapl_limit,
>> +	pkg_power_sku,
>> +	pkg_power_sku_unit,
> 
> Upper case? I guess hwmon_power_max is lower case so is that the
> convention?
Yes, but can be made Upper case.
> 
>> +};
>> +
>> +enum hwm_reg_operation {
>> +	reg_read,
>> +	reg_write,
>> +	reg_rmw,
> 
> Upper case?
Ok, I will change this to upper case.
> 
>> +};
>> +
> 
> s/hwm_reg/xe_hwm_reg
> 
>> +/*
>> + * SF_* - scale factors for particular quantities according to hwmon spec.
>> + * - power  - microwatts
>> + */
>> +#define SF_POWER	1000000
>>   
>>   struct hwm_drvdata {
>>   	struct xe_hwmon *hwmon;
>>   	struct device *hwmon_dev;
>> +	struct xe_gt *gt;
>>   	char name[12];
>> +	bool reset_in_progress;
>> +	wait_queue_head_t waitq;
>>   };
>>   
>>   struct xe_hwmon {
>>   	struct hwm_drvdata ddat;
>>   	struct mutex hwmon_lock;
>> +	int scl_shift_power;
>>   };
>>
> 
> Same as previous patch, 1 struct seems like a better idea to me.
> 
>> +struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
> 
> s/hwm_get_reg/xe_hwmon_get_reg
As mentioned in previous patch will follow xe_hwmon_ for global functions.
> 
>> +{
>> +	struct xe_device *xe = gt_to_xe(ddat->gt);
>> +
>> +	switch (reg_name) {
>> +	case pkg_rapl_limit:
>> +		if (xe->info.platform == XE_DG2)
>> +			return PCU_CR_PACKAGE_RAPL_LIMIT;
>> +		else if (xe->info.platform == XE_PVC)
>> +			return PVC_GT0_PACKAGE_RAPL_LIMIT;
>> +		break;
>> +	case pkg_power_sku:
>> +		if (xe->info.platform == XE_DG2)
>> +			return PCU_CR_PACKAGE_POWER_SKU;
>> +		else if (xe->info.platform == XE_PVC)
>> +			return PVC_GT0_PACKAGE_POWER_SKU;
>> +		break;
>> +	case pkg_power_sku_unit:
>> +		if (xe->info.platform == XE_DG2)
>> +			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
>> +		else if (xe->info.platform == XE_PVC)
>> +			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>> +		break;
>> +	default:
> 
> BUG_ON or WARN_ON saying not possible?
Not needed. For attribute doesn't present it shoud return XE_REG(0).
> 
>> +		break;
>> +	}
>> +
>> +	return XE_REG(0);
>> +}
>> +
>> +int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name,
>> +		      enum hwm_reg_operation operation, u32 *value,
>> +		      u32 clr, u32 set)
s/process_hwmon_reg/hwmon_process_reg
>> +{
>> +	struct xe_reg reg;
>> +	int ret = 0;
>> +
>> +	reg = hwm_get_reg(ddat, reg_name);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (operation) {
>> +	case reg_read:
>> +		*value = xe_mmio_read32(ddat->gt, reg);
>> +		break;
>> +	case reg_write:
>> +		xe_mmio_write32(ddat->gt, reg, *value);
>> +		break;
>> +	case reg_rmw:
>> +		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
>> +		break;
>> +	default:
> 
> BUG_ON or WARN_ON saying not possible?
Will add WARN_ON here.
> 
>> +		ret = -EOPNOTSUPP;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name, u64 *value)
>> +{
>> +	struct xe_reg reg;
>> +
>> +	reg = hwm_get_reg(ddat, reg_name);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> 
> Don't need this, the upper levels of the stack should have this. You
> could just do a xe_device_assert_mem_access here.
Agreed I will remove this and whereever needed will use 
xe_device_assert_mem_access .
> 
>> +
>> +	*value = xe_mmio_read64(ddat->gt, reg);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return 0;
>> +}
>> +
>> +#define PL1_DISABLE 0
>> +
>> +/*
>> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
>> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
>> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>> + * clamped values when read.
>> + */
>> +static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
> 
> The return value is always 0, why not return value?
0 is success.
static ssize_t hwmon_attr_show(struct device *dev,
                                struct device_attribute *devattr, char *buf)
{
         struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
         long val;
         int ret;

         ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
                                &val);
         if (ret < 0)
                 return ret;

         trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
                               hattr->name, val);

         return sprintf(buf, "%ld\n", val);
}
> 
> s/hwm_power_max_read/xe_hwmon_power_max_read
> 
>> +{
>> +	struct xe_hwmon *hwmon = ddat->hwmon;
>> +	u32 reg_val;
>> +	u64 r, min, max;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
> 
> Same as above, use xe_device_assert_mem_access.
Not required here as its added at top level function hwm_read. As 
mentioned in v2: I moved rpm calls to top level funcitons but I forgot 
to remove from here and other places. Will fix this in next rev.
> 
>> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
>> +	/* Check if PL1 limit is disabled */
>> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> +		*value = PL1_DISABLE;
>> +		xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +		return 0;
>> +	}
>> +
>> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
>> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
>> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
>> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	if (min && max)
>> +		*value = clamp_t(u64, *value, min, max);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
This is also not needed.
>> +	return 0;
>> +}
>> +
>> +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
>> +{
>> +	struct xe_hwmon *hwmon = ddat->hwmon;
>> +	DEFINE_WAIT(wait);
>> +	int ret = 0;
>> +	u32 nval;
>> +
>> +	/* Block waiting for GuC reset to complete when needed */
>> +	for (;;) {
>> +		mutex_lock(&hwmon->hwmon_lock);
>> +
>> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
>> +
>> +		if (!hwmon->ddat.reset_in_progress)
>> +			break;
>> +
>> +		if (signal_pending(current)) {
>> +			ret = -EINTR;
>> +			break;
>> +		}
>> +
>> +		mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +		schedule();
>> +	}
>> +	finish_wait(&ddat->waitq, &wait);
>> +	if (ret)
>> +		goto unlock;
> 
> Anyway to not open code this? We similar in with
> xe_guc_submit_reset_wait, could we expose a global reset in progress in
> function which we can expose at the gt level?
Sure, I will fix this.
> 
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
> 
> This certainly is an outer most thing, e.g. doing this under
> hwmon->hwmon_lock seems dangerous. Again the upper levels of the stack
> should do the xe_device_mem_access_get, which it does. Just pointing out
> doing xe_device_mem_access_get/put under a lock isn't a good idea.
Agreed, this is not needed as its called in top level function.
> 
> Also the the loop which acquires hwmon->hwmon_lock is confusing too.
> 
>> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>> +	if (value == PL1_DISABLE) {
>> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
>> +				  PKG_PWR_LIM_1_EN, 0);
>> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
>> +				  PKG_PWR_LIM_1_EN, 0);
>> +
>> +		if (nval & PKG_PWR_LIM_1_EN)
>> +			ret = -ENODEV;
>> +		goto exit;
>> +	}
>> +
>> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
>> +
>> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
>> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>> +exit:
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
Not needed here.
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
> 
> Again a clear lock / unlock is desirable.
> 
>> +	return 0;
>> +}
>> +
>> +static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
>> +{
> 
> s/hwm_power_rated_max_read/xe_hwmon_power_rated_max_read
> 
>> +	struct xe_hwmon *hwmon = ddat->hwmon;
>> +	u32 reg_val;
>> +
>> +	process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
>> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct hwmon_channel_info *hwm_info[] = {
> 
> s/hwm_info/xe_hwmon_info
Sure.
> 
>> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>>   	NULL
>>   };
>>   
>> +static umode_t
>> +hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>> +{
> 
> s/hwm_power_is_visible/xe_hwmon_power_is_visible
Will prefer xe_hwmon prefix for global functions.
> 
>> +	u32 reg_val;
>> +
>> +	switch (attr) {
>> +	case hwmon_power_max:
>> +		return process_hwmon_reg(ddat, pkg_rapl_limit,
>> +					 reg_read, &reg_val, 0, 0) ? 0 : 0664;
>> +	case hwmon_power_rated_max:
>> +		return process_hwmon_reg(ddat, pkg_power_sku,
>> +					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static int
>> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>> +{
> 
> s/hwm_power_read/xe_hwmon_power_read
> 
>> +	switch (attr) {
>> +	case hwmon_power_max:
>> +		return hwm_power_max_read(ddat, val);
>> +	case hwmon_power_rated_max:
>> +		return hwm_power_rated_max_read(ddat, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +static int
>> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>> +{
> 
> s/hwm_power_write/xe_hwmon_power_write
> 
>> +	switch (attr) {
>> +	case hwmon_power_max:
>> +		return hwm_power_max_write(ddat, val);
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	struct hwm_drvdata *ddat = &hwmon->ddat;
>> +	u32 r;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
> 
> Upper level should have, use an assert if anything.
Aggree, Infact I am thinking to remove this as this is already called at 
top level functions.
> 
>> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
>> +					reg_read, &r, 0, 0))
>> +		return;
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	hwmon->ddat.reset_in_progress = true;
>> +
>> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
>> +			  PKG_PWR_LIM_1_EN, 0);
>> +	*old = !!(r & PKG_PWR_LIM_1_EN);
>> +
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +}
>> +
>> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	struct hwm_drvdata *ddat = &hwmon->ddat;
>> +	u32 r;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> 
> Upper level should have, use an assert if anything.
Agree. Will remove this as top level function already calling this.
> 
>> +
>> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
>> +					reg_read, &r, 0, 0))
>> +		return;
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
>> +			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>> +
>> +	hwmon->ddat.reset_in_progress = false;
>> +	wake_up_all(&hwmon->ddat.waitq);
>> +
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +}
>> +
>>   static umode_t
>>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>   	       u32 attr, int channel)
>>   {
>> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
> 
> Nit, include the get / put in previous patch.
Ok.
> 
>>   	switch (type) {
>> +	case hwmon_power:
>> +		ret = hwm_power_is_visible(ddat, attr, channel);
>> +		break;
>>   	default:
>> -		return 0;
>> +		ret = 0;
>>   	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return ret;
>>   }
>>   
>>   static int
>>   hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>   	 int channel, long *val)
>>   {
>> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> 
> Nit, include the get / put in previous patch.
Ok
> 
>> +
>>   	switch (type) {
>> +	case hwmon_power:
>> +		ret = hwm_power_read(ddat, attr, channel, val);
>> +		break;
>>   	default:
>> -		return -EOPNOTSUPP;
>> +		ret = -EOPNOTSUPP;
>> +		break;
>>   	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return ret;
>>   }
>>   
>>   static int
>>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>   	  int channel, long val)
>>   {
>> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> 
> Nit, include the get / put in previous patch.
Ok
> 
>> +
>>   	switch (type) {
>> +	case hwmon_power:
>> +		ret = hwm_power_write(ddat, attr, channel, val);
>> +		break;
>>   	default:
>> -		return -EOPNOTSUPP;
>> +		ret = -EOPNOTSUPP;
>> +		break;
>>   	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return ret;
>>   }
>>   
>>   static const struct hwmon_ops hwm_ops = {
>> @@ -66,8 +407,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
>>   };
>>   
>>   static void
>> -hwm_get_preregistration_info(struct xe_device *xe)
>> +hwm_get_preregistration_info(struct hwm_drvdata *ddat)
> 
> Why change the function argument?
> 
>>   {
>> +	struct xe_hwmon *hwmon = ddat->hwmon;
>> +	u32 val_sku_unit = 0;
>> +	int ret;
>> +
>> +	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
>> +	/*
>> +	 * The contents of register pkg_power_sku_unit do not change,
>> +	 * so read it once and store the shift values.
>> +	 */
>> +	if (!ret)
>> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>>   }
>>   
>>   void xe_hwmon_register(struct xe_device *xe)
>> @@ -89,18 +441,24 @@ void xe_hwmon_register(struct xe_device *xe)
>>   	mutex_init(&hwmon->hwmon_lock);
>>   	ddat = &hwmon->ddat;
>>   
>> +	/* primary GT to access device level properties */
>> +	ddat->gt = xe->tiles[0].primary_gt;
>> +
>>   	ddat->hwmon = hwmon;
>>   	snprintf(ddat->name, sizeof(ddat->name), "xe");
>>   
>> -	hwm_get_preregistration_info(xe);
>> +	init_waitqueue_head(&ddat->waitq);
>>   
>> -	drm_dbg(&xe->drm, "Register HWMON interface\n");
>> +	hwm_get_preregistration_info(ddat);
>>   
>> -	/*  hwmon_dev points to device hwmon<i> */
>> +	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>> +
>> +	/* hwmon_dev points to device hwmon<i> */
>>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>>   							 ddat,
>>   							 &hwm_chip_info,
>>   							 NULL);
>> +
> 
> Unrelated, probably delete,
> 
>>   	if (IS_ERR(hwmon_dev)) {
>>   		drm_warn(&xe->drm, "Fail to register xe hwmon\n");
> 
> Missed this the prior patch but include the error value in the print.
Sure.
> 
>>   		xe->hwmon = NULL;
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
>> index a078eeb0a68b..a5dc693569c5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.h
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -14,9 +14,13 @@ struct xe_device;
>>   #if IS_REACHABLE(CONFIG_HWMON)
>>   void xe_hwmon_register(struct xe_device *xe);
>>   void xe_hwmon_unregister(struct xe_device *xe);
>> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
>> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
>>   #else
>>   static inline void xe_hwmon_register(struct xe_device *xe) { };
>>   static inline void xe_hwmon_unregister(struct xe_device *xe) { };
>> +static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
>> +static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
>>   #endif
>>   
>>   #endif /* __XE_HWMON_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 70eabf567156..9df5a3a85dc3 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_huc.h"
>>   #include "xe_uc_fw.h"
>>   #include "xe_wopcm.h"
>> +#include "xe_hwmon.h"
>>   
>>   static struct xe_gt *
>>   uc_to_gt(struct xe_uc *uc)
>> @@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>>   int xe_uc_init_hw(struct xe_uc *uc)
>>   {
>>   	int ret;
>> +	bool pl1en;
>>   
>>   	/* GuC submission not enabled, nothing to do */
>>   	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>   		return 0;
>>   
>> +	/* Disable a potentially low PL1 power limit to allow freq to be raised */
>> +	xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);
> 
> Don't love the pass by reference, how about 'pl1en =
> xe_hwmon_power_max_disable(...'
Sure, I will remove pass by reference.
> 
> Matt
> 
>> +
>>   	ret = xe_uc_sanitize_reset(uc);
>>   	if (ret)
>>   		return ret;
>> @@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		return ret;
>>   
>> +	xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);
> 
> Add line of white space.
Ok.

Regards,
Badal
> 
> Matt
> 
>>   	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>>   	ret = xe_huc_auth(&uc->huc);
>>   	XE_WARN_ON(ret);
>> -- 
>> 2.25.1
>>
