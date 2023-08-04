Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27924C001DB
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 13:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjHDNZ2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 09:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjHDNZB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 09:25:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF5D49DA
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691155466; x=1722691466;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e+EIs81Aq2v+vRNkmxILXqxWa6Iu+MEpsWkpL+lU544=;
  b=FCEk7lrq88iqdB8fXYSbNRYSQFUy9dfbgrUTi8Nzs5+EAbwq0xWFaTQS
   O6iAv5uere0dWhnr5uV0HijUKPhzsj70MgiGTuu+0OeUEZ1RTA81xTvyg
   SmJ2h9V/R10NRe0gMU41yudEsejje20H9/QQPhHXZgRyAm1ZjQXKUCiGT
   Y8V5X8j9b9A5OB9mz3k1bTRJatHtHCwUpLN32OYWdKc1UEOlMo6KblNXR
   LBPNGUqLL5PS1sUsr9SNgMp9zIdcViRNlJGSy3KiSf0f7GpOvbh2+F5Wu
   gKOY6ZmDMfyL5HtSn3yMgNjTtFKisSHUJmb8NJ0QiHT1uerCsFtDN35+i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456529769"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="456529769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765111251"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="765111251"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 06:19:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:19:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 06:19:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 06:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSSqZN2d1dk2rjI+ba24h2ZjfY0uVgnqd/YxnD3ft7y83x9Kcg3HTFOIeYO1N+2YS6pptSRQsImrMFxUOkWUWX6jO93RTOocFTfisHAzW43l5wVVHAD3ciAtGRcLHXjs3ZzQA7XJvAWHG8Cc3AfxbMbeKDTrhpyswlnxMhCgGRhbIpeNatrX+OXvU1OXJciLAsLSPKiSRbz5ScSyGp2Kev7UYBW6uHDTikbxaGSRPrg86D5NfTBuwsOhI9zp/zVFzD5fy82VDorl57RzknsEKgP2US5K2fJaDuPjUX0H3jfNKJD6sVQi9NzICfuVKXW1xWAhJxTysSDgjznm37M4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xBHJ9evRKRBTWb55T5UsiPxLcn35BLUAlbS8sva1bQ=;
 b=UdCTLRXMkp26yLi7lkB4fuy41/MzFLufLnA2Ci0MGjnK/KPffKqgdLgLCddAy+coD+KkUyHhEAsExmUh3Bep5HWMUns0cdAbGhV/f1fRx8poId6smep14Axf9rTPvV89U8c3BfRrOeGi+Q0iw3sndKWv2vxtmSJjFYTjRu+Kt0y2rbQOEX4wuFyzuSaHtadff9FOiiMxTaSie9hasiTML5RN7x3rm7K0TPi6mydwsyqIwmymH+0uOb6GV88tx2yK2dYNmb990HRLGGLBJfDtQ/VEg7FU+vKciVlWAdtDU2hoboWtyImQHsece27/zFoyUlfA56mVgNpSgTlimRG42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:19:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 13:19:23 +0000
