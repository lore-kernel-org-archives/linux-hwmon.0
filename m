Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29535CDB482
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Oct 2023 07:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbjJPHjb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Oct 2023 03:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjJPHja (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Oct 2023 03:39:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAC2DC
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Oct 2023 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697441967; x=1728977967;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8geV/3UKp/2FPg+I9TDzyuEy5fJP2cEsip5FYX6QZFo=;
  b=HrDDv9/VV3gW9Wl7U68CRhf7uMIjeyY83v2x6uKmnme0W2Dvhi6nN6P1
   rPz3R05V/N8NKbf8DKzim2Tk1rJa/nZUt82CnejM2WInhHAd4xtRL1Ww6
   yPdxyKbAFVDSfkCz3dzDinqlWLUSAsylHatuLdliKL2TIeU1P7q1TNk4k
   PQ2E3k3ObwcLJ50XN9jsMpStDVePX7Y4YiCi9cfDmuRCN7DIAbbVDF6vI
   WGN9xWTMI1lZwqddCQNH9rM3dy4Jknq+/9AK+Y3cApMoChoP1gW1ovE5W
   WZHpOb7j2840XztC57YhT6W8JzOKwpBq5bFxg7Xs5w83eVy8ZI7tkmGSK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389325976"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389325976"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871993245"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="871993245"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 00:39:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:39:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 00:39:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 00:39:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 00:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbDw67x3raVqyTg2Cc8UBvMjCxOylCHMv61LRLvVR98OS9UPZhQ3pXDnHwFo3hZR29x5ly2luCrKWMw6PLWPl9rrEh2+kHeC2hp1OBH3elSrpwS7hR2Nf4vNhaVNWB6dIoTaEkAvfXL0Z/YcOCeMc04n2idYhYCzlRo0jWl/hfjs7yz2B8hmdvhrinvqioD5+HbbZKsdH6FYqPpfPIQekW+LAZ/fEpkXz5DlK8NsPIenQeONOGGwvcGCPSAY9t+81qkddOgkNcQN0/F+N6LVsGvBTI5eHYR0/ZMgVWQtokWhJ8kNW6RJmdOH38Jg9daWyABrMVS6jtJNZxgrHvZ8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y2wgT7XycYhGrU3ilpVd2BoZoYIE5XA5uIzYzPfjxs=;
 b=gR5doqL3EQlplGbWmqCvoR9YgMp9jv0/keGWMjsLloYY9KfnzzIhuuInIk5GMDEIk0qYHY5eZ1wrhdBVmkWj+kGJecDrgtZULXMbd0XDY2c6aQjqe0WXH+kL9OErEDAwtlBkZp3TNvenXaey2aimnWrtJZH0uxhTVCzjQpEQmwHior2a/yHIUSaEYAhsA8LjpH75udptckiYa2E6dKyfH9ZiXIUoYbPQgyjsdzS63u66t+IunAzdw8fFpDaUE4068wTz8NVndlEE7OVawsAwRh34Mg8LRZ/3W0P0BanC7cwBRGaW9BB/w07S3TYkFcySH2PVGmCdhejkdb1+9fwtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 07:39:22 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::6fe8:4a63:d48f:8c13]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::6fe8:4a63:d48f:8c13%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 07:39:22 +0000
Message-ID: <eccd0a19-1275-41d0-af61-29f78bf9d3e4@intel.com>
Date:   Mon, 16 Oct 2023 13:09:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Expose power1_max_interval
Content-Language: en-US
To:     "Gupta, Anshuman" <anshuman.gupta@intel.com>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "Tauro, Riana" <riana.tauro@intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
 <20231006170205.4136927-3-badal.nilawar@intel.com>
 <CY5PR11MB6211773BF673F311E373FEF695CCA@CY5PR11MB6211.namprd11.prod.outlook.com>
