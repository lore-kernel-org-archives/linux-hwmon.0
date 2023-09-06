Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A850BEB8FAF
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Sep 2023 10:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbjIFK7S (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Sep 2023 06:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbjIFK7R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Sep 2023 06:59:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6DF10F7
        for <linux-hwmon@vger.kernel.org>; Wed,  6 Sep 2023 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693997949; x=1725533949;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L1In5FffUnEoNE4VEveDtieUlWr8w7ZEpFPtOoYuC80=;
  b=KGmfyh/6qsAiice9uKKVvx9F3d2WkIFzQaw9uF/UtFHGRmFUUHRzS7Hn
   bfitOz4LRcsAn79Ky0DnQKUsP7cOEjOKeskPzkAIKTNMyXqeg7w679R9T
   Kqktc+SMZxvNwgkI/Kb8GAi4qEi+V2CbmkisM7nNNV7uyDjQNuD7gskRH
   idCCHRwtQq1ZhPtwDC3chOBgLO009+ng3QzFNEAEiEiReGn6K/vC9CiWO
   a0QNCgtLfSwnIaz9n4Q+0zOo5uJJhxw8bs1G1LkCSwyf0S76HPQ+jiNp5
   /FTJnRr6uJeRRGcgpdv3ZLhT1EyoP1ElQ49OIgLqw4dDU/vRObCCUjRyf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="362062441"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="362062441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="831606201"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="831606201"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2023 03:59:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 03:59:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 03:59:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 03:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA98/BPibBJJr/AEto20amj/ygdVapxfjeHbwqqZO6ZtZNI5oxH02oO0F0Wy1JRBPysWkQN8lKlpkOSgYQY3lVVtRFel0ppJvHmsRIFQB6IIobRM/KvryxgvwNCiuUUfMX3a2SHUpeIj/8ELUoWmtanQBEppcPTfWLfaG4on1d7aJ5lcwreVHSAXb7Q6G/oi8WUewgADC+nJ0Ssf2ooGwAYaXkdVpqsqX4v299gZgebYN+2H9FTnZfZCsSqO1uwaCTrD9Vx0mC6k9KMkPOt+Wj8vYwnwY9Rhm4dywakmCUkveH87gVhsRuM0n1sLV8ivL6/IqrpT5+CaJsBeyIML3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpmQ4fY8GLgB/tP+cHsxvnfAD8Nej185GEJJJ238F1w=;
 b=Sxl/zxQOYCwn9/Pe9u+DM3eL/zaH5pM4xPhvox/KH+E4+jiZp2+Bnwurvsg05HlieX0y9uDp35DND2z5MmRm9blgt+MJ22Wpd4DcOqPEP+Mf5UqTN/jgjnnGFdLA22cgYmLFxdWJ3oB5xz/frhkk4mHGwyjbfpnPmROrPn3hWNU/bjbPCSONjqgUokr5KJPJdOZ19huEsC0LdkgZN3HsdNS2MerNgjjVjfFqkslHLrY9HxlIw4oiM11IkUa7+G9EC8w5G0l7BmoZENQ8azNHRcznebbwkEZT5Y1sLAD/5mEkFTZIKnpJe7rvZMpHNOAJT+0+j+iHYoZlcDAOoYJ9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 10:59:05 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::c0ea:337:35a:a9cc]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::c0ea:337:35a:a9cc%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 10:59:05 +0000
