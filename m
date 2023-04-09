Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8E4C761A6
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Apr 2023 03:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjDIDrw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDIDrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Apr 2023 23:47:51 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8209F5FC7
        for <linux-hwmon@vger.kernel.org>; Sat,  8 Apr 2023 20:47:50 -0700 (PDT)
IronPort-SDR: 64323565_6Zg6p2GYjYHZCjC1E4qvRQISOlPY99nOkzf77bXwxkkIyLi
 TWBDk0G1YVTaVIZWa8ACjuMgHRlWv+rTrof9ANA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2A9AABgNDJkjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?TQFAQELAYItgk+zX4F+DwEPAQFEBAEBhQYChT0mNgcOAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBBQBAQEBQEWFaA2GBAIBAzIBDQEBNwEPGThXBgESg?=
 =?us-ascii?q?n6CXa0mgQGCCAEBBoJimmqBXgmBQQGLc4EWgzZ6Qj+BToR9gQWKAZovCoE0d?=
 =?us-ascii?q?oEgDkpzgQQCCQIRa4EQCGeBeUACDWQLDm+BSoMqBAIUZAMJAwcFSUADCxgNF?=
 =?us-ascii?q?joTLDUUIF5sLRISBQMLFSpHBAg4Bhw0EQIIDxIPLEQOQjczEwZcASkLDhEDT?=
 =?us-ascii?q?kEZbASCBwoGASYknmBZNaRJoheEB4FZnxRNgUanfJdzIKISgRiELAIKBxaBa?=
 =?us-ascii?q?gyCAk0fGYMiTwMZD44gFwKCE5FRYz0CBwsBAQMJi0UBAQ?=
IronPort-PHdr: A9a23:jK62kh9xS3Z34/9uWBXoyV9kXcBvk7/1IhVT4YAulLxJaKjl8pH/e
 k3To/xw3xfAR46O7fVChqLNtrz4H3YN5JGdvTUDaMlCWxNf25oflgByDJLaWR+ifqzhZXViT
 s9JDAANwg==
IronPort-Data: A9a23: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
 QryJlWrVvRp/qxUeA==
IronPort-HdrOrdr: A9a23:71G2IaP1HpYdWsBcThujsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re5cjyt3fP5Qr5PUtNpTnuAtjifZqxz/FICMwqTNOftWrdyQ2Vxf9ZnOnfKlTbckWUygce79
 YGT0EUMr3N5DZB4/oTb2SDYq4dKaG8gcWVbP/lvgtQpB9RGtxdBthCe32m+pwffng9OaYE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 09 Apr 2023 13:17:50 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3393lL5F3520033
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 9 Apr 2023 13:47:45 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3393lL5F3520033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681012065; bh=QPQlEILNhpC+4dyvIaSwb9cC+7iyBROR//eSRBiUoQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ye4cbGc4QhJvgb4BtML1NXZyhXWo3qXDP+fA29WnEaEeVuT4YD9ynpA4Dk133WaSr
         uwsVhmPKW0852ODgRYycspKGQTce8UcTUz+kN/IJNLsFO9DRqMYQeFX+FnW2X5dXp1
         jgTLdgALc27yrySv6x4JKLoY06XZ0+jV+kUYH3arZ06xV41HcrP/WdDqj7/o7Nl4Ec
         miPmzvUNT24AmellMB3mbd1ABb8YIm2vPHCOXfy9VDaBH3ULo79jCMSmwgukgxCNn1
         S80GvBSAAdzKV4C45BVuw63CVDXGHhycMjV1Fmacp6E78JeH9EBxYgPyxQ572CoJlf
         zTlyfQOMqCOcA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 4/4] hwmon: (it87) Disable/enable SMBus access for IT8622E chipset.
Date:   Sun,  9 Apr 2023 13:47:18 +1000
Message-Id: <20230409034718.1938695-5-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409034718.1938695-1-frank@crawford.emu.id.au>
References: <20230409034718.1938695-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 09 Apr 2023 13:47:45 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Configure the IT8622E chip to disable/re-enable access via an SMBus when
reading or writing the chip's registers.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index a3d26ef2cd31..106ec7905882 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -474,6 +474,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V,
 		.peci_mask = 0x07,
+		.smbus_bitmap = BIT(1) | BIT(2),
 	},
 	[it8628] = {
 		.name = "it8628",
-- 
2.39.2

