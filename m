Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40057E7D0AA
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Sep 2023 18:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjIUSMd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Sep 2023 14:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjIUSL2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Sep 2023 14:11:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9815B40F
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Sep 2023 10:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695318612; x=1726854612;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ElpwqvgUBI8doe8sKlAHAqwhEBtqhb3snkYp1ZbcgT0=;
  b=aUhO61gV3jA/t+/rvtuQ9t9l4XNYsOv7wmDepHDlQw3MYlt7mMCkx60o
   kod/BoRNC3bmQtVhr3W+mcfACnpHcreKS6K2kA4/nCeS+afX4dpLGnuel
   haFKHt73yVVq2hMXtn4/nfPNYw5Wx/G8Xf8xYsq6+NUhT5kKanaSTKRJb
   EYhFOn4yp4bYmHKBMH02wBnAkfULCP1Db9KItTIfrdBfMDqvXyZOXwRiH
   AkNhoxtHeNCL0VAJBOZFrYvjHhK/xt2FoRqAtdMmgtH0NOCqiX7uokdVc
   ZnwOs7Qhcv/j7NFEJrbyiS4fl9/l8UEwKGIz5bIiSjcDqkrJIFklHT1+M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447075395"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="447075395"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 09:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="890442266"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="890442266"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2023 09:58:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:59:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:59:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 09:59:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 09:59:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAPkPJahvn/pqp2hDpmnldPTLkQx40RA8Bqu/XhhSq9YZgfhEwMaeqLa3cB4hkTYgHhKNrpRKVxJMLxJbhvv07wxpd/vWMjY0lnSrFYG+P9c3CUa0BDnpFzgJwGaJhyLT6wqNWdT/YerGZp5ncsX1P/6SXwx8p8zIKH+yMnJq6rEKgZbDOl6ltbCsGSmL9GKog+Ew/PhfUx9dl86uDSf5+t9j5Cx+8uPpih5H92VwUP2onuX/oLQ9HqA1iOeuZsycE4MHB1gle83lwFKOfm96n1pXRF4tRLuFKxBmlbAR/AxUD/+qqFK9ZB7SCdCCeyL5UJuPKUgc0vmbM+yUZUqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqeM/E1oabp7GDHxpNvdjNZ97yy/dFEjmP6r+BmgpnU=;
 b=F4hKhN+0RAgdQwF6C84xyWgA0ewcSc2DudxNPknXdWAsrDC5Hb3nXbGVfYIZV+U1mL6sUSVBXGBkXg4BiS8QmnXbDa4+gODoNEljZaSseLG3sXVIl6RYakn0ePQ2gU8ipUIyCMIwkZ/M4hox0CEUK0T4f6JTK3Jj690iEeFp7lFZ2/9D9ToutG5RYyUWFmF+J4qev7526GjI9ZfpuCYgzPVtqvxAQuBaLPEtl7QEsfmeFS/Fy1XOdbgFNboEq7MfEMnr9iYXRA+t9FM+oeRZgTOw4FHJrqnCEoLGX280UZOzEf/IB+ZMtqor+nTTyTUnY2oul6yt/l0qQUP1rOdZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 16:59:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::c555:e954:7fef:f646%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 16:59:40 +0000
