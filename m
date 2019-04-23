Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA7CC10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D5252077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCCDtwVy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbfDWNdd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:33 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39029 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id l18so7492002pgj.6
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0epv67DQy1tcGredx/ZYA/voDATZj4/orE/2fEAJJhM=;
        b=nCCDtwVyxNHoZmAPbK2YwNTzwrgDsaEnYod6RBsVSFAo8pINhwHnlDwLGRmudX454J
         4cel23BGMnRDkcFIPpht3zBxGakVNuvvumWrb24kFsk0DeM9WrYqSKPsciTcgOZjqXjQ
         BdvIa4rnPoQb/L5E3Z1o1NM9zT1Ik5hQeZs8VQpvkPY0CpT9Q6O60+0glvMv/vuZFfAf
         Vl1Sd4A9bLSCV5bH4TzdIAhgOEjdrmpdBC+z2cv/+q6U5E2W6si56F4HRV7v49VWyz+A
         AvJkfxjztcJ6a5mzJhdfSg4wx5TD3WdnOJ5YiL3NDLZytVxaEntP0jJwCQeOMWXUvotV
         kc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=0epv67DQy1tcGredx/ZYA/voDATZj4/orE/2fEAJJhM=;
        b=H/94kE85dVDwnmBXVdwjL1GooOWQwqQzVnVkWKYPToRuoctmrblNrxKhoQ26e4ZMvm
         8W1RrJ/raWMccszVzbrgHpuxQydPJSsmDP4Z+RHputMbeoUE/ZbjfMOYg5Vl9XSc6ccy
         curnwSnWlWpMbQQY3+fzRoBhpskMdGlbUyA/N6SiTCLDkVHwnIak2BhAupsXAr07lITE
         dHFwp64n3J2hed78bzRj03UfrUIan6LENc+eYqdYrtBCYgCS365vmvEnvke804HJnpM+
         YZmayRKbdFa6DtgspcarpoGZAn4tXtNm5r7r27GeXlpARbU7oV43Ac1Mq5zxR0SXcXYw
         zMiA==
X-Gm-Message-State: APjAAAXf+2636EwFxwn1QnlEbP5ZDq/CyOySDmA2BDWESVi52WCW3bAd
        wwnEU+43JK6eklbKFIQ/Zq9W8RPQ
X-Google-Smtp-Source: APXvYqyUN9Gw11Y6ZrkazFBER6LBxH5S3dt1M91KrXkxE77lthzjDp8YREoFvl+gEFgy+93YaQeoCw==
X-Received: by 2002:a62:6f47:: with SMTP id k68mr27040940pfc.196.1556026412059;
        Tue, 23 Apr 2019 06:33:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m16sm35286271pfi.29.2019.04.23.06.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:31 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 10/11] hwmon: (max6650) Use SPDX license identifier
Date:   Tue, 23 Apr 2019 06:33:10 -0700
Message-Id: <1556026391-15360-10-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace boilerplace license text with SPDX license identifier.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 3c79949a741c..83824e0c9a8e 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * max6650.c - Part of lm_sensors, Linux kernel modules for hardware
  *             monitoring.
@@ -13,22 +14,7 @@
  * chips.
  *
  * The datasheet was last seen at:
- *
  *        http://pdfserv.maxim-ic.com/en/ds/MAX6650-MAX6651.pdf
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #include <linux/module.h>
-- 
2.7.4

