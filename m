Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1CBE810BF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 10:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjI0K3K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 06:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjI0K3K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 06:29:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4417194
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 03:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695810547; x=1727346547;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KouVP+TDWLTdTOdb+H6yvS5mUqe5MgWd0BFI8b1vi6Y=;
  b=ZMjd3R1bfDmvb+j0W+UH6Wkc8HtNknm70ZOWcBvO6BE6bweC/85JBgUP
   yg/17yeiLFi/eFeeaUMaNbDcZwG5ASe0YqzdIdX09d01USlYxct4w3lpx
   seCA5/y9zuBxHOTXOcjRFm5mcuLtKqmI9hL8/ijPZkKBfWk3RGvr79j98
   mdidFZg57nPmK10bWhW9saM9mnO76yqYuxZfo4ZYwyoUgZnzXwMyMUonD
   JvoLUElOVpJvq+dGIQCG8KT8prcjQac+PLCHCY3f4lLLI2zPEh53YJcTV
   WaT4GQRLOLrdiS9aFoSrPjceVr5eOA+dS8OzCSpQhheOGdnqioLXu1ZEP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="362042835"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="362042835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 03:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725754969"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="725754969"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 03:29:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:29:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 03:29:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 03:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGtGvBbMOfISdnYz5+BQ3F1W5/Z5JoQ0jlwaISOWUDr5FyKHNRrJqXwc+z2qawCJ8AC9CPtm0EPoZJymq0ypb5Y+ErLQrkf409Qt9kup4l/obJumxmYdwkE/LCMj6jXM7kh6/9+K594t3+w23123ZAK/2bjwnsbQg5PMNhooTXvGf9xhfP32FacSO55dTnP1beFgqzCC4LJ7Oq3YYK6qKSxd+UAZkClWYleBNO7XjH9QgoauNd0pyblkPKitIjrUC4wIM/HPezQUZe+VxsFmDUEJclSy9T2Z5IMtwmGqUwCTp6TbmwLcOoyI9YcYyionMYG/UtVEHYvENHw7hSf3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylJuAlQc/Moa9wVdXd6xemjl/1ThjORxNYS21Np9sNo=;
 b=Epm1YQYp6qfeoKIR+TjxKuZI2/K2zhMc1Ph6MV/XYRBwEQAWkP2CCqTV6BuBGmimnODUNrpnbNOW8UbgN+ktLEyMHIDIh1RMwMmOjV0Rd+qyrIcutsziRuK2dDYQRfEjhDIc4XQHDgoO5FSodrQuiCvSPZwS4yuGcL1b6wt/punK/EQXczwOvUJ/5HLCbDaX1bNs8/QaFQyBW0WEZH/vDYBbiPu8eYiLgawlrfJTNPaFKrXpKuemxU4gcPckvn3u5eLMCZArm9SsH+l193VxHptvCNhoCT6lUb5mfFKsxi1Z2lRKt1XDLa3FPb2drkTodH4uJj2QRMmuR127cB0a6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Wed, 27 Sep
 2023 10:29:02 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 10:29:02 +0000
