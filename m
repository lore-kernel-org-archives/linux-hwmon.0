Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9185EE7D26C
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Sep 2023 09:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbjIZJBW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Sep 2023 05:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbjIZJBU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Sep 2023 05:01:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A91810A
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695718874; x=1727254874;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1aZn0/rhgMW73PiOXWXk2Weo2DTqkAUWr1MPRsS7yuU=;
  b=gDkDkqyaYdcM667uJKGxgUVmbmzzZ/QxC3iUxRJX5diHovFma6M0xUQe
   IiUCoWPr5v1ei8i37NCx78L7grv6zPqOD06Yh45l9IzJkx5A7MzIx/BoK
   xE/jTx5gyEIBv/7GGkra/GaIBak99mkORLc2oB1nRJz98X/OVYJxoCDp/
   lP8kaYmF5izLtunJAcSpeOpLfhxtaPD52n74JFWNhbCromV2wRzrnlWCs
   cbThamxMR9g8RmyRL5MFUS6tbOorUwlSywAKMfceEl/Mfn0rQp6sbGcEv
   lc2LlzHROH5BJzhsBKl6mIwLBkFWj6DIKxXsyznz/tAXmmfh4XUuFpynB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384300243"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="384300243"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 02:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838960309"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="838960309"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Sep 2023 02:00:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 02:00:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 02:00:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 02:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMF5tdgKkYXC3vGpepCOvuXhZRKH/y2wUAyI3oGJThNcDWjlLNk6M0xcObdLHGB45RlQeyy7Yl8FmtL4P1NTcH7QgmsNHNUrYJCnmh7yvwD3+vI9bX/EQ/eke/djxBLB7Yb13/Wa5cdfxSE2oC5UUuvQ7Qy/rAuP08atWNpa8IBHNP04t2rUlRiIqeW9+R37zXX/IrgwiB0dU8t1gLg8c4ATNYsC6vSJDl4c0bpRCKuPvcZVEpyNED9+nts5TvmD3UaWrk+TdCpO5lsV2kmgxLm1Md+jkqWRSMhYgvJQWTs48ClNDJbYIh2me593Qjd/vx93ZciQaTFdt9CPpanFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roLmDgjNiUtcXXkAYiNSB+DbWcl6kek1IC+PhUKvAUo=;
 b=chcamu2XAmI6SgKkHDQy0JBJVZqzHATWoXQyEmUE0Jyj2KWjwZHwGdLkw0Ea+jJ1uu8j4XMdMz8uNZpmolAPNjjrFfXpxEQCagUyI8LjQLpycmk8RZkpwJ73cn/vFXjIXxoOnLpfSD9YemtbKij1y5UYfCDo2iG0Q04un/0qw/XfwM7wABDin/pIjasxoEH7319qFucfxTLxkgVz2Gz2jXfT5hmVT7D0VpjJBLUUZMFup4C6nn19jqkaflgkeOxpkkfHgnBJific91qXD40OqApEYc/2CGs8u6A8ziCgJFOtCGEdtSGY/ZFy8L9ewzed3/C5CY6WHKAaVEau8hfzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Tue, 26 Sep
 2023 09:00:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 09:00:56 +0000
