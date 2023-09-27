Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340B5E810B2
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 09:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjI0JEu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 05:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjI0JEu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 05:04:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4483FC0
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695805489; x=1727341489;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0VXflhMJMqVj4J8zD3bFfmJNI5yn9hPv6noxdZofyis=;
  b=PUVzEtSy+o1WuokfeMqfuuSDLpzjGIz9N0Lpw0b8aTXI3BeuHGRxbChO
   /bUbNWUOXLC+tLCsy+3A2OJoPMXGBflgaU3IsjStoMu9ZNjgQcwJ3cwf5
   nOkJ4KfdxH85hYx7J/cABDrep2Myn3ZhMPHgixzNy7J4SRMW4xQkjZcBw
   CYmcdd70CSaTuqoaduqpq0HmMZb9Rmget5EGbeV1Qwz6p5oAAQ5L3c9/f
   HOMwRHsoLjDNDP8cxl4pq1eEuZ0CbCJATh/sVm2ExlCpJVUJ0AnmzA9Xb
   +JyBjzpsMkbGdFDJTr+xzQq4njLzzhmloD2iheardBqGzqoBVXs0sH9/4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="468059576"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="468059576"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="749124137"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="749124137"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 02:04:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 02:04:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 02:04:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 02:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc1zLsQ+cVZQRyPdG1Lxpf8/FZQRbsMDUY87mlH7N9ltoXC0K1xezVgxJona6/VXUnmVwaHJ1iwSE5BPuCKXXsunHRPREZbRj1yB7H6cGlX6BH+yM9W1ot72Q1qxWCDeIvasLpo7YnR3Zbr1VH7HHID3QnTiuPL3Reut5TLEhco0D1spV+gFejZSoQCx3elDkMt1sknE5NrztKT2sIcbNxtljxVCQc7piLdKeHOZIG82LAOSZxNMg0xwV/Pqn7xliWc5Neyp1iOmx0vMBdN1OZvLqvzXya8RKcSw3CKjfpFM9050qes04Zd+XqUmd1cw2ZylbQ4RJk7OlhEBbACB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5RSVXos/QGKDcuDiTJRwdRHxpwOd1odtISryvXGOxQ=;
 b=bDcDpDJLTZ4wDa9+CSQgE8MA4M+hxjrXetSYpHoIEQNuw547IrZxB7iQpFWrRw959zY/3yn65SR3BMwaBbVwxsIYWplDCxlZLiZfk4T9i9HcxKB1aCnXhQ1cRWxjZXsR+eKtXKwufkno2W1AUmjlvacM1BZsGiYskTuCJDLv+OIhFj508+Q9aZuVz5s4Hx6guYKqKbf3YvMtGTiDUkrYTXCJl1di/HIqp5SCIl+52IfhZ1C6IFCJxB9B1bh0NAebhBws8IkwZ4l8cXwzx6706p7NTGRvkzOV3ooPrxkUYDWbc/+uDXJ/lNNCq5A5TSaxfUJu16P03aGYe1b0iS/8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 09:04:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 09:04:44 +0000
