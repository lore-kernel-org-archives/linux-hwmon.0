Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D8DC001DF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 13:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjHDN11 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 09:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjHDN1E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 09:27:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A6549FF
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691155606; x=1722691606;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KM94gPZ3A5HU96oZ+zixdbSR/GcJz4X+y1IdDvwA9Zg=;
  b=A6OmvKaiNZCYPp5j/6MvjHDpRln5i2GU+ym5TDOcd9SnpHD3xDw6lFPv
   snpqgf9uCJE4qfvVcWEs0mGvMAD92tAxNdpCA8+xeZc5nQVURoojUpIcC
   Q3pyPZ/vfE5ffV9XzKaZw5QdDAohrWS5dkhaX/ue4OVwDtqxoCfO1nfY5
   mUnX9SBME3bQ+1q8h61TvrtzmuxLeLeNqGISEplSJEkw8ebgTPBhAHWoI
   23U/i1tbPzQVq/NDvJifGinyTmt6vxkawvsWYXSvxHy8vqAYVZ1E7zX0r
   Zkg8huCkv3lyUPQYOq/zE73giFaAOiQ3bPO5g28jdcK/o7nlpnggMMxat
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350458097"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="350458097"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976590121"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="976590121"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2023 06:25:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:25:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 06:25:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 06:25:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDEeSint5b2u0ygEon/lLguSVbn6149EQIAWJHcQKIwxujf8T+BkgkfWSYjF5v8x57n1wDKcdY0Wt6lIaWBiV75+UIFLohKQUeGLlX7zNkHGRPm6kdyUYUnhG5ammdUCoFWK0bda1A3cpQJs0v3LWP9r+iSH6MDIpBXdAQ7FOyqJEv6F30aco6FbD9yh9tB+VAwcUcWlxOPq1ox1cemPd4iDvAk25pv1ATuQNqwFBbqnf0flrQTVUF1ehXV+2F1WWk0uvouLSqGmYtdZiPhTtIkPOGqWhQMLtwW2w4KVof5MPhOnHUNcwQI8koTVYJ7JyHD48DdX7WCx8pTtRDpXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGjM0E3cSsVG0HJ+lps8GFk799rVSmOmfvITBQMaDwQ=;
 b=E4i6CR2VoY/AtPOfmAMYWsR5d5xB1BhGHV3S8yFAUpB+4Way4KHyCIx+H31q4kUg3aWJQvcSPMllBGRM0ZTbOjG0+25jrwVa1fKMZABYmrFK6Cj+otNO1WzmailFI5DnNXloSc4a5TfhAAPg7/LMsjRYHrtgTNCo4yN54W4BbS4erOgHTMRYI4GtbYgcxU9+2p5DmMq6RFPApbCbiCM0vU+JsF1uXQ6tmz34sy9I9CHpIyFEylNsBIqaXP5fftcQtu+bi7BuCPGwUHUlqZkAOMqmO9jAudhO2h8/mpCxtoLMzkAOPocdFiP4AhdUK55YiN1roNa1W9NtfvCWc6cGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:25:55 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 13:25:55 +0000
