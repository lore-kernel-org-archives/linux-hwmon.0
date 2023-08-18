Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC13C001DE
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 04:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357806AbjHREEK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 00:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357790AbjHREDj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 00:03:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B8735BF
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Aug 2023 21:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692331417; x=1723867417;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3v8M1L7WI3gDcoZPAarstkegCBTdnU+7/s8th2TQZ5s=;
  b=UubPCTT3H1upsFf/466glzuMOvbTtETtmP/OZwtIPckPgRt+K9ElPfgi
   8CQsov80nYyeheiGb9x9GFhHWuRwEJfz0GPMs7WkEMJ9yUPdUAztEtXmB
   zKdZA/fnqBIf8B5ESNVajdB+0pfHCN44X3zO9cQ4tQ9EbKR/bCc6uRlNF
   +zewic5PA+ktfa8gKrLVNrCbbTt2zxKNK1nUU1C0As3yH/RSQIZrtc5nH
   czmoq1tPiSxexSqcQJPajnx8Sh5pbhD8EPqeXQt7Y76GxIB/SUJpe3x/Z
   CZ7y57vRmA4eiw1sBTMm4X8cdsb3eO88E+6zXaq/jfsHHkV9MCTCACUrH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352596675"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="352596675"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 21:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981484387"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="981484387"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 21:03:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 21:03:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 21:03:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 21:03:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 21:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6ETHCpFaL7uvXiuUZxblcx3kAmLXf9C8bt6acYsW/BtS3oRSXKnAil54XsW8XvY/tDktYzTSB54LRbCg6Yo5wrKOKFeAfCWcwJXTFQytfpDl+Ug6X9v46EoYEfhktqEAcjee6VZ6CwoR8ias9wnpm9BzRuiljbnMndBYAQ6J4Q30crF6CXfBgPG1RGFCVUg+vhaaN+AOxMzt4MlGLy0TnCHzE5HobtNCA8LwR0H3jY78ccI/ke6LkwktOHMC7zqTxkPwrR7E6ylmffGHd7NRlvA1XUE0DGQ8v5DKDmDVSzNYk0eTQ7xPpLnBUipRqeWqBEeZ0aY7sEJBrpZg5Kh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbqycVwQQNgpipbHoA+6Awz18Syim73HGA0+/qbGePQ=;
 b=fSzIPR6rWDCIRNvULPrITlhmX8/5tZXnjvrwuF+FIBdEquXIrfwwJ5Uzvxi8ivJNOcrlNI+0MDn7q9XfKIFecKJl1l8Et3/rZfRB0xoi2vzB9Jq+n2hbk7bQ7VVXItpgSG0vFApPfC7eG3p4Okab4eGNe1eL7zck2cpY4o2JLE1eK/9nptk8h3qwj57B4eITw+mZ+ndE1ZGB3O1FdyjfkRVtulk4/4q+uwCS9kHPjyDF5dawBDpC860pQza3Gqz8Q5YwptHHoHB8AoBTxzsx7pmUv58QD9QuDADdMt3WYi1gMRdKBtACteGnk1lt8zjdN0QT5qQ3MtVwZzJas8jfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 04:03:29 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 04:03:29 +0000
