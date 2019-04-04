Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACE9C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 193C52082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDEkdd7k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbfDDP6v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:58:51 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44272 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbfDDP6u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:58:50 -0400
Received: by mail-pg1-f195.google.com with SMTP id i2so1441615pgj.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=epzhC4zp1O1GIut332OSspfUsIn3yRc/+MtdT6VYS6Y=;
        b=CDEkdd7kd9jTUwGi5KNgvohsVHaMvRppUS5I2F2rYdExeFR6nwAsMQzcrM5mBTLm2p
         DxlkvusRhPjWxjdBlgkZJSQ7ieO9YxJsIiUdhyPUDESNRMhnjBFGnxCUSBATcVVUUsfm
         T/SvoMf+V6KxHEryxa3rHLbtyEY/36FbujVttB7VkktQJ+UOZPCO4wTQBdNsUu4GuZ52
         YQ+3cB0YW1xhf0gq/bLRA8046qds+qqLpsYZ7hvtUkZ++zbd6OpJbjugWORnqLPoHcKA
         Gh6l3WoT5kiuSLwrewtBHHF7DGossbF6nubuBiQ82Orr3+7KPkZps1STPZUtxCzES8mj
         ABbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=epzhC4zp1O1GIut332OSspfUsIn3yRc/+MtdT6VYS6Y=;
        b=bz9Z1kbHSkPBmwgUy3VlXM816xoyobnqm/IpJvGwYFOm1n9EuKUK7cKvkAly2K2Lkd
         vYhLMZNOnBNuSrGroUQZgSMNEQJHSzkIkoBCNye1NsxqSeKK/ffy3q8mO+OOcI6s1iPh
         3nwRHBEwUv6NzIK7JqpI0cXbNraw7nvD7LA7CIYzN8g9kU2pq+5wpcfc97ekB5jekgAp
         ZyCV0MDkDKtzQ9vZ8uLdrwHEPOjqRNpCp9gx72XYTfjrHd2cHkmtkUzP8PeMonxs7kp8
         kQGT+sDBLD06E9jLO0LvxZaiGyvUMU+pYNDFBr2Nw5jitOcTs1Bb+6lY6ciruslw6IkI
         M97w==
X-Gm-Message-State: APjAAAX2JP4bYBYcS6qk7zPAl76iOYknV6GjvG/rKffCx0HFSvije7yj
        A5rO/CtpBz4L+z9OLyg8akcqM5+T
X-Google-Smtp-Source: APXvYqw+vF9XedP4nQH283BmVdbLFiwqHL7xd5A+bIobiY/gQIeqnxT8ljF41F4hP2mS2sDGX2Zp7Q==
X-Received: by 2002:aa7:9219:: with SMTP id 25mr6666837pfo.205.1554393529483;
        Thu, 04 Apr 2019 08:58:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 143sm34749673pge.50.2019.04.04.08.58.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:49 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/24] hwmon: (tmp102) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:19 -0700
Message-Id: <1554393516-30316-7-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/tmp102.c:324:34: warning:
	‘tmp102_of_match’ defined but not used

Mark it as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 213564aad005..f4ee55615dea 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -303,7 +303,7 @@ static const struct i2c_device_id tmp102_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
 
-static const struct of_device_id tmp102_of_match[] = {
+static const struct of_device_id __maybe_unused tmp102_of_match[] = {
 	{ .compatible = "ti,tmp102" },
 	{ },
 };
-- 
2.7.4

