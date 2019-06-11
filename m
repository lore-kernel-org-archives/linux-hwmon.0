Return-Path: <SRS0=/b0i=UK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42DBC06508
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jun 2019 17:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A97BA2089E
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jun 2019 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560275942;
	bh=MK9z6qc6477w3QjwaHDf+E3M5nkEx1R3Vk/Ui/ZFJBc=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=I6cMPzeN/iZqd7uxNSjM4YcAfWA34FT6QCvZUZfTqZi6I8qlHNFoYikPkJhATQtKs
	 F4E8Ns8LcStcgGDhZM6OgMpRuqsSDJt2OFQpyp5FcW971IRb6Pl20313tCs/J5ToZU
	 oTK60dne/mDF9G6aZNI+3/d6WT1V22hOM7us8GnA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406791AbfFKR7C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jun 2019 13:59:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:49648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406781AbfFKR7B (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jun 2019 13:59:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D40F2086D;
        Tue, 11 Jun 2019 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560275940;
        bh=MK9z6qc6477w3QjwaHDf+E3M5nkEx1R3Vk/Ui/ZFJBc=;
        h=Date:From:To:Cc:Subject:From;
        b=zX2SpavHeYz6Xkr3kk/NPf9QskVWlUTyrRA22+8TtRPBvTTMHGF0frmsREIEaELZF
         kKX+I1TnZV15Bg6wfCuxVLic3YJYh/O6QUljlAwatp9Tm0agp9KO7Rg3va7t1SS9es
         6HrzD5/9lhlsEpA3MKpVDo7+6u15w9DjPeQOwk3A=
Date:   Tue, 11 Jun 2019 19:58:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Luca Tettamanti <kronos.it@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: asus_atk0110: no need to check return value of
 debugfs_create functions
Message-ID: <20190611175858.GA10077@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Luca Tettamanti <kronos.it@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hwmon/asus_atk0110.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
index 22be78cc5a4c..b5f0abde916b 100644
--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -789,33 +789,16 @@ static const struct file_operations atk_debugfs_ggrp_fops = {
 static void atk_debugfs_init(struct atk_data *data)
 {
 	struct dentry *d;
-	struct dentry *f;
 
 	data->debugfs.id = 0;
 
 	d = debugfs_create_dir("asus_atk0110", NULL);
-	if (!d || IS_ERR(d))
-		return;
 
-	f = debugfs_create_x32("id", 0600, d, &data->debugfs.id);
-	if (!f || IS_ERR(f))
-		goto cleanup;
-
-	f = debugfs_create_file_unsafe("gitm", 0400, d, data,
-				       &atk_debugfs_gitm);
-	if (!f || IS_ERR(f))
-		goto cleanup;
-
-	f = debugfs_create_file("ggrp", 0400, d, data,
-				&atk_debugfs_ggrp_fops);
-	if (!f || IS_ERR(f))
-		goto cleanup;
+	debugfs_create_x32("id", 0600, d, &data->debugfs.id);
+	debugfs_create_file_unsafe("gitm", 0400, d, data, &atk_debugfs_gitm);
+	debugfs_create_file("ggrp", 0400, d, data, &atk_debugfs_ggrp_fops);
 
 	data->debugfs.root = d;
-
-	return;
-cleanup:
-	debugfs_remove_recursive(d);
 }
 
 static void atk_debugfs_cleanup(struct atk_data *data)
-- 
2.22.0

