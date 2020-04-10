Return-Path: <SRS0=joRm=52=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C12C2BA2B
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Apr 2020 07:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30BB920692
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Apr 2020 07:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="I0dSM0SJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgDJHTg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Apr 2020 03:19:36 -0400
Received: from mail-co1nam11on2044.outbound.protection.outlook.com ([40.107.220.44]:6045
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgDJHTf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Apr 2020 03:19:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbrUodeX0h2fs70O8+xU0rrr/AX2iAd7rZ/rD3e3soC/qXM4VYgwiCuV3uixilOGJQR2yZC8QfM+goVAsjdXjTG3kBhvp4KzYO53R6yVF2rYBgk4ElGFJp8NMGsJW0IEElDHMp3foT69ih2UXQb9tYvZN51gaNnfm/TYNtHZJmnl2YqoCv8IdulQQBnsG81QIBSGxgkQRgMuYT7mfSMipAWu13aRed1CI+Sum/DLpqX8rVXOalHGq3ZFrJFg4U/Tz5LyBdOHeclvut+wyDyyQyXKmfAHFLBMzraVWV92ChfvHjtZkBjsCzUiTSXspaWfiIVNsKOD1RSc3bkcvJbzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKGlSqE1jYCOfD2LiiBwGfH4L3DNjBQm66kK3Dg6/TI=;
 b=dbogqCj8NFBSmCpuHOpcG0sfa7kmivB9+R8UFrvdo/LDp5cwFpwUJ9hNPgrmdD71NFTAegrooIXnlbNTs/CTs4mNehAjog8QCqePAqJcHSuIjSrZbaf4DZbBOXlBlFDrywaRTSbq7lt8GchJpkiPVbKfZqoLlTkmCZ3mu8Ak6gXYZpqp47zBNsSTxeR1CHCoRsTSNTqNLMxlJWSFw38NOSSq4q7SnOt7HptEM5mZg95Tyu4a/etAO/PDxZjBGHGVZDVRhXIkXzz22DM8IwRjvfPsAdARXHnLEcQ0eMLIsM3O5t/xVABk74I9/dgdRS/dYBQUdJGnVQdFghZ9OWFdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKGlSqE1jYCOfD2LiiBwGfH4L3DNjBQm66kK3Dg6/TI=;
 b=I0dSM0SJG+K6SvHV+nTbtBhxNHolXbz+1SjGPWMx5+zIX6nOMxCnHvPUYnDh9dzrAy38yMz7OlEvc+NRpQuXbygqFIII5tz9Ryd0xttn7Lvm8SJ/p7tjxhKPmOhSUHUGzBtEUTZxo87qRlcF9kDWRxNZ9aDDzum0Ev0gFPOVS9Q=
Received: from CY4PR18CA0065.namprd18.prod.outlook.com (2603:10b6:903:13f::27)
 by DM6PR02MB3993.namprd02.prod.outlook.com (2603:10b6:5:9f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Fri, 10 Apr
 2020 07:19:33 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::9a) by CY4PR18CA0065.outlook.office365.com
 (2603:10b6:903:13f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Fri, 10 Apr 2020 07:19:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 07:19:32
 +0000
Received: from [149.199.38.66] (port=39528 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jMnwO-0003Wm-It; Fri, 10 Apr 2020 00:19:04 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jMnwq-0002Vw-Gr; Fri, 10 Apr 2020 00:19:32 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03A7JVRO024206;
        Fri, 10 Apr 2020 00:19:31 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jMnwo-0002Vh-ST; Fri, 10 Apr 2020 00:19:31 -0700
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Guenter Roeck <linux@roeck-us.net>,
        Robert Hancock <hancock@sedsystems.ca>, monstr@monstr.eu,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
 <20200330194859.GA12459@roeck-us.net>
 <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
 <7a10a855-53a2-0743-be7d-86f6030626ca@seznam.cz>
 <087f0821-bcd5-0f85-3e02-2b95721d1c2d@roeck-us.net>
 <8afd61bc-9a67-0f22-2931-5ac9d084ee3f@sedsystems.ca>
 <ff6483cf-7513-8a2c-f686-5c6782fa50cc@roeck-us.net>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <3d9be1ab-febc-c195-4aca-653cdb87225e@xilinx.com>
Date:   Fri, 10 Apr 2020 09:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ff6483cf-7513-8a2c-f686-5c6782fa50cc@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(5660300002)(356005)(31696002)(47076004)(110136005)(82740400003)(53546011)(70206006)(8936002)(6666004)(70586007)(336012)(36756003)(2906002)(81156014)(316002)(26005)(2616005)(44832011)(186003)(4326008)(81166007)(478600001)(966005)(8676002)(426003)(9786002)(31686004);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f851b281-5a21-4af1-78d5-08d7dd1f8436
X-MS-TrafficTypeDiagnostic: DM6PR02MB3993:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR02MB3993735661CA4BEE3DA96D80C6DE0@DM6PR02MB3993.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0369E8196C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02ruE5oNMFRFuekGOxma9+ovjXP1FvPeGk2nU+U4/zQKXJEqXF0SkwIZCL1K5jcL7JshyuQCJN0ZAp6VT03E9dBjCynua9GUJ5JfBvd3O4O+L7OXylJyadVt9GdLVCEckFbtCyQkHugWiJAAEYAqgCgFbAwgUEwqWBzNXt2spv2AWvN2ZHNKqa0qLhUqOYzqm4s3QSzmQMfWhmP9KDuOyIM5QxaL0OZ8xursJXk4bo8D5Kl8SUdWxBdKiiVvi0cOKeWdrdpcnX1za1KOoMOQW4zoFOFKhvX979DGqaNsGnA/4XKXWbayrHI96XS0wlJOE8c4igBIcvTdJ0q2Pd00mIe7XL9kTY4zDjxsMIL6aQr7K+Y26NUTVmNW6HBGkak5YISBBn4alqT7ZcrsKj+L7tvnkSi7m/9pMb23weydZFextZ0AzVlKeU0dscU+x5rcmJubtoNZqH2DU1v5PV1lN3qXZ7kUFcfd4Xv3/Yq8Wo7fyaXvrBzEklk0zMvkaF9aVMmkZbOCmSNMF51SAy4zEQDmRMbXVATJ8S4oVobqXZVLbdPW09aL9xZfWsh/mTmetHD9SLgB2fs+ZwU6FtAfvw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 07:19:32.8041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f851b281-5a21-4af1-78d5-08d7dd1f8436
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3993
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09. 04. 20 23:23, Guenter Roeck wrote:
> On 4/9/20 8:30 AM, Robert Hancock wrote:
>> On 2020-04-09 9:16 a.m., Guenter Roeck wrote:
>>> Hi Michal,
>>>
>>> On 4/9/20 7:29 AM, Michal Simek wrote:
>>> [ ... ]
>>>>
>>>> Just to let you know issue is with i2c driver. Here is my output for the
>>>> record.
>>>>
>>> Thanks a lot for the update.
>>>
>>>> irps5401-i2c-3-43
>>>> Adapter: i2c-0-mux (chan_id 2)
>>>> vin1:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>>>> vin2:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>>>> vin3:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>>>> vin4:             N/A
>>>
>>> This is interesting; it means that the rail is not active (?) or
>>> not supported, or maybe even that the driver has a bug. The second
>>> chip reports a value here, so I guess the rail is inactive.
>>> If possible, it would be desirable to detect this during probe
>>> and not try to report values for this rail. It would be great if
>>> you can find the time to figure out what is going on.
>>
>> I would assume that either that rail is not used in that board design and was disabled in the non-volatile config on the chip, or alternately the chip allows combining outputs C and D (i.e. 3 and 4) into a single output in which case only one will report valid data. Not sure offhand if there is a way to detect those cases from the PMBus interface at probe time.
>>
> I think it may be the output disable register (0x38). One would have
> to know the i2c address, read the register, and set page bits
> accordingly. Overall, I am not sure if it is worth the trouble.
> Maybe we should just just add a note to the driver documentation.

https://www.xilinx.com/support/documentation/boards_and_kits/zcu104/ug1267-zcu104-eval-bd.pdf

page 83

0x43 is PHASE_C/D combined together a provide 1.2v.

Thanks,
Michal