Message-ID: <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
Date:   Fri, 4 Aug 2023 18:49:10 +0530
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
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfb6685-0102-42cd-ae0d-08db94ed6b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05zLU6XUyUsvtKfutS2IqPhIfi6e/m8FzIov21p5TiMSWfjw5gyINQGy1d0l2XsjYXeSWe/ATezMrXZ3gCaX6yqzePAZVWcUxUVbKejC2ULOzwHf5/+m3swuImfkZ54hcF84iO9o/J6PIgav642gLpk+2634VamQy+pTJXeh4hQv85CHhiQun7O5JY4x83lqo+COKjIFPsD/ZNcinU0ybOWRPOcPIUT78Rpv242rT0o55265wVSQmwd2cL3k+WUSCHXzcW58cPJ3gmFHzZ3swKJhNsK2rf3//BPPEkbtRBDDGsdQpd5+/eeBVWvAC1/LaqkkcFi7Q5ehaHBIQkyds4Fu9aikND8Ju95phYfFBuEyVO2C8P4JU4TOhqz4unYi1V8IL3JBv5EaJIyTOMawC2KOTl5d9ZR5TVsuPz/0+dGp5pmBu2X4PuTWEQyPbhh1S88JT+faxIeSqDfFun+7/TEJ7cm068V06WSW5DlcQaiXDjrWz6dzE4C5S8NvlIt0bxV9XImchU3mMVUqA3OIYG0nkW0guoa9Gz2Yqb5XzWlGytMBtJwZACL5CNnoQFDQlqVRgYr6NRLCdwNosHMKIKN8IC17glWRxkTrrPwSh0EA/llUWRkxGLewliZLVfgy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(186006)(1800799003)(6666004)(6486002)(6512007)(966005)(86362001)(31696002)(6506007)(26005)(36756003)(2616005)(53546011)(83380400001)(38100700002)(82960400001)(5660300002)(41300700001)(8936002)(8676002)(31686004)(4326008)(2906002)(66556008)(66476007)(66946007)(316002)(478600001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW5heHpZNXFqVU1Tb0crdVBSdE9qTWJzeE5XWHdBWXFUcDBOVFNlZ3E1TS9o?=
 =?utf-8?B?eitPR0RlMDJYQ1ZreW1kUk15SGZHOEtTaVM3aVVSZFJoZmRtOWV6OWhlcmw4?=
 =?utf-8?B?MEpKYmNIbW4zTkJiVDcrNGJ0OTQxcVZDTTVDdnB1VTV4eDNRQ3lkRGlaMkJF?=
 =?utf-8?B?MTh4R1NuTmVOeWNnK29qUi81bHM4WVZQRDFUeXlrMmlpYXpueGFHVWRTVWd4?=
 =?utf-8?B?OW8yOHJJOWFmaitHcVZJcXd6K3VmU3lMNGhzbFpCQWc3VnhjRy9OQ1U2NVMw?=
 =?utf-8?B?OXBYYjhreEsxaDN5b3JCb08rTm4xemhpQ1VlcExNYnpOVStkZFBDWU5TZ1VW?=
 =?utf-8?B?eEtYRmdsKzd2ajBldDRtUUg1TmdiUmFKL0U4OVJhckcveDJqZUNFU0ZtNEM2?=
 =?utf-8?B?WWtHUUtROHg4cVQrTU1yWUJpL3NPc0FMcWE4cFlTN2hHRUdOTFQ4dlhTWnJP?=
 =?utf-8?B?RVM0TWVITlB0R0xhYnVmT2t1eXhtN1lpWUM5M29QR1NKY2xkVkc1YkNsamoz?=
 =?utf-8?B?bkNiS1pLNnBGRm1HVTQrZXZMVlI5dU14SUxpQnpwTkQ5Z1BsalpMOVNMRWRm?=
 =?utf-8?B?dlZ3M2xuR21WaUd4b1pMcWM3VmUxNW5UaWx3WEQyUzdPaVBPbkJsR05PQS9K?=
 =?utf-8?B?VEw0R3U4bjU4WjE4c3E4amI0dzBUODNqYmg5VFh4ZFFyZHpyUjhRUUx0R1Y3?=
 =?utf-8?B?Z3ZUdVpmeStHQlNVUXgzNEJob09xeFREYlpjSmU5OEdqS2kzS3M2dmdlK2c4?=
 =?utf-8?B?TzgvbTRCYU5CMXpIRXlFS2NRVVR0U2U0dXdxdjRGbjdQY1pjMEl0VkxlVHVi?=
 =?utf-8?B?SC9uU2JweitHU29kd0VOZjlCSFVBeG9iT1ZYZ0JsaW5QL241SVU4Wk0rRXpH?=
 =?utf-8?B?SUZlcjYxdm1paUVzS0NZTUN2ZU5QVUtMbWdsV1AvRDRtRU5QQmVkTFBKZ3BV?=
 =?utf-8?B?bHdReVRWTXZwT0lrWng2cFZHSW1LcEJWMmZ6Tzg4S1d0cUZkaGs4c1RoQ1pr?=
 =?utf-8?B?SVEyeS9rdFBrMTFDSkJCbG15NFNGMjdVYWpZWEhjMms3c0VJcXptd29lRXpP?=
 =?utf-8?B?VTVsRWVGSmxOTFhqQ0w2dHhCT2RYNXlweEswUlNya1pXVittQUdTWG5BL0VP?=
 =?utf-8?B?TGtwMHNNQWUxQ0RyOVBqeFhwZTUzRzhPKzNMTG1HdlJPVHNRWWJKUzUxV05n?=
 =?utf-8?B?dmdoRVZ5SFF2NTAvOFk5T2U3MmFRanFrMnNQazNsSHFwQXN2WGRXU085SGRE?=
 =?utf-8?B?MzdvdkZnM1Q0clNjaHV1QTFUZHNqdmJ6WFNLa2d4VU84aldSY3dNa2hDdkJo?=
 =?utf-8?B?NXJ3dUcrbHcrSC9xYVVFZjVlTHJzQi84VmtQdmZuS0lHWnFEd3M1d21jOXZK?=
 =?utf-8?B?cWs4OXZYNlNjZnArbnN4T2JvdVpWZEpCbi92L2RBZzBzNDNDdzJab25kWFhI?=
 =?utf-8?B?dE5sM2s0dXA3dVFqM0pnZTl5aER6MkhqRHgyalZGa3RyQjlqQ2J5NHRjaG5U?=
 =?utf-8?B?eENtbm5ISEF5Z0N3ZWsycXBCVFJyODlBK2QwdjhBb05EZzBPbmFRaUZDWEtY?=
 =?utf-8?B?aHRkdDV4ODhaZmR5ajlIYm9SQ2RZejhYUFR5Y0ZEcGtqcTVkM2NqZXd6Kyt6?=
 =?utf-8?B?K25SUGdxQTNCbGNrK1ZmYVk0blArRFZQd2dGUkt5N2NMOWxtUEE3VkxwRmxK?=
 =?utf-8?B?ZVRKbXdYRmZMaGtuVFNDODAyVWplQ3ZBZTdGSStqZXZkMEJBWlE2Z3pBUG4x?=
 =?utf-8?B?Sk92TjJySW1BOTBXOE9IUEZNNWxpWjRjaWxhZWZDaS9KNmcrazdHR29TZEFY?=
 =?utf-8?B?MWZ4d0NHaXJjRml5N3h1NktoVy95NDcyU25aVjlHdEx0YkhxSVJTUkpEbU1F?=
 =?utf-8?B?NHlqMllCcTlsUDN2b3hYcjhpNWxHTkVMUmVZYVRrZ0ZGK21XNGxZb2YwbjdI?=
 =?utf-8?B?UjUyRCtCN0JiY1R6WHUvQ3M2S2hpMWFvNjlTUWxVUmtrNXZSRU1YV01IUlBH?=
 =?utf-8?B?Yk1MQjUyam0wZ1R1V1VwUnFpYkVaaXlhWmU1eGordDhNUlRPRWF3WEMxN2dh?=
 =?utf-8?B?U1RGalZMek9kYkNlSi85UkJ1NW1hNUl6NHNrczNvbDVFMDBtZU56ZjVYa0FQ?=
 =?utf-8?B?M29ucW1kaDZwQzd4bmRqT0p2Q2hDb3cxeFkyZ3NwUUhGaVNqN3AxanFra05T?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfb6685-0102-42cd-ae0d-08db94ed6b17
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:19:23.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l45uyRk5VD7TaUCsqY7z+wSgAEXUFAg7GSby86E5866z9XtmoXgheo/r5h8bVtNEQEen4HIfbqWa85vwiBI06g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Hi Guenter,
On 03-08-2023 04:42, Guenter Roeck wrote:
> On 8/2/23 15:40, Andi Shyti wrote:
>> Hi Badal,
>>
>> [...]
>>
>>> +struct xe_hwmon_data {
>>> +    struct device *hwmon_dev;
>>> +    struct xe_gt *gt;
>>> +    char name[12];
>>> +};
>>> +
>>> +struct xe_hwmon {
>>> +    struct xe_hwmon_data ddat;
>>> +    struct mutex hwmon_lock;
>>> +};
>>
>> why do we need two structures here? Can we merge them?
>>
> 
> A later patch adds multiple hwmon devices which makes use of it.
> I think that is flawed, and I am not inclined to accept it.
Is there any obvious reason that there shouldn't be multiple devices? In 
i915 we are doing the same. 
https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3