From:   "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211773BF673F311E373FEF695CCA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS7PR11MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b45200a-c2e0-46a3-a859-08dbce1b0382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwjN7WGy1jiqyrrVL7LE9fXRmDMt6tcnepon2pMxAVfYViwMf69RvUaskO6bwCRGZNSabdmlLCgmvCkRjgNZJN0pHHwkn0rtlA+PhJuh0HQmhI9+tM2F5Q5TQZpPdPMvszFPjDCKsRn3MM/x8Cfn7gwSg7eUaamXPV2qhf5SAztp43TJ54VUb4eRARzy4uMSVWSrVBY5/gEWLOMgpPKATsCB6EUwD2LJPcKnzXLM7HSFs25QW+gqAc6t8z7no+buvWZ5zMFQHbk8zgVQa0Boyy0Q2tmwZUt5KyHVlubaFypSp1LwB08Qqe/K0xiQtAvUy/V8qgvmtJeFRUDc84Tw45YpmmkQL9xhsaoBXpX4ThKUqc/SAwsoGb8qHBBeyiMRzEpgGPpCwuqDpXbUj2NlYIrxy7vU31o+HhNNTK8jmu+2BBpj8zBKdvozZxjP9F+OCJ6C6vOZPrz5i/z4F7VB3dS4cNPMNzgh5o9y9x/rdkdNXeBOajDvizE0RJzC4eh2McZkMJkZ8ohYcd9TFMBnj/hRsBaAQaVeyG58lDYyVNjMQV5Mkd3MF+VaFhzgmQ4LLqy3fEyzMePZN+dRVzX7sPlCFaGsezpO0qb8RBXBQEyrxf+GYDuUxuFRIVVFZMH+qNNrIYx25BcP9TkxoX6kAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(30864003)(53546011)(26005)(2616005)(6506007)(31686004)(478600001)(6512007)(6666004)(5660300002)(4326008)(41300700001)(8676002)(83380400001)(8936002)(66476007)(66556008)(2906002)(66946007)(54906003)(316002)(38100700002)(110136005)(6486002)(82960400001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0xEL3dNbWVEc09KS0hqOTcrZ1c0MVdUdWZ4dTIrZldqR3FjZXRHWnBtSzQw?=
 =?utf-8?B?RDdSdzVMbnpKWjhkT0xCRGFCbjE0RXdOSE1TWEUwdzJxNHhjZ1p3WjZYMVo0?=
 =?utf-8?B?V3lGVW5sY3Fia21yNnVoN3ZrUW9ya3grS2NJbTlYUVdBd1hjb2Jla0FTMXB4?=
 =?utf-8?B?UllOZ2FleGlLdFRNaEZvUlFpUlo2UU1RNHVEL1R0Zm1vV1lXSk9rMitNRTNE?=
 =?utf-8?B?cWxHaGxnaTU5SEI2YVI5SURNK2ZpN3Q4aHlzZWdTVDZRKzNObGEzWHJoOXhM?=
 =?utf-8?B?ZnNWTDhvWUEyRWdjM2RMRDVUeUVPSnNCZlB3UXpLZUp0dENtbUl6OE1JZTZw?=
 =?utf-8?B?aUUyWHZXcUtkU0hFWEE0QzVrV1VHNUVGcGJKVWQ2VFRpNUVtSDZMMHJ6V3RX?=
 =?utf-8?B?WFd0U3RHUlBWRHQvSWd4L012ZzFkRmtkVzVYY1pxaHR3bk4vNjlOMVo1elpF?=
 =?utf-8?B?TTJvVUswOWc4dEkvU2hVWWtGMk95MkhUcHNrNFhsbllEQ1FRYkp2bGhCdjZK?=
 =?utf-8?B?aFpFYnZFSi82eW4yV0kwRXNselRmRmc0S2hKQi9VV3hlbmgwbVFPNE4vUXBP?=
 =?utf-8?B?OCs4d0tCK0tBem5CNFRZbVlPT2ZpNXlhVHQrZ205UW1Md0JMdG9DcVlKVjlE?=
 =?utf-8?B?d1pVTkZlSzlNSnBhdWsrU25yNWRBYU9UYzZ5ZzliN3hybGw0aDd1L0E5aDdV?=
 =?utf-8?B?NW5NUUNwYWlacS9UeDFIY2lIN3NWdkswdStVUFlCSEV0U2hvQnNkclgvVVJo?=
 =?utf-8?B?WW5JMmx5Si9GbUI2TUVGOXRyL0NydnpWeSsrbmFIVUhOeGpEMFZRcnVwQzYr?=
 =?utf-8?B?NHcwbStvMDhCeUh0WVVCRFhvdERPVnF6VkhpTUJXTTZrbTVMYmVaS2x0VDVM?=
 =?utf-8?B?bzZIMk5aVnZkcit6cWhFR0M2a083QkY1aGpSTlQzYnJ4SFdpdjVyUGdDdklS?=
 =?utf-8?B?ck1mV1dJZndBanZkd08zcTYvQ0VHeTJZUzVROHZtOUV4cXJKK09sUExYMXFr?=
 =?utf-8?B?L282MmhXb0dPMEJJVHp3elpvbzFYenN0dkhjaThSMm9mejhLVzI2VzNwVTYy?=
 =?utf-8?B?YUM1cHBZOS9ENUpvOUFIRis0QVBKK2E3VkxwUVRmcGJFczkzQWdiakRvekNU?=
 =?utf-8?B?V29xM1Y5V3NrUnN6Y2FtNi9yTEZCNmtaWWJObXlPckg1dURiS3dpZG1zbGhu?=
 =?utf-8?B?aGFGdzRCRXlmMElvY3VFTlc5WHJyOWExdXkyUVBWcnVvMUNSbk85Ykw1VG1p?=
 =?utf-8?B?YXpuQVMvY1V0ZnM2NjhSR2lWTEg4bitXeEE3UlRMNS9KWWlCRTJZM245cmtN?=
 =?utf-8?B?MFNpK3FoTjhmeVNmamNXQXpNU3ZrYnJsRS9ZS2hUSmZ3RVkzdGhmSTRmZS9U?=
 =?utf-8?B?NG1DSTl1MnhPUk51b256VjJWMko4Q3dlQTlTMEtXWHN6VEFKWHBEYm02OFhZ?=
 =?utf-8?B?WURrV3I2dDMxQTBUTU9UNUpMSktzc2NsUS9nZ2RBQVU3ZCtpOEZJNHVYRVFm?=
 =?utf-8?B?dlFQQXA2MGQvTlBLaHNPUWpwcGlPaUVoTGhqUEVNaVRUWmdTNUs4RFcrMzcz?=
 =?utf-8?B?dTJYTWxhWVdMMFF4cVY5TFZBcUo2TGJObGRoVmdvNUxrbEFmVjdlZTFkZDN6?=
 =?utf-8?B?UFJ3VlN2N0VKSk55NHJ3MmlDM1VIaThZSkYrWDJyNU9UZFdFL1FWRHg3WkpQ?=
 =?utf-8?B?YlcxUHEwdmlmMUgyam5BSTRaVzdqc01sZnQ0cEh2anNnNTBFd09QZWJVaUU4?=
 =?utf-8?B?K1JjR0ZiTCtJL1I5UUdhdTlqRHNFQTdsMktmeGpUMDhNUWF3bjVZWXhjUGN1?=
 =?utf-8?B?dlJEOTlMRlY0UmtaaVJDYkxoOEY4ZzFmYUQzRTRIMExyREIxRHFXQXhYR3NN?=
 =?utf-8?B?YTJ3TExoRTk0S3krL1MyMEluTWYvbFJqNXUzUExNNVZ0WW5vWklLeEY1d045?=
 =?utf-8?B?WFdyd281eUdWVHJjUFJveDNiaDkxNTcxL0FaMndQUkgvUjNMVVNhVlF6aHpK?=
 =?utf-8?B?d2Z0OUpORW8vLzJ0NGFNVWdaYmNOT1JEd2Y4TkZFN3hTb3VUcmQ5MUFBZXRs?=
 =?utf-8?B?UmFjZ2p0TWN0blJGakhUZ1ZiZWRyazJ6Z2FEbnBleEZHSlZ1TEs2bURzYnJt?=
 =?utf-8?B?T0JwYkF6NFJGekhnSmFwNTZJdWcyTjhqMHc1OW5vTk1FWGpJM0dhN0F5MjV1?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b45200a-c2e0-46a3-a859-08dbce1b0382
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 07:39:22.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k2k3EKli+AcUnKo8qpbnD5Wj1h+b1g7/IXWHKPcWpz3+nYCPRlUD7+MyyK7U/r4dqCJZ+0A1f0rVIO5LMeoWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Anshuman,

