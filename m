Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6BECE7A89
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 04:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjIYEev (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 00:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIYEeu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 00:34:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2525992
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Sep 2023 21:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695616484; x=1727152484;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IpDcZvtfNPs+pv6gOcfoqYvbkNSPu3UMNwGf/R2kNcA=;
  b=eQPnPDuAU4wiOUMNnQ4p/9JjUGWe7sucmuXxP7ssrLUA84tcMepBHAnW
   KU2qCu4p1nEbtUQTt2Qq11vZX27LsfPHbLOc36g8GTZWxSxPUitrYP8YA
   +nkLSSsPRHDSzW+W0obGByVPHqFUmiUJ712lXovcQj4FUD+6BYwO4OiqG
   eAIOijjJaPqoYlUjuQSt5PPBn4hexDRdpH26+++xfu1omDgtudxfLhb7c
   F2JtxkCgWRCpLUthxVuYEc1VsB0dSpdZnnDluBNooSVah6vVIQx7HTcWK
   XssnH6jo/WwSw1BnuhByBLdQUKGbJvUG+kfnqPeffAAp2Dwh1+9a3Ei7q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412096462"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="412096462"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 21:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783329410"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="783329410"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Sep 2023 21:34:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:34:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:34:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 24 Sep 2023 21:34:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 24 Sep 2023 21:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM3OFlaKsCO9Ij5BH8ybIOxaY4MmHhMK9AK5Uxk9QSlu8VbtdA9EJj0yWQ+E/TEgZRGBaeYPmyINZVDFtIMnOISg90BR8OeA/u+2n7nB8hep/tMW0+LZroTeXLTSz0+VdSxDHzM7HpA37ZDNdJeHVER3JJRmWpxET2DtvswEKIQPkMj4qv2ZbhZs091MzYG3ZPg8vEIhwSLyl/HBnxXm67lbZQHCXiz5ziJodGRzRvBb7HtiK6it4geEEzEpubsbV6fv2W9jywPVhTlS0l4zjBXQHaaZInySmfRKRQf7RvFrCaitp0fP8+Sxt0ascpX7dvg6gVQlbiUz3Maezn0F8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHLmQbT/XkdtMV8i29sJWSjmyZZBjlGOZqsihYi3qrI=;
 b=WGk/UMMH1+iY65vf7xcAtFtTkOjQ2RePUthLRfdR/SatvKnMIHsFZPI3z41o/h0jfRry9nyJ/QS8AyzRvWywQiaAGd+T7NwnzS+Ggtav6d1+Y4bOVtn1jNyO8sxo7uECsd38dfSFNU+pjWTubEiA0ES1nSreABcojhSyoBrSkrFu8gXHAF8vpGgmp6jFdpSWanx6lg0NXQlUqHiWOpQ5W8aMMC0t8LaOQeWuXj72q3BV27fSNXbAEkrd/9GZYKChyEyESrq1kZwbE9MNAE4fxWbRXHNJHbndyzui72MMhenfIFlSnXfWrf6+v3RNGTMWRDyx9MreYPv9pmNa/KxOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW6PR11MB8309.namprd11.prod.outlook.com (2603:10b6:303:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Mon, 25 Sep
 2023 04:34:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 04:34:38 +0000
Message-ID: <5e5277b6-bf5f-39b9-ddb3-66be9c090537@intel.com>
Date:   Mon, 25 Sep 2023 10:04:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-3-badal.nilawar@intel.com>
 <ZQ3N3vvbkh9xPX40@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZQ3N3vvbkh9xPX40@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW6PR11MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: fee5fdff-88f6-4f12-8cb5-08dbbd80b9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9Of38iiPf2+vU7lfWKW1iZFNLs/WrogbA4h4+0p5WUCLOK/6xUZ6Zm9sV41AvlxNfi+ixU/S/B17YgTC/u0g1Veu8tl39If2oY5Rr7lE/5OcQfDkDQUJt8j5fxcjdl2Ls6UN1ucTiOG3xPOSVKCDgM+o32itLCBNf6/xoTW7FGFEcUwpCt3dbBG10QSFeikqutK0h1WiRRmD4eIbK3NBa2tE/cHwmAPycK7gC1Kg+W6QK/DfYFnH20I/Q0SMM6f4ac4XSNNtiDwIvL2UlGNAgO/t2bg36HagZl3OTDh5Cwh1jZXHqJsWQ9QrZ8q+eFHXGOJt2apeRpbGLK/c6kfOx2lZ3MBDInLbB6tOY5B18wWp6ZhoceFU9TuI+0DKQByDuy+CPLjPFMYwLq0GBP56+RlnHNaeIrfFSxnRs/ZvNvEiGx6+21AWv2QKlLsbvV8Iccims5339lOKL3a+i+SLKlMMtt5a8YUd446UGf6HUVGhJsbF5DiwYz218k+RQtGAWNS+FeOmkraKUv4cGvVSRTctbRKDg4t7W7DCC9QreG8SBvUjQzAHYXeAlVURfx8V8yqj7gmH8yQ7FpGnJh5DwEcyiCGp9/G0y+1WA0dWtaiyyvPIkR/YGNPcYIGY/8zaHw/XW/rI1PhmoG1daN0aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(26005)(6666004)(478600001)(2616005)(83380400001)(36756003)(86362001)(31696002)(82960400001)(5660300002)(6486002)(53546011)(38100700002)(6506007)(6512007)(4326008)(2906002)(8936002)(8676002)(31686004)(41300700001)(316002)(6916009)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWl1L0E2NTZ6RUx4a3kxTTB0TmFhdS95RnFVbGJXVFpLSDIvOWNCVytORXQy?=
 =?utf-8?B?dENTbENONEdyRWx6VWpHZ2l0cnlBMWxOeGNtTnlKNzNsRGhGb0pTV3Rxb1VR?=
 =?utf-8?B?RzE1VnIyUUJRUUNxV1VCNHJyNHpSbW1kR1JvVU4wSHB6MUd0ajV5aDFiWFkr?=
 =?utf-8?B?dHEzVnVuUE4zRXdRWWRQeDNRTUFxdVJ1QUk2QThHUXlRdSt3Z0NwUy94QnE2?=
 =?utf-8?B?KytRMFJTeDBiYzcyUjhGKzhhRUdQVmRsTGpuQVpvbUNtOW1nOEdVb291ZHQ1?=
 =?utf-8?B?LzAzT2lRbU9sd2FpWjlya2oyUzF5Y1BvUTdaaGs2RlVCK1pQMCtCaTZYeUd6?=
 =?utf-8?B?TjVVVXdMMGVZOUQveWU0K1BOakVqUkoxdEtXNXFCTWZ2Ui9nNmYxODJsbW9U?=
 =?utf-8?B?a1BNR0NEMHZrd0NQYkdZeG1KMThyaEFUZEQ4M3dDOGgvYnV4ZzFXYTFiV2tk?=
 =?utf-8?B?b21zb1NqUm9idW92QWJlUWpjUFd5T3FxWFJVd09NOStNL2xFM3c1MC9YbkJw?=
 =?utf-8?B?TDV0Yyt6UStTN29BOHo3RzJsUmhYKzZYTU1DbElYNkNwY1pwM09aNmtaMFM5?=
 =?utf-8?B?S2puejdKUXc3T1hrN1Z6eDcvZmpaNksvVWRSaitJY3dHNEh2eXZMbkRkMFp2?=
 =?utf-8?B?ZHE4dWU2Q2dhR3RkWU9FRGJIQXFFUlEvdW52aVAxbHVIcXllN1ByZjFoRkFm?=
 =?utf-8?B?dTNIN3FzVGF5SHh6UnNwb29UWXJkNzRlUS9Hc05zRVZiL3lmMnd0TXFRVTNU?=
 =?utf-8?B?LzMyU3dqVDEvbHhHN3l6Z0JxblNncjZkOFJhZ3UySXpPS1BSazdnbzgweEpz?=
 =?utf-8?B?OGRzc1o0dHlONkxoNloyZFVidzB6RWJKMmlOenh3dmRmdXRxTFR4c2tKNFVq?=
 =?utf-8?B?UkVrSXRvSU1LQ3J5VGRVTHp1clZXbS9Tck5rTWZFZFBtRzRkWFFrU1E5TVlP?=
 =?utf-8?B?RjVmU1BNOW9KWlhrMnBieFpWYU44dk5BSXltaVdFZEc0dWV0VDRkVTFvNUlX?=
 =?utf-8?B?ZXVKTXgyTU9CL2o3dEg5UGNRcVpoaTdma2xUWUhqQ0plQzRIazNYaFArVWdB?=
 =?utf-8?B?eTZMUGM2Y0YrZWRzNUtXV1ArMytxMWo3cGFmRTRuRWtHNjhWampPTUs4djJk?=
 =?utf-8?B?MWxKQ3UvaFAyUWlaUHZkOEpkL0JUY1JNOGF4VDBEZXlVTlVVYzhFZFAyVkZH?=
 =?utf-8?B?b3BuQWx5bjJLdHg1Y084dUZlKzBFUmlzNW93ekRZRk9kREhBaGN0L1ZxVjcy?=
 =?utf-8?B?azFiaGRKYlRyaG9reStWeS9qRlpic3dZYVlDV2lEbHhxZkhqcnJ3VGNOa0hX?=
 =?utf-8?B?bGUvRnVzTWNRSHFxdTVnakpKQ3lPelo2VytTRlp0dVNLdlpMaGRLMTMyRm9r?=
 =?utf-8?B?VlUwdmtaY2M5REFZbGx4MHB3SFRMbXl0NjNucCtoRXRxK2NscjRlaS84QzFk?=
 =?utf-8?B?VGZNVEk1bTVRSFZmRGJHTmxYQmM2VXBhT0xXbVMrNzFsTFNVTlBvNkloNlk3?=
 =?utf-8?B?RzVhbVN6MGhEK0tsY2pnZm41U3RrODNRbmg4MVo5OFFjN29RVERncmw3eEtP?=
 =?utf-8?B?S0FueC9jU1ZDejFSazBnZmQzcXd5alBvVFZRSkZ2TWRDaVE3WG14eUFnaklJ?=
 =?utf-8?B?ZmhHcVA3OFVXRmhTQTdTVmhrZ2h5YWVDVnlVV2FEZDdRZW16dG5BWFN4c1Zk?=
 =?utf-8?B?d3JHakpuL080Z0UrdDVjYlVPS3ZXOHZEL0loelNjY21Rb1dlV1ZSM3FIYzhU?=
 =?utf-8?B?RlNIMUtNVk9ETVlKaVhkRVFXQVJOWFNrdUoyVXFaWXhweXdrOXZiOGp3OUpk?=
 =?utf-8?B?UTlTSzZTV2FRa1ZYcVM0QTRML0Y5blQrU2ZCc3hWWjdYeHNuQlhnYUhsTjFG?=
 =?utf-8?B?WVNwOUlMTGF0dHVtMFBESlFYZXV5ZDN5YU00aFhzTXd1YXRkbUtzZDY4czdZ?=
 =?utf-8?B?T0E5ZlBWZ1NuQzVkUlRWZUJ4bjdrM0lBMWN4Zjdoc3o1RzdEeUNqOEtrcFZ3?=
 =?utf-8?B?Z3Fvdzg1SnJCTWJnYlU5M04xMEh1elVBZUdDdjJadFFyVzY0dUJtYjhuTmpy?=
 =?utf-8?B?Ukk5ZDhoUnc2eWNvVm1JaFJEZFNqMlQ3b0xobG90bURnKzRxbm4wYW5SS3Jn?=
 =?utf-8?B?Qk1zM1IvTXo1Vmh2YVJLNGxITWlYTGlyRnBPK05lTjJkR09HS045dE8xWkZl?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee5fdff-88f6-4f12-8cb5-08dbbd80b9fc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 04:34:38.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwYqs99+/pTAIGR4Jmfjb/9IVIZ+uq8m0o5fWbsHBPi6yqfaoeohz4d75WjBxLTip10Hg0uUA1ChAzj1ukaTsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8309
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Andi,

On 22-09-2023 22:54, Andi Shyti wrote:
> Hi Badal,
> 
> [...]
> 
>> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>> +{
>> +	u32 reg_val;
>> +
>> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>> +	if (value == PL1_DISABLE) {
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>> +				     PKG_PWR_LIM_1_EN, 0);
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
>> +				     PKG_PWR_LIM_1_EN, 0);
>> +
>> +		if (reg_val & PKG_PWR_LIM_1_EN)
>> +			return -ENODEV;
> 
> so, here you are trying to disable PL1 and check then if it's
> disabled. Shall we try at least twice before returning error?
I think lets keep write once only.
> 
> And why ENODEV? It might be that we failed to write on the
> register but it doesn't mean that the device is wrong.
Will return ENOSUPP.
> 
>> +	}
>> +
>> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>> +	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>> +	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
>> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>> +
>> +	return 0;
>> +}
> 
> [...]
> 
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
>> +								"xe",
>> +								hwmon,
>> +								&hwmon_chip_info,
>> +								NULL);
> 
> here the allignment is a bit fancy... in this cases I wouldn't
> mind going up to 100 characters or not align under the bracket.
> 
> I would write it like this
> 
> 	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
> 					"xe", hwmon, &hwmon_chip_info, NULL);
> 
> but, of course, it's a matter of taste. Up to you.
Not sure why this is fancy. Above suggestion checkpatch --strict throws 
CHECK: Alignment should match open parenthesis.

If I write like this checkpatch goes fine.
hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", 
hwmon, 
&hwmon_chip_info,
NULL);

Regards,
Badal
> 
> Andi
