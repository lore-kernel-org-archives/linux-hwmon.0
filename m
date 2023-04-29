Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F3DC7EE24
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 11:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjD2Lwk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 07:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjD2Lwj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 07:52:39 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 976F11BF0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 04:52:37 -0700 (PDT)
IronPort-SDR: 644d0502_YQeac/yOTJCvtMhaQIVI2i1IRqAdhdIIHMZIgBfSoTje0fb
 ZGq1ckHNw2CvGQkuLykBi4jR6saZ/ek2+nAFOgA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AYAgBQBE1kjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?UaCLoJPtWUPAQ8BAUQEAQGFBgKFQCY4EwECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQUAQEBAUBFhWgNhgQCAQMnCwENAQE3AQ8ZOFcGARKCfoJdsTgzg?=
 =?us-ascii?q?QGCCAEBBoJkmmqBXgmBQYwOZy+DN3pCP4FOgRWCem+BBYMGhnuXNIEzdIEnP?=
 =?us-ascii?q?2+BBAIJAhFrgRAIaHp5QAINZAsLbYFEgxQEAhRCDBRdAmsbBggVARgDBwcCA?=
 =?us-ascii?q?WkDCQMHBUlAAwsYDRY6ESw1FB9LgQsYYwSCAgYBJSSYOnIBgQ2CacQMhAiBW?=
 =?us-ascii?q?Z8TTYFGgjelRpd7IIIuoH6ELQIKBxaBeoF+TR8ZgyJPAxkPjiAXAoITkVFjP?=
 =?us-ascii?q?QIHCwEBAwmIbIJZAQE?=
IronPort-PHdr: A9a23:WFaHHxBTPt/wz6Xsf4clUyQVWBdPi9zP1kY94Js7kPRFaK288ZP4M
 ArS4OgrjVOPVJiIo/tegL/QtKbtEXcF/Y7Hqn0Hd4BBEh4d3Msak1ZyX8eMBR/3cKG6PXVoT
 s9IDQc39HrjbiBo
IronPort-Data: A9a23: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
 z3FFqHYZXBdGq1UeNs=
IronPort-HdrOrdr: A9a23:lE8KhaDZW3A08FrlHel255DYdb4zR+YMi2TDt3oadfWaSK2lfq
 eV7Y0mPX2dslsssRQb9exoV5PwIk80maQb3WBVB8bHYOCEghrPEGgd1/qB/9SIIUSXndK1l5
 0QFJSWY+eRMbEVt6jHCIbUKadZ/DD+ytHMuQ7H9QYQceh1UdAc0+6nMHfhLqWmLDM2f6YEKA
 ==
X-Talos-CUID: 9a23:ELnrXGFMub7+4qYeqmJm02okKvo0KUaM72rxOgycL092Q5eKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AfGflYQ0GePgBvdUuTKa3ZdKD4TUjs66+DGZWiIQ?=
 =?us-ascii?q?/hdS+HgpTBiy+sBSPXdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 29 Apr 2023 21:22:35 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33TBq71I3093879
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 29 Apr 2023 21:52:30 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33TBq71I3093879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1682769151; bh=lh7htZDRdQRdVj2OwYmBtbcAVqi5YPAll5Lv5O9bkNQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GCgVu7t6PjsxaOD5M80Qi8PvQdxqwwwaNXKLeKTLjHyX4sN8US2cC8eUA+Q2Q7S32
         4T49EvsVCwitVBUxyZ+Emiwja+AlfUyg02F/SF9lxykfk89PvbG76yEPNrVU1WOUDQ
         /AH2DodlqOB9oq8JG/im0JAYCcJP/iDxNyuNii4UXb1j+p7Es+uE28/PMxCAnGxjOc
         VNUR4LXXwyd7nA7Wx4SWiMOKU84zRorUoN0SyFHhoxAm06+00mozY/hbaCsXwWoVkh
         h/rx1e+8pXXASqlvheXhSZeAJC88rvzhghBnr0o5zJd7VkL9cmaEiXrS5A+Qqs95eE
         kDQ8umFGpM4kA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 3/3] hwmon: (it87) Update IT8732F chip for 4 fans and PWMs
Date:   Sat, 29 Apr 2023 21:52:05 +1000
Message-Id: <20230429115205.1547251-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429115205.1547251-1-frank@crawford.emu.id.au>
References: <20230429115205.1547251-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 29 Apr 2023 21:52:31 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for 4 fans and 4 PWMs to chipset IT8732F.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index d5482c6ed18f..96c17660ff0f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -377,7 +377,8 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8732F",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
-		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
+		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
+		  | FEAT_FOUR_PWM,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -2932,6 +2933,34 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		if (!(reg & BIT(0)))
 			sio_data->skip_in |= BIT(9);
 
+		sio_data->beep_pin = superio_inb(sioaddr,
+						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
+	} else if (sio_data->type == it8732) {
+		int reg;
+
+		superio_select(sioaddr, GPIO);
+
+		/* Check for pwm2, fan2 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+		if (reg & BIT(1))
+			sio_data->skip_pwm |= BIT(1);
+		if (reg & BIT(2))
+			sio_data->skip_fan |= BIT(1);
+
+		/* Check for pwm3, fan3, fan4 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+		if (reg & BIT(6))
+			sio_data->skip_pwm |= BIT(2);
+		if (reg & BIT(7))
+			sio_data->skip_fan |= BIT(2);
+		if (reg & BIT(5))
+			sio_data->skip_fan |= BIT(3);
+
+		/* Check if AVCC is on VIN3 */
+		reg = superio_inb(sioaddr, IT87_SIO_PINX2_REG);
+		if (reg & BIT(0))
+			sio_data->internal |= BIT(0);
+
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
 	} else {
-- 
2.40.0

