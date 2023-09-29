Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B2CE743EE
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Sep 2023 06:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjI2Gh5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Sep 2023 02:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjI2Ghz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Sep 2023 02:37:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF506194
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Sep 2023 23:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695969473; x=1727505473;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q1SygcKGs49aIA16TTCTvobH8DGDakJGEjkEF8yz88w=;
  b=fK+XZz8rWon5QAjLQ5rz/eq9ilDjRi6uVepgcOEe27r0ifwsDUpD4Nx/
   ymnsxzHOLFJrJXhdOm86LR0RWJ7w5uSRQuiklLO5E3cy7bGzLzYRrEAvv
   bFyMomKtKsKbyQuS3pebDhd/+nvsmGrWfhJE1XDNWd0HHzr6t9K7F1IVy
   CBdbO9Jt6wIeiReIlHI1GtmnMMaGPbjBtOLEgUzrQ/lqDCIwM5zjNLAD7
   duxCbFP5hEOKQSMarAVIhvA9POsxgtXbI0rnUGncSh30Fy+xJsag764JN
   /6K9bM08aNKJ8+uKWyB8IW6+I+Lc2W6oFa+6gyh7k8bVzLTBFmfY3Nxwg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385062510"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="385062510"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 23:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865595140"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="865595140"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Sep 2023 23:37:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:37:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 23:37:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 23:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCP71XF2JVRpTlJpYg2e9iO1PDiVk0ZdT+bij5hrR3A0+ngH7YoM41JydLa88cXlRb48nZlUrpWMmo60ohqWApxok+js8TX5EkEjUEliy9fXhGdm3SOyaBxbP+xYCoB96cnWptvgdIUsSBPNMF7JWjjDC30kOQTKCYvh1Un6JMV+WmxoRwvN88QUWuAblWs9naYQ5Mrd8IjTIFp+NY1vIxhUA2JBe9p9FRa0SUJYizCXJ5BR4wr6VdiGoedlNSTeGqPaQrfZn+83+UHTl0XNDlpI0o/P3eRYByDYpap46FbMgxYJxfOy5Zn4Z92u3R8IlwaX8QJ5K/gGZ+u70wl0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybSRnpBji9M4zmT1yYHC0ezdanY3khwX/BqscH7N6k4=;
 b=RJRHLlG1fVWwTPNSd2kAz2U0vunU2YIgso/XH3k8QgjWRu06xVgpssyqIU7YceL4rCSewtxksLRiOWVbxreKc2OY9kuXMaSvASMOmrqG7fEneEvs1RFDXBGD+/QloWSxj3JW28WWXN0S8izX9oj1KyX0rvJNdlZ7hAfKHSjdjjdm32qhd62xgM+Vg5YmFphJfMGHgapWa3f6rknmb7dEclQUG9O3Z6ioBuCj4DTh7zIPB0Cn6BDOAzaVr81BsHwtpSyYx0EMpCxB3JRN54KdAwPokdJpMUXcJO5acD/IOHn5df1ei9qlFsI6twDQdwatn9T6aHBVrouNaHzLa668kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7460.namprd11.prod.outlook.com (2603:10b6:8:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 06:37:49 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 06:37:48 +0000
Message-ID: <c366920b-ec67-f5be-4b17-ae1be82bdae9@intel.com>
Date:   Fri, 29 Sep 2023 12:07:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 1/5] drm/xe/hwmon: Expose power attributes
Content-Language: en-US
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <linux@roeck-us.net>,
        <andi.shyti@linux.intel.com>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-2-badal.nilawar@intel.com>
 <874jjg1ak6.wl-ashutosh.dixit@intel.com>
 <84b5dc30-6b27-caf0-6535-c08f6b7e8cd0@intel.com>
 <87ttreucb0.wl-ashutosh.dixit@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87ttreucb0.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: b634fb56-db49-4c00-e043-08dbc0b6982e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DsGwpCwROnQ4qKxkvstqKRd7PQFOSvDO8v7/9aruZTBBn/PXsMiMxdO7nrmzejFRCGTY8OpL2WFC1gPkgy4yucFd4+N/ScbWS3d/1uhpDduXQciweKQOIr6xND/77VMUzpD/MYYZ0B7govS9uRaAjZF/FuJQsiBPENIQxLuRkoZeGS2xyMYRMgjZ5G8q+6zAqz/rXmr6nm5yvxLH8qPTBwJ1y8ZsY39jPeD7KERWW+hFCoUFXWzj+jxnuQUUN/2jr5IySptCcVtWglzemmdj6+BjFtVjf/hprd/+9w2dSnhHVPXiOiU5zqHti8b3++aNBnLtHEbt6c6Zk1sxYIRw47PLuv4+Fy3rn4PT/SAlkR8jp8P60m5BVzMaaCsObgl/m1xvVg11Wbnps2tW7OcEKUpmc6ir4LzjH43dZ6hPyTWI4yQ+/DNKa8Y5II6q0BZWlzJEVj8MUvcyeU6bg3eUmXC9IXMUnJEOGNd2qfsT6AKMBRTKqC4SGO6He661bHGot8z7c/w6cQTvde0B90zt2XOnNk08axmNmDmnNQKp/EfzAj7KMA/y+R1ji2wIGkAdO5qY+4uZOkLRpKAGQj99BqX46+h5xaBrpAhIEgZztdEMMpI9SMf6W+9/eRIIWKDiyuTEJLQLpHV3soz0WXDh0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(31686004)(6512007)(6506007)(6486002)(2616005)(53546011)(86362001)(31696002)(36756003)(38100700002)(82960400001)(26005)(2906002)(6666004)(478600001)(83380400001)(316002)(6862004)(8936002)(37006003)(66556008)(8676002)(4326008)(41300700001)(66476007)(5660300002)(6636002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2x6NW9FQzJ0eFplMUg1ODVzcGk1WlgvMTNORG1NM2RMQWpzRW5uK01uZTdJ?=
 =?utf-8?B?bVZ5TXY1c3JlQWtpNStjb2hSZDc3K0xZRGsvZXdWdXowMlMyZXVacVZ3VEw5?=
 =?utf-8?B?NmpaVlBXbUk3MEIvQmJ3VExaSjJvZkJPWkxZanIyR2JMSWhNSnYrd0h1T3dD?=
 =?utf-8?B?Y1VJRkdKOUNiSnBwREFXMXRkSUpEeUlJbFZ2b2x5NkVtTzZuYTNkQVliUFZ6?=
 =?utf-8?B?VXYyZHA1SDZpdDlva3BERlNidVdXSEVZZnFSMzR0YnNsNmd4b3kwMWthdWlS?=
 =?utf-8?B?NHlPS0Jlb0RoRDFyNFgwREJtUDNOTVBXbmhsUjBnSEJ5eWs5dkUvaEJEdVBO?=
 =?utf-8?B?TkhUQjRGM2hMR0JPSGNvU00xVFBkVjlaL1VzQ0R4RnZRS3hwQVAxM0ZWYnRl?=
 =?utf-8?B?SkZQeEJ4MmRqUVU2VzgwK1BDMytqUmNjajNvM2lSclQ5YTJpSUxsajFQaXRD?=
 =?utf-8?B?d1ZCYWh0NEtCSmQxRTJ1d0JZU1UzRFVYYUlCZUxkNEd3eitJeURBTjh0ckF2?=
 =?utf-8?B?M1dJNnB1UUF3M2FSa2ZoaFQ1NlI1aEFUWlFSOEcyUTNTWkY1eGQ2aEJhK2Ry?=
 =?utf-8?B?MHRyWXdJeElkSXJCS1VaRHlIdW54TzRTS1pLQ2g2RzB0cFpjcHY0UXBNRk53?=
 =?utf-8?B?YVZqS29oQWVMOFl4QVQ5TzV4WExvdjFSVmtzTDRCS2xDTllXSjJ0amZUeEt3?=
 =?utf-8?B?cHhMNWVITkF1UEFsZzM5SXpjWWExZWUvM0pDRGVlTXRvenBVQ0YySFdHT0J1?=
 =?utf-8?B?N3Rxa0R0V21aa3d3T3hNdTBnV2dxRUZjaThQSC84eUlMZ2twbTRmTG1OU3lS?=
 =?utf-8?B?eTBCQmNDWm0zWitWWC83U2tXTVZsT3RLUE1kc3RLTmlkS2tnYzRQSHArVkF0?=
 =?utf-8?B?R3h6UXcrRTVPZFdaME1LeVlmbEhIdTdXek5sT0tkQk1TbTZqVWxsMG41UUNZ?=
 =?utf-8?B?c0RieDdRK1FiY0F2NjNFblI1aHY2TUxzSEl6WEc5M0JEck9lMFJpdlMyazc0?=
 =?utf-8?B?bSs5KzlpTzRwNkFma3psUmFIZVJKOTREaE9LWUlZRnR6TXRCMTVaZmgvc3pB?=
 =?utf-8?B?YWdMUVZJSXd4MFlSWW1OOWQza1FUZFZkQlduMkNsSXRhSHh6eE1PYmR3UkNz?=
 =?utf-8?B?d2t1b0FpQ0plcGxIWVVrbU5MT3ZrRHdoUm4wTkMvU2ZZRFhKUHlrWCtzbk9n?=
 =?utf-8?B?TEczcFptVGcwblRaT21NZVRFSFE5elZHVEFXZHhxVUZndjlyWThIOFpCU29h?=
 =?utf-8?B?MENSOEVLVExScERaK3plOG9DTWNMTWx3ejkvY09xVFRReXBiV2NHc2g5Y3ZH?=
 =?utf-8?B?c3Y1Vi9XWUlLU2JlcmtyVldndU8rTTZhVWlENktCL0l4UkxLMkVBWnNSYm9P?=
 =?utf-8?B?cUxWcmdyVnJGSkhjTDlseVJJVUZNcVlydmZ5cFp4dWJiclpiR3Q0TjQzMTN4?=
 =?utf-8?B?b1NmWE5mQlVEcGo4dVY3UW4rN0VHdTIzREVTMlcvdUtNZDlHaWJWSVRpZ0Nx?=
 =?utf-8?B?a0xwcHFhTEthNklKcEhjYll1MEFPZFMrVHF1azRQQXJoSndwNHBzR1NJQXJ6?=
 =?utf-8?B?cVZYR3pFWC85QVBSU3p1aGMvTmZtOURxYnR3WWd4OGFGNkVOUzJrVDJhVFAr?=
 =?utf-8?B?QmpmOXo2NEFJenR0QkcyZFJnbWhZSHcyeHFLNkxONzBESXhtOVl0Ui8wamNl?=
 =?utf-8?B?U0ZrR05raTUyTEV5YnFHR2FjVTBSd0kzdHVnMmJVeitONktDRFlOcmJpZmpl?=
 =?utf-8?B?NDBBcmhHWEZTcWlJekRSOEtiU2F0djNBZTV4Y0xkandKaFBzcnRvSzdTeWxx?=
 =?utf-8?B?MmFvUUR6UlA0NlAxd0dCN1NsYW5SRnFlbk1iN010WU1aRW9sVUc1OW5CNmxC?=
 =?utf-8?B?aVlrM0Q0ZUlteDNva3JRR2xpdk9WOHIwMFJrU0tVb0VUbXR6QnErTEhZaFNF?=
 =?utf-8?B?ODhNam5Vd3JsWnRGbWthRHZhb0cvaHlyQWhRN2tockkya0pwdVYwUUpBVHBV?=
 =?utf-8?B?bWthUU5nZjlnV3Rld1p3MnVkTWlpR0FESEpHeDVGbExjdnBOaU9sN3BkWXdX?=
 =?utf-8?B?UzgyYmpxL0FrME44OHQ0ZDRtb3NJelFpcEFlR2dkcDg2MGMrTkFwd3hLNnpE?=
 =?utf-8?B?Z0VRQk1xNWxFK1dwTm41cXlhcnAweEE1elY2TDRVbGNETWErNmIxdDZHU1pL?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b634fb56-db49-4c00-e043-08dbc0b6982e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 06:37:47.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTbcBHFs9A40K8T1V9SBzk976qXSWgwIG8D6ITY0oaEF/D1C4O9GcMwOOhl5BS4ad4VZKsxIcZiFk2/VM7FQ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7460
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 28-09-2023 10:25, Dixit, Ashutosh wrote:
> On Wed, 27 Sep 2023 01:39:46 -0700, Nilawar, Badal wrote:
>>
> 
> Hi Badal,
> 
>> On 27-09-2023 10:23, Dixit, Ashutosh wrote:
>>> On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
>>>>
>>>> +static umode_t
>>>> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>>> +		    u32 attr, int channel)
>>>> +{
>>>> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
>>>> +	int ret;
>>>> +
>>>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>
>>> Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
>>> is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
>>> doesn't read/write registers.
>> Agreed, but visible function is called only once while registering hwmon
>> interface, which happen during driver probe. During driver probe device
>> will be in resumed state. So no harm in keeping
>> xe_device_mem_access_get/put in visible function.
> 
> To me it doesn't make any sense to keep xe_device_mem_access_get/put
> anywhere except in xe_hwmon_process_reg where the HW access actually
> happens. We can eliminate xe_device_mem_access_get/put's all over the place
> if we do it. Isn't it?
Agreed, thought process here suggest that take rpm wakeref at lowest 
possible level. I already tried this in rfc series and in some extent in 
rev2. There is problem with this approach. See my comments below.
> 
> The only restriction I have heard of (though not sure why) is that
> xe_device_mem_access_get/put should not be called under lock. Though I am
> not sure it is for spinlock or also mutex. So as we were saying the locking
> will also need to move to xe_hwmon_process_reg.
Yes from rev2 comments its dangerous to take mutex before 
xe_device_mem_access_get/put. With code for "PL1 disable/restore during 
resume" I saw deadlock. Scenario was power1_max write -> mutex lock -> 
rpm resume -> disable pl1 -> mutex lock (dead lock here).
> 
> So:
> 
> xe_hwmon_process_reg()
> {
> 	xe_device_mem_access_get
> 	mutex_lock
> 	...
> 	mutex_unlock
> 	xe_device_mem_access_put
> }
> 
> So once again if this is not possible for some reason let's figure out why.
There are two problems with this approach.

Problem 1: If you see implementation of xe_hwmon_power_max_write, reg 
access is happening 3 times, so there will be 3 rpm suspend/resume 
cycles. I was observing the same with rfc implementation. So in 
subsequent series xe_device_mem_access_put/get is moved to top level 
functions i.e. hwmon hooks.

Problem 2: If locking moved inside xe_hwmon_process_reg then between two 
subsequent reg accesses it will open small window during which race can 
happen.
As Anshuman suggested in other thread for read are sequential and 
protected by sysfs layer. So lets apply locking only for RW attributes.


+static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
+{
+	u32 reg_val;
+
+	/* Disable PL1 limit and verify, as limit cannot be disabled on all 
platforms */
+	if (value == PL1_DISABLE) {
+		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
+				     PKG_PWR_LIM_1_EN, 0);
+		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
+				     PKG_PWR_LIM_1_EN, 0);
+
+		if (reg_val & PKG_PWR_LIM_1_EN)
+			return -EOPNOTSUPP;
+	}
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, 
SF_POWER);
+	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
+			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
+
+	return 0;
+}

Regards,
Badal
> 
>>>
>>> Also do we need to take forcewake? i915 had forcewake table so it would
>>> take forcewake automatically but XE doesn't do that.
>> Hwmon regs doesn't fall under GT domain so doesn't need forcewake.
> 
> OK, great.
> 
> Thanks.
> --
> Ashutosh
