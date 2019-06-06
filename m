Return-Path: <SRS0=soXM=UF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61C0C04AB5
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Jun 2019 09:04:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B869A20693
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Jun 2019 09:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="SWwsdcCJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfFFJEU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Jun 2019 05:04:20 -0400
Received: from condef-01.nifty.com ([202.248.20.66]:50243 "EHLO
        condef-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbfFFJEU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Jun 2019 05:04:20 -0400
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jun 2019 05:04:19 EDT
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-01.nifty.com with ESMTP id x568rhTi012439
        for <linux-hwmon@vger.kernel.org>; Thu, 6 Jun 2019 17:53:43 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x568qm01005372;
        Thu, 6 Jun 2019 17:52:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x568qm01005372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559811169;
        bh=pZ4HBFAh5BtsZWFsg7wyba7v0h5C2a1XnrOWlBArZ2c=;
        h=From:To:Cc:Subject:Date:From;
        b=SWwsdcCJoFRGyTO417deZc3agtRGUaLTCfCX7qbigFxKX/OhtekU/eoC3QZq/rEN3
         ZbhbTxFHpqVsvui8UIwuANeKsVZe0VAzt7IQp4LTMxAmChYxRJEiM6QQHS0U1tHGSw
         +1VhZAEk85yUVjW9zbjcwB2HyJT1id7m2E4u93G9VfQVVO6yRiWVmwDeYqTHzXr5n3
         67HiKpovypkUzYiOZ2uo8BLoh5CJdH6O0tvw+baq7uTgP/wg8igXEOn9/NuALprb2m
         CESNGX8KGAK1YV3cB/Ykm8q4RaXWKoaAEu5etB+rzM6bIRcHuk0B726esUfdkTXd0N
         qDB/GfUcOGa0A==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (smsc47m1) fix (suspicious) outside array bounds warnings
Date:   Thu,  6 Jun 2019 17:52:42 +0900
Message-Id: <20190606085242.31347-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Kbuild test robot reports outside array bounds warnings.

This is reproducible for ARCH=sh allmodconfig with the kernel.org
toolchains available at:

https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/x86_64-gcc-8.1.0-nolibc-sh4-linux.tar.xz

  CC [M]  drivers/hwmon/smsc47m1.o
drivers/hwmon/smsc47m1.c: In function 'fan_div_store':
drivers/hwmon/smsc47m1.c:370:49: warning: array subscript [0, 2] is outside array bounds of 'u8[3]' {aka 'unsigned char[3]'} [-Warray-bounds]
  tmp = 192 - (old_div * (192 - data->fan_preload[nr])
                                ~~~~~~~~~~~~~~~~~^~~~
drivers/hwmon/smsc47m1.c:372:19: warning: array subscript [0, 2] is outside array bounds of 'u8[3]' {aka 'unsigned char[3]'} [-Warray-bounds]
  data->fan_preload[nr] = clamp_val(tmp, 0, 191);
  ~~~~~~~~~~~~~~~~~^~~~
drivers/hwmon/smsc47m1.c:373:53: warning: array subscript [0, 2] is outside array bounds of 'const u8[3]' {aka 'const unsigned char[3]'} [-Warray-bounds]
  smsc47m1_write_value(data, SMSC47M1_REG_FAN_PRELOAD[nr],
                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~

Looking at the code, I believe these are false positives.

While it is ridiculous to patch our driver to make the insane
compiler happy, clarifying the unreachable path will be helpful
not only for compilers but also for humans.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Use unreachable() instead of WARN_ON()
 - Mention that the report seems suspicious

 drivers/hwmon/smsc47m1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index cc6aca6e436c..6d366c9cb906 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -351,6 +351,8 @@ static ssize_t fan_div_store(struct device *dev,
 		tmp |= data->fan_div[2] << 4;
 		smsc47m1_write_value(data, SMSC47M2_REG_FANDIV3, tmp);
 		break;
+	default:
+		unreachable();
 	}
 
 	/* Preserve fan min */
-- 
2.17.1