Message-ID: <61564902-be25-16fe-9a9c-17ded8721f20@intel.com>
Date:   Wed, 6 Sep 2023 16:28:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/6] drm/xe/hwmon: Expose power attributes
To:     Riana Tauro <riana.tauro@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <matthew.brost@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
 <20230904182258.2291881-3-badal.nilawar@intel.com>
 <c362dcd0-771f-39fa-9ab5-3a137dd3d51f@intel.com>
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <c362dcd0-771f-39fa-9ab5-3a137dd3d51f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::8) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf7b4a1-cc5e-47d2-c897-08dbaec84928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4O8fdHih0nd32mZ3dfcPqciI8rmYIQvQOQof7ODKYUjAuH+KS90RcuxFA0IBnXO7ILWB4DqeGuEBMq5vmXi7zgLi85WOMjZMy5dW9is5BM3SX69uFxMPqReZA20oNotjCDDfuDNIAvajJEyoNIj3Gu/z2uOO7HlmBInruwINEWc3sWiDWb5pv0W8LvDPAVbM0NUMKqprL2DH6c3+wPcL1JEaHB5y2kGjg4gImqU/anAcbHaDxfxIL6lJUXavOCav40djMBxJKhxvjEtaGr8HdfK2J1U7bsrQYgnhKVpqwuI90fXUbPsVlgVMm+fzzHfQ8zxYXtYLQCJyEv5dh0I/XRuuXeVAVkcnwjx5QfCBgshJC51sUSEm1npY+Xko+EnZOszrfXnaZujTqiofC2gdQ6vBRGZrWF5zxPRug51J98Ll0D/8ojPgqNvL5Lq+S/hVq1n6Mu0/jYjkSezYOuVezBqrDHVfey/nK1JuJQ2RPCtWLJwHdnO3i8yBSPGdG4XjaKlbraWmp+e3llbQLIztNCuSN2pBSOp9Q2mGnY/TZaK3CIckeclhJWnf4Xd/fuwIGa+yPWCbLWpFHDNe21Yi9Ri9SacZDRIBEOYn/g5TdTDbpIKTlM3Rm/FejCCUXqBdprz7xHv6tKUfaUMJUQdEEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(6512007)(53546011)(478600001)(83380400001)(26005)(2616005)(2906002)(30864003)(41300700001)(66556008)(66476007)(316002)(8676002)(66946007)(8936002)(4326008)(5660300002)(31696002)(36756003)(86362001)(38100700002)(31686004)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhWemxnQ1pldlN6S0NiL1RNbURGU2VWVWtwZFBCU0d0VVdpMTlTNEdDM3Y5?=
 =?utf-8?B?aDNHWEY5Mi9oVFBVQnU2UUNrRGhHaytVaklkV3hUNDIyeTEra3VQSTlhMmda?=
 =?utf-8?B?ZndrV004UTYzSkN2WDlwRDVPKzFnYXRlUkh5QjRvdnBPa1RMT1F2SWJHeTFU?=
 =?utf-8?B?Tm9EbW9VamJrUjY0OXBlVzdiVlBPMjQ3dS9IZVJpR2FxQ1dkajV0REo5VXJv?=
 =?utf-8?B?eEkrRlAvc01zdXhDdkNmWFM3YjI0NWl4VGNRNlhQejlaM0t1OVRxZ3VEUk90?=
 =?utf-8?B?bTN0dlJrRU0vOHZPWEZyb0ZRMk5mLy92eTZmQWlKMkJBYTk0My84eU5oV0Fy?=
 =?utf-8?B?YzY1Yis4cmd3VXhQZHdOMGl0bVR5OEw3MGpmYXc1eUhub29SVldYR28xelRq?=
 =?utf-8?B?VURIZ1dyQ2xyNk5tY2pvYUJxZUw1K2VPcm1jNGJMY2F0SGRpdTNlbElhQy9C?=
 =?utf-8?B?K0wyVGtPcDdlWXozUkd2Tk9BdDFLWmZmclRmdkJTTTVQcTcxM0crYit0ZU02?=
 =?utf-8?B?VDM1LzN2czNqWjB6akppTU1kUmplUEdGQVFoU1dPUUNxOWRkM2JVTDRMQ2Q3?=
 =?utf-8?B?N3RaeHlpNDJneXpPSFVhQnNpYnh1TWRTME0zMWdqN1BRa2U5VEJNRmZ3RjJk?=
 =?utf-8?B?V3ptbFFYdmtwYzA4OVdTMjMxckxlNzF6b2p1RXJUMVlQRko0Um5ZRVFsS3c3?=
 =?utf-8?B?RzR6RlhBZ3diUnFCdGNITXVYUVR3VnNTdG92ZDJMNzF0MUVrMXVBN1hOaWE2?=
 =?utf-8?B?Y3VQRjRCWk0yalM4MzBCRVErb1ZkRDNJL29CRVNoUzAxYWY4YXFyWjlCcng2?=
 =?utf-8?B?WGNQOVRPWHo1dGlFN3ZLczRYUWZrRHg0cGlES0xoUlk1WmZvVGg2SW80OUYr?=
 =?utf-8?B?cjE2YklwQ2U1Nldzb1VZN3pBT2R4RUkrdXdyRWtKTzQ5Tm5HRXlXYjB5TVA0?=
 =?utf-8?B?Q1gvSzVMNk54V2ZrNlA2L3FydHNDN1ZFY0h6Y25CcnE4MDlETE5ORk1uVllF?=
 =?utf-8?B?NEd0RDdiRnhITmIzNG1zbUxObW0vL2FnZ2hrM01JSU1CWmtzNGdJekRmQk0x?=
 =?utf-8?B?WUlSU0ludHlHMWNUUmlFS1lHeWQ0U2JZdEk3NjBySXYyQWVuUzcrUkMwVlU4?=
 =?utf-8?B?T0FyU2s4YmMvTzBWbVExK1ZkbFY2UThvdzE3cDZ1bXFrdktJN0FaMlZvMTQz?=
 =?utf-8?B?K2NCcUNlaXNiUmllZEk4WU94NkZGUWdOV1NId0l6N3JQYmROTlVqZU5PdThs?=
 =?utf-8?B?Wmw4RDJRQm1xcmw5ZnB2UFE0TG16ZHhId0Y1bDc5RVpKSFNUbDB0aTZzazIv?=
 =?utf-8?B?Vjk5M2lDbkNiaC9nMm1nYVdnTHdpa3Y1Mm1nODAyYlZCb0Q0Um5UdU1MTmtj?=
 =?utf-8?B?VmZwZ3pxbkpwL1dVbXlaUS9mbTZoUml0NzZBQ0lqbzVGckp0aVVyQTZDL09Q?=
 =?utf-8?B?TXRGOEdmUnRwSjl2VTlhM0hRejN4dFlETFpuOXZjL0Zsa2V1WFJVenEvZDho?=
 =?utf-8?B?eEVqS2VTNEZieVYvbUI3WkFkMW5xdmFOYXROM3c5b1ZzZUR5WVNHMFM0RHlX?=
 =?utf-8?B?eVVoSzZkQS9qMlo0dWJXODdEVFlwUWZVWS9kdHp1aWV1QmhGc2xybm5EZ0Nv?=
 =?utf-8?B?Ti8wOWRKWUZlRk1NMlBFNTVsTkJjRlRHMFhSNjRtYUFmWUhmckpsWDMzd3d6?=
 =?utf-8?B?eTc3QUwrYzhQZEhkSkJJZkp6ZXVlbEFlWFlHenFZUXgwRTdsMVNRdlh1MnZq?=
 =?utf-8?B?eERPdjRQMllSVzlyMmZjeG5sRkEzY2lMYTF1ZmhOUkV3YlQ0aTRRNHg5RlJs?=
 =?utf-8?B?NC91NjAwSVhIdjdqMStrMVZ5R1ZoaTZiNGI3R0JsQmdVZjk2SEpJamJxdXVm?=
 =?utf-8?B?MWM2cTIwOGtnT3NsMU5CaWJLTzREUWl1eFRmSEUva2FNQ3QwekFDdHZGOVJp?=
 =?utf-8?B?dDArOENlcnhTYkZEUXRFQjU4T2lhcjE0RmUzQkx2cVlVYXhURkFYbjNOeTRx?=
 =?utf-8?B?K1pIclVoYnBYbmRsWEp2cS94aDBOOEs5UGN3UExiWWpjbGpBekVmRDJaaGt2?=
 =?utf-8?B?cG5RVTE5QmNXMnRRam5jMUxjbnNVaGF4bFkxY1k4UjUzWmd1cVhiT0lQTXBG?=
 =?utf-8?B?c1puOFhDZm9JNURJaGh2SkFxb3dRUjU3Y3cvdC9mTkZtUjZraWxTbEwwQzYr?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf7b4a1-cc5e-47d2-c897-08dbaec84928
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 10:59:05.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3A4GHgGpGGty8+umjUl1Y/xmqhhwBu6N4NUyhHIx9dFJ5efvVmX4Bh897M1uVY6utNc4OPnoqxDqytXj6TgtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Riana,

