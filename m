Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1250C10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 12:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AB1020883
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 12:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="FoxhZ//m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfDIM4Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 08:56:24 -0400
Received: from mail-eopbgr800077.outbound.protection.outlook.com ([40.107.80.77]:16620
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726908AbfDIM4X (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Apr 2019 08:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvVDzbgS5GtsU+rVU0is+QNc7vdENN4+v6GckndqmKc=;
 b=FoxhZ//mymYbu/hwIo300tgAOsIn1z4eJOfDPEcgiFxUmfgTgpnULvjJdIgn1OZGOJRS4Z+t+10/GJNOH+tXSyeRZDeIZutCBKD7DTT3gh1WCLAVOkwU54zvc5rnKsL4U2Xma60ra1AWFvSUNjuIEckMXZdGYFphbLUqsZxegd8=
Received: from DM6PR02CA0038.namprd02.prod.outlook.com (2603:10b6:5:177::15)
 by BY2PR02MB155.namprd02.prod.outlook.com (2a01:111:e400:2c20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1771.15; Tue, 9
 Apr 2019 12:56:19 +0000
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by DM6PR02CA0038.outlook.office365.com
 (2603:10b6:5:177::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.14 via Frontend
 Transport; Tue, 9 Apr 2019 12:56:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
 via Frontend Transport; Tue, 9 Apr 2019 12:56:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hDqIU-0006QB-MP; Tue, 09 Apr 2019 05:56:18 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hDqIP-0001xu-JC; Tue, 09 Apr 2019 05:56:13 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x39CuDCk025040;
        Tue, 9 Apr 2019 05:56:13 -0700
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hDqIO-0001xe-P6; Tue, 09 Apr 2019 05:56:12 -0700
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: pmbus based power regulator
CC:     <linux-hwmon@vger.kernel.org>
Message-ID: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
Date:   Tue, 9 Apr 2019 14:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(199004)(189003)(5660300002)(356004)(50466002)(65826007)(64126003)(2616005)(47776003)(44832011)(476003)(63266004)(486006)(126002)(230700001)(478600001)(31696002)(426003)(336012)(9786002)(65806001)(305945005)(31686004)(26005)(106002)(36756003)(106466001)(110136005)(8936002)(23676004)(2906002)(8676002)(3480700005)(81156014)(81166006)(316002)(186003)(2486003)(58126008)(77096007)(4326008)(65956001)(158833001);DIR:OUT;SFP:1101;SCL:1;SRVR:BY2PR02MB155;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 123a301a-c25f-499b-5294-08d6bceac292
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4709054)(2017052603328);SRVR:BY2PR02MB155;
X-MS-TrafficTypeDiagnostic: BY2PR02MB155:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB155885F04640EE39F71A28BC62D0@BY2PR02MB155.namprd02.prod.outlook.com>
X-Forefront-PRVS: 000227DA0C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8CrFTe15fxO4e7iqx4+OXSDRPFLJDoCgRk3bAN3/1bE4HjjYy0fN5/t9sY328FN5iixeU5SEiRePhYXxQdwLTUOZ49if7i8ebnejcq+7tv0d3qsG6RADLsX6uUJT+T2TMJ8Ii6DZKSr6ygeMHIQS6Texm3h9cs00XJYD0BoxWXTi/A1WuoJ+a/L7HgA90GorvUS5IrzKgdfMXFlEFYmQ2+fXvXMT5RyMH+GLts+vzhsqJlg6BymoPKo8O96LnXAOBbfC3fBu9rSeM+pyjkVQDsyTQnGfqVhj/S8YAonHcqhjqoalktU+Ks1eVmSlkKKbXDKAlFwCwXHcbkEEfNrQDpJ4rrB5i8A2aJWs80x/0eJqTqqldCaCUnzkmfKqGtQFUsrra8mjkqT7z9gXsnGq1EZYBGIOUqaehKd3NhUXfjU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2019 12:56:19.0761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123a301a-c25f-499b-5294-08d6bceac292
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB155
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

I have one question about hwmon/pmbus. I have tps544b25 on the board. I
have enabled this chip via DT to get probed. Patch below.

I can't see any issue with monitoring but I am curious how to enable
setting up voltage. I expect this should be moved to regulator folder or
better split done as MFD device.

I see there wm831x-hwmon and also wm8350-hwmon but nothing with pmbus
wiring.
Can you please suggest a way how this should be done?

Thanks,
Michal

commit 0aeba3b5a67eee06d3afe67c71e45a47e8e00f8d
Author:     Michal Simek <michal.simek@xilinx.com>
AuthorDate: Mon Mar 4 13:51:05 2019 +0100
Commit:     Michal Simek <michal.simek@xilinx.com>
CommitDate: Thu Mar 28 15:32:03 2019 +0100

    hwmon: pmbus: Add DT wiring for ti,tps544b25

    This should be enough for DT wiring to get generic functionality.

    Signed-off-by: Michal Simek <michal.simek@xilinx.com>

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7718e58dbda5..be00cd144a2b 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -220,10 +220,17 @@ static int pmbus_probe(struct i2c_client *client,

 MODULE_DEVICE_TABLE(i2c, pmbus_id);

+static const struct of_device_id pmbus_of_match[] = {
+        {.compatible = "ti,tps544b25"},
+        {}
+};
+MODULE_DEVICE_TABLE(of, pmbus_of_match);
+
 /* This is the driver that will be inserted */
 static struct i2c_driver pmbus_driver = {
        .driver = {
                   .name = "pmbus",
+                  .of_match_table = of_match_ptr(pmbus_of_match),
                   },
        .probe = pmbus_probe,
        .remove = pmbus_do_remove,
