Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374EDC001B0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jul 2023 14:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbjGGOYL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jul 2023 10:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjGGOYK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2023 10:24:10 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E8810B
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Jul 2023 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688739849; x=1720275849;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=meJtpRbVNJbF5XMKOhdQhYDTAGNZ2OlyO3w7Zl5odls=;
  b=NKmJeTY69p7oZw/pNmCiO9gGC692df+UJh3TWurqV5T4/pjJCFe5CKEt
   1vy7yTobtxzMXocEu2MVGIn2tzq0ImGkWpue311B0XrWrxJjVZZh3QdIS
   FIdMk51ClawaLQwIIOSnZnDROmZFZU4fRiMocSPdXvLmbK6oHM/DRfGSV
   tVjIgECqnWTkVQNXAWksqMDss09JltPb9EPH5CgwwdKaVyjTsTDl39iLX
   Bk5JPLWuNl8oD7uLj492QAd5Nyw5kR9IYzpA1rCjM2AONKSjUQQMuCJnb
   i7JbJtCgfmubs/vSmVCCeyVf/aBYxyHv1sa0lalwTS2tks7ttQmLGKuxv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="450254310"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="450254310"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 07:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="670188031"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="670188031"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 07 Jul 2023 07:23:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 07:23:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 07:23:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 07:23:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 07:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2CUIwV50mDhmAxqT/1Q3JGB2em9kINOQqAb9h37FPCqd/VSU+AypINkNf6PL7F7DjUTxkF7LYshF2WuQ/oYBvmNaYO02UlGnKgz7jn7B3zOx9W+IGbQV0sBxRm4JxwfU5L3uL/C1/ZJo6ZNa4b8wiR73m7tUwtxVQ4qHrJXC9elLUhpimJ0ETUimSVkFW42UI+a5J6+1p5W3l4CvCo4Tp2yB5aC2qBo0BdA34bCKPMRkMUbT9mOkC+cGfcde/zOKLxSnfJnYAwcoR03INUopFaWgiD9/OnE5I89vbVyIyLiKfUqcsF+z5/MqYjB50xy8VuaTG44huyHYKHL5nQ9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3WseQpi6159opg2MUcVe3u1/D3tENzLyL6DtmbeAfQ=;
 b=ocH4L7Ba6NLXzE+mrzebYBfjFfoJpircQeXHeSeLbc0eKAEOY4n6nNCBMq36TKp41S57j+Nx5qvaKUXYTBGkxMrORS3GlMeYUrL/JpDNTcF1RSU9kX1w7WH543jzv6fQRjepL32YgcX558gka4pIocIGyhiDjaQ9N/Hwf190+eLvKwoneR8MyviCFFRjIo8eItx1gX3h87McolTMkfPFOsynWfKqt+3uNn/UE2PQIJ2PTBqWGoJOiQW07IgWq3/NKDe1yU9dbsHslsuD7mvTZattmGA05jNUVXzeKd2RzQNySIKwM/9noC2YxkZDXxCYnt1Y5EjQ4Rp+uTk5rpVsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 14:23:51 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::5196:45c0:110a:eda8]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::5196:45c0:110a:eda8%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 14:23:51 +0000
