Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56E2C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73D242082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WabBp6al"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbfDDP7H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33918 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id b3so1597047pfd.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=scEgXv+Ig+py6GjGpnRUyI63dCD4OTa3slASSgK+I9s=;
        b=WabBp6al7bIWautFwMZpezo+CsyKWye3JGnPI7o5nCUox9wOUk/XqpMswhBYTeFG4B
         Gl6AMEMYNLeAd2mu3igUxDgnTe2jLf8ioRU3cQ28MPaOnTJxIh8J3XKoP75ojjK059pn
         Tb6//y23xnonHe1F0Qb8IJMCiujkzg6maejQ8lFYOyep77auNpuY0qnKtubkqtiHd0Qt
         OIeYOaIk1BmyePo8zd1gjv6wDYxNOifDCC1cxG0iC1sqNo8UR5sO29It+L7WrzyMujO1
         avgYnvq21/WZajdHLogfszW1sYRYpvjtvDYuImLwXqUOxUxT0BtQ9Thm/DAA17Cdpyl2
         SSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=scEgXv+Ig+py6GjGpnRUyI63dCD4OTa3slASSgK+I9s=;
        b=c0ZLg9tLyYqLWJrsEPBWtUMSROx/aZ+tTDKIQnK2N2MKGS1logrUIemx1GhLfHZTKH
         RfgskremS7v/1LifxHnP2BBdPQXAg7VpuCUObWFE3vA9fEWkBuMlV92c3laYfSk+tJ/Q
         6F4TVzLT1lSc7b1B7YhViczNs0QB7lrr1+3K/9Cb6+CW5bdmgH0gxfyK3JAw9UM5CqXR
         MTdQbiDOB6BO+cJ1nwDfS8LOdaFP52oMEtyApLaPWBtkiCJSzdlwPsX5VDLcl5aQrloJ
         FEBwN49BHLb5SAQ+P5t8rt+77fduXANwYPYN3wG8bjtd+KCTV8TGESRRqRhkIErMrWsX
         pvlg==
X-Gm-Message-State: APjAAAVJTO6UCQG6zszXKmQpHgZFeRcMeLsbbmzfDdA2iR1mXAHhWblL
        CkReXuROyVZZrMJ87PpPq7pTq1Sw
X-Google-Smtp-Source: APXvYqyDBpMyjR76pAZBejQuKjVF+y6aPBVrZdzdo36qQpOYOn4JRzn4NC+ur/3nx2tBoPOOeU0tAw==
X-Received: by 2002:a63:7c45:: with SMTP id l5mr6628997pgn.303.1554393546193;
        Thu, 04 Apr 2019 08:59:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p26sm42689070pfa.49.2019.04.04.08.59.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:05 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 19/24] hwmon: (max6621) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:31 -0700
Message-Id: <1554393516-30316-19-git-send-email-linux@roeck-us.net>
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

The following build warning is seen if CONFIG_OF is disabled.

drivers/hwmon/max6621.c:573:34: warning:
	‘max6621_of_match’ defined but not used

Mark max6621_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 0c399e407de3..1810a753f1a3 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -552,7 +552,7 @@ static const struct i2c_device_id max6621_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max6621_id);
 
-static const struct of_device_id max6621_of_match[] = {
+static const struct of_device_id __maybe_unused max6621_of_match[] = {
 	{ .compatible = "maxim,max6621" },
 	{ }
 };
-- 
2.7.4

