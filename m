Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395A3C7EE2C
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 May 2023 15:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244211AbjEZPvn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 May 2023 11:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbjEZPvl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 May 2023 11:51:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C33119D
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 08:51:39 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so9768825e9.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685116298; x=1687708298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZLvcn7A0wnGJENYyvOLEp8aEHrm6DQLUEKmnSDRotM=;
        b=IzrzbkJI7awPpKi/1IMadYXwZrMR9srO8aaQ98zcyikkxuP9sojEB8QCH6Olwj3mrW
         o05J36jiom3JuC8obU1R6txfX2/b3Q7R7mYrBGZe2NpYdJKzQi+4UqcqbEFaad/sV1FV
         UWvPOa0uEL8O7QhkBTvY42LxIZ0q280kpYxzEq8jTQaM1CD0KvPzqTd7wismbFNXR+0I
         WeElP4pojsgMmPNn0/dQKaBIyei1S3QzLqhZl8zZND03oUTEt+sKZslKznW4hNxEIQb7
         0jtZ1DqzfyIoaGxNExapG4MDD4QZvBAf9TzFryVP40cXdyc/wKrp2k2r8QQM/ysexsiI
         O+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116298; x=1687708298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZLvcn7A0wnGJENYyvOLEp8aEHrm6DQLUEKmnSDRotM=;
        b=SJ4cYcrDW6DVEbb8yrSdth3KV1BcNR5gfzjkj5NsPPFCG12tRQuGBM9mghRinNodVg
         Auq2qY0BWVyV8txPJy4+Sz5RI3M6fRLFb/uFQ3OA8NAl4j/Yp/vIWLPhMpMGZJYsvI7I
         /mmEJS57Hwn34Rfzz1EvVlYf1/1nu3j6K0OKkOa5d9wYv9s4YCiSoEEWNQSm3DOkGDHh
         H9Oe+dRZvuWPJg3TN4aZtMTq265u/eAtGbeh2IgVn2nx6Irh3dEb7d0+Ax1+NiLzwxYx
         e2dNu3wgOgmk0fJw9J00NoDuUHkGP1TwRZUKCmc1VET7u04iB7kSW1r71lF4WgN00jAr
         a9Wg==
X-Gm-Message-State: AC+VfDxSOUhb7iCHFYgjMC87PiuJlhMJUIYiugrp9TJ+AawbBYy8ewg7
        R1U3Y7Sl8Y7QNpKIYEaoei6o/2Hh8dQ=
X-Google-Smtp-Source: ACHHUZ5+gtlBcmOr3ifGC+2TR4Zv0by+weT0R+gzbl39ka9eN5uBjJ0nQ1yk9WTgJ96FAcQunf1urA==
X-Received: by 2002:a1c:ed0b:0:b0:3f6:b36:c337 with SMTP id l11-20020a1ced0b000000b003f60b36c337mr2139562wmh.1.1685116297210;
        Fri, 26 May 2023 08:51:37 -0700 (PDT)
Received: from Osmten.. ([223.123.105.92])
        by smtp.gmail.com with ESMTPSA id a13-20020adffacd000000b003064600cff9sm5516986wrs.38.2023.05.26.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:51:36 -0700 (PDT)
From:   Osama Muhammad <osmtendev@gmail.com>
To:     linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, Osama Muhammad <osmtendev@gmail.com>
Subject: [PATCH v2] hwmon:(pmbus/ucd9000): Drop unnecessary error check for debugfs_create_dir
Date:   Fri, 26 May 2023 20:49:06 +0500
Message-Id: <20230526154906.6370-1-osmtendev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch removes the error checking for debugfs_create_dir
in ucd9000.c. This is because the debugfs_create_dir() does not
return NULL but an ERR_PTR after an error.
The DebugFS kernel API is developed in a way that the
caller can safely ignore the errors that occur during
the creation of DebugFS nodes.The debugfs Api handles
it gracefully. The check is unnecessary.

Link to the comment above debugfs_create_dir:
https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L565

Signed-off-by: Osama Muhammad <osmtendev@gmail.com>

---
changes since v1
	-Added more descriptive commit message.
---
 drivers/hwmon/pmbus/ucd9000.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3daaf2237832..73559afa8ba7 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -512,8 +512,6 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 		return -ENOENT;
 
 	data->debugfs = debugfs_create_dir(client->name, debugfs);
-	if (!data->debugfs)
-		return -ENOENT;
 
 	/*
 	 * Of the chips this driver supports, only the UCD9090, UCD90160,
-- 
2.34.1