On 11-10-2023 11:29, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Friday, October 6, 2023 10:32 PM
>> To: intel-xe@lists.freedesktop.org; linux-hwmon@vger.kernel.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
>> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
>> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [PATCH 2/2] drm/xe/hwmon: Expose power1_max_interval
>>
>> Expose power1_max_interval, that is the tau corresponding to PL1, as a
>> custom hwmon attribute. Some bit manipulation is needed because of the
>> format of PKG_PWR_LIM_1_TIME in PACKAGE_RAPL_LIMIT register (1.x *
>> power(2,y))
>>
>> v2: Get rpm wake ref while accessing power1_max_interval
>> v3: %s/hwmon/xe_hwmon/
>> v4:
>>   - As power1_max_interval is rw attr take lock in read function as well
>>   - Refine comment about val to fix point conversion (Andi)
>>   - Update kernel version and date in doc
>>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 ++
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 142 +++++++++++++++++-
>>   3 files changed, 158 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 1a7a6c23e141..8c321bc9dc04 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -59,3 +59,12 @@ Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. Energy input of device in microjoules.
>>
>>   		Only supported for particular Intel xe graphics platforms.
>> +
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
>> +Date:		October 2023
>> +KernelVersion:	6.6
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
>> +		milliseconds over which sustained power is averaged.
>> +
>> +		Only supported for particular Intel xe graphics platforms.
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index d8ecbe1858d1..519dd1067a19 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -22,15 +22,23 @@
>>   #define   PKG_TDP				GENMASK_ULL(14, 0)
>>   #define   PKG_MIN_PWR				GENMASK_ULL(30,
>> 16)
>>   #define   PKG_MAX_PWR				GENMASK_ULL(46,
>> 32)
>> +#define   PKG_MAX_WIN				GENMASK_ULL(54,
>> 48)
>> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
>> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
>> +
>>
>>   #define PCU_CR_PACKAGE_POWER_SKU_UNIT
>> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>>   #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
>> +#define   PKG_TIME_UNIT				REG_GENMASK(19,
>> 16)
>>
>>   #define PCU_CR_PACKAGE_ENERGY_STATUS
>> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT
>> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>   #define   PKG_PWR_LIM_1				REG_GENMASK(14,
>> 0)
>>   #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23,
>> 17)
>> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23,
>> 22)
>> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21,
>> 17)
>>
>>   #endif /* _XE_MCHBAR_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> b/drivers/gpu/drm/xe/xe_hwmon.c index 391f9a8dd9d7..867481c91826
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
>>   #define SF_CURR		1000		/* milliamperes */
>>   #define SF_VOLTAGE	1000		/* millivolts */
>>   #define SF_ENERGY	1000000		/* microjoules */
>> +#define SF_TIME		1000		/* milliseconds */
>>
>>   struct xe_hwmon_energy_info {
>>   	u32 reg_val_prev;
>> @@ -50,6 +51,7 @@ struct xe_hwmon {
>>   	struct mutex hwmon_lock;	/* For rw attributes */
>>   	int scl_shift_power;
>>   	int scl_shift_energy;
>> +	int scl_shift_time;
>>   	struct xe_hwmon_energy_info ei;	/*  Energy info for
>> energy1_input */
>>   };
>>
>> @@ -253,6 +255,142 @@ xe_hwmon_energy_get(struct xe_hwmon
>> *hwmon, long *energy)
>>   				  hwmon->scl_shift_energy);
>>   }
>>
>> +static ssize_t
>> +xe_hwmon_power1_max_interval_show(struct device *dev, struct
>> device_attribute *attr,
>> +				  char *buf)
>> +{
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +	u32 r, x, y, x_w = 2; /* 2 bits */
>> +	u64 tau4, out;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +			     REG_READ, &r, 0, 0);
>> +
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
>> +	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> Need space here.
ok
>> +	/*
>> +	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
>> +	 *     = (4 | x) << (y - 2)
>> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
>> +	 * However because y can be < 2, we compute
>> +	 *     tau4 = (4 | x) << y
>> +	 * but add 2 when doing the final right shift to account for units
>> +	 */
> Please reformat the comment to make it readable.
ok
>> +	tau4 = ((1 << x_w) | x) << y;
> Need space here.
ok
>> +	/* val in hwmon interface units (millisec) */
>> +	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time +
>> x_w);
>> +
>> +	return sysfs_emit(buf, "%llu\n", out); }
>> +
>> +static ssize_t
>> +xe_hwmon_power1_max_interval_store(struct device *dev, struct
>> device_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
>> +	u64 tau4, r, max_win;
>> +	unsigned long val;
>> +	int ret;
>> +
>> +	ret = kstrtoul(buf, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12
>> +	 * The hwmon->scl_shift_time default of 0xa results in a max tau of
>> 256 seconds
>> +	 */
>> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> Is it universal truth that we are always going to use these default MAX_WIN value ?
Not sure about future platforms.
> AFAIR from i915 review it was due to some h/w limitation on DG2, we were forced to use
> these default values instead to read it from registers. If this is true probably  future
> platforms will address such h/W limitation, it is worth to leave a code comment here ?
Sure will add comment here.
>> +
>> +	/*
>> +	 * val must be < max in hwmon interface units. The steps below are
>> +	 * explained in xe_hwmon_power1_max_interval_show()
>> +	 */
>> +	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>> +	tau4 = ((1 << x_w) | x) << y;
>> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time
>> + x_w);
>> +
>> +	if (val > max_win)
>> +		return -EINVAL;
>> +
>> +	/* val in hw units */
>> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time,
>> SF_TIME);
> Need Space here.
> Please leave a line of space before a code comment.
Ok

