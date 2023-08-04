Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA12C04A94
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 14:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjHDOVv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 10:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjHDOVu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 10:21:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DACCC
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691158908; x=1722694908;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kpLQ1+0g4jCHq9f8R6WU/ola40GocJmxMO2L6ugVHIM=;
  b=eGhD/1gJ8NfMcZWxySaI11guPSpxMUek4eFy910a/nai0qFizox5yGH2
   zHggFpdqteJeQbY2OoXrBQoO9WqWg1GxEyCNGWcQlnHOp1S01MaxHkr2K
   HMstCC14dp4L1rhF0dIwMeHgZhJDRdyqTuV0hpXD+x6v6fzpdIyjtCpEJ
   zWWF9PCowJmOsEqJwg6/MFCCN+YVtlXLyB4Av4z/M3AHbb6d0QrpqETZh
   FspWzPRFe1dul2SarpyXbN7r94oGNJSytiy8EBYFbwEwppYdraV6RKiHB
   7ZRILU1p7ABqdfCTNKBlhqw6z04ZDbzsHhVbF4s7zKcHJ9vY2yFfDSRil
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350468672"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="350468672"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="723672992"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="723672992"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 04 Aug 2023 07:21:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 07:21:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 07:21:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 07:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbxqXqt6BHUr1Har0u02/Rxm2b/2ljXq9wd4hOpNWbYJUwC4eNdouzF/Qc57Mcy7xfxliKjpdUgOj3rtNsily5FtsRGyhiHyrISiffNJTlKMTeujKrBGmq93dzUcfz+lmKBzdRVIXLNFWRxg0/a5bDAGx507MAXMLY2bGckhCKBEutbQOHWyWCEsfj3XW/F/wK11qgWuslC3I2leYFGtVInRaJ2nUIm+3g0P4O30kvOtiqnbbpYhf5TixEemZtvzPOBozzfuMUl3f2vNN5g05f2sZiaL12AiImZb1xbxNP1BNbP6xmZza8xM18m25jaOaMAbKPjbNZjRoV9g15FJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5VmsxJzr6tw0brl13sWwQSkNq1Y3fIT3KOn0A/3Gfg=;
 b=VkaopEyGXZ1HtP5g55weVyqFF0Erjz9xjR2lUxUNR1yknPu3Xj9mAbWLAZUWnQUzUAVL2OdhVJ0qEzaTFc0kqMh/HZBL+7AIt1lnNz8bcxPpHqDlWVoxwdtQ7Y9u18hwtlDnVuxLAfrHx79KiEYXnSEguev2wldpXTCwjeirBk+Yt7A+BM3/YlY8xXKZVTpMpgx8/SAC2OLRq0GJuHzrq3IFVH30kQbnkYZ6agZm+JrV8sG0t96L9ia5Hs6EJw9RpURo2c4sJB+awL1nwufDjocCJY2t3SPnCIluRpE4nfeZ+NfRfLQ71H7NBVDQYmmknPMjOxFFScPF1DcmJAbZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 14:21:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 14:21:44 +0000
