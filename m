Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6323EC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238722AbiAKQvW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQvW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:22 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BB3C06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:22 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r131so23266060oig.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W863SJaHOdM1EqM597on+K8xaYf5so8unGiy3KBX7hw=;
        b=ctd717kkGpODdMQ/aRtvP1T+pkF3jgioSp3aB+zT09QrtTNFEN3qFPfsLfa3+PEa9m
         5IBLNNJSpuhkMzkflO50k+bNnJKJLnlB5jLO+aj5znlkVMm9qKuzu0T/6Aj+ghE18P+r
         9O4qPrCOUvm0uTzT+foUR7dpZaCwTOXOqH4O9/aXH9Fq/L1gbS7STtcLbmDD4Am4bwqi
         3y094ki+VuKTgwl80ijmm0Y3i4tQU1X2o6qbo6HLJ52FupA8ZJ5d3PAcbFDrr2QPUdHc
         ZDgVd7MnxTjjvulcb0VmusU7n2P5X77KnI+wWY53/3XnYLfwOkMC+EqTPl5eVitFJU6q
         oGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=W863SJaHOdM1EqM597on+K8xaYf5so8unGiy3KBX7hw=;
        b=QTcXKF/Ow1dcz+l8l49WCeDT8f9WVTZsjxoWxa9wSMO86wcVpA53pmHsvkBP5teivM
         U+SKWI97NM0YoI2fVHUsMXMCuPI+AUItwCGSspUwa/e4kHnQbvNmiYGFqWBKT8a50Q2y
         akh9Hsb3P0lo2GNL2N92A76tpIGZUCoXFHmj5rZr3z5vtOQyj07BIyi5Po97v5FT4HGD
         lZmYX8+SaBFlaxLonzr3xS4TOf6Tjy0LHn2K14BVYqXyTIFLtHYBfUIguGzRM11WBRi8
         LZfJP6daXXFZfbx/UOlEkHDIinF+Zf1+vJrnGBkwwgN/+1KIaeJiQOpD1WNsGw+w+yES
         7utw==
X-Gm-Message-State: AOAM533Jnx2CHVyDWIidK7uCTuId5JdQAt/ae9mWGen2XiVaxGkLIvbP
        3j91Vw4P25ovEO35nADzDnd+BoPWAV8=
X-Google-Smtp-Source: ABdhPJw2zDxwnkb2SUBajcF7TSoy/cCAM26Pdxwu0ELkbrL9HA6UQ1Q7AOWA7pCxNdS2VVCd7pkFeA==
X-Received: by 2002:a05:6808:1293:: with SMTP id a19mr2486053oiw.29.1641919881441;
        Tue, 11 Jan 2022 08:51:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s8sm1745976oij.31.2022.01.11.08.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/6] hwmon: Fixes for lm90 driver
Date:   Tue, 11 Jan 2022 08:51:10 -0800
Message-Id: <20220111165116.1298459-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series fixes a number of issues with the lm90 driver.

- Not all versions of G781 and compatible chips support a conversion rate
  of 8 (62.5 ms). Limit its value to 0..7.
- Re-enable interrupts/alerts for devices supporting interrupts and with
  broken ALERT after the alert(s) clear.
- Various chips have a buggy ALERT implementation. Mark them accordingly.
- The attributes for sending alarm notifications should be the alarm
  attributes, not the associated value attributes.

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (lm90) Reduce maximum conversion rate for G781
      hwmon: (lm90) Re-enable interrupts after alert clears
      hwmon: (lm90) Mark alert as broken for MAX6654
      hwmon: (lm90) Mark alert as broken for MAX6680
      hwmon: (lm90) Mark alert as broken for MAX6646/6647/6649
      hwmon: (lm90) Fix sysfs and udev notifications

 drivers/hwmon/lm90.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)
