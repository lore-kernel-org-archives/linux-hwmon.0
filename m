Return-Path: <SRS0=YpYn=ZR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F05C432C0
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 13:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6EDF2075C
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 13:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfKYNWF convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Nov 2019 08:22:05 -0500
Received: from skedge04.snt-world.com ([91.208.41.69]:37846 "EHLO
        skedge04.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKYNWF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Nov 2019 08:22:05 -0500
X-Greylist: delayed 476 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 Nov 2019 08:22:04 EST
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id C7C4F67A91F;
        Mon, 25 Nov 2019 14:13:43 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Nov
 2019 14:13:43 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 25 Nov 2019 14:13:43 +0100
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Thread-Topic: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Thread-Index: AQHVo5IpgkKRfgHMQkil/fmfzLEhKQ==
Date:   Mon, 25 Nov 2019 13:13:43 +0000
Message-ID: <5DDBD386.4070408@kontron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux i686; rv:24.0) Gecko/20100101
 Thunderbird/24.1.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FEDE4D88AFAEA044B906657B79680927@snt-world.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: C7C4F67A91F.AF798
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: gilles.buloz@kontron.com
X-SnT-MailScanner-To: linux-hwmon@vger.kernel.org, linux@roeck-us.net
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

According to the NCT7802Y datasheet, the REG_VOLTAGE_LIMIT_LSB definition is wrong and leads to wrong threshold registers used. It 
should be :
static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
         { 0x46, 0x00, 0x40, 0x42, 0x44 },
         { 0x45, 0x00, 0x3f, 0x41, 0x43 },
};
With this definition, the right bit is set in "Voltage SMI Status Register @0x1e" for each threshold reached (using i2cget to check)

But I'm unable to get any "ALARM" reported by the command "sensors" for VSEN1/2/3 = in2,in3,in4 because status for in0 is read 
before (unless I set "ignore in0" in sensors file). The problem is that status bits in "Voltage SMI Status Register @0x1e" are 
cleared when reading, and a read is done for each inX processed, so only the first inX has a chance to get its alarm bit set.
For this problem I don't see how to fix this easily; just to let you know ...

Best regards

Gilles BULOZ
Senior software(/hardware) engineer | R&D
Kontron Modular Computers S.A.S.
