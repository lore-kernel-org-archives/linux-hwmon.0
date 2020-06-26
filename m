Return-Path: <SRS0=hNyA=AH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44627C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 16:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A349206BE
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 16:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ODf1qLrK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgFZQ4Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Jun 2020 12:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgFZQzz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Jun 2020 12:55:55 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8FCC03E97B
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2020 09:55:55 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t194so10003902wmt.4
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2020 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrSMqNfBoEk4+fX9YqI78/jZTXRW6ktfo7V3K+aMn3w=;
        b=ODf1qLrK8C75l4csBNa28ShD2JvP1VITfSbkol/mVz4l/Nggp0Bxu6tin/T4einR+F
         1Z809a2zXScu/dFsu3KwXrr8dkzFIoAenoEijF3R7CS3+ypa58d+FALuxPB/SnrY8CFJ
         BFMhNFF6borMmZhhnoZEqjF44Hv/xogMioRbNSvLTA0ICZSgmqDCEczzilXj9D4jVWFK
         ZcliQXe5SKPXTncj2Az/MxXb96+bZyW/olb2g3v3fna5IiBXGSETTuBcHLriV4BRwZW4
         tgmO1Vkfaurtx39hQiuXuX8RxrMFg93pzH9AcwbOkogpSkwHmWpCIOfx1u3mGRk4t/KX
         k5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrSMqNfBoEk4+fX9YqI78/jZTXRW6ktfo7V3K+aMn3w=;
        b=tTh1lDrgcQdLdwbo0qW7LApjHNpXXdd+cVD74bCPQD+cNsOZKFLwimO9Klh0Sd9fOB
         TQoJwnv1N702dvbUYZpKQol+uQKq3036PHtMiUdwca/Oj3mUDOTQhcEOU8KmzeVmCvac
         1UGhnDJyXvlRKEwbwNYPm0Ll94jYviKrrleLaQZx5Xh3efp3MkfrC4QlH/hWX7hlF+Hd
         l9I0N2bEGdMMdNvx28du5OJD0txiGJqWzRVr4KN0FXVhQuJmWTtWNrRR+uA4/2bwVKPV
         keGDiHfk4UgJqDupuI26EvlSEhL7rvIdQZ3+MkXQ62xRvgh2uEbuYuKwoiQuC81H7IwE
         h/6A==
X-Gm-Message-State: AOAM53365Anojj4YmqzRsS2Y8HF3DmAAMv1ijLU/1k1/hRqNMYQqoDUF
        dcc0IKSNeDIZtDu6lyob4V2POw==
X-Google-Smtp-Source: ABdhPJywW9EslIlEG4xGnIIz/FnNGMv7QXiKTP/zXruJmAodeLhm9p3zq3POFS/SVYW2Jb5B4tPX4A==
X-Received: by 2002:a05:600c:2317:: with SMTP id 23mr4569316wmo.72.1593190553746;
        Fri, 26 Jun 2020 09:55:53 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x5sm18654706wmg.2.2020.06.26.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 09:55:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/5] devres: remove stray space from devm_kmalloc() definition
Date:   Fri, 26 Jun 2020 18:55:31 +0200
Message-Id: <20200626165535.7662-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200626165535.7662-1-brgl@bgdev.pl>
References: <20200626165535.7662-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the preferred coding style for functions returning pointers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 0bbb328bd17f..c34327219c34 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -807,7 +807,7 @@ static int devm_kmalloc_match(struct device *dev, void *res, void *data)
  * RETURNS:
  * Pointer to allocated memory on success, NULL on failure.
  */
-void * devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
+void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 {
 	struct devres *dr;
 
-- 
2.26.1

