Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC93C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 10:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242709AbhLMKhl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 05:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234822AbhLMKh2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 05:37:28 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23477C042DC2
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 02:19:25 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id l25so50735478eda.11
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Dec 2021 02:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8JJ4SNu5FIGm7ceI3jMmu+iE8e9xRw0Jtq0Hm3ZHe9M=;
        b=Uu+2/MrY7eBNefGdhChFaQhVYraLoPev6jfVi9JADcrOQojzGVxV3En7ZVO/huPF83
         ZR67U1htqHgafCA9PnK2DZWwQTUvmmyKSIlbUNlSzeHI1Ij2t8Dess3zFqASMQKeh7D6
         uVvF2/r1NT2u+eXbh0iWLabI4RUKxy/sCcomZy3PhNqLZDbRjG1dzhZRvDUfPQJhcPB0
         A1ADME3YhMFFZSbHLqkQ8j76jQ7eFd8HWe5eEw1ebn0aetDkMC5u07mUmYd1j4RsPovU
         J2B28YTi5xdCH9nTqMejBXBoxxG2ltp2QiY9l03eptN3zvELmoFBhCmz5FIMavNGbRLT
         vnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8JJ4SNu5FIGm7ceI3jMmu+iE8e9xRw0Jtq0Hm3ZHe9M=;
        b=fykQqBy7U1GHgwGeMjpmKRzd8F/CQUJcKxNlXK5/T+PR+ck8mOo8bY6qyMEGiZXqqv
         2slfj3kjXNnGXXp2XEi+ll+LTEFtJlLvp7T4gAXupg6iEUwBId0Wote6RqjOdQOYsFk0
         SMRON/4c4YoAoyYZFmui+CobqKuhDvJGGEBuA5TUmR/Fzf34wIEepxT43PmKQKc8eX1u
         KvGVG6eg8lnrGueJJ2NYSw6xcpzi8HoOqeuQYMimFnP9D+b5jODrYcubOQ95EzXNgQ4e
         hw+gtRFlRUarU4RUSKwVtCD2ZGrxYsG4/1KE3rOCl6L1U6HU6iHEKNhyvv/PmyZ+aG8C
         RycQ==
X-Gm-Message-State: AOAM532dThz06qvjryHNMGoMwl4PTREDdaIjLRowpad6oa8q0JWcOlpU
        EYRn9O26ZopZhyCC/9yIAxPvu1l50RQny2q+
X-Google-Smtp-Source: ABdhPJyN1yq8DltaKmGB4xUisBk62FlH+Vp4pCwBCEL9OX4vlrPnQw4uRPE1j+KWBOgHq6zJcGq6fQ==
X-Received: by 2002:a05:6402:4387:: with SMTP id o7mr58526542edc.47.1639390763695;
        Mon, 13 Dec 2021 02:19:23 -0800 (PST)
Received: from t41sarthur.home (ip-193-121-10-250.dsl.scarlet.be. [193.121.10.250])
        by smtp.gmail.com with ESMTPSA id q17sm6143284edd.10.2021.12.13.02.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 02:19:23 -0800 (PST)
From:   arthur@aheymans.xyz
X-Google-Original-From: arthur.heymans@9elements.com
To:     linux-hwmon@vger.kernel.org
Cc:     patrick.rudolph@9elements.com,
        Arthur Heymans <arthur.heymans@9elements.com>
Subject: [PATCH 2/3] pmbus/ir38064: Add of_match_table
Date:   Mon, 13 Dec 2021 11:19:01 +0100
Message-Id: <20211213101902.146179-2-arthur.heymans@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213101902.146179-1-arthur.heymans@9elements.com>
References: <20211213101902.146179-1-arthur.heymans@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Arthur Heymans <arthur.heymans@9elements.com>

Signed-off-by: Arthur Heymans <arthur.heymans@9elements.com>
---
 drivers/hwmon/pmbus/ir38064.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 4e91d3e54a4a..429577b027b4 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include "pmbus.h"
 
 static struct pmbus_driver_info ir38064_info = {
@@ -50,10 +51,20 @@ static const struct i2c_device_id ir38064_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, ir38064_id);
 
+static const struct of_device_id ir38064_of_match[] = {
+	{ .compatible = "infineon,ir38060" },
+	{ .compatible = "infineon,ir38064" },
+	{ .compatible = "infineon,ir38164" },
+	{ .compatible = "infineon,ir38263" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ir38064_of_match);
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ir38064_driver = {
 	.driver = {
 		   .name = "ir38064",
+		   .of_match_table = ir38064_of_match,
 		   },
 	.probe_new = ir38064_probe,
 	.id_table = ir38064_id,
-- 
2.33.1

