Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218F0C04A6A
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Aug 2023 06:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbjHCGfG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Aug 2023 02:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjHCGfF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Aug 2023 02:35:05 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F5E2D42
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 23:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691044500; x=1722580500;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SpPpnDmFCHfHKADgSXDgMj1hQvZNtL0+wtOp1sody2k=;
  b=dZrZAQZ1kgfonEBj5UBn7uN5Iy6gVTtVRgMUravKnLm2iyg+huA+uqyt
   fGqUrD31FVRmwIV/07c4Oo1/ImxfQrb2pXLv2Wx1SymQBbokURT8S7u1r
   QzzgMhgD2z6JJ/jZYEu0vL+Y5RxkaE+UXjWEk330VNFN4Xvmb2ABpP2kG
   JvH3lUqyP1GehBrsngWbEJtG75nZpXZ1stTgw1PnDnLU9oSBBbQIZFYcr
   zPijVaXfrwNA1k3UeV1fdedYjnlD7z2EsHgPtzBRZeUvKmdRE7wJqPuTZ
   9U6VC6+1jKKG/n1bT5REZEBn2D+IlL4fbJ3G9IAmAbA7Isj7lCioNphF8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350078365"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="350078365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 23:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="706429711"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="706429711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 02 Aug 2023 23:34:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 23:34:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 23:34:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 23:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLNFaAMsHwvJGXSJwcp2HkNY3kcHfwf3h6HQOUj61IRN564mBy4j+TtJsWizvjaM3xW1bmjOpP33UMDgJ986DnCijnrrUJDlywC/hDGYxTAGpgynFiWiL2ArZYkPqkSLWRljKNmcl1942xBZFsWfRo06ujvassI1P2r3BanOleTsEagn/HsaO7SdkbagXSn01RyMN5b1/S3yja4Mhl55Fl1XlCjor8byJl5ElQizKXDf4xreKSxk6gGnEYbyQ31ktWHyWtpIYnrq9deWdSn2KGN+WmMTY6pgVV730drXFAzmkudT+y5NoPD6aLJmhUS5yKel2+MOK74JtEulZPtonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HktPsC3VrRea8fVa1zQGyX8L4YobHlZo8OHDC1inTU=;
 b=dmYlv+4NpYO+Ou1yVJUfW4gCnSs77cQ+JntG4Cgx1sOkGDIw+jGxnsAhLqZJ9AuuUTWr8DAvwTKChJxiG9vCGDClvVVKmcE/11UeaLJHkQ+pKi4hElVRuTnjA+zlaTJCbG/swob2e+NfT2qwWEcCWuojW3uEZ2CN+7BBbHUBxxEmVfsShR6DToTg2wni19S4Uy+FQW++LYp96DUDG4T7r0l3bqwVCMbyZQRzxpaPWRwm+sDhoy0QkArzHtJvyGCVlcJ2ylGFUdbGAl3+1JkJCK5mh2i+qcnxa2c830loMs0EherGBaNUvbwaGSMk8osSx+8+/DX+ChCfH3FkXMNA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 3 Aug
 2023 06:34:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 06:34:57 +0000
Message-ID: <7e4da467-e4f6-1a1b-1fbe-dd97d54a337a@intel.com>
Date:   Thu, 3 Aug 2023 12:04:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/6] drm/xe/hwmon: Expose hwmon energy attribute
To:     Guenter Roeck <linux@roeck-us.net>,
        <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
CC:     <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <andi.shyti@linux.intel.com>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-6-badal.nilawar@intel.com>
 <fb6ed7c9-1a1e-bd0d-0954-7ebd8d38a3f4@roeck-us.net>
