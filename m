Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115BAC04A94
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 14:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjHDOgk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 10:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjHDOgh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 10:36:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F84246B2
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691159796; x=1722695796;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M+qyhUvGIPCF1HHb3vB0NsEsVT91RHYjpa3+nYwtvKQ=;
  b=fxvZ9spEwDjuEmB6SpBKSBN94upDlwiPl2IL6jeF2Ztq79vJZgN5XrDD
   iPv1mh4C/X3YHbS5sXXk/HFLCSBMI/SQqICB0Qk9txlljFsw15ri/+uq1
   5ensnLI2lmXjDi0AgK8LxerKyiJGo5jYnVeiddPLoq4j7Tsjf46srpiqV
   0g2ggT1z0YhelTgoNeBtdnjyxyJdLll3FEWELjYC6liYv4sg2FtjJKKjn
   WzfMwpEwLOEm18Pqkz122fuQWL6Z32MOjeT6qh8ClkbbGhzI3fjKHkkwj
   tReuDGAo4n6b1ewPhty19O4nbA0h8Q05fCdvTElKjBYEpFLZJQKCNABBJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360222005"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="360222005"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853762880"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="853762880"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 07:36:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 07:36:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 07:36:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 07:36:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 07:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwC6xyxhJrFUiAvD26bYBXmcd/VRwKY3yzwqlFe33eAz4F2uaVuwDjecVDgjAfqrNnfFxnKzWSxFGLow7eO9fN3qmSGOwtyLyFGM3m+7QpUNYztHEUp+XR0cnTRCqK7R1fhnkVnWO8af8tSt7QH0ftDyndbK5g/31WYs2Z1DbkoWm2UMmNBSVdEH0lj5M35i66cKJuL9MZ2Ravtq4USyksgGSm6v4yTrIFP4V1VMAAT74NLQjWgukHE3YkXyoY3I7XkHVkf2wyiTuIdzXGPO+FtiNEm2d/h5G7SYFV8zK+kGR0bpkjNntYXPDmGaSo4H7qHE7U4St77Q8YHVODNX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZlPz8eaGjyKZtb9q7bMbCdOklRVX/Za7ruAmyoohsM=;
 b=dJU0SbSF0bpgt10frN9wYlRRmCVJXbMD7a8+8o+3ZZKcbvuNp09jUksQHuPirnfhD/CuguWIE3Fn1yhpfiwFLUzACwVHqZEx7sNS1tx7mSKxlnezRbUcuGjdzU2IZP2jRfGFXHWevCkeD7GifEQNXVshlwDhbqsK4tkUznsNcco7i9toledP989GmH+7YZW+dHr+tUNOnbUCV3lI8fJhr767H8Of2fzdyHKSOZecWBli8o/Q3L/vv7FE7dNasORPgPMEc0IhrWrGEvBnKJC2cXO0ich1z0ppNFMpP3O/UGhXXV8+2VqqLOJmLk1ma1SAd2yp60CBxNJEv70hryWSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 14:36:33 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 14:36:33 +0000
