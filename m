Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA75C4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EF8F2082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3JVnVZy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfDDP66 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:58 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46203 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP66 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id 9so1567267pfj.13
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2tEM5pbFGSc8PF+l86Xwui3PF6FvfGoLcGPp8qs4oIc=;
        b=m3JVnVZy6KB3XopoOzw3Qtoygj4CSiUKvGnOCAc3xq6V3z4q5JNJsn44liiwnkp6nL
         yRJSkSwUQi9nRgyc99dHtQ14V6nZ55ulMvyBavWAhxIfZm2tB8oBZ/gKKr81+MiAmlmd
         Ii4EGjFXPvLHwuD+Vy/SKoJYj1FoQa7KfQc69/5WnmnBZmfG+DPgckocDg9i3Ssnhf8S
         FEiKsoqPgeEsqPIAipbD4O0yyPNZTChddKIVxhAbDVliNEhB6xL7aCUhjhfN2ga6q3Xn
         9Hcnn1tcpK8/l9bacWvhdniyCLymvAZWSvOXkOErHI2+8KU7ZW2BTADSTezICwWNDnYf
         hrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=2tEM5pbFGSc8PF+l86Xwui3PF6FvfGoLcGPp8qs4oIc=;
        b=mWvJ/xDfsHk+23qYGxQOESSWH+ahPp3XZb6BOK53ijRSdYLFKbFQ0gsRUE2X5iFVr5
         qP7fJ1Ef9ynwK28JJ0nDaOjD8crfbyOYtVZ6y29V8A8iRyJt1vFdPJ2x1x0bMWeyJJLO
         GIEkS9oO1NsRyUW+mleuP0bFpvsGqhWC7ctTphWMVOi114ERB82PETRvqJB2lsP9JZHo
         v54I1ZynXyclPdYnt+7DYMhmXsknTYeWeFay9j8CPwBAILEKlm332xlzUq79XUYIAmeo
         dX04QSjb4f7uPduj15y8dbqwy+WmbgEroaWjmhuE6CoTS+QJ8nimpKqYRC+V64w9izFY
         fmWg==
X-Gm-Message-State: APjAAAWGxTadjEtRFn1wlH7rrtp/4/wB3LYJYneQIB9rXcXT6wwlN6+L
        mr0IwL7UEb3g1610KwELbXhrNnA3
X-Google-Smtp-Source: APXvYqxbwlubDDOsttj1Z0zqZSMeT1Pr+SdwtmhDBHo3f7iXzY5pa6uB5XzRbVaM6y2biJPlF+FotQ==
X-Received: by 2002:a62:571b:: with SMTP id l27mr6707505pfb.195.1554393537764;
        Thu, 04 Apr 2019 08:58:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e13sm32411074pgb.37.2019.04.04.08.58.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:57 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/24] hwmon: (w83773g) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:25 -0700
Message-Id: <1554393516-30316-13-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/w83773g.c:47:34: warning:
	‘w83773_of_match’ defined but not used

Mark w83773_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/w83773g.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 1f34d885db52..d4105321e462 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -44,7 +44,7 @@ static const struct i2c_device_id w83773_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, w83773_id);
 
-static const struct of_device_id w83773_of_match[] = {
+static const struct of_device_id __maybe_unused w83773_of_match[] = {
 	{
 		.compatible = "nuvoton,w83773g"
 	},
-- 
2.7.4

