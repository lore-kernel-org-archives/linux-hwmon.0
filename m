Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD4EC46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Oct 2023 13:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbjJPNii (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Oct 2023 09:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbjJPNiR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Oct 2023 09:38:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD5E124
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Oct 2023 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697463493; x=1728999493;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P0CsL8xtyJQPuPDx0W8A+d8cs2QQqeArFcDTreH+0s0=;
  b=J0q1+tRDNK/8CrPtNlpLkX+usKqNXvROM4eShsIpGfBgNClVyvQnDINc
   yNxwdECUbNPpUiu6HEBmYJK+ISyp+Pihk5YK5nmJrHCjA42p9f1lngv/D
   Gznz5JgutEjWpvHZFG1oG9mKBv0OIfthV05zmbeDINYjGPzUSnvpzV9uk
   BSST27yZHza14i5ezMl7HLf0p2AvQiDfEFoky5WYjuSG0S9n76C4Hnh5s
   Zne+dx1sOzNXW9Peooj09kTBRBOnPV6bM3+OEVyc/PsC+Y4O9Oolihwlb
   PJbDFXUhVMbgkdqbRRpT/cCKeKAaoEqUaHykHmPOO4lF+AFWV/SZ5J0hh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416596254"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="416596254"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929351336"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="929351336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 06:38:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 06:38:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 06:38:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 06:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlOtCrb+CofIlax46FNnISRAe1DoxHuemkQT/BB0u0JzQ9xhI/F/eQwOicarh4wdQeRBJaJHQNlDM3p2KgJfmIM+djNCpGD3+9sT33iVjQXU9uQZwJjKwkbu7gXxVeQ1fF/Un3dV+zWVLPKzUQMVw0R3h8yBs+zvUP0vWo+RQHrXaBgFo4Dn/Z+TyLLm/e3MTc8K/daOk5Pckq3x2sHzlIQc0qSGJ6hiqkgHmSecbKHDgXm3s8L0uwsRSG+Df7Z45vmgVKE5Ea7lrx1VQTouhC2A3ZOYy0ohkr2seYyqumzl4QLU779Er2HBIHY6l5bXcrhxJmSdDfppaorj8JkZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9DJowEtGGjlOohsXHHvfUuCo/8lyq0N+usSb7GMgQg=;
 b=kRueLiqO6cPJ2Z9Sv97SDqOwFa8P7LIlJFjGWdXTyduK/RILvA7mOjNVbN4CZTEIWfSadKN/it4uXD/MJXFhUdOTvVRI7eCukuN4SCmNhfC3VT/j7UN8i2R6/6G0fboIfTbQSs40ndCrbN8DO384nWHPf8d8Hyaeepfxoi7K0Lab49GysdnCk9ZFSvftvvz/DqHJeLqFaSDonud+i9hkzGluYE8dG5G4fbTiu+0ZIMIw9d/mGMUnCSBesrWow7x3URz27j84LGjAhQs3nJrUwBWbetXXS6SJR+CcfMrrY2XuyReq0V84RJYGZtOPtUJXFQjcnSPQDP7/QDMAatDITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 13:37:59 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1506:3371:196:cc3a]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1506:3371:196:cc3a%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:37:59 +0000
Message-ID: <bcda0eff-e427-4114-8108-7f77a2c76e57@intel.com>
Date:   Mon, 16 Oct 2023 19:07:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Protect hwmon rw attributes with
 hwmon_lock
