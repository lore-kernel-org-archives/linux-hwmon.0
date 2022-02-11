Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DCFC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 10:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242917AbiBKKLo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Feb 2022 05:11:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348787AbiBKKLo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Feb 2022 05:11:44 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2125.outbound.protection.outlook.com [40.107.20.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4142D3
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Feb 2022 02:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikk2ikZFL/6U+j+bXs75gtglm6JYlzaLPi3zA9aMqvm5lwnqXvHusMenqKkxIcamqbc7N2bCs2MVKuKFVKLaLgmXRjTowLmbQ+DwEHm8vJ3OmWf3C0qHtndGFvRYQtgT+cYAOasxtZbSfeilzzunGm4wbod3b9FRyrjo/gBANoNg3RbjAA9xFV1zchk7yxywOXvdni/465AiVHmVwcCR9KX0DJiQ/Kul8VLnJz9UcL0vyxkgPwfFzYCZQilf8sPhtzv7YrguuZDS82RYblCI0Df8V4vx70CBZ/2kJogLi+t5s57muQwSdZdBJGwP3ibNJn/pxMtDzFl8vY+pTaGpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77gQhiTkJQ6T/moUsoBLqSw3xT3HpUTxqEzclhmt1nY=;
 b=Mlg3bfsATIhDAa8X5XbJPbcCWmmqUB5BQmyd+gVy5Irh/OR8sKVPRlQIPAFULoua66h8tWESSx/RbKFReyPJTg1szEvE71FmlQBuHcKRU99NBU7qQ2zOvPAb7Ypfpr8WY/xYqpVVJB+g4q42joasz/Q8JlVX36OfQP/yfQYcKVxKKlL6pElS+rnmrGybqCrlRRyqIEKeXAfv2hafXHopnwbKFNAPayeX4cjCo+6/ClyM5HLFQC6oit5iPt2yH6BCfmyr/Ghjbzc5FMrDAbJtvGrf1e7ZKxmWUXKBrfHAlEDiq+GakM9kS6zIWYcDj8mRGjemsYykJGbGuPpP89l8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77gQhiTkJQ6T/moUsoBLqSw3xT3HpUTxqEzclhmt1nY=;
 b=rkK5V9SVKEb9NqZTDxoAqp3B6ce7qCSWX/tI5ndgxNvXaI6uhFNaPVOgRthC51QEqGb7SifjfpUGaR0KwsWoDq67m5m09GUWVM8XHm0jEpnt3rBxADPpONMKftWXixbKIXxs7Mpj5zk8u/I9A/+1BBC2rK90fx4+BevgV7qmplw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM7PR07MB6916.eurprd07.prod.outlook.com (2603:10a6:20b:1b4::19)
 by PR3PR07MB6826.eurprd07.prod.outlook.com (2603:10a6:102:7f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.10; Fri, 11 Feb
 2022 10:11:39 +0000
Received: from AM7PR07MB6916.eurprd07.prod.outlook.com
 ([fe80::594:fa1f:92c5:e546]) by AM7PR07MB6916.eurprd07.prod.outlook.com
 ([fe80::594:fa1f:92c5:e546%5]) with mapi id 15.20.4995.007; Fri, 11 Feb 2022
 10:11:38 +0000
Message-ID: <fec8df49-5ab1-c55a-b2ad-28f7591cf768@nokia.com>
Date:   Fri, 11 Feb 2022 11:11:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464
 sensor chip
Content-Language: fr
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
 <20220209155308.88938-2-agathe.porte@nokia.com>
 <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
From:   Agathe Porte <agathe.porte@nokia.com>
In-Reply-To: <53861f0c-6447-7a50-39c3-924290a6f9bf@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::26) To AM7PR07MB6916.eurprd07.prod.outlook.com
 (2603:10a6:20b:1b4::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b3220df-69d9-43c5-aee0-08d9ed46e458
X-MS-TrafficTypeDiagnostic: PR3PR07MB6826:EE_
X-Microsoft-Antispam-PRVS: <PR3PR07MB6826AF8E8E97CAF22FA8EF6D9B309@PR3PR07MB6826.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpMWuddCKnfRgDdekZKvbpzaqXpZGTGz8v2iw83z78a6uzdLngXmUsn6O8jpX/5EPptE26EcqjWz5q+mrDb8l0qZ4pdtEr73Oh7/n5Ry+kB/kUTWdsISdRzM/PQPKyOr90iLiiZLAaRY7nyY4xvQZHunPWQtu8MKlv1jSDs12p7PeR2g30gwMFVNth4+cdiJ5L/YJxCUDhghTbRhpCSV3/FnN5vW03nFSCchlOmmqbt334iMqd61SA25UE2TXsF1t1GRMZt6BL2dMKOWYUYOQIdPM2d+00vXkKjOzBQ/ru0QsNVOMenD8nFYJnZeZR10+iXfo89xyGE41p7oTw9eUotaf2FzUlLUCGk+pNkTDsWZ50x25UHt7JPlSjHKwvDR4qq4pg7rnPm54pbKlhCta9hHtlu6Bb8/gzj9LT2j5NWrtkhKW5J0cRgiBqMK73q2BSRFQizWC/egq+SiMzLb3hA4r4yLGu6b1AmhfRY4C1Tg/BWEWCqkLNMLYA0niY4V8mtqB92QAn4mVIS4ae49kf5KXW/5ukrruCOrU0yZpdj4xVmjyuVlsnXtVf+8+xa/cikbpvuXczb0/uQettqBZO51KLJLoRo5aNNb32H9dTLyiEXRcePiof8NP+W4ikj24h/UeXSUIcm21YSgGTkuksX7nHPb7iyZJX9FKr0bojRCev/dBbuerNucS2hbC6DIVhd35PLhm3JVNVSVyBENtSXF0OhxD5NHAdLkFSrbhcshnbnf2IDrhTttC3SPRveFSEEUF9fB6uvnF39L/IMVtto2PLjIYb/sAzLv830GUgzEh/O8APEIeZIBO9iKqOdU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6916.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(966005)(316002)(36756003)(508600001)(53546011)(86362001)(2616005)(54906003)(6512007)(186003)(31696002)(26005)(6506007)(2906002)(6666004)(66476007)(66556008)(66946007)(44832011)(8936002)(5660300002)(30864003)(66574015)(83380400001)(82960400001)(31686004)(38100700002)(4326008)(8676002)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkpuZWJ1WDhTWEpWUWJBd0xpcE1TVUFjeStsdzdSSUJzVTE5VWpNRHdLZDVl?=
 =?utf-8?B?VFZyRkxxdVRHT2FsQ09Za2tqTStGUFBlWTdxanFqS1lCbGFxZVpwSVVCZFJK?=
 =?utf-8?B?UnlFa3hJMWtJWWVPeUkwMXpKbjVHQ2JHM25WWFluR1NmZTA3bi9SQVhYUk1V?=
 =?utf-8?B?dm80dWlTd2xpSEpYTWVYZFVjWllRd0ZGMUlPZlhTcGtZekVrQVlPYlZLSVlr?=
 =?utf-8?B?aEhqbEpvWGZvNnIxYVN4NVZlYlVuWVZFRmJZZmtwWnVJZ1NCWkVYSXFLTy9u?=
 =?utf-8?B?Vnd1M056azVLNVEwZWJOUWc5a1I0MlpNSmtMRytZMis3UHN1QTdQOEpOS240?=
 =?utf-8?B?alFqTmI5cFVzVDlEbEdkMFgzYUIxbVcyUlYzNVBIMitGU3JVUkordWVPY0FP?=
 =?utf-8?B?TWtOUFpKeFdRSzJYUDRDY28veWQ1LzNxa1FyZkd0b3UwT1BqYWViWFdaSnpL?=
 =?utf-8?B?YWxIdlVqMU1Nbjl1b3h4RmJFUkRVc3hsaU9DaFNKSENpVzJGWlppUDJjNEhB?=
 =?utf-8?B?UlJuSDRLQ0NQb2tRL1ZTdGtaTnJZNDJEQzlYZUJsNm4vSWFSL2RIRVJvcHhC?=
 =?utf-8?B?a0hwNmlZR3ExWlplb2pJQThTeWdYNytRTlIrWk5HelpZODYrSy9FUEFZSmU2?=
 =?utf-8?B?SDJuendSOElFL3VSTzF5SWlGd1h2a2ZYbzJ2VnB3MURMc3UzSmhkL0pBOUNB?=
 =?utf-8?B?RHI3Wm5VYnJtVjVNSEZhbklWdGcwdUpCVC96UFBQNFZUdTV3Vk9HbVR1NjVC?=
 =?utf-8?B?NHZBRTEzQXRJM0NCNEFxTUN6cDhzQ0ZRUHRHU3BVUFBQTzNPajBKcWJiaTVG?=
 =?utf-8?B?OXJCMGMrc2xRM0NYVldodGRmTGwvU1hqWkptNUlrdEhPbXg3eFJRbnJpeDlh?=
 =?utf-8?B?Y1NZa055NEM2VkxVMEVnQUllYWh1QlAzRzZsUXdKZ0ppREV5QTJWQU53djlT?=
 =?utf-8?B?aDJHdS9FMkpzT2F6ZnFUQm5MeUNMZi9mR2J5K0QyYXFTYnN2bThuZGZseGU3?=
 =?utf-8?B?bTZpaklHeDlmY0tEWTd3aWhKZDRJbXlyeHlRNGFFVzZ2SVVSTVhic3VMMTlq?=
 =?utf-8?B?QlFrZlJrVnZjOTdYVmx5Zlh1blBuNDg0L1dQYkxFR1JmTUZ1TFZqeHllZSt5?=
 =?utf-8?B?T1RGWnZMYTJXQWJIam9PMHdGSkVWZldRZGRsSlhud2xwTTVEdGtBMFd4ckVS?=
 =?utf-8?B?S2VvdXlLM2hsZ0hJS210WGxWUkc2T0ZpUzhIdFpWd3JMeFJJUzNpZjZmYlJj?=
 =?utf-8?B?SXMrOE5JZFY1cjJNUlZYWTJSbmJ5SXp3Z2RvZ3pBLzF0QjBmRTVkTzczZWpL?=
 =?utf-8?B?cDFmOE9oZ1V2YzkzWWlpanhGbDR3dENrS3FYbGZSeStaV0ZJYkVzaFJPclR3?=
 =?utf-8?B?aWlLcEhicnZCRERWYmgwdDZVSVgzSjB1ak5oSkFyUWttelNmUzJ1OU0vSTk0?=
 =?utf-8?B?R0h3V0lzVkw5VkE1SW5MODZDS2xUOXlZMFU2S05qbTNHYzl1L0V3OXBjVk9G?=
 =?utf-8?B?MklGTmw5RUxPVTlwejkvNXFUR2FLRW84RERaNWpqWmtuTEhDUmd5Wi9XOThm?=
 =?utf-8?B?NGQ2bVI1Szc2OGt0TTk3b2xBdFFiZ2wyRGltVkw3UVk0U3A1ckhmVVRlbStV?=
 =?utf-8?B?K1MvdGNOSG9YVzUzMnVRUG5GN3l5WWt4ZDRHajJZamw4OXdJTHV4ZDAvM3lH?=
 =?utf-8?B?b29qeFNQUG1IQ1pER2owQVEvd0hRN0VlckpnQ0hINVFGOS9zT1dtaUtTL0lT?=
 =?utf-8?B?NWVHL2U4bmhmSHhtNHFrY252WVJ2V010RVJleGRQT0VlRXZuMHNnakZ6T2Rh?=
 =?utf-8?B?Z1dhMG1iZGUvQk5xWDNnN3MycVo5MGl2RWEyd0N3a3owTzREZVdxRVdsWHc1?=
 =?utf-8?B?Zmt5T2hEZkF4dE16dWxRMGd6cDV2dDZrcCtqQ3k3L2VUcDd1WDBHVUg4NjZB?=
 =?utf-8?B?UGRZL0piWmFXMzk4bUNqcTBCQll5bjkwbXI5eVN5R0UwQWo3QUVGMXJ3d1dN?=
 =?utf-8?B?aXFReDlPT1ZjZ0VvUUtwRHhaTDkzTkR6TWl1TVhPRHpBUW1rOEtvM3BaSzZY?=
 =?utf-8?B?NGM2RDBNYjl1Mzgrd2NYdCtaYXdwZGxtOFU2YjAzWERVWXowMmx2YnNuNTJ4?=
 =?utf-8?B?MVNEeDlUaFlLNWl6TmN3V01uUGIxSW5LK1FEY2JkWUpoZjFsczdIWjB6S3Z6?=
 =?utf-8?Q?X1dMaZq4DwAG5UKcJTGYTT4=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3220df-69d9-43c5-aee0-08d9ed46e458
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6916.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 10:11:38.6489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +us5hHunOvH963daX6V6p9ag5ZXE9ViUqiUHVMpcZLkN+YOybC0K5vFjmGuiNXhoEoDWHv0FsxCvB/sVw44qJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6826
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Le 11/02/2022 à 06:16, Guenter Roeck a écrit :
> On 2/9/22 07:53, Agathe Porte wrote:
>> Add support for Texas Instruments TMP464 temperature sensor IC.
>>
>> TI's TMP464 is an I2C temperature sensor chip. This chip is
>> similar to TI's TMP421 chip, but with 16bit-wide registers (instead
>> of 8bit-wide registers). The chip have one local sensor and four
>> remote sensors.
>>
>> Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
>> Acked-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>
> First, please _never_ send a new version of a patch or patch series
> as response to an older version. I almost missed this version of the 
> series.

I should have sent it without In-reply-to to the ML?

I have used the following example from git send-email --help as 
reference, but I was probably wrong:

>           So for example when --thread and --no-chain-reply-to are 
> specified, the second and
>            subsequent patches will be replies to the first one like in 
> the illustration below
>            where [PATCH v2 0/3] is in reply to [PATCH 0/2]:
>
>                [PATCH 0/2] Here is what I did...
>                  [PATCH 1/2] Clean up and tests
>                  [PATCH 2/2] Implementation
>                  [PATCH v2 0/3] Here is a reroll
>                    [PATCH v2 1/3] Clean up
>                    [PATCH v2 2/3] New tests
>                    [PATCH v2 3/3] Implementation

>
> Second, I really dislike continuing this driver without all the attibutes
> making it valuable as hwmon driver, and I really want to drop local 
> caching
> and use regmap instead. I can not get a TMP464 (they appear to be sold 
> out
> until 2023 everywhere I checked, and I can not even get a sample from TI
> either). However, I ordered and - according to Fedex - should get an
> evaluation board for TMP468 tomorrow. Before we keep going back and
> forth, I'd prefer to use that chip to add support for all attributes (or
> in other words take the driver from here). Would that be ok with you ?
This looks fine for me, as long as copyright is kept if you plan to 
reuse what I have proposed here. I have asked a colleague in the 
hardware team to unsolder a few of them from dismissed boards since they 
are hard to find due to the component shortage. I will ask you a 
delivery address using my personal email with a proper GPG key when I 
will be in possession of the chips. Would that be OK to you?
>
> Additional comment inline.