Message-ID: <37e66486-e1e6-318d-f402-b83231a7aacd@intel.com>
Date:   Fri, 18 Aug 2023 09:33:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>
CC:     Matthew Brost <matthew.brost@intel.com>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <linux@roeck-us.net>,
        <riana.tauro@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-3-badal.nilawar@intel.com>
 <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
 <ZJ2Qm0UcAidCEArX@ashyti-mobl2.lan> <87zg2rsxj9.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87zg2rsxj9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0226.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a12391c-a872-4030-eee7-08db9fa01450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hC3z4I35Bl5WGfEsXe0zWQjub3l40TCyICKENrHLuGrGRmSnOaavmmITpeAE90LAJWZPR3PY2CXQQII7EDnXq3iSvlkwPAAFUesjkQUPDU9Svg4001C6/lwODKsBSAYDJAjIPOwMhfWa2HQhqfL+IAmH4KoCp4eFItBhdL02VDJof1CHpICJMABNNe0BL4z48nAzT2/sD7ZF2JlagzL3Nn6I6E6rV+x/AUWPJkAjg4z4YoOlarBl8eNm4wQlXYsdSZIAiWzz4+bKaf08N7RcusZA36mPgtckH0zhjDbibg58/BBHMQ4CByGYDmhpA1chaLxZXWdXijiItZii43EAki+YYGn2fczDa+BVrwsPwo3iaNaqMM5Oxtl/zCYhntzb0z2TCmnCQHIKBmqTd7jXI9U5iskH6bl3JpRcEAdmub7uwQUDcWyggn4ycx6c1S/ZrLDOLtDEM17AtnYu75OjfT0SEFskSYD1zNNo+2OrdPjOST0gOWK1+myBSAqOjojK4YZyQf0Xn6MjIr4v2daol2m3T5Xsm1H2P9PgpFqlBrvbP62WPfODTpGMF0C0pjVa0qSHP2kqQSqLuIEY8aems+CLJX61zdrMRzmyakr9iWecQd94Xvt3Fw7279BkpkBE1rCh2cVmKeTVaNO3+IRrtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(186009)(451199024)(1800799009)(8936002)(66556008)(38100700002)(66476007)(82960400001)(316002)(110136005)(66946007)(2906002)(41300700001)(4326008)(26005)(8676002)(5660300002)(2616005)(6512007)(83380400001)(53546011)(6506007)(6486002)(6666004)(478600001)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW5temY3Z0hGai91Tzc5OFUyMzJtZU5INDdrUlVxZVQ1bDJXNzJNSm52cERw?=
 =?utf-8?B?dHZnUWc3aEU0UisrT21ac00rMlJZdFdaNGlaRGxJVFFXYUhPdHVpay9zWldq?=
 =?utf-8?B?N2pTWXBHUTd0Snk4UUhCTzhBNlZTWVhEdnc1WU80eGIxV1NEV1hNSmVnRmpF?=
 =?utf-8?B?czlTdWpQL1h0T2JjOXM2WGpsRmgxU2EyZnZXRno5OGx3K0hiMW9qQ1ZJZlZG?=
 =?utf-8?B?U3FnL0RWMTdoSjYrR3Nka3NveEp6QXN0MFlWQVN2QUM2VC9CSWxCc0MxRlh3?=
 =?utf-8?B?dUIyU2hNbGFBbklRbFhaVGxCZ3AzeXJhbk53a3JHT1ExT0YzUGRjdzd4QnB0?=
 =?utf-8?B?T0VEVUxnMnlQcTF4bGZnc1dSOE92a2xlb3Ntc3NHblp5MFNSdkY2Zi92Uis0?=
 =?utf-8?B?Q0JuNXF1ZzV4bXBUU0pUdHNySUtDQ0VwUXI4QndkR3FQV0RmRmJBdGN4b1JI?=
 =?utf-8?B?QWt3OEVpb1JxaXlEdHVZeHJ2Vlp5QVlwcitPaUhoL2RqRXhoL09IMXU5Q2Jv?=
 =?utf-8?B?M3p6bFpwdlFmZ2VlbGRwVWpEcmI4YUxFN1JlTCtPNTVKNUhNd2RGRG1jRGJv?=
 =?utf-8?B?Ky8yVkZNUWFvbjN4eG1yWnIrVmpabXNvU3dWSGZ0MTcrQUVVSk9IclFMOGt1?=
 =?utf-8?B?WEVLZDJNNXZVWGpFT3VYSEFQSnAxQ3cwdldmRnFZM0tqeHFPR2xyd3QyWm40?=
 =?utf-8?B?VDkwZHJYWWxCU3cydFh4OVdYUjdSQktxVDM4WkRFQ2Fmdy9DOEZhZERnNzlk?=
 =?utf-8?B?a09tOXZsUS8xSGV6cHdCOHV5WTJoVUF3RUplbnBCdzRWNEo1RXhubVlNUW9N?=
 =?utf-8?B?eGZrSTB1WWZYVGZSdHdBYlJTdnJPYmJTR1huNlp2VEdDb0t0U1daYWFuZjBI?=
 =?utf-8?B?czVsbVNYdzRnNnVuU3RGbGJBT0JGcG5YWXpTYURzUnhvYjFDNW80UzVjcWFO?=
 =?utf-8?B?L3J4M2JWQ0lWZzVuVUdYODRUOVRDanp6OXFYOEdjZ1RjUE1yVVdGVTBycWRR?=
 =?utf-8?B?dDV6S0RjbCtZT2E3UjFFKytUemVrTlV5Nkd1NzVoZGsyeEU4eXpZcmMzT0Mr?=
 =?utf-8?B?YlJnazRQL3Z6dWRBUmFuNGdrc25XK3gyMXQxcGlKN2tIekc1QmMyd2o5TXJp?=
 =?utf-8?B?ZXRTNXpJS24vVVBrdjJYTGRNcFIxdFl3VG8zVGxMUmlCL0pnblJJKzdENEpl?=
 =?utf-8?B?Uzh0Uzd2NzR4eVcvNE1xeUVkTE9PaGdkakxBQXMzZFU0a3ZLcGh6TEZPb0JF?=
 =?utf-8?B?ZFJUK3ZQMnlCMnY1cFducVJUOGlYVHozeGtMZGQwdWxxcEFyejl0UW4yc2Mz?=
 =?utf-8?B?UUFIdlhTT1FiWUtvUXBkVGxlL0M3MjBzVjJ3MWlWV1J6QVozWWRnMHRCcktX?=
 =?utf-8?B?SDFDOXp6OFlSYlBhZjk0VUlOUVZ3ZldKNm5tWmtXT1o0dm1Gc3NGQ0ViSUd0?=
 =?utf-8?B?dXdIZk0waXdIdVJXZm5aR3Bjc2diY3REWE1qVlp0dmRJclgvSXlscmljTnd0?=
 =?utf-8?B?eDFnTlJQZitERjQ2a2hUcnd3bzlISnBzSExVYVpJWUl2QjJQbjdqMnYyNXUz?=
 =?utf-8?B?eDAyVjhjMCs5blZ1a2dWTUlhUmI5bGI0V2pZRzNHVG5tMmdiRVdNaGNTdExC?=
 =?utf-8?B?eVFITTg0VExmN3JDVjVFcldFRGdYNHR2NU52UEswbWh6WDQ2eWs5STVIRy9v?=
 =?utf-8?B?VWFpVThvejhtOTZKK0IrWXhrQU9xdkdPekNKekhiL0V4d1dYQjJrR3pyODI3?=
 =?utf-8?B?Sk5XMURDOHZGU2JBSDJQM21kbTJyRUlpNVNQeHRVVW1QS0xsU2pFU0o3bk44?=
 =?utf-8?B?Mi9ybHpRQ3R6ZTRrV3ZTQ0RpVkpKZ01EV2JuUmcrakVFUkF4bndwalNQaUgr?=
 =?utf-8?B?SithSjNwdnVMTWh0Q05icmNEaTdJdjl3ZDFyUTFONWNiUEJGNVdUYUROSFFV?=
 =?utf-8?B?T2pQZmtPTVNhVXRmaHRwbEl1b2NUQ2Z2TnBqYXI4bzlPRDFreit1bnNxS1Qw?=
 =?utf-8?B?U1FteTBiWDc3WFZrMy9vUklwb1ZsV1pLeFlqSkZmeTRrTUNidU4yYnE1Y0dw?=
 =?utf-8?B?NkNWa1lscXJtUnhlWlpWeFJNQmxaaHdrdWdMV1pLVmdHWnRoVklCWXkxWnYv?=
 =?utf-8?B?YjBiQnV3VFZURzRXOVVrVkxUS3JxUk82T2FBOU1PcE9meDc2bjZuRi8xZk5F?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a12391c-a872-4030-eee7-08db9fa01450
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:03:29.1325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeVnUBDDMJi+5YjfNc+aWwi7vmW8mp5ZRkF1kSYe2MWBtOooGxrTppnzc5EIpLBWDZuDfzB95fNPo2sWanHrEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 16-08-2023 04:50, Dixit, Ashutosh wrote:
> On Thu, 29 Jun 2023 07:09:31 -0700, Andi Shyti wrote:
>>
> 
> Hi Badal/Andi/Matt,
> 
>>>> +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
>>>> +{
>>>> +	struct xe_hwmon *hwmon = ddat->hwmon;
>>>> +	DEFINE_WAIT(wait);
>>>> +	int ret = 0;
>>>> +	u32 nval;
>>>> +
>>>> +	/* Block waiting for GuC reset to complete when needed */
>>>> +	for (;;) {
>>
>> with a do...while() you shouldn't need a for(;;)... your choice,
>> not going to beat on that.
>>
>>>> +		mutex_lock(&hwmon->hwmon_lock);
>>>> +
>>>> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
>>>> +
>>>> +		if (!hwmon->ddat.reset_in_progress)
>>>> +			break;
>>>> +
>>>> +		if (signal_pending(current)) {
>>>> +			ret = -EINTR;
>>>> +			break;
>>
>> cough! cough! unlock! cough! cough!
> 
> Why? It's fine as is.
> 
>>
>>>> +		}
>>>> +
>>>> +		mutex_unlock(&hwmon->hwmon_lock);
>>>> +
>>>> +		schedule();
>>>> +	}
>>>> +	finish_wait(&ddat->waitq, &wait);
>>>> +	if (ret)
>>>> +		goto unlock;
>>>
>>> Anyway to not open code this? We similar in with
>>> xe_guc_submit_reset_wait, could we expose a global reset in progress in
>>> function which we can expose at the gt level?
> 
> I don't know of any way to not open code this which is guaranteed to not
> deadlock (not to say there are no other ways).
> 
>>>
>>>> +
>>>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>>>> +
>>>
>>> This certainly is an outer most thing, e.g. doing this under
>>> hwmon->hwmon_lock seems dangerous. Again the upper levels of the stack
>>> should do the xe_device_mem_access_get, which it does. Just pointing out
>>> doing xe_device_mem_access_get/put under a lock isn't a good idea.
> 
> Agree, this is the only change we should make to this code.
> 
>>>
>>> Also the the loop which acquires hwmon->hwmon_lock is confusing too.
> 
> Confusing but correct.
> 
>>>
>>>> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>>>> +	if (value == PL1_DISABLE) {
>>>> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
>>>> +				  PKG_PWR_LIM_1_EN, 0);
>>>> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
>>>> +				  PKG_PWR_LIM_1_EN, 0);
>>>> +
>>>> +		if (nval & PKG_PWR_LIM_1_EN)
>>>> +			ret = -ENODEV;
>>>> +		goto exit;
>>
>> cough! cough! lock! cough! cough!
> 
> Why? It's fine as is.
> 
>>
>>>> +	}
>>>> +
>>>> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>>>> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>>>> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
>>>> +
>>>> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
>>>> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
>>>> +exit:
>>>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>>>> +unlock:
>>>> +	mutex_unlock(&hwmon->hwmon_lock);
>>>> +
>>
>> mmhhh???... jokes apart this is so error prone that it will
>> deadlock as soon as someone will think of editing this file :)
> 
> Why is it error prone and how will it deadlock? In fact this
> prepare_to_wait/finish_wait pattern is widely used in the kernel (see
> e.g. rpm_suspend) and is one of the few patterns guaranteed to not deadlock
> (see also 6.2.5 "Advanced Sleeping" in LDD3 if needed). This is the same
> code pattern we also implemented in i915 hwm_power_max_write.
> 
> In i915 first a scheme which held a mutex across GuC reset was
> proposed. But that was then deemed to be risky and this complex scheme was
> then implemented. Just to give some history.
> 
> Regarding editing the code, it's kernel code involving locking which needs
> to be edited carefully, it's all confined to a single (or maybe a couple of
> functions), but otherwise yes definitely not to mess around with :)
> 
>>
>> It worried me already at the first part.
>>
>> Please, as Matt said, have a more linear locking here.
> 
> Afaiac I don't know of any other race-free way to do this other than what
> was done in v2 (and in i915). So I want to discard the changes made in v3
> and go back to the changes made in v2. If others can suggest other ways
> that which they can guarantee are race-free and correct and can R-b that
> code, that's fine.
> 
> But I can R-b the v2 code (with the only change of moving
> xe_device_mem_access_get out of the lock). (Of course I am only talking
> about R-b'ing the above scheme, other review comments may be valid).
> 
> Badal, also, if there are questions about this scheme, maybe we should move
> this to a separate patch as was done in i915? We can just return -EAGAIN as
> in 1b44019a93e2.

Thanks Ashutosh. I think for now I will drop changes for "PL1 disable 
during GuC load" from this series and will handle it in separate patch.

Regards,
Badal
> Thanks.
> --
> Ashutosh
