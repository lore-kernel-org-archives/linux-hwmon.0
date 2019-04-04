Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D84C10F0F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46F1320855
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsGd0rDM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfDDP6w (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45550 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfDDP6t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id e24so1567101pfi.12
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1srojDdjyQrWdBomljhMywiC9gimVhCNxqI1d19Y0Q=;
        b=gsGd0rDMlqtGM/YAGyrSWxB+f5sZLDu64DYEczVttzjh1RkQ6VsfG0CQ+8Y+SUff47
         BV3Q1Y9AXkJ+4aruRJPr8JcyMmO9vWaNaOM6hRh3iJqxYM8tKDenbO+OlJ67UYlBT2TD
         8SPDwzWLltcUtL8zVWRRCF+ma//SutAvrcrXAIk2l7b+ob3YnBF5UFryc5kKU2o9nMhg
         EYNOe0GsqTZoL4IroBvPZLugU7J5Nf7dph1j0hpBUSTJJdbZ4J5ujUreOVvKpPY/JTSP
         mPUbvb4X1k7M2PtJ2NNCFQK7NqSWI6tH6FBbXItWzLX7+JM/UKtd3i2DC7bCY0Jpktzv
         5v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=J1srojDdjyQrWdBomljhMywiC9gimVhCNxqI1d19Y0Q=;
        b=Suewq4EbsltrjK/pPPo7dsNRRAOKKDKsDFyoAJgT+igblLueaJcsbm9CgHiAUzl0Vg
         t5bqGvSr+squiJz96UNGQwZMLSQZs3VBYLMmfe3UZgOCRypM8jRwDlfZoV934MhscdwI
         javtJx96eJyA7ACkayM+ZViYMMqTRNjzNvI7Tx1o6IGge04WLe01jAxyPywW/lWYp20B
         XMedaKs/Swlak5FneH/JJJF53SrnZpMfNLkki6hKFsKCsWuYMLdFNSJ+dCx82I3sxBtd
         5FKB/AObg1Oi96nJkFueCRCwfr5iQ30QAXYafB2kfY3DpRNwQPhRt35th1hKfzhcKhiQ
         8DRQ==
X-Gm-Message-State: APjAAAUwu+60QAt41ncEJ0H3Xrd08uaj+xRBbGzlGXkciRAxAE9PVyhF
        10LSoh6Pl2a62FfQPHAjv+wI/ij5
X-Google-Smtp-Source: APXvYqzQ3wnT+x6gjQInE+Akdf1/YwkIcAFEw6FvvtDTtSgMBe4wmhtv617RgA2Ltq7SRDTq42xhNg==
X-Received: by 2002:a63:f115:: with SMTP id f21mr6150100pgi.65.1554393528159;
        Thu, 04 Apr 2019 08:58:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b16sm27190192pfo.168.2019.04.04.08.58.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:47 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/24] hwmon: (ad7414) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:18 -0700
Message-Id: <1554393516-30316-6-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/ad7414.c:218:34: warning:
	‘ad7414_of_match’ defined but not used

Marking ad7414_of_match as __mayybe_unused fixes the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ad7414.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ad7414.c b/drivers/hwmon/ad7414.c
index f13806d731fa..b176da8e92a7 100644
--- a/drivers/hwmon/ad7414.c
+++ b/drivers/hwmon/ad7414.c
@@ -215,7 +215,7 @@ static const struct i2c_device_id ad7414_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ad7414_id);
 
-static const struct of_device_id ad7414_of_match[] = {
+static const struct of_device_id __maybe_unused ad7414_of_match[] = {
 	{ .compatible = "ad,ad7414" },
 	{ },
 };
-- 
2.7.4