Message-ID: <5653e0cb-93d9-f576-e8c6-2ef4d43ac2bb@intel.com>
Date:   Thu, 21 Sep 2023 22:29:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
Content-Language: en-US
To:     Rodrigo Vivi <rodrigo.vivi@intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
        <riana.tauro@intel.com>, <matthew.brost@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZQxpTss3+OYdbJks@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f567c1-0bf1-4e1d-c8c7-08dbbac42538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5r/F0U9JPG3ugVkHMih8KAlhf2y1D7FyWTnOqv3chYh1bRtV8Fw8flupSZzkDNZRnToN2Z16HxZgkTFv68iobD/0Eh6i1P6SM1S5bT3A9iSGhOF/Y8VxZw+hGwRZRNLHxthdGA31IJX99/hbZZBVUPbOcp7LlxWgveINDLpVwfjfRv0GCbSPwJE/SNzYKjoY6dhR67ZQKC200EAundFgzQF+S5TS+XM+lg6GEuoCIS0jaxY5DHUx4xaIxAY90s0qpWk3Y2E/M3dnMY40/IrzprMnHqhqNfHfBooh643iOEZzzd7YgGpNOs3wa5VCKJRvpeRqckoKt4elYqRgJe7sFDnqbvswNLw8kA1yjtvUlztjmRO9NIfb6mIMxvgczzW31upeJNhRI+urre5V5pAyDkff6kH9muJDyheNhUXGkK9cPPBcobrBPjvRRq/ilsVBEv185Srpxur8HNT7ukl/GT2/vng7tcnOfoO6uHdBQT+uDbQ28qYSGbmrnXPUPEeVkRG3bTQSKDKmLOeVxWyaQC9NwWLoy/RWaiGWxDuIUy/unigBA5V9UstUoxCk/BUVFz+dMJg5b/Gv9y+JiUWPtoFFRNBiRavctA5zJuCkpde/ikVXk3J17LkliBbo5VAkmvOa94aXDfzWsh3Z5dHYRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(1800799009)(186009)(451199024)(41300700001)(82960400001)(66946007)(37006003)(2616005)(8936002)(38100700002)(26005)(4326008)(53546011)(66476007)(66556008)(6512007)(6862004)(8676002)(2906002)(86362001)(5660300002)(31696002)(6636002)(316002)(6666004)(6506007)(6486002)(36756003)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFIbzdJR2ZHV1NJcUtETWxtQWQ0OUpLcGd4Z2h6NStiM3l1SUpITzFjbEJa?=
 =?utf-8?B?VTVWT3RRbkRyRWtKNVp5eXhEbnhNUGw3VVNWcEw4ZEhBZWN5OWxJaEVmNnRE?=
 =?utf-8?B?OFRqQXhoV09TcnJEOFVsMWZOREM3MDVjbWNENGk1YmF4cEYvN1ZhdlFnb21M?=
 =?utf-8?B?NDBOTjl4WldncEIrRlc1OWZNM1ozMTJMNkwzQnFwK2RPN1RZdmJZLzhwdFE0?=
 =?utf-8?B?cHlHZ0I2Slg5ejdqL283aVlrVGplSzhjek85OEJ5czRVTU1yUTVsYit2alpx?=
 =?utf-8?B?aXYyQjZPODNrb25Xay9ZMk9GRjNzbnQzc3ZaVkpxN2RPNkQzdlpTODhDNkZl?=
 =?utf-8?B?T3lJeEVrTFg5YlozUDF0ZDUxY1BOOGd4N25LNm1XWEVOM1Z0UkRrM014TlhQ?=
 =?utf-8?B?ZGxVUXRKSlNYNGpoMVpnK0ozK2NuMlp2VktBMHcxaStlVm9IeWpQUUFOUWRk?=
 =?utf-8?B?c0YxTUFyaWpLTkRjQUoyZXF0Z3NzVFdheDFYb203Y1J0Q1NOY09Pd05iUWVr?=
 =?utf-8?B?Q1doTEFXTmIxa09nTkNUODBUYVFIeVJQT3R4RFJ2Mjc4bStWSEdnUXJ2dFBK?=
 =?utf-8?B?NDZ1cEsyZXRIbjlzVTV6L1pITHd3dkM3VWp3TDB0bzAwTHJOR3E1N3VISHBY?=
 =?utf-8?B?blZZbTNLaEdueFpkUnZhRk95Qmp2RzRKVFFUYWYzczNvekhpcXdLUVhxZGtC?=
 =?utf-8?B?a2VTM2VSVGdQUy8vMUxYbUdqSTZGdS9tSGs4Z3ZJc1VXak96dE9UMVlYK0Qv?=
 =?utf-8?B?L2hHejNHQnRBZEdCZzluWmhCUGxJcGNjWXd3VTRpZ2tYemMybW8rWXg2WG11?=
 =?utf-8?B?R3BDcHphbmtQUUVacS92VHgwV1JUUTA3NDBNOGlHakNKazZsTUpZS2Q0U3kz?=
 =?utf-8?B?czRvOGx3cnR3N1VOU3VkVXdRYWVxdjJ3T2pkdHl2TW5Eb1J5ejF1N210V2JF?=
 =?utf-8?B?S1dxbzRXOUJ3M3ZtQjBmaXdaaWgzL0o3d0pwSTNRZUJ0SVdqYy9tRHAwSFR2?=
 =?utf-8?B?SU8wWHFURFVvbTVSSEU5VVRBZEljUDdVTUdiWkJuU2E2VmNVZFg3bFZmTkE2?=
 =?utf-8?B?RjRaVlkwWVRDRG1HRzNMSCtiMkhkVGZMN3FIbnE1RnBKbWRuYWo4R0xMQTcw?=
 =?utf-8?B?dlJSOG5BM2EvZzltRTNtV2t0dGhpanpFbU8rWm0yclBlV05EQjBFelRacmh6?=
 =?utf-8?B?Qm1pSUoreU9tSlNFM3pQZUZuU3pRL1dOMDM3WDJrUC94QUtCUWQ5RzQ4OW5v?=
 =?utf-8?B?cHEybndSNFl3MUg5TFFtOGZDODRGenphMEZvZzB1dVpXaFV3cGdDdlc0dW1q?=
 =?utf-8?B?MnpVNE5kb1ZaV2tYK3ZHaXYvWDdFOVFpYVNPRTBYcTQ4YWptYjgwWWJPa1BZ?=
 =?utf-8?B?OFhVRHJCUjFtOUUxZjN4RjNTcUpXSW4xVFNBOWZoTWJCdUtoNXBJQzFWeWtK?=
 =?utf-8?B?dDg0UmRWdngzblh0QTE2ZHEwMk84aW1UT1EwemVJbDhOZ05hU3h4NnY1SnRr?=
 =?utf-8?B?QnFpZjVuLzBRRDduWHpsWU5PWlF3Z0hmSnlkejZaVlR3VlRyUmVxSjFTWGcx?=
 =?utf-8?B?MjVGZ2V1UTE4V0hkQWVGQWxLRkhsSHRTZXZOTDhwaE5YNzVXdmwrNkFLaGlj?=
 =?utf-8?B?WENjTlpUZ1NDVVpkNlFMUUxESE12aGxJbmM0NGxjUy85ZlBLWmFpUmR6eVJ2?=
 =?utf-8?B?djhqWkJLdFJ4bDFtVUtsbUloTmJkeWNDQ2FZZUVTbkkybzIzUjFTUzRDUGRI?=
 =?utf-8?B?TGxjUE52VVNhQTErbFpKWkxEMVJiTG9UTnVYdnhDakR6S2crd0lSUnJRblEr?=
 =?utf-8?B?UUdYNG5OZGlmbTdzRENhVDdVbEpvVnFodTU4R21DdXNCMzU2VU4xKzVSekpI?=
 =?utf-8?B?QW5LeTR5TC9uYW5lZVJkMS9sSjIwcWdNanphR001RWJVMVMzUDhTcnJ5MS9n?=
 =?utf-8?B?TFJjWTJhV0J2QkdnTUk2b29BNm1LTDlGcXdKUDZwM1k3elFQUGFsZ0pJa3NP?=
 =?utf-8?B?RXNxeks1V3Vxblp0N2JoOGE3U2Q0Z3VIRUJsNU5neTNCMVhKTVlrOTVDU3dn?=
 =?utf-8?B?Vm1ZNUZDbDgrM3Fic0ZOVGp5YzhHSWsxM3BXYjdkSkRlUHNhNllMWmtJRmdC?=
 =?utf-8?B?ZlhjZXU0UU5vd1hKUndVcGVnUVlaRGJ1czhRUFVFZ1g3UUhEYkw1MlB3VHda?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f567c1-0bf1-4e1d-c8c7-08dbbac42538
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 16:59:40.7379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Feju08lhG1lpPD2g/62C7Em56xMuRhMr5jvEXIjpFX10L0pAkDy57LTfuF7hAwN/6fo8HkObixczPJYN5DONZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8050
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 21-09-2023 21:33, Rodrigo Vivi wrote:
> On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
>> Add XE_MISSING_CASE macro to handle missing switch case
>>
>> v2: Add comment about macro usage (Himal)
>>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_macros.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>> index daf56c846d03..6c74c69920ed 100644
>> --- a/drivers/gpu/drm/xe/xe_macros.h
>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>> @@ -15,4 +15,8 @@
>>   			    "Ioctl argument check failed at %s:%d: %s", \
>>   			    __FILE__, __LINE__, #cond), 1))
>>   
>> +/* Parameter to macro should be a variable name */
>> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>> +				__stringify(x), (long)(x))
>> +
> 
> No, please! Let's not add unnecessary macros.
This was suggested by Andy, in fact he suggested to reuse existing 
MISSING_CASE macro from i915. As I couldn't find common place to move it 
I went with creating new one.

I will drop this patch and simply use drm_warn.

Regards,
Badal
> 
>>   #endif
>> -- 
>> 2.25.1
>>
