Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0440E7B5E5
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Oct 2023 10:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjJDKSt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Oct 2023 06:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242099AbjJDKSs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Oct 2023 06:18:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEA4AC
        for <linux-hwmon@vger.kernel.org>; Wed,  4 Oct 2023 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696414724; x=1727950724;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=04zcUGE7Ae0FRPOoHr0sZRCOVkovzWSX6UkkfocUAyk=;
  b=Z2KH5b4WcQH7zdgvfiL52EWBn0PDpv9lLKrFc68NxGam/ODpy78ZcbxR
   TszW6U3OVnaty/P078vh+9TN6iS/KXPXvXcMaX/4Um0PbHWYUqjggM6Di
   Db69Af1LuHjXgnQI/P/rvPdZ7t7aOduztoi+YbE2C8FEj6IE8VILlEOTp
   em/yX96h4uabeJo/jG2MOQqoleGdITugx8lCagPTsjCOV+M/83fSRYhqD
   64YpTnn+e/RBJf0/vdeEs2CX7PursECFhQhamOKvmQCAf/ztTA5JqMDNh
   Htm2d/5xOIrcSrMEWbAbSi289DGUtst3xU/SR55uiVHbFlbVeOCyzMdRj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368182540"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="368182540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 03:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="925063682"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="925063682"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2023 03:18:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 03:18:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 03:18:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 03:18:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 03:18:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfH7rqo46l95s5vsTDYfI02NdhnyCQGp0UB8z192ydMb2yLa5BAODXu3P2MwcnV5YUTqHpza46BJaiWcoPqplB8wgp091LsYudBNUPwhZJsLhwElWJnD3RTyBDvVBEDkTxKbWfXUWIs+evSgMkWonVmHHUtaEB+c5OATfmfN5cCkOksbiaS1eUH/jNW6HfDX/MWm9ZvcLXex7+uBnzKStARdVr326BSsx0epANuZXQpX5TxL5vKWIBHI1bebKV+BDPCClFItThXgdGd4SKTr8e8x+gxe16Vam+Ru/JaajcDgCC0zy4XGic8nB2NG1hi1bRJdXi9THApXWeOBwHuuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E04LwhsozkTKkVDjZqLUjKPrrNWhVGjEtqnwDWGz0Ts=;
 b=S3l7AgUZ5T9tby1aoskgWZo0niE4Oc3ZpnpVvqECykaZFiDd0WDrE5ijC3NKltySwKlq3m3T2h6qfda1wvGcgxMrDEuTZRCCA5N6hRkuEe0vULZ8SE6SuLDZPINGkCr/tQfIAzpBWNVahsiVMicZUKsV7SZKgQVQUaeAB41bodH0eTv/39jlasDc8nFazsYH94LS0Dz/AC3QedxQHbUy0YheCtykLz3o5u0zd1jjZ7NBNdqhZzbkHScF1vLP2oc36Uj2Xs2+ZQLkMLPIAU2ZyMQzX1zo1n6cbMMaR8R2/XHsvKacnrPI+oKBEfx4fhhtH1q4GTahXzWzmNz6q461vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Wed, 4 Oct
 2023 10:18:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 10:18:41 +0000
