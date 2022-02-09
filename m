Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64191C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 15:45:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbiBIPpR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 10:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbiBIPpQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 10:45:16 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60124.outbound.protection.outlook.com [40.107.6.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A313C0613C9
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 07:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V381L8vav3inRR6aFU6Mz4Sowy622TSujl9sVWVzEUA+6qpjDzURMzU/UlTDw5qspMCmPmbm7zLepzqBXzSS1sgWPy9zLHkS5PT8yoUOTF1DF6K4dQK2Oy5TAi+yUTudb/6Fss1wo14GyN2ldCo68Vw3n1v8gmGopBeaVL7kRe082QAXDPZ1xkzS1AbJ56/3U0tDohLoDxaS6J89mSWcraUvDUkvO9+aw2QGMzuBMQnJhwxB7qNGA48+aOIZ0YlpMDX+mkbZhIZlBBoLj9uy6bcrsgHWNJkRGRI1t/xrRr8nCser6XqnTSw1LwcOZ8Gi8cJehhHMnHEcO+ZoBXR3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=henx5jvSGM4uEX3GtTeVMZeXAGfj+YUl5VJSAGvUixk=;
 b=Iq5dPA8JrwFOQEeWt/x0jb2dGLNvUj3cowDEMX8ToTw0LFjNGXLZHMUUFGGW+68CZ7qNXzaTjklMsFFrnsjn7fIwBGc3AcIUs+4cGHHlG8dbwQfNo6z/SbtUYc0KPHRnpb/xqvxpV1/WfgpEDQXmz8Sv/a+EBOJhLPc0LT+vRKq1vDhHqprlUOnxKwDF9+q4WlP7DJRi+cwGTYumZh/5tKyPzYRyYodKy5xHNJOSTW51McnDVbDNM84Zh4AU6ptGvqSW1i3TroAhZsdN9qmMRxEtW1BP46JeskYQ5T76CoF3D2XjzGGiRxUF2FB+czgsl9w4CVkovB6Xcw/88y87WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=henx5jvSGM4uEX3GtTeVMZeXAGfj+YUl5VJSAGvUixk=;
 b=UdnxdmLxegZuJo1selXPjxKrrvJgzDJ+sYq+nTiplalDVZQ+zivAkhC2TVKhv+wey4fIRBxjaPPJL9iKCxK4X6fcsfeEy8Rw72/GsgouQh014vQLoKKhp8n9LGgprWzGddrx/CWAs1sNy9ZJxjaXVt4HLXFoBK1axZfXfgetOuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com (2603:10a6:102:7b::22)
 by AM8PR07MB7666.eurprd07.prod.outlook.com (2603:10a6:20b:240::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.5; Wed, 9 Feb
 2022 15:45:14 +0000
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab]) by PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 15:45:14 +0000
Message-ID: <d8ee6024-4958-18fc-1595-4d4e5a143cba@nokia.com>
Date:   Wed, 9 Feb 2022 16:45:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
From:   Agathe Porte <agathe.porte@nokia.com>
Subject: Re: [PATCH 2/2] hwmon: Add driver for Texas Instruments TMP464 sensor
 chip
To:     Guenter Roeck <linux@roeck-us.net>,
        Agathe Porte <agathe.porte@nokia.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209133617.67297-2-agathe.porte@nokia.com>
 <21c55ad9-dd7a-006e-0a82-9c93a36cc220@roeck-us.net>
