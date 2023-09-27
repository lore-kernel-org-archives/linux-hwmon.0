Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B978E810A4
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 08:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjI0IkE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjI0IkC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 04:40:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E928D95
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 01:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695804000; x=1727340000;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A24/8sp392OUItX+zvW4eZJVNDCip6vvDZh1JRWTUUI=;
  b=kMY0GihqiIgxJmgMYsLiMumrgAqK3oOHVhhLjn9C5X9eanG+z23ingQk
   7AzNcNIrSvYPX2c3XmY7oW1sQbbGkH6lH5I75I9IKAhP/Liqq8LmDSV2W
   iKWxG0Ytqv+TQkMn0kGRiY+OV4SiA2FsfupzAQufADQxmBwlLOFqY+hgp
   BJJBNRgjvz3Z+c6zVEGEZ8TWNmRbKc7lYvRMHqCjLx5oViYrC5X6gBbY0
   dD7p7rwPEbYNQw7Mcns7aWFqfns7F4wqL8e5EWJJJz7Kl8u0bIR1x9Q4p
   rFt8TfxIwRPZlDNyL592jwdXdmdI8H4uU/RrYshapyaYEtB932jwLHVR4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="362017692"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="362017692"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 01:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839345510"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="839345510"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 01:39:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 01:39:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 01:39:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 01:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX7548CaarETfszRagYtRDjJ289Xcf0b5vJDyoFzNgu3MHxMl4P48yxLiC5pjsQTN4VZZuIfKvFiJ991ruc4RXcy91ecEwXKAOuNSN9fKCSF8WCgkllmsHvUiY5EGxSmLqLesj2duo1U6HK5tJKK1O2jPJdXCiv7rZR8n2q2q+bQCNkEuaejNNIUdBLfjIBJMfBGZW9X85+CWkRBuvHnzRS9mIZniaQMudA30oNLZ5ocTOKd7XL3ObmxEQzarWvNJqIB1vEDqL9/xFCqO3ZovZjdyD4CiO9cFmWhl5yqPPUvIfTz15hsD5/zsWWPJBYDiylGt8+1zrBaLRe6HQIQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN1aQ8+WaTI5CklIsKYcNLMdIiX7623n0j9PNrc1K3I=;
 b=kjJHuTvUISTjpNnkRXtU9akywLoF3BMShMXtwZHodQrOU3TaRmXXzS+9QoHhH7NVIn2jkUWwpJ2+RlVG75A+YPMn06rzHzwXbo01SzAnpwyLq6t08ADN/2Rodd62rnpazSP5Z13mS82afgMRpJln9sdu8lzcoE4a7vNodpYvpfPZdHpfnMDOeN/BaZfM2qMKa7Xj4YZ5iVP2roK65Db8HH5yc4EEYyHlopSKlgGKB9npIrhnJB5773QmhJhF36IlPGyZUR9x/3zqM171bK73t7PHQR1V4stLt1bGgb9N0lY5jtlrOJgCs+xPOcLZELMb9ZsXJltHI6dfSkva6+HFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:39:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 08:39:58 +0000