Message-ID: <af1b1b22-a5f8-cae8-d1d4-c4fa23a2ca05@intel.com>
Date:   Wed, 27 Sep 2023 14:34:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 5/5] drm/xe/hwmon: Expose power1_max_interval
Content-Language: en-US
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <linux@roeck-us.net>,
        <riana.tauro@intel.com>, <matthew.brost@intel.com>,
        <rodrigo.vivi@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-6-badal.nilawar@intel.com>
 <ZRF1f2OsC1pr5hFd@ashyti-mobl2.lan>
 <e5801f36-2f9a-6d24-7af2-1e7174f2e0b4@intel.com>
 <ZRKP2UIGUWTXnZN6@ashyti-mobl2.lan>
 <ec2a4e33-0b34-fb00-5470-f2d39edc6eb1@intel.com>
 <ZRNGkgVqsnJ9Z8O2@ashyti-mobl2.lan> <878r8s1ebu.wl-ashutosh.dixit@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <878r8s1ebu.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: b7eb565b-3a3d-4a07-38ea-08dbbf38ca65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXhSw/gyux7ovTgWDrbCXiNzwEa6ceI1J5O2Cp4M4FppyQCxPHjhTkqezjJojcEFEWolmSINXNMSKfrE/F3vmU0E+g2TVtTtmQW6HxY6dfkXbUZtYBlL1HTs/z95ldf/jd8u5+IHtJv46NTE9YFfTxpj+Bp+X0iEa2bNKCgQfgl5OSgIGsyewO6kSMVNmH9GqBbBd2j7/BsaY9TOWkCdW86qtN/zneEb9yjaZXcAMZE6lZTmPqwYOr+vmqhBwvnQqT/6IR8+S20c8/C6GVbBRJ5p4O51G3KwUf7uLkNSmg79JG7O8Cu317+tcpiZ/0kh2hmXa55Xm628M73ut7RrDk+1ZPOJp4+OZWicvOJ5DyandFLrhatmNqZ3/bH2r1HAK/8wiAyC10F1wUT5Nf8067mTPBnIxAaOkLwXDQzuhkYV83z8a8Lupd9N8NZpMEBlohkUSAAFRzkROh54LYXQ9za0iyBY8fPAK05VtnCxaC3h6sVKWoRXv2sGCfhukrKRxWm2NfC6AHBzknxwwnaUnRrFO9J9wucI3km1X4x0DCUnVoTx5i4AiJPHixPeEO3oStJHC7bNNTPQ1P8lv+JDUexEXG1KqkIcLrOfAmHfc/XabMU1xUmtQrqNSF/tQf+jBBucFHin2tVYiTrc4SP47w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(6512007)(6506007)(53546011)(2616005)(8936002)(26005)(83380400001)(2906002)(478600001)(6666004)(110136005)(4326008)(66556008)(66476007)(66946007)(316002)(5660300002)(41300700001)(8676002)(36756003)(31696002)(6486002)(38100700002)(86362001)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2FFYzBXRkxURzRPcWJINzRjajZrTzFOSE1wOFoveG1lNS9Vb2hrQnFxNjFv?=
 =?utf-8?B?aXZ6STlPSkwwTk5kVjVvemRPY2JrSk52d0N6NDdqL3prWWU1YndmZm81Vldm?=
 =?utf-8?B?T09XUGw1T2tiMEV0QWlyQ1h3anhOeEJrMDZYdG5sY2MzRnJYMnBrd09Cb1Yx?=
 =?utf-8?B?T2pQdWpOTnoyWTBkcUcvK1N5dHFiUkRyVUxVOG53NkV1cHBiQURWZnVZd1JR?=
 =?utf-8?B?QS9KeHhkKzJrMXppUXdpamFvV29yS2FnUW8vM3M4TEc5YlhiVnNSMXVSYlND?=
 =?utf-8?B?Q2syKzRENTdpSzZTU3VFV1V3REQxKzBVWGJGNGUvNStaNEJKZzRZRUh2UGZB?=
 =?utf-8?B?NDRLM1V3eTJseWRqdjlxVWp6bkFZWjV0Q1lqRkFSMWJDYnNqL3U5KzhGV2hQ?=
 =?utf-8?B?Sjgxb3huNXJ5aDZoVm51TG1BTU9YTkVITCtRSlU0ck8vZDFFcHNLY0M0Um1n?=
 =?utf-8?B?aHA0U1N5K1BHN2xoMlh4c01XRVYvMkJYa0k4Mkt0dUNJaC9UODZMV2x1cENa?=
 =?utf-8?B?SE1rZVVxWWl4bDU4dHhKbjZoRWNzRTdrYkVpY080UWo0Zis4aTJ2bmM3cWNC?=
 =?utf-8?B?SGN2amNSTFA0NXVpZ0Z5YkJJbVVMTHZScSt3cjBJM2Zla1pYUy9ZcEhucUhr?=
 =?utf-8?B?Z09aSy9PK1ZTenZGUFloTUpGZmh0UzM1dTIvRFJvcmVRK0ZPSkIxQjQvcmRw?=
 =?utf-8?B?dFFoTWU5cHR5QUkyMEgzanBxL0ZzSDJwaXdBRC9uemt4MTgyc3IySVU3U21v?=
 =?utf-8?B?dXZrVVVBWU53cFVCVm5aSVBoZHVGS2M5ZjZDcXdMank1VFc0UDYrL256VFdH?=
 =?utf-8?B?NDlWcHVFYm5BK3VSeTE5U1hZbytLYXZmdVh2TmcvU0ZISldTbVFzczc4dUJZ?=
 =?utf-8?B?TVpTcitCNUVNMGNBWFRMUGxaUHZwd3ltQ1BFYWVyUFl3MnZObzg3SmhxQVhG?=
 =?utf-8?B?ZVFtSHYzcStQSGJpSmpUOFNXL0ZoU0dBbkFoQ2VLQURIZE5ncjJBMTZRWjE4?=
 =?utf-8?B?bDJ0SUZxR0laL1N6NGNWUXhXMm9aZzdmb2RKTGJTYTUxMDJxQ1pIS1R0SUw1?=
 =?utf-8?B?V2RydnlwWHQ1aG1oeHdvOXdhei9hY3VLTFB3TFp0OTJvOThDTEpKRlY1emVC?=
 =?utf-8?B?OTVmVHlIb2V1c2Y0MTdPTFdNYlpJcDlMRC9Hc3l4am02SmZBVlVTYVFOaXpn?=
 =?utf-8?B?RDBLL0gzaHpKUnBxemR5OHB6RWJkSkhkYVhhdW9nbzBEZ0FvZTdQT0tiaFk1?=
 =?utf-8?B?eDBMK01ReThiTjA3NmFlV3dEcG4rTWNLUEtFZ1R0QmprU0ptUVJyeGpoMGtL?=
 =?utf-8?B?ekJqNm9yWkZXRGlkMWVMTTBFMEZnUHdTamZDdTZWTkVvVlJWeXY5b0d1SjIr?=
 =?utf-8?B?aElER0x1T0dINVNJYk9NR3Jrd3JDR055MVQyM21PZFpHdmhUcndsR0Zmc2Fk?=
 =?utf-8?B?dzVIOUlNN3pBaWVJVkRjeDB5U0xNMDdlZlhpWjBGdEZNNk9IcnFkL29MUURt?=
 =?utf-8?B?ZGRtVmZIUk9aa3FIdkdqdkR3SmVqcjd6dUZrdFlJb3oxdTlsaUFmZGFRUEdE?=
 =?utf-8?B?WHBEZTRWc1U3Y3BORlB4ZFNNYUY4elRuOFJjaFFYSjB3WVV4b0ZtY1NZekNn?=
 =?utf-8?B?YVJRWUtkK2lIVGFpaFFydmZPaXUrTTRjVW9sN3V5L1hCc3hCa3pqcmRUME54?=
 =?utf-8?B?UzNZYkxLbWFvS3FqZjVFam8zK3FNNlNtT0FjNEh2UjZoMGtIMUszTzBkdytR?=
 =?utf-8?B?SWVIeXE0Vk5Gck5sQXQwY0ViQlRqTTdkRTVIV0NicFp4SzVOSmh6NWZYQjVh?=
 =?utf-8?B?OTk1NUtUUVFIUDhZU2duWXhSS3hlVlBMSXQ4VzR4azhidTl3OC80RS9ueVh6?=
 =?utf-8?B?dEsrVWFCY0hvNUtLS3ZSTjh6TkE2eHJnb3BQa2FvYUR1d3pxbVg5dFFBck5N?=
 =?utf-8?B?L3Q3eXpkc01vR2RXRzBwZXFpZGNzbzB1S0JBdmliQTB1VFlkdk1Oa2RDZXVo?=
 =?utf-8?B?OVRhYmgzS0JobExUVkZlK0FXRFVTeWR0dHRBK2lqVlhOY1A5andzQXByQ3dH?=
 =?utf-8?B?VTNONW9xS1NKM1lYRjBBY1NBdDF1NzhYeGhXOC9YRmNDd1g1aXRSZDd4eVI0?=
 =?utf-8?B?ZmhWOWZvYW1rZlZhL2NqRUkzZjZCR0NKMDVPZ3ZjbHBOYThhcEZmMFRpRlRr?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eb565b-3a3d-4a07-38ea-08dbbf38ca65
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 09:04:44.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB9uHwYmOBxmPaOytlbnTS3C7blBBS2O3/CGlnZ2jIEqMOqKmufYAEUHY+8O3YLTs8yx+NuExixRlsPGITYjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Ashutosh,