Content-Language: fr
In-Reply-To: <21c55ad9-dd7a-006e-0a82-9c93a36cc220@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::22) To PR3PR07MB6921.eurprd07.prod.outlook.com
 (2603:10a6:102:7b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b85236ba-0b2b-4a56-a5f6-08d9ebe329b9
X-MS-TrafficTypeDiagnostic: AM8PR07MB7666:EE_
X-Microsoft-Antispam-PRVS: <AM8PR07MB7666EDAA0CCCE62A4DB523D59B2E9@AM8PR07MB7666.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uYKg9ae1rpEgHlvRAwGy8aSL/Ra/9V8U63Y8O4NoTg5DfxcpWVIxgL2qsG5kba1k6XqSjCRoI0TS8eAZ9KeC9k6LS76Gv/r287UPC8ik08kt/8J26GEKh/lMcrk3s8tJweoLJp0VufpSsN/bPi9fbFYpcfpK7ugagsMuvUj519B5OaIYY05QM2abn6/a+wCNQL0uE0t6Y4+9QDvBqRh6EdnXUaC7WkSmrn3yfOZQw3gs0CNsV/5Bbe3cm7CC4OqNtlNWcXKyoi2VQsbRNtyAZPTyWIl7ZTSyBSWlc/QcnFPk0cb822Q1KxhMljeG0cBGkWuQXZYtm9g/dDTk4Bq8oR66FesMw9ck0duLXjlgPS8tO/NYjckdgd8BJxOLookvEoK0Y2gRAGNXr/rcc8U9YP7/u4BSK7FLQ0pC6lQhG9OrBNDOJ7Nxx9Op0v/pDHAGQdyK2gCJUAg3a5XKh0K6w6uqUjGS/9Ba8+KvkV0bAT1XFUaFsZvpzyawX85ROUWHdaWUazM8GaxNX/z03dzTcIQdZ1o8joaLaHNlQE6BTlwaewO1GHub6CVd1ozQVaWt1gMAv2mv82Q/Ng03PVLQvo+dUp3vHFFN044X5UZxOKiYTuxYfvBdGUorzLbPZg4zH7J/ykatiwTzeAwV2a6hWgBOn2tqfuJbURU53X3+bEaFLP9x04uz7dRU4TFtSQ/nNZt+ioze9roViYLoa1ZgBe2Zs5kAGfGUb0ki6YcFZ2xAbsGbOrM5NXzDmtMhAohxoXW68NZs+gFzntMkutXERzx218SBzYJDXRz5kBxN27rdEXhnPQfSwpe+rGw8TI3NuXAbVPRT3mVBTgQdbHD0l43HFCJRLCdsk6jf0dc6IrUIwYQBj1WCV4cK/d6p7sfh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6921.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(2616005)(316002)(6506007)(30864003)(66556008)(6512007)(2906002)(6486002)(83380400001)(508600001)(38100700002)(66574015)(44832011)(53546011)(82960400001)(66476007)(8936002)(26005)(54906003)(66946007)(86362001)(110136005)(36756003)(8676002)(4326008)(31686004)(31696002)(186003)(107886003)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU0wRmFMZGJsODhBdzh2eGZ5c1FFZEQrcFRFNys2ckE3UVpTWTlvOW1NSDZ5?=
 =?utf-8?B?VVM3TG5aZC9lK083WW9pbEhzcUFHVTZOb2ZlT1ladFNoTGZtd1ZNWmx1YWJa?=
 =?utf-8?B?Sjd3Ykt2WVhrSVA4M0RxRjNQWk4vMW0zcW9JdDNPNStUWnk3M2JncENDRkhz?=
 =?utf-8?B?WFAzRjd3bmtWSVhyMDNWTTFBUGw5SHhTdlpySjU1OWtNbytFcFNyODNPd3F5?=
 =?utf-8?B?YVhESVkrL3llUG1Zdzd4Rmt5UWJjdzNxejd3OTgvbWYybW5xUVhibTZOY3dO?=
 =?utf-8?B?WEplVWlOeWdPSU90WGdYdUkwR0FMVWxYckpnK2EvcTVFTHhiazRXMDhzMUl4?=
 =?utf-8?B?Z3pMLzFDS1pNcDRyeTZxMjhYdzhiWWc4SFRUOWlHc1ZvYzluZ2NEaHBoaDZz?=
 =?utf-8?B?d1dLNUc0U3NDai9YNmhnZ0luaDlibmpDbHlZelpHZlExaEdhZ3dVS0xSYUlt?=
 =?utf-8?B?MlZPb1pmTG9jdXh3b290WUxqQlA2dGZPTGZBbEswQnZkZVVRZ2Vpb0xWTUJq?=
 =?utf-8?B?OHo1dTJIRmlJZ09ReDNSc0MyMWY5U2tNK1lKclVMcHZFNHZpdHpPZUR4ZlRU?=
 =?utf-8?B?VlZlN09seDN6b3ZQcnZBQ1RCRjB0ejkyRk1aUUxTRlJseVR6SmYySWZEYVV5?=
 =?utf-8?B?MjZiUDVGWEN2ckVhNVZTMnE1VGszaC8ybnRnNkZ0Zk03M0Nhd29PZkF2c1NT?=
 =?utf-8?B?ZnNnS3Q1SkptMjRqOGhJZW1sVlFSd1d2SnVvZGJwQzd5aWp4aTJhYng0ak8y?=
 =?utf-8?B?QXlMUTRpZFp2dlo0S1QxVnl0Ty9kOUpYTXV1ZFpKQS9uTHErUFQ3KzdaM0FG?=
 =?utf-8?B?Ukw5ZEt3OS83bzl1OEVhV2hpaUFlWTR3R0ZXZm5hMEtuQjYrN3FJYWN2YmNT?=
 =?utf-8?B?aDNXTncwTkx4RFFWWmx0UlFIVjJRRjM1ZTQwdFRyVEh6NXppZkpUeHNOZ3d0?=
 =?utf-8?B?ZU5zL1NxRi84dmJERlZIVnFLTExaNFNEQklYbVVCQ0lmdEp4MWZ4MTJDaXFG?=
 =?utf-8?B?bjhVOUorSy9KL09Sa2hJRDZ5OWJLVlY2MEJpdFl3TEhnRUo2WGJRQkxWbzY0?=
 =?utf-8?B?dU41aW8yRUV4djVMdnV1YWI3SW8ycW5hdnFENzBhbS9NaEhLL0VXbG9EZk9F?=
 =?utf-8?B?KzRHZHZaNzFVTWNmc2JCd2txWWI3MUFtV3FHTGZveVNHa3pCT1ZheEZ6SjJS?=
 =?utf-8?B?V3h4ejZLeEFaNFFKTEM1QWw5VEx2MUdybGhjdk1OTFcra3Zuc0hBVS8yd2JU?=
 =?utf-8?B?cFFnNGVnbTlSdUZSWWZnQlBwbS9uUlJDWUJzdzNWeXIrcGNsOHhDaS9WZEx5?=
 =?utf-8?B?WnREOEIvdE9TQmZjV1B3UGxsSFU5RWs4VFlWcTY0N0tYL243VjBYcWRXQTM2?=
 =?utf-8?B?Tm9xNlozQjkrd21IUVBTc0pjOXo4Z3JuYzY5dDlEMG9sTWVidmhZTnFDUzFh?=
 =?utf-8?B?M3M3SWZSREVHY2dmMDl4bnhsK1BjZTdlVm5GUjdWbERzbGVkQTU4MnFid3lX?=
 =?utf-8?B?R3N2cWFNUTU4elRldDljWndaYlB3alF4RW5CZ2pnT2ROT25MZ280TUdqbE95?=
 =?utf-8?B?Y3NSUDZBN1doaGZVYzlkdjZMeGFQdEowLzJVdit5ZWtUWVk3QU00RFZSZDds?=
 =?utf-8?B?VkR0QnlBNGI0SVkxeGxvbUdkUldJY2FPQ1JuL1N3amRQY0Y4UGlxYUNqNEtn?=
 =?utf-8?B?VmVVUVIyazZ4MlRGZjVOOFhqZXB1OWovMjIxK1RsTlpRUERyOXVqL00zeWhx?=
 =?utf-8?B?UTkyaWVpNmgzQlNST2w3NTFHbkhoejdvZmgxUStpQmNVeFNWQVEraUV0b2Nr?=
 =?utf-8?B?V3oyclZpYklaT1JGbFNsTXFNZUI5ck5IbFdqZmIyY3daVit6VzR2VzBFdGpF?=
 =?utf-8?B?UUVUYU13UGVDaTMyTWZMbEIwdjJ1NFUrVC9ZOTdqa3I4SEtuWDJ0YndCdjg3?=
 =?utf-8?B?WXd2dis0ajZZaHZNc0lKSFYxZU94RVl0ek45M0o5ZmFuN2F3MlJGVWpiN1Z4?=
 =?utf-8?B?ZDE2R0dycUluc21MQ052Vm9YY3M0RGsyVFFXN1A2TVZJMVowVmNnRDFEK3ZT?=
 =?utf-8?B?VW4vWDN6ay80Q3ZrcGlqZlB1QzJDVmZ2Q21IdHY1Rmx2U1BFbXFDbHo4SExM?=
 =?utf-8?B?WDAya3VEVEp4bit1em4yeXJ1anBBQ3lmVGpJYmtCdlJkWTQ5YndBd0xlcngy?=
 =?utf-8?Q?MrWfb4P6MtRBCQGe1H7C1Cw=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85236ba-0b2b-4a56-a5f6-08d9ebe329b9
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6921.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:45:14.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6d2yi9Q0TE2XlKdmCOE1HPk/UDPm+dikNxwT+B0fD1SPtYkWdj0ONcExrgKYGcLQpF/G9x1YtJHAPLvlTp71w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7666
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Le 09/02/2022 à 15:46, Guenter Roeck a écrit :
> On 2/9/22 05:36, Agathe Porte wrote:
>> Add support for Texas Instruments TMP464 temperature sensor IC.
>>
>> TI's TMP464 is an I2C temperature sensor chip. This chip is
>> similar to TI's TMP421 chip, but with 16bit-wide registers (instead
>> of 8bit-wide registers). The chip have one local sensor and four
>> remote sensors.
>>
>> Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
>> Acked-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> ---
>>   Documentation/hwmon/tmp464.rst |  43 +++
>>   MAINTAINERS                    |   7 +
>>   drivers/hwmon/Kconfig          |  10 +
>>   drivers/hwmon/Makefile         |   1 +
>>   drivers/hwmon/tmp464.c         | 472 +++++++++++++++++++++++++++++++++
>>   5 files changed, 533 insertions(+)
>>   create mode 100644 Documentation/hwmon/tmp464.rst
>>   create mode 100644 drivers/hwmon/tmp464.c
>>
>> diff --git a/Documentation/hwmon/tmp464.rst 
>> b/Documentation/hwmon/tmp464.rst
>
> Needs to be added to Documentation/hwmon/index.rst.
ACK.
>
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
>> index 3e461db9cd91..fa0b27a8fe28 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19457,6 +19457,13 @@ S:    Maintained
>>   F:    Documentation/hwmon/tmp401.rst
>>   F:    drivers/hwmon/tmp401.c
>>   +TMP464 HARDWARE MONITOR DRIVER
>> +M:    Agathe Porte <agathe.porte@nokia.com>
>> +L:    linux-hwmon@vger.kernel.org
>> +S:    Maintained
>> +F:    Documentation/hwmon/tmp464.rst
>> +F:    drivers/hwmon/tmp464.c
>> +
>>   TMP513 HARDWARE MONITOR DRIVER
>>   M:    Eric Tremblay <etremblay@distech-controls.com>
>>   L:    linux-hwmon@vger.kernel.org
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 8df25f1079ba..52b4f5688b45 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1979,6 +1979,16 @@ config SENSORS_TMP421
>>         This driver can also be built as a module. If so, the module
>>         will be called tmp421.
>>   +config SENSORS_TMP464
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
>> index 000000000000..f294e12b1e39
>> --- /dev/null
>> +++ b/drivers/hwmon/tmp464.c
>> @@ -0,0 +1,472 @@
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
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/slab.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/i2c.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>
> Unnecessary include.
ACK.
>
>> +#include <linux/err.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_device.h>
>> +#include <linux/sysfs.h>
>
> Is this include necessary ?
Removed.
>
> Include files in alphabetic order, please.
ACK.
>
>> +
>> +/* Addresses to scan */
>> +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
>> +                         I2C_CLIENT_END };
>
> Unnecessary continuation line.
ACK.
>
>> +
>> +enum chips { tmp464 };
>> +
>> +#define MAX_CHANNELS                5 /* chan 0 is internal, 1-4 are 
>> remote */
>> +
>> +/* TMP464 registers */
>> +#define TMP464_REG_THERM_STATUS            0x21
>> +#define TMP464_REG_THERM2_STATUS        0x22
>> +
>> +static const u8 TMP464_TEMP[MAX_CHANNELS] = { 0x00, 0x01, 0x02, 
>> 0x03, 0x04 };
>> +static const u8 TMP464_THERM_LIMIT[MAX_CHANNELS] = { 0x39, 0x42, 
>> 0x4A, 0x52, 0x5A };
>> +static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = { 0x3A, 0x43, 
>> 0x4B, 0x53, 0x5B };
>> +static const u8 TMP464_OFFSET_REMOTE[MAX_CHANNELS] = { 0x40, 0x48, 
>> 0x50, 0x58 };
>
> Most of those are unused (which would result in static analyzer 
> warnings).
> More on that below.
>
>> +#define TMP464_N_FACTOR_REG_1 0x41
>> +#define TMP464_CONFIG_REG            0x30
>> +
>> +/* alarm offset in THERM_STATUS/THERM2_STATUS register */
>> +#define TMP464_ALARM_BASE_NUMBER        7
>> +
>> +#define TMP464_REG_THERM_HYSTERESIS        0x38
>> +
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
>> +
> No double empty lines, please.
ACK.
>
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
>> +
> No double empty lines, please. checkpatch --strict should tell you 
> that. Please
> run and fix what it reports.
ACK. I only ran checkpatch.pl without the --strict version before. I 
will fix all --strict warnings in v2 patchset
>
>> +struct tmp464_channel {
>> +    const char *label;
>> +    bool enabled;
>> +    s16 temp;
>> +};
>> +
>> +struct tmp464_data {
>> +    struct i2c_client *client;
>> +    struct mutex update_lock;
>> +    u32 temp_config[MAX_CHANNELS + 1];
>> +    struct hwmon_channel_info temp_info;
>> +    const struct hwmon_channel_info *info[2];
>> +    struct hwmon_chip_info chip;
>> +    bool valid;
>> +    unsigned long last_updated;
>> +    unsigned long channels;
>> +    u16 config;
>> +    struct tmp464_channel channel[MAX_CHANNELS];
>> +};
>> +
>> +
>> +/* funcs */
>> +
> Useless comment. Please drop.
ACK.
>
>> +static int temp_from_raw(u16 reg)
>> +{
>> +    int temp = 0;
>> +
>> +    temp = (reg >> 8) * 2000;
>> +    temp += ((reg & 0xFF) >> 3) * 625 / 10;
>> +
>
> This doesn't correctly handle negative temperatures. reg needs to be s16
> to be able to handle those. Also, why not just
>
>     return (reg >> 3) * 625 / 10;
> or
>     return DIV_ROUND_CLOSEST((reg >> 3) * 625, 10);
>
> ?
ACK. I did not think about simplifying the math. Next patchset will use 
DIV_ROUND_CLOSEST and s16.
>
>> +    return temp;
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
>
> We are moving away from local caching. Please consider using regmap 
> instead.
Seems like I was wrong to base my work on the tmp421.c driver. Do you 
have a driver in mind in hwmon that is state-of-the-art and uses regmap 
so that I can inspire myself? Will propose v2 patchset without regmap first.
>
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
>> +
>> +}
>> +
>> +static int tmp464_read_string(struct device *dev, enum 
>> hwmon_sensor_types type,
>> +                 u32 attr, int channel, const char **str)
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
>> +    int config, config_orig;
>> +    struct i2c_client *client = data->client;
>> +
>> +    /* Set the conversion rate to 2 Hz */
>> +    config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
>> +    if (config < 0) {
>> +        dev_err(&client->dev,
>> +            "Could not read configuration register (%d)\n", config);
>> +        return config;
>> +    }
>> +
>> +    config_orig = config;
>> +    config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
>> +    config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
>> +
>> +    if (config != config_orig) {
>> +        dev_info(&client->dev, "Set conversion rate to 2 Hz\n");
>> +        i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
>> +    }
>> +
>> +    /* Start conversions (disable shutdown if necessary) */
>> +    config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
>
> Why read this register twice ?
>
>> +    if (config < 0) {
>> +        dev_err(&client->dev,
>> +            "Could not read configuration register (%d)\n", config);
>> +        return config;
>> +    }
>> +
>> +    config_orig = config;
>> +    config &= ~TMP464_CONFIG_SHUTDOWN;
>> +
>> +    if (config != config_orig) {
>> +        dev_info(&client->dev, "Enable monitoring chip\n");
>
> Please only write the configuration register once, and drop the messages.
ACK. This was inspired from the tmp421.c driver, but there should be no 
reason to read twice.
>
>> +        i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
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
>> +    u8 reg;
>
> Should be int to enable error checks.
ACK.
>
>> +
>> +    if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
>> +        return -ENODEV;
>> +
>> +    reg = i2c_smbus_read_word_swapped(client, 
>> TMP464_MANUFACTURER_ID_REG);
>> +    if (reg != TMP464_MANUFACTURER_ID)
>> +        return -ENODEV;
>> +
>> +    /* Check for "always return zero" bits */
>> +    reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM_STATUS);
>> +    if (reg & 0x1f)
>
> should also check for < 0.
ACK.
>
>> +        return -ENODEV;
>> +    reg = i2c_smbus_read_word_swapped(client, 
>> TMP464_REG_THERM2_STATUS);
>> +    if (reg & 0x1f)
>> +        return -ENODEV;
>
> Should also check for < 0.
ACK.
>
>> +
>> +    reg = i2c_smbus_read_word_swapped(client, TMP464_DEVICE_ID_REG);
>> +    if (reg < 0)
>> +        return reg;
>
> That won't happen with an u8 variable.
ACK.
>
>> +    switch (reg) {
>> +    case TMP464_DEVICE_ID:
>> +        kind = tmp464;
>> +        break;
>
> Are there more devices with the same register set ? If not it is 
> pointless to
> have/prepare support for it.
The tmp468 is the same device with 1+8 channels (tmp464 is 1+4 
channels). Adding TMP468 support would be fairly easy with the current 
structure, but we do not have the hardware to validate it unfortunately.
>
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
>> +        i2c_smbus_write_word_data(client, TMP464_N_FACTOR_REG_1 + i 
>> - 1,
>> +                      val);
>
> needs error check
ACK.
>
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
>> +        I2C_FUNC_SMBUS_WORD_DATA)) {
>> +        dev_err(&client->dev, "i2c functionality check failed\n");
>> +        return -ENODEV;
>> +    }
>> +    data = devm_kzalloc(dev, sizeof(struct tmp464_data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    mutex_init(&data->update_lock);
>> +    if (client->dev.of_node)
>> +        data->channels = (unsigned long)
>> +            of_device_get_match_data(&client->dev);
>
> Unnecessary continuation line.
ACK.
>
>> +    else
>> +        data->channels = i2c_match_id(tmp464_id, client)->driver_data;
>> +    data->client = client;
>> +
>> +    for (i = 0; i < data->channels; i++) {
>> +        data->temp_config[i] = HWMON_T_INPUT | HWMON_T_ENABLE;
>
> Why not support limits, temperature offsets, alarms, hysteresis, and 
> conversion
> rate configuration ? It is kind of off to support n-factor correction but
> nothing else.
>
> Overall it looks like some of the support was dropped since defines for
> limit and offset registers are there, and the driver seems to be prepared
> to support more chips. Why ?

The history of this driver is that it was using older hwmon framework 
practise. During the port to the new framework for upstreaming, we found 
out that we did not have the use of {limits,offsets,alarms} sysfs 
entries, so these features were not ported. They can be added later, 
though. I will drop the #defines for the unused registers meanwhile.

>
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
>> +                             data,
>> +                             &data->chip,
>> +                             NULL);
>
> Please drop some of those continuation lines. We can go up to 100 
> columns and
> should do so in situations like this.
ACK.
>
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
>
