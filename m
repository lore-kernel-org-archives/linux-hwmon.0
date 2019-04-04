Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D16BC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 13:15:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29D59206C0
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 13:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg7cMXJp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfDDNPP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 09:15:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34579 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfDDNPO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 09:15:14 -0400
Received: by mail-pf1-f196.google.com with SMTP id b3so1380159pfd.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dg9oVvSAeyh8BEQMbDA9b8memUk/TesXXW+gFzd2NpY=;
        b=Eg7cMXJpDkMChJUTepnZWY4sHKDwmKBtKKDzLMLhpvNiD7GlNr36CBqSnsVybBNUpN
         Q/Gg/q1mCX7gE1rrTDgJKCYNLK+f7wI6Rs7e5qwwkF6chm941XrmX6Lu1hCwCCaFyuH/
         fzuwcmjxLFg+rQD628ADHPeM5GNcE3O0gde4PlFkpRu527J2bg4lM+HP9HTNcPUlICmr
         yYiOpFQFw++J/IRpwvBrRv3VP/vI4J/2xaOtQDbSpT/I0TMS0MjyxHsmOf1WaRSvwSTp
         C6Vw8QBk3MQdq8/QhGQ2RlgCfhptbONmF+7lse/sze34Iwz2drxGDzq9xQAND3Y8leJj
         iAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Dg9oVvSAeyh8BEQMbDA9b8memUk/TesXXW+gFzd2NpY=;
        b=EF6o9wWEY/M0isNjvgL7FrE9cmyPxici6GJ0nFviZAM0OD8nIzap8xqHyvu0xCMWwL
         QI9f0+N6IzyhQ6rlECQ33CDlPbzfNZB1E06gc78QVp6Fu+XCL9reFkGLYYLF3HgMv4V8
         jXZ3z7oumzUZIiyzuiA6rEZPDD3QOtUJoWLWRUy3zEpS+W3+mFhQLN8yCw2+ygMfuzhf
         8p0XznIFkD902h2iikaKWMLGhliLfDV6M9e0mO7o03num92M49Rw/ppgBsqDF6CI3Ema
         4cHSkGpbqpCut76LF8WMU3TBB64dutS5PVNAz4xFOQ1Lz6RyJFGasTApCRHYa1LGrfFq
         K3QQ==
X-Gm-Message-State: APjAAAVN6iSg2pcOlpJPS3srxyysRegoV7xujZeE9hOScvB00xgJKvgG
        sf6p/klnzUxdfzGdoKDV6Hj/zGGP
X-Google-Smtp-Source: APXvYqxMCsqbcNPSKxVjORCC8ojp5bSwHZYy/Gu6mfhLObjfFKBBewMzR9d5REflnNcN0druX+C1Qw==
X-Received: by 2002:a62:874d:: with SMTP id i74mr5881751pfe.211.1554383713658;
        Thu, 04 Apr 2019 06:15:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3sm37799987pfg.88.2019.04.04.06.15.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 06:15:12 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (pmbus/ucd9200): Mark ucd9200_of_match as maybe_unused
Date:   Thu,  4 Apr 2019 06:15:09 -0700
Message-Id: <1554383709-26812-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is
observed.

drivers/hwmon/pmbus/ucd9200.c:50:34: warning:
	‘ucd9200_of_match’ defined but not used

Mark it as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ucd9200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 3ed94585837a..9a776c486a20 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -47,7 +47,7 @@ static const struct i2c_device_id ucd9200_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucd9200_id);
 
-static const struct of_device_id ucd9200_of_match[] = {
+static const struct __maybe_unused of_device_id ucd9200_of_match[] = {
 	{
 		.compatible = "ti,cd9200",
 		.data = (void *)ucd9200
-- 
2.7.4