Message-ID: <cbf18908-ee1b-16f9-4375-6fc6e82cfcdf@intel.com>
Date:   Wed, 4 Oct 2023 15:48:30 +0530
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
 <c366920b-ec67-f5be-4b17-ae1be82bdae9@intel.com>
 <87r0mhncwr.wl-ashutosh.dixit@intel.com>
 <87pm20odx9.wl-ashutosh.dixit@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87pm20odx9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM6PR11MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: e601c6d0-3e12-4fb5-58d0-08dbc4c347ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qAAwct1n6OQpAribbkX6EE3LKqbrtzC8kRSNQoVAHDY7wt8kgC4u1V+FrvAAg2Wjh9RkXY9idgrwmuLnNQyoA5Ir7l1gUKmgBas8hZOtUXQTVpAWhqoRFoO0U/vUWjPO+SB8pCFvM+kCUDeUAUKqOMm9BhG1H242RNtXiFZKFUm1GqYOKqEIjz2N2ZMizCY7TxpH7XK7wCcX51/sR0fY+oeqoaK+zz8OAdrUHmdp8jukHi6CX24gKIHZuoK8W2aYghwwCHo0KRyTip0CyGVWjXAYssC2h3jPnZPmLvwCOiC8pE0pwq7PiiuPjyluPiVF0Ybg7f6NSrr8vpf8H8kduyEGhLUV1ExQMrljJ2Vwhhr24unScmPPNFex9eKs3b31h2Y7/Ttpub8L+Cz++Wxp3Inxm9eBajBG+sZFCs5ykRRyAEfn/b76Z2nT1HABmAcrIsMYd61piVXu6j62EITl8S0t7vinnPLnCdKkLI+X4/7Vt1fJkeJ21VfF2ORC2ZV4aNRywM6V2SNXFKOQzQopEsL6xuzjqzRGjUOiU9AKSTGfzL/u+2WyhCKy95ew72jMPBDu7tvk1EFmpgcfMfzXWFMcGJ+8yjuTVPikk3o22xYuTmRvyNFqA58mEbRoOVwaOhHCHr2FEOuqFmNtGqc2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(53546011)(2616005)(26005)(6666004)(6506007)(6486002)(83380400001)(6512007)(4326008)(2906002)(8676002)(66556008)(6862004)(6636002)(8936002)(66476007)(66946007)(316002)(5660300002)(37006003)(41300700001)(478600001)(36756003)(86362001)(31696002)(38100700002)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHBXdkt1S1loN1hGc1U2bEhPdVkrbTlhcW4vcVJQTUprTStsUUR2Unhydmx3?=
 =?utf-8?B?YWtOSXF1aldRSWVzMlo0alR6TmlLUlYzTUVTSittZklsWGFnUjF6RENYRmxK?=
 =?utf-8?B?dGE2OTZ0RWtybWc5bmIyUi9kQWRmTzhha3JuL09OakMxOTFkYzZ3bTBDelpX?=
 =?utf-8?B?L2tsa21WcWV1ZVFMWVdsNkdjOFFneWliSUZxcFJCWHRGNjBiTHk0UjJYK3pX?=
 =?utf-8?B?b3BiMUl0ZmZabUl3dVM3MUdUYmFJV0pUTjFuSFlPNytEZjRMR3dCZWZCcjJH?=
 =?utf-8?B?NlloaVc2OUdiLzZkVnVYQTZkQ3VlSTNqc0hOeWxXZkFwSjdSMEErYzlHK0sv?=
 =?utf-8?B?RHV4RkMvVE9ucnBKeVVFSTFucWIrV3lEZUNRZ1EzMzI5ODdBWWx1dnBsRFVM?=
 =?utf-8?B?eUFveFJVTGxJLytaMCtVYnMvOURlQlhNVndsQjNiczFMamF2NTJVejVQQW1I?=
 =?utf-8?B?Vzd1MU55NW1BVUlGVDZWRmFWZk5GY3JtVktlUklvck5ZWDNrVEdHdEtrRi9p?=
 =?utf-8?B?cTdoOTNISlcxMFFpT1FOL2JvUzJoVW55YmZkVW1vYUxKZUd2ZlZuVzJNelND?=
 =?utf-8?B?bndBbW5HUGpVR2NodmZzWGlkWnpETEQrVFpydmVENlgrdWR6aUdUSDVwbWZV?=
 =?utf-8?B?bE16bWRsbkRKTW5PVGV2WEZpN0dEdHd3WFJnRWpBZURGUVk1TlFVODJOVWFr?=
 =?utf-8?B?WSt3cEI3MFlsQ2JqRDNraFNkZm93VytwMWhjY0tLZTdhajB1eHVWYm9BUTlB?=
 =?utf-8?B?Z0h3cTRqZzBaRzZ2QkpiZDBwRm9GZ0VHdUJhTC9Mazd4bWZ6TWk5anFMaktW?=
 =?utf-8?B?UXBZTUw2VExEeFR0bWtONE1FRTZlOGFOU01yeWNDQUYzQXJqSXoyU0xuKzZO?=
 =?utf-8?B?VXlDU0VJZWd3WENnbEtEcXVLZi9mNHJjaFFpaTNHYkpjL2JVRUNGM0RFTzBs?=
 =?utf-8?B?WFFOM3E3clNMazk2ay9wclZvNDlyYkdKZmFnT0FERjdXQ1c1dVR4cW5CZ3RW?=
 =?utf-8?B?VlZsRyt1TFREbjZBblE1dDU0UGtBK2hIM2pOT2VBY3VicFkzNDZ0OVJBeFJl?=
 =?utf-8?B?S09Ic2FyZ2hESmY0RTNzc1lJdVZxUXdETnpleld4eHNwUFVEcnd3SkJiVW1U?=
 =?utf-8?B?WnZPeW1lYmZuMm5pT204Tmp4WEFtT0tDZHFaV01LRGdxNmY4a2tPaFNpbE93?=
 =?utf-8?B?WTEwYWRsUUlLMGFoeXExQTQzcnR2YU1Pd2ZwUkRWWVF2cmdxS1ZoYmZEM1lR?=
 =?utf-8?B?aVRrNlg2d3U4aDVxaEYyaGZXSFluMmVFdUtkM3BNRmhPT0h1V3Nuako5dHhk?=
 =?utf-8?B?WWJHeVp1QXBvR0VXRTRjNjQxcWREZmU3eTJUQnpBKzdVVkdUSGpMWHQ3cVBU?=
 =?utf-8?B?K3lZajAybDNxU20vNXBvOXNQNE43YlV0dFJEenZ1RWpVT1pYblprK21kYzk1?=
 =?utf-8?B?QUQvTDBaMmhIQ01wUzdCS0I5QVpWUlRYdm1kWVZadUpSVGtpRDFxYjd0Zkp3?=
 =?utf-8?B?R3Zhak83Rnk4MVQvMnZ6cXMrRnp3d1pGQzZLbFVtNFBZUGdSV3dZVGdtY0JR?=
 =?utf-8?B?WUkyek9GeTc0czl0WDNYYXpVeXl1TVg5Q2ZmcVF5R01wcU9QSE5DdU9FcmNU?=
 =?utf-8?B?Y1RJMlZWaHNOanMzTjg0MStUbS95ZFZ1LzM2ZnIxSEFnN0tGK2tjOXI5Rndq?=
 =?utf-8?B?aGpTbVJ0WkI3NW80eGJZV25JcXhTTC9jQTJyWWhsKzFqVGU4WVZ6TndzdmRH?=
 =?utf-8?B?VC9PckdUTE50VjFEWFMxNm42MEp5NGZTd013akZqSEVCdlZOQnA0UGY2b2dP?=
 =?utf-8?B?MVMxbmhLZU0zVTVaR3gwOTBZNnZNMW8rNUluZUtjTFZJL1g4RGZTOTNuRm9N?=
 =?utf-8?B?UDNSK1pRcHFMZ2QyczZ4UW5JcWxtaXY0amJ6eVZrQjRTbEFONkNoSHErMlhW?=
 =?utf-8?B?Y2x1N092dml0MWRUcnhXdlYwL0lRYk83aGh0MktFMXhObGRBcmNzdlZXVTln?=
 =?utf-8?B?RWp3S3lrNEVNY1J2S3VXcjUrb3ZIci9JdVFVWGJ1VVNHWmZYOTJ1bmJ4TUlS?=
 =?utf-8?B?bkxxaUc4YkFRUC85ajN4YVZUVWZSaWVNMnlacHNDaUtqSEhWbzVwWEt3bU96?=
 =?utf-8?B?czAvNUVFYi9vVElwaDFORlZacXE2Z1hOSU8vRndYUVNMMlhhNWJuU29DOGZI?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e601c6d0-3e12-4fb5-58d0-08dbc4c347ad
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 10:18:41.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1MWvnHkylb+poFoJ47kYU0hfRuoE6/MCoMWpNb/wvG+6k9FwSt8VkJCBv2EuiY5tcVpEjtPqQIN9vAv/D/p0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Ashutosh,