Content-Language: en-US
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <fb6ed7c9-1a1e-bd0d-0954-7ebd8d38a3f4@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: b3615a8c-6d7b-44f5-c517-08db93ebc134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++MWb/Y4LyeKqCv8mKyPMgU/jTuVMA2C4IrT+t+yuCbYqGglu60v9SgtrXZpRfrIzX3rJ77mtqvXqwt8TK8ExT7h8qQOjoShwXMHrI5TkTRX8tYcxOJhcXHS3W2xyLh/Dyj7E3WbPmlNC8pg/6YfmQXPgQsCrWXRMUJyDy0sJ5Soa1xeMStIDEQbw8bnHu4VNivYgy/pfSHTiOyI4ChvlolF5ZgrA8tVJv6kTPe+fTZ/uQP68I8taPvZdGK0LRrZYv8W8Z9hjdzarMhQiqznv4mfrankuq4/nLzvo2arFK8fiVchIWAnIIcIjpvtNIJVllHLzf/+kulP3nqOSyrsYSuc6lBsz5yZvLNmWyEMXVcoOvkHABLmjrAhfh4R0NvYSJvzf8jTWFYV1JmiiGVxIqcdrfBG/f47HxQHLU9Z1qzWa3Zp1qWUGuBhJXmn+yKb3fnBTTMq+ee6GO1Nn4ltBtDIWCeQ1H7PtKpT1qUtvWE0KLCOLCUgjl8QAmqCdCJ+e/MWppGC8EQjnmmEyYH9umvpiqVODknJTyXlib+aw+e3h/fVieZpoCHatOYrREWWpBGhtwqhLsm60f7R+Kc/IoFF99DlVzYyPkaZEc6hWGDY5bqXo/ZXEiY5avbQ7mqE13Nukg6FE6KnHaJXd7T7OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(31686004)(110136005)(2906002)(478600001)(6666004)(6486002)(6512007)(36756003)(83380400001)(30864003)(2616005)(82960400001)(86362001)(31696002)(316002)(4326008)(6636002)(66556008)(66946007)(66476007)(8936002)(8676002)(186003)(38100700002)(26005)(5660300002)(41300700001)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtDYW5GSUNLcTZGME5JTVdLRXpITloyUHBzTTNoQjhaMXNWOGhBUi81Qkoy?=
 =?utf-8?B?aUsweWZWMU1FUk5UQnBuUjZtKy92dk4yMWpVZ0ljT3VjTlFYSHhsWjI4M0FW?=
 =?utf-8?B?d1lOY1R6RXBIWThHLzh4NXAyNkVCSVFjeDJuNjdFT1RGVE1yMU55NnIyTVZO?=
 =?utf-8?B?dEdYSmFWZDdRSUFwcnRLbDF0cFQ2NTBIdkw5bUl3T2RhRjVMa3pSUlZQdVow?=
 =?utf-8?B?Slp0T1VlKytHT1lUdkNzckNLRFFNWDdzcWJXTFcyNGZHd2t6dXBCUHNqbjFK?=
 =?utf-8?B?RU00Vjh3cEZGNHFLU1d3dWlKbGltYlVUMmdPYlZaajZmWkJrcDJKdnJjc1Nt?=
 =?utf-8?B?N1NvOVptNHVJQUxmUFJmVXRoUW81MFUybmpiRjFNN0didXlUWThCdTlySlRN?=
 =?utf-8?B?emMxWDRnQlNRUGx0cVpQVUl5WHhlczZkOWRqRDVya3czM1g1OW5PRmFYelVu?=
 =?utf-8?B?VllnbmdEdXV3dS84QTBNOVhMb2V2N3hlSG5vcXl0Vm5uemo1UGRtNUpQeHZ0?=
 =?utf-8?B?SWo2Nnp4MFNnaXhBMGdKUUdkNUJRQWx1Y0FOcUFOY2NNa3VyZGlIRWlLRVBl?=
 =?utf-8?B?MUU5QWxSRGpSV0d4OUJKMUttVGZhRTM5ajZoSDdJSEE3ZWlUd2xxT1dpMmI4?=
 =?utf-8?B?Qnh6WHpSME13elQraGhqb3NIYjB4YTNhdEVFQ1BQRDhhMURnNW4rYW1OOWxj?=
 =?utf-8?B?d1FHcSsvZ3lndWNLUTU5YlQ4d09SaXRnV0F3Y2x0aXpYcjEvWFBnQjhFS1Z5?=
 =?utf-8?B?VWRHQ25uZmJhVUNIVmp4bHJ3L1RwRnVwV05oUFJBVklnbVBweXNLK1dSbmpD?=
 =?utf-8?B?NWV2M0pnR0FGNXJQSTIwT0NyRnFGWGJjcmJTbnBDaVRJdVliSml4K2ZnRy9C?=
 =?utf-8?B?R0pIWStQYmNobmFqeWo4MG04aFNLNkN4Q2tMdG9CdTdsN0FlSDZxckN3UEp2?=
 =?utf-8?B?ZTlMUGllbFJiaFpuNHlrOHNBZTZQTGh0MzhCSytDZFV3SkdmeGZySlh1cmpQ?=
 =?utf-8?B?SFhISUloUGlzYkMxbkFXYlhJQU4vZWoyNlBkWHNLeHdMOGQ4WTJJSUppWXE4?=
 =?utf-8?B?blY1YVc5dFJIRjBJdzF5dmpHbk05WmxmZks5Uno5NjBsWGd2RGw4RmdPVmpE?=
 =?utf-8?B?WGNHc2psa1F4Q3lCZTNZZWdiUEE0Sjk3SmhEakhXZUJ2d1dySFk5MzlGaWFk?=
 =?utf-8?B?WkUwRWYvLzdON1VnR2lJNDFQNVhaeUI5MmRpanVKYnBvcVI4STFsSXFsWDNw?=
 =?utf-8?B?RzVhVEpQUXdRRjN2czVUMnVOTmhtWE5pYTkzT2dXNzgxSEw3dGU3YUduTkdD?=
 =?utf-8?B?TnpjdmVTNXJJbEZiWWI3WjRURWJTZ1djeUd2TTNHRGlwVnprcC90MXlKZlRv?=
 =?utf-8?B?UFhlM2RwWWlyS09GbUI0SytLVFpIUzcxZUVQeGQxaEVOSzhmTlZQNWQ0Zmpj?=
 =?utf-8?B?bkVJOGNWeDBDVDVtTWo1VmtWOU1UYjFVTUdqcU5lZ1RXZ0pQeS9QcTlvUnNR?=
 =?utf-8?B?SnlvV3VXY05pOFJROG8xZ2ZwYkNOb1MraFR5RXJOUmZRK0JJZkd1TXRVODAr?=
 =?utf-8?B?b3ArbUpKNXdLdXN6SHJTdGV2clp2ZXVpc2FuMGJESU8yN2R3WlRUMkFFb0Fs?=
 =?utf-8?B?N2xyVHlvZEg0RExuOHZsM09sUlNseTdXUjJnbERwdDArTmdIcnJSc1NTZjk0?=
 =?utf-8?B?UlEzVjdSK0h2VDF4eHpzbVl1VFltR3dja1V3SHFKTGxXb3R2UDdxODhkd1Vo?=
 =?utf-8?B?dFVtRFgvY2hJZTVaYk1waVpBd0FEZTBEZDEvWmdqcUdULzJucGZmTUlmRUN1?=
 =?utf-8?B?ZmRXdE00cStxZmFKZU9wWFBQUUhSTGhPWnZQMHFaR2I3ZTNudEVkUW1pRmgx?=
 =?utf-8?B?YjdBN05yMWJjeE1kUWNOUXhFbzlFeVNNUUYvUXVtaGQ0V01GTUZNU210ZUhL?=
 =?utf-8?B?OXhOWDk4amozZFdhSVYycFBTbUhrcDJ3YWUrOWFCODVKTUtZL2tvRXBrWUhH?=
 =?utf-8?B?eEtQTWtiUG80b0RaMFpPMTRNTzNVbGtULzNodFRHdDY3RDJES0E5RUtqY1lp?=
 =?utf-8?B?Z1MrejREbmJpYW5Db0FBZWpIN0FpdWNVaWFsWmE2RUg5bFUya0lRMjhiczN5?=
 =?utf-8?B?eVE2T1JmV1pyaTJka3puQW8wN0tTbHVpWVIxZ2laeEpzd08vVGJZWUVZb21s?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3615a8c-6d7b-44f5-c517-08db93ebc134
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 06:34:57.3256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcCwwtQcebb6bD6lKXzs5toLXGN3eB9UT5IzHS7IlH7UldEeNTzsA0AjZfD/LLXeiA04//ZKe/wGbCJcHwLT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 02-08-2023 19:44, Guenter Roeck wrote:
> On 8/2/23 06:52, Badal Nilawar wrote:
>> Expose hwmon energy attribute to show device level and gt
>> level energy usage
>>
>> v2:
>>    - %s/hwm_/hwmon_/
>>    - %s/tile_/gt_
>>    - Convert enums to upper case
>>    - Print error info for hwmon_gt devices
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  12 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   3 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 216 +++++++++++++++++-
>>   4 files changed, 229 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 167bd9480602..4b2d6e1d0c7f 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -52,3 +52,15 @@ Description:    RO. Current Voltage in millivolt.
>>           Only supported for particular Intel xe graphics platforms.
>> +What:        /sys/devices/.../hwmon/hwmon<i>/energy1_input
>> +Date:        August 2023
>> +KernelVersion:    6.4
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:    RO. Energy input of device or gt in microjoules.
>> +
>> +        For xe device level hwmon devices (name "xe") this
>> +        reflects energy input for the entire device. For gt level
>> +        hwmon devices (name "xe_gtN") this reflects energy input
>> +        for the gt.
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cc452ec999fc..8819b934a592 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -400,8 +400,10 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK        XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK        XE_REG(0x19011c)
>> +#define PVC_GT0_PACKAGE_ENERGY_STATUS        XE_REG(0x281004)
>>   #define PVC_GT0_PACKAGE_RAPL_LIMIT        XE_REG(0x281008)
>>   #define PVC_GT0_PACKAGE_POWER_SKU_UNIT        XE_REG(0x281068)
>> +#define PVC_GT0_PLATFORM_ENERGY_STATUS        XE_REG(0x28106c)
>>   #define PVC_GT0_PACKAGE_POWER_SKU        XE_REG(0x281080)
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index cb2d49b5c8a9..473a44bd7c56 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -25,6 +25,9 @@
>>   #define PCU_CR_PACKAGE_POWER_SKU_UNIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>>   #define   PKG_PWR_UNIT                REG_GENMASK(3, 0)
>> +#define   PKG_ENERGY_UNIT            REG_GENMASK(12, 8)
>> +
>> +#define PCU_CR_PACKAGE_ENERGY_STATUS        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT        
>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>   #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 3e69cd79c1e2..a337edcebae5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -22,6 +22,8 @@ enum hwmon_reg_name {
>>       REG_PKG_POWER_SKU,
>>       REG_PKG_POWER_SKU_UNIT,
>>       REG_GT_PERF_STATUS,
>> +    REG_ENERGY_STATUS_ALL,
>> +    REG_ENERGY_STATUS_GT,
>>   };
>>   enum hwmon_reg_operation {
>> @@ -30,31 +32,50 @@ enum hwmon_reg_operation {
>>       REG_RMW,
>>   };
>> +enum xe_hwmon_device_type {
>> +    HWMON_GT,
>> +    HWMON_DEVICE,
>> +};
>> +
>>   /*
>>    * SF_* - scale factors for particular quantities according to hwmon 
>> spec.
>>    * - power  - microwatts
>>    * - curr   - milliamperes
>>    * - voltage  - millivolts
>> + * - energy - microjoules
>>    */
>>   #define SF_POWER    1000000
>>   #define SF_CURR        1000
>>   #define SF_VOLTAGE    1000
>> +#define SF_ENERGY    1000000
>> +
>> +struct hwmon_energy_info {
>> +    u32 reg_val_prev;
>> +    long accum_energy;        /* Accumulated energy for energy1_input */
>> +};
>>   struct xe_hwmon_data {
>>       struct device *hwmon_dev;
>>       struct xe_gt *gt;
>>       char name[12];
>> +    struct hwmon_energy_info ei;    /*  Energy info for energy1_input */
>> +    enum xe_hwmon_device_type type;
>>   };
>>   struct xe_hwmon {
>>       struct xe_hwmon_data ddat;
>> +    struct xe_hwmon_data ddat_gt[XE_MAX_TILES_PER_DEVICE];
>>       struct mutex hwmon_lock; /* rmw operations*/
>>       bool reset_in_progress;
>>       wait_queue_head_t waitq;
>>       int scl_shift_power;
>> +    int scl_shift_energy;
>>   };
>> -#define ddat_to_xe_hwmon(ddat)    ({ container_of(ddat, struct 
>> xe_hwmon, ddat); })
>> +#define ddat_to_xe_hwmon(ddat)    \
>> +    ({ ddat->type == HWMON_GT ?    \
>> +        container_of(ddat, struct xe_hwmon, 
>> ddat_gt[ddat->gt->info.id]) :    \
>> +        container_of(ddat, struct xe_hwmon, ddat); })
>>   static u32 hwmon_get_reg(struct xe_hwmon_data *ddat, enum 
>> hwmon_reg_name reg_name)
>>   {
>> @@ -84,6 +105,16 @@ static u32 hwmon_get_reg(struct xe_hwmon_data 
>> *ddat, enum hwmon_reg_name reg_nam
>>           if (xe->info.platform == XE_DG2)
>>               reg = GT_PERF_STATUS;
>>           break;
>> +    case REG_ENERGY_STATUS_ALL:
>> +        if (xe->info.platform == XE_DG2)
>> +            reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>> +        else if (xe->info.platform == XE_PVC)
>> +            reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
>> +        break;
>> +    case REG_ENERGY_STATUS_GT:
>> +        if (xe->info.platform == XE_PVC)
>> +            reg = PVC_GT0_PACKAGE_ENERGY_STATUS;
>> +        break;
>>       default:
>>           XE_MISSING_CASE(reg_name);
>>           break;
>> @@ -228,10 +259,69 @@ static int hwmon_power_rated_max_read(struct 
>> xe_hwmon_data *ddat, long *value)
>>       return 0;
>>   }
>> +/*
>> + * hwmon_energy_get - Obtain energy value
>> + *
>> + * The underlying energy hardware register is 32-bits and is subject to
>> + * overflow. How long before overflow? For example, with an example
>> + * scaling bit shift of 14 bits (see register 
>> *PACKAGE_POWER_SKU_UNIT) and
>> + * a power draw of 1000 watts, the 32-bit counter will overflow in
>> + * approximately 4.36 minutes.
>> + *
>> + * Examples:
>> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
>> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 
>> 4.36 minutes
>> + *
>> + * The function significantly increases overflow duration (from 4.36
>> + * minutes) by accumulating the energy register into a 'long' as 
>> allowed by
>> + * the hwmon API. Using x86_64 128 bit arithmetic (see 
>> mul_u64_u32_shr()),
>> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
>> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits 
>> before
>> + * energy1_input overflows. This at 1000 W is an overflow duration of 
>> 278 years.
>> + */
>> +static void
>> +hwmon_energy_get(struct xe_hwmon_data *ddat, long *energy)
>> +{
>> +    struct xe_hwmon *hwmon = ddat_to_xe_hwmon(ddat);
>> +    struct hwmon_energy_info *ei = &ddat->ei;
>> +    u32 reg_val;
>> +
>> +    xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    if (ddat->type == HWMON_GT)
>> +        process_hwmon_reg(ddat, REG_ENERGY_STATUS_GT, REG_READ,
>> +                  &reg_val, 0, 0);
>> +    else
>> +        process_hwmon_reg(ddat, REG_ENERGY_STATUS_ALL, REG_READ,
>> +                  &reg_val, 0, 0);
>> +
>> +    if (reg_val >= ei->reg_val_prev)
>> +        ei->accum_energy += reg_val - ei->reg_val_prev;
>> +    else
>> +        ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
>> +
>> +    ei->reg_val_prev = reg_val;
>> +
>> +    *energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>> +                  hwmon->scl_shift_energy);
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +}
>> +
>>   static const struct hwmon_channel_info *hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>> HWMON_P_CRIT),
>>       HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>> +    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>> +    NULL
>> +};
>> +
>> +static const struct hwmon_channel_info *hwmon_gt_info[] = {
>> +    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>>       NULL
>>   };
>> @@ -449,6 +539,32 @@ hwmon_in_read(struct xe_hwmon_data *ddat, u32 
>> attr, long *val)
>>       return ret;
>>   }
>> +static umode_t
>> +hwmon_energy_is_visible(struct xe_hwmon_data *ddat, u32 attr)
>> +{
>> +    switch (attr) {
>> +    case hwmon_energy_input:
>> +        if (ddat->type == HWMON_GT)
>> +            return hwmon_get_reg(ddat, REG_ENERGY_STATUS_GT) ? 0444 : 0;
>> +        else
>> +            return hwmon_get_reg(ddat, REG_ENERGY_STATUS_ALL) ? 0444 
>> : 0;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +hwmon_energy_read(struct xe_hwmon_data *ddat, u32 attr, long *val)
>> +{
>> +    switch (attr) {
>> +    case hwmon_energy_input:
>> +        hwmon_energy_get(ddat, val);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>>   static umode_t
>>   hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>            u32 attr, int channel)
>> @@ -468,6 +584,9 @@ hwmon_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type,
>>       case hwmon_in:
>>           ret = hwmon_in_is_visible(ddat, attr);
>>           break;
>> +    case hwmon_energy:
>> +        ret = hwmon_energy_is_visible(ddat, attr);
>> +        break;
>>       default:
>>           ret = 0;
>>           break;
>> @@ -497,6 +616,9 @@ hwmon_read(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>       case hwmon_in:
>>           ret = hwmon_in_read(ddat, attr, val);
>>           break;
>> +    case hwmon_energy:
>> +        ret = hwmon_energy_read(ddat, attr, val);
>> +        break;
>>       default:
>>           ret = -EOPNOTSUPP;
>>           break;
>> @@ -544,12 +666,53 @@ static const struct hwmon_chip_info 
>> hwmon_chip_info = {
>>       .info = hwmon_info,
>>   };
>> +static umode_t
>> +hwmon_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +            u32 attr, int channel)
>> +{
>> +    struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
>> +
>> +    switch (type) {
>> +    case hwmon_energy:
>> +        return hwmon_energy_is_visible(ddat, attr);
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +hwmon_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 
>> attr,
>> +          int channel, long *val)
>> +{
>> +    struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
>> +
>> +    switch (type) {
>> +    case hwmon_energy:
>> +        return hwmon_energy_read(ddat, attr, val);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static const struct hwmon_ops hwmon_gt_ops = {
>> +    .is_visible = hwmon_gt_is_visible,
>> +    .read = hwmon_gt_read,
>> +};
>> +
>> +static const struct hwmon_chip_info hwmon_gt_chip_info = {
>> +    .ops = &hwmon_gt_ops,
>> +    .info = hwmon_gt_info,
>> +};
>> +
>>   static void
>>   hwmon_get_preregistration_info(struct xe_device *xe)
>>   {
>>       struct xe_hwmon *hwmon = xe->hwmon;
>>       struct xe_hwmon_data *ddat = &hwmon->ddat;
>> +    struct xe_gt *gt;
>> +    long energy;
>>       u32 val_sku_unit = 0;
>> +    u8 id;
>>       int ret;
>>       ret = process_hwmon_reg(ddat, REG_PKG_POWER_SKU_UNIT, REG_READ, 
>> &val_sku_unit, 0, 0);
>> @@ -557,8 +720,22 @@ hwmon_get_preregistration_info(struct xe_device *xe)
>>        * The contents of register PKG_POWER_SKU_UNIT do not change,
>>        * so read it once and store the shift values.
>>        */
>> -    if (!ret)
>> +    if (!ret) {
>>           hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>> +        hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, 
>> val_sku_unit);
>> +    }
>> +
>> +    /*
>> +     * Initialize 'struct hwmon_energy_info', i.e. set fields to the
>> +     * first value of the energy register read
>> +     */
>> +    if (hwmon_is_visible(ddat, hwmon_energy, hwmon_energy_input, 0))
>> +        hwmon_energy_get(ddat, &energy);
>> +
>> +    for_each_gt(gt, xe, id)
>> +        if (hwmon_gt_is_visible(&hwmon->ddat_gt[id], hwmon_energy,
>> +                    hwmon_energy_input, 0))
>> +            hwmon_energy_get(&hwmon->ddat_gt[id], &energy);
>>   }
>>   void xe_hwmon_register(struct xe_device *xe)
>> @@ -567,6 +744,9 @@ void xe_hwmon_register(struct xe_device *xe)
>>       struct xe_hwmon *hwmon;
>>       struct device *hwmon_dev;
>>       struct xe_hwmon_data *ddat;
>> +    struct xe_hwmon_data *ddat_gt;
>> +    struct xe_gt *gt;
>> +    u8 id;
>>       /* hwmon is available only for dGfx */
>>       if (!IS_DGFX(xe))
>> @@ -583,13 +763,21 @@ void xe_hwmon_register(struct xe_device *xe)
>>       /* primary GT to access device level properties */
>>       ddat->gt = xe->tiles[0].primary_gt;
>> +    ddat->type = HWMON_DEVICE;
>>       snprintf(ddat->name, sizeof(ddat->name), "xe");
>> -    hwmon_get_preregistration_info(xe);
>> -
>>       init_waitqueue_head(&hwmon->waitq);
>> +    for_each_gt(gt, xe, id) {
>> +        ddat_gt = hwmon->ddat_gt + id;
>> +        ddat_gt->gt = gt;
>> +        snprintf(ddat_gt->name, sizeof(ddat_gt->name), "xe_gt%u", id);
>> +        ddat_gt->type = HWMON_GT;
>> +    }
>> +
>> +    hwmon_get_preregistration_info(xe);
>> +
>>       drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>       /* hwmon_dev points to device hwmon<i> */
>> @@ -605,6 +793,26 @@ void xe_hwmon_register(struct xe_device *xe)
>>       }
>>       ddat->hwmon_dev = hwmon_dev;
>> +
>> +    for_each_gt(gt, xe, id) {
>> +        ddat_gt = hwmon->ddat_gt + id;
>> +        /*
>> +         * Create per-gt directories only if a per-gt attribute is
>> +         * visible. Currently this is only energy
>> +         */
>> +        if (!hwmon_gt_is_visible(ddat_gt, hwmon_energy, 
>> hwmon_energy_input, 0))
>> +            continue;
>> +
>> +        hwmon_dev = devm_hwmon_device_register_with_info(dev, 
>> ddat_gt->name,
>> +                                 ddat_gt,
>> +                                 &hwmon_gt_chip_info,
>> +                                 NULL);
>> +        if (IS_ERR(hwmon_dev))
>> +            drm_warn(&xe->drm, "Fail to register xe_gt %d hwmon, 
>> Err:%ld\n",
>> +                 id, PTR_ERR(hwmon_dev));
>> +        else
>> +            ddat_gt->hwmon_dev = hwmon_dev;
>> +    }
> 
> There should be just one hardware monitoring device. Just use energyN
> and reference the input with an appropriate sensor label.
Idea was to expose energy attributes under saperate hwmon folder with 
device names xe_gtN. But with channel/label approach it will look like 
energyN_input (energy1_input - device, energy_2,3input - gt0/gt1) with 
appropriate energyN_label (energy1_label = "energy device", energy_2,3 = 
"energy gt0/gt1". With this approach we can avoid using 2 structures 
xe_hwmon and xe_hwmon_data.

Regards,
Badal
> 
> Guenter
> 
>>   }
>>   void xe_hwmon_unregister(struct xe_device *xe)
> 
