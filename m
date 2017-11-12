Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:55930 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbdKLVTm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Nov 2017 16:19:42 -0500
Received: by mail-wr0-f195.google.com with SMTP id l8so12748571wre.12
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Nov 2017 13:19:42 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Kees Cook <keescook@chromium.org>, Jean Delvare <jdelvare@suse.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] hwmon: (applesmc) Apply format_template attribute
Date: Sun, 12 Nov 2017 22:19:08 +0100
Message-Id: <20171112211911.27779-2-linux@rasmusvillemoes.dk>
In-Reply-To: <20171112211911.27779-1-linux@rasmusvillemoes.dk>
References: <20171112211911.27779-1-linux@rasmusvillemoes.dk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This serves as human-readable documentation as well as allowing the
format_template plugin to complain about any static initializers of this
struct member that do not have the same set of printf specifiers.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/hwmon/applesmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 5c677ba44014..9e6d23cba23e 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -110,7 +110,7 @@ struct applesmc_dev_attr {
 
 /* Dynamic device node group */
 struct applesmc_node_group {
-	char *format;				/* format string */
+	char *format __format_template("%d");	/* format string */
 	void *show;				/* show function */
 	void *store;				/* store function */
 	int option;				/* function argument */
-- 
2.11.0

