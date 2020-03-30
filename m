Return-Path: <SRS0=Jj3a=5P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E70AC43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 11:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDC2D20733
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Mar 2020 11:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="rBaAqKKk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgC3Ldn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Mar 2020 07:33:43 -0400
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com ([40.107.92.70]:6247
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729237AbgC3Ldn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Mar 2020 07:33:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isWN2YYlra9IE+h/DyKBrm7bYKHXAvk7N3nwLz0hkWLEorpdJb0vE3A0klzoahpuzV7oAlNupnuBu4cHw1NmsRb2aMdpa9IjQybbnP0zcTdPdzjaXaJr/R58d66RQFyDuQH+O/9/bhM81moUPPmNtP44GGfXeQdZ4LUON/fKWM/n/NEfTlwE8C2eXMkKH4q8yKH90EMsx/pa936ULRpcNJaY8EKu5vi3o8ZMl59RUwMSZhWeLS8BK8aIhokduiHREEMw8IfKLCAVVsRuyLlIWIpn/1Ex15OPbCekqZuYpNZ1tTM9J1pw80GQkwB178drkYv/bXnNB1+9JpV3h8AiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/aghC5xquanb8gudawx9UBV1T/KHyp0hYqL2nYaZk=;
 b=ib2dpyYi37TgCiaC4RH+VM+ASkbAQcJZAvsR5+GeCV4ZzSDoFiyYc8pRgk0GBoujPt76d5i/3HZN/yu8GEbe6CVOWbq3WT7Pdf0lnqMY3AHMkRXb5ThGe1CMx5cmvUuuON+Twv54ntal8bNeZWLn1v+kjl/dpK4jz+n8OCiVQw2gAVbOiHbqj+LAOU98UTnBGam6vd1i70F/chzPFCRaq63o7wuUhw0uvinzM1kC6F33jpVKxNH7ZOF2lfzEgsjg46QhkZSaxnyaQLpDfg36qq+mnIHQDNzRdOX5F16szQ4LgQckQCfiEuX1IoI8Y127rlI5EgeID1MGuaSnXUnU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=sedsystems.ca smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/aghC5xquanb8gudawx9UBV1T/KHyp0hYqL2nYaZk=;
 b=rBaAqKKkdlXRzoDhM6Pn/jinD3uHyQrE7ba+0N6M8Gxkl/5yP/Z/QA+NjJrhd6Od8HknLI0DQx5gtWvU+5XexO/JpCTwIo9YyItPteevSYKu5kc6kTG9w9hySxdz29839DIGdPK/Of+KRDIAkUSC3fOzVYC6tT4DLvueqdlSNp4=
Received: from CY4PR21CA0017.namprd21.prod.outlook.com (2603:10b6:903:dd::27)
 by CH2PR02MB6054.namprd02.prod.outlook.com (2603:10b6:610:12::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Mon, 30 Mar
 2020 11:33:37 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:dd:cafe::2b) by CY4PR21CA0017.outlook.office365.com
 (2603:10b6:903:dd::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.1 via Frontend
 Transport; Mon, 30 Mar 2020 11:33:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Mon, 30 Mar 2020 11:33:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jIsff-0008TK-7S; Mon, 30 Mar 2020 04:33:35 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jIsfa-0003hh-44; Mon, 30 Mar 2020 04:33:30 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02UBXTsJ002032;
        Mon, 30 Mar 2020 04:33:29 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jIsfZ-0003hV-3g; Mon, 30 Mar 2020 04:33:29 -0700
To:     Robert Hancock <hancock@sedsystems.ca>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Linux driver for IRPS5401 - status reg not found
Message-ID: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
Date:   Mon, 30 Mar 2020 13:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(426003)(4326008)(81166006)(8676002)(82740400003)(47076004)(336012)(5660300002)(478600001)(316002)(70586007)(70206006)(110136005)(9786002)(31686004)(2616005)(8936002)(44832011)(186003)(81156014)(31696002)(2906002)(26005)(356004)(36756003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 086074a6-1823-4478-bc9f-08d7d49e2f5d
X-MS-TrafficTypeDiagnostic: CH2PR02MB6054:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6054C89A5610689234C9360DC6CB0@CH2PR02MB6054.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0358535363
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYTQW309dFQ6IVcRuAFS2twQmQPrFyu+Y5VvUFb4eF5iuk/TRYv2WG52E/fIzH+R1kPzXQkCn2B7y3TYq3xdGPO3ejkclhVqRVoCzVy/0wZZAbePTW6oh4cN01BeHTMUxZwjMZ6EG99T1R5mdrfKnFCjmf6HOuzR91mvVELrIdWU2cUDzyBfRNpZgQd2c+NZET8jbL0xZpj9ZZbLyRDCmgntL/B0oEaI9YSY2PPwNYhmkbxhRIvc3tFz1/zMAU/7/MLVX/ZF4LmNthRJLfLlmJdaqIIT09qCkh/1VBpg1TcsSb16CZKadZcwZ8S8Ynd9ZXUeAmCX0XzMFSwgXq6Hd+w4qlZV+bFFWCF5lASbtfTqUVZWbgcmJFBFq28Ik5OpvAXAtqMAV49SP4P7cjqYteldtlTfpoYM5FQZc5E4FblSVj2I9aJ8xZNJ2ipRemhovO3A7NCXn3WcjOQhg4mOex7baNDsJEm3zB1kTUn1+hXCfc+Ifm80isev1PHOqBFXT6NsXJBhE1zuHxFuaXPAiQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2020 11:33:35.9478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 086074a6-1823-4478-bc9f-08d7d49e2f5d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6054
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Robert and Guenter,

Xilinx boards are using IRPS5401 chips and I have tried to use your driver.
I have checked that u-boot can detect that devices and read it.

ZynqMP> i2c probe
Valid chip addresses: 0C 13 14 20 43 44 74
ZynqMP> i2c md 13 0 10
0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
ZynqMP> i2c md 14 0 10
0000: 00 08 00 08 00 08 00 08 00 08 00 08 00 08 00 08    ................
ZynqMP> i2c md 43 0 10
0000: 00 98 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
ZynqMP> i2c md 44 0 10
0000: 00 8a ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
ZynqMP>

Here is DT fragment which I use (it is under i2c mux)

185                         irps5401_43: irps5401@43 {
186                                 compatible = "infineon,irps5401";
187                                 reg = <0x43>; /* pmbus / i2c 0x13 */
188                         };
189                         irps5401_4d: irps5401@44 {
190                                 compatible = "infineon,irps5401";
191                                 reg = <0x44>; /* pmbus / i2c 0x14 */
192                         };

I see that driver is used but with error.

[   37.553740] irps5401 3-0043: PMBus status register not found
[   37.559815] irps5401 3-0044: PMBus status register not found


That's why I want to check with you what could be the problem.

Also I would like to know if there is a way to disable it via any API.
One of this regulator is connected to another device which doesn't have
access to it. It means before powering up this device there is a need to
enable this power regulator. The best via any dedicated API.

Thanks,
Michal
