Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA71CE7A89
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 04:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjIYEHp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 00:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbjIYEHo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 00:07:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFC99F
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Sep 2023 21:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695614857; x=1727150857;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uEaOdGuKaf+8ITXYeZowUidXhZpjRb9+cdceH+wQ7E4=;
  b=G5s/JKOXpEUII7sO0ZUnTZowxG3JnJyeWSTD5ptOmq4AlcJVkB5S8WSx
   +TlSDVsOcu2ujwMSUGy8KtDrEpwmMnC/xWpa7K+BSOTpFtVzIo2pZ95rv
   cVS3bs2ks+8JV4kHQO4p05U89jrnwJVXJ9o6qm/De8/5+OYxvF3weq4EB
   +278uh7gs/z97akDNTjt3/90g1mkjCcZoZ76zBOfJ0GkgzvhJVOSAnsx3
   F4LnB6lZP6PGz4nGYc9BrUrAqCnvnXULT71e6kOyg47utJL05U9CNOwT3
   x4eCXcD1uBxbxwuE/VDXm1laWuMTv351ahLZ2R1eQ0711hHHV6uTlJWbW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378430900"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="378430900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 21:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751525671"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="751525671"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Sep 2023 21:07:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:07:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 24 Sep 2023 21:07:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 24 Sep 2023 21:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1MnUo/K4tOQCYnQWgvHtEYQVlnfwqGxkuFYHbczfW6yj5qYEy9tszAVJogfgUTwQspBu+jUyOK7twBhE3NUIzvgkgWiKnyzD2sOpyMsnvz3PHL0Y7yTKIBFYnbh0/eAGDgQcV8EIAWNkwTc7lAuYiP5NK60t7NUzzMOC5byFekDEmzjTIGrPzVyZHliIHr7E/xoUD9JE9RqlWwhSa5NkAR3okYyecCRu98P+n08hTu2lmARCUf1oHND9R+hP8e8MCLnCtpRxCSq8YFvKVHFvfxvnQSPr+pz3wKiSl95kUmQthXSPuasUepaiTdtm8Urd+7n3bc66OfqKbHVBJgBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jvn+r+RSCKNj0EUXzcGM1rjLW5M1NXtTOcsMGke8JB0=;
 b=AYsPDEAMhLjhYFlC0y1rnwTkEXAnYlHbuxP0HKFAJXOxu+Ctl3ckqPy0Iirz+bqQSoz9OC+93JOx8YQoYbaRN2cRkbQB1P01Nnr7BnPhhVAgHU2p0aqF1YdkdZOBNlg8ToGmrNPWhU8itQuoZ7kYkcggKU+Jb3/IQGRGogFkxDKWP7z/gqaLmtIGYBvD6Yk7VDiK2DIF1AbpY49IQ1WcAOOZ5t5PHiNysq6OQFpc5lcbHgx8UEVwk0q5LR/99wmY/6+KgqDX640R0IHi+QriH1bXlDyUC7KGW/hKPHORmvJE8bNJ3fvP7Ge8tDjhw9WvvFfMPzOZpRTgpvRGT1oM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 04:07:33 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 04:07:33 +0000
