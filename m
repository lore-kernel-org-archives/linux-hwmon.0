Return-Path: <SRS0=Wymy=5Q=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3B3C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Mar 2020 12:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2E3A208E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Mar 2020 12:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="sOLbksqb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730646AbgCaMjK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Mar 2020 08:39:10 -0400
Received: from mail-bn8nam11on2058.outbound.protection.outlook.com ([40.107.236.58]:8570
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730436AbgCaMjK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Mar 2020 08:39:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW7MDN60weQAjqLkYO3wc3mdFeAQLdMXC/c1MjWInwxlp/Tvf2zmDpde5GtElZ0L3xPyi8by6fbaYSjdDdCwF/iymPZpH6HM2YzIc3+LXcU+ECtP5VyWFgT93PjAyqxPCA2436b2l13Wb0wxFZOZkJWTzm1e4sZ7y29m23BKgjO2vO4WnIkpD2+jFRulCZJNZT9Z7k5D67F9s2y15mkpVmeSw5jp9vAloCzxIlqVuu5Qx0cxQ+RBv5JcZTSQxh5ZfNQ6wkBWX7/q1GcDToCYG1cA1TxxVQqKbj3iVwTcPudTQESRy7pzM2HiR0lJR18aOiHRxU3dHsziE0sqU1hauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3EK6CDNZyFgGzVBn0yOu17IDD7J691REdfgfC+wGpg=;
 b=ZAbzcBh7jyLBwnAo0gpZvqRHubWW2VM4S8eIMVuJ1FptpnZKauWA2P/M8sRDXnnurPaOIEGmmSDXkFRl9qCJYv8jUNee/QJSBaAh8gl25fOAsAYmyfXiU39z/RzScCY+MUId2jLaOpnNNEPpdHS4jcHtEcivhp5u/9yfqm2i0v0wSr2cQAEBWzSGek5g/3VxpH8iWb8Ba3/F4afqKHCbWecZdPjBPd2t7SABDw26UpEYm6FU6civWNVUtJ/P2wkLHSdabX53VK+5UAGAGosIWAyfQksVY6Zl8gNTIag/9/W/7iKP10sEE3zUL5oaFOAUq42PACjBGgk7Yj1W9IYNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3EK6CDNZyFgGzVBn0yOu17IDD7J691REdfgfC+wGpg=;
 b=sOLbksqb0SlLFX1r17pVHDXRvk+XKofdYyYD3bReFJYNgorrU6yBZx1rijHLbumZ0DYRbua0bRoDLIw1VsDZ13D3rqMUeQ08LBvAajKV7lxB8+v7DOpU8vqvP24lK7S6nWtpzESoEZ4W/DEyLbS6NGc+KiafMJJ7dsfStiWSxJA=
Received: from SN6PR08CA0015.namprd08.prod.outlook.com (2603:10b6:805:66::28)
 by BY5PR02MB6675.namprd02.prod.outlook.com (2603:10b6:a03:203::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Tue, 31 Mar
 2020 12:39:04 +0000
Received: from SN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::a4) by SN6PR08CA0015.outlook.office365.com
 (2603:10b6:805:66::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Tue, 31 Mar 2020 12:39:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT049.mail.protection.outlook.com (10.152.72.166) with Microsoft SMTP
 Server id 15.20.2856.17 via Frontend Transport; Tue, 31 Mar 2020 12:39:04
 +0000
Received: from [149.199.38.66] (port=50165 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jJGAa-0000gL-7e; Tue, 31 Mar 2020 05:39:04 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jJGAZ-0000s3-Rt; Tue, 31 Mar 2020 05:39:03 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02VCcpQY009396;
        Tue, 31 Mar 2020 05:38:52 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jJGAN-0000mv-Na; Tue, 31 Mar 2020 05:38:51 -0700
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Guenter Roeck <linux@roeck-us.net>,
        Robert Hancock <hancock@sedsystems.ca>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
 <20200330194859.GA12459@roeck-us.net>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
Date:   Tue, 31 Mar 2020 14:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330194859.GA12459@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(4326008)(9786002)(316002)(36756003)(31696002)(47076004)(70206006)(5660300002)(70586007)(2616005)(426003)(336012)(186003)(26005)(44832011)(2906002)(110136005)(31686004)(82740400003)(8676002)(81156014)(81166006)(8936002)(53546011)(478600001)(356004)(966005);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 981f101f-119c-40ca-7140-08d7d5707f18
X-MS-TrafficTypeDiagnostic: BY5PR02MB6675:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6675048A02B1C87D954770E4C6C80@BY5PR02MB6675.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0359162B6D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tiem0NtbEJ6NDGkyaCHdpm34Ewq587HdjdC5zpq2PGCDUVbnHgRSwfqBg8zlMuQCJ88GWNW2D/638CAAS+/4OFfXYosR7vdbkGg+I4fpUMzWPuPL1Pcb0Jay98MnwBNuy7Xk0QXjaCZG251muzyQggqp+1N7CJqh4Q8ConFmiqRabhWce7hUQ6Q58skpQYk58wiKku1/uIa4XbTPmDYfMMMoqK0jDzxpTfrHvC+oTvx96IJJnk75N4JAR3AcfMyDyrJJ7oX7rsmj46oQ/X8uZr+nStIqzLAFaDH9n3BdcEpzUjR8+kHMAeULOiPNWbD+eLUzV8VDrq4UOkRR3A8hmOtoxkam8xGnAQ6oXo8yYYpm+L8VfgADb8hNMwgnG38aGCloDuprxOvszDmRl178rcHArPh76EG6+m6pOn92hLKsN+u95gDENmNG26fF15I6rcYc7kkELwgdLjUZ66f0FN5ser8jLZJuNqlHrrE7lteQsaui4qte4aHMSWqc4QsUM+1x64S4v6d7gEPNDVhvmtP3SaLDmCOrc1GvgHOekt/zY3IKZQoihXKkW9BfA/ogprDA6QKf09sErxGHyha3/aHfw9BO1LwdFZy0CAE59o4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 12:39:04.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 981f101f-119c-40ca-7140-08d7d5707f18
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6675
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 30. 03. 20 21:48, Guenter Roeck wrote:
> On Mon, Mar 30, 2020 at 01:09:56PM -0600, Robert Hancock wrote:
>> On 2020-03-30 12:48 p.m., Guenter Roeck wrote:
>>> On 3/30/20 8:42 AM, Robert Hancock wrote:
>>>> On 2020-03-30 9:24 a.m., Guenter Roeck wrote:
>>>>> On 3/30/20 4:33 AM, Michal Simek wrote:
>>>>>> Hi Robert and Guenter,
>>>>>>
>>>>>> Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
>>>>>> I have checked that u-boot can detect that devices and read it.
>>>>>>
>>>>>> ZynqMP> i2c probe
>>>>>> Valid chip addresses: 0C 13 14 20 43 44 74
>>>>>> ZynqMP> i2c md 13 0 10
>>>>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>>>>> ZynqMP> i2c md 14 0 10
>>>>>> 0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
>>>>>> ZynqMP> i2c md 43 0 10
>>>>>> 0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>>>>> ZynqMP> i2c md 44 0 10
>>>>>> 0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
>>>>>> ZynqMP>
>>>>>>
>>>>>> Here is DT fragment which I use (it is under i2c mux)
>>>>>>
>>>>>> 185                         irps5401_43: irps5401@43 {
>>>>>> 186                                 compatible = "infineon,irps5401";
>>>>>> 187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
>>>>>
>>>>> Does that mean the mux is at 0x13 ?
>>>>
>>>> These chips have two I2C addresses with two separate interfaces: the standard PMBus-compatible interface at an address between 0x40-0x4f, which the irps5401 driver supports, and another proprietary interface at an address between 0x10-0x1f. The specific addresses in those ranges is configured by the value of a resistor on one of the pins.
>>>>
>>>
>>> Ah, sorry, I didn't get that part earlier. Unfortunately, the datasheet
>>> doesn't seem to include a description of the proprietary interface
>>> registers/commands, or maybe I am missing it.
>>>
>>> The chip datasheet does talk a lot about various MTP registers.
>>> Part of that register set is Write_protect_section and
>>> Read_protect_section. Maybe the PMBus registers are all read
>>> protected ?
>>
>> There is a programming guide and register map on the Infineon site under
>> "Additional Technical Information" here:
>>
>> https://www.infineon.com/cms/en/product/power/dc-dc-converters/integrated-pol-voltage-regulators/irps5401m/
>>
> Based on that my best guess would be that either the chips are not at the
> expected addresses, or that the registers are indeed read protected.

I am able to detect that devices.

root@zcu104-debian:/etc/apt# i2cdetect -y -r 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- 13 14 -- -- -- -- -- -- -- -- -- -- --
20: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- 43 44 -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- UU -- -- --

Also disable/enable rail on 0x44 and see power good led on/off

root@zcu104-debian:~# i2cset -y 3 0x44 0 3
root@zcu104-debian:~# i2cset -y 3 0x44 1 0x80 b
root@zcu104-debian:~# i2cget -y 3 0x44 0x78 b

I can't read the rest of regs but checking with hw guys what they have
done with these devices.

Anyway thanks for your help and advices.

Thanks,
Michal


