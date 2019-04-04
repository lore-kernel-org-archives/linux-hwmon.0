Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748ABC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 466FD2082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaLhqPvd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfDDP7D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36422 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP7C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id z5so1588404pfn.3
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4idIlta0NArDVkqMVUyCAryhI9cNqy4xLY/brgyw4ZE=;
        b=kaLhqPvdbVDW3x9n1lJFbYilnvkV4/nswpW1zKnyyXyO+cw0N4mX10gSHTNda1m/q3
         +anPTDTsYROk4DJqr3HHK+kn13fSAbfWQpAlahwEXUhSZo57B/bl5ddtDAJK0EQJS/Er
         REXISczxsxRi+VVvMcxZOIDfOJm8F09wBbNG/N1iqTwDFyXan5oZxHYmI9J7Vubid7BL
         0cccRWrIaJJU5hN/9irNy1GzfdHeBrwUVezzysoSSAYJxHefaArYKHEgQvAuHpEIBS5b
         aYv2ONf0gaA7VGAIx7rLVslwlcgZmMPZsA7n64gDb26x0TIZ8t+/u0v8LMeojGVcok6Q
         wZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4idIlta0NArDVkqMVUyCAryhI9cNqy4xLY/brgyw4ZE=;
        b=gjb2FcRaR+Ak52HwZVOUSP6OAPQInie06OcEgqZOlGIissZOqExE7GD6axh47tvA4t
         6wjpOaMnw7AZXeuh7kql8azBPfdOw+r+/un6Y/0RvHdUzyO2OfYVTGa5uklKLwYmMhej
         vj2zlHr+oHHUeuB6+mWu2CkjbKoZC/PWDSvAyHrrf4zprpGVXJU6XoWcPgM8jhlZX171
         J0JjAmYSwhnD1pHJRNYqyd0xDwn3bZ1EXgd8ZdtAlMWqgy7fgXTDXttNhocXX7yGGDsv
         /UXujxBRIfKsgqJ8mrJTOqj36r+xSxdTpCtUfq9Sma5MXCYILapFCnsbMrDIEtMTbuAs
         904w==
X-Gm-Message-State: APjAAAXtzBp3mnvmAOotSilDfIkq8/c7l4Anza569elvUXuMYHZA2QK1
        /GlHGjKDxW+mQLBgsCc8O6qguyyX
X-Google-Smtp-Source: APXvYqwwiiQ8JOZk9L68DCzydkbQPes0kgxo6hCFk1Xlyl0+uL145pQUCVY3lAG7NAbIyZQFbXyPkQ==
X-Received: by 2002:a62:5797:: with SMTP id i23mr6580414pfj.12.1554393541861;
        Thu, 04 Apr 2019 08:59:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4sm10801757pgv.61.2019.04.04.08.59.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:01 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/24] hwmon: (max6697) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:28 -0700
Message-Id: <1554393516-30316-16-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/max6697.c:653:34: warning:
	‘max6697_of_match’ defined but not used

Mark max6697_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index da43f7ae3de1..328793eaee3c 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -650,7 +650,7 @@ static const struct i2c_device_id max6697_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max6697_id);
 
-static const struct of_device_id max6697_of_match[] = {
+static const struct of_device_id __maybe_unused max6697_of_match[] = {
 	{
 		.compatible = "maxim,max6581",
 		.data = (void *)max6581
-- 
2.7.4