Message-ID: <84b5dc30-6b27-caf0-6535-c08f6b7e8cd0@intel.com>
Date:   Wed, 27 Sep 2023 14:09:46 +0530
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
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <874jjg1ak6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d46fbda-128a-4ef6-5cf1-08dbbf3554aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1SW+01OCA6jonB9mkuMaQx8YPw2ECocis2XzhVhcC78fQtqlyEj5DrQNylVPzZfXKmIAGAFS+2D/IlxXJRJ7s1MBqhVRLroawx1gMNbEzC0TGZo/qswcZ/77mfUhuBlrm2hsAkfQgMjgmnt8KATXkFKQG4s+W7eteBLzSFbkdMDxhhi2w9ZlR0cI3gWpRYRjMX/Wd7wEoEapPMBjqCwA3SQWeNLw/1qrhlz2X309RvvvLu6KzzE7H8g+PnJaSX4vMr2eyvZUEUxQDpGn+vGXkQIKo3U3B8tpFwlcCuJ+ntTzAMoXpFIAvoISGuW06fgxa2rU6kYkGoIpTy+Y3l3AxuHnkas2E1RN3lMm19MKBsuR/rdQqoIKuPqN4PkFjuOaQtW2/2DwPxydHCI5hboAchK8IyvMAAODunlaiW8x/NaCSBgpeMzQsKSyw0RLdIu+Uy8WzERrOezvg0O+aHQ6wBVag9VPGDYiiyXZFnMBAodqCY7bObNZhAuo4B5CAipNwj8aWQ/2bH/b5WnYRWwo+a25Ej8K/LWLV1ngtwTbPtB86snRKkdlia3xPTJb1buSMLuXYMHjwY6vKnWot1UNRsPT/btEJQ9qdPOTneVG4rSXBuqcGqutaNN/18lj7/E+mdVq+Mfa6HqQKyWWGSXcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230922051799003)(1800799009)(451199024)(186009)(6512007)(6486002)(6666004)(6506007)(53546011)(86362001)(82960400001)(83380400001)(31696002)(38100700002)(36756003)(2616005)(26005)(2906002)(31686004)(8936002)(8676002)(4326008)(6862004)(41300700001)(66946007)(5660300002)(66556008)(316002)(66476007)(37006003)(6636002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RSOXRPZS9DMTYxS1hJVUZTbjFTb0lPaTV4Qk5rZUtlVXZXa09RRFpOUFpw?=
 =?utf-8?B?b0FTL2owNHE0ZWE5cmJEVDVNQ0E5Wk9DaG9ZWTZLT2JEc2h5dk5mSElzNzNq?=
 =?utf-8?B?VHVPM08zRjFkQy8zUnRkTmJRS3c3dHF5OUZrMWxEby8vMjY1UXRHTEU3cmV4?=
 =?utf-8?B?OXBmWjBZc1pQYllpZ25wOHVoZ0ZVSWJaaFpPdlNtb3JqUnJrOXBqekVGWFEr?=
 =?utf-8?B?WVBCQkk2REF2YjRnWjFxbDdIRFBPVnBRRTg0aHJGa1BTdlNFaWFKUWUzeVZH?=
 =?utf-8?B?Q1A3d1Qwb0VCbklob3NaQjQ0Y2F0K09SOE8zTEZJejBXNWM4MzhmeGNRZmJ0?=
 =?utf-8?B?QTVBd2FxeTF6djRDRFNkaVpFZ2xEcXdldVlLaDhCQjJRR0RzZjRvdWQ4UVdt?=
 =?utf-8?B?NXNUVm1vNVJWTmVYY25obmhzVEdsUkZqQjdGRVMycFg4SjdIMlMvL2k2VVFn?=
 =?utf-8?B?WnlldkxKUnlrRm9LMlNkZzNKTDNWa25MNUF1aVJjb01ialoxVnEzNmcwTjVC?=
 =?utf-8?B?Sy9LY21uRk1NRDJQdEx6aGZDcmtZeGxKbHJWenRtNmtYeHJBcHBMTXQvSGdM?=
 =?utf-8?B?WDJ1K1pZRTdWQmNkSkxxdXFhUTRTK1p5cDFXUURSRFJRTWZkVlBCdzhOUkgw?=
 =?utf-8?B?b3Z1R2NOaVRkVWd6RU8wVElHT1NKK1pjUnIvR1FMd25HaFFkTEQ5REpqYVNn?=
 =?utf-8?B?eHpVVUczZmF3TWRTM1cwMHVsRUVVczFlT250RWRaYlJLOTdwRktwdGZZZjUx?=
 =?utf-8?B?Z3FmNHRXcVBQdnR4bXBKNHlSdDg5SVcrMzRFWXhVRFZubkR3TWltWDlCNzF3?=
 =?utf-8?B?c1NBZXJVbSt0N29BUWJybzBYek5sdjY3L3lPM3lsK3dxQXRjN0hjSDRBSTdj?=
 =?utf-8?B?K3FYakxkWkx3YU9nQ1FLTVIxOVVTZkdXbWRweDB0Uk9NL1JCcHdZTFRsd0dM?=
 =?utf-8?B?NlFlSG9DRkJjaVlyYzdRTUhpUEwyOFRNZ1FncTd6SktEN0pNSWp4andDekxU?=
 =?utf-8?B?YnI4WWovNEZ0cXdEaTF0Qk54TXlSRUNCUlJYWlh1bTdmVkYrOWJXMWFYam9L?=
 =?utf-8?B?OE14YXNvRldOeFJGNVFpK01xMlZYZmM5ajJSYVpuVnFXRDB6K0hLYXZOeS9x?=
 =?utf-8?B?SkNoK1VSZjdxWGp5WWVMcm9pN05nVEhYWUtpcEsvblBiSCtsNlRWcHBmUnoz?=
 =?utf-8?B?d2tWbkRQbmFheDJlLzFORjg0ditvU050cmFpbjJUY1UycTdRcXZRS1cyTTBN?=
 =?utf-8?B?NUUwenZkSDhLUFBRU3Zlbnh3TXFQckZZbjE2RWUxbEk4cSs3WVd0dXZhNFha?=
 =?utf-8?B?QXJXNXhJMDNOZFA0d0JhdmJyZ3dTZzVKcDA0UXkxUWdvelVrMmJ2dDBlclZF?=
 =?utf-8?B?bHNqS05Jbmp4NkF5OUpMSzRvaXAxdjluVnBra3Fjb0tOSHhGOVA5RmcyK2dW?=
 =?utf-8?B?WU9uQXF6ZWRRRzZCb2pyQ1htQUMreXVuRFZlczAxeVRyY2x6WnYxWjZleTVu?=
 =?utf-8?B?TExqT1Y1ZzdnSFR4N3czNEpZcndXT0t0NERiR0ZwWmRuQm1udzBVTzFMZ09w?=
 =?utf-8?B?L0NnM0hQNkJZYjJMb0RPTzlTRUdFWDUxem82ZXo2SUVpdmRBUVlRd0drWVB0?=
 =?utf-8?B?YjRVMVJCUnhYQXJXTWROWTNvaDZXMzFlUFVkT2s1ckRwMVhOSlBqYjErK1JK?=
 =?utf-8?B?azZQYW1CKyt1b1NMcmw4UGdOMGJ3c1VXaVNlTkRBUW1hbDd6RjNqRXhQWXgw?=
 =?utf-8?B?MW9leUNtbWxDMVNyOVFXaGdyM1RTVUsvVjlLZ3QrRjQxYTl3c2JFS0NKNTQx?=
 =?utf-8?B?M3c3R0RCTHJoc0VSdWxWUlhPYU12K0RvZGV1Y0FsNkJHSE9jNTcwZVZFdDlu?=
 =?utf-8?B?K1UvaDU0V2g0U08rbzBZaG1nekFqelBMekpNOXJEMGtvNi9CUmFjd3F6SjNO?=
 =?utf-8?B?aFNmRmRCZHdUSTMyVmZwcktLT21hc0czK0RBTVJraUFOMnU1R0Y4WnI5bDY3?=
 =?utf-8?B?SW1xNHZjcE5OZTJCK203MVg4eUN1dWxjOHV5SXBSb1pxcFIzWk1xaFo2U3BN?=
 =?utf-8?B?Y0NvVmtQanpDcnpSaFVUUkNiMFhWdDAxczBKRlpsa05yTnEzNnRBOXZhcTZM?=
 =?utf-8?Q?dkFIfz2PovOTsPzy6yokcXiu/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d46fbda-128a-4ef6-5cf1-08dbbf3554aa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:39:58.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QRoI0iLGZ75Oq4du8xMbiSUO4u+2Wh6P33JX7Kbl6T+kkqFKLfwfcdsT0u2IvNgZfg4qqCWEmLuL9/U1q5URQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 27-09-2023 10:23, Dixit, Ashutosh wrote:
> On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
>>
>> +static umode_t
>> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +		    u32 attr, int channel)
>> +{
>> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> 
> Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
> is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
> doesn't read/write registers.
Agreed, but visible function is called only once while registering hwmon 
interface, which happen during driver probe. During driver probe device 
will be in resumed state. So no harm in keeping 
xe_device_mem_access_get/put in visible function.
> 
> Also do we need to take forcewake? i915 had forcewake table so it would
> take forcewake automatically but XE doesn't do that.
Hwmon regs doesn't fall under GT domain so doesn't need forcewake.
> 
> Thanks.
> --
> Ashutosh
