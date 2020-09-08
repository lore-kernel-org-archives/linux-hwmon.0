Return-Path: <SRS0=0Rzu=CR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2972C43461
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 17:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FCCC206B5
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Sep 2020 17:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QreS8P0M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgIHRXa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Sep 2020 13:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731855AbgIHRWv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 13:22:51 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31121C061573
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 10:22:40 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id m25so4123281oou.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=wiVA9m+MofgogQGxgvKlHRxlmpICOgV472fnsp3Uhe4=;
        b=QreS8P0MPMumyDSUu7HBvERSI8LqCiPdBgb+FQHyX8LGNPp4GB0pqabrZFTLGSlpyE
         PqRGxJv5EMMusIFW214qg58W3UdO8UjKFmz+4EMxcDEda2mxB8N5yIP7o4I+QnLxn8LC
         H5nI3yIEGoJhv+TEeKaFKo71ELvrb2r3bD79hlCWxzDXSsteaDJgvbqmTllUn6gpGQnq
         OGQyByyTVHASFBzT7p8tLQwLpOSGFqwtR7SlPAvSab8NH/Asw3ZCrfZ0brmobGAU3BUD
         PUQuMes5JZHRmQ/itqOFUJoM3tRQtreRE3q+XiwIK7bCHOA0VgbBnum06osYEb+s61aX
         vWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=wiVA9m+MofgogQGxgvKlHRxlmpICOgV472fnsp3Uhe4=;
        b=DhTBBpV9S3pZhTUMLN/E7Y3zz2ZJ3fdifL0lAc9dpEgHf7rBf4j/Ci+PALjetRyFdJ
         G75gTxXXpPC9pHScOfvcFXL0eazT25TccI8vQvTEbyOcQOzYMe4gEdDRST/wK+jpTiBn
         EAQi3l3KFVCEYhgNL7a0r0bkOyFSVLsKcf2A+MfQk+4pB0wJGo/r7LxT4dAKEAw/ZHai
         Zme95+buUIEL+7vmecbkUOqVIxg3psCJ779dqebm2D4uToGE0leCinpSpkCQ0tml1O1T
         qYep/JCqyo9MvooZdgZ/dXTlBXzl1f0Xm/3yg23LvX/8BAGcOSWWX93BhQwAxMqzB255
         lxfA==
X-Gm-Message-State: AOAM532dht7O4AxLWYjsPSHNCAn+Gd8UFAWn8A+LkLj9Xch/efBZ5lLd
        UxfwhPtL0tI/ei0tyYkTiteLCU1GtB4=
X-Google-Smtp-Source: ABdhPJwwUWSc5q5yaH6pC9zAXtVfmJTAY9/vJMr66WJlWW3vh57N1QBrqUX+oIkMxkxXhqwaSPr3cQ==
X-Received: by 2002:a4a:1e43:: with SMTP id 64mr6796125ooq.7.1599585759409;
        Tue, 08 Sep 2020 10:22:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9sm1052821oog.6.2020.09.08.10.22.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 10:22:39 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (k10temp) Take out debugfs code
Date:   Tue,  8 Sep 2020 10:22:36 -0700
Message-Id: <20200908172236.186561-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The debugfs code was intended to aid figuring out functionality
of undocumented registers. Turns out that wasn't very helpful,
since register locations change too much between AMD chip revisions,
and the data isn't really valuable for chips where it isn't already
supported. On top of that, its existence has been used as argument
for providing pseudo-API debugfs functions in other drivers.
So let's just take it out.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 73 -----------------------------------------
 1 file changed, 73 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index de9f68570a4f..c86f61bce597 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -21,7 +21,6 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -422,76 +421,6 @@ static bool has_erratum_319(struct pci_dev *pdev)
 	       (boot_cpu_data.x86_model == 4 && boot_cpu_data.x86_stepping <= 2);
 }
 
-#ifdef CONFIG_DEBUG_FS
-
-static void k10temp_smn_regs_show(struct seq_file *s, struct pci_dev *pdev,
-				  u32 addr, int count)
-{
-	u32 reg;
-	int i;
-
-	for (i = 0; i < count; i++) {
-		if (!(i & 3))
-			seq_printf(s, "0x%06x: ", addr + i * 4);
-		amd_smn_read(amd_pci_dev_to_node_id(pdev), addr + i * 4, &reg);
-		seq_printf(s, "%08x ", reg);
-		if ((i & 3) == 3)
-			seq_puts(s, "\n");
-	}
-}
-
-static int svi_show(struct seq_file *s, void *unused)
-{
-	struct k10temp_data *data = s->private;
-
-	k10temp_smn_regs_show(s, data->pdev, ZEN_SVI_BASE, 32);
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(svi);
-
-static int thm_show(struct seq_file *s, void *unused)
-{
-	struct k10temp_data *data = s->private;
-
-	k10temp_smn_regs_show(s, data->pdev,
-			      ZEN_REPORTED_TEMP_CTRL_OFFSET, 256);
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(thm);
-
-static void k10temp_debugfs_cleanup(void *ddir)
-{
-	debugfs_remove_recursive(ddir);
-}
-
-static void k10temp_init_debugfs(struct k10temp_data *data)
-{
-	struct dentry *debugfs;
-	char name[32];
-
-	/* Only show debugfs data for Family 17h/18h CPUs */
-	if (!data->is_zen)
-		return;
-
-	scnprintf(name, sizeof(name), "k10temp-%s", pci_name(data->pdev));
-
-	debugfs = debugfs_create_dir(name, NULL);
-	if (debugfs) {
-		debugfs_create_file("svi", 0444, debugfs, data, &svi_fops);
-		debugfs_create_file("thm", 0444, debugfs, data, &thm_fops);
-		devm_add_action_or_reset(&data->pdev->dev,
-					 k10temp_debugfs_cleanup, debugfs);
-	}
-}
-
-#else
-
-static void k10temp_init_debugfs(struct k10temp_data *data)
-{
-}
-
-#endif
-
 static const struct hwmon_channel_info *k10temp_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX |
@@ -619,8 +548,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
-	k10temp_init_debugfs(data);
-
 	return 0;
 }
 
-- 
2.17.1