Message-ID: <a5a8411d-60d9-3c96-8c0c-d25cfd638cb9@intel.com>
Date:   Fri, 4 Aug 2023 19:51:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/6] drm/xe/hwmon: Expose power attributes
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-3-badal.nilawar@intel.com>
 <ZMrlafpcCqHY/q5z@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZMrlafpcCqHY/q5z@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a140eb-d98b-4811-0ee9-08db94f6210d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4afi3HLccbmd692xcZmrIjBjbkCif2ROj+l7rrin1AEhDtX/Xs4A7ESOQNxg/dTmQDzSqMEM2E76yUFk7FjbRyy5Qe89dIgbUQWM/16VQ6FXWLvza1Fz678EFaCl0fGyCKHJBlWMuATaOQ+mkSPP6vjinPwzxLRWdHNVqvSGt57DC7G9fT3H5hpRd1QSMN9uOaJ/awjC3c/AoV5bkQsuBiVA/dnuOBcHdUssfHQ4DQRdStceu1cfDyiDpOhAGE63+L19XskdeIXiKz+wnmZr7GazxEqXuRhAklW8a8s6O4CSFdBaSqYqjNw9kC7kL69l98AVg+DrH/+R5nBQP9gSvSLaNMPbjNCz3pvIuWPj9ubTy9bOQbtUmbbNWj4vBT19SYIUxqS/yvdLkQWjlzxgPF59rvhCaHGMlf+FlGxlnBCq7BZRHetgVfrASelIqqOX41B5fFOdLRwgOFSa02+a4g02zT+HxDEl5sjrE9HvJJNVj7kgdXWXMhkcTcAWnibvtaZEGTEQ4Un3cbP0h3c3pAp/SQ6HZH4AhCKnNUVa2fwc3jDCitEHEVsbT08rUx3npFfs7DuCY/wKVSvv8I9cIqCOXvHtHg+iPATPiCwxsjrCgglzwDnt09SUZc72HHs14N+P461/mOu4oOosZ1Iyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(186006)(1800799003)(6486002)(6666004)(6512007)(86362001)(31696002)(26005)(6506007)(36756003)(2616005)(53546011)(83380400001)(38100700002)(82960400001)(66556008)(66476007)(66946007)(4326008)(6916009)(2906002)(30864003)(316002)(5660300002)(41300700001)(31686004)(8936002)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enI1SlYydDNiTE9EeGZISVE4a01kREV6L3RwU0QvS28xb1ZjNythRUEzSHhL?=
 =?utf-8?B?VHNKVzBta21xcURXMHhCL2x6aUVuejdZaXR3amxtL2w1Z2ZXbXhQWmMrMnUw?=
 =?utf-8?B?M3E3UmNVREtQS09KR0o0azYyeUptMkVCZlArUHZiMlkrNHdRQjBLMC9YRXk3?=
 =?utf-8?B?ZEdBNXYvWnQxSGtuejRVMnJUcVZETTd3aTQ0c3E3Q3Vwakc0NXVYcDlOcDVP?=
 =?utf-8?B?bm11MTdZcGNnMStudW51QStVSlJwclc1cnBiT1dYaFNZYm1RTjBoWjQ4UU4z?=
 =?utf-8?B?K3duOFpBbXYxK2xJTTAxRHlhWXBMdTNzWFFWRjk3MUloZEpITGNZazJMKy9Y?=
 =?utf-8?B?d1Y2UmRhR1hXS0xROGlBeEFkT0FxbDJTN1U1eHlFYklMVUVmdUlHQ2NvTzUz?=
 =?utf-8?B?aXhCWFRZVWNpZzJhRlBDcGZiQWVLWFdRQmZMcUszcnhsTU8vWlF4VVBkTXhp?=
 =?utf-8?B?S1RpOVVIR1VodFlpcUd2cHVNRHVyZjRDb2JBNDhiVW9hZDZEbDlPajFXL3k2?=
 =?utf-8?B?bnljdGdjMkRrZFlxc0ZZaUMwRW5RdmVEb2RqdlRXQzZRZklvWFh6S0VWNFVz?=
 =?utf-8?B?blRjV0o0RldyVHp0aEF6Y0dWR1FvbWdvTjdRclNVUlBGTEpjZlBQNVpwTTls?=
 =?utf-8?B?d25aMDYwQVBhaUM5MEdraXZnRWl6cmpydTRHWURVQVcyZUJwWjNkVm1sR3BO?=
 =?utf-8?B?c0s3UU9MdThMeFUzSGgxNnczS09JeFNpZVhOYkJkOHIwSXIyTU1NUjhPUEJi?=
 =?utf-8?B?VjlZTDFGYXp5d0ZCUSt5VXJobGpCc3lPRGRlOE5KVXQ3N1hhU2ZsdnpTVGF1?=
 =?utf-8?B?M0J3SGxMdWNxM0c3M0t4UjF0VnNCWGJsc2hEVjF3VnYxOXNVaUdoeE9XK0tJ?=
 =?utf-8?B?TUpDM0pLK2JHeUgwVWxXQW50WTY0NWFoODZJckFHM2R0aE43UWRiNnpDRVJQ?=
 =?utf-8?B?eUVIQ1ZuRDN0ckNJMVRXZTVOSjMwSmI4d2FOWXBOUS9GMVd0RCtpQSs2K2Vy?=
 =?utf-8?B?TVJkYUFFV2YxQSs1RGpya1FWb2dUZ0paYzgxN0IxUnc4b05JK0p2bmRaWXlX?=
 =?utf-8?B?aTJ4RTI0UHp1TFQrNkIzMFRhaGFOdUpDdmdzQWR5aVRtVThYSFYrV3Zoek84?=
 =?utf-8?B?cFVLd3llT2s4MWZiUWxtZk5EdzQwTWRNVzNtTVUvMmthd0thR2tCWUNZYWlO?=
 =?utf-8?B?QmtJdDh6WFFMY2hlMTU5RUF5bGJNOHlKd0FqNEprVkN6aWFqc21kZEJHaU1n?=
 =?utf-8?B?dVlsclZDN3k3UlowNjZERDFlanBVN3JSaVlaQ2ZqL3gzRzlkdTJWZmU3c2dN?=
 =?utf-8?B?L0FwTE93dGNrQk1GcVNlME5XdDUwYlV6WnE1QTN5SUxOOXZSU3lzZE1Jc3JV?=
 =?utf-8?B?K1JoeElMVVhnUE9ZV0ZlU0VpTmphckZoR2pLemRiR2dhcHppSyttT0FUS01l?=
 =?utf-8?B?ZkRYUmZuN2krbW1oMDlrRU9pczJUczBSek1NcWptUWp1MTloMlh6VC9xa1c2?=
 =?utf-8?B?VjQ2eTJkVkRteEdIK2FIaGNIUnpxdHAyb3JGa3FFamo3THptSmxILzZCVHlE?=
 =?utf-8?B?cGxsSUEzVTZMTS9VOWtHQ1dsdmNSZUtVeHNHaXIycjdmS2dLRTJZZFVaaW9I?=
 =?utf-8?B?SHpYZnhOY3drQWxkN1IzNE1KNUhuTlNrNFhwd1VWVnBSV2pwTE5uZENRSmRa?=
 =?utf-8?B?R3pqcGcyUXZMdyt3QUxmVUJTTkIxSmVEbFhFRWNCMVVmU0FCeDBvOC9EZ09L?=
 =?utf-8?B?Wlo2RnJlRkxiby9tME9YbWV0eHdYWkJkWldzdFZybERLdjE1T1R3MWxrZXF2?=
 =?utf-8?B?bUtyRWU2dW9saGpuQVFyZGNYOWx0TmxZK2tsUGdNUURhZ3lwUDNwTWNIWUZk?=
 =?utf-8?B?bmlhcEo0MHhqT0pmQ1ZTT1BmNHk5aGdLTnlMeTRLN2NFRmRwVjJEQ21MTDZq?=
 =?utf-8?B?K21VNksyR0FtMFc5TlFXYmtXZFBadWNyc0l6dTRIdnJuaVVIU1MvQ01qdEFw?=
 =?utf-8?B?Y3BRcW80ckI1TDVjK3Y2Y09mVjFjOXMzc2ZaQUFPNFpiVnFIWmdyVDlrSlZX?=
 =?utf-8?B?em45T2xyRFNpZ2RUUDhQZTBFSTBROTRMYUZRWHRBajh5RlJUL1pId3NCQ2xn?=
 =?utf-8?B?aGlRQVFhUDB1K2tGcktpSTYramdjdHZDdkQ3MHlwV0VYMlg5UXBCZGE4dWYv?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a140eb-d98b-4811-0ee9-08db94f6210d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 14:21:44.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGOrphZiAhp9HmE0xjbKZ14WFd7HKpUsBpAHBYIBAZZCXtezCHKdvmqr9FdP9c5iHBnq+In8t4f701M4sxx65g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 03-08-2023 04:53, Andi Shyti wrote:
