Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F1FCDB474
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Oct 2023 07:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjJPHdh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Oct 2023 03:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJPHdg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Oct 2023 03:33:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3972E3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Oct 2023 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697441613; x=1728977613;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zXVZHEEIhw2rIGerIirGLFYlnMYaV04i/90cxa4tLto=;
  b=emNuYPEvwKHD672k+tnC08r5Dp3SqhKYnVrkd7MXO8Eh2pP7l41fPjwv
   9yGuk4WpT7YblZIDNBiPHPBw7CrHS1glL90r+FUGYJXNOietq2ptyLs/d
   mGjHjmxGy69FGwtFn/pvZA9n0Ry6MvPxf9YRlSju7TEfcDRtagKVjEw60
   Dsi85qyScPke4LfgxdeAm4e2jsBa3jrO4HeOpBQhxITcfXVRXxbIQC8Cy
   S/FJp2PAcrTa8mkbmOk9plAbd2mqdco4cLTYVJoPm7cVCRl5eJSiD4Rkh
   jTaYX9qK7lwnEJ1V8J4kzlJBVuoZG12uBZuGJuBBRJXTFWl12rxJLN9Wi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384341598"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="384341598"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002836638"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="1002836638"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 00:33:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:33:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:33:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 00:33:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 00:33:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH/vmKnBWL5zYhNMp+zhmz8UepkdKe+0zfF4dCmES4rfPPJWmpi2ZnKsRv4NMbZvZjk+hBzTSI/pDtGB59uDxRZK0t9w+mOAlpwlMNAkLbHs5KxqfuMHgSAFDMoNYNT2esuKD6c1KlUUsFANdo7SA544WxWbBJoXwtDTIT0zSTx+lNes0jkqj23JiglRP0xLZevuyGJ8BkPmVhlhXKl68hH1VG/8/y4v0J3A/1d7XwY7O1kgr4KGqsL9F/+BtxBKmb1R4dift44jk0cwYpXuTOvlytA2Ra3GPI7T5em030SBopMhp2tGQxZYY07MxLhnar7K1Tqo7UdH24WxqQzcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4pmKxWwenfs1WbCbL+nhzr5XScEWUVb49QOIgnHG74=;
 b=Iap3Fdn4Oi2doGnkzqQETtQHjLE3XptiEuOUf41QBInz4nGlFEsIpd+3Y1dwm4LGEGoBj3Zd4MSPWkGuT7lHdK47KCQXkAK48wHfw5YfdghKVtcMg+nyb4E5h4pciZYb5INWPf581gq+Tj+6u0GX4jkKyvjZVgeoWz8xcRFgOkAQVYlJ2MJHWEwUUVeGp34FsFnk82luDZPep426BrEyd+vEUI/fewL014rUy80C0TuZXTtrpQRffinSRkjEWNF7WGs+yHQ5bmS0X5TiqqZW3e09YelYX3TK7AjxZk9Nt7IDanXYWIRZNqcp5ekfHNHHf3tmQvEismBya9pkpSUq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 07:33:18 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::6fe8:4a63:d48f:8c13]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::6fe8:4a63:d48f:8c13%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 07:33:18 +0000
Message-ID: <948de785-bdb9-4d03-b7a3-548b712861d0@intel.com>
Date:   Mon, 16 Oct 2023 13:03:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Protect hwmon rw attributes with
 hwmon_lock
