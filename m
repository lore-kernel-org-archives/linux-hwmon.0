Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29127E8FDD1
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Oct 2023 06:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjJDGn0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Oct 2023 02:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbjJDGnZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Oct 2023 02:43:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A340AF
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Oct 2023 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696401802; x=1727937802;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7bHS/ph/+6NAtyhQR2adJEbj6otedZdNgFhrbSamwfU=;
  b=N7g84cJHHm9VHdRMsCDuWF+ObGFeow23MR3lL8il99TrGFinRICgHAWI
   7z7eLHNYe7vMTkxurQ9jxCQMKl6psgkYvZ293qTDEl29zX7/uFTSshwrq
   zRyVjMqwVIN1EaXAlmFeuC0ZxxtRXN3DO4mffCJCk8GJjb+xfvyWP4CQa
   C+ix9bSpNdXaefn0e4KWr8grtWkCIOQqOsQMkCdfha4hoF/EiK32XW5fs
   cEp9AjRsNfEESeQe8EWXRKsWtqyu8BGwNccX+8aF8LzhNoAdiP3lgkuHh
   qqT31IWclHSWH7T2/n3niZXl7GdRnQ2rhFPWwF1uiJ+DDUzhf8H9+e0my
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="469347451"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="469347451"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 23:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727894272"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="727894272"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Oct 2023 23:43:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 23:43:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 23:43:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 23:43:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 23:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjAmyeiu3oHMkD0dYhLET0AJ23MjEIQv+pQF2VrmQalYMvAU3gOm5vgSLi4op3a+Ms5l2vQGIsHqon6pIoBfpItZMxVu4mHRD89HipccCue2LvFs/6zMA36N5KUtGQ1YQXzZba2Cz/MteHgRufhovGA30Jv8X5Orn+fSeAVeM3gFoeTCQU3USGyLS5ijXRA0eCaa2X5Wi/hixxh0v33EfDUEie9CJNb9ZCPZIXGCfHrHiH6+TeVsBbN9FosYOS7qzK3H/G0498hVGWFiHfP43B/qdjtWhSapl1WyI5G6ITCU0EQRSN8r2RCyJnAuZDoXwftzomXVinu7zYLMjwEX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV8VlKymgtsV/2bSAzYvY/QfWxzbzN8i/uX4FwKC9aY=;
 b=XKITN6CRlVLo3Na6m5XipihpHqxGKmd5RohhNUiWwhKmHTjidYa7Dtk1qTKbMlHz2n0DSbyDzR7QEChSKcg16p+dCt9CV2AKJGXgtuz5P/ZchZ2mgIhSv+6eFWl8uHLgn5VrNUWgBcIOq288+UJLg8mJdMUsh1El6NZdhCYGHos6pVkXo6zch5yDbXXwBEH824QTjEFz9crOq+BN9kqTnFd0DblLMccHwqypVL4xr6kSN9R6FQE4JMiyAt2pJ9DgXSdp9S67cLd5cHpg7kqY4qgYNbeQNN+Ydqn7qR/SfR8ngxbg3bBPB4/tw5kyK/eZnXmefH735w0uinXnctqvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Wed, 4 Oct
 2023 06:43:18 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 06:43:18 +0000
