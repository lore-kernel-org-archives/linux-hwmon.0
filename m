Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8CDC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243405AbiANQfc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:35:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243424AbiANQfa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 11:35:30 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D786C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:30 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so10610466oti.11
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 08:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ElDBSJutI34QIghs6GJJ5wG5TUz1qMgXiR9SDemwGRo=;
        b=l/tRkEuHdp/KBm15qsHylQIZTudu16i+VMAGEGG6xclSJ8cqk4+3CxQrw970CyHZzo
         9xROEDtYIoW47h05Jv0i0yTCfOGRmSSMmyPzgJp5hfOKxQVeLYTe8fMLjuhugZr3V9rp
         roC7kMRiE0UETDb2BKAyNN32VAhOm24vaq+HKMjg55Lgn5WePM4K+1R+yDYiIVn2VtLh
         bVDyU3kJYZUcUh1Y5Wou4/oyOwCR+2hTGLiCGOniRiaSh4d9Pod+YfYZbWQFbIHsANJB
         TgwvYcXnom/OwFHVq8b1ZSNJAU4SmJGSmY95Oum56x610i/khqncGXaY8nuey2XaG3SA
         7Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ElDBSJutI34QIghs6GJJ5wG5TUz1qMgXiR9SDemwGRo=;
        b=T7SzArRoKvTivfenUOUCGbJ9V51893135fP9Q2Hnpr74gGqluQ0Zg+yMwyrPeVIPDf
         WzdEeNFLs9XNOWucEnnLTq6x2ENGM+5UBLX92dRhqLERInQdK6dYKmQpfFPdO50soldH
         CthbF7p5c0XQITJkqQ6DFhfrj4pnzjhcf8XcUpE+w/USFNCtqdEcwjIlA7c9iIzN19+F
         R+CmILWkrEpQ70qtneBq0oQsMYTplwK57xpUbX8xwA8WlvrlflM0ct6tVZKhnGm7hDmO
         rDKk4dqmZgwxbXXTRo/zPdbW3kkofFEm+gFGMnuS1rr1p5rGbXrYw/WH3Xv1MoIL5apg
         Jeig==
X-Gm-Message-State: AOAM5308os5bcetbiHPdt/dO0Ahhwx5Peh1XwO0xjBZT3EHv4M+7vuqD
        DxmoDuOhCBKFH2xl8rBIfYeo/L4BmGI=
X-Google-Smtp-Source: ABdhPJzokufWn4XKNnkliBpCABPgNbyJUF7/6/VmWjSTNMwitlR8EPnBTqf5JmjwzdDFLaB3q9M+KQ==
X-Received: by 2002:a9d:685a:: with SMTP id c26mr7433124oto.239.1642178129369;
        Fri, 14 Jan 2022 08:35:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a2sm2026383oon.37.2022.01.14.08.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:35:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/8] hwmon: (lm83) Explain why LM82 may be misdetected as LM83
Date:   Fri, 14 Jan 2022 08:35:11 -0800
Message-Id: <20220114163512.1094472-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114163512.1094472-1-linux@roeck-us.net>
References: <20220114163512.1094472-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to the March 2013 revision of the LM82 datasheet, the latest
LM82 die revision is 0x03. This was confirmed and observed with a real
chip. Further details in this revision of the LM82 datasheet suggest that
LM82 is now just a repackaged LM83. Such versions of LM82 will be detected
as LM83. Add comment to the code explaining why this may happen.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm83.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 82d7ef264f6f..d9ee01ca8aed 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -334,6 +334,14 @@ static int lm83_detect(struct i2c_client *client,
 	chip_id = i2c_smbus_read_byte_data(client, LM83_REG_R_CHIP_ID);
 	switch (chip_id) {
 	case 0x03:
+		/*
+		 * According to the LM82 datasheet dated March 2013, recent
+		 * revisions of LM82 have a die revision of 0x03. This was
+		 * confirmed with a real chip. Further details in this revision
+		 * of the LM82 datasheet strongly suggest that LM82 is just a
+		 * repackaged LM83. It is therefore impossible to distinguish
+		 * those chips from LM83, and they will be misdetected as LM83.
+		 */
 		name = "lm83";
 		break;
 	case 0x01:
-- 
2.33.0

