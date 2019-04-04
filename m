Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D83C4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 645552082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APqdgA6m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbfDDP7G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44645 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfDDP7G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:06 -0400
Received: by mail-pf1-f194.google.com with SMTP id y13so1570117pfm.11
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZGHL3m+mOmelSZ+bSIksl08LS+1ptv/QdJlM/qlxQIA=;
        b=APqdgA6msRAwtDwTAw6scLGSWfPZzdBu91iNMtwhh6ICcL445C3cYekWSnWAKxrdUZ
         aDs6PKxaGNr/7EFKUPexmUcNKZJLeMYdzpdTELVeK4+ize4xwqqb/uWv3cK7M+9nzgs+
         8TDetVLe1MKeZTXueWwlcUNd6iMDqL1Vy0OyUIRGuBO1/OqR15WiBrvnH/cBDBzFEwSD
         lTFFrXy+X7Z+qWknBO063HJ+d2zu3X2AwmKu8xpoaBguhK7BHv4w280Vl2HVUSwGnSWI
         TtzNc7EwmDFpEkLi9wul8nQZv4eheDNzjaVir+/dRjawF6mPUI6u8sp8RdLG718A/3Mg
         yfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ZGHL3m+mOmelSZ+bSIksl08LS+1ptv/QdJlM/qlxQIA=;
        b=ZMz+9IkVuX7fimwawuoO6TAsO2xYeDBGyZYwU2CML57XNLgl93AFdUND2IS2+JuhQv
         fqFE26qhe1eOvyLPO7vxxKuQrf6Z+GUCsJkC4nk6DuKPrGRiduRNaaICBiE5kyM+cU7q
         F/NHf2EhSlM25EPXKRo3iHCg1AFbk/t71DC0xoh4oLL+ZhKxROeTCsII1o5tQRaufLB3
         RIJf1TTQ5T9OEzWOXqCFM+FVUvAnyMYBkoOCH1IITtI5DvzB8NBVjyYJqGCUpx3Qgnwc
         NRPvMf9a8j89oe9fdx1JlafvrOjIoMQ2BsLcF19YDnVUFwO+FKNqWhjw6yPp7NrNm29n
         4AeQ==
X-Gm-Message-State: APjAAAX/eFzaX8rDsYNOipu1T6KAVrxQ1Rct/cNIad03zhk5s1vF2rd7
        j6jl6hRKjiZvkA2vneY/+YsxAZKn
X-Google-Smtp-Source: APXvYqwz7cHgIncnABzpJYGwBcJq6nvUbwc7Lke8okYq2Y/R8r5CIN5ykqOcOTPnXItsrBiGk63c+Q==
X-Received: by 2002:a65:6496:: with SMTP id e22mr6554603pgv.249.1554393544839;
        Thu, 04 Apr 2019 08:59:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4sm18498051pgn.20.2019.04.04.08.59.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:04 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 18/24] hwmon: (lm85) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:30 -0700
Message-Id: <1554393516-30316-18-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/lm85.c:1645:34: warning:
	‘lm85_of_match’ defined but not used

Mark lm85_of_match as __maybe_unused to ix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm85.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index a95d48316f06..235bba054d47 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -1642,7 +1642,7 @@ static const struct i2c_device_id lm85_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm85_id);
 
-static const struct of_device_id lm85_of_match[] = {
+static const struct of_device_id __maybe_unused lm85_of_match[] = {
 	{
 		.compatible = "adi,adm1027",
 		.data = (void *)adm1027
-- 
2.7.4