Content-Language: en-US
To:     "Gupta, Anshuman" <anshuman.gupta@intel.com>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "Tauro, Riana" <riana.tauro@intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
 <20231006170205.4136927-2-badal.nilawar@intel.com>
 <dd836c61-4576-44d6-82bd-0c743e987b58@intel.com>
 <948de785-bdb9-4d03-b7a3-548b712861d0@intel.com>
 <CY5PR11MB621149E1C191F96D9499D53E95D7A@CY5PR11MB6211.namprd11.prod.outlook.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB621149E1C191F96D9499D53E95D7A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::32) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 676c5a06-9614-4402-b38d-08dbce4d1cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emNA9I/65YGS1uuNKzOC04+j0iW9Af2I6Hn3uyC46dHW5MC8zrHyMgQdxcXsQnqy/u2UghxfLOrbPjRyNLzAepNw6wdvgqvp+H9a4GHZq4IQfXRL6zoPLXCH61qjODY8EInKQzbZyx1CQwPMljKzsIQ9Ismxx1UgTGrnOyJI2fHrE1nNgUs/vOsukPxxq1baUtT5jBStuqZmOUSomDKUUzNQrq7sxegDqJv9HIh6kKxjeWJfgWAgEwHkE2iD/CHmvtef2wh0BcVEr+aLi5sjS1mYbdlnVjVW3l2c2o8/MJZKUltI93jCJCRZb5zxqSm0xpv+826MqSaL0HqltFlNLGFCWnP0D5TA02q/osICEpi7ibimF+qqrUWL7Xav9bxnt1jN2tMT+fwKTPT4caTJyuD6eYMLZ05YYiAzSyn/tML6NHK5ldrKb3EtIJddSwjI78kcvk//C1Bgx4YiZoCTRv5nNw3VDlvQKl6nVCgfaaFBdIiI9mi4mNFVJZxZ3wrueJni7FrKgX0kgsQP9o0woRHvD7WEInxbrpJrfI8X/BUiazh2sxhi18zKJL+ZrR5Qc0diyBa9RlvNZnF6TphInasnEiI+exGURL6LMupzwwAwI0poeICk60ha06yQybPNufKTSfEo2fmrT5eMa2F7wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6486002)(110136005)(478600001)(66476007)(66556008)(66946007)(54906003)(6666004)(53546011)(26005)(6506007)(6512007)(82960400001)(2616005)(316002)(4326008)(8676002)(8936002)(30864003)(2906002)(5660300002)(41300700001)(36756003)(31696002)(83380400001)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUlRc3Fza3ozOGE1Q3N4S0p6eWF4Y0tnRHJHTHRTcC9ML2srM2xoUEhXSVY2?=
 =?utf-8?B?eWxrR2cyL0lxUWFQaVV1Zk9XeTU0bTJuazB5VmJ0ekpXMHJLTUxha0UzK1Rx?=
 =?utf-8?B?bDFWbnE1SUoxN1UvRmlvVTdsNHFlTWpIeGh0WUpRYUd0U20vTkFDSjFXV2t1?=
 =?utf-8?B?YXZEd2RmUDU2SjVud2xSWkFVTlNmRXN3SzZNclZiZ2E4OUVxbWxvbjR1YTZx?=
 =?utf-8?B?TWdRaTRjMVRzMGhVcW8vcTE5S1FLM0l1KzkwK1pGOUJwVTJpV0FJaXZaKzc3?=
 =?utf-8?B?VS8zcXJoUzBhdFdEeG41U2huWmR4QSt2Zk5Kb2J0c3Q2eE5FN3JCUzRUNnNU?=
 =?utf-8?B?V3NZL2JlaWJma2ZyZ1RkZXZjK2Q4TjducUx2cWc4cy81UW13RHVFb2FnMlN3?=
 =?utf-8?B?eEJiMlRNQ29FMEl2ZjUxRjdVczdQK3ZRcWVzT21CQlpSbFg1TjNQczJ1a05L?=
 =?utf-8?B?emVQaDRJckE4WmwyTHlwMDBlYTR1MlkvdGE2RXpRUWlra0tDTEFySFpJMU5j?=
 =?utf-8?B?cVdiZWREQ1lxcGlDblkzYm43QUZGUXV2dmorekYrcU93V04yZnlRcGNzVnpi?=
 =?utf-8?B?YnhHR3BaeS9sQ2RLMkJLOVR3Um5GS2NaTXM5blM3RXNsUFJWWUV4emkzODFQ?=
 =?utf-8?B?YmxjWnRDZkt4Yzhiak5uZmk2RnFaQWNzN0M0aHF4MnFrUExsTTNCN1pWZXJ2?=
 =?utf-8?B?aTVGMU5pVmVDL3VzRGF0bzYzUTE1QThEdktzcjRGUGpwNG41QnptSXp0dnBH?=
 =?utf-8?B?Lzg4eURuTFYrUVdzQ3owTEJ0TUVuTVpKVkZ0bTlFOEdPSTkzQ0dNaEJoMTJG?=
 =?utf-8?B?eTRVK2RBY0JDUjIrQkIxd0M1VjVtM3Vsb29NaXhKaUVmbndpalhUc1R0bG9x?=
 =?utf-8?B?WDdobHVhZXJ3UGprREVHSHNNYnpNb1RNa1ppTkxzdDJUQjBTbDNCZHlhaWhJ?=
 =?utf-8?B?c3BncmpTRFErZG5ZVWJ5R3BzQUlxbXZsU2NtZzNHbTYrc3MzREpFclhqODN5?=
 =?utf-8?B?M1A1WW9nbzZyZ2pGblVHNkd3QkMwcGhubU8vRzRTYkRUZ2VoMnBVYUdyZDN2?=
 =?utf-8?B?dzVGT0hob1cxTndYQkJiZ3I4QTI3QWVVb0VaYk9hd3JiQm5aLzBoalNlZWpI?=
 =?utf-8?B?U1M1aFp2d2JKOEkvQ3NXbW1KSXRKN0Z3WXF0NnlNdEVLZXRGbTJXeS9NalpB?=
 =?utf-8?B?WmtGN3N2bXJUcW55S29IMGowazY5NUlsckRHNDRjNnJWTnNFWkhsc25oNVE0?=
 =?utf-8?B?WVJNYkVsbVljUk93eGZSK1R6Ykp2MktTcHdSdWdPVjFOZk1BN09TMExjWEpj?=
 =?utf-8?B?Vm5BVU9kaGo0aTNNZHZiZGhmcWNGR0VHU0JMQ29sS2dsRFFiYWlEd1pwVnlx?=
 =?utf-8?B?VFJNZjBxTGl3N1BnWllKcGFBczM4QTZmMVpsL3VzQitkZDVEak5od2JZdks1?=
 =?utf-8?B?OFU1Z2hWSXFJQkxOL3B0eTRIeWxGTlpCYkFaRVlrNE00Rm1ySVNuMzUvcU01?=
 =?utf-8?B?OTJ2cHZVMFFqek45V1RtUk1DTnBmSjQrL3dYdk5RZWUwL0ZOT2VDTEZrSDhx?=
 =?utf-8?B?RE9LN0VNZWlYL0RiRVVzdXJhZFBaeThRRnlVSUMwR1FjR3p3SER3eVRHTjNl?=
 =?utf-8?B?cFp2YUcxOEZ3elhta29zM05OenJ6TFB1TlorN0NUbkNBbW83OEFBRHQxV3c4?=
 =?utf-8?B?NkU2aVRRTnFBeDFLeWFmalpJUlFUdVArT3NGdHUrZXExOHRWUGU5Z3AxQWd1?=
 =?utf-8?B?UXRmV0I0Ulh2d2cwb2FKakcvMkwwWjVuR3hDTHA4TkxpdkhMVlU3UjJKUitv?=
 =?utf-8?B?U09DZWsrS01TbGtPWUMraXZUNkk1Wmkwd21IOG9rYWNrdHROOEQwaXVSUDdF?=
 =?utf-8?B?TG9ENHREbXZhTFNOL0NCVmh5bXppVEZTTVJwSEFsN0V4c1FVRUhsNktIZmhw?=
 =?utf-8?B?STQ1VDFlQWtKTkpMdnZNOXJMcExBbXdPTmtkZ0lXa28wYVFIczVUMjg1azN3?=
 =?utf-8?B?cTZJeU4yeEJSNmdkRjZTM3A1OE5uYXd6N1BCdTRqQUI5YmdUMXZwaEhTa0dD?=
 =?utf-8?B?OEd0K25KL0E5bVBvd01qbmJGT2xTRWV4MEJHWmFjejNTL1lSc1VIWkdrTzho?=
 =?utf-8?Q?ZwvA/7Evv/62pj+n5SWtGNjk6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 676c5a06-9614-4402-b38d-08dbce4d1cbd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:37:59.6293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hljOIPcvduYXdNWcQZk4jU6fNd99CbzMhj90MZcPfgwARGKU/w6lEjAYZSALm0hIjbB6wzUrwTYZS0JHRMwJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 16-10-2023 13:21, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Monday, October 16, 2023 1:03 PM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org; linux-hwmon@vger.kernel.org
>> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com;
>> Tauro, Riana <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [PATCH 1/2] drm/xe/hwmon: Protect hwmon rw attributes with
>> hwmon_lock
>>
>> Hi Anshuman,
>>
>> On 09-10-2023 19:06, Gupta, Anshuman wrote:
>>>
>>>
>>> On 10/6/2023 10:32 PM, Badal Nilawar wrote:
>>>> Take hwmon_lock while accessing hwmon rw attributes. For readonly
>>>> attributes its not required to take lock as reads are protected by
>>>> sysfs layer and therefore sequential.
>>>>
>>>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_hwmon.c | 143
>>>> +++++++++++++++++-----------------
>>>>    1 file changed, 71 insertions(+), 72 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c index 9ac05994a967..391f9a8dd9d7
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {
>>>>    struct xe_hwmon {
>>>>        struct device *hwmon_dev;
>>>>        struct xe_gt *gt;
>>>> -    struct mutex hwmon_lock; /* rmw operations*/
>>>> +    struct mutex hwmon_lock;    /* For rw attributes */
>>>>        int scl_shift_power;
>>>>        int scl_shift_energy;
>>>>        struct xe_hwmon_energy_info ei;    /*  Energy info for
>>>> energy1_input */ @@ -95,47 +95,45 @@ static u32
>>>> xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>> hwmon_reg)
>>>>        return reg.raw;
>>>>    }
>>>> -static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
>>>> xe_hwmon_reg hwmon_reg,
>>>> -                enum xe_hwmon_reg_operation operation, u32 *value,
>>>> -                u32 clr, u32 set)
>>>> +static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
>>>> xe_hwmon_reg hwmon_reg,
>>>> +                 enum xe_hwmon_reg_operation operation, u32 *value,
>>>> +                 u32 clr, u32 set)
>>>>    {
>>>>        struct xe_reg reg;
>>>>        reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>>>>        if (!reg.raw)
>>>> -        return -EOPNOTSUPP;
>>>> +        return;
>>> Don't we need to report this as warning?
>>> What is possiblity of code path landing here.
>> Warning is added in xe_hwmon_get_reg when reg is invalid. Warning is not
>> needed when reg is not supported by platform. During runtime code path will
>> not fall here as visible functions are taking care of creating hwmon entries only
>> if regs are supported. So it doesn't make sense to add warn here.
>>>>        switch (operation) {
>>>>        case REG_READ:
>>>>            *value = xe_mmio_read32(hwmon->gt, reg);
>>>> -        return 0;
>>>> +        break;
>>>>        case REG_WRITE:
>>>>            xe_mmio_write32(hwmon->gt, reg, *value);
>>>> -        return 0;
>>>> +        break;
>>>>        case REG_RMW:
>>>>            *value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>>>> -        return 0;
>>>> +        break;
>>>>        default:
>>>>            drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg
>>>> operation: %d\n",
>>>>                 operation);
>>>> -        return -EOPNOTSUPP;
>>>> +        break;
>>>>        }
>>>>    }
>>>> -static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>>>> -                       enum xe_hwmon_reg hwmon_reg, u64 *value)
>>>> +static void xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>>>> +                    enum xe_hwmon_reg hwmon_reg, u64 *value)Isn't it
>>>> possible to pass len of void * value to xe_hwmon_process_reg()
>>> so we can wrap this fucntion in xe_hwmon_process_reg ?
>> Yes its possible but I feel it would be more useful if there are regs of variable
>> lengths i.e. other than 64 or 32 bit. As of now hwmon regs are
>> 32 and 64 bit lenghts so I prefered 2 separate functions. If you insist I will
>> wrap.
> Another thing do we have any consumer of REG_WRITE, I don't see any caller (it is a dead code), considering above there is no real benefit of keeping the abstraction with
Yes REG_WRITE is not used, I will remove it.
> xe_hwmon_process_reg() and hwmon_process_reg_read64(). If keeping hwmon_process_reg_read64() is simple then it is defeating the purpose of
> xe_hwmon_process_reg().
I don't completely agree on this. hwmon_process_reg_read64 is looking 
simple since it handling only 1 operation i.e. read64. Considering it 
may get scaled in future I should have writen it as 
hwmon_process_reg64() and pass REG_READ64 operation as argument.
> IMHO the only benefit xe_hwmon_process_reg() provides scalability for future platforms like forcewake is needed,
> if intention is to keep it simple then Calling  xe_mmio_{read32,  read64_2x32, xe_mmio_rmw32} directly is much simpler than having multiple wrappers ?
You mean use
xe_mmio_{read32,  read64_2x32, xe_mmio_rmw32}(hwmon->gt, 
xe_hwmon_get_reg(hwmon, hwmon_reg)); ?

