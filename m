Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70226C4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E9F42082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAj4y8Qg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbfDDP7O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45603 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:13 -0400
Received: by mail-pg1-f196.google.com with SMTP id y3so1438241pgk.12
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v48tBb904rwtZzTe+rEZP+VddZj6Kl9P43Qyd5tXumc=;
        b=LAj4y8Qg2SWMQxnJ/JaRgk5tGYJDIlXNxiebMmN37TiSXdJoQGrZUL6Rl/6+n26gvm
         MaA7nrib3g785HehupemJNdz9mjN4/H5N4Zxvoc5SINM066UdAYfhc4uWKQ8WV3ugBRt
         r4VPv9vtfFdJ5iXtbcM0Q9GKwaxFWZxQ9Ekp8y4SRaOLK3cEV6ihq+KyYTr2KrOj3Hzu
         Duaftk49ApMSReM4aTVQUw7kgHQu3sIaQCUQPzH4Y0EFaPXn456C12QyZtin+2v+4Uls
         Nhyxbl0C4KfBrnGDZaS1gc7V/lELaJmSeJW7GgkFGpIkCHU9qkb8vr6HQQa4KAszXRQ1
         D1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=v48tBb904rwtZzTe+rEZP+VddZj6Kl9P43Qyd5tXumc=;
        b=KhL4eJivIypVO4bqV3EVrx1PZvy82cZlgMdlbrN0b1TfMsuDjxfB54ObNejnfmFq5x
         /I+qbJznbqa0JYAYaGVLmvcFixsRKelO/6zTC6rAYuq7DPEXmCJQoBbX7GAxSmPcFaOy
         hKFaA+UUm4sZMnV695v79XKzSA3gtIReYpbReILEkKY6rEESeEA5YAfXRUvhTXJ0zTW/
         KzzzVc+c6OfKPJ/InyEAv9Dj6XZGnQ5wq5zGC/UVQ9Vl/EjWFz5Nbo/uxFOK/IhUvQ2i
         XyUxV83ZcUO7xyC7I2Qgt64MuWS34t7TnZC9EO/mfdL9SuSe0TYKtqRD3Y80OJQvyzWZ
         eUcw==
X-Gm-Message-State: APjAAAW7wAsF8Icej3JPiqtIEDFxevNPphxj7/pJWz95QfTr23XyN5wk
        aOum0JuLpPdMHpjcHP2u76CghyH/
X-Google-Smtp-Source: APXvYqy6aR/b2DdoD6Y3Pl+88RUyf5pSybYyl3KNEQDPppcNRg3fhRUa9JtT8fa6AelGrGbf5FbRUg==
X-Received: by 2002:a62:ee13:: with SMTP id e19mr6702289pfi.224.1554393553081;
        Thu, 04 Apr 2019 08:59:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm23772621pgh.93.2019.04.04.08.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:12 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 24/24] hwmon: (ina2xx) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:36 -0700
Message-Id: <1554393516-30316-24-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/ina2xx.c:510:34: warning:
	‘ina2xx_of_match’ defined but not used

Mark ina2xx_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 290379c49be9..42df51f8cdf2 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -507,7 +507,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ina2xx_id);
 
-static const struct of_device_id ina2xx_of_match[] = {
+static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 	{
 		.compatible = "ti,ina219",
 		.data = (void *)ina219
-- 
2.7.4

