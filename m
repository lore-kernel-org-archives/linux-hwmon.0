Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEEDC2D0E4
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 22:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 588B320825
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 22:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=fnarfbargle.com header.i=@fnarfbargle.com header.b="cC1DB8Xr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgKLWjS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 17:39:18 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:52450 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgKLWjR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 17:39:17 -0500
Received: from srv.home ([10.8.0.1] ident=heh981)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1kdLEJ-0005su-Qy
        for linux-hwmon@vger.kernel.org; Fri, 13 Nov 2020 06:38:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=c0yRWa3sot9xCKsCbCKaGY9j4i5lzGHdA8C6qqXWAGM=;
        b=cC1DB8XryrVJROSrjlXAjIMWj3HVsxlQ1X4Gt/gKP7OUQIXWtFnVOoUlxfMgzIptO1SU3WgvDfLzZcVqIW36jzA5F2seYD3GLe5j1J5A+L9vsfeJHfDEI4NfRmD5eHjzdE9LQ6ScxK+SuK6uGNG6AZOky9unvlPVvHW00yiJgGo=;
To:     linux-hwmon@vger.kernel.org
From:   Brad Campbell <brad@fnarfbargle.com>
Subject: [PATCH v2] applesmc: Cleanups on top of re-work comms
Message-ID: <4a99004c-e0e8-1b42-cbbd-ad727a238a64@fnarfbargle.com>
Date:   Fri, 13 Nov 2020 09:38:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

A couple of small cleanups on top of the comms changes for applesmc.c :

send_byte() is always called with APPLESMC_CMD_PORT.
Consolidate writing length with other setup parameters.
Consolidate read and write error messages to a single statement each.

Suggested-by: Henrik Rydberg <rydberg@bitmath.org>
Signed-off-by: Brad Campbell <brad@fnarfbargle.com>
---
Changelog :
v1 : Initial cleanup
v2 : Re-work to suit smc-comms rework v6

Index: linux-stable/drivers/hwmon/applesmc.c
===================================================================
--- linux-stable.orig/drivers/hwmon/applesmc.c
+++ linux-stable/drivers/hwmon/applesmc.c
@@ -182,7 +182,7 @@ static int wait_status(u8 val, u8 mask)
 
 /* send_byte - Write to SMC data port. Callers must hold applesmc_lock. */
 
-static int send_byte(u8 cmd, u16 port)
+static int send_byte(u8 cmd)
 {
 	int status;
 
@@ -199,7 +199,7 @@ static int send_byte(u8 cmd, u16 port)
 	if (status)
 		return status;
 
-	outb(cmd, port);
+	outb(cmd, APPLESMC_DATA_PORT);
 	return 0;
 }
 
@@ -240,7 +240,7 @@ static int send_argument(const char *key
 	int i;
 
 	for (i = 0; i < 4; i++)
-		if (send_byte(key[i], APPLESMC_DATA_PORT))
+		if (send_byte(key[i]))
 			return -EIO;
 	return 0;
 }
@@ -255,23 +255,13 @@ static int read_smc(u8 cmd, const char *
 	if (ret)
 		return ret;
 
-	if (send_command(cmd) || send_argument(key)) {
-		pr_warn("%.4s: read arg fail\n", key);
-		return -EIO;
-	}
-
-	/* This has no effect on newer (2012) SMCs */
-	if (send_byte(len, APPLESMC_DATA_PORT)) {
-		pr_warn("%.4s: read len fail\n", key);
-		return -EIO;
-	}
+	if (send_command(cmd) || send_argument(key) || send_byte(len))
+		goto err;
 
 	for (i = 0; i < len; i++) {
 		if (wait_status(SMC_STATUS_AWAITING_DATA | SMC_STATUS_BUSY,
-				SMC_STATUS_AWAITING_DATA | SMC_STATUS_BUSY)) {
-			pr_warn("%.4s: read data[%d] fail\n", key, i);
-			return -EIO;
-		}
+				SMC_STATUS_AWAITING_DATA | SMC_STATUS_BUSY))
+			goto err;
 		buffer[i] = inb(APPLESMC_DATA_PORT);
 	}
 
@@ -287,6 +277,9 @@ static int read_smc(u8 cmd, const char *
 		pr_warn("flushed %d bytes, last value is: %d\n", i, data);
 
 	return wait_status(0, SMC_STATUS_BUSY);
+err:
+	pr_warn("read cmd fail: %x %.4s %d\n", cmd, key, len);
+	return -EIO;
 }
 
 static int write_smc(u8 cmd, const char *key, const u8 *buffer, u8 len)
@@ -298,24 +291,17 @@ static int write_smc(u8 cmd, const char
 	if (ret)
 		return ret;
 
-	if (send_command(cmd) || send_argument(key)) {
-		pr_warn("%s: write arg fail\n", key);
-		return -EIO;
-	}
-
-	if (send_byte(len, APPLESMC_DATA_PORT)) {
-		pr_warn("%.4s: write len fail\n", key);
-		return -EIO;
-	}
+	if (send_command(cmd) || send_argument(key) || send_byte(len))
+		goto err;
 
-	for (i = 0; i < len; i++) {
-		if (send_byte(buffer[i], APPLESMC_DATA_PORT)) {
-			pr_warn("%s: write data fail\n", key);
-			return -EIO;
-		}
-	}
+	for (i = 0; i < len; i++)
+		if (send_byte(buffer[i]))
+			goto err;
 
 	return wait_status(0, SMC_STATUS_BUSY);
+err:
+	pr_warn("write cmd fail: %x %.4s %d\n", cmd, key, len);
+	return -EIO;
 }
 
 static int read_register_count(unsigned int *count)
