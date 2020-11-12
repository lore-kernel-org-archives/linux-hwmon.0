Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DD8C2D0A3
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1696422201
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcdviuqN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgKLJ5W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 04:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgKLJ5V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 04:57:21 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF28C0613D6
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:20 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h2so4733692wmm.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yQkw2l9WIpkjYhKP7Ul2HuGuzOBTh63oL9grzgjK3CQ=;
        b=bcdviuqNSoOpm26doGhfbZW/J0FexDO8vOQFu7IWvGhijr7A8u/sPf4yBz6G5YiI8/
         6aTv7L3ClS2xuaXAsY0DOqQoIazieic2n99F8+j9ilpSKk7v5cpwI8/fG7yqnKA24x4D
         DDWg32nUnf3syXxMho4jlWnvBvGVEIe++06+6/CgScMkH/UkslPVucVVyCGTeEKIEnMh
         r8i7rHwEqz7bdohi9sIpIPSmNNfKVyNw2gKygfM9pMQPSGQKAdYKihwFb0oaoynZBCul
         4Loctrxsw4UvrekgGLLjiUPjTR6R0Vr2mVddTXWJyZK0Q9Xrk5MBRUlDKr1nyBFVMXyt
         yhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQkw2l9WIpkjYhKP7Ul2HuGuzOBTh63oL9grzgjK3CQ=;
        b=Eqc5MMPF3JA+BY9duTIFHB4hgKOXFUfwy6vndPW4ejpApv63UA/OqfEZnwGBYN15pV
         QTV2BuagQdlXjdK54iWgdt7O69VHpDwwwHCjlbN8SVyPlOX5t2nQnAWV5SgAdd3nPp9d
         PAi3jawuMBk1izL/Hqh1rfjdgXcf0KrrD42AsZM/RPXR2lDysxEXmM7pFURkOzUoid34
         zSsWmgwOGtXRwHo0O4vTUYUAOSpeZMxzJ8oOathL38TNv7AfMdbwRFC+RoG7D90wM9/L
         fOThiwZlY8phPPnqpT99cEyTA+issS3hTlJbqMCTJ/wFQ8ShoDHSAYMhhjDFeE7FmLOC
         z8gw==
X-Gm-Message-State: AOAM531lh1/F5eHlkkzRdPbh9fAxZC71TAt+Fb3LrhgoGf5fDsE/w/io
        yqjeBkmkjAsGMq2GU9FJ2uhVTQ==
X-Google-Smtp-Source: ABdhPJxoLAGJ14e0h61QfThiqt5zvB6EWwk8u8Mxfn0uS/id1tAexeu96ZnmI6IHXqr8oGCebTjY5A==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr8804584wmk.63.1605175039365;
        Thu, 12 Nov 2020 01:57:19 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n15sm6138792wrq.48.2020.11.12.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:57:18 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Beniamin Bia <beniamin.bia@analog.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>
Subject: [PATCH 1/3] hwmon: adm1177: Fix kerneldoc attribute formatting
Date:   Thu, 12 Nov 2020 09:57:13 +0000
Message-Id: <20201112095715.1993117-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112095715.1993117-1-lee.jones@linaro.org>
References: <20201112095715.1993117-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Kerneldoc expects attributes/parameters to be in '@*.: ' format.

Also fix repeated word "the the".

Fixes the following W=1 kernel build warning(s):

 drivers/hwmon/adm1177.c:40: warning: Function parameter or member 'client' not described in 'adm1177_state'
 drivers/hwmon/adm1177.c:40: warning: Function parameter or member 'reg' not described in 'adm1177_state'
 drivers/hwmon/adm1177.c:40: warning: Function parameter or member 'r_sense_uohm' not described in 'adm1177_state'
 drivers/hwmon/adm1177.c:40: warning: Function parameter or member 'alert_threshold_ua' not described in 'adm1177_state'
 drivers/hwmon/adm1177.c:40: warning: Function parameter or member 'vrange_high' not described in 'adm1177_state'

Cc: Beniamin Bia <beniamin.bia@analog.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hwmon/adm1177.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index 6e8bb661894b9..0c5dbc5e33b46 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -25,11 +25,11 @@
 
 /**
  * struct adm1177_state - driver instance specific data
- * @client		pointer to i2c client
- * @reg			regulator info for the the power supply of the device
- * @r_sense_uohm	current sense resistor value
- * @alert_threshold_ua	current limit for shutdown
- * @vrange_high		internal voltage divider
+ * @client:		pointer to i2c client
+ * @reg:		regulator info for the power supply of the device
+ * @r_sense_uohm:	current sense resistor value
+ * @alert_threshold_ua:	current limit for shutdown
+ * @vrange_high:	internal voltage divider
  */
 struct adm1177_state {
 	struct i2c_client	*client;
-- 
2.25.1