Since you are planning on taking over this driver I think I will not 
propose a v3 driver. However I will try to fix the comments in our local 
version as a learning opportunity. Please Cc me and Krzysztof when 
posting your implementation so that we can backport it in our system.

BRs,

Agathe.

>
> Thanks,
> Guenter
>
>> ---
>>   Documentation/hwmon/index.rst  |   1 +
>>   Documentation/hwmon/tmp464.rst |  43 ++++
>>   MAINTAINERS                    |   2 +
>>   drivers/hwmon/Kconfig          |  10 +
>>   drivers/hwmon/Makefile         |   1 +
>>   drivers/hwmon/tmp464.c         | 447 +++++++++++++++++++++++++++++++++
>>   6 files changed, 504 insertions(+)
>>   create mode 100644 Documentation/hwmon/tmp464.rst
>>   create mode 100644 drivers/hwmon/tmp464.c
>>
>> diff --git a/Documentation/hwmon/index.rst 
>> b/Documentation/hwmon/index.rst
>> index df20022c741f..37590db85e65 100644
>> --- a/Documentation/hwmon/index.rst
>> +++ b/Documentation/hwmon/index.rst
>> @@ -193,6 +193,7 @@ Hardware Monitoring Kernel Drivers
>>      tmp108
>>      tmp401
>>      tmp421
>> +   tmp464
>>      tmp513
>>      tps23861
>>      tps40422
>> diff --git a/Documentation/hwmon/tmp464.rst 
>> b/Documentation/hwmon/tmp464.rst
>> new file mode 100644
>> index 000000000000..8990554194de
>> --- /dev/null
>> +++ b/Documentation/hwmon/tmp464.rst
>> @@ -0,0 +1,43 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Kernel driver tmp421
>> +====================
>> +
>> +Supported chips:
>> +
>> +  * Texas Instruments TMP464
>> +
>> +    Prefix: 'tmp464'
>> +
>> +    Addresses scanned: I2C 0x48, 0x49, 0x4a and 0x4b
>> +
>> +    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp464.html
>> +
>> +Authors:
>> +
>> +    Agathe Porte <agathe.porte@nokia.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for Texas Instruments TMP464
>> +temperature sensor chip. This chip implement one local four remote
>> +sensors. Temperature is measured in degrees Celsius. The chips are
>> +wired over I2C/SMBus and specified over a temperature range of -40 to
>> ++125 degrees Celsius. Resolution for both the local and remote
>> +channels is 0.0625 degree C.
>> +
>> +The chips support only temperature measurement. The driver exports
>> +the temperature values via the following sysfs files:
>> +
>> +**temp[1-5]_input**
>> +
>> +Each sensor can be individually disabled via Devicetree or from sysfs
>> +via:
>> +
>> +**temp[1-5]_enable**
>> +
>> +If labels were specified in Devicetree, additional sysfs files will
>> +be present:
>> +
>> +**temp[1-5]_label**
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 136cd34be715..7fa2796adbef 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19462,6 +19462,8 @@ M:    Agathe Porte <agathe.porte@nokia.com>
>>   L:    linux-hwmon@vger.kernel.org
>>   S:    Maintained
>>   F:    Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
>> +F:    Documentation/hwmon/tmp464.rst
>> +F:    drivers/hwmon/tmp464.c
>>
>>   TMP513 HARDWARE MONITOR DRIVER
>>   M:    Eric Tremblay <etremblay@distech-controls.com>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 8df25f1079ba..52b4f5688b45 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1979,6 +1979,16 @@ config SENSORS_TMP421
>>         This driver can also be built as a module. If so, the module
>>         will be called tmp421.
>>
>> +config SENSORS_TMP464
>> +    tristate "Texas Instruments TMP464 and compatible"
>> +    depends on I2C
>> +    help
>> +      If you say yes here you get support for Texas Instruments TMP464
>> +      temperature sensor chip.
>> +
>> +      This driver can also be built as a module. If so, the module
>> +      will be called tmp464.
>> +
>>   config SENSORS_TMP513
>>       tristate "Texas Instruments TMP513 and compatibles"
>>       depends on I2C
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 185f946d698b..a1f2d6686227 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -194,6 +194,7 @@ obj-$(CONFIG_SENSORS_TMP103)    += tmp103.o
>>   obj-$(CONFIG_SENSORS_TMP108)    += tmp108.o
>>   obj-$(CONFIG_SENSORS_TMP401)    += tmp401.o
>>   obj-$(CONFIG_SENSORS_TMP421)    += tmp421.o
>> +obj-$(CONFIG_SENSORS_TMP464)    += tmp464.o
>>   obj-$(CONFIG_SENSORS_TMP513)    += tmp513.o
>>   obj-$(CONFIG_SENSORS_VEXPRESS)    += vexpress-hwmon.o
>>   obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
>> diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
>> new file mode 100644
>> index 000000000000..564090929ad4
>> --- /dev/null
>> +++ b/drivers/hwmon/tmp464.c
>> @@ -0,0 +1,447 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +/* Driver for the Texas Instruments TMP464 SMBus temperature sensor IC.
>> + * Supported models: TMP464
>> +
>> + * Copyright (C) 2022 Agathe Porte <agathe.porte@nokia.com>
>> + * Preliminary support by:
>> + * Lionel Pouliquen <lionel.lp.pouliquen@nokia.com>
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_device.h>
>> +#include <linux/slab.h>
>> +
>> +/* Addresses to scan */
>> +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 
>> I2C_CLIENT_END };
>> +
>> +enum chips { tmp464 };
>> +
>> +#define MAX_CHANNELS                5 /* chan 0 is internal, 1-4 are 
>> remote */
>> +
>> +/* TMP464 registers */
>> +static const u8 TMP464_TEMP[MAX_CHANNELS] = { 0x00, 0x01, 0x02, 
>> 0x03, 0x04 };
>> +static const u8 TMP464_THERM_LIMIT[MAX_CHANNELS] = { 0x39, 0x42, 
>> 0x4A, 0x52, 0x5A };
>> +static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = { 0x3A, 0x43, 
>> 0x4B, 0x53, 0x5B };
>> +static const u8 TMP464_OFFSET_REMOTE[MAX_CHANNELS] = { 0x40, 0x48, 
>> 0x50, 0x58 };
>> +#define TMP464_N_FACTOR_REG_1            0x41
>> +#define TMP464_CONFIG_REG            0x30
>> +
>> +/* Identification */
>> +#define TMP464_MANUFACTURER_ID_REG        0xFE
>> +#define TMP464_DEVICE_ID_REG            0xFF
>> +
>> +/* Flags */
>> +#define TMP464_CONFIG_SHUTDOWN            BIT(5)
>> +#define TMP464_CONFIG_RANGE            0x04
>> +#define TMP464_CONFIG_REG_REN(x)        (BIT(7 + (x)))
>> +#define TMP464_CONFIG_REG_REN_MASK        GENMASK(11, 7)
>> +#define TMP464_CONFIG_CONVERSION_RATE_B0    2
>> +#define TMP464_CONFIG_CONVERSION_RATE_MASK 
>> GENMASK(TMP464_CONFIG_CONVERSION_RATE_B0, \
>> +                            TMP464_CONFIG_CONVERSION_RATE_B0 + 2)
>> +
>> +/* Manufacturer / Device ID's */
>> +#define TMP464_MANUFACTURER_ID            0x5449
>> +#define TMP464_DEVICE_ID            0x1468
>> +
>> +static const struct i2c_device_id tmp464_id[] = {
>> +    { "tmp464", 0 },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tmp464_id);
>> +
>> +static const struct of_device_id __maybe_unused tmp464_of_match[] = {
>> +    {
>> +        .compatible = "ti,tmp464",
>> +        .data = (void *)5
>> +    },
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(of, tmp464_of_match);
>> +
>> +struct tmp464_channel {
>> +    const char *label;
>> +    bool enabled;
>> +    s16 temp;
>> +};
>> +
>> +struct tmp464_data {
>> +    struct i2c_client *client;
>> +    struct mutex update_lock; /* used to update the struct values */
>> +    u32 temp_config[MAX_CHANNELS + 1];
>> +    struct hwmon_channel_info temp_info;
>> +    const struct hwmon_channel_info *info[2];
>> +    struct hwmon_chip_info chip;
>
> There is really no good reason to have the above structures dynamically
> allocated. They can as well be declared statically. The only dynamic
> attribute is the label, and the visibility of that attribute can be
> controlled with the is_visible callback. After all, that is what
> the callback is for.
>
>> +    bool valid;
>> +    unsigned long last_updated;
>> +    unsigned long channels;
>
> Not sure why this should be unsigned long.
>
>> +    u16 config;
>> +    struct tmp464_channel channel[MAX_CHANNELS];
>> +};
>> +
>> +static int temp_from_raw(s16 reg)
>> +{
>> +    return DIV_ROUND_CLOSEST((reg >> 3) * 625, 10);
>> +}
>> +
>> +static int tmp464_update_device(struct tmp464_data *data)
>> +{
>> +    struct i2c_client *client = data->client;
>> +    int ret = 0;
>> +    int i;
>> +
>> +    mutex_lock(&data->update_lock);
>> +
>> +    if (time_after(jiffies, data->last_updated + (HZ / 2)) ||
>> +        !data->valid) {
>> +        ret = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
>> +        if (ret < 0)
>> +            goto exit;
>> +        data->config = ret;
>> +
>> +        for (i = 0; i < data->channels; i++) {
>> +            ret = i2c_smbus_read_word_swapped(client, TMP464_TEMP[i]);
>> +            if (ret < 0)
>> +                goto exit;
>> +            data->channel[i].temp = ret;
>> +        }
>> +        data->last_updated = jiffies;
>> +        data->valid = true;
>> +    }
>> +
>> +exit:
>> +    mutex_unlock(&data->update_lock);
>> +
>> +    if (ret < 0) {
>> +        data->valid = false;
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int tmp464_enable_channels(struct tmp464_data *data)
>> +{
>> +    int err;
>> +    struct i2c_client *client = data->client;
>> +    struct device *dev = &client->dev;
>> +    int old = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
>> +    int new, i;
>> +
>> +    if (old < 0) {
>> +        dev_err(dev, "error reading register, can't disable 
>> channels\n");
>> +        return old;
>> +    }
>> +
>> +    new = old & ~TMP464_CONFIG_REG_REN_MASK;
>> +    for (i = 0; i < data->channels; i++)
>> +        if (data->channel[i].enabled)
>> +            new |= TMP464_CONFIG_REG_REN(i);
>> +
>> +    if (new == old)
>> +        return 0;
>> +
>> +    err = i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, new);
>> +    if (err < 0)
>> +        dev_err(dev, "error writing register, can't disable 
>> channels\n");
>> +
>> +    return err;
>> +}
>> +
>> +static int tmp464_read(struct device *dev, enum hwmon_sensor_types 
>> type,
>> +               u32 attr, int channel, long *val)
>> +{
>> +    struct tmp464_data *tmp464 = dev_get_drvdata(dev);
>> +    int ret = 0;
>> +
>> +    ret = tmp464_update_device(tmp464);
>> +    if (ret)
>> +        return ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_temp_input:
>> +        if (!tmp464->channel[channel].enabled)
>> +            return -ENODATA;
>> +        *val = temp_from_raw(tmp464->channel[channel].temp);
>> +        return 0;
>> +    case hwmon_temp_enable:
>> +        *val = tmp464->channel[channel].enabled;
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int tmp464_read_string(struct device *dev, enum 
>> hwmon_sensor_types type,
>> +                  u32 attr, int channel, const char **str)
>> +{
>> +    struct tmp464_data *data = dev_get_drvdata(dev);
>> +
>> +    *str = data->channel[channel].label;
>> +
>> +    return 0;
>> +}
>> +
>> +static int tmp464_write(struct device *dev, enum hwmon_sensor_types 
>> type,
>> +            u32 attr, int channel, long val)
>> +{
>> +    struct tmp464_data *data = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_temp_enable:
>> +        data->channel[channel].enabled = val;
>> +        ret = tmp464_enable_channels(data);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static umode_t tmp464_is_visible(const void *data, enum 
>> hwmon_sensor_types type,
>> +                 u32 attr, int channel)
>> +{
>> +    switch (attr) {
>> +    case hwmon_temp_input:
>> +        return 0444;
>> +    case hwmon_temp_label:
>> +        return 0444;
>> +    case hwmon_temp_enable:
>> +        return 0644;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int tmp464_init_client(struct tmp464_data *data)
>> +{
>> +    int err;
>> +    int config, config_orig;
>> +    struct i2c_client *client = data->client;
>> +
>> +    config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
>> +    if (config < 0) {
>> +        dev_err(&client->dev,
>> +            "Could not read configuration register (%d)\n", config);
>> +        return config;
>> +    }
>> +
>> +    /* Set the conversion rate to 2 Hz */
>> +    config_orig = config;
>> +    config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
>> +    config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
>> +
>> +    /* Start conversions (disable shutdown if necessary) */
>> +    config_orig = config;
>> +    config &= ~TMP464_CONFIG_SHUTDOWN;
>> +
>> +    if (config != config_orig) {
>> +        config = i2c_smbus_write_word_data(client, 
>> TMP464_CONFIG_REG, config);
>> +        if (config < 0) {
>> +            dev_err(&client->dev,
>> +                "Could not write configuration register (%d)\n", err);
>> +            return config;
>> +        }
>> +    }
>> +
>> +    return tmp464_enable_channels(data);
>> +}
>> +
>> +static int tmp464_detect(struct i2c_client *client,
>> +             struct i2c_board_info *info)
>> +{
>> +    enum chips kind;
>> +    struct i2c_adapter *adapter = client->adapter;
>> +    static const char * const names[] = {
>> +        "TMP464"
>> +    };
>> +    int reg;
>> +
>> +    if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
>> +        return -ENODEV;
>> +
>> +    reg = i2c_smbus_read_word_swapped(client, 
>> TMP464_MANUFACTURER_ID_REG);
>> +    if (reg < 0)
>> +        return reg;
>> +    if (reg != TMP464_MANUFACTURER_ID)
>> +        return -ENODEV;
>> +
>> +    /* Check for "always return zero" bits */
>> +    reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM_STATUS);
>> +    if (reg < 0)
>> +        return reg;
>> +    if (reg & 0x1f)
>> +        return -ENODEV;
>> +    reg = i2c_smbus_read_word_swapped(client, 
>> TMP464_REG_THERM2_STATUS);
>> +    if (reg < 0)
>> +        return reg;
>> +    if (reg & 0x1f)
>> +        return -ENODEV;
>> +
>> +    reg = i2c_smbus_read_word_swapped(client, TMP464_DEVICE_ID_REG);
>> +    if (reg < 0)
>> +        return reg;
>> +    switch (reg) {
>> +    case TMP464_DEVICE_ID:
>> +        kind = tmp464;
>> +        break;
>> +    default:
>> +        return -ENODEV;
>> +    }
>> +
>> +    strscpy(info->type, tmp464_id[kind].name, I2C_NAME_SIZE);
>> +    dev_info(&adapter->dev, "Detected TI %s chip at 0x%02x\n",
>> +         names[kind], client->addr);
>> +
>> +    return 0;
>> +}
>> +
>> +static int tmp464_probe_child_from_dt(struct i2c_client *client,
>> +                      struct device_node *child,
>> +                      struct tmp464_data *data)
>> +
>> +{
>> +    struct device *dev = &client->dev;
>> +    u32 i;
>> +    s32 val;
>> +    int err;
>> +
>> +    err = of_property_read_u32(child, "reg", &i);
>> +    if (err) {
>> +        dev_err(dev, "missing reg property of %pOFn\n", child);
>> +        return err;
>> +    }
>> +
>> +    if (i >= data->channels) {
>> +        dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
>> +        return -EINVAL;
>> +    }
>> +
>> +    of_property_read_string(child, "label", &data->channel[i].label);
>> +    if (data->channel[i].label)
>> +        data->temp_config[i] |= HWMON_T_LABEL;
>> +
>> +    data->channel[i].enabled = of_device_is_available(child);
>> +
>> +    err = of_property_read_s32(child, "ti,n-factor", &val);
>> +    if (!err) {
>> +        if (i == 0) {
>> +            dev_err(dev, "n-factor can't be set for internal 
>> channel\n");
>> +            return -EINVAL;
>> +        }
>> +
>> +        if (val > 127 || val < -128) {
>> +            dev_err(dev, "n-factor for channel %d invalid (%d)\n",
>> +                i, val);
>> +            return -EINVAL;
>> +        }
>> +        err = i2c_smbus_write_word_data(client, 
>> TMP464_N_FACTOR_REG_1 + i - 1, val);
>> +        if (err < 0)
>> +            return err;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int tmp464_probe_from_dt(struct i2c_client *client, struct 
>> tmp464_data *data)
>> +{
>> +    struct device *dev = &client->dev;
>> +    const struct device_node *np = dev->of_node;
>> +    struct device_node *child;
>> +    int err;
>> +
>> +    for_each_child_of_node(np, child) {
>> +        if (strcmp(child->name, "channel"))
>> +            continue;
>> +
>> +        err = tmp464_probe_child_from_dt(client, child, data);
>> +        if (err) {
>> +            of_node_put(child);
>> +            return err;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct hwmon_ops tmp464_ops = {
>> +    .is_visible = tmp464_is_visible,
>> +    .read = tmp464_read,
>> +    .read_string = tmp464_read_string,
>> +    .write = tmp464_write,
>> +};
>> +
>> +static int tmp464_probe(struct i2c_client *client)
>> +{
>> +    struct device *dev = &client->dev;
>> +    struct device *hwmon_dev;
>> +    struct tmp464_data *data;
>> +    int i, err;
>> +
>> +    if (!i2c_check_functionality(client->adapter, 
>> I2C_FUNC_SMBUS_WORD_DATA)) {
>> +        dev_err(&client->dev, "i2c functionality check failed\n");
>> +        return -ENODEV;
>> +    }
>> +    data = devm_kzalloc(dev, sizeof(struct tmp464_data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    mutex_init(&data->update_lock);
>> +    if (client->dev.of_node)
>> +        data->channels = (unsigned 
>> long)of_device_get_match_data(&client->dev);
>> +    else
>> +        data->channels = i2c_match_id(tmp464_id, client)->driver_data;
>> +    data->client = client;
>> +
>> +    for (i = 0; i < data->channels; i++) {
>> +        data->temp_config[i] = HWMON_T_INPUT | HWMON_T_ENABLE;
>> +        data->channel[i].enabled = true;
>> +    }
>> +
>> +    err = tmp464_probe_from_dt(client, data);
>> +    if (err)
>> +        return err;
>> +
>> +    err = tmp464_init_client(data);
>> +    if (err)
>> +        return err;
>> +
>> +    data->chip.ops = &tmp464_ops;
>> +    data->chip.info = data->info;
>> +
>> +    data->info[0] = &data->temp_info;
>> +
>> +    data->temp_info.type = hwmon_temp;
>> +    data->temp_info.config = data->temp_config;
>> +
>> +    hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>> +                             data, &data->chip, NULL);
>> +
>> +    return PTR_ERR_OR_ZERO(hwmon_dev);
>> +}
>> +
>> +static struct i2c_driver tmp464_driver = {
>> +    .class = I2C_CLASS_HWMON,
>> +    .driver = {
>> +        .name    = "tmp464",
>> +        .of_match_table = of_match_ptr(tmp464_of_match),
>> +    },
>> +    .probe_new = tmp464_probe,
>> +    .id_table = tmp464_id,
>> +    .detect = tmp464_detect,
>> +    .address_list = normal_i2c,
>> +};
>> +
>> +module_i2c_driver(tmp464_driver);
>> +
>> +MODULE_AUTHOR("Agathe Porte <agathe.porte@nokia.com>");
>> +MODULE_DESCRIPTION("Texas Instruments TMP464 temperature sensor 
>> driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.34.1
>>
>