On 06-09-2023 15:53, Riana Tauro wrote:
> 
> Hi Badal
> 
> On 9/4/2023 11:52 PM, Badal Nilawar wrote:
>> Expose Card reactive sustained (pl1) power limit as power_max and
>> card default power limit (tdp) as power_rated_max.
>>
>> v2:
>>    - Fix review comments (Riana)
>> v3:
>>    - Use drmm_mutex_init (Matt Brost)
>>    - Print error value (Matt Brost)
>>    - Convert enums to uppercase (Matt Brost)
>>    - Avoid extra reg read in hwmon_is_visible function (Riana)
>>    - Use xe_device_assert_mem_access when applicable (Matt Brost)
>>    - Add intel-xe@lists.freedesktop.org in Documentation (Matt Brost)
>> v4:
>>    - Use prefix xe_hwmon prefix for all functions (Matt Brost/Andi)
>>    - %s/hwmon_reg/xe_hwmon_reg (Andi)
>>    - Fix review comments (Guenter/Andi)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>>   drivers/gpu/drm/xe/Makefile                   |   3 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  33 ++
>>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 362 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
>>   drivers/gpu/drm/xe/xe_uc.c                    |   1 +
>>   9 files changed, 450 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> new file mode 100644
>> index 000000000000..da0197a29fe4
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -0,0 +1,22 @@
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:        September 2023
>> +KernelVersion:    6.5
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:    RW. Card reactive sustained  (PL1) power limit in 
>> microwatts.
>> +
>> +        The power controller will throttle the operating frequency
>> +        if the power averaged over a window (typically seconds)
>> +        exceeds this limit. A read value of 0 means that the PL1
>> +        power limit is disabled, writing 0 disables the
>> +        limit. Writing values > 0 and <= TDP will enable the power 
>> limit.
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>> +Date:        September 2023
>> +KernelVersion:    6.5
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:    RO. Card default power limit (default TDP setting).
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 9d2311f8141f..c86577c6e222 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,6 +117,9 @@ xe-y += xe_bb.o \
>>       xe_wa.o \
>>       xe_wopcm.o
>> +# graphics hardware monitoring (HWMON) support
>> +xe-$(CONFIG_HWMON) += xe_hwmon.o
>> +
>>   # i915 Display compat #defines and #includes
>>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>       -I$(srctree)/$(src)/display/ext \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 271ed0cdbe21..32adfce8b2db 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -405,4 +405,8 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK        XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK        XE_REG(0x19011c)
>> +#define PVC_GT0_PACKAGE_RAPL_LIMIT        XE_REG(0x281008)
>> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT        XE_REG(0x281068)
>> +#define PVC_GT0_PACKAGE_POWER_SKU        XE_REG(0x281080)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> new file mode 100644
>> index 000000000000..6cd39a721bf2
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
>> + * device 0 function 0's pci config register 0x44 or 0x48 and matches 
>> it in
>> + * every way.
>> + */
>> +
>> +#define MCHBAR_MIRROR_BASE_SNB            0x140000
>> +
>> +#define PCU_CR_PACKAGE_POWER_SKU        XE_REG(MCHBAR_MIRROR_BASE_SNB 
>> + 0x5930)
>> +#define   PKG_PKG_TDP                GENMASK_ULL(14, 0)
> PKG_PKG doesn't seem right. Should this renamed to PKG_TDP ?
>> +#define   PKG_MIN_PWR                GENMASK_ULL(30, 16)
>> +#define   PKG_MAX_PWR                GENMASK_ULL(46, 32)
>> +
>> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>> +#define   PKG_PWR_UNIT                REG_GENMASK(3, 0)
>> +
>> +#define PCU_CR_PACKAGE_RAPL_LIMIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>> +#define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>> +#define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>> +
>> +#endif /* _XE_MCHBAR_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 109aeb25d19c..e851b8773b54 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_vm.h"
>>   #include "xe_vm_madvise.h"
>>   #include "xe_wait_user_fence.h"
>> +#include "xe_hwmon.h"
> Should be alphabetical
>>   #ifdef CONFIG_LOCKDEP
>>   struct lockdep_map xe_device_mem_access_lockdep_map = {
>> @@ -335,6 +336,8 @@ int xe_device_probe(struct xe_device *xe)
>>       xe_debugfs_register(xe);
>> +    xe_hwmon_register(xe);
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 750e1f0d3339..7ea5704048bc 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -361,6 +361,8 @@ struct xe_device {
>>        */
>>       struct task_struct *pm_callback_task;
>> +    struct xe_hwmon *hwmon;
>> +
>>       /* private: */
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> new file mode 100644
>> index 000000000000..d66d633724a5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -0,0 +1,362 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/hwmon.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include "regs/xe_mchbar_regs.h"
>> +#include "regs/xe_gt_regs.h"
> Should be alphabetical
Ok
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_hwmon.h"
>> +#include "xe_mmio.h"
>> +
>> +enum xe_hwmon_reg {
>> +    REG_PKG_RAPL_LIMIT,
>> +    REG_PKG_POWER_SKU,
>> +    REG_PKG_POWER_SKU_UNIT,
>> +};
> Should this enum have the prefix REG?
Yes, lets keep REG prefix.
>> +
>> +enum xe_hwmon_reg_operation {
>> +    REG_READ,
>> +    REG_WRITE,
>> +    REG_RMW,
>> +};
>> +
>> +/*
>> + * SF_* - scale factors for particular quantities according to hwmon 
>> spec.
>> + */
>> +#define SF_POWER    1000000        /* microwatts */
>> +
>> +struct xe_hwmon {
>> +    struct device *hwmon_dev;
>> +    struct xe_gt *gt;
>> +    struct mutex hwmon_lock; /* rmw operations*/
>> +    bool reset_in_progress;
>> +    wait_queue_head_t waitq;
> reset_in_progress & waitq not used in the below code
Sure will remove this code.
>> +    int scl_shift_power;
>> +};
>> +
>> +static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg 
>> hwmon_reg)
>> +{
>> +    struct xe_device *xe = gt_to_xe(hwmon->gt);
>> +    struct xe_reg reg = XE_REG(0);
>> +
>> +    switch (hwmon_reg) {
>> +    case REG_PKG_RAPL_LIMIT:
>> +        if (xe->info.platform == XE_DG2)
>> +            reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>> +        else if (xe->info.platform == XE_PVC)
>> +            reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>> +        break;
>> +    case REG_PKG_POWER_SKU:
>> +        if (xe->info.platform == XE_DG2)
>> +            reg = PCU_CR_PACKAGE_POWER_SKU;
>> +        else if (xe->info.platform == XE_PVC)
>> +            reg = PVC_GT0_PACKAGE_POWER_SKU;
>> +        break;
>> +    case REG_PKG_POWER_SKU_UNIT:
>> +        if (xe->info.platform == XE_DG2)
>> +            reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>> +        else if (xe->info.platform == XE_PVC)
>> +            reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>> +        break;
>> +    default:
>> +        XE_MISSING_CASE(hwmon_reg);
>> +        break;
>> +    }
>> +
>> +    return reg.raw;
>> +}
>> +
>> +static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> +                enum xe_hwmon_reg_operation operation, u32 *value,
>> +                u32 clr, u32 set)
>> +{
>> +    struct xe_reg reg;
>> +
>> +    reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> +
>> +    if (!reg.raw)
>> +        return -EOPNOTSUPP;
>> +
>> +    switch (operation) {
>> +    case REG_READ:
>> +        *value = xe_mmio_read32(hwmon->gt, reg);
>> +        return 0;
>> +    case REG_WRITE:
>> +        xe_mmio_write32(hwmon->gt, reg, *value);
>> +        return 0;
>> +    case REG_RMW:
>> +        *value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> +        return 0;
>> +    default:
>> +        XE_MISSING_CASE(operation);
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg, u64 *value)
>> +{
>> +    struct xe_reg reg;
>> +
>> +    reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> +
>> +    if (!reg.raw)
>> +        return -EOPNOTSUPP;
>> +
>> +    *value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> +
>> +    return 0;
>> +}
>> +
>> +#define PL1_DISABLE 0
>> +
>> +/*
>> + * HW allows arbitrary PL1 limits to be set but silently clamps these 
>> values to
>> + * "typical but not guaranteed" min/max values in rg.PKG_POWER_SKU. 
>> Follow the
> %s/rg.PKG_POWER_SKU/REG_PKG_POWER_SKU
>> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but 
>> display
>> + * clamped values when read.
>> + */
>> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>> +{
>> +    u32 reg_val;
>> +    u64 r, min, max;
> meaningful name instead of r
>> +
>> +    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, 
>> &reg_val, 0, 0);
>> +    /* Check if PL1 limit is disabled */
>> +    if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> +        *value = PL1_DISABLE;
>> +        return 0;
>> +    }
>> +
>> +    reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +    *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +    xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &r);
>> +    min = REG_FIELD_GET(PKG_MIN_PWR, r);
>> +    min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> +    max = REG_FIELD_GET(PKG_MAX_PWR, r);
>> +    max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> +
>> +    if (min && max)
>> +        *value = clamp_t(u64, *value, min, max);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>> +{
>> +    u32 nval;
> meaningful name instead of nval
sure will use reg_val here.
>> +
>> +    /* Disable PL1 limit and verify, as limit cannot be disabled on 
>> all platforms */
>> +    if (value == PL1_DISABLE) {
>> +        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
>> +                     PKG_PWR_LIM_1_EN, 0);
>> +        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &nval,
>> +                     PKG_PWR_LIM_1_EN, 0);
>> +
>> +        if (nval & PKG_PWR_LIM_1_EN)
>> +            return -ENODEV;
>> +    }
>> +
>> +    /* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +    nval = DIV_ROUND_CLOSEST_ULL((u64)value << 
>> hwmon->scl_shift_power, SF_POWER);
>> +    nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
>> +
>> +    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
>> +                 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long 
>> *value)
>> +{
>> +    u32 reg_val;
>> +
>> +    xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, 
>> &reg_val, 0, 0);
>> +    reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
>> +    *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct hwmon_channel_info *hwmon_info[] = {
>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>> +    NULL
>> +};
>> +
>> +static umode_t
>> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>> +{
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
>> +    case hwmon_power_rated_max:
>> +        return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long 
>> *val)
>> +{
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return xe_hwmon_power_max_read(hwmon, val);
>> +    case hwmon_power_rated_max:
>> +        return xe_hwmon_power_rated_max_read(hwmon, val);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long 
>> val)
>> +{
>> +    switch (attr) {
>> +    case hwmon_power_max:
>> +        return xe_hwmon_power_max_write(hwmon, val);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static umode_t
>> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +            u32 attr, int channel)
>> +{
>> +    struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
>> +    int ret;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +    switch (type) {
>> +    case hwmon_power:
>> +        ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>> +        break;
>> +    default:
>> +        ret = 0;
>> +        break;
>> +    }
>> +
>> +    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +    return ret;
>> +}
>> +
>> +static int
>> +xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 
>> attr,
>> +          int channel, long *val)
>> +{
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +    switch (type) {
>> +    case hwmon_power:
>> +        ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +        break;
>> +    }
>> +
>> +    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +    return ret;
>> +}
>> +
>> +static int
>> +xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 
>> attr,
>> +           int channel, long val)
>> +{
>> +    struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +    switch (type) {
>> +    case hwmon_power:
>> +        ret = xe_hwmon_power_write(hwmon, attr, channel, val);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +        break;
>> +    }
>> +
>> +    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +    return ret;
>> +}
>> +
>> +static const struct hwmon_ops hwmon_ops = {
>> +    .is_visible = xe_hwmon_is_visible,
>> +    .read = xe_hwmon_read,
>> +    .write = xe_hwmon_write,
>> +};
>> +
>> +static const struct hwmon_chip_info hwmon_chip_info = {
>> +    .ops = &hwmon_ops,
>> +    .info = hwmon_info,
>> +};
>> +
>> +static void
>> +xe_hwmon_get_preregistration_info(struct xe_device *xe)
>> +{
>> +    struct xe_hwmon *hwmon = xe->hwmon;
>> +    u32 val_sku_unit = 0;
>> +    int ret;
>> +
>> +    ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 
>> REG_READ, &val_sku_unit, 0, 0);
>> +    /*
>> +     * The contents of register PKG_POWER_SKU_UNIT do not change,
>> +     * so read it once and store the shift values.
>> +     */
>> +    if (!ret)
>> +        hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>> +}
>> +
>> +void xe_hwmon_register(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    struct xe_hwmon *hwmon;
>> +
>> +    /* hwmon is available only for dGfx */
>> +    if (!IS_DGFX(xe))
>> +        return;
>> +
>> +    hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>> +    if (!hwmon)
>> +        return;
> Since there is no error code returned. Should have a warning here?
Sure, will add warn here.
>> +
>> +    xe->hwmon = hwmon;
>> +
>> +    drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
>> +
>> +    /* primary GT to access device level properties */
>> +    hwmon->gt = xe->tiles[0].primary_gt;
>> +
>> +    xe_hwmon_get_preregistration_info(xe);
>> +
>> +    init_waitqueue_head(&hwmon->waitq);
> waitq not used in this patch. Add along with the patch that uses it
Sure will remove it.
>> +
>> +    drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>> +
>> +    /*  hwmon_dev points to device hwmon<i> */
>> +    hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
>> +                                "xe",
>> +                                hwmon,
>> +                                &hwmon_chip_info,
>> +                                NULL);
>> +    if (IS_ERR(hwmon->hwmon_dev)) {
>> +        drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", 
>> hwmon->hwmon_dev);
>> +        xe->hwmon = NULL;
>> +        return;
>> +    }
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h 
>> b/drivers/gpu/drm/xe/xe_hwmon.h
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
> Add space between if else and contents as suggested by Andi in previous 
> rev comments
In none of the .h files I see spaces between #if else so didn't add 
here. Lets keep like that.
>> +
>> +#endif /* _XE_HWMON_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 9c8ce504f4da..e82c7304724b 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_huc.h"
>>   #include "xe_uc_fw.h"
>>   #include "xe_wopcm.h"
>> +#include "xe_hwmon.h"
> include statement not used
Will remove.
Regards,
Badal
> 
> Thanks
> Riana
>>   static struct xe_gt *
>>   uc_to_gt(struct xe_uc *uc)