Message-ID: <fa566c3c-ea7b-967e-b7ee-868317431140@intel.com>
Date:   Wed, 4 Oct 2023 12:13:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [PATCH v6 1/5] drm/xe/hwmon: Expose power attributes
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC:     <linux-hwmon@vger.kernel.org>, <linux@roeck-us.net>,
        <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Matthew Brost <matthew.brost@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-2-badal.nilawar@intel.com>
 <874jjg1ak6.wl-ashutosh.dixit@intel.com>
 <84b5dc30-6b27-caf0-6535-c08f6b7e8cd0@intel.com>
 <87ttreucb0.wl-ashutosh.dixit@intel.com>
 <c366920b-ec67-f5be-4b17-ae1be82bdae9@intel.com>
 <87r0mhncwr.wl-ashutosh.dixit@intel.com>
 <87pm20odx9.wl-ashutosh.dixit@intel.com>
 <87jzs3ryxh.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87jzs3ryxh.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: f7febd01-15bf-4dc9-1160-08dbc4a530ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rTOHilDRKmvJd046OgpnILraQJLt5ISjnbel8CA0sHUeDr6MMM8x4ePMqByHoCv3Kb0WZu+VckRJFEQpl+jCjwwgR+E/Gux/p5ch11S5e0n5wPg35nXS3CyPbCTpikCkV7570RYsZLmnRtnFD7Eq3uwCKo4kLAbfrj+zj1JDyLY39txOXI3kzRWB7OAdSoOseG1BLwcyHFdSH5dTq2NYL45FQv0KsFwoXN/5Ot1iFywwMo9vCkNH/YY11hZX/e/aejNg/88iiCrinxrRNhttcE1GB1Vs5LA8KTUJf0Mb3GszYwHM1WG08J8AZiVKIddVaDUEbxWEnwwRIIJPj3sDw0Sy8BZG2JoxPQqmAarMn88P+cYsZdoOqPvLSZi1BNqVtjcFWW+5naU+dArn6vvZZwZmdq68EUGkLVWNxE+k8NKxxpA2/mCV8au3JTrF5EuTjcMSJeRMBxdpRTeUDjBnhG/tCTpQ5gSMLH1xZM0YM9BRVlUSwZx+sFVNTdeXyapqKO/l2h2D63Yc68g76ouhQZ5ynCkR+AlrmTX2PMYGHIi4ERoa3jc+60vpIH09SZX/1Bbq3cpb3xmbxyskMjfoLPEhCVVktj8QYAC8c5rUX1toNX4LcDxvdL8YHEcgpPqrsAjTtvn81Uf4/n7MNmG5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(31686004)(2616005)(53546011)(6506007)(6486002)(83380400001)(38100700002)(86362001)(8676002)(26005)(6512007)(41300700001)(31696002)(36756003)(2906002)(66476007)(107886003)(6666004)(316002)(66556008)(4326008)(6862004)(8936002)(82960400001)(54906003)(6636002)(5660300002)(66946007)(37006003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDM0SFdSRDNwaWJkK2c3UlRaNVRON2wwTHVIMWNnZE5wMUtlVEhBSGhqTHY1?=
 =?utf-8?B?WHUxZ1Z4ZlZaOExrR09TT3ZPM2lSbCszM0RyRVFZYmJCSlArRWZqTjJyTHN2?=
 =?utf-8?B?R0w4ZXkxOGpyUlRMN3Z1dTdscFhWT0FwVC8xOERzK3RiM2VZbk5hSlloR0hP?=
 =?utf-8?B?QTNvUkNTYkJQWWRsbU8rRUxvSzJKR3BhcDI2d2ZVV3JoOHpOU2kydEZxRStw?=
 =?utf-8?B?TnUxZTVMdUs4L3VSRjRkQTZMUkoydExwQjNDaDV1S3FidXV4bUlsdkdqbTli?=
 =?utf-8?B?ZzNOM0wrbkkzUFdpZ2tiR08rRkRvYVZvWW1vTW1jKzQyZ1Bkb2kweXhxL1Er?=
 =?utf-8?B?Qkt1YnBSL1Z0d1M2VWFzZm1zQURCcmFjZGZndXFQVndGRUNyOG9xRHN3RjJW?=
 =?utf-8?B?SFg0azZENU9sVC9OT0FuWEYreWJjVVZqejBHOE11MlJlWldUYjhLaGo4dnQ4?=
 =?utf-8?B?NjE4aVVzOEFBRVlxK3VJb1hWRFNvRkxQZS96TGxMbVl2RGFNUFo4OEgwZzhK?=
 =?utf-8?B?KysramNmL2RGRzFaSzZIbmdFTE82R00zM1N1Yno0d0lHSDc3eE9sNHFycTJZ?=
 =?utf-8?B?N1dkeXJsenZjUTdaT1NCdEJZQy9PbTJaZGhYWnpkQmVBR2ZNUVdqdXV6UjVB?=
 =?utf-8?B?Wko0M0pKMFdiTEtUeUlKNWJPdTZjc2twOHRjZEZEbVNWUGZCTm5QTnJaNXA5?=
 =?utf-8?B?LzEvMnQ3V0lkOXhiMXFaMDhiSjMyekI3OW85c3N6ODdyZ29RQ2d0aVhCYzEr?=
 =?utf-8?B?dFpJVHkwbWh2ek1hek9XYWtUS3VyRC9hdFhwc1o4U1lBcUlOcys1aWR5Z3Qv?=
 =?utf-8?B?VU5NSVkxR2dVS2VYTDU2QzBnUjNOemhrREJCUTNsOW92ZWcwNUpiYVB0OE0r?=
 =?utf-8?B?NzU0NFIrWm5mZmRmcWhJckV3VGVHZGtDcjFrd2xhOGE3c01iZ29FelQyWnVI?=
 =?utf-8?B?M3NiWHN1cE5YUHJwVkhFRnhXamtRcWtzSzdWbmw0OUpNbHV0QmpFMFdiQ1FP?=
 =?utf-8?B?OHNPclpReklhbXNUSmZqYzNpNGRzMzF0d2pNMHo5ZDJLd3Zka0kxUStEeEw3?=
 =?utf-8?B?cWVMNzBocDhlb3FETE1tY3MrMnVDbkRicXFNTWdoVXU2Zno5MWhLV1d4Ylh5?=
 =?utf-8?B?MlRlN2xiM3g3SE9MWGRrRGQ5VEtYM3RvVGlWQnB2SThYSkMyWkVKaUdXdVF3?=
 =?utf-8?B?ekVicG1icVA1R3hiV2p0N2o2Ulo2NmQzUDNQMnNISDRhajFPcE1JN0pHUFYz?=
 =?utf-8?B?RTR1cGxYVnoyWWxZakI1dWJYR000ZGk2dDhvTnVyMTE2b2s3QWhjR1plUGVq?=
 =?utf-8?B?elRvOUVBVFBCZ1k4enAveTJmYUI5T0Fsb3ViZGdscytwbFpNb0c4c3NEczU5?=
 =?utf-8?B?SE1OYU5XMGJBLzZ6RVorbkczUFNobUVYNWsvVFFvblhYTExGVFBUcTBPc3o2?=
 =?utf-8?B?TlZ3OXNRVFdFaHc3Yjd2RTFhSjBYREV5enF4MHJKVUtvWFFDMm80Kzlxa3RO?=
 =?utf-8?B?RFRBRFAzdTFzYzc1VmRSdi9IRGE0UDErV3YvNUhaREpXcVZCRDhORnpxM1kz?=
 =?utf-8?B?cnhJT0tUeXFtaTZXQ2Myc2h1cEFDREd5TXFSNUFQcGxtUlg0NUFHVTdWZkIw?=
 =?utf-8?B?SUlGRXFySmp2RVZqNGNlbSs3VzgrSG91ZUtob2VlNFRXS242TTQxaTA4WkVB?=
 =?utf-8?B?UXczUk05OWx2alRtTEtJc1dSU0gvclpUbzlDUklWL3QybDZDS1hRVVM2Ym9N?=
 =?utf-8?B?eThadk1DU3VEY3FwZFBMSisxZlJDb3I2S3dVZHlKZWc0ei9GYVhGa09QclVT?=
 =?utf-8?B?bXp6OXBYVGFmbmMvNThIOGhnd2tRT1VuK2RrQUE3amxmVU9pb0d6bzkyS0tm?=
 =?utf-8?B?cWtMeTF6VVRsbVZQTHM1L0pJZy81Q3RhSFFZZnI5V1Z2dzJlN1J5THBKRUtV?=
 =?utf-8?B?NU9lYW0xSTlPMnRlaGdZQ3ZHVjc4djhobVBJOUJTbmpmV2cxeGM4V0IwMjZK?=
 =?utf-8?B?ZVo3aVR5SDNZQXEzSlBGSkRJYVEwZVBlZnZHVGpWaG1xd3ZPeXhJdmkxSlA2?=
 =?utf-8?B?L1FrMkwrUllpdHNJL0xwK0VtZTFONnFaMUY4K2xOdlFwZmNqTUNxT0M1U2Fn?=
 =?utf-8?B?TmQ3aXlHRDkzVzk1NmpHYTNUV3UyUjhiV2I3ajgwRkYyTE5lbU1GVk9UK3Iv?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7febd01-15bf-4dc9-1160-08dbc4a530ca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 06:43:17.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OZ3q+mPhRq94ITqY90CuAhBZ805hhyNp8U138gDk2iB4OHmYIb6ezl33ZFmk3Swdyf8QLDr5UqSjJ22lvu43w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Anshutosh,

On 04-10-2023 06:22, Dixit, Ashutosh wrote:
> On Fri, 29 Sep 2023 14:41:22 -0700, Dixit, Ashutosh wrote:
>>
> 
> Hi Badal,
> 
> Why did you merge the hwmon patches when there is still open discussion
> below on the patches? According to upstream rules (I'm not sure if you know
> about this) you should not merge patches, even if you have R-b's on the
> patches, till all review comments are resolved.
> 
> Generally you are expected to either address the comments or reply to the
> comments are at least inform that you are merging, disregarding the > comments. IMO you should at least have done one of these before merging.

I did selective merging. I haven't merged 5th patch yet as locking is 
still in discussion. I am working on addressing locking and thought I 
will address some of your comments with it.

Thanks,
Badal
> 
> Cc: @Vivi, Rodrigo
> 
> Thanks.
> --
> Ashutosh
> 
> 
>> On Fri, 29 Sep 2023 09:48:36 -0700, Dixit, Ashutosh wrote:
>>> On Thu, 28 Sep 2023 23:37:35 -0700, Nilawar, Badal wrote:
>>>>
>>>> On 28-09-2023 10:25, Dixit, Ashutosh wrote:
>>>>> On Wed, 27 Sep 2023 01:39:46 -0700, Nilawar, Badal wrote:
>>>>>
>>>>>> On 27-09-2023 10:23, Dixit, Ashutosh wrote:
>>>>>>> On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
>>>>>>>>
>>>>>>>> +static umode_t
>>>>>>>> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>>>>>>> +		    u32 attr, int channel)
>>>>>>>> +{
>>>>>>>> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>>>>>
>>>>>>> Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
>>>>>>> is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
>>>>>>> doesn't read/write registers.
>>>>>> Agreed, but visible function is called only once while registering hwmon
>>>>>> interface, which happen during driver probe. During driver probe device
>>>>>> will be in resumed state. So no harm in keeping
>>>>>> xe_device_mem_access_get/put in visible function.
>>>>>
>>>>> To me it doesn't make any sense to keep xe_device_mem_access_get/put
>>>>> anywhere except in xe_hwmon_process_reg where the HW access actually
>>>>> happens. We can eliminate xe_device_mem_access_get/put's all over the place
>>>>> if we do it. Isn't it?
>>>> Agreed, thought process here suggest that take rpm wakeref at lowest
>>>> possible level. I already tried this in rfc series and in some extent in
>>>> rev2. There is problem with this approach. See my comments below.
>>>>>
>>>>> The only restriction I have heard of (though not sure why) is that
>>>>> xe_device_mem_access_get/put should not be called under lock>. Though I am
>>>>> not sure it is for spinlock or also mutex. So as we were saying the locking
>>>>> will also need to move to xe_hwmon_process_reg.
>>>> Yes from rev2 comments its dangerous to take mutex before
>>>> xe_device_mem_access_get/put. With code for "PL1 disable/restore during
>>>> resume" I saw deadlock. Scenario was power1_max write -> mutex lock -> rpm
>>>> resume -> disable pl1 -> mutex lock (dead lock here).
>>>
>>> But this is already the wrong order as mentioned below. If we follow the
>>> below order do we still see deadlock?
>>>
>>>>>
>>>>> So:
>>>>>
>>>>> xe_hwmon_process_reg()
>>>>> {
>>>>> 	xe_device_mem_access_get
>>>>> 	mutex_lock
>>>>> 	...
>>>>> 	mutex_unlock
>>>>> 	xe_device_mem_access_put
>>>>> }
>>>>>
>>>>> So once again if this is not possible for some reason let's figure out why.
>>>> There are two problems with this approach.
>>>>
>>>> Problem 1: If you see implementation of xe_hwmon_power_max_write, reg
>>>> access is happening 3 times, so there will be 3 rpm suspend/resume
>>>> cycles. I was observing the same with rfc implementation. So in subsequent
>>>> series xe_device_mem_access_put/get is moved to top level functions
>>>> i.e. hwmon hooks.
>>>
>>> This is not exactly correct because there is also a 1 second autosuspend
>>> delay which will prevent such rpm suspend/resume cycles:
>>>
>>> xe_pm_runtime_init:
>>> 	pm_runtime_set_autosuspend_delay(dev, 1000);
>>>
>>>
>>>>
>>>> Problem 2: If locking moved inside xe_hwmon_process_reg then between two
>>>> subsequent reg accesses it will open small window during which race can
>>>> happen.
>>>> As Anshuman suggested in other thread for read are sequential and protected
>>>> by sysfs layer. So lets apply locking only for RW attributes.
>>>
>>> But what is the locking trying to protect? As far as I understand it is
>>> just the registers which have to be atomically modified/read. So it seems
>>> sufficient to just protect the register accesses with the lock.
>>>
>>> So I am still not convinced.
>>
>> Let's figure out the locking first depending on what needs to be protected
>> (just registers or other data too). And then we can see where to put the
>> xe_device_mem_access_get/put's (following the rule that
>> xe_device_mem_access_get/put's should not be called under lock).