Regards,
Badal
> Thanks,
> Anshuman Gupta.
>> +	/*
>> +	 * Convert val to 1.x * power(2,y)
>> +	 * y = ilog2(val)
>> +	 * x = (val - (1 << y)) >> (y - 2)
>> +	 */
>> +	if (!val) {
>> +		y = 0;
>> +		x = 0;
>> +	} else {
>> +		y = ilog2(val);
>> +		x = (val - (1ul << y)) << x_w >> y;
>> +	}
>> +
>> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) |
>> +REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
>> (u32 *)&r,
>> +			     PKG_PWR_LIM_1_TIME, rxy);
>> +
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +	return count;
>> +}
>> +
>> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>> +			  xe_hwmon_power1_max_interval_show,
>> +			  xe_hwmon_power1_max_interval_store, 0);
>> +
>> +static struct attribute *hwmon_attributes[] = {
>> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>> +					   struct attribute *attr, int index) {
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +	int ret = 0;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +
>> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
>> +		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ?
>> attr->mode : 0;
>> +
>> +	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct attribute_group hwmon_attrgroup = {
>> +	.attrs = hwmon_attributes,
>> +	.is_visible = xe_hwmon_attributes_visible, };
>> +
>> +static const struct attribute_group *hwmon_groups[] = {
>> +	&hwmon_attrgroup,
>> +	NULL
>> +};
>> +
>>   static const struct hwmon_channel_info *hwmon_info[] = {
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX |
>> HWMON_P_RATED_MAX | HWMON_P_CRIT),
>>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT), @@ -574,6
>> +712,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>>   		xe_hwmon_process_reg(hwmon,
>> REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
>>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT,
>> val_sku_unit);
>>   		hwmon->scl_shift_energy =
>> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>> +		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT,
>> val_sku_unit);
>>   	}
>>
>>   	/*
>> @@ -620,7 +759,8 @@ void xe_hwmon_register(struct xe_device *xe)
>>   	/*  hwmon_dev points to device hwmon<i> */
>>   	hwmon->hwmon_dev =
>> devm_hwmon_device_register_with_info(dev, "xe", hwmon,
>>
>> 	&hwmon_chip_info,
>> -								NULL);
>> +
>> 	hwmon_groups);
>> +
>>   	if (IS_ERR(hwmon->hwmon_dev)) {
>>   		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n",
>> hwmon->hwmon_dev);
>>   		xe->hwmon = NULL;
>> --
>> 2.25.1
> 
