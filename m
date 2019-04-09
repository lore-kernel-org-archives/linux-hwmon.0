Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191EBC10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1E582084F
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="f0MhG2Ro"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfDINHu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:07:50 -0400
Received: from mail-eopbgr800077.outbound.protection.outlook.com ([40.107.80.77]:37742
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726464AbfDINHu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Apr 2019 09:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8J2gbWRjwa6TMfowqCz6imOGOEPrOUKv9NWDoiWGMP8=;
 b=f0MhG2RoSac/g7Pz8cHXd6Gf2B+QsN3P8/k6Qe5qDE0JtV0+YKMaitarz7IxHpSVwYAro8T/5qSl5scyA7KC+Ow1Gqou9kl38TAvBEpqRrDr3bc8g52MuNlYi/FlIHCEu+laZjRDSt8ezJeSGal29m65YRIuZWlKsbypKLrPFto=
Received: from BL0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:207:3c::28)
 by BY2PR02MB2007.namprd02.prod.outlook.com (2a01:111:e400:c505::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1771.19; Tue, 9 Apr
 2019 13:07:46 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::207) by BL0PR02CA0015.outlook.office365.com
 (2603:10b6:207:3c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16 via Frontend
 Transport; Tue, 9 Apr 2019 13:07:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
 via Frontend Transport; Tue, 9 Apr 2019 13:07:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hDqTY-0006V4-KY; Tue, 09 Apr 2019 06:07:44 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hDqTT-0005Bn-HD; Tue, 09 Apr 2019 06:07:39 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x39D7aDb029462;
        Tue, 9 Apr 2019 06:07:36 -0700
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hDqTQ-0005AZ-9o; Tue, 09 Apr 2019 06:07:36 -0700
Subject: Re: pmbus based power regulator
To:     Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>
References: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
 <4d186966-887b-74d8-a00d-e1e4ec10ecd6@roeck-us.net>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <b0914632-7b18-5aee-22bf-edbe1c7a6a18@xilinx.com>
Date:   Tue, 9 Apr 2019 15:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4d186966-887b-74d8-a00d-e1e4ec10ecd6@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(189003)(199004)(186003)(5660300002)(426003)(8676002)(36386004)(53546011)(106002)(23676004)(4326008)(26005)(77096007)(36756003)(31686004)(305945005)(2616005)(11346002)(476003)(2486003)(446003)(44832011)(65826007)(81166006)(81156014)(478600001)(76176011)(336012)(8936002)(126002)(486006)(50466002)(9786002)(316002)(229853002)(2870700001)(6246003)(31696002)(47776003)(356004)(63266004)(110136005)(58126008)(3480700005)(64126003)(2906002)(106466001)(65806001)(65956001);DIR:OUT;SFP:1101;SCL:1;SRVR:BY2PR02MB2007;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 384981de-4270-4d1c-554b-08d6bcec5b8c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4709054)(2017052603328);SRVR:BY2PR02MB2007;
X-MS-TrafficTypeDiagnostic: BY2PR02MB2007:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB2007E16EC2AEAB9517DFA877C62D0@BY2PR02MB2007.namprd02.prod.outlook.com>
X-Forefront-PRVS: 000227DA0C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QgsKZgklazzIbYYr11OBATw0BpmXIrGLOohXOGcHID+5gsenysXG8y+xE2kxI68AUDKH3YjLgtXkKEIgVSEOM4ZZGLraP0nW2wSIycKT/vORzliOdDuQg3IqOvkLUVfuoAkPYlqgBYmeZoU1+7G9bq1rtyIMhCxHC+qbthEITjS3YFGeWr4eZDT4FMX7GdFOhkaVkDiEdGvWbMkha0XmWdxlW9Zsq6n5SIV8nKuqyoBL+KbOHvA6iPAeJEP+sGLdDFK7JsjByTxGxelC/sEPPpxiYtW6qU6mxDSHQ5dCvDRmNNgK1kWDfzBte7tMDm4vYyXc9iGngsMX2hIXEfpI0PW/ymqWYmg8RLwpqQ6hX+rFJ1UAX8JscurRuoilRu1m8mktHQo01RyhtoIGx/b/KwJ+3/2L1XvdAI5gOc1vg2c=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2019 13:07:45.2018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 384981de-4270-4d1c-554b-08d6bcec5b8c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2007
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09. 04. 19 15:05, Guenter Roeck wrote:
> On 4/9/19 5:56 AM, Michal Simek wrote:
>> Hi,
>>
>> I have one question about hwmon/pmbus. I have tps544b25 on the board. I
>> have enabled this chip via DT to get probed. Patch below.
>>
>> I can't see any issue with monitoring but I am curious how to enable
>> setting up voltage. I expect this should be moved to regulator folder or
>> better split done as MFD device.
>>
>> I see there wm831x-hwmon and also wm8350-hwmon but nothing with pmbus
>> wiring.
>> Can you please suggest a way how this should be done?
>>
>> Thanks,
>> Michal
>>
>> commit 0aeba3b5a67eee06d3afe67c71e45a47e8e00f8d
>> Author:     Michal Simek <michal.simek@xilinx.com>
>> AuthorDate: Mon Mar 4 13:51:05 2019 +0100
>> Commit:     Michal Simek <michal.simek@xilinx.com>
>> CommitDate: Thu Mar 28 15:32:03 2019 +0100
>>
>>      hwmon: pmbus: Add DT wiring for ti,tps544b25
>>
>>      This should be enough for DT wiring to get generic functionality.
>>
>>      Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
>> index 7718e58dbda5..be00cd144a2b 100644
>> --- a/drivers/hwmon/pmbus/pmbus.c
>> +++ b/drivers/hwmon/pmbus/pmbus.c
>> @@ -220,10 +220,17 @@ static int pmbus_probe(struct i2c_client *client,
>>
>>   MODULE_DEVICE_TABLE(i2c, pmbus_id);
>>
>> +static const struct of_device_id pmbus_of_match[] = {
>> +        {.compatible = "ti,tps544b25"},
>> +        {}
>> +};
>> +MODULE_DEVICE_TABLE(of, pmbus_of_match);
>> +
>>   /* This is the driver that will be inserted */
>>   static struct i2c_driver pmbus_driver = {
>>          .driver = {
>>                     .name = "pmbus",
>> +                  .of_match_table = of_match_ptr(pmbus_of_match),
>>                     },
>>          .probe = pmbus_probe,
>>          .remove = pmbus_do_remove,
>>
> 

no response?

M
