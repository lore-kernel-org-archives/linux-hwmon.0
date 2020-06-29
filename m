Return-Path: <SRS0=iNK7=AK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A351C433E2
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Jun 2020 20:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AA4920663
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Jun 2020 20:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="SIZcYUqj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731413AbgF2UvU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731412AbgF2TNb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:31 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44907C08ECAE
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:20 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g75so14243200wme.5
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kw/uv7mzLibBsj+LOWOIdk1Thny96wIQJHxJQ2eekIA=;
        b=SIZcYUqjXVEe8aMLi5SGPbYOBtdESkCMgL8suGnrl0Ahkbt5IgssgahqK/2ZJobC6l
         Zru4yIACrtfO3JJhea0gBpOzgKVGu1wHtE3+KKnPnvor3cgV/Jx68v2Z1HdA9yIjm5Ya
         nLupGdn7GehwjFWQD74IhdKCBaFBGW9+ZewUa3o6YmajgwDNrKexNV4xgN6EOXSN75pl
         K4/hyBCPM+GS48sgW+CTgH3wq3AZ5BWJroEAHyvJLugJrWczgUewtWDCH9smN3K69Ofy
         jcz55Pp54LrkY3D9986r7EAMb3bwh5pfB/1x4tlRDpBYQfI6G6XXO4MrEaUAef2xLuXc
         z8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kw/uv7mzLibBsj+LOWOIdk1Thny96wIQJHxJQ2eekIA=;
        b=OiSk+TiGFIHdfYko/MqBBMKkNIq6OpHT3oyDNlRWxH9HpFTXyfpodPLf4XiyT2hnnz
         tCAdc5+w1IzgsQC2ifKcehyrL4mi4GILGmlNKNY+4PNMAyyQWuBT//yBTPs035pn4rMf
         N/6H5YSB8iDu+0BZv0GyuPPthDwrH/oPzTlGcBT9/cVdTyz92h4DTByeQeO7paBoP7K/
         k7GeaAeHyLfYFi4MYHEAf5eaFpxWecgJk9Qp1YZhnqpL0lKmKGPTYSYFbXO2RGFG6KUl
         0Dv49hpzlPgRs9/wJRxa7+7tEhwlLAYluh6IyTlIKfWtFtQ7dnONwa31EJ3f//jiCBBw
         Zw0A==
X-Gm-Message-State: AOAM532z6HRC3DP1A32gNcpHEmv4l8KhQr/mDgQBbHvmWw05Uf6srjpC
        h1tqHoD6NLascGqa6oaNTfeTJg==
X-Google-Smtp-Source: ABdhPJw+V40exuzx/4bjMtVNs9KS0u1HH05sx9cQBmql8zhWKpmSYw8VZO59aPGiDhmCWJ2QUk9NJg==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr15841234wmi.85.1593413419047;
        Sun, 28 Jun 2020 23:50:19 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z25sm26400850wmk.28.2020.06.28.23.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:50:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/6] devres: handle zero size in devm_kmalloc()
Date:   Mon, 29 Jun 2020 08:50:06 +0200
Message-Id: <20200629065008.27620-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629065008.27620-1-brgl@bgdev.pl>
References: <20200629065008.27620-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Make devm_kmalloc() behave similarly to non-managed kmalloc(): return
ZERO_SIZE_PTR when requested size is 0. Update devm_kfree() to handle
this case.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/devres.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 1df1fb10b2d9..ed615d3b9cf1 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -819,6 +819,9 @@ void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 {
 	struct devres *dr;
 
+	if (unlikely(!size))
+		return ZERO_SIZE_PTR;
+
 	/* use raw alloc_dr for kmalloc caller tracing */
 	dr = alloc_dr(devm_kmalloc_release, size, gfp, dev_to_node(dev));
 	if (unlikely(!dr))
@@ -950,10 +953,10 @@ void devm_kfree(struct device *dev, const void *p)
 	int rc;
 
 	/*
-	 * Special case: pointer to a string in .rodata returned by
-	 * devm_kstrdup_const().
+	 * Special cases: pointer to a string in .rodata returned by
+	 * devm_kstrdup_const() or NULL/ZERO ptr.
 	 */
-	if (unlikely(is_kernel_rodata((unsigned long)p)))
+	if (unlikely(is_kernel_rodata((unsigned long)p) || ZERO_OR_NULL_PTR(p)))
 		return;
 
 	rc = devres_destroy(dev, devm_kmalloc_release,
-- 
2.26.1

