Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B018C43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 15:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2CB5205ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 15:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="tRbto0gH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbgC3Pqr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 11:46:47 -0400
Received: from mail-dm6nam10on2041.outbound.protection.outlook.com ([40.107.93.41]:6182
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728594AbgC3Pqr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 11:46:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Taln372K7Fl2eOGJljIdh9nOTBl5yZilRaMGqbViPZqDx4N8x160H1fb+P88bG5xsbFD33UQHgnchEKJkne3uFC7GkBufbaKUk31ZyoBuOYv8IfA+DQtmUzWmXGCg++kdPMBM+4SsWwPagQC7ueKFvvvIS8M6QzSXjDVK0YeNeOB/59pP3nBlL1NxXiLhk+d6ZygmSn7Li1ZzVC8E+BK7Hq0hQEzxp0jmpg7gBqWxLXLDYjbgOwpfugtApaXHIgN7mjLwMGhOUnc7B2PyjaviT84tlxbv1pOqlkc0MLDl1LOTHqWMtcEhT5xS6GcOuyvCTGwFSygiCE9xsF+7WcHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UHnEZ1y2mNDSTym5tHlJu3fsdKP6709n9bWpx8fqZg=;
 b=PFZ9+tgfxVgI/xNOwisfmDHuKHwF8aZSuGL8MfZs3Q8vcKSA9CO09K1LuKHqnIBhVadomdPi7NLGizQscjO/0bBrCZoFQm7WdRVSfGdcntGrOmxZCA+FBwYxv3mCUxkbMhmVEj66gYQ4YJqPjSjZiqIv+5W5zNGT5xXBMClN/RMAugDB3MQ7MCN/zHKv2Jd8JDOnQ+lYdFB+hTWxnV2UcwPQSIoOs7u9Z9MXQv3F6px815unyI18dpcno/eQGm3cOfePu7nDSfO1mcTeRTcJ3hKt3slFNIEgtCF9UGxLA+GsDlmKjmtM0SZNqhMrBwxjNYsPwlCC6XFMhxyd/PNlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UHnEZ1y2mNDSTym5tHlJu3fsdKP6709n9bWpx8fqZg=;
 b=tRbto0gH/8qi8bw1EfdEXGWsTNyZ8wkJvWuUVR6Z+qt5+Z+YS8SKmDS4DWZp8i/Zo2AnIggx7IQACHQ+k+vOpEcAsBdQHnpJYvymcbpPrK6ctWB1YPgJm5grl2KrN/OkKDzvwpJbfyli4kOfo+NaIH+H5ufVMNCzhK7bxMVKvGw=
Received: from SN2PR01CA0066.prod.exchangelabs.com (2603:10b6:800::34) by
 DM6PR02MB5401.namprd02.prod.outlook.com (2603:10b6:5:31::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Mon, 30 Mar 2020 15:46:42 +0000
Received: from SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::df) by SN2PR01CA0066.outlook.office365.com
 (2603:10b6:800::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Mon, 30 Mar 2020 15:46:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT011.mail.protection.outlook.com (10.152.72.82) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Mon, 30 Mar 2020 15:46:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jIwcc-0000vq-4J; Mon, 30 Mar 2020 08:46:42 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jIwcX-0002OT-18; Mon, 30 Mar 2020 08:46:37 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02UFkTYQ020812;
        Mon, 30 Mar 2020 08:46:29 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jIwcP-0002Na-Dr; Mon, 30 Mar 2020 08:46:29 -0700
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <f6f3735d-1af2-4d57-d8d5-3b87e9be8b32@xilinx.com>
Date:   Mon, 30 Mar 2020 17:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(53546011)(8936002)(8676002)(81156014)(81166006)(356004)(478600001)(36756003)(2906002)(2616005)(47076004)(26005)(82740400003)(31686004)(426003)(110136005)(44832011)(336012)(4326008)(70206006)(70586007)(31696002)(186003)(316002)(5660300002)(9786002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea4859a5-15aa-4e09-2ed7-08d7d4c18b4b
X-MS-TrafficTypeDiagnostic: DM6PR02MB5401:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5401E37BA765D484F3FFA061C6CB0@DM6PR02MB5401.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0358535363
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFiLsrHaSkVkVgwK0MyxQS+BZ7BaorrT5XlgYIfBtjiNCCik3+KeGsrxc/TnTb9R5G2gp4TavtJH2OvGqQsylYGoo4OQvWwRYw5sajr8cL/QHsPbML0GnQrxU7u5EwUc4ORLTYMjQJ2HkZ88PVz0487gR39K97pJOi1eeNi/aqsvfh3Mp5sQy66Svv12y2w58Kn+CoeMVS05EUDSJcDHOYnIXZVN03FR7kF3dMonAKemWu0p3f7oTh/6K0cVA9iyCQgeBHltLPwKXBjejVbFzY2V+xkqrFzc7AApjJIGqp8CRlvU20HeSKi0Q9lGNu6IAzK7STfh+6KjMk/x6IrgkMB1+7XDHBe5OdLy34Vzq4OGxRN1SoNnRIlaiFvhoVBVCIxXkO0vdTIe5QUr7BcqxU9F/mKG35E0REvSomWuR5w9g3fb5JEf4YIC3MUTL0oNv6oKnQTm9kXJmD1R39AWqbs8/sm27KDgs83YK9ikvXfdTQJpIkBR47wGVIRk2XUH
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2020 15:46:42.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4859a5-15aa-4e09-2ed7-08d7d4c18b4b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5401
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 30. 03. 20 17:24, Guenter Roeck wrote:
> On 3/30/20 4:33 AM, Michal Simek wrote:
>> Hi Robert and Guenter,
>>
>> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
>> I have checked that u-boot can detect that devices and read it.
>>
>> ZynqMP> i2c probe
>> Valid chip addresses: 0C 13 14 20 43 44 74
>> ZynqMP> i2c md 13 0 10
>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>> ZynqMP> i2c md 14 0 10
>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>> ZynqMP> i2c md 43 0 10
>> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>> ZynqMP> i2c md 44 0 10
>> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>> ZynqMP>
>>
>> Here is DT fragment which I use (it is under i2c mux)
>>
>> 185                         irps5401_43: irps5401@43 {
>> 186                                 compatible = "infineon,irps5401";
>> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
> 
> Does that mean the mux is at 0x13 ?

HW guys wrote that 0x13 is i2c address and 0x43 is pmbus address.


> 
>> 188                         };
>> 189                         irps5401_4d: irps5401@44 {
>> 190                                 compatible = "infineon,irps5401";
>> 191                                 reg = <0x44>; /* pmbus / i2c 0x14 */
> 
> Why _4d ?

Sorry - I was checking board and 4d was address on early revision and
didn't update it.

> 
>> 192                         };
>>
>> I see that driver is used but with error.
>>
>> [   37.553740] irps5401 3-0043: PMBus status register not found
>> [   37.559815] irps5401 3-0044: PMBus status register not found
>>
>>
>> That's why I want to check with you what could be the problem.
>>
> 
> PMBus status registers are at 0x78 (byte) and 0x79 (word). The above
> error is reported if reading both returns an error or 0xff / 0xffff,
> which indicates that the chip is not accessible.
> 
> I can say for sure that whatever is at 0x43/0x44, it is very likely
> not an irps5401. If it was, at least registers 0x2 and 0x6 should report
> different values, and 0x01 doesn't look much better (the lower 2 bits
> should never be set).

There is nothing else on schematics. When I try 0x13/0x14 I am getting.
irps5401 3-0013: Failed to identify chip capabilities
irps5401 3-0014: Failed to identify chip capabilities

>> Also I would like to know if there is a way to disable it via any API.
> 
> Not sure what you want to disable. The message ? The PMBus core needs
> to have access to the chip to initialize. If there is no status register,
> there is nothing it can do but to refuse to instantiate.

When driver is probed I would like to be able from user space
enable/disable the specific output from PMIC. This one has 4 VOUTs.


> It might make sense to use i2cdetect / i2cget in Linux to determine
> if the chips are accessible. I'd try reading the status registers (0x78
> to 0x7e), value registers (0x88 to 0x8d, 0x96, 0x97), manufacturer
> id (0x99) and model (0x9a), and i2c device ID (0xad) and revision (0xae).

ok. Will try.

> 
>> One of this regulator is connected to another device which doesn't have
>> access to it. It means before powering up this device there is a need to
>> enable this power regulator. The best via any dedicated API.
>>
> 
> We can add regulator support to the PMBus core or to the irps5401 driver
> if necessary (patches welcome), assuming the regulator in question is
> handled by Linux.

ok.

Thanks,
Michal

