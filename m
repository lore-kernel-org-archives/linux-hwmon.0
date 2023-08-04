Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FE6C001DF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 13:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjHDNat (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 09:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjHDNar (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 09:30:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78137CC
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691155846; x=1722691846;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6gNjDgTCAyaf8Cu71x7lcH0xUCyWvu1oUsvD5i0iXHc=;
  b=dwM5Tin8TQwNix7ui3HJrAXOtm93qvvNWDioMHOYS/iRFkCsaKU7uz1F
   nDInnetj8/DvjJ9fqsjmTm6bjwbSmGoZRvfD39Spwuf7lnMb19qCon7/R
   ldr6U53CnO4r2UA3L3o0Lp+ckJCaD4L/PLN8I0xjB+/aBMMDIL8tt7NHU
   t70YRG2UCB80vOcZTdf4TrXcP5PWZYpibxw/1yNEFsT7A2ePi4UFWcgs+
   v+2makd05JVlsgiDp1p17YgLnTcBkznluzzHenJq/pHA42FkJSHnMHmU2
   xp8/eCq+2tc4JOT8PTyxG+Xi5+IPB0ZFFUgBk3X95hsTaRGHg0qw/ID5b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360208077"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="360208077"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="903890950"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="903890950"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 04 Aug 2023 06:30:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 06:30:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 06:30:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 06:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGQRYmev4D45ep+Ws4J1H/SyDgjAkAE1IDfI932qPajigVDYL77x6kXBPYlQdm6bOGe0MLoBbKwzqAGwGvBWKL1LG/mPUR20yme2hfKQyl5+kKBK6fIMFhm3G+bwTq99mcTXuLJ0Imn/0WKMrsVPF5hhThInGQ9eQsKFXceR5WLx/vjO3RSeqF4mWRqVFEt59GGYpx6JK5xlb37bOiyxFmbel/E5QVo1wrr+zNQn5hM2HZOuxyS1cfUN2XC892OSdRcbcIHMSfyvQdWe3u084f7zKRQOyW+wjbumUFcPEFFrPzODw1QfgVdiPD9R+8d+FX9jyhuPMopjJGc9VjqMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znF2qvoG0dIHLT3qxyU+LLtkCyq/w0oLYXkiea9NeXs=;
 b=j8GwPZyT77iBL/n0tIwIU0h1R2GVUv049oW5YpQ/1DifA1sEnTNCYLJB1WfPwoQT/NVULWCGvDNlCWlyIBMPDEORyTWi1WbRb2BY34Ky7U4mBLNXQt+HG5UBCCVhGxhUSfqkEVgQ5mGN8HLDSa1SP7AIiA6BPXHIsh224npMZzBjJRc1zwfqpp5MtSxOgIFUoZWBlraW68S42X2WByGDQTJibgGoQWnXnpoqUxXsZDouSw4SoZVc+IsxWiGmvH+ClZifBB5+VZMFbYAI7N9UPrz4ftzYqRI6rhUWNpiOCXdLgjq8BkQG5jWhXvyJXcOHrRKUwlFFQLv22yqHNsY5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:30:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 13:30:38 +0000
Message-ID: <346c4db0-9b43-f8ba-6321-6c9f24504d63@intel.com>
Date:   Fri, 4 Aug 2023 19:00:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/6] drm/xe/hwmon: Expose input voltage attribute
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-5-badal.nilawar@intel.com>
 <ZMrndXUXs4nB5fnx@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZMrndXUXs4nB5fnx@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::32) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e2adf1-d7f8-43bd-7ae8-08db94eefd77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mc3YZnCrbfzINMgG7zDd/xTnxaEjJgbY6vR2SFJxDe3Gp3X4p1sxsSbEypGOvCqMYN5G4IDRDH1BJLJtTEDzsqIPXq+pBO4ogZap/YVZWZSvqN7u96Oc7wlV0+MzVyuG/1+aGAmx/RCmT4Ju3znrlSEjwkNnxyWYIXqQSTNOL1sKUfQOqbJTnkczYyvmzfel/Z7rbWvtZZdvaLWg6Vu6FJzRx6z94OH5KrlIPZVh3yzmaFBJrFCCbgfUUenLiZpdenZA1v1IdHJ2PFKPqS1rCwUlok2mIVYPLx7WxK9WdN8nmI7Ua3tdpMkCo9K2VZWhiW134zgnnpAR4utTzTXA2iFLZmHif6L+abS+/dtrr+KtXokD5JgeQUBRbJ8JBb+tv3ygF7msBIGPSQqKvGiPaprgrqeVJHpDgaRbouWMRVEeeDMtzCjZ6tULspHhdIVwJb5GRKzs/uTBTCuZFotJQresONnNxT/nt/RBK0Q45xuDIESw+Ma6U5nQ4y682FEYkQ3ZXSX222aRl3nVP1OBvcqkoI8PaJ1twNdS3RUIIET75f2zgJhEiWpTMerXLL6M34l72rdZ6D2KEL4dwCnVgYW1OxTO7WRT96EwB6R6z1Wesiru0o6qFU6dmyeTLfuTNFOdyCLsULS2RQLF6uR5gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(1800799003)(186006)(2906002)(4744005)(26005)(38100700002)(2616005)(53546011)(6506007)(5660300002)(8676002)(8936002)(66476007)(66556008)(66946007)(4326008)(6916009)(316002)(41300700001)(36756003)(6486002)(6512007)(6666004)(86362001)(31696002)(82960400001)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZuTGg3NjdiZTlVNHFlVWhFSFM1VjRKRFlBTGwyRXdPeTd3eC9nUFRvM2h1?=
 =?utf-8?B?Z3JXV1VxVkxsZHh3YnpwWGFsTXFuUkU4UzR6OFVia2d2eUtocGV5aWErd0hP?=
 =?utf-8?B?YllFRjhtanp6UmowMkJXUW9WRGRVSGYydDRXOUFGK05XclNFMlJiUWJ5V2dp?=
 =?utf-8?B?WTc5S3JNZnBZLy9ibkY4b3RFQ2htVElHN1h5NzcrekpHem5oUGEvM0Q5clYr?=
 =?utf-8?B?RFA4bC8yeFQvdDFTcTY4Z29yakpMZlQ5dW9RY1hHeW9hcUdGSHBOVHpoTHND?=
 =?utf-8?B?WkYrMVB3cnZ2V2ZOWUNxZ2dCMlk5a2haa2YwR2wzTGxJQ3psbktoTFV6YWZu?=
 =?utf-8?B?Y2FJclRPTjZRY0xtRDRoVWtTRCtFY3c3c0hpcjh5bjUzalkyWkFkdWszL1hK?=
 =?utf-8?B?aEFaQWtCc2V4SDljb1h6WEVNNkRwQWdZL0RHUVNVTXhJUmQvbzVDTGtxSU1x?=
 =?utf-8?B?TXU3ZlN6Z1dOMlJEb3ZPNWdqRU5hMzJONFd1d0NGQmM2aDNFcFZyNmhaUnZn?=
 =?utf-8?B?aFArSzJZKzBGenB5SEFsUEU1MHhNSUI1RC8zcEl2cUkwdHlxaVh0OEhyeEph?=
 =?utf-8?B?QnJwLzhQdmZSdHdUYUd3TXd5NTRIY01TV0lvNnVWOUVLN1NENk5xY0Fldjl1?=
 =?utf-8?B?RWd0TVRQb3JtdngxV05NZ0JMYnVXdERJNjlRcTlMRXpZOE12VCtzUmlUaXha?=
 =?utf-8?B?M2xVZlluWkJiT3M1ek1yQ2w5TUVoVVVaZjUvaDFPV3RPRVI2SkRiZFhqRXln?=
 =?utf-8?B?UE9nelNJOHZVTThmYUdDSGFqdnNKd3JVdFlnT2ZsWU9SUnl3RUk0UmNZWk9L?=
 =?utf-8?B?V3YrRDYxNU5QaC81VGZLVGw1VUJYNWRvZHlLdVFpWmplQVZ4cldiang4di94?=
 =?utf-8?B?MTJHMW54MTZ5cStDWnBndXBuR0I0MW5mNWlJUUFDUmNWRFU2RUlCWHNDaWh1?=
 =?utf-8?B?ZEczQXNOdHBlSkg1cU1KWjFVeEdnQVVrbVhITTJJMmZ5SEdzRjRJWi92anBV?=
 =?utf-8?B?YnB6bk52cWUxOUUzVGN5Z1NVTDFpaGFnNDUxclJGak84TVRoVlMyazUwNGRk?=
 =?utf-8?B?QTMwM3Q1L3J5YWVsZHNzUHd6SjF0c0RSOGx2bEx4eSt5cndOaHhUU0ptT0ZU?=
 =?utf-8?B?dlFZY1kya0wzbTRscENVSUliaFZBZXY1Z0w5SExXbk5NNDdxKzNXTHhPQW9U?=
 =?utf-8?B?ak5hSDkxb2FCZDd4T3JnY3VJOVBYUVIrWndzaW16cUR1N3JHN1RxZGFCMkly?=
 =?utf-8?B?eHN6TFNXV2I5ZmFCcFQ0bUtscWVqd09YM0VaRG5vbzE2aEtUYXBGcTNJNFUx?=
 =?utf-8?B?enFWK2NvQUQ4cHBSMTR1d3BTRWRJY29ObTlycVlhVGM0UGZ1SXovZnZVMFRD?=
 =?utf-8?B?ZVJRY1ZQUDdwNXk5aXJqYkJSQktNUXFySDJMVDdZMWU4N05NNkJXcjRjU3lQ?=
 =?utf-8?B?NG1QdktNTG1VWVM3V1VnZFo1eXhOYTAvSVE0ZWlxd0FnK1pFZlBtZzRNNG95?=
 =?utf-8?B?WWllbll4ZzNycHI1VFNlYlNEOTJhZ3dIRXFUcDZsS1kyNENPeU5zdTBNdGhM?=
 =?utf-8?B?VFNCb2pHcUxYS0NjSEMxWGtYcUlKWEh2K2d5NElvZE5JT09DVm1iOENsQlZ1?=
 =?utf-8?B?OGxndEdUQmJxWUd0SnlRc2dvWkZqOUl5ZlkwUlFxaFJLYlNWNU9RU20rQ29V?=
 =?utf-8?B?N25EcVZ2ekh4NGtrRndjRU5KWWRzRVRvTUU2R3krTDE1ekhjdXBldDNwMUR3?=
 =?utf-8?B?WXFJM0MzT2Z2QmtIdGRvdXVJVDk2T04rbFBFWmM2N1VqWkVLUVh6cjcvOUZ4?=
 =?utf-8?B?TmJsRTltUzhWNmJQKzMwNkx3RURpT3VteE9NOUkwQ3haOXRTMkV3WG13UVVW?=
 =?utf-8?B?ZUNlTnVPdTRIcmtFQ2cweTcyd2RQclMwM1F5R3pNMG9pYmlablJsWnVScnhz?=
 =?utf-8?B?S0MyallJdHIwb016UGFQMGpDTk9FSmhSQ1hVVER6NWEvTWI4Q0p0aE9BSWFK?=
 =?utf-8?B?U3dtUFhlQ0ZsdjhIcDBjUXVNQnNLa2FNdUhPZEt5NjNwdDFGUkVuSmtFb2tK?=
 =?utf-8?B?b2tXbTVXVWd5eTNyS2lvUWN1S3RtNzhqeXh6OVd6RWRYeUJkL0xTajhuaFd3?=
 =?utf-8?B?d2w1RkpXNUcySlN5RFNETHVkeUVIRnpxNnBFRzVjVWdlRUplSkZvbDVqQy9h?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e2adf1-d7f8-43bd-7ae8-08db94eefd77
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:30:38.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmeFdVFnWPwSv/L/hTOqvi7K4BO6hvPZrUpfKXLen1P51FrQrAYAw0q/3XRo8GHwFpnVQbSWQ/FFf09jymnb7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 03-08-2023 05:02, Andi Shyti wrote:
> Hi Badal,
> 
> [...]
> 
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>>   	NULL
>>   };
>>   
>> @@ -244,6 +254,18 @@ static int hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>>   			      uval);
>>   }
>>   
>> +static int hwmon_get_voltage(struct xe_hwmon_data *ddat, long *value)
> 
> one thing I forgot to mention also in previous patches is that
> hwmon_* and HWMON_* as prefixes do not belong to the xe driver.
Yes, that's why in previous series we were using hwm_* prefix for static 
functions. I think I will use xe_hwmon* for static as well as global.

Regards,
Badal
> 
> You should use an xe related prefix, like xe_hwmon.
> 
> Rest looks good,
> Andi
