Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57A3C10F0C
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 974D62082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tTQlWg3D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfDDP6z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44622 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP6y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id y13so1569837pfm.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OBi37IO7N/BNNrbr1bZx4WwNArwgIu2JUTZcpE1DCE=;
        b=tTQlWg3DQK92BPUQdBh7laMU55YWJb7i7nq8wG1bR1/tDZrO9Nh1YLtIJBhpYgdaL4
         mq3XAjssgTzDkcrVCa7168Benb90mnBrhIw95RtKSRqe2kPLqvvXUXBTQTrpBZP43zum
         AEXggI1OoQ7f7vA6sMLIB5vVgGaz5WW70fnRI7DngOHw8Y7XbEbqAzoVCwxjaW9pzrrG
         iOetJBHo5gE0FKOTDa0/yVG6A+JboEaR1O32miicg3prPU30DOVIUNN9JzVnqtT+OkDa
         gZViTxkZSc+slUwKoWYL5sMfhExnd+Z8ehS70j9o7ctTwCY9JTHYgylNngt8jf9sBSrl
         QfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+OBi37IO7N/BNNrbr1bZx4WwNArwgIu2JUTZcpE1DCE=;
        b=TCz0/km5fUrsvpkiV4bJyunQ1rplzmS6sIDPBtiQ8EDc72MzaAoqc+lqOLNkyzCq06
         kcIxVxg0+V0kTfzAnOIysLaItyL7rPlaYHzDkctUka4LmEVwcZ3+TguFU86D5Agk3xrN
         zJZ6nDVd/gGqM0b7WbPVNawDSRtIlJEAbSV3vm8JdzMhrHhhbAlhXJaZwjR0SsRRI+mV
         8S2yF9H4EVtmXa67uAqusVhP93qyWOejbPHkz6QdPv1xOaXst0BtokZMTJLoFQOJeGyX
         3ohZG/zxLMCfDj+rVcbXi7M2WpsYMAvK7+4mtOg2qtHXM/ZON+7rEknp4xFCvg9d6l2i
         Dluw==
X-Gm-Message-State: APjAAAV6D5vzQfXQ9wOOPNojxEyVjk37tn96XOiBTxPIFkq55QEtv1xj
        TAgFQa1XyAKxAiCztG5X2ZO3jzp0
X-Google-Smtp-Source: APXvYqyl1w/7Fbawgg7rilp9+lxTbjMlRINjpGaz0N3Quk6ALW6+1Yx1BgOvI+Eji+JJQftbi7jRfg==
X-Received: by 2002:a63:6ec5:: with SMTP id j188mr6392735pgc.191.1554393533577;
        Thu, 04 Apr 2019 08:58:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u4sm57913510pgn.12.2019.04.04.08.58.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:53 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/24] hwmon: (adt7475) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:22 -0700
Message-Id: <1554393516-30316-10-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
References: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is observed.

drivers/hwmon/adt7475.c:171:34: warning:
	‘adt7475_of_match’ defined but not used

Mark adt7475_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7475.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 0dbb8df74e44..7caec127df86 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -168,7 +168,7 @@ static const struct i2c_device_id adt7475_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7475_id);
 
-static const struct of_device_id adt7475_of_match[] = {
+static const struct of_device_id __maybe_unused adt7475_of_match[] = {
 	{
 		.compatible = "adi,adt7473",
 		.data = (void *)adt7473
-- 
2.7.4