Message-ID: <67651034-ab18-1871-1fc8-6c4009f889ec@intel.com>
Date:   Fri, 7 Jul 2023 19:53:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
        <linux@roeck-us.net>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-2-badal.nilawar@intel.com>
 <ZJ2L9+lMBU1L0U3M@ashyti-mobl2.lan>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZJ2L9+lMBU1L0U3M@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::34) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 68082c27-f79f-4c95-1b16-08db7ef5c938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F3GFLOcjC55XRfojiRLOBKCacIxvrloHgZhZhuHQRpJ6PtRw9huJJ96E4ixer2gNL8BMaQRlwzplu7BpjakWpdTNS9jHVYEkNwfPfC+ZvaWHn4jlGlzqu06RmX6DRu6T6UZA8jInpYVMlTlCNouhHGq/WtLA0BcAY4Iu5bxugVq9b44984f7xyvtFCatv5siMZoNnYghc6xpHPyjd3dYR47S5OP3bH02LmU7LAUAF99L9lcFr/QdUorJbl5pNhzBbwFqueXkxUrihIhVIyw1LXGLJgAcZ4DOt/SjibMVc0HSQse3nb/nL2zaRFW9jYoZMidecLwoFt8qXAcLqQjGZeX4+lR0Z8IdSTjArPRYLXKWD5ylIjkZ6JGBUU0wFSZ9WSV5WihsGaQA2KZkMB5324d5x7xxTnkxfaLlKyL9dBlAjZcD65ksQmgmEVHCQyv+VyRSyc4FaXWXqlM2ahxN7CJgv3ScIw6D5Mt68ETiioNHOi27b2a+TFl160iqsdp2xKJ4p+EspGLvxeZ0ELL3o1dJN0aZ+V78SJgLCa88fP5fBAni+/ePQESev3Udcyd90YS7DyJb2AYEs+wuK8Cug+q2eLRgKlRCY65JjKFmRVg/N64cE5MHZEAOV3QgxbgO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5530.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(31686004)(5660300002)(31696002)(2906002)(86362001)(36756003)(186003)(38100700002)(83380400001)(26005)(6916009)(53546011)(6506007)(6486002)(966005)(82960400001)(6512007)(2616005)(66946007)(66556008)(4326008)(478600001)(66476007)(6666004)(41300700001)(316002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHB4OXdRK29JcVdaaW4zZ1dlMXgwb0drWHdJd05ySit2MWNYcTQ2Qmx1Z2Zo?=
 =?utf-8?B?OEhWdXl1OC9LL2ZZTTVPRVZYVHRkKzFBYUdnZFFVa1c0My9lUEYvUEN6RzFI?=
 =?utf-8?B?Wm5XbDUzYlBWcGhUQ3RQZ0l0aDhHVUllcmxKbGVUWGZ6S0dEbmFlbi9qRmI2?=
 =?utf-8?B?SUV5VitRTGRsK29MY01UeWp6aEcwSmQ3Q1M3c2JrTFJyRG1CRCtocUt5Znlm?=
 =?utf-8?B?aXR0Vyt1ZCtnNTdsbXo5bUs4cmlGSG1DUCtlL0hQR3p5UEhucUduVkhaZHZB?=
 =?utf-8?B?dEd6NUZscWJwWmV2ODJrT0RCc2ovNWFzNFJmSU0rL0hHV0RSSVRhRVpqQzA3?=
 =?utf-8?B?TkJ3TWIwbEQ5SmhKSTZRdmQ0Qlc3WUZXN0x3eDhFdE1RLzFPV1pCdFJWTmdl?=
 =?utf-8?B?eW9rMk5HQnRWMmFvckN0NjNMWkhWYllyYUZzeDVPbjU3aW55NkV1ME9xOG42?=
 =?utf-8?B?cDQ5aEVtRXVqTDVZbnpRQTR3dERCdzV2cjJBUXZZcUJuc3Bjb2Fudk9FcjBC?=
 =?utf-8?B?Z25mWENCL0lOSFpjSUwrS2oxMVRiWWdEK0d6c2dGZmhXQkJHZmJIVEx1aHk5?=
 =?utf-8?B?amRiKy83L21XT2NHOFNsOXdXdzlqM2lmd0JFemNadUQ5VklXazZvOW85dmFz?=
 =?utf-8?B?djNqa0U1OExFUEk0ZXUzejMzVm1MVW9JWjBkSUhBZ3dlMkVDZ1F0QzAzMUVP?=
 =?utf-8?B?R0ltaTBLN3d5M3NaT0htc1NqaW9MR281NXhiR09xb2w3M2svZ3llemxkN3Vv?=
 =?utf-8?B?US9kMXhFYWVFa3dSNU5VQVd6UTZMMHZ1TTJxSjJ2aXRWeWcwSUlvcUlYTi9z?=
 =?utf-8?B?VVNBaXVCNDU5a1BZYXhNUktwak1zY3F1RXZrNTNncHptVGoxMUp3MXQwalVU?=
 =?utf-8?B?RDNBKzRFTldnbjdTTlhtOWNFR0N6UDh4TmNFT1A5UFQreXZnNmxYVEVwOHJl?=
 =?utf-8?B?ZkJKeHhIODBWZWpoeDQ2R2RSZWxqaHVHd0wyT0FaVUpWREtjRS9JNVgwTGI5?=
 =?utf-8?B?SUZBSVI5SzVOTWdzY2dadTVxcm0zUWF2R0dEQU80R3o0UFlOYmpQS1NUL1o0?=
 =?utf-8?B?WGNtUjZDdmtPUlA4VkxYTW95cHVPQ3ZTaS9hckowd003OWViaGxsY1R5bEJ1?=
 =?utf-8?B?QzlCNDk1dVVGZnpYWTgraVJQYWthZU5xanJ0UFhtTnRLWVpZYldYVFBIdE5N?=
 =?utf-8?B?cXNpUkRWU0lJK0hsdGloY2VzQzNSeXpvSDMrb3YxRXJRUEZXRkI5MWo3K3RL?=
 =?utf-8?B?QVQ1VnhwdWNjbGdTcjVTYjdVSVpYcE92UlJXcHY0UXN0YlIvVmptV0pzRWxy?=
 =?utf-8?B?QzdWZ1BXWWJQV0hxZG1WVXZ4cXNObXdvdVpyS3VOY1Jxc0NCNExwMVZBQ213?=
 =?utf-8?B?SnJmbG8wZlVxU0FLSlBJTXhBeG9BZDNxdzd4QzVCV0EvLzJOcjIwQTl0T0hH?=
 =?utf-8?B?emQrSDlCTHplVVIvNndvZUFYV25POXFZMEM1SWYxbUowdjdiMDU0UnVUYTFB?=
 =?utf-8?B?WFpoTzE3WEdxVEcyeTNVNmh6aEZzSURSOVg0ekhTbnVPalVMSURnVjFlR1dr?=
 =?utf-8?B?ZDQxQ2Zya055NXFJWXBCZ3Ewdm5jVW0yTUhOdy9vYmRLZGN3TVJrd2ZtSUtJ?=
 =?utf-8?B?bndvaUd0L243bklhd1Y2blVVa1Q4R3FkUzVOSjZhNU5EQURlODhzVkQ1d3E5?=
 =?utf-8?B?M3dNOUtHZjZ1YjRtdzY2KzFsN0FJZWFZZmZlOTRJbHVaOFg3emc2enFNUFJy?=
 =?utf-8?B?STFxZVNiaUxrdXd1M0xHY3J0dy9IN3ZhNmwrVVFPdXN2M2xlRGlRTERPdzlX?=
 =?utf-8?B?SEdLSXFabnU3a2tWSUpwdDRuS1lETElyUlJrN3hob1ZQdTZTZ2RIalJicnEx?=
 =?utf-8?B?Q3Y4RURiL3lpQ1ByeHVqZkhkNUVJMGJjdkJDblVLWFVqQU1zU1BXbXYzVGZS?=
 =?utf-8?B?K2hydGZkcFdKV0taUEZ5T2N0dythUURpaEl5K3dYV2psYWhVNzJwdVJ3bWgx?=
 =?utf-8?B?cGIyc2wyNlV6dGsrcmxJOGFwOE1YRzg0clVLY1oxKy9UWG00eVovS0oxMkJx?=
 =?utf-8?B?UFExSnQreVMzaXVpeVlieENBK1l2cTdvQ0k4bTVBODBVOVVEUVJHeUppQjFC?=
 =?utf-8?B?RFF0OEhsWkNKUlBzT0dDRG9pRVZmZVMrZ0J0YkFTMk9RT1Vhc2Q4bGtneUdR?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68082c27-f79f-4c95-1b16-08db7ef5c938
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 14:23:51.4579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mm9jtoRCUK+xYhjUSv+0N0CJETxh2eTq+La+j+lGv8HztN3tefj7XHD3zyrnV0sQERIrqKAH6XXjYjCE58/xmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Andy,

On 29-06-2023 19:19, Andi Shyti wrote:
> Hi Badal,
> 
> [...]
> 
>>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>   {
>> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_debugfs_register(xe);
>>   
>> +	xe_hwmon_register(xe);
> 
> we don't have any information whe hwmon has been created or not.
> 
> Please return an error and print a warning if something wrong
> happens and we fail to register the hwmon interface.
Inside xe_hwmon_register warning is being printed, is it not enough?
> 
> [...]
> 
>> +struct hwm_drvdata {
>> +	struct xe_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +	char name[12];
>> +};
>> +
>> +struct xe_hwmon {
>> +	struct hwm_drvdata ddat;
>> +	struct mutex hwmon_lock;
>> +};
> 
> What's the reason for having two different structures here?
Going further to handle gt specific hwmon (energy) attributes multiple 
instances of hwm_drvdata added in xe_hwmon. With that it will create 
separate hwmon sysfs entry under separate name. Also xe_hwmon holds 
common elements. With single structure approach we might need to add 
xe_hwmon instances in xe gt structure as well. As of now we are handling 
device specific and gt specific attributes. Going further there could be 
card specific attributes as well. With existing approach we can add 
another instance of hwm_drvdata to xe_hwmon with single structure 
approach it will be tricky to handle card specific attrs.

root@DUT729PVC:/home/gta/bellekal/kernel# cat /sys/class/hwmon/hwmon*/name
xe
xe_tile0
xe_tile1
> 
> [...]
> 
>> +void xe_hwmon_register(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct xe_hwmon *hwmon;
>> +	struct device *hwmon_dev;
>> +	struct hwm_drvdata *ddat;
>> +
>> +	/* hwmon is available only for dGfx */
>> +	if (!IS_DGFX(xe))
>> +		return;
> 
> this check is useless, we wouldn't be here otherwise.
As of now hwmon is only applicable for dgfx so added this check.
> 
> [...]
> 
>> +void xe_hwmon_unregister(struct xe_device *xe)
>> +{
>> +	xe->hwmon = NULL;
> 
> We could also destroy the mutex and unregister the hwmon?
During i915_hwmon discussion there was suggestion from you to remove 
mutex_destroy as this is not the case of create/destroy or debug.
https://patchwork.freedesktop.org/patch/503368/?series=104278&rev=6
As suggested by Matt planning to use drmm_mutex_init which will take 
care of destroy.
> 
> [...]
> 
>> +#if IS_REACHABLE(CONFIG_HWMON)
>> +void xe_hwmon_register(struct xe_device *xe);
>> +void xe_hwmon_unregister(struct xe_device *xe);
>> +#else
>> +static inline void xe_hwmon_register(struct xe_device *xe) { };
>> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
>> +#endif
> 
> for readability we can leave some space between the
Sure I will fix this.
> #if...#else...#endif and the content.
> 
> Andi
