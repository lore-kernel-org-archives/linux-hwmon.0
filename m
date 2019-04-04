Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936A2C10F14
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 630BE2082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W70rp8kt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbfDDP6x (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:53 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45550 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP6q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:46 -0400
Received: by mail-pg1-f193.google.com with SMTP id y3so1437589pgk.12
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaeF59Hsz1ouVNoef1nAEbvoX2OhA5Gj756NbLbe+OA=;
        b=W70rp8ktb5dpOZASIvSAF2GjA+k+g+R8ukpmU5A7T9H/XsPy5ICtk7oSi/DttVV8Ni
         W4HgtiTHFttwUpC+9HRNdkoxWOaEKQRQTODtOd2yRNJEL72OIQ332SI/FdC7TczzEmFU
         uXTpBpi0jQ91xHnP3dz6K04ENaXcbQtDEWbPKpJ8r9u+pHv7GADn9i+3Z6neR+sfqE6o
         A7SOKPaOudIDNzI9oQcgVTXGUEkkTEF8+HnEHoYzx9qggCSrPO2vmDEt+BAZrVdX2lBC
         GgDeUYqfT/DlQrcnGOLh+rt9xjy7dlcqAbmxJNJTF2OIhBE2nV8lOVrJdO5sHnzevdVp
         /eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=GaeF59Hsz1ouVNoef1nAEbvoX2OhA5Gj756NbLbe+OA=;
        b=RTeVLsHS+v8/erjW1ekqyyCEoOGyO5TGobqAxRC0jMB2cr06swXdsdBVmIZpWZwvKo
         4Mv13w0hOVllQSeYTcjZZqZHLN6l3qqIR5q9rKHE0LjeUYSeS2bj9tAvsuoPiX3itRVF
         ebVOYpsx8NI36f7qicZei75gYMgzXUCm8N332xMTqQ+hDh13Jd4hfLmR3MhztqfRSITQ
         pQEse5XHn6fcF2zDnb5g0B0lFtxvOV371Him7aDVAxyX8/PoPScrf/ljUdjMHbuW46Ul
         Sjx2JO6KBVVK162i9ixdqGXPM42jnqfDuL+7iIy9YXdwCEkZtBsTvvS/njxNZFC+wCJh
         MQDQ==
X-Gm-Message-State: APjAAAXDDsHOvBulr54r4DfuTlA56LI/Bsp7iu1fCJQ0RrLZSwFnigOZ
        BeqB6gfMxY9qtCbYy4ptI+DecAQD
X-Google-Smtp-Source: APXvYqzbmurLn8N0s1PlPa+fQuKb+0R/Frzb16Z3jUmb5HFdZjVRx9OpxyzNkp1dBRe86rbe62R/XQ==
X-Received: by 2002:a62:e215:: with SMTP id a21mr5357052pfi.30.1554393525444;
        Thu, 04 Apr 2019 08:58:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm26312964pgh.53.2019.04.04.08.58.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:44 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/24] hwmon: (lm90) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:16 -0700
Message-Id: <1554393516-30316-4-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/lm90.c:239:34: warning:
	‘lm90_of_match’ defined but not used

Mark lm90_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 0f9c22b21ffa..b99eda01696e 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -236,7 +236,7 @@ static const struct i2c_device_id lm90_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm90_id);
 
-static const struct of_device_id lm90_of_match[] = {
+static const struct of_device_id __maybe_unused lm90_of_match[] = {
 	{
 		.compatible = "adi,adm1032",
 		.data = (void *)adm1032
-- 
2.7.4