Regards,
Badal
> 
> Br,
> Anshuman Gupta.
>   
>>
>> Regards,
>> Badal
>>>
>>>>    {
>>>>        struct xe_reg reg;
>>>>        reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>>>>        if (!reg.raw)
>>>> -        return -EOPNOTSUPP;
>>>> +        return;
>>>>        *value = xe_mmio_read64_2x32(hwmon->gt, reg);
>>>> -
>>>> -    return 0;
>>>>    }
>>>>    #define PL1_DISABLE 0
>>>> @@ -146,16 +144,18 @@ static int
>> xe_hwmon_process_reg_read64(struct
>>>> xe_hwmon *hwmon,
>>>>     * same pattern for sysfs, allow arbitrary PL1 limits to be set but
>>>> display
>>>>     * clamped values when read.
>>>>     */
>>>> -static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
>>>> *value)
>>>> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
>>>> +*value)
>>>>    {
>>>>        u32 reg_val;
>>>>        u64 reg_val64, min, max;
>>>> +    mutex_lock(&hwmon->hwmon_lock);
>>>> +
>>>>        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ,
>>>> &reg_val, 0, 0);
>>>>        /* Check if PL1 limit is disabled */
>>>>        if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>>>>            *value = PL1_DISABLE;
>>>> -        return 0;
>>>> +        goto unlock;
>>>>        }
>>>>        reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val); @@ -169,14
>>>> +169,17 @@ static int xe_hwmon_power_max_read(struct xe_hwmon
>> *hwmon,
>>>> long *value)
>>>>        if (min && max)
>>>>            *value = clamp_t(u64, *value, min, max);
>>>> -
>>>> -    return 0;
>>>> +unlock:
>>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>>>    }
>>>>    static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long
>>>> value)
>>>>    {
>>>> +    int ret = 0;
>>>>        u32 reg_val;
>>>> +    mutex_lock(&hwmon->hwmon_lock);
>>>> +
>>>>        /* Disable PL1 limit and verify, as limit cannot be disabled on
>>>> all platforms */
>>>>        if (value == PL1_DISABLE) {
>>>>            xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
>>>> &reg_val, @@ -184,8 +187,10 @@ static int
>>>> xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>>>            xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ,
>>>> &reg_val,
>>>>                         PKG_PWR_LIM_1_EN, 0);
>>>> -        if (reg_val & PKG_PWR_LIM_1_EN)
>>>> -            return -EOPNOTSUPP;
>>>> +        if (reg_val & PKG_PWR_LIM_1_EN) {
>>>> +            ret = -EOPNOTSUPP;
>>>> +            goto unlock;
>>>> +        }
>>>>        }
>>>>        /* Computation in 64-bits to avoid overflow. Round to nearest.
>>>> */ @@ -194,19 +199,18 @@ static int
>> xe_hwmon_power_max_write(struct
>>>> xe_hwmon *hwmon, long value)
>>>>        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
>>>> &reg_val,
>>>>                     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>>>> -
>>>> -    return 0;
>>>> +unlock:
>>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>>> +    return ret;
>>>>    }
>>>> -static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
>>>> long
>>>> *value)
>>>> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon
>> *hwmon,
>>>> long *value)
>>>>    {
>>>>        u32 reg_val;
>>>>        xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ,
>>>> &reg_val, 0, 0);
>>>>        reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>>>        *value = mul_u64_u32_shr(reg_val, SF_POWER,
>>>> hwmon->scl_shift_power);
>>>> -
>>>> -    return 0;
>>>>    }
>>>>    /*
>>>> @@ -235,10 +239,6 @@ xe_hwmon_energy_get(struct xe_hwmon
>> *hwmon, long
>>>> *energy)
>>>>        struct xe_hwmon_energy_info *ei = &hwmon->ei;
>>>>        u32 reg_val;
>>>> -    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>> -
>>>> -    mutex_lock(&hwmon->hwmon_lock);
>>>> -
>>>>        xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
>> REG_READ,
>>>>                     &reg_val, 0, 0);
>>>> @@ -251,10 +251,6 @@ xe_hwmon_energy_get(struct xe_hwmon
>> *hwmon, long
>>>> *energy)
>>>>        *energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>>>>                      hwmon->scl_shift_energy);
>>>> -
>>>> -    mutex_unlock(&hwmon->hwmon_lock);
>>>> -
>>>> -    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>>>>    }
>>>>    static const struct hwmon_channel_info *hwmon_info[] = { @@ -284,6
>>>> +280,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32
>>>> uval)
>>>>                      uval);
>>>>    }
>>>> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon,
>>>> +long
>>>> *value, u32 scale_factor)
>>>> +{
>>>> +    int ret;
>>>> +    u32 uval;
>>>> +
>>>> +    mutex_lock(&hwmon->hwmon_lock);
>>>> +
>>>> +    ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>>>> +    if (ret)
>>>> +        goto unlock;
>>>> +
>>>> +    *value =
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK,
>>>> uval),
>>>> +                 scale_factor, POWER_SETUP_I1_SHIFT);
>>>> +unlock:
>>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon,
>>>> long value, u32 scale_factor)
>>>> +{
>>>> +    int ret;
>>>> +    u32 uval;
>>>> +
>>>> +    mutex_lock(&hwmon->hwmon_lock);
>>>> +
>>>> +    uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
>>>> scale_factor);
>>>> +    ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>>>> +
>>>> +    mutex_unlock(&hwmon->hwmon_lock);
>>>> +    return ret;
>>>> +}
>>>> +
>>>>    static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long
>>>> *value)
>>>>    {
>>>>        u32 reg_val;
>>>> @@ -317,23 +345,15 @@ xe_hwmon_power_is_visible(struct xe_hwmon
>>>> *hwmon, u32 attr, int chan)
>>>>    static int
>>>>    xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan,
>>>> long
>>>> *val)
>>>>    {
>>>> -    int ret;
>>>> -    u32 uval;
>>>> -
>>>>        switch (attr) {
>>>>        case hwmon_power_max:
>>>> -        return xe_hwmon_power_max_read(hwmon, val);
>>>> +        xe_hwmon_power_max_read(hwmon, val);
>>>> +        return 0;
>>>>        case hwmon_power_rated_max:
>>>> -        return xe_hwmon_power_rated_max_read(hwmon, val);
>>>> -    case hwmon_power_crit:
>>>> -        ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>>>> -        if (ret)
>>>> -            return ret;
>>>> -        if (!(uval & POWER_SETUP_I1_WATTS))
>>>> -            return -ENODEV;
>>>> -        *val =
>>>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>>>> -                       SF_POWER, POWER_SETUP_I1_SHIFT);
>>>> +        xe_hwmon_power_rated_max_read(hwmon, val);
>>>>            return 0;
>>>> +    case hwmon_power_crit:
>>>> +        return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
>>>>        default:
>>>>            return -EOPNOTSUPP;
>>>>        }
>>>> @@ -342,14 +362,11 @@ xe_hwmon_power_read(struct xe_hwmon
>> *hwmon, u32
>>>> attr, int chan, long *val)
>>>>    static int
>>>>    xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan,
>>>> long val)
>>>>    {
>>>> -    u32 uval;
>>>> -
>>>>        switch (attr) {
>>>>        case hwmon_power_max:
>>>>            return xe_hwmon_power_max_write(hwmon, val);
>>>>        case hwmon_power_crit:
>>>> -        uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT,
>>>> SF_POWER);
>>>> -        return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>>>> +        return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
>>>>        default:
>>>>            return -EOPNOTSUPP;
>>>>        }
>>>> @@ -372,19 +389,9 @@ xe_hwmon_curr_is_visible(const struct
>> xe_hwmon
>>>> *hwmon, u32 attr)
>>>>    static int
>>>>    xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>>>>    {
>>>> -    int ret;
>>>> -    u32 uval;
>>>> -
>>>>        switch (attr) {
>>>>        case hwmon_curr_crit:
>>>> -        ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>>>> -        if (ret)
>>>> -            return ret;
>>>> -        if (uval & POWER_SETUP_I1_WATTS)
>>>> -            return -ENODEV;
>>>> -        *val =
>>>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>>>> -                       SF_CURR, POWER_SETUP_I1_SHIFT);
>>>> -        return 0;
>>>> +        return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
>>>>        default:
>>>>            return -EOPNOTSUPP;
>>>>        }
>>>> @@ -393,12 +400,9 @@ xe_hwmon_curr_read(struct xe_hwmon
>> *hwmon, u32
>>>> attr, long *val)
>>>>    static int
>>>>    xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
>>>>    {
>>>> -    u32 uval;
>>>> -
>>>>        switch (attr) {
>>>>        case hwmon_curr_crit:
>>>> -        uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT,
>>>> SF_CURR);
>>>> -        return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>>>> +        return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
>>>>        default:
>>>>            return -EOPNOTSUPP;
>>>>        }
>>>> @@ -420,8 +424,6 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon,
>> u32
>>>> attr, long *val)
>>>>    {
>>>>        int ret;
>>>> -    xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>> -
>>>>        switch (attr) {
>>>>        case hwmon_in_input:
>>>>            ret = xe_hwmon_get_voltage(hwmon, val); @@ -430,8 +432,6 @@
>>>> xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>>>>            ret = -EOPNOTSUPP;
>>>>        }
>>>> -    xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>>>> -
>>>>        return ret;
>>>>    }
>>>> @@ -565,14 +565,13 @@ xe_hwmon_get_preregistration_info(struct
>>>> xe_device *xe)
>>>>        struct xe_hwmon *hwmon = xe->hwmon;
>>>>        long energy;
>>>>        u32 val_sku_unit = 0;
>>>> -    int ret;
>>>> -    ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>>>> REG_READ, &val_sku_unit, 0, 0);
>>>>        /*
>>>>         * The contents of register PKG_POWER_SKU_UNIT do not change,
>>>>         * so read it once and store the shift values.
>>>>         */
>>>> -    if (!ret) {
>>>> +    if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
>>>> +        xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>>>> +REG_READ,
>>>> &val_sku_unit, 0, 0);
>>>>            hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT,
>>>> val_sku_unit);
>>>>            hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT,
>>>> val_sku_unit);
>>>>        }