Message-ID: <3e294a80-3fde-13bb-4cd0-e5d19fca65b4@intel.com>
Date:   Fri, 4 Aug 2023 18:55:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::21) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 25dff2b6-0f51-45db-df39-08db94ee54c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZVhswnWFEiZt4PMxzvKYzokQY0PbNRSArNGTRW/Ik40phz5YbDXMAxHzJC0n8Izw04U6fwwZPMcUVQlsRyMFfO0UU5FG/kLDMI4Gve69vtTsNnFkleyLAQmLaJIzI6QkwvsNV5w9fgxZgl1WqzJV/YqqrdpLQgTwLNvf1KgBpstS/K4XjLZuOABqavD85gtg5zT2eQdG64Pd7ocln7FvFZNfX2x14mLJMdAHgubzUK1Og3wO2eCxExZx+mZkHmjNbOce+aGKTXSszZ574+uJ9bpmnxs5n0tG++byTiMyGyN7qj3ILX1ex1HSidOwCYF2GiRRL1oCdh8EuSiZqIyuydQGPN2Z8jQWZDSVp9n2I8cc8+coq4FwSwI96vd8rQ6C+hGZjmVX5Tv2ZAp50wEjfSdlPNClz17c2RByEMW6yood6UWZJfv4w8NV20q+/9wZ+yZ4xHhd5wO0VXtOgGMveJvHHfHCUcZCSxa9x5XG6RieCZTh4bchEWqnyBumGPRojiGvp5RtYV0hkRizpP69gl15Q2VvMjoYgzEdixm+xkr64wUva71it30hmZE0BRjbmwu1M1nUHIs9N6PrOeTK/3xTXN+DGCnvLLDU3BBMrX+Xux2flejWE+sAzEtETW4QPyjW8B/bs7nAjjfNHoccA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(186006)(1800799003)(6666004)(6486002)(6512007)(86362001)(31696002)(6506007)(26005)(36756003)(2616005)(53546011)(83380400001)(38100700002)(82960400001)(5660300002)(41300700001)(8936002)(8676002)(31686004)(4326008)(6916009)(2906002)(66556008)(66476007)(66946007)(316002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFRrZzVBN3ZuTUdYTVFTSnAxeFRjWU1yRmttYi9vMU5WNDFrNHNQeXliV2NN?=
 =?utf-8?B?OForaDkzK0Nac3BTdWVheDNOQUtCbEFDL1c2K0gyRE5iT3Q5NFNhU09URWNH?=
 =?utf-8?B?NVI4WmdaTEhUZE5GUmo5TzY2Vm81VkQ0cXhTSVpPSHhMdzBoL0wwVFM4Q3Rw?=
 =?utf-8?B?cEcxWmdTZzZNTGZWTzdFN1NlMTA1dzhMSkxuYWtDWlNUTGV4ZGJ3QkNrcDNW?=
 =?utf-8?B?MUNDWUFVQXVYdXBtdFFJbVpsbnd2YkozNjZjaVp5SVR3K2NBS0IrUUxRZWZH?=
 =?utf-8?B?S0tWMzM0UzJuWHkzMEkvaXg4TmI2WGU4RnFNdCtocGNyZFhpYndXU3p4Ly9u?=
 =?utf-8?B?VGZHZi9icXVFL09tdnBXTVF2cG9ZbkFiSVRqOERscmYrQWEyMmZsbnFVSDN5?=
 =?utf-8?B?dmM4N1dDNnVWWHlGRjdFOENNQm9lcFloSS9tRUQwclNTM3VJdlRxVzZCY2R3?=
 =?utf-8?B?QXpWNk9iT1dwbVZrMU5kckVpbitRTFhoaU9NOFh0czljWkROL3FKK0FFUXFD?=
 =?utf-8?B?TWZoNmYzKzNxbTRtSy9tTDRrMDBqWkhSUGNOdzVYZUdJeWxPeDBlSXFldFlK?=
 =?utf-8?B?NHRvRG5yRFQwanBIMW41dTIyRHRwaDZQeDNPUVFLZmxsR2NYZExtV211cmFT?=
 =?utf-8?B?dEpGQkVCOEF6NTVFZ1VkaE1oZEVuUFppMG5QR2FjT2ZYY0NUUTRpemVyRWto?=
 =?utf-8?B?dkFHeU1sS25MRkJXeldZSG5XMzVSZmpDcXliV1JkTnpwRUo2ZU9ubUJnV2cx?=
 =?utf-8?B?S2crRGZVWS8wT2F5bDZhaThvUndqRkZnMFd3cFg3cFBaTlFpd29QK0dLYTV3?=
 =?utf-8?B?a1cxUTkzZS9odU5ycGhyWjhnQ2F1VVV5UGhPWDlFOVFNLzJmVUtsUUhkckQz?=
 =?utf-8?B?WnFMYmd1RzVlaDk3ajVjTUx3blRUeU9xU2g4NEN3VlNqWS9IdVRaaitFUnZ1?=
 =?utf-8?B?VEJmdGxRK3VTQm9GbnM4TFlLQlBUcnVwRzVOOC9pNXRvVGM5WkR3dXZ2aG1O?=
 =?utf-8?B?OThUK1dZZXA3UTlhNDRZK2F1UkY0dlZOdmIzUTl3UUV4UnFmcy9uUEdGQ0k0?=
 =?utf-8?B?Y0NDbjFZREdOR04yei9VTXgyYXVTeVArSFQ3dnIvazZEZzVmbmFtNnRyK0JH?=
 =?utf-8?B?T2tjUnprN3ZOa2ZyT2ZEUU9iSmhKdjNTakFRanAzT3dTelptTFVzV01PNC9i?=
 =?utf-8?B?R2dZTExvbXpSUXN4MUZpenFPSUhIYXIvSVRhVFVBd0tMOWJzQ2tNK0hUYmMz?=
 =?utf-8?B?UVNLbXZqbFJZb0N1MzlGT25oUWVWNTg4NzFjL1J1Rk5NVXJMcWMvUExTZ1Nx?=
 =?utf-8?B?aCtBSG5XbGpZd25Vb2JzbTl5UDVxMW4rNXhrZDI0bHpsVnFxUmZINnc0UXhk?=
 =?utf-8?B?K1R4QjV6R1p3Z080R3VXWFJoV3RxaVVmSC9VVFdhQVB6Ymt2TFBsMGUyRmhB?=
 =?utf-8?B?SFRINFpZOXF1dUhrVG1mcEVqaS9xQmtMaW93WWxkakhQYnhMeStlWnVZNmJF?=
 =?utf-8?B?bHdmVzNQUG1MNyswS3JDdGNkTkoxd2xMbi9jTlBIL0JpRFdzeFFCNEtqS2RK?=
 =?utf-8?B?cCtNakFPUnl0OUo5RGx5emU1NDUzc04xc2FWUHM2WVJ6c1F6T1BMQlUzNDVP?=
 =?utf-8?B?b2tSTEVXSmpCNVVwV0svVVhYWGVrckw2M1czQTEzREJKTUhhay9BdVNKS3hR?=
 =?utf-8?B?VnVrOG1seVp1bENiaGxBRGFlWFRuNGsvcWYxb3NZSkpTRUZ6cTlhWTA1V2xk?=
 =?utf-8?B?SWt4eCtmZW53YUpBUCtFVFF1ZU9ZRC9kU0k5S3pjNkxOQk8zRXJTbmpyZFB1?=
 =?utf-8?B?TnFKNGVjTzJTWThVcnBsS3o2TGpWb0pHMEIvOXkzc1FqdTNYSERtU0pLbHV3?=
 =?utf-8?B?V0xXajduanhOdGY1d2hObVEyMXNXcmsrN3VSbVVEUUtnOEJvb0pjZVVrMy84?=
 =?utf-8?B?OGNiN3dnMHBhQjZpdDI2VnpLZDkvcnNua2xoQnRXbytKUmdYSWRVU0RTZnhH?=
 =?utf-8?B?eWdkcUxhU1BKcDB4SGxDMmZ0ZEFieGRKekZ4S1RRdEtUdFdNb2JwY3dDcmxn?=
 =?utf-8?B?RWlNbSswM1NpcWVWYndvS2E3WGZJeitSdGJ1Y1NYbEFMcHNtTUdPQ0hZZDEx?=
 =?utf-8?B?UUtobHZPMmpoWEExMVladU02SmFlMTBUOHhjQW43b2tvNlNrTldLNEh0WDVr?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25dff2b6-0f51-45db-df39-08db94ee54c6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:25:55.0076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXqMcVOlzooA9lhn/eiExw7spLlpt+WOt3T/Au3zdJclAcw5pVPiE1G1TVIS3jIDHXS83CqAivJ0ef55mcemPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 03-08-2023 04:10, Andi Shyti wrote:
> Hi Badal,
> 
> [...]
> 
>> +struct xe_hwmon_data {
>> +	struct device *hwmon_dev;
>> +	struct xe_gt *gt;
>> +	char name[12];
>> +};
>> +
>> +struct xe_hwmon {
>> +	struct xe_hwmon_data ddat;
>> +	struct mutex hwmon_lock;
>> +};
> 
> why do we need two structures here? Can we merge them?
In my previous series I mentioned its require to hold multiple hwmon 
devices.
> 
>> +static const struct hwmon_channel_info *hwmon_info[] = {
>> +	NULL
>> +};
> 
> just:
> 
>    static const struct hwmon_channel_info *hwmon_info[] = { };
> 
> would do.
sure
> 
>> +static umode_t
>> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +		 u32 attr, int channel)
>> +{
>> +	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +	switch (type) {
>> +	default:
>> +		ret = 0;
>> +		break;
>> +	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return ret;
> 
> OK... we are forced to go through the switch and initialize ret.
> Would be nicer to initialize ret to '0'... but it's not
> important, feel free to ignore this comment if the compiler
> doesn't complain.
> 
>> +}
> 
> [...]
> 
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>> +							 ddat,
>> +							 &hwmon_chip_info,
>> +							 NULL);
>> +	if (IS_ERR(hwmon_dev)) {
>> +		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
> 
> I think this is better:
> 
>     drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon_dev);
Sure
> 
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
> 
> I think this is not necessary. Will xe check for hwmon at some
> point?
Yes this not needed as we are using devm_hwmon* function to register 
hwmon but in i915 patches this was suggested for sanity. I will remove 
this function.

Regards,
Badal
> 
> Andi
> 
>> +}