Message-ID: <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com>
Date:   Fri, 4 Aug 2023 20:06:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <riana.tauro@intel.com>, <matthew.brost@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
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
X-ClientProxiedBy: PN2PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::21) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: bd354141-0f6f-44af-ce6e-08db94f832c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZOJyj9oDkTANW4ZUlLBVlu8fVEAVjVEiPv1O4LOV3hQkbSxUD61F95zaoBtLVEOcmTQ96j1t2Ud+YsLFmk0QBAFFHi9uil17iGHz/HmqwgnLBb/WeesXkBeaAQgBfn+YyKTFN7Y4ssVz+qTAtq6ne5/o8BxyVif/dsVkxnmQg/U9XcYyncxb7OrO5LgdWxucQ8jAzMMJh56r75QyeCfVqAKHO/RXNkWOccPkj2FnbYE5Y0IdoWP4G3voo3I4RmDccpYPlv/5TGWOMM5nF3Slu2ics3I8jYCS4RbTTz95pw49GIzgJkynskGkocgHQHrHU3OG3UMvcC14K2crmt/Yyu8rE34ljgnvJcD9uhbZ9bPqfgICU3V1zrI1Q1gwHdgpBPjwsS5moRcP0OZBlP91WtxvSUyywdZBMsVGPE6pADJstpF0OO3RC+/nz/MW5R6oAVFlN1mZu4Y1WYTiWRzxqB4QTi6STkDrTBaKSX+3RFDwul43/vDjFLReBxbcws+lYiSZWJUWWDNgIQjvzWrFvQeXCfbSosUXAz4BdX2JzWidUtm4eHgKCQ8/MVBRxzJdnBi9njb6ORk5Nl2/nVsaKispN/hRfX2UAMswaMzr9flCeZPXcbVdKO60YqOC52t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(376002)(346002)(1800799003)(186006)(451199021)(2906002)(36756003)(2616005)(53546011)(83380400001)(26005)(6506007)(31696002)(86362001)(66476007)(66556008)(66946007)(4326008)(38100700002)(316002)(41300700001)(6486002)(966005)(6512007)(82960400001)(110136005)(478600001)(31686004)(6666004)(8676002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1hUFdRMzYrNTNaNWFxdDVBemg4MFJKQkdaYkYzS3U3NkJ5OXViWVNhZjh1?=
 =?utf-8?B?WEthRzM2SWsxUHV2SGV0TWg2WVFtd0FqQWRjSkZlR2NqajFWN3lwelFxa0Nk?=
 =?utf-8?B?VkRkRU03VVd1WnFncDR5cGlkcGQzb3FYNEpSWC9hZTNRdmVGVDNuQUR4WVd0?=
 =?utf-8?B?NGlhb3dGNHFCUDhya0lqODFiLzluVVRjbWxEcXlLWHBlOGV1ZlpSelAxcHc4?=
 =?utf-8?B?MHRKYVh3MTZsajZmNnludGR4WnFoUDFsMVlsekF2cVZFL05vUDBGTCtoOUxw?=
 =?utf-8?B?NWlqUEphT1lTbHdLc3phN2Q4bitUM00xSGRDeW5seTVublZKTUk5MjVRUGJU?=
 =?utf-8?B?ZXdSS2F2NXRWTWptYlFhK1lIZnJWOSt5QXE5bmVhYjc4dWhQVjNxWUlSTUF1?=
 =?utf-8?B?QnFENzJRdk5jOVJ3R3ZFMjJ2Si96b0ZZMVpCRVZyWTBmZnlYa0o5dDAxd2tF?=
 =?utf-8?B?d3JOd3phN3BvanBJUTNuQ0tUVnFPcnhObGZNTHZpejkyTkVJSCtOaFUyQ0lu?=
 =?utf-8?B?NUxLaEsyY2lpU1ZTRnVsRU5TanZsZ2VuSWdLMlRXRzlLR09MKzJKaHlkUkdV?=
 =?utf-8?B?OU1NUU5OQ2I3bjNoMFlWcHNUd0pDRlppTkhYNjlXQWVVcklPMURIYW9LY3c0?=
 =?utf-8?B?d0IvRTRoYTRMaW5JSW5kRW1vaXo5S1NNTkxLSE56S1NCb21MTjRucis4aFlm?=
 =?utf-8?B?TlB2YzZWL1BQSkREZFh4VncwQjh5blErcWQzbmdKZFVsNGliRmZ5Y2daYzBP?=
 =?utf-8?B?dUtDanlLYWl0MllXT21yRkY2dzhNYzdwMXZzT3BHeldsQU1JMnJJMHpHeHI0?=
 =?utf-8?B?MFN4bjI1QncwSWg2NHFPLzAzdkxqQndxYk9VcTZGL29QeWl3NUV4Z0tiaS95?=
 =?utf-8?B?eUppV3p6eXcvcW5NV04vVUZLN3pVQXhyYkF3Mjh4UWZrL1JvMDUwUWJzNFE1?=
 =?utf-8?B?RmkyaWJDck1vSHlWY2JDVTB5THhsdGVxYnVQOVhNQ3Vkc01IK0R1UldiSStq?=
 =?utf-8?B?OVN1NVBGSzJIdGVVNnlmT2dYM1E4M29rZ3pGY1FheG1vc2w1dDRlUnUwVEVF?=
 =?utf-8?B?RWhRK3RvTXpQUjBHMjRJeU5aaVROdVZ6UlIyanNxWExiSUFNMUxPcnNrMG1s?=
 =?utf-8?B?WTVmNU1qQ0hUcUZrYzBScjdpa3FEcllrWG53bFBkVXI3SmxmdUNJN0VQN1o4?=
 =?utf-8?B?bGxHb2RGbHhMaUNOL003aFlDMy9GTVUvSkZQRStsV0l0MW9aWGdFSUZCbnVl?=
 =?utf-8?B?b3drVkRGS01jUW1RYm55MU1iN1lyTVJlaVRyRVFtVXpPdXlvNEFNaXhZdlll?=
 =?utf-8?B?dWZyOGFPMFV3OUNjSHY2aFBMcXBBUzhMRWFvZE5tWHVDY3F4QTlhenRzN1lE?=
 =?utf-8?B?Z2hjaE9RdWpZTi80NXRkVkJvbWY1aXdab3lyQ3ZvYTZqNXNya29Jb29nVCt5?=
 =?utf-8?B?WHQ2N0x6TU15ZjRaOXNvQmlMYmV2RlZlYnFuYW1QQTdVMmE0QWhLQUtDOU5M?=
 =?utf-8?B?bjhFa2hDYW96VHJpS1NMOGRqWHdjZFF5dTNQT085R01PVzFLcklKcWhiSnps?=
 =?utf-8?B?c0kyRDRQd1FhU3Mxam44VXh0Qm40WWxLSEtYR2ppMFNBaktTRkVhUEVZMDBE?=
 =?utf-8?B?ejdZcmVETXpHWUt1NXNRMSt3YnNEazBWYkdObE9ZSStxazJwcWl4a1BveGFM?=
 =?utf-8?B?VGtUVkRNam5FOTNhY0laek50dWlpei9zekNPSXlGSnFRQThKZDRvRWp4WXlu?=
 =?utf-8?B?OUJSajRTK1lmTE9tdFFYRENlOGQzcmViN0owRjNyQ1IwMHV6emwxMncyc2R6?=
 =?utf-8?B?TG8vTDNtMDkzRW9sQWVBRHdVcDdOeXduWHNDNmt5TGl6L29DOURVWUtJdzl6?=
 =?utf-8?B?ZkFNckl1NThSVWJvMWVJZklnWGh3UFMwaXZOT2VVNWpldTliUi8zckZ3L1pv?=
 =?utf-8?B?RmlHZXFuajlFUS8zTzBlbFNXNDFyVHF2d3daWDVVdTJqaUVuYTBnL1FnaEdV?=
 =?utf-8?B?enoyKzZhVmVYS1ZQQXJXdndKRSs0Q1lrUjVQK1BPclFQSGNReHhUdW1lRDBX?=
 =?utf-8?B?Y0MyZTBzcG9rbkNvZW5JKzBtMThUbGVvR0w1RGVoeFlvZ2VDMitNbm5BR1hs?=
 =?utf-8?B?WG0zOHNiT3RyNisyOFZyMFl2MmdsR0tKV2JqSk91czlQa3NIWWljUkNiVERz?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd354141-0f6f-44af-ce6e-08db94f832c7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 14:36:33.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0Trv8QTf3RGT0w50EL4hr7Ffok/OMNAzUpXqcqiszO2s51mzemakDps35yDqL+hgQhZM3xTWEOhTUlPONLpQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5579
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
Thanks for clarification. There is only one parent device. So will try 
to accommodate single hwmon device.

Regards,
Badal
> 
> Guenter
> 