Message-ID: <9b189ee9-c253-3be5-7e26-178d6e904f14@intel.com>
Date:   Wed, 27 Sep 2023 15:58:51 +0530
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
 <875y3w1ax4.wl-ashutosh.dixit@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <875y3w1ax4.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ae98a5-c9c8-4b4f-bafd-08dbbf449177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNrp95QFMrja2JioWtMT+4JN9jTevrpefbhTh6tFiQY+se128UIiPNldwU9ln/CRla/gx/3eX3jDI9u3s960euRPJC8YT9oxov4ML329mS/wQYBApH9cc8vN1o12L5/gk4to3YOQwqApF6hOW13ECPArD4rQ/54/oFK2lMCAmVql3gcuPj4HC58nHKW4E2i0qA7sJ45nwsv7Mh0e0FNpk1zEXYmfTsU3PD+RGEqaQdN73PYTxwUGdP+tKgdP7kiTsIdfJUcWmLb8uNCp+yRwocraGYzbIAQXWWt34qLqpZ7vGqCpa6eVeptWDUQRBvxFiFv0jxWAO8a6Xv5C1MvKRlxTOZYHC2tmQtT+qXI7fB7oHituBaIucdy1FJvI6sP3FXnhB227IsFRFScmdhT9IOA7xr6tz78mMgRan/WVmcD/MX/d7TWLHVTidhw3Qqfyvgh2Pmv0fxgESiYdFTRme070pF+YLnqF12Sjuu4YYH2btJOy+d1KLupcElKEaEIZo7PWETMa4QnEGLV6++8EWqAHYoCNzBXerGlvbOaoAq28tpjzWO76l4oKpAUwFEPjlcl8nhhxJHty/VJRBu4vCFgmNjkcVWHVc3RsOhkmybKLnG5KXJSccIrik49WWFSgQReBMnd3qCRqUdJ8M60oKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(66556008)(53546011)(2616005)(316002)(5660300002)(6512007)(6506007)(26005)(31696002)(6862004)(66946007)(4326008)(478600001)(66476007)(37006003)(6666004)(8676002)(2906002)(38100700002)(6636002)(36756003)(8936002)(82960400001)(86362001)(41300700001)(6486002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9oMlk2VytYeXowZmNBZlhxWVJzT2s1WkhWM05JWEJFVU9XU0lpOXZjTW9R?=
 =?utf-8?B?WVNhL2w5clErdk1kc3dHSlZPMUpZMTdVZGJDMDkxTGxnWVltd3JsRXliT1ZH?=
 =?utf-8?B?NFN6RHRjRytQT29nRFBMTmd3VXRtTnNxODY5NVZzbURBb3RDNWo2TVVjbThE?=
 =?utf-8?B?aW5wcEVWWUdkWS8yK0RvbkhQamNULytuOVZaZkxMc2xYS3o0Skk5RXB5S3B4?=
 =?utf-8?B?bE44ZzR0VEJkMmNwL21iYlp1NWtiS3VvVThCTjlZTjdrN3h4Q2xUV2pyeXZU?=
 =?utf-8?B?bnRiZkgzdG9PY25RQ1lOUTdLaWUwWFJkYU0xcFd5NmRFcHZnMzZaYmRlcjVt?=
 =?utf-8?B?UVBTRFk1Q0Y4b2pXbHVIbkI0MGFmMzhkTlRtWm5MUlFtVWhXdzBwOXpYZmUx?=
 =?utf-8?B?MzBRaEpMc3Q0a2RyTjlaY2NMd3hIVEZDQkxEejJxMlJOQzFuRXBJdkVTVzNa?=
 =?utf-8?B?WnFoSXBLVW4vTDFlWk9vU3owWlJGUnZzUk5MSHEwRis1YkwybzVLT0x1UkJL?=
 =?utf-8?B?RDdXNFczTi9vWURkUWYzWm9UWW1DeDg5NlFJaU9CazRUeUVpWG1vKzM0L3J2?=
 =?utf-8?B?UXI3aW9zTC9RK3BBWjRDd0NRblowMllXZUNIV1UzbGNSYk1HUXE0eW91Zi92?=
 =?utf-8?B?OHNCaVkrMDEwMkZrTHl2TkgzSmRaUkJwU2ZueHkvSmJVdnEyWEtWbGpYZEF1?=
 =?utf-8?B?clBDZ3NuaW04cnI1bzlZRFpCdldHelV5VUlaVmp3Tjc5U1d3TXFZY1lkZktH?=
 =?utf-8?B?VUNRNmhvb05uUmdSWjVRQUF5cWl5MFVydkQ4RXVxUThIeDg1UTVhRTFXQjJU?=
 =?utf-8?B?M2U2T3g2TTFqYXdiaEVId2lBRDNmRTltMWJ0ZVBick1tbVR3TnZIby8rWXRm?=
 =?utf-8?B?amJsTWJHZ2dieC9RZGNUaTZHTUZiN0VMWldvZk9ScDVObURpd1VaeVJZVE1h?=
 =?utf-8?B?V2xXYnpqc0g0K0JpZmovYk5vSXQrT3lPZHRBbXFDM292Rk9lMnFzeDg0UlRN?=
 =?utf-8?B?S0RrcThFN1Q3YlpUT3A2ZjE2cCtqOHBPT2ZJN1lVbFU1RTNGT2M1TUdqdXV5?=
 =?utf-8?B?aW5QeERhNW5naGs5eEM3VnBjeDNFQ2hiK2doMDRvUlFub2RhUVRDUlIyZGx4?=
 =?utf-8?B?YnRRUWdjT3VjaWtjVFZQWUNvN3RSMjI5amc0TzBOR2FTUTZ2a0pXMFFVMW5T?=
 =?utf-8?B?ZjJOc2duanUxRUEra3FOeUltUnNuUGdDanpQb1pLM3RCRzRXSTh3TVlBZzhV?=
 =?utf-8?B?Nk1iSHM2cVM1a0h0UDQ5RGl0SmZuYXBUZStoUXJDcWV0VFdTNzJXZVRpbVpm?=
 =?utf-8?B?YTFKRkkyd2JaRUV0OEFpT204OG8ybDJpMTZKMk9HUjZCclBHSFJqSTJmaG1H?=
 =?utf-8?B?MVJkS0NIdXVDWWVRRjVpenNNcm1QRmJmeVBKY09rV21yV0xEZTlkMFN5Z3hq?=
 =?utf-8?B?OElwckxPUTU4ckFpNFI0TnVkY1NXVGxHeEEzY3BIRVkyVlhqV0wyZWJMbHlS?=
 =?utf-8?B?ZFRjZFcvQWQ5bmhlNFluNksyNXhYK3NLTFhZVlFIVVJkd0xrK000OU0vYjVY?=
 =?utf-8?B?MGpvRnlOcWxJbzhnd3htVFJRajFSMHRoZzNnZ3BRRWd0a0krMjMyUFdXeGF1?=
 =?utf-8?B?UG1MOG0rcDNWOE9yYXdrNFF1N2ZtTTNFaGZVSk1SYnFyM1c0a1ZHYnZQd3pY?=
 =?utf-8?B?bERmOG4ya0ExQld1ZEpmV2JHNGtqQW5aVzJFYkFWdmZHSXJCazFZOG9Seks1?=
 =?utf-8?B?VGJROHM0aFZuQTJqM1NvUEN6cDJRY0R2RkUzaFQ5VDJ0bi91REgweloyOVJJ?=
 =?utf-8?B?WjFwS3pKUkxleThZbXlRTjh3b3ZMQmJQRDh0bHBmcVlvaC9NUTdlTHJLOXlx?=
 =?utf-8?B?VFZURExwS2JwSjNaZG1wOVJuVENVZDZoWHBOTDg3UVZOd3c4Tmp4cXR4NThY?=
 =?utf-8?B?S0N5alVsNzUxQkVwLzNVYXZ3NUk3clVUZFJsbXBCZG0zWGs1V2lxNXhvblZG?=
 =?utf-8?B?MVhmblhFNW5QT1NqRy9TOE45NEdib210ZDJoL3NUMlFMbEt1bEJKUWFqV3Uv?=
 =?utf-8?B?OWJSc29yRlUvZzFXUno0VjBDNVBFbnRkdWFoODdVdkJpK1lBd2pxOUxEN2R3?=
 =?utf-8?B?anJFM2d5TGVLZmo0bTJZUHBrbm9Bbm02RFhCODNDdXJZaHhpNUZBUW5NWitv?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ae98a5-c9c8-4b4f-bafd-08dbbf449177
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:29:02.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htxlftzsC1HZZcZxHWDo2P9kPUz8teWcd6DJr0h2+5ku8gETFjt8yeGzqF8W41UXReW3rWv04gbxuo4uqf2tUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Ashutosh,

On 27-09-2023 10:15, Dixit, Ashutosh wrote:
> On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
>>
> 
> Hi Badal,
> 
>> +static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> 
> Maybe xe_hwmon_read_write_reg? process_reg sounds bad. Basically we don't
> process a register, we read or write it.
I don't think it sound that bad. When we say process register apart from 
read/write/rmw what else we will be doing. I think lets not rename this 
function.
> 
>> +				enum xe_hwmon_reg_operation operation, u32 *value,
>> +				u32 clr, u32 set)
>> +{
>> +	struct xe_reg reg;
>> +
>> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (operation) {
>> +	case REG_READ:
>> +		*value = xe_mmio_read32(hwmon->gt, reg);
>> +		return 0;
>> +	case REG_WRITE:
>> +		xe_mmio_write32(hwmon->gt, reg, *value);
>> +		return 0;
>> +	case REG_RMW:
>> +		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> +		return 0;
>> +	default:
>> +		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
>> +			 operation);
>> +		return -EOPNOTSUPP;
>> +	}
>> +}
>> +
>> +int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
>> +{
>> +	struct xe_reg reg;
>> +
>> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> +
>> +	return 0;
> 
> We can't make read64 part of enum xe_hwmon_reg_operation?
read64 takes argument "u64 *value" so kept it separate.
> 
> 
>> +}
>> +
>> +#define PL1_DISABLE 0
>> +
>> +/*
>> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
>> + * "typical but not guaranteed" min/max values in REG_PKG_POWER_SKU. Follow the
>> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>> + * clamped values when read.
>> + */
>> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>> +{
>> +	u32 reg_val;
>> +	u64 reg_val64, min, max;
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
>> +	/* Check if PL1 limit is disabled */
>> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> +		*value = PL1_DISABLE;
>> +		return 0;
>> +	}
>> +
>> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU, &reg_val64);
>> +	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
>> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> +	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
>> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	if (min && max)
>> +		*value = clamp_t(u64, *value, min, max);
> 
> Not exactly correct. Should be:
> 
> 	if (min)
> 		clamp at min
> 	if (max)
> 		clamp at max
> 
> I was thinking of changing it for i915 but was lazy.
Sure, thanks for pointing this.
> 
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>> +{
>> +	u32 reg_val;
>> +
>> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>> +	if (value == PL1_DISABLE) {
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>> +				     PKG_PWR_LIM_1_EN, 0);
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
> 
> If we are not checking for return codes from these functions, why are they
> not void?
Top level functions expect return. For function xe_hwmon_power_max_write 
returning error if PL1 disable not possible. The functions 
xe_hwmon_power_max_read/xe_hwmon_power_rated_max_read can be made void, 
then it will look like. What difference its going to make? I feel 
existing approach is much readable.

case hwmon_power_max:
          xe_hwmon_power_max_read(hwmon, val);
	 return 0;
case hwmon_power_rated_max:
          xe_hwmon_power_rated_max_read(hwmon, val);
	 return 0;
> 
> Also, how about separate read/write/rmw functions as Andi was suggesting?
> They would be clearer I think.
Would not prefer to add further abstraction, lets keep as is. Going 
further while adding new platforms will think about adding it.

Regards,
Badal
> 
> Thanks.
> --
> Ashutosh
