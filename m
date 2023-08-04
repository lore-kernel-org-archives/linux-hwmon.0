Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070B9C41513
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 14:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjHDOns (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 10:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjHDOnr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 10:43:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809A746B2
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691160226; x=1722696226;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cmWyRq3j3/mZpfbutJYVhSwr0EN8U/qr8GsYOQ7+OuY=;
  b=TWp1qm9MQAzCRABZprg0S9q6lDq99D38+ZAcXjjajsE11+JGn2bLjztE
   xPl5SmIwS8cGqY5I7HOppsMvlw6G4nCV5EapKldYHAxDIURGZukVS+xjW
   2hQ+pYn+H3qRZYIDdyNxOQFILkNX4r1cQ6ky2OSXUxUMfbw1065654CCn
   3Mouk2rUKfBswCmathwyEnxCVlUgWir7Ss17nYPxebB+V/Q21UBbk0qV+
   aJ19Ny580B5ejR/6DQqeTh2Tm9HapYWuYBJ5eArhye8/pGUqqSjUx9ObS
   ky5F1dWHkkOuqc8j3kyKofYs9z/kxFYHcgTwTTlzqDtoa4cd2KHUu/LIT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="436489341"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="436489341"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="795445801"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="795445801"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 04 Aug 2023 07:43:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 07:43:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 07:43:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 07:43:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4W1mCLMncxH9FB0xP2TxIZPA4IiNGvVKFCOZDvaw20hLe7wmMsKxY5fUbWbs+5LnYRxAUdTiC+TkhTeDM89gtS8ycymd4v+BrNLX/zTsUtXAFt5xb00FS8x4V6jdgmv4oiaJVPvMtFrJPMo0mJd/zOfYH8VQ2pigRrmy6bKSwZ27I5jA/40VJRO7s+kbhwHpq1dWOQFsqQBptqzbpFocpeQCm7sz+eKh2jdQCKpfEpV9DMfLLNvKHVax7DB05DmzWLm17VvcOK4LS7UwncKkg2wIIy0j78yRm3810SJrBR7403rpijEo0jiDp9tRGFcaOKHK1xXNIW8ubD7sWqHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nq1Dpn5+4H3Dfy8+h8nYczMeDqoaG0/KY5nUYkUlm8=;
 b=K29QKell3Cke3cO7E+TVvot6PFkwQYE61sE4CDq72la4JHRYQSm9pdQBTRBhV2lR/TuHiJCWjEcS5++finW9rGF9G/PY93faAUdP3gyhCKE9oG8x9oc9IyWkcwbI71hzQQqRKJkouwZdVnpZ6zlYTFZmAi/ot6s6lkhdszbwMTkscUijFXzNq21XzusdJ4uSLdaeA2e26foPJUjEQQcgQk021BLeBmpualGLG/PJMog9AT6k7Rvg1aXNyZgoirwxR8fsJTkRQcIgZJBJNELo6CBnaLk/k/Xu6Md5nD2KQQxpWV/NZmIwy7uzpp5z33aFeUYsMK8j2j022vf0SPr4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.21; Fri, 4 Aug 2023 14:43:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 14:43:38 +0000
Message-ID: <ac658969-d077-7790-dccc-8ace9832bff3@intel.com>
Date:   Fri, 4 Aug 2023 20:13:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <riana.tauro@intel.com>, <matthew.brost@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
 <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a314ba-27be-4fac-8601-08db94f92ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONqWu5v6I0G1pO9qjI2+OSXLYjI2+psxyAoatAeIRlMTlVPX6r33hGpUqnOpulK9ck0ynPLbrNv4iFYVtItxhM6k+MaXXsCAl3KKWCjgrL07zkdJvDFhoiRQSI+pP6w1qv0s/W3Chu1EcCzeXwECk9z1gntRd9hgsTzZh4yiC+LY6bJCUqjj/7X1PB9U3qr76SeJvbHsEFvqgZiI2KvDXGDD2GDiqJDItZmTXSqbKBFN9txWDue/TpASVZ+WmrC21VpVTZiSm91mPdl68f9PEIjApwPqTikVm+62BWVM9miAod2hdY6a0KUgRo0TN1jPXxdgWh6IaKlB6T59uBzfIkjBEiQANmvDXnEsx9LeL4aWrkp+5NTzozOmveb1ZFMk3P1DMfpdKhCFddQCMvrgUZGmY8XXTcc3qCnjmKgKMI5tHkKlIOkzxwnpv1vMJO1CxC+lVDk/mlrBnAlCLT5yr8FO9jLGftaW7C5Hq8/LtZG/4HCt1FircR86aG7+hqS5yfGLMlQePXqZjY6qMIZqCYvwQliuzTPq+3Usy+w5MKPkp1sT8pfts77Qc7wSOMWW6Q9i3JJs/4r8OdkScoaWB7rAMtn61GGYvZ6mhSK3axcZ6VgVBQbpz0mBXA+bEwUA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(136003)(376002)(1800799003)(186006)(451199021)(8936002)(8676002)(26005)(36756003)(478600001)(6512007)(31696002)(966005)(86362001)(6486002)(6666004)(316002)(31686004)(41300700001)(5660300002)(4326008)(66476007)(66556008)(66946007)(83380400001)(110136005)(2906002)(6506007)(2616005)(38100700002)(53546011)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3ExaG1lNkNYZFNkN3VMbm5GZmM5czRWNGdGU0dOcklwUjdQNXVrYmZ5SWs4?=
 =?utf-8?B?amw4RGJPeTkvLzlnK3ltUmRqd2o3QlVoSjFENHhGR2lmNlJIb0o3STl4Z1Rk?=
 =?utf-8?B?SUwzejkzVGF2MWpmTmdJeFh2R1RXV0Nscm5QS0NhaVFBeFlEVkRTbE1pM2lM?=
 =?utf-8?B?NTN5djV5b0Z2RHZrdlczYTBpSzFCeHI2MlduUk9GVXk5V1BTSjFSUlpkcjQz?=
 =?utf-8?B?SDdQbHpuWmgraHJhZVlkWWZ4cXd1SUVEL3BzMEYyWmN2VCsrMG81ekpIT25Y?=
 =?utf-8?B?RG42UzVQc2FvckhqTXFNT0w5TTVSMkRRelBrb3BMV1ZaVExxbEc0T0kxVWxh?=
 =?utf-8?B?dnptTHNXMGJ0Y3VGMW1ZUnhLOXVrWnpuZ0JCMlZieG5aUDFldU9LS1krcGQ3?=
 =?utf-8?B?TkJQdk5heE5vYlhwdnZvNnBXd0xZb3loV0tvNFU3RnVIODlPQXZaa0Eya2c0?=
 =?utf-8?B?VFUxa1BKU2w5Z1JJQVdod0JKTG9qUEZnLzhRTytxcE8wZkZTS2FDd0hlTFd2?=
 =?utf-8?B?c05rUVVBSVYzM3dkL1Y0WVVTaVJUSkg3c200YmtZT0F5dmNmK0F1RXdiVU5L?=
 =?utf-8?B?em1wU0E1Qlo0TmpFTVNnTlpIalluU2JVL3FOZ2xnRmllM2FvMWUvL0lyOUR6?=
 =?utf-8?B?R3FUcUYxZFYwWlNjNEhHc3lrMVNYVUdOTWVIaGZjdWhJRWR1clY1RjZ1K0Ny?=
 =?utf-8?B?YUNCN3labTd5RFFFekl6blZUK01XaGwyWGdGWjd5cXFUamlxd0VKZ29Kajcz?=
 =?utf-8?B?azJpVHd6N2sxMnd0K2sxVlJQa3lFQnlkZEErRXhkdUx6cDM2Tm43TGNGOHRk?=
 =?utf-8?B?SkxURkJQNWh2WktvLzZPZHZyVG9RbDVJMWJWN2Q2aTlzbW05RUVMUlpYNE82?=
 =?utf-8?B?UFo0RktGUXZTd1pMNEZWbkNLczJKYnFUekVQYzcwb3FPd1NPSEFsOG1VdEdH?=
 =?utf-8?B?YXRKNkJEeFNnWnZ5dStLWGlJYmFkREdqRHk1bFdMOTdYQklEWW1uVGI3d3Mz?=
 =?utf-8?B?bHNhcVh5K2JvVzZJSTBEclQ4WDNjTExUS0M1MjI0cmtZa1AyU1ZZeFA2OVIz?=
 =?utf-8?B?UUUvQ3Y3U3VEc1FHSlBURG1DUnRMV2xhYW80bkV4Zy9IQ1dNVm1vZ0NzNlpE?=
 =?utf-8?B?NElLQXltZExSMzEvMWtiL3RlUmNiMTk1VWNEakU0VnZnVENjTVQ5OW1NcDNh?=
 =?utf-8?B?QURhMXNIQUJQczg3MlhZZ2hEN0htVnJDOTQ1VWwxMWl2UE4xYUsvR09rZWNl?=
 =?utf-8?B?RXFBU1FSM3VPUTh1N0hheUtpZkNTM0hvOVZXZG8vTGRmS0JjTEl5anZ6K3pB?=
 =?utf-8?B?MEdVdHR5NE1hdjVYMkFxR3pzWDN3OHlMcGtIcWFTMzY5NFdFT3JqSkJkVVZk?=
 =?utf-8?B?RDBRbjI2QWc1WnZ3S2xhQmUzM0JSTVBLVmdNb1JUR0Q4dUhUbzlBeUwwTUll?=
 =?utf-8?B?TitQL1lGeVRMbFl1QzU1UFpZdzJINjBGUHI1OHZvV05TNUhrYjdvQmpIaUVI?=
 =?utf-8?B?emVrQk9NZk9DQk1mWk5xbkJkOTlrRVQzZnBFMzNtQUdTU29SdEZPSzFESHZR?=
 =?utf-8?B?em0zVDhlQmltbDhwc3ROTVoydGVBb1hWaDE1bno4dGpucjZNcjJPaUMwOHdH?=
 =?utf-8?B?cHN0UnN1ZUR2VHp4MDh6NlgxdjJJOXdnM3dCeGt1aXJOL0tFVTRFck40T0c1?=
 =?utf-8?B?SmNSUFNzejBMMTJBbFgyUDFLUzd6ZDJUZjNVaFlIaXBmVDUydDBScVhyZDhl?=
 =?utf-8?B?YUdNb1djNlpiTC9iQ09ybmJTTURZTENpUXhkU3JFVE9JQnkwT25nN255cmN1?=
 =?utf-8?B?QWlZdTA2a2RHdnVTeTBzMHJaWFNTeXZGK0xaQmxaWWhJZDJWNDlnV1dQTkZy?=
 =?utf-8?B?bFMzUi9HUDdqUG5iV2U2VUlCdnA0L0d1Y05GRmlkRXJEbXJBMU8wUU1RRU5V?=
 =?utf-8?B?WDBla2RIekx4aVlQSVMzRjlJT1JEc1ZuK2tkYlBnVTM3RzRvTWZFRWZwYUlE?=
 =?utf-8?B?NTFUa3hROHQwUVkwd3BJcFpKS3V2Ym9uMHlacFJlME93MGJmWDlKV2JoTEdx?=
 =?utf-8?B?ZjJyNTJ3NFB5emx0aVhaL3hrQndnVFA4eHRzV1FEYitpSDJVVEQyZmdjUjFj?=
 =?utf-8?B?cEdKYlQ5c0UvT3RadVpNNHQ0Z05QQWtOa0xFM2h6K242cXU5M1FCbnc5UUpo?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a314ba-27be-4fac-8601-08db94f92ffb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 14:43:38.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pp1irtbts2Aawb2Ityt4+9eu38Zl6PtpCCnIauPuzn2fh2PLaFSpqz6b0ytM/FtDKMviZfJ7/2NPJ6yiSAIo9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 04-08-2023 19:56, Guenter Roeck wrote:
> On 8/4/23 06:19, Nilawar, Badal wrote:
>>
>> Hi Guenter,
>> On 03-08-2023 04:42, Guenter Roeck wrote:
>>> On 8/2/23 15:40, Andi Shyti wrote:
>>>> Hi Badal,
>>>>
>>>> [...]
>>>>
>>>>> +struct xe_hwmon_data {
>>>>> +    struct device *hwmon_dev;
>>>>> +    struct xe_gt *gt;
>>>>> +    char name[12];
>>>>> +};
>>>>> +
>>>>> +struct xe_hwmon {
>>>>> +    struct xe_hwmon_data ddat;
>>>>> +    struct mutex hwmon_lock;
>>>>> +};
>>>>
>>>> why do we need two structures here? Can we merge them?
>>>>
>>>
>>> A later patch adds multiple hwmon devices which makes use of it.
>>> I think that is flawed, and I am not inclined to accept it.
>> Is there any obvious reason that there shouldn't be multiple devices? 
>> In i915 we are doing the same. 
>> https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
>>
> 
> Technically you can do whatever you like as long as the code doesn't reside
> in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
> either. i915 shouldn't do it, but I didn't realize what they are doing
> at the time. Other drivers doing it wrong is not an argument. You can't
> argue that you may drive faster than the speed limit because others do it
> or because police didn't stop you last time you did either.
> 
> One chip, one hwmon device. Do you have separate parent devices for
> all your hwmon devices ? If yes, you can argue that having multiple hwmon
> devices make sense. If not, you can't.
Thanks for clarification. There is only one parent device, so will try 
to accommodate one hwmon device approach.

Regards,
Badal
> 
> Guenter
> 