> Hi Badal,
> 
> On Wed, Aug 02, 2023 at 07:22:37PM +0530, Badal Nilawar wrote:
>> Expose power_max (pl1) and power_rated_max (tdp) attributes.
> 
> can you please write a few words more here to explain the
> interface being exposed and what these powers are?
> 
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MCHBAR_REGS_H__
>> +#define _XE_MCHBAR_REGS_H_
> 
> there is an extra '_' in the ifndef
Sure I will fix this.
> 
>> +
> 
> [...]
> 
>>   #include <linux/hwmon.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include "regs/xe_mchbar_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_hwmon.h"
>> +#include "xe_mmio.h"
>> +#include "xe_gt.h"
> 
> can we keep these in alphabetical order?
Sure
> 
>> +enum hwmon_reg_name {
>> +	REG_PKG_RAPL_LIMIT,
>> +	REG_PKG_POWER_SKU,
>> +	REG_PKG_POWER_SKU_UNIT,
>> +};
> 
> Are these names or id's? With name I understand string/Can't say ids. I will remove _name prefix to avoid confusion.
> 
>> +enum hwmon_reg_operation {
>> +	REG_READ,
>> +	REG_WRITE,
>> +	REG_RMW,
>> +};
> 
> I'm not checking on the prefixes here... I let someone more
> experienced than me comment if there anything wrong.
> 
>> +/*
>> + * SF_* - scale factors for particular quantities according to hwmon spec.
>> + * - power  - microwatts
>> + */
> 
> this comment looks a bit off to me, what does
> " - power  - microwatts" stand for?
unit of power is microwatts as per hwmon spec.
> 
>> +#define SF_POWER	1000000
>>   
>>   struct xe_hwmon_data {
>>   	struct device *hwmon_dev;
>> @@ -18,13 +39,268 @@ struct xe_hwmon_data {
>>   
>>   struct xe_hwmon {
>>   	struct xe_hwmon_data ddat;
>> -	struct mutex hwmon_lock;
>> +	struct mutex hwmon_lock; /* rmw operations*/
> 
> please put this change in the previous patch.
Sure
> 
>> +	bool reset_in_progress;
>> +	wait_queue_head_t waitq;
>> +	int scl_shift_power;
>>   };
>>   
>> +#define ddat_to_xe_hwmon(ddat)	({ container_of(ddat, struct xe_hwmon, ddat); })
> 
> Any particular reason for the ({ ... }) ?
> 
>> +static int process_hwmon_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_name,
>> +			     enum hwmon_reg_operation operation, u32 *value,
>> +			     u32 clr, u32 set)
>> +{
>> +	struct xe_reg reg;
>> +	int ret = 0;
>> +
>> +	reg.raw = hwmon_get_reg(ddat, reg_name);
>> +
>> +	if (!reg.raw)
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (operation) {
>> +	case REG_READ:
>> +		*value = xe_mmio_read32(ddat->gt, reg);
>> +		break;
>> +	case REG_WRITE:
>> +		xe_mmio_write32(ddat->gt, reg, *value);
>> +		break;
>> +	case REG_RMW:
>> +		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
>> +		break;
>> +	default:
>> +		XE_MISSING_CASE(operation);
>> +		ret = -EOPNOTSUPP;
> 
> you could just return 0 or return -EOPNOTSUPP everywhere and save
> "ret" and a return (maybe not needed).
> 
> Just a personal preference, feel free to ignro and do as you like
> it.
Sure I will fix this in next rev.
> 
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
> 
> [...]
> 
>> +static int hwmon_power_max_read(struct xe_hwmon_data *ddat, long *value)
>> +{
>> +	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
>> +	u32 reg_val;
>> +	u64 r, min, max;
>> +
>> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val, 0, 0);
>> +	/* Check if PL1 limit is disabled */
>> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> +		*value = PL1_DISABLE;
>> +		return 0;
>> +	}
>> +
>> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	process_hwmon_reg_read64(ddat, REG_PKG_POWER_SKU, &r);
>> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
>> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
>> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	if (min && max)
>> +		*value = clamp_t(u64, *value, min, max);
>> +
>> +	return 0;
> 
> you are returning '0' in any case, can we make this void?
Top layer function expects return so added return here.
> 
>> +}
>> +
>> +static inline bool check_reset_in_progress(struct xe_hwmon *hwmon)
>> +{
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +	if (!hwmon->reset_in_progress)
>> +		return true;
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +		return false;
> 
> This is a bit scary (apart from the indentation) and without a
> strong explanation I can't let this go.
> 
> I'm pretty sure that we don't need this... can you explain?
In case of guc load not in progress (!reset_in_progress) mutex shouldn't 
be unlock, which will get unlocked once rmw operations are over.

Other way could be get mutex_lock after !reset_in_progress but that will 
add race.
	wait_event(hwmon->waitq, reset_in_progress);
	At this place there is posibility that reset_in_progress get 	set. So 
this becomes racy.
	mutex_lock(&hwmon->hwmon_lock);

Any better idea to implement this?
> 
>> +}
>> +
>> +static int hwmon_power_max_write(struct xe_hwmon_data *ddat, long value)
>> +{
>> +	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
>> +	DEFINE_WAIT(wait);
>> +	int ret = 0;
>> +	u32 nval;
>> +
>> +	/* hwmon->hwmon_lock remain held till rmw operation is over */
>> +	wait_event(hwmon->waitq, check_reset_in_progress(hwmon));
>> +
>> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>> +	if (value == PL1_DISABLE) {
>> +		process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
>> +				  PKG_PWR_LIM_1_EN, 0);
>> +		process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_READ, &nval,
>> +				  PKG_PWR_LIM_1_EN, 0);
>> +
>> +		if (nval & PKG_PWR_LIM_1_EN)
>> +			ret = -ENODEV;
>> +		goto unlock;
>> +	}
>> +
>> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
>> +
>> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &nval,
>> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
> 
> Where is this lock taken? Are you relying on the fact that this
> lock might not be taken? In any case it is not allowed to unlock
> a without previously locking.
Lock is taken in check_reset_in_progress();
> 
> It's very error prone when you lock in a function and unlock in
> another function and in the rare cases when this is done it has
> to be written in the function name.
Sure I will add comment here.
> 
>> +	return 0;
>> +}
>> +
>> +static int hwmon_power_rated_max_read(struct xe_hwmon_data *ddat, long *value)
>> +{
>> +	struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
>> +	u32 reg_val;
>> +
>> +	process_hwmon_reg(ddat, REG_PKG_POWER_SKU, REG_READ, &reg_val, 0, 0);
>> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
>> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>> +
>> +	return 0;
> 
> Can this function be void?
Top level function expect return.
> 
>> +}
> 
> [...]
> 
>> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	struct xe_hwmon_data *ddat = &hwmon->ddat;
>> +	u32 r;
>> +
>> +	if (!(hwmon && hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT)))
>> +		return;
>> +
>> +	xe_device_assert_mem_access(gt_to_xe(ddat->gt));
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	hwmon->reset_in_progress = true;
>> +
>> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &r,
>> +			  PKG_PWR_LIM_1_EN, 0);
>> +	*old = !!(r & PKG_PWR_LIM_1_EN);
> 
> do we need to place under lock these last to lines?
Yes, want to guard this rmw operation.
> 
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
>> +{
>> +	struct xe_hwmon *hwmon = xe->hwmon;
>> +	struct xe_hwmon_data *ddat = &hwmon->ddat;
>> +	u32 r;
>> +
>> +	if (!(hwmon && hwmon_get_reg(ddat, REG_PKG_RAPL_LIMIT)))
>> +		return;
>> +
>> +	xe_device_assert_mem_access(gt_to_xe(ddat->gt));
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, &r,
>> +			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
>> +
>> +	hwmon->reset_in_progress = false;
>> +	wake_up_all(&hwmon->waitq);
> 
> does the wake up need to be under lock?
wake up can be added after unlock.
> 
> Now... does it eve happen that "check_reset_in_progress()"
> returns false and therefore unlocks the mutex?
Didn't get this? check_reset_in_progress() will keep waiting for mutex 
till it is released by this function.
> 
>> +
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +}
> 
> [...]
> 
>>   void xe_hwmon_register(struct xe_device *xe)
>> @@ -128,13 +425,16 @@ void xe_hwmon_register(struct xe_device *xe)
>>   
>>   	hwmon_get_preregistration_info(xe);
>>   
>> +	init_waitqueue_head(&hwmon->waitq);
>> +
>>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>   
>> -	/*  hwmon_dev points to device hwmon<i> */
>> +	/* hwmon_dev points to device hwmon<i> */
> 
> Please this change needs to go in the previous patch.
> What is <i>?
> 
>>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>>   							 ddat,
>>   							 &hwmon_chip_info,
>>   							 NULL);
>> +
> 
> This change in the previous patch.
> 
>>   	if (IS_ERR(hwmon_dev)) {
>>   		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
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
>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>> index daf56c846d03..030296f8f863 100644
>> --- a/drivers/gpu/drm/xe/xe_macros.h
>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>> @@ -15,4 +15,7 @@
>>   			    "Ioctl argument check failed at %s:%d: %s", \
>>   			    __FILE__, __LINE__, #cond), 1))
>>   
>> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>> +			     __stringify(x), (long)(x))
>> +
> 
> Should this have its own patch?
Sure, I will create separate patch for this.
> 
> Andi
> 
>>   #endif