On 30-09-2023 03:11, Dixit, Ashutosh wrote:
> On Fri, 29 Sep 2023 09:48:36 -0700, Dixit, Ashutosh wrote:
>>
> 
> Hi Badal,
> 
>> On Thu, 28 Sep 2023 23:37:35 -0700, Nilawar, Badal wrote:
>>>
>>> On 28-09-2023 10:25, Dixit, Ashutosh wrote:
>>>> On Wed, 27 Sep 2023 01:39:46 -0700, Nilawar, Badal wrote:
>>>>
>>>>> On 27-09-2023 10:23, Dixit, Ashutosh wrote:
>>>>>> On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
>>>>>>>
>>>>>>> +static umode_t
>>>>>>> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>>>>>> +		    u32 attr, int channel)
>>>>>>> +{
>>>>>>> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>>>>
>>>>>> Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
>>>>>> is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
>>>>>> doesn't read/write registers.
>>>>> Agreed, but visible function is called only once while registering hwmon
>>>>> interface, which happen during driver probe. During driver probe device
>>>>> will be in resumed state. So no harm in keeping
>>>>> xe_device_mem_access_get/put in visible function.
>>>>
>>>> To me it doesn't make any sense to keep xe_device_mem_access_get/put
>>>> anywhere except in xe_hwmon_process_reg where the HW access actually
>>>> happens. We can eliminate xe_device_mem_access_get/put's all over the place
>>>> if we do it. Isn't it?
>>> Agreed, thought process here suggest that take rpm wakeref at lowest
>>> possible level. I already tried this in rfc series and in some extent in
>>> rev2. There is problem with this approach. See my comments below.
>>>>
>>>> The only restriction I have heard of (though not sure why) is that
>>>> xe_device_mem_access_get/put should not be called under lock>. Though I am
>>>> not sure it is for spinlock or also mutex. So as we were saying the locking
>>>> will also need to move to xe_hwmon_process_reg.
>>> Yes from rev2 comments its dangerous to take mutex before
>>> xe_device_mem_access_get/put. With code for "PL1 disable/restore during
>>> resume" I saw deadlock. Scenario was power1_max write -> mutex lock -> rpm
>>> resume -> disable pl1 -> mutex lock (dead lock here).
>>
>> But this is already the wrong order as mentioned below. If we follow the
>> below order do we still see deadlock?
>>
>>>>
>>>> So:
>>>>
>>>> xe_hwmon_process_reg()
>>>> {
>>>> 	xe_device_mem_access_get
>>>> 	mutex_lock
>>>> 	...
>>>> 	mutex_unlock
>>>> 	xe_device_mem_access_put
>>>> }
>>>>
>>>> So once again if this is not possible for some reason let's figure out why.
>>> There are two problems with this approach.
>>>
>>> Problem 1: If you see implementation of xe_hwmon_power_max_write, reg
>>> access is happening 3 times, so there will be 3 rpm suspend/resume
>>> cycles. I was observing the same with rfc implementation. So in subsequent
>>> series xe_device_mem_access_put/get is moved to top level functions
>>> i.e. hwmon hooks.
>>
>> This is not exactly correct because there is also a 1 second autosuspend
>> delay which will prevent such rpm suspend/resume cycles:
>>
>> xe_pm_runtime_init:
>> 	pm_runtime_set_autosuspend_delay(dev, 1000);
>>
rpm auto suspend delay can be 0 as well, IGT does set it to 0. In that 
case there will be rpm cycle for every register access. So it better to 
keep xe_device_mem_access_get/put at attribute level i.e. in hwmon hooks.
>>
>>>
>>> Problem 2: If locking moved inside xe_hwmon_process_reg then between two
>>> subsequent reg accesses it will open small window during which race can
>>> happen.
>>> As Anshuman suggested in other thread for read are sequential and protected
>>> by sysfs layer. So lets apply locking only for RW attributes.
>>
>> But what is the locking trying to protect? As far as I understand it is
>> just the registers which have to be atomically modified/read. So it seems
>> sufficient to just protect the register accesses with the lock.
>>
>> So I am still not convinced.
In i915 initially rmw accesses were protected with lock but later with 
addition of PL1 disable (during resume) logic in some extent locking got 
extended to attribute level.

Another scenario where locking is needed is for rw attributes where 
write and read can happen from different threads.

For readonly attributes as per this 
(https://elixir.bootlin.com/linux/latest/source/fs/seq_file.c) locking 
is not needed.

I think lets apply locking at attribute level.
> 
> Let's figure out the locking first depending on what needs to be protected
> (just registers or other data too). And then we can see where to put the
> xe_device_mem_access_get/put's (following the rule that
> xe_device_mem_access_get/put's should not be called under lock).


Regards,
Badal
> 
> Thanks.
> --
> Ashutosh