Message-ID: <8254a87c-6723-8335-5a41-f4dfe1d95481@intel.com>
Date:   Mon, 25 Sep 2023 09:37:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Content-Language: en-US
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com> <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
 <ZQ3lGKm+6bjBIskp@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZQ3lGKm+6bjBIskp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da0e217-0871-4812-f48d-08dbbd7cf1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUW9f+hqQw/549t4Ckdan/XfORloN4A3RiFvIIPXLDW+I1wY6t0ooLnaHF00LEdv8qsbeUx3jstxoEjguA7ryztExPSE0mf6Ku4pJEElIGun6bsH3kmwUTrEt3TOOKAlasc+JiJPp6UHfMecjOMYG2z5GOFBEQrlWwEgkhea/MdL18Icb0eTSF4L3S+Jm/UrZthIOMBMnnlJt+d0Xc5oMEQvrsR3+nIpEs9QZRXWI0eEqAxKLRkQ1b4j6cv40Pz99IEfowqVnt1W4gx+w9CIGnN+dHDyaL7c9PjKdL87YpZQ+Om8ZTkzqjpacLhZilLMRxxqlp8TB+zYU9VkRXJTjOLdaRQqEf9HtAbyejgtgyck8sMi558T/M94PB0ERgh4WLBExnhd+HS1kkZLWh/CmuHr2k8zgyF5BmTFsdmmMjO5G80HJSerrVr+1Rmgi39EmFaVIH+xW/WV1J2mByNbwZK1cIfsine4+8jzDfLu4+4Yd7ev8p4mAPPgr1r6RBanSk//5Ei6E9WAgrjlCoJNjPtqmrja53g0OuNHTyAAkAVo/QcfRCyx7QKjPNrtYyp8Vf/ElkcIDksMMaYiS878grJhRXBDkfk3krSexgi2LoBKxkuXHpkM/Y4QC3UoYASeXMQBRg/8cNCDYlsM15YANg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(316002)(41300700001)(31686004)(66556008)(66476007)(66946007)(110136005)(6512007)(8936002)(8676002)(2906002)(4326008)(478600001)(26005)(6666004)(5660300002)(6486002)(6506007)(38100700002)(53546011)(83380400001)(36756003)(2616005)(86362001)(31696002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWxpdmVhbENvckQxMDBqMWErYmkvdkdxVUFRd3l4N1Y2elNQcTJuUVJjSlZC?=
 =?utf-8?B?ODZQYlF5QnJJQnY3dXpsdHVNK1c4WGo4cmRrcFZsenlwOTdWWlI3RG5qaUxa?=
 =?utf-8?B?MDU5TFZmQmEwd092NmxBYmpaRVdZWmp3NTF4ZnlUNjlMQm1ZclJDOGc0bk1G?=
 =?utf-8?B?L3I4RXJybkRJTVlEZDE1d2JLR1R6V3FCMWRBSWlBYXBXVlNFUUVhdUs1UUN1?=
 =?utf-8?B?Tzk5K1lmRmtjN1pWeHlpQVZwL2NwRlQwczRDQ28rbU5PL2xkN3pCeFpjd285?=
 =?utf-8?B?Y2pWaEF3bndTMmdLNElDMHdXTm96djdEeFdjYWluT3ZKbzBuWXBJQThjQ2Nq?=
 =?utf-8?B?VlllU3RTOFJ2V0pjOEl2QkZBb2R2emJLd2djM09kanl5MXF3NkFjalNXWnd1?=
 =?utf-8?B?Vm5rWjUrUTRmK1N5YjF5TzY4cXU0dWdkdi8yUVlna3pWMFArYVpmY09HTGg2?=
 =?utf-8?B?ZnptUSthaTlBYWEzTHlzMEszYUpBcUVpNWFyNjhtU1RFa2FjL1RVTFEwWWhT?=
 =?utf-8?B?dGhDZlJSYlRSek5GQS9QSUFzcHdKUFE0RlBHWmRRWE52eGxpaFhzdkFmZ3Z2?=
 =?utf-8?B?TjJrK3IxZW92cVB4SkpWREpYYTJSZ0g4aFJPSmdMRE8xZnViM3RXM3k1djgz?=
 =?utf-8?B?WkkrTnFBUVhjU1pNSjF5bGJiZW04QzhWN0l5emhxRmNJc1FWeUZCWVVEdmtt?=
 =?utf-8?B?UzYrcEpkMUhkaCt6VmZ0V3NJbXFmMitXbnZFUVd2TmZ3eHNmbkdydnUxcjBu?=
 =?utf-8?B?bDhjaTRQcVhzWm4xUjBjTHpNbjU5eE94U3I3UVRZaWJyb1ZIbThseFl6RWJy?=
 =?utf-8?B?YkhBQkJKeGVhdE1nZ2szbkVGZVFLYWZMNmMxdCtoMytMd0xTa2ZaZVhkYkZw?=
 =?utf-8?B?djRPSFZ3c3I4blVvbmU5Yy93cTNhcmZsQlJDZkQ1cnRURlBJZjZud09iNnor?=
 =?utf-8?B?NG5ROWNDeS93cW03OE9TSzhjd3I3N1c3WnNrSVY1bjZRSlJGVmZteXQ1dklz?=
 =?utf-8?B?V2wrSFpZdW5DM04rbVhldFdRQklEQTFzc3dwOTNyRG1SR3RtUlBTdjVZSTlB?=
 =?utf-8?B?RlFHanFzZm1oK0ZucGpIbHBhRGhUZ0NZVDhGMnJ3WCszTWZhL0FpTStqTlRx?=
 =?utf-8?B?NHdwMStETnVtVjZPeUI3K1F2ZDhseDNZYmRLRjJlNWM2VWNUWmdOdUdKSzFF?=
 =?utf-8?B?TEZIZk0xVUluOXNkY1EyQkJKYVpuRzZOdU9zV0Q4dDRQcXAzQ1k5a2g4N2l2?=
 =?utf-8?B?cFNNUDJjZ1pFNjlzRFB0WDUxb1VYbUpLMC94amM0MzdMVjArMU02akg4aVBq?=
 =?utf-8?B?RkZqZG53MEpORDhrcFlJTVNEdDNHUnlqeUVyRUQvblZmT0VPNVJlZ2R2MWNR?=
 =?utf-8?B?cXFMMGNqL1ZSUFFyOUdoZU85Y1ZMcFBpZnB2NFozTVdWbHd0QklOSFdlUERS?=
 =?utf-8?B?V1JYdHB2RHlrTkc0NVdIT25wbmh1dk9DbUZMU0xUZVRMK1pGVEI0WGFXOGdu?=
 =?utf-8?B?VDVPd2wxRHNqU2JvMDlKYnhKNE9RdEppTVRra2VON1k5U2tydWRUVDZocVd6?=
 =?utf-8?B?QWdLbWxTdE8ycDhNT2NreFlHck9TQzFYTm5lOFhPd0RCMFg5KzduOXBHRmgy?=
 =?utf-8?B?aHlOMFlTVGlFcFdpcTdyT1pFOGVnWW1MdmQrN3FmNFg2L2xGYjhvME5oZjI4?=
 =?utf-8?B?SE5ESzhCZ09TUmp5UWEvTncvbHNZdXZmdFN4dVBjSlE1WnQxWldtK1dHL3VW?=
 =?utf-8?B?THpqeWw2YTZGbk52eGJ6N3NRQ2pYanFTVUdRbDhGSmhNZndxZXNvVVQyK25Q?=
 =?utf-8?B?bnJoWDZFL2pIRWdSL3dPQnJiYUxCQU9YUzV6b3JERnhJMWZFcmVlM2k5UUVL?=
 =?utf-8?B?WnBzTkkzZ3VUWjltbnlhZG1JK3VVck8vTXYyLzlpVTF4Mms2SDZZTEtrTXR6?=
 =?utf-8?B?TFJxdkwrZzFTQjRiMnlTUU5PWmxwb1BKbHhhaHJmYW8vS1h0QUw0OEI0THJm?=
 =?utf-8?B?Z2hCa3hUd0IweDMxdE9xL0Z6UkVMa01ySHN3Qjl3TjFLU3UxVEFKNUliZlZG?=
 =?utf-8?B?N2s2UGFLeGswK3Roc1hES3RuRldKMVRpVkx5MFYzSjR0SFNVajRQWkovZTZ6?=
 =?utf-8?B?cE43c2JuNHJRNWRJWitacmMrWTdRUS9sb3E2dWpmc1BXdDc5STBnNGlBdFM0?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da0e217-0871-4812-f48d-08dbbd7cf1a6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 04:07:33.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA5dAFUaQz3SpfWLBA7bxldCtXoKNw3jDKbG5qI/74qEIpQFZeu/7T6hMDXUG2r3VLXWEN61hOG8rUoA2tTClw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 23-09-2023 00:33, Rodrigo Vivi wrote:
