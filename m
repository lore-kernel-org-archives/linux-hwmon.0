Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0A7C432BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 20:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E362560F92
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 20:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhH0UUs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Aug 2021 16:20:48 -0400
Received: from mail-sn1anam02on2086.outbound.protection.outlook.com ([40.107.96.86]:40900
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231460AbhH0UUr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Aug 2021 16:20:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4AYiCBuiyNyjCqhp8m8tsyOJ5555wonZri4+dUxsNCvmU07ojj4YDgGXFxW6yp2Jg8VlyzrwV3FwvQGo77OeN/tChHLWqV22jw6FGV52KxMWNch91ansiZT71vs0Iyf8dtWrItwTpt34+gqoIk3UazMZkfovvfjUGvsQPyv+y8zs60irMyB7ZJ0BvYSKFHLAUVCSmhMdhipKX+VDp+FApv2+RbxFU3ihf2pyeVUNeBmIDn7nFR5hbLhnBE1ZJ1RFFi28ObhE4vTWJ9x1sTDFsp4d1Yl00PaNZstnuy4Zyjlk+2IeDk0amMHaG3eU+bJHN4nOy7jx67HgZEaM2pODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymICswiHpwIW35Sj0I36MSwHNNi+4Zy3qz38G9x6EHc=;
 b=WUbAcHJtESO3Im/iswh2mvyhB5fqlcJctj3DMnh/ckX3G24cthEmXFLEnnCVe609KHyMsXkw4EWlzbmu/r9/LzB8T5DHSYHy7nRYUJiSdo0O/HkPYSwbYLcO1BpBGpsfywOL7IOasGJeamKKfemuh71RliMczo9aMdiU6atYTXhCotqwLdPiTioFLWUTIPfd3Oa9jMvk3Y/ZA9ocvoBwIFGksHeWv8xus50parUSZGeCz9YGYpJyogPj5p7vhcndh53mc8Eq3+sn0qM+T1bj5sFO1kAgQufqrS7t8jmVSRJnOUpVdH4FyL+p74x96bWa2M6gPMndgiFamJ1MZjBM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymICswiHpwIW35Sj0I36MSwHNNi+4Zy3qz38G9x6EHc=;
 b=N2ZeQsUV7y+LY94Y5phkrOLSrEGzHjMsY4jhDvtntcoWkpnIvb6kDoU6IuwN6tDxzKaZzwGW1nAls1ecz9aKU9Bp0iB2fhG2u/pG2gsIaVbce3c3GZitaXPMx6OzUu7YNkHYMtg1HN9IJRNwMr32rhVFPawDviVavyL7HLNqiAU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4590.namprd12.prod.outlook.com (2603:10b6:806:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 20:19:57 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4457.019; Fri, 27 Aug 2021
 20:19:57 +0000
Subject: Re: [PATCH 5/6] hwmon: (k10temp): Don't show Tdie for all
 Zen/Zen2/Zen3 CPU/APU
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Clemens Ladisch <clemens@ladisch.de>, linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Wei Huang <wei.huang2@amd.com>
References: <20210827164835.GA1754417@roeck-us.net>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <b0e4d904-4067-4a2d-e1ae-46784a8c34d2@amd.com>
Date:   Fri, 27 Aug 2021 15:19:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210827164835.GA1754417@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN2PR01CA0017.prod.exchangelabs.com (2603:10b6:804:2::27)
 To SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.254.54.68] (165.204.77.11) by SN2PR01CA0017.prod.exchangelabs.com (2603:10b6:804:2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:19:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fcd42a1-cae5-4127-4a3a-08d9699809d4
X-MS-TrafficTypeDiagnostic: SA0PR12MB4590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB459050EF376E973CF89C35F9E2C89@SA0PR12MB4590.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCEweVNNLeTM2m73olY0MLHwgqjzl9cC88ozsBtl0hqFl/5OozdXsg/Nqnu7dX0B9SpigYl8E3sh7vaOMWhuMQY1RHsPH4wm8vTJD1PtbaemiJq/cwjnkECICYwDWKpyhzd2QSXm9lc0x0iNXVGC3w7m3LIxviAWd8nDrirkOaiQCutb0DUgrVFLeLu1kkaDL+A2fvUxNFybBhrsQJF5qOEY/E2tmIcn43cf3c566+vi+xfzNR0/rSMmKO4TKmGJ8GEb6exa//XMdj2I+oeAmgonaYZVnaSskPEhe7Yf45uF9CQcwYGWAQGFWkp4T0+n0dqbfsUI1g1FdB5vj8cxkEFOfvRxF5dmvhRnweX2yuh+rOKLO5as31Npd/GhD67hC1EyOalD1KhW2vmtIYDMsGpN2/JiDGcCQI7eABrc/VroMH9dtod6iB5TQm97eX9X4iGF+/8tqtOQ6wOwt96E2LsLpVz6OzdTW5SU2O26UGKiyeF7DzYeXurWjJI2cz4lJE7XjfCGp31B+Dhax9kBojdqvq/TnFv99nWkHbIJUaUoX1ulQVZsCpqv2RjXgqq2K6uBrDMbCeFIWp4x15q0JEs2WcD4IPfCWuWqBVEflmteVT/8GkLVkE1zNl55uvV/BYx1FqHQL/Ud4x0ZJp/bef9vBtPr6KGf7U6p+rVhf+be0O/xq8+oeRBxlCCdmYuTt49fPv2nolUedbnJLJIzzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(26005)(66476007)(36756003)(5660300002)(186003)(4326008)(66946007)(956004)(31696002)(2616005)(66556008)(16576012)(316002)(31686004)(6666004)(83380400001)(2906002)(38100700002)(54906003)(6486002)(478600001)(86362001)(8676002)(8936002)(6916009)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVZGcTlQNmdzNW10cERwYWpuVGkyRlV3VGtML0QrTnFJQ1d0Q1VvbTFnMWN2?=
 =?utf-8?B?SzZOS1ZRT1lRR1d0d2c5dzFXNjY4eFBpTTRkVFF5NFhWYW0xRlo0ZTNGQTBh?=
 =?utf-8?B?U2trT09HTktwUFc4cC94YUk5NXFadTNJTmQ1TjZkRlppT21Oc1k2SjM4QkZu?=
 =?utf-8?B?KzZWYVpuSjBBZTNqSHNvWmNLLzdVYUtDd2crMFF3MEUzL2x2RUQxZEZ2cnRL?=
 =?utf-8?B?Z0o1Y1oxWlc3TEYvU1dQbU5HVXd0dVFiTUppcUdmYmtyTkhoZmZhTC9Edlor?=
 =?utf-8?B?V3ZKNXhLbzhQWWFUYVdkQlQzbVRyZWFNdFVmaUhGMWQvQ0hGajNjeFV5Q0N3?=
 =?utf-8?B?Z1d4dGFnbXNLS0xGNHhPZUYxMEUrNkFCbWRlYWpERWZka0JVVmlaMmYrSlAz?=
 =?utf-8?B?QmpCN2R2aE04Q2VPTUloNkRtM1htOFB3Mjk4NW81RGtmSVVNVW1mS3B0dXln?=
 =?utf-8?B?T0pTZ1dpVlhHdnA0ME41TkpIdVJoYmw1dFptbzgxTmVxU3A5TzdrVVJja2tP?=
 =?utf-8?B?MDNMUDhqbUpjSkUvNjZMa0lPQU5hS1dzT2ZYNFVQaUd3dG00VWYrc3dsdU1l?=
 =?utf-8?B?dmF0UVFLbVArZE4xaEQ3WC93L0VNVDdOMFdKa3ZhODg4TnF4bWRPcGVicDA4?=
 =?utf-8?B?TGpsaTA2V2gzZGg1T2liRURwbWtjYVExQW5vZUFOeHphZlltKy9wV3oyYnFo?=
 =?utf-8?B?RmFaWWViaVg0cUkvcWdWL1YrRDdQVU4zM0ZKNG8xZldmeWx0Wk1OVTJ4Q1hh?=
 =?utf-8?B?MThhRUIyUlJqNGVjQ0ZQckdyb3pqcEhsQ2pvMHJYTlE0TE5BT09lSHZ3WTVN?=
 =?utf-8?B?VE1BdWtsR1lNa2FxMkxKTEdBTnhNNkcwRUc5UmQwOVArNlZXUzNKZldxc2h0?=
 =?utf-8?B?RWpSMkVyYWRZcHNmRllKYWsvQ2xWNGk2eXY0dFNqN3RaUWV5eUNzSnA3SGxX?=
 =?utf-8?B?OHl4VEg4NHRLQU5sTzJzM083ZG8xeVphUGptSGpLcE4yK2ZROFhhTms4djRW?=
 =?utf-8?B?Z09XMktPRUhvOTVBOUllRHI0WDd5aHY2cHhkM2xhNEo2Z0R2NitsdG16eUh0?=
 =?utf-8?B?cG8vdktCQ0VmSHVFY2JXZ0NGb1V1VTE3ZWlyWlFRR1B3dHZPWkhvRVNRMU5w?=
 =?utf-8?B?MmU0SHo1U3hRRlhPeEFpczc5bGNqV3VUd0YyNW9neWZWZXF1SnVMYzI2em1u?=
 =?utf-8?B?aVFaS3VOaFlmZHRjaTZ5M09Ba1NHVitzS1dGUHhCM0NPQUx1Z2pXejFKQW1q?=
 =?utf-8?B?djMxWDFpeVo5V0xOSGFTNEJ1R3ZDcllaMG5LaWZ4aVZEcmZlSXN3YU52WWx3?=
 =?utf-8?B?RG4zeUgwdUJ2eXpHdWRDNCtWREE0RnlyS1BNZy93ZWQ0U09rd08ybTFWR2Y0?=
 =?utf-8?B?RVY0ck9CN3BWQ0UzWHJLZ2plQXovaHpPWFczNEJZdnMzeFUwRDZ6aXhGUm5W?=
 =?utf-8?B?SlRjampuRUY0dytvTVFDSktFSGt3ampaN2MxcUE0TGZmdHN1ZUJxdXRhenJp?=
 =?utf-8?B?ZzVJZGNOa2NjcCs1UG5JaS8xQ0hpTDZtUUY5MmdaRzhPTkxmMjcyUDUwSzBy?=
 =?utf-8?B?d3dWc1hFdXJNbEM1TkVJZ3R1c0wweVFONElubHRBTkxQTlhTbFE0Z2JnUUVS?=
 =?utf-8?B?ZlE1OXpaNkVQS0Ewb296UldsMjRIemY2bTNQR2xCbmZsbElWYlBaQXhnSU9Q?=
 =?utf-8?B?K3VidFZIcGc3aE5pZHM0YS83bE1jdmlPQXBFN1V5QjdsVndEZ0xlVmN1WXZT?=
 =?utf-8?Q?OLG9wSSuyoKMW33ID3H4jjAlIFeFG7CfFHGdY2u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcd42a1-cae5-4127-4a3a-08d9699809d4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:19:57.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWXBd/1+PIKnNGzee5DWWgevVoJEGvDnCnmIXSTpnpBYN6P7Lm6Akc6769OyAbl/yWfV0PHcUoWKyToJSth+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4590
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/27/2021 11:48, Guenter Roeck wrote:
> On Thu, Aug 26, 2021 at 01:40:56PM -0500, Mario Limonciello wrote:
>> Tdie is an offset calculation that should only be shown when temp_offset
>> is actually put into a table.  This is useless to show for all CPU/APU.
>> Show it only when necessary.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Applied.

Really appreciate the expedient review.

> 
> I won't apply the other patches of the series because they either have issues
> or need approval from x86/pci maintainers. No reason to hold up this one
> or the first patch of the series, though.

Thanks.  I've sent v2 to accommodate suggested changes and to loop in 
other maintainers on the applicable patches since as you point out some 
files cross subsystems.

> 
> Side note: I accepted this patch because it _seems_ like hwinfo64
> does something similar. I do hope, though, that the assertion made
> in the patch description is correct and that this doesn't miss CPUs
> where there is a (logical or real) difference between Tctl and Tdie.
> 

If there does turn out to be a system that these are different, then 
showing both as the same value will certainly send a confusing message. 
  If such a case is discovered we should be adding to the table (which 
will bring back Tdie for those products).

> Guenter
> 
>> ---
>>   drivers/hwmon/k10temp.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
>> index 41d9c0c0a1f1..e8ec0e36fc3b 100644
>> --- a/drivers/hwmon/k10temp.c
>> +++ b/drivers/hwmon/k10temp.c
>> @@ -435,7 +435,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   	} else if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
>>   		data->temp_adjust_mask = ZEN_CUR_TEMP_RANGE_SEL_MASK;
>>   		data->read_tempreg = read_tempreg_nb_zen;
>> -		data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
>>   		data->is_zen = true;
>>   
>>   		switch (boot_cpu_data.x86_model) {
>> @@ -457,7 +456,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   	} else if (boot_cpu_data.x86 == 0x19) {
>>   		data->temp_adjust_mask = ZEN_CUR_TEMP_RANGE_SEL_MASK;
>>   		data->read_tempreg = read_tempreg_nb_zen;
>> -		data->show_temp |= BIT(TDIE_BIT);
>>   		data->is_zen = true;
>>   
>>   		switch (boot_cpu_data.x86_model) {
>> @@ -478,6 +476,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   
>>   		if (boot_cpu_data.x86 == entry->model &&
>>   		    strstr(boot_cpu_data.x86_model_id, entry->id)) {
>> +			data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
>>   			data->temp_offset = entry->offset;
>>   			break;
>>   		}
>> -- 
>> 2.25.1
>>

