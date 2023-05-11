Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A713C7EE22
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 May 2023 20:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239033AbjEKU0l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 May 2023 16:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238753AbjEKU0k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 May 2023 16:26:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB56270D
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 13:26:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso10274507e87.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683836797; x=1686428797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XDaW7ZQJfGNirn9q/zjGhLZ3K4DrTr8ggahgmcG/QaY=;
        b=ebKDFW6t8lirHAlPWsLCWzOfREL7LmdUV/9QO99Jq0N8AyttWqAomABXmAyzFdtZoF
         vA/MZuVkYPR2ZbOxLFD2jvw9Syq6akKBPVMhM9Z9/FKhgcoOYqiwtvT0PgaukZV6+GkK
         1n+Tz+cdTpMDKdztxYdlraHZKXZt04GGAyj0OrySrSkxwy8xTWohPiU71dCfeNMqdA94
         M29jfEmad+U5YlV8WjgVNCBxny0Q/15ldn0WNEHM7oNMsCw6w04j5LA7+cRnM7L48BDb
         0PWe/ryTO1deD/cteEuceIrse8Hj1CbpTGlxQ1I4EfD+F+kZtc5S2q+q14VXnGK/JZ/O
         Lj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683836797; x=1686428797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDaW7ZQJfGNirn9q/zjGhLZ3K4DrTr8ggahgmcG/QaY=;
        b=Wip0FVxzlxFzEfgwTSEdiN2KGttmHvyxouhu3VIgVbw/JvrxK1qFyiyjnJaGPt6KbZ
         NlpyGMnpTC/eFH8D4B+Vs6nGvtq6jeRpwfSyuWPzzHNrNrmXIxnwcfDXmJkP5mnun6bI
         OJH5IZWSl5Ys1eM/RolkHGRaediPNCcZ+aBXTRyYZSR7k0ZDr5ebz0CeQAYCnSF1VHyC
         lfOqgbDlz/31OLjP/fl6l1Caz2OQU7yucyZu757TnVp2IQzyanzf4kZg3Qrh61gTxSUw
         C5wS0djX6vx4cHfR2L04fjfFCgQi8uDm/jhY4pQPPlSMSyBT2noPLQoriEBBJ9W4w48n
         aKYw==
X-Gm-Message-State: AC+VfDy8WdnyvDEjX7H5jcNTTNauPIc5U7JN0UbqXNQZrxNM0h4jP7fr
        6zUkEkIa3PIC19cWjTrLaQowZpgaZ4zXjicm
X-Google-Smtp-Source: ACHHUZ50uJUZU2euv7C39Zjorjx7myvHj4GFqKSFhm/bIsFykLu+8S/DjWTvuKsRE7q0rENl2qQ5Qg==
X-Received: by 2002:a05:6512:906:b0:4f0:6aa3:d860 with SMTP id e6-20020a056512090600b004f06aa3d860mr2852381lft.39.1683836796844;
        Thu, 11 May 2023 13:26:36 -0700 (PDT)
Received: from kirillyatsenko.camlin.tech ([89.151.41.1])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1235959lfm.144.2023.05.11.13.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 13:26:36 -0700 (PDT)
From:   Kirill Yatsenko <kiriyatsenko@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, delvare@suse.com, jcdra1@gmail.com
Subject: [PATCH 1/3] hwmon: (aht10) Fix typos in comments
Date:   Thu, 11 May 2023 22:26:31 +0200
Message-Id: <20230511202633.299174-1-kiriyatsenko@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix typos in the description of the return value section of the
functions. The word 'succesfull' is incorrect, it should be 'successful'.

Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
---
 drivers/hwmon/aht10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index b8fe3f7248ba..87a433e570e1 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -80,7 +80,7 @@ struct aht10_data {
 /**
  * aht10_init() - Initialize an AHT10 chip
  * @data: the data associated with this AHT10 chip
- * Return: 0 if succesfull, 1 if not
+ * Return: 0 if successful, 1 if not
  */
 static int aht10_init(struct aht10_data *data)
 {
@@ -124,7 +124,7 @@ static int aht10_polltime_expired(struct aht10_data *data)
 /**
  * aht10_read_values() - read and parse the raw data from the AHT10
  * @data: the struct aht10_data to use for the lock
- * Return: 0 if succesfull, 1 if not
+ * Return: 0 if successful, 1 if not
  */
 static int aht10_read_values(struct aht10_data *data)
 {
-- 
2.25.1

