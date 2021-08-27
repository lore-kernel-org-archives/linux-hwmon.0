Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B87C432BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 23:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11FE560EE5
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Aug 2021 23:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhH0XFm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Aug 2021 19:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhH0XFm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Aug 2021 19:05:42 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04486C0613D9;
        Fri, 27 Aug 2021 16:04:52 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id a10so8858775qka.12;
        Fri, 27 Aug 2021 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=01hGhTEykF0Oen+PehMw35YekmoQ4ZCTAgo08P6ZyM0=;
        b=VXHVnFW4X99IfoeL1Osga+0QOlK7SZcSfSTCQoYalwMggX1m4+IQFr8j842mLXzirK
         8YIDt5Cym/8mL3i/9yLGVKCt3pUKLyWqoC/cEg/o/Ysht17g+p6ZErp2ihIW0Co6mGuK
         tfEpsL8Ta6i5ygGrPNMbHKWdRHB6gnS+0CvytsFpricDcq7YDWHJpdswFsDICnwzRq+8
         xq91UuJRcOWOm8LL1kqdzzAIRkZaGiwgPSlQETmXipHkalvjdSIrSRm2qoJgZAskykcb
         SJGw9B7iaQMJejgNIcHBzDtyE50vEb8BZd4NVWh0HloRB8BGaoanDBrYkybv3irugFBE
         u5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=01hGhTEykF0Oen+PehMw35YekmoQ4ZCTAgo08P6ZyM0=;
        b=GkbNSnUBgCHJV4Ii/WwCsdY8Nwik6pVm/JVd0AvufikRZFv5wxluDB2WeIOIRA9FAl
         wV+1Zgbw7uRG/Tbsd1D6Dm0zXrjlZAVj2Mgg4jTGIZEYg7Loutv5bQP7Hq8irVlQ0SN0
         icwISb1j01dE1IoTFCLB78KzaPxUoPhiSJ9YjfrtRLkNtnbBLmjLlr0UUvjvvARRt7ED
         ySlteWG7zMAn6trilLLyp1gudfPm12LgEhSirttoAXqHnSxk4Sx27mcZT1oGnHICwl17
         Gyzw4vanc8aZ1oWYqrHqRpXY0BptPg6rK88yLGnnctJSjYz2QfQ85xU5VF1kn3evCC45
         JKng==
X-Gm-Message-State: AOAM533b65K0qn1k5kCeLXJofbbZAtRx5rRzQJQ45a+uktRRXNJPLwQa
        ZF2EsRntLXLQ72FXk7O7Qlo=
X-Google-Smtp-Source: ABdhPJyaBfKBb7GEWJZ8qyNK3DpPQ8kfFHQrTmVYwd3GlY2LhCQhDmAaxnzD9iRm3gq6oMi5oTO6Zg==
X-Received: by 2002:ae9:e017:: with SMTP id m23mr11681862qkk.8.1630105492020;
        Fri, 27 Aug 2021 16:04:52 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
        by smtp.gmail.com with ESMTPSA id p22sm5588552qkj.16.2021.08.27.16.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 16:04:51 -0700 (PDT)
From:   Brandon Wyman <bjwyman@gmail.com>
To:     Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Cc:     Brandon Wyman <bjwyman@gmail.com>
Subject: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
Date:   Fri, 27 Aug 2021 23:04:33 +0000
Message-Id: <20210827230433.3596370-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The bytes for max_power_out from the ibm-cffps devices do not need to be
swapped.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index df712ce4b164..29b77f192c9e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 		cmd = CFFPS_SN_CMD;
 		break;
 	case CFFPS_DEBUGFS_MAX_POWER_OUT:
-		rc = i2c_smbus_read_word_swapped(psu->client,
+		rc = i2c_smbus_read_word_data(psu->client,
 						 CFFPS_MAX_POWER_OUT_CMD);
 		if (rc < 0)
 			return rc;
-- 
2.25.1

