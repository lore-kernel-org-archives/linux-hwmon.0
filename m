Return-Path: <SRS0=bLAx=V5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FA4C19759
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Aug 2019 07:53:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40631206A2
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Aug 2019 07:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730348AbfHAHxf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Aug 2019 03:53:35 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:37889 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHAHxe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Aug 2019 03:53:34 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1ht5u0-0003KC-Gk; Thu, 01 Aug 2019 08:53:32 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1ht5u0-0001DY-5j; Thu, 01 Aug 2019 08:53:32 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org, linux@roeck-us.net
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH] hwmon: (lm75) Fixup tmp75b clr_mask
Date:   Thu,  1 Aug 2019 08:53:24 +0100
Message-Id: <20190801075324.4638-1-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

The configuration register of the tmp75b sensor is 16bit long, however
the first byte is reserved, so there is not no need to take care of it.

Because the order of the bytes is little endian and it is only wanted to
write one byte, the desired bits must be shifted in a 8 bit range.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 3fb9c0a2d6d0..ce5ec403ec73 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -343,7 +343,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->sample_time = MSEC_PER_SEC / 2;
 		break;
 	case tmp75b:  /* not one-shot mode, Conversion rate 37Hz */
-		clr_mask |= 1 << 15 | 0x3 << 13;
+		clr_mask |= 1 << 7 | 0x3 << 5;
 		data->resolution = 12;
 		data->sample_time = MSEC_PER_SEC / 37;
 		break;
-- 
2.11.0