Regards,
Badal
> 
> Guenter
> 
>>> +static const struct hwmon_channel_info *hwmon_info[] = {
>>> +    NULL
>>> +};
>>
>> just:
>>
>>    static const struct hwmon_channel_info *hwmon_info[] = { };
>>
>> would do.
>>
>>> +static umode_t
>>> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>> +         u32 attr, int channel)
>>> +{
>>> +    struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
>>> +    int ret;
>>> +
>>> +    xe_device_mem_access_get(gt_to_xe(ddat->gt));
>>> +
>>> +    switch (type) {
>>> +    default:
>>> +        ret = 0;
>>> +        break;
>>> +    }
>>> +
>>> +    xe_device_mem_access_put(gt_to_xe(ddat->gt));
>>> +
>>> +    return ret;
>>
>> OK... we are forced to go through the switch and initialize ret.
>> Would be nicer to initialize ret to '0'... but it's not
>> important, feel free to ignore this comment if the compiler
>> doesn't complain.
>>
>>> +}
>>
>> [...]
>>
>>> +    /*  hwmon_dev points to device hwmon<i> */
>>> +    hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>>> +                             ddat,
>>> +                             &hwmon_chip_info,
>>> +                             NULL);
>>> +    if (IS_ERR(hwmon_dev)) {
>>> +        drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", 
>>> PTR_ERR(hwmon_dev));
>>
>> I think this is better:
>>
>>     drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon_dev);
>>
>>> +        xe->hwmon = NULL;
>>> +        return;
>>> +    }
>>> +
>>> +    ddat->hwmon_dev = hwmon_dev;
>>> +}
>>> +
>>> +void xe_hwmon_unregister(struct xe_device *xe)
>>> +{
>>> +    xe->hwmon = NULL;
>>
>> I think this is not necessary. Will xe check for hwmon at some
>> point?
>>
>> Andi
>>
>>> +}
> 