To:     "Gupta, Anshuman" <anshuman.gupta@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>
CC:     <ashutosh.dixit@intel.com>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
 <20231006170205.4136927-2-badal.nilawar@intel.com>
 <dd836c61-4576-44d6-82bd-0c743e987b58@intel.com>
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <dd836c61-4576-44d6-82bd-0c743e987b58@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::10) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS7PR11MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae8133a-8e5a-409f-c6bf-08dbce1a2abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyvbcbwFB0ZpeSwRn67grPfuh7KFsgZ2nAi162FGIfBpiJMB9F0RcRdky30rOjDuInth1gIax66SWvXZ68w/sMAovbVicu8uEa8S0pFQmJwpdFsQtVMmlJNpLtTyxzHnLY0V9C3aOr9EtgJRKZmJiYjIrtQyQgP5V4fr6R7tjPn3/rdWcgi+ma5vptBv2M5LsXFSzUCFBJZtqOZwg53LRY4neL6W31BLFTVeMGS4M3YtM8iOT1vsgIzcjCGmnzA3clUo2JMGFtEjVWmvMj5U94XhZd02YrwrHNMJo8OBzDvQ0uBMByD5FlHymmK3ijisx7gSrX6ponLxf+bokRAOwlk/96sLul2SZQ2IqExlG3svXtlFrebTwkk1t17Uzwmq7I/CUvEWTV+W/xjw8uUKYfjlI4iPb8AIxi12JNRvGOBMMwacDjicVEvFuQ+8IBYmGe3d6I2BQA99u0MIjLqFE4s7wGjdxPUJMaSvqyt84SdGcwrrsvt/Nk4Vc1bATTZ/kU6wM164NarwEVQBr1pRrwNtVqxkCwBzIv94ssEGZpsnNGurgR385x3TMOo1/vl6jDLa7AysPawPbcu7TTj1xzVGRz2DZG2IQnX2eGfrBCi40iEs7dzPuR5Baue3nmoSs6OfmkjfJN7hXORfwF5xvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31696002)(86362001)(36756003)(66476007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(83380400001)(66556008)(66946007)(316002)(2906002)(30864003)(6506007)(6666004)(6512007)(478600001)(31686004)(53546011)(26005)(2616005)(6486002)(82960400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJtaDNLaEh3NGNYV0dmM1JYS0Z0akRYaTNRSTlkNnBpWVdLYVJPVks0L2M5?=
 =?utf-8?B?eXQ0UWUzaFdtSklndDVNc2ZEYit4d3EyVUdNNEpFaUg4T1FOTWpUWlJwQ0ts?=
 =?utf-8?B?QmdxSjBPYnF6aHlZNFhiSzgzalVibWlVbFhZV3FvcC94akt5QTRDZUduMjZM?=
 =?utf-8?B?VU1lZVBwU2pSTVdnR0hOd2YwOHpyNFhWRDl2d0Zic0RqUGczRENVd3A3T3l5?=
 =?utf-8?B?Sks3Z3dULzk1NU8wQWZjWGsrTXdhSnhHLzlsVU41QnU1NjY4eS9tZEMvL1Bk?=
 =?utf-8?B?Uks1S0dWaVpraFJ5ZDJBQ0VudTdWWVZOTWs4Tlp2QXcrZGRuV3ArREM2QUx2?=
 =?utf-8?B?UWd6UlF0U05rQmtMMGFnenFlN2plc2pxdmtVUXNFOVh1eVlYeVYwM25wSUpx?=
 =?utf-8?B?QXlSa1hKd0t2QXprR290K0J2UVIxZW1TZmtOb3VSYTNYM1ZZWUI3RnZOdXV5?=
 =?utf-8?B?aVRlcDR4MThFZ1VNYmxMc2JWcE1reXNwMlNCTHd6cUNaWUQvUVk1UlFwUmM4?=
 =?utf-8?B?UUVUZXdxckhJbUhoNlFTNEozMUxPaEFnZ3l4NzIwREIxTzNNcGJkd050OGQ1?=
 =?utf-8?B?V3FBZ1Fabk9aVjErRVJCUVVZTmQ2ckRVOVRMMGpxRjEwYll2TEZaYVlaWENV?=
 =?utf-8?B?d0ZBSkdDMHdPVm5zNDlySDhsT1FCQ2hvbkZCaDZVK3I4TDEzdW0xMy8wU3hE?=
 =?utf-8?B?MnlCOFdRKzRLNFArenIrWXhpeDJCYkxwTE03MDlwZmxob3V1V0luSzhFVmVj?=
 =?utf-8?B?d0lxT0U5L2U4WWF6SzVpQlRrWmkyM0MwUDAxb0lObjB4R05KSUpUVzRKeHZB?=
 =?utf-8?B?NUlTOGVHVXlKM2tOanF2MStpVGpCLy82dmR1YnhrNUtKNUhIN3JJcFIyK2tl?=
 =?utf-8?B?SUJNcEw1M0pNaWlKanJOd2FtcXVFZ1Q3Z3M5M09vWmMwd2dnbGFXNmwxSFFB?=
 =?utf-8?B?RlhHQnlCbjRiMGZkSmNJUjIyTTU4VlRhRzZIQTJNdGUyWlNqbkhVUmFwUHFj?=
 =?utf-8?B?L3VPcEMxMlNRazdYZ0RuVlMzekpIaS9iL3djUEI4VHlpRXk1MFBZdURTeU9G?=
 =?utf-8?B?VVVTRTNjRW1kdEJiajdxSUpNT055c0VUMDN0MFNqcGhCelg2dnpqRlR5VmRT?=
 =?utf-8?B?eDRrQ1FpN1VFMFZrdzVZeXhqd2NzcU5FQTdHZU1nWTdNWG9LclYxN09TS2FR?=
 =?utf-8?B?MFR1RGxYa3MrNm5GeU9la1BKeVppd1FWRjQ0Q2hITExZYjZWVkEvMUllTkJR?=
 =?utf-8?B?MVQ0TXl4eDREVjBHRTc5Yk9lYzRaZWQ5cWkzY2cvNEIvK1R2a21mVDV0cHJ2?=
 =?utf-8?B?eUhFeFMyU20xcWJJbDgxM3JGdis2MEg4U0tjR2Rxa0lPYXN4NGdKWEtOUUgz?=
 =?utf-8?B?bGUyQzJ0eEYrY0tuWTdIZnNSVXFJN0RPOWJOejRpaXk2YnVJNjNBSkRVRS9k?=
 =?utf-8?B?c2tMSkY5OTZwUG1vdFl0VXhDQVI1ZTVvaTF6bDdBR1RKRzhmVStGL0dmdjBi?=
 =?utf-8?B?dEZzTGYydmFPUTZ4ZVJScmEzYXdna1BVa2dLT3V2Yi9pZk83d0kzRVZabGtr?=
 =?utf-8?B?WmdYWFZjV1d4UmJqc2oxQVpOL0ZzTUw1NDNaN3ptTzRvMXZXK3FXTlBlNzBT?=
 =?utf-8?B?ckJUZkdSRnZiTEhPZGVPVUdGcUV6azAvOHBrTWplYmJnV1NDUXBiVE5QTGYw?=
 =?utf-8?B?OFZVaDlDL3dyejZtVFV3MFdpbWt1VlI4Z0ozWnBQbGdaK203UzQyVnBMYUJy?=
 =?utf-8?B?RjJFSTNaSTgwWlkvcExmc1pESFZoYUtRbXlEanBLc1JZUlJ6MTBoVWpYekpN?=
 =?utf-8?B?Z2U3dEdtMUFSMmlKaEJ4UnkwNUVrSzlmVlBkSjB5Yk9pa3hDSVozbkVnUkpH?=
 =?utf-8?B?MWRLUllOQkNPN21QdFUyRlg0NVYvWU9hTGNVQmpVWUozVERyNndXN1dWZm52?=
 =?utf-8?B?cXBFQTM4VnFRUklaeDB0N0k4MmJnbll4SWR6L01uV0dLcXpmcFp6d0xkVk4v?=
 =?utf-8?B?eG45eDFiT3Jnc0tBV0ZiZ3lJSTVmc0V3cis2Y0JTMFliOVRQVVZ4SEFhbVJI?=
 =?utf-8?B?cmx4eWwxZUlkSUhrVVNkK1FNZExNT1NDUkZONWdGUTZRS0k2bXU2YjZ1dyt6?=
 =?utf-8?Q?YU/PKjq8qgbg/uQBtRCIP+XZj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae8133a-8e5a-409f-c6bf-08dbce1a2abc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 07:33:18.7851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mudmkUYyYmT/Z4PkdNzXf+HXBXmXK4o9Hc1RrMbWkz/TDwQxzdjPUCpwvofQi7uz5UANqhcAIQkBhUPLznk0GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Anshuman,

On 09-10-2023 19:06, Gupta, Anshuman wrote:
> 
> 
> On 10/6/2023 10:32 PM, Badal Nilawar wrote:
>> Take hwmon_lock while accessing hwmon rw attributes. For readonly
>> attributes its not required to take lock as reads are protected
>> by sysfs layer and therefore sequential.
>>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 143 +++++++++++++++++-----------------
>>   1 file changed, 71 insertions(+), 72 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 9ac05994a967..391f9a8dd9d7 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {
>>   struct xe_hwmon {
>>       struct device *hwmon_dev;
>>       struct xe_gt *gt;
>> -    struct mutex hwmon_lock; /* rmw operations*/
>> +    struct mutex hwmon_lock;    /* For rw attributes */
>>       int scl_shift_power;
>>       int scl_shift_energy;
>>       struct xe_hwmon_energy_info ei;    /*  Energy info for 
>> energy1_input */
>> @@ -95,47 +95,45 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon 
>> *hwmon, enum xe_hwmon_reg hwmon_reg)
>>       return reg.raw;
>>   }
>> -static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> -                enum xe_hwmon_reg_operation operation, u32 *value,
>> -                u32 clr, u32 set)
>> +static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> +                 enum xe_hwmon_reg_operation operation, u32 *value,
>> +                 u32 clr, u32 set)
>>   {
>>       struct xe_reg reg;
>>       reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>>       if (!reg.raw)
>> -        return -EOPNOTSUPP;
>> +        return;
> Don't we need to report this as warning?
> What is possiblity of code path landing here.
Warning is added in xe_hwmon_get_reg when reg is invalid. Warning is not 
needed when reg is not supported by platform. During runtime code path 
will not fall here as visible functions are taking care of creating 
hwmon entries only if regs are supported. So it doesn't make sense to 
add warn here.
>>       switch (operation) {
>>       case REG_READ:
>>           *value = xe_mmio_read32(hwmon->gt, reg);
>> -        return 0;
>> +        break;
>>       case REG_WRITE:
>>           xe_mmio_write32(hwmon->gt, reg, *value);
>> -        return 0;
>> +        break;
>>       case REG_RMW:
>>           *value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> -        return 0;
>> +        break;
>>       default:
>>           drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg 
>> operation: %d\n",
>>                operation);
>> -        return -EOPNOTSUPP;
>> +        break;
>>       }
>>   }
>> -static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>> -                       enum xe_hwmon_reg hwmon_reg, u64 *value)
>> +static void xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>> +                    enum xe_hwmon_reg hwmon_reg, u64 *value)Isn't it 
>> possible to pass len of void * value to xe_hwmon_process_reg()
> so we can wrap this fucntion in xe_hwmon_process_reg ?
Yes its possible but I feel it would be more useful if there are regs of 
variable lengths i.e. other than 64 or 32 bit. As of now hwmon regs are 
32 and 64 bit lenghts so I prefered 2 separate functions. If you insist 
I will wrap.