On 27-09-2023 09:02, Dixit, Ashutosh wrote:
> On Tue, 26 Sep 2023 14:01:06 -0700, Andi Shyti wrote:
>>
> 
> Hi Badal/Andi,
> 
>>
>>>>>>> +	/* val in hw units */
>>>>>>> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
>>>>>>> +	/* Convert to 1.x * power(2,y) */
>>>>>>> +	if (!val) {
>>>>>>> +		/* Avoid ilog2(0) */
>>>>>>> +		y = 0;
>>>>>>> +		x = 0;
>>>>>>> +	} else {
>>>>>>> +		y = ilog2(val);
>>>>>>> +		/* x = (val - (1 << y)) >> (y - 2); */
>>>>>>
>>>>>> this is some spurious development comment, can you please remove
>>>>>> it?
>>>>>
>>>>> This is kept intentionally to help to understand the calculations.
>>>>
>>>> then this is confusing... Can you please expand the concept?
>>>> As it is it's not understandable and I would expect someone
>>>> sending a patch with title:
>>>>
>>>>    [PATCH] drm/xe/hwmon: Remove spurious comment
>>>>
>>>> Because it just looks forgotten from previous development.
>>> I will add this comment inside the comment at the top of if. So it will look
>>> like.
>>> /*
>>>   * Convert to 1.x * power(2,y)
>>>   * y = ilog(val);
>>>   * x = (val - (1 << y)) >> (y-2);
>>>   */
>>
>> All right.
> 
> That comment is explaining that one line of code. I think we should just
> leave it where it is, it doesn't make sense to move it above the if. How
> else can we write it so that the comment doesn't look like a leftover?
> 
> If the code is clear we can remove the comment, but I think the code is
> hard to understand. So try to understand the code and then you will need
> the comment.
Agreed, I will keep this comment as it is.
> 
>>
>>>>>>> +		x = (val - (1ul << y)) << x_w >> y;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
>>>>>>> +
>>>>>>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>>>>>>> +
>>>>>>> +	mutex_lock(&hwmon->hwmon_lock);
>>>>>>> +
>>>>>>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
>>>>>>> +			     PKG_PWR_LIM_1_TIME, rxy);
>>>>>>> +
>>>>>>> +	mutex_unlock(&hwmon->hwmon_lock);
>>>>>>
>>>>>> why are we locking here?
>>>>>
>>>>> Since it is rmw operation we are using lock here.
>>>>
>>>> OK... so what you are trying to protect here is the
>>>>
>>>>     read -> update -> write
>>>>
>>>> and it makes sense. The problem is that if this is a generic
>>>> rule, which means that everyone who will do a rmw operation has
>>>> to take the lock, why not take the lock directly in
>>>> xe_hwmon_process_reg()?
>>>>
>>>> But also this can be a bit confusing, because a function is
>>>> either locked or unlocked and purists might complain.
>>>>
>>>> A suggestion would be to do something like:
>>>>
>>>>      static int xe_hwmon_process_reg(..., enum xe_hwmon_reg_operation operation)
>>>>      {
>>>> 		...
>>>>      }
>>>>
>>>>      static int xe_hwmon_reg_read(...);
>>>>      {
>>>> 		return xe_hwmon_process_reg(..., REG_READ);
>>>>      }
>>>>
>>>>      static int xe_hwmon_reg_write(...);
>>>>      {
>>>> 		return xe_hwmon_process_reg(..., REG_WRITE);
>>>>      }
>>>>
>>>>      static int xe_hwmon_reg_rmw(...);
>>>>      {
>>>> 	int ret;
>>>>
>>>> 	/*
>>>> 	 * Optional: you can check that the lock is not taken
>>>> 	 * to shout loud if potential deadlocks arise.
>>>> 	 */
>>>>
>>>> 	/*
>>>> 	 * We want to protect the register update with the
>>>> 	 * lock blah blah blah... explanatory comment.
>>>> 	 */
>>>> 	mutex_lock(&hwmon->hwmon_lock);
>>>> 	ret = xe_hwmon_process_reg(..., REG_RMW);
>>>> 	mutex_unlock(&hwmon->hwmon_lock);
>>>>
>>>> 	return ret;
>>>>      }
>>>>
>>>> What do you think? It looks much clearer to me.
>>>
>>> REG_PKG_RAPL_LIMIT register is being written in xe_hwmon_power_max_write
>>> also, that's why lock is taken. But some how while cleaning up I forgot to
>>> take it in xe_hwmon_power_max_write(), thanks for catching it up. I will
>>> update xe_hwmon_power_max_write() and resend series.
>>
>> yes... OK... then, please add the lock also in the write case.
>>
>> But still... thinking of hwmon running in more threads don't you
>> think we might need a more generic locking? This might mean to
>> lock all around xe_hwmon_process_reg()... maybe it's an overkill.
>>
>> For the time being I'm OK with your current solution.
>>
>> If you don't like my suggestion above, feel free to ignore it.
> 
> Yeah agree, might as well take the lock around the switch statement in
> xe_hwmon_process_reg().
Will there be a possibility where two different threads will access 
power attributes power1_max and power1_max_interval simultaneously and 
frequently. I am not able to think such scenario. If not then we can 
remove lock from here.

Regards.
Badal
> 
>>
>> Andi
> 
> Thanks.
> --
> Ashutosh