Message-ID: <ec2a4e33-0b34-fb00-5470-f2d39edc6eb1@intel.com>
Date:   Tue, 26 Sep 2023 14:30:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 5/5] drm/xe/hwmon: Expose power1_max_interval
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-6-badal.nilawar@intel.com>
 <ZRF1f2OsC1pr5hFd@ashyti-mobl2.lan>
 <e5801f36-2f9a-6d24-7af2-1e7174f2e0b4@intel.com>
 <ZRKP2UIGUWTXnZN6@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZRKP2UIGUWTXnZN6@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7ad222-0c72-4ea4-7586-08dbbe6f17fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPY7W1F8NmavTvjPYiKz+9VZmfzavZWiMAyLxApr/JVwOUhOXDWk0xIcRNC6XV4FlXZ8xJvFTWPqtV8GtWE7x3MHfGKfH2w/WNhE6Sn0IYOnFrqm39vvTUmFmMEvzkeyMcnEYRtF2Rd2Ogm6GTF4ANhYCWG4MCzF68DjkzFdtqMcxlucps8yzo/ULSKnOVRCiaR1XOkoZFt6jW4XaJv72EpGc5l/+jP6lHY9AwLxftfSuiVyiJvApLL6TUd7AxQFXQxtf3CdGrpborGH4+DkLoB1tzF2fLaKGKgbBtVtjKAmb7GblN9rq8FV9Rc3ZfeHB+sKg5PEfJjCNxYdrBkwU9fwEf5xkjgL6cuHzgx4EAKPBXaIHp4U750ZS0Z/+mhEhzlcZZG7IuBi763MMYp/dxLBqKJoD0kdp55mML9gcPzq9uDEg7F308NjzRU4lSWFiHWOlQ8Oe1vga3An1FsoX4mh4khxW1tJ7Cnnma09IUbzK3rg8E+04+v5U3QqvGTPxnGD5uKRIsyj26vWppdv+lFQZF+mYirzp8Fs+NdSRW68O8TttvVzFsR7MX/l4VyyMQU9PZmWTLO4TzJhNCOGMXPEBG0piy/63fcX5RXk7kJ9CMlnEucaxr5cr/KA99gSkaQw2+FnI74iFFI2BgKybw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(186009)(451199024)(1800799009)(41300700001)(82960400001)(86362001)(38100700002)(53546011)(6506007)(6666004)(8936002)(6512007)(6916009)(2906002)(66556008)(316002)(66476007)(66946007)(2616005)(5660300002)(4326008)(26005)(8676002)(31696002)(36756003)(478600001)(83380400001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FneC8yMDRIZUw2OXRxV2V3UTJKNWZabTd2Z2t2cXBwQ1JJR25zSzlhTjN5?=
 =?utf-8?B?eEpJbUVWekVmWWZDMzFmRjlucHVYS0hraWgzWnlTellRZks2TkorSlU5bWFu?=
 =?utf-8?B?RFE1Sld1QUlpb0Vwekc2OUZYZU1Wak1FVUhrandXTEtnaGIxU21iQUZRdDRS?=
 =?utf-8?B?MmdnN1BVMzJpMk9OdGVFeGJXd29uMVZ3QkhMYmh6RS9jcjg0cytLNm9JR3ox?=
 =?utf-8?B?Qlk0cXMrVjdpRkdDbmtIcW1UUHcxaXY1OXJOc2ZNdlEvWGJNZ1IwV3Z2enRs?=
 =?utf-8?B?c1J3bFh2QzllUjFxdk5oSG9nUlNpY1RyTlhBZjROSERtYTFNeXk2T08vMVZW?=
 =?utf-8?B?SjlBVHF6alozSTBNUlJvWnZsRkF4TTQ5cmE3emNzTCtNMjJDZHp6akltSmVU?=
 =?utf-8?B?ekdlOUFXUzRLL1MwRGplcmJJQkFCMis1VkFkTE9QZTZBWWRObndxR01xRlBz?=
 =?utf-8?B?Y2hzdUR1anh0c3ViYjEwUVM3alc1aUxIWlgzQkhacEFXeDlnUDlMVTM2SytJ?=
 =?utf-8?B?RTVyNWlFbElNWHRnY3pNYWhvOHFLc2xyckFWcnV3N3FZYkJhanpqVnlKZlJh?=
 =?utf-8?B?dnJaekk5QmxwZXMvOEtHa1JvRXdCaFRRbjNJd0NjUG9pdzY5MGlFa0t1VE50?=
 =?utf-8?B?dUxESUJmeC9wMC9HS2QzMXlsNEVvS3lLemZ4WVkzeDhTYkdmNXNPNmM1OGpo?=
 =?utf-8?B?T1EvaFN4MEJ4alFMRUZLc09lZnVaRXc5N0VpZVFFM0g3TjJkUVVsekJ6eVNr?=
 =?utf-8?B?MW53THVyQ09kOWgybTdNbE5yaDBXR1BIVE9jelhjc0JJTGFQeEdXL3hxZkxL?=
 =?utf-8?B?T1pSL3V2MzFtRkllVmM2N3ZwaVpuaWJoSjlvK1c4YW52OVhYYXFVSWhvM1hY?=
 =?utf-8?B?ZDlxMUNqOHhTQThRS1d6N3dxUm5ablpmTHVLUVZnS3h3VTByTVR1eHlJUENx?=
 =?utf-8?B?VG05R0hEREdrUWswa0dYNHd1b3J2WjJTQ096SHlwRlhrUHBTZXU0QkdUY3Qy?=
 =?utf-8?B?TmlIREZnVnZ5LytUOVMwWFg5endhNks3NXRwZkFaWUlCNU9LRmh5aWw0alVM?=
 =?utf-8?B?eEFpRndRVC9aQzVhME44VXJnNTVKdmhzUjNZTitOMzlkNnhhVDNmTS9GdVlU?=
 =?utf-8?B?Q1RSVVQxejFGZWR6dHJvN1U5RHdXTlMyUjhSdG4zMy9rdURpVGlVQ1BZRzV4?=
 =?utf-8?B?ako5UmpobXZrcHNVRnpDS2diTDFualZ3dmN1endOS0VrQUVncWFBaC8rMnEz?=
 =?utf-8?B?cDc2dVBwd09aUDJCWVg2NGJIODJQRkwrSGV1QUpLNEt5VzYrRThkWEYvb1Zt?=
 =?utf-8?B?UEVBVnV6QmVTRTRpWDV6cnlqYmF0R0dSRGh3ZjAvRFA0L3BZUy85aGEybFRH?=
 =?utf-8?B?R3MxakozMjNlWmNZQWpzc0JoVFlWVXZSVWVPTzNCR2k1VDlld2NhOG9pU1o2?=
 =?utf-8?B?c1FMLzJ6Y0RpS3ljajNMYm5lYis5MzM5Qjl2Nk02NVdrOFdwdS9iUWpkVUpC?=
 =?utf-8?B?UlFFNzVDQU5ab2FzODB0ZFVpTGhiVU13TFRKSklEeDYvdWcveXBnS1IycGhF?=
 =?utf-8?B?NUcyZGZzRFU4VzNXTzl1azF5bG5wQnVjMldKUFlERHZVQlJHbVFRM1FQMGZk?=
 =?utf-8?B?aHBFbW1MNm02UzFXYVNUTDIzYytRaGhKMEJTMlR3NE1UTVBRSXA2cXFoeTBZ?=
 =?utf-8?B?MnFHZkZYeTBQOThKeVo1V2RqeUNVcHM5TjlDWXcwTndVbWxlQ2xJWW11ck1x?=
 =?utf-8?B?UE5HYUxhbUNQOTFZcXo3Qm5tNGdlekk2VTlrZ09LbG42dXpnQ1o0VlNBZGdB?=
 =?utf-8?B?QStVallyVnorTHVwWndqYUZCRmJyMU1CNUs4TmFGY1FyZFRVUlJONE5UUjlw?=
 =?utf-8?B?ZkRmV3pmRnZ2czVYSFVxTWNUU05KaVNSdE9QK082UkVQc216NktuY3djQysv?=
 =?utf-8?B?bi9HK01sQmhvMHhyenhaSjN1Mjh2MUFzYWU4blJhdTlUTURockM2WFR2Ympr?=
 =?utf-8?B?K2tSRXA1cXAwWmY5SzAyU21lWW1jNW9iYnRjRktZQ2JjTGZVVTNkZzZDTW1s?=
 =?utf-8?B?VzV2cHlidFVFdGc5YUlycGdUeDhFejZyM2U1YzdxNld4WmR3SFdoU3VnWW8z?=
 =?utf-8?B?eUxMaWJXcmNVWnNFVVpGUWZsYUpyL3VtMTVYTDFZZGtpczA4N1J5NTIreXV1?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7ad222-0c72-4ea4-7586-08dbbe6f17fe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 09:00:56.2595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOBM3HlpeXmik03ennK1hIzu3V4r6Ddih50pHacUmqyWfa53E5/LVCD3UIncE4J8c1AA8hot+g6ImIC+AynX9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Andi,

On 26-09-2023 13:31, Andi Shyti wrote:
> Hi Badal,
> 
>>>> +	/* val in hw units */
>>>> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
>>>> +	/* Convert to 1.x * power(2,y) */
>>>> +	if (!val) {
>>>> +		/* Avoid ilog2(0) */
>>>> +		y = 0;
>>>> +		x = 0;
>>>> +	} else {
>>>> +		y = ilog2(val);
>>>> +		/* x = (val - (1 << y)) >> (y - 2); */
>>>
>>> this is some spurious development comment, can you please remove
>>> it?
>>
>> This is kept intentionally to help to understand the calculations.
> 
> then this is confusing... Can you please expand the concept?
> As it is it's not understandable and I would expect someone
> sending a patch with title:
> 
>   [PATCH] drm/xe/hwmon: Remove spurious comment
> 
> Because it just looks forgotten from previous development.
I will add this comment inside the comment at the top of if. So it will 
look like.
/*
  * Convert to 1.x * power(2,y)
  * y = ilog(val);
  * x = (val - (1 << y)) >> (y-2);
  */
> 
>>>> +		x = (val - (1ul << y)) << x_w >> y;
>>>> +	}
>>>> +
>>>> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
>>>> +
>>>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>> +
>>>> +	mutex_lock(&hwmon->hwmon_lock);
>>>> +
>>>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
>>>> +			     PKG_PWR_LIM_1_TIME, rxy);
>>>> +
>>>> +	mutex_unlock(&hwmon->hwmon_lock);
>>>
>>> why are we locking here?
>>
>> Since it is rmw operation we are using lock here.
> 
> OK... so what you are trying to protect here is the
> 
>    read -> update -> write
> 
> and it makes sense. The problem is that if this is a generic
> rule, which means that everyone who will do a rmw operation has
> to take the lock, why not take the lock directly in
> xe_hwmon_process_reg()?
> 
> But also this can be a bit confusing, because a function is
> either locked or unlocked and purists might complain.
> 
> A suggestion would be to do something like:
> 
>     static int xe_hwmon_process_reg(..., enum xe_hwmon_reg_operation operation)
>     {
>     	...
>     }
> 
>     static int xe_hwmon_reg_read(...);
>     {
>     	return xe_hwmon_process_reg(..., REG_READ);
>     }
> 
>     static int xe_hwmon_reg_write(...);
>     {
>     	return xe_hwmon_process_reg(..., REG_WRITE);
>     }
> 
>     static int xe_hwmon_reg_rmw(...);
>     {
> 	int ret;
>     	
> 	/*
> 	 * Optional: you can check that the lock is not taken
> 	 * to shout loud if potential deadlocks arise.
> 	 */
> 
> 	/*
> 	 * We want to protect the register update with the
> 	 * lock blah blah blah... explanatory comment.
> 	 */
> 	mutex_lock(&hwmon->hwmon_lock);
> 	ret = xe_hwmon_process_reg(..., REG_RMW);
> 	mutex_unlock(&hwmon->hwmon_lock);
> 
> 	return ret;
>     }
> 
> What do you think? It looks much clearer to me.
REG_PKG_RAPL_LIMIT register is being written in xe_hwmon_power_max_write 
also, that's why lock is taken. But some how while cleaning up I forgot 
to take it in xe_hwmon_power_max_write(), thanks for catching it up. I 
will update xe_hwmon_power_max_write() and resend series.

Thanks,
Badal
> 
> Andi