> On Fri, Sep 22, 2023 at 05:16:23PM +0200, Andi Shyti wrote:
>> Hi Rodrigo,
>>
>> On Thu, Sep 21, 2023 at 12:03:26PM -0400, Rodrigo Vivi wrote:
>>> On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
>>>> Add XE_MISSING_CASE macro to handle missing switch case
>>>>
>>>> v2: Add comment about macro usage (Himal)
>>>>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_macros.h | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>>>> index daf56c846d03..6c74c69920ed 100644
>>>> --- a/drivers/gpu/drm/xe/xe_macros.h
>>>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>>>> @@ -15,4 +15,8 @@
>>>>   			    "Ioctl argument check failed at %s:%d: %s", \
>>>>   			    __FILE__, __LINE__, #cond), 1))
>>>>   
>>>> +/* Parameter to macro should be a variable name */
>>>> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>>>> +				__stringify(x), (long)(x))
>>>> +
>>>
>>> No, please! Let's not add unnecessary macros.
>>
>> it's not a bad idea, actually... in i915 we have the MISSING_CASE
>> for switch cases with a defined number of cases and print
>> warnings in case none if them is the one inside the switch.
>>
>> It's so widely used and actually nice to have that I thought many
>> times to move it to some core kernel libraries.
> 
> to be really honest, I also liked the MISSING_CASE in many occasions.
> It is useful for platform enabling so once we add a new hardware we
> ensure to get some splats on the first power-on and can easily
> identify the missing cases.
> 
> But even in i915 I have already seen some miss-usages of that.
> And i915 is full of i915isms that we believe it is good but we
> never tried to move to core kernel or when we tried we got some push
> backs showing that that is not very common and desired way.
> 
> I know, just looking around Xe is also starting to get Xeisms,
> but I'd like to avoid that as much as we can. in this case here
> it is only 2 lines that could be a standard drm_warn or similar call.
> 
> I don't believe that it is worth adding a macro for this. So, maybe
> if we really want this the right approach is to move the i915's one
> to core kernel and then make Xe to start using it.
Agreed, for this use case I will also prefer to go with drm_warn.

Regards,
Badal
> 
>>
>> Andi
