Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DB7C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 10:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 371852075B
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 10:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="CdKye/9Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbfDJKZ4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 06:25:56 -0400
Received: from mail-eopbgr760085.outbound.protection.outlook.com ([40.107.76.85]:61414
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727943AbfDJKZ4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 06:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCADti7iRhSdfL1HYx1HBZimPRgi3AepQlPWB+GI6v8=;
 b=CdKye/9YSAmrLkFQ8uuGhRcKexETy0ETx0UNBhBtYhBnKCJzZRJoF6qS4/BNZQCgxlZGLjtF1Yd1nraS+xtWFjqkowVFCHuY1TwAZb7fTj3tDmX3MSk/jl/WpB/AJ3FBM7F6U5ibXRjNJYVIU7D4RpeZ6wCft2l35yxD0Uf97kQ=
Received: from BN7PR02CA0019.namprd02.prod.outlook.com (2603:10b6:408:20::32)
 by BL0PR02MB3826.namprd02.prod.outlook.com (2603:10b6:207:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1771.16; Wed, 10 Apr
 2019 10:25:53 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::209) by BN7PR02CA0019.outlook.office365.com
 (2603:10b6:408:20::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.15 via Frontend
 Transport; Wed, 10 Apr 2019 10:25:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
 via Frontend Transport; Wed, 10 Apr 2019 10:25:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37256 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hEAQT-0007Mf-5l; Wed, 10 Apr 2019 03:25:53 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hEAQO-0005dj-1y; Wed, 10 Apr 2019 03:25:48 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x3AAPdVf022809;
        Wed, 10 Apr 2019 03:25:39 -0700
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hEAQE-0005bh-ON; Wed, 10 Apr 2019 03:25:38 -0700
Subject: Re: pmbus based power regulator
To:     Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>
References: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
 <56d2cd52-8098-9e4d-2ad2-ce7a0ead5283@roeck-us.net>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d59bab34-b018-7626-52c4-fd22da05ddd3@xilinx.com>
Date:   Wed, 10 Apr 2019 12:25:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <56d2cd52-8098-9e4d-2ad2-ce7a0ead5283@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(199004)(189003)(76176011)(23676004)(305945005)(53546011)(478600001)(9786002)(186003)(356004)(26005)(44832011)(426003)(77096007)(65806001)(2486003)(336012)(65956001)(126002)(476003)(2616005)(486006)(11346002)(6246003)(8676002)(47776003)(446003)(5660300002)(3480700005)(81156014)(81166006)(31686004)(4326008)(2906002)(36386004)(230700001)(36756003)(106466001)(31696002)(229853002)(63266004)(110136005)(64126003)(58126008)(106002)(316002)(50466002)(65826007)(8936002)(42866002)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR02MB3826;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 077d6c15-26ad-4b95-15e9-08d6bd9ee95a
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4709054)(2017052603328);SRVR:BL0PR02MB3826;
X-MS-TrafficTypeDiagnostic: BL0PR02MB3826:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB3826090B8AB26574CB3D8D99C62E0@BL0PR02MB3826.namprd02.prod.outlook.com>
X-Forefront-PRVS: 00032065B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zHNwzzfhp3Pb/K/szJw52ghmZ7xfFPpH7vgRjifefzqjdxm2kLR+P6h0xPQgrggHaMw0eZHHMaaaBlV8nrNPEz5oeEWkjH6mfBzCu6QObHE+fHLMWvoKJRKcjQA6fRadqL/cv1IxNmJCAKNeSQ1mP+evp/5f3yE0/mR1225MPWPjyHnzfbWyM9LrBmr36PLbtBvdxt7ulv77HQGpDiWH1FubnltUgb0d2X4VUfHlGzijE+Azs86rHexYHbVxCVzfTnAU0oYMLnqhH/+9TXJgVJ7EeLWjRq6t/Vhpg0q21fsk0s9iD5U5eOgGlErV+wDP1eaWxv1D0CBiF1LjLj1HV90VbRP6FkfXskGpovT9e6Si4sxp5FfijwlNCn1lYwtHFmek2PCTn0V9GObp0rsH1NoI44jz6cdQsnltXIEL2bA=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2019 10:25:53.5490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 077d6c15-26ad-4b95-15e9-08d6bd9ee95a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3826
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09. 04. 19 15:20, Guenter Roeck wrote:
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
> 
> Hit the wrong button with my earlier email. Please ignore.
> 
> The pmbus core code does support for registering regulators. See
> drivers/hwmon/pmbus/ltc2978.c for an example. You would have to write a
> front-end driver for the TI chip to pass the necessary parameters to the
> pmbus core. We could try to add generic regulator support to pmbus.c, but
> I hesitate doing that because regulator support is much more critical than
> monitoring code and may require chip specific workarounds.
> 
> Sure, we could try to move the pmbus core code to mfd and try to split out
> regulator and hwmon code from it. That would require moving the core plus
> all front-end drivers. It would be a substantial effort with, as far as I
> can see, little benefit.

ok. It means use pmbus functions from pmbus_regulator_ops and add
missing would be the way to go.

const struct regulator_ops pmbus_regulator_ops = {
	.enable = pmbus_regulator_enable,
	.disable = pmbus_regulator_disable,
	.is_enabled = pmbus_regulator_is_enabled,
};

The way how it is connected on the board is that power regulator has
gpio pin for enabling/disabling and also monitoring feature.
And this is just enabling power for different chip.

Thanks,
Michal




