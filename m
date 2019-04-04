Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97375C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69CD62082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKqjXJlN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbfDDP64 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:56 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32794 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP64 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:56 -0400
Received: by mail-pf1-f196.google.com with SMTP id i19so1598047pfd.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gPoFOn3NlTkN+37WZrKkWNwVi59CfA++e4iS3RJ9UEY=;
        b=KKqjXJlN37Hqp2XCykNh8i4ZP+Eup8TXZwSypBBHRnUL9KZC7jVss1q9CB+D4Occl8
         Ur18eK9lWlW1hcKH54LHcQ/wpUGK7AJIWdX5QZhldGhYg9ZTT6IHdcPqK5vJBoGS7MTd
         qMwDo1edtylnzjmltvZ+Y+Ck3P+F11f3Q81/qyw2oMOitk0VNTFylQkxTYxV8xtLWIwu
         oHTjJzQxXurvkq3rAQ5Y+HVUfeu9cJwJ9C2trXwCdKyOQlK9Xn7idFxWwFg2XHcEPcsj
         +YQMBC965HhQOmSVDNWDAoWeUM9OzccCiEnGjFd+2wxADOYjSByMsVh9wFlM/IrCbXRM
         KBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gPoFOn3NlTkN+37WZrKkWNwVi59CfA++e4iS3RJ9UEY=;
        b=iq1Bg7ELSqTJBuPtFUOzqr1WjARxQtfBe+p5tsI6EeNbgMcM6KmKkI10Oc7uoj8yWh
         FrOU79SUnvfeYf8u7MqRCJ5r0/8M8UFw/7LSM2qe1GD45Meft6YlIYP0wby48bfGxW7r
         CijnC3hXf22lvrxigN9tdIMLbxpOZOAdUiaduHngFKQNoFbqpkAKbqG3pzZsZDgytPU6
         UIvczJFyoO1CDn5TXYndvtb0a797bRIt19EJNZ/WFNBf4dBh63W0amG+qwiHFktV2w8+
         AqUXOOx1FendIlqdWXWOLwRtF+Q7+l0vhsnn7FdA5m65Q3UJk65yNNb8iBI/vvEuolw4
         OxgQ==
X-Gm-Message-State: APjAAAXfDNtQgm/Y9nHDVLVkf2dDnvkX5YP0HLdtr0GOFF5KuNd8+3KG
        whGXfbKtMhDZGoK+GeBcb9CXqnG5
X-Google-Smtp-Source: APXvYqy4UUkB2pngG0PK7izyBqYly2OzXkEZ4SLqKxyLjOpMCcQMPM8rD9Kb2zaOJsxqVZthbzh32g==
X-Received: by 2002:a63:700f:: with SMTP id l15mr6574870pgc.3.1554393534984;
        Thu, 04 Apr 2019 08:58:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s15sm23064098pga.71.2019.04.04.08.58.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:54 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/24] hwmon: (hih6130) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:23 -0700
Message-Id: <1554393516-30316-11-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/hih6130.c:255:34: warning:
	‘hih6130_of_match’ defined but not used

Mark hih6130_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hih6130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index d167fcfec765..2bf9599b34a1 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -252,7 +252,7 @@ static const struct i2c_device_id hih6130_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, hih6130_id);
 
-static const struct of_device_id hih6130_of_match[] = {
+static const struct of_device_id __maybe_unused hih6130_of_match[] = {
 	{ .compatible = "honeywell,hih6130", },
 	{ }
 };
-- 
2.7.4