Regards,
Badal
> 
>>   {
>>       struct xe_reg reg;
>>       reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>>       if (!reg.raw)
>> -        return -EOPNOTSUPP;
>> +        return;
>>       *value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> -
>> -    return 0;
>>   }
>>   #define PL1_DISABLE 0
>> @@ -146,16 +144,18 @@ static int xe_hwmon_process_reg_read64(struct 
>> xe_hwmon *hwmon,
>>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but 
>> display
>>    * clamped values when read.
>>    */
>> -static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>>   {
>>       u32 reg_val;
>>       u64 reg_val64, min, max;
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>>       xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, 
>> &reg_val, 0, 0);
>>       /* Check if PL1 limit is disabled */
>>       if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>>           *value = PL1_DISABLE;
>> -        return 0;
>> +        goto unlock;
>>       }
>>       reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> @@ -169,14 +169,17 @@ static int xe_hwmon_power_max_read(struct 
>> xe_hwmon *hwmon, long *value)
>>       if (min && max)
>>           *value = clamp_t(u64, *value, min, max);
>> -
>> -    return 0;
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>>   }
>>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>   {
>> +    int ret = 0;
>>       u32 reg_val;
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>>       /* Disable PL1 limit and verify, as limit cannot be disabled on 
>> all platforms */
>>       if (value == PL1_DISABLE) {
>>           xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, 
>> &reg_val,
>> @@ -184,8 +187,10 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, long value)
>>           xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, 
>> &reg_val,
>>                        PKG_PWR_LIM_1_EN, 0);
>> -        if (reg_val & PKG_PWR_LIM_1_EN)
>> -            return -EOPNOTSUPP;
>> +        if (reg_val & PKG_PWR_LIM_1_EN) {
>> +            ret = -EOPNOTSUPP;
>> +            goto unlock;
>> +        }
>>       }
>>       /* Computation in 64-bits to avoid overflow. Round to nearest. */
>> @@ -194,19 +199,18 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, long value)
>>       xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>>                    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>> -
>> -    return 0;
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +    return ret;
>>   }
>> -static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long 
>> *value)
>> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, 
>> long *value)
>>   {
>>       u32 reg_val;
>>       xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ, 
>> &reg_val, 0, 0);
>>       reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>       *value = mul_u64_u32_shr(reg_val, SF_POWER, 
>> hwmon->scl_shift_power);
>> -
>> -    return 0;
>>   }
>>   /*
>> @@ -235,10 +239,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long 
>> *energy)
>>       struct xe_hwmon_energy_info *ei = &hwmon->ei;
>>       u32 reg_val;
>> -    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> -
>> -    mutex_lock(&hwmon->hwmon_lock);
>> -
>>       xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ,
>>                    &reg_val, 0, 0);
>> @@ -251,10 +251,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long 
>> *energy)
>>       *energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>>                     hwmon->scl_shift_energy);
>> -
>> -    mutex_unlock(&hwmon->hwmon_lock);
>> -
>> -    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>>   }
>>   static const struct hwmon_channel_info *hwmon_info[] = {
>> @@ -284,6 +280,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt 
>> *gt, u32 uval)
>>                     uval);
>>   }
>> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long 
>> *value, u32 scale_factor)
>> +{
>> +    int ret;
>> +    u32 uval;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    *value = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, 
>> uval),
>> +                 scale_factor, POWER_SETUP_I1_SHIFT);
>> +unlock:
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +    return ret;
>> +}
>> +
>> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, 
>> long value, u32 scale_factor)
>> +{
>> +    int ret;
>> +    u32 uval;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>> scale_factor);
>> +    ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +    return ret;
>> +}
>> +
>>   static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>>   {
>>       u32 reg_val;
>> @@ -317,23 +345,15 @@ xe_hwmon_power_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int chan)
>>   static int
>>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long 
>> *val)
>>   {
>> -    int ret;
>> -    u32 uval;
>> -
>>       switch (attr) {
>>       case hwmon_power_max:
>> -        return xe_hwmon_power_max_read(hwmon, val);
>> +        xe_hwmon_power_max_read(hwmon, val);
>> +        return 0;
>>       case hwmon_power_rated_max:
>> -        return xe_hwmon_power_rated_max_read(hwmon, val);
>> -    case hwmon_power_crit:
>> -        ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>> -        if (ret)
>> -            return ret;
>> -        if (!(uval & POWER_SETUP_I1_WATTS))
>> -            return -ENODEV;
>> -        *val = 
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> -                       SF_POWER, POWER_SETUP_I1_SHIFT);
>> +        xe_hwmon_power_rated_max_read(hwmon, val);
>>           return 0;
>> +    case hwmon_power_crit:
>> +        return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -342,14 +362,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 
>> attr, int chan, long *val)
>>   static int
>>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, 
>> long val)
>>   {
>> -    u32 uval;
>> -
>>       switch (attr) {
>>       case hwmon_power_max:
>>           return xe_hwmon_power_max_write(hwmon, val);
>>       case hwmon_power_crit:
>> -        uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, 
>> SF_POWER);
>> -        return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>> +        return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -372,19 +389,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon 
>> *hwmon, u32 attr)
>>   static int
>>   xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>>   {
>> -    int ret;
>> -    u32 uval;
>> -
>>       switch (attr) {
>>       case hwmon_curr_crit:
>> -        ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>> -        if (ret)
>> -            return ret;
>> -        if (uval & POWER_SETUP_I1_WATTS)
>> -            return -ENODEV;
>> -        *val = 
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> -                       SF_CURR, POWER_SETUP_I1_SHIFT);
>> -        return 0;
>> +        return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -393,12 +400,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 
>> attr, long *val)
>>   static int
>>   xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
>>   {
>> -    u32 uval;
>> -
>>       switch (attr) {
>>       case hwmon_curr_crit:
>> -        uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, 
>> SF_CURR);
>> -        return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>> +        return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -420,8 +424,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, 
>> long *val)
>>   {
>>       int ret;
>> -    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> -
>>       switch (attr) {
>>       case hwmon_in_input:
>>           ret = xe_hwmon_get_voltage(hwmon, val);
>> @@ -430,8 +432,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, 
>> long *val)
>>           ret = -EOPNOTSUPP;
>>       }
>> -    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> -
>>       return ret;
>>   }
>> @@ -565,14 +565,13 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_device *xe)
>>       struct xe_hwmon *hwmon = xe->hwmon;
>>       long energy;
>>       u32 val_sku_unit = 0;
>> -    int ret;
>> -    ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 
>> REG_READ, &val_sku_unit, 0, 0);
>>       /*
>>        * The contents of register PKG_POWER_SKU_UNIT do not change,
>>        * so read it once and store the shift values.
>>        */
>> -    if (!ret) {
>> +    if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
>> +        xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, 
>> &val_sku_unit, 0, 0);
>>           hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>>           hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, 
>> val_sku_unit);
>>       }
