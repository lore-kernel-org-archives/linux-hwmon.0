Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64204C63697
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Nov 2020 18:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEF8920732
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Nov 2020 18:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLFNY28Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbgKWS5I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Nov 2020 13:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbgKWS5H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Nov 2020 13:57:07 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9833FC0613CF;
        Mon, 23 Nov 2020 10:57:07 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t37so15021266pga.7;
        Mon, 23 Nov 2020 10:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=j8DrTZx50dfWcJ3HdYDTj28Ki4m8/rGZEAkHVx4GPcI=;
        b=GLFNY28QOhDWgWfdA4krrvDFXzebAMce8l7VkkX/RfMABs3v6e6fphLKRlW6y75RMF
         8lQcQdW5NtKaSJt3klPDKcCVeD73FU3Y60Jcw66d1R2di6rxkUwUVsk5vK+sRl+OhEu6
         Z80KQNyAhQJ/aY2i0p7mqw1SmxlcGz45Rg1T9vyc0pjvrOn4ahdTPemOiwzLyg6qNeaR
         AQ+6ViWenSiIRGWsQOzEHPnDws2Xm8VnHDv+sLA7HszOE9sTkJwdicynNV1PSu3bYC6d
         oc3xb2cSPOpxmJ7v8E8IU5CxNVG6ToZN6fUNiRPZJXUdiXrO68oW/NmQwsw/ZIUktVoO
         ZNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=j8DrTZx50dfWcJ3HdYDTj28Ki4m8/rGZEAkHVx4GPcI=;
        b=btfdVP0+upH4mswR7vbYODMW++TxfqIOqTvvUGGwebu74m0DaHghyCqWrMLvM/oArZ
         caG09bfKTT/hVJ1omyovQwbnE69DVhjqNRfkuVDoXbvG1nbEH02Zj5uWkqUk1ntMFxrR
         oIijIECr6+tLr2DxAZKS4La2cz7UcrUMFuPnSieivZxMgcW53i2Q3ghXalbDYtdsJ9JT
         MQ30T0oS8ZD302w7JDydNu7A30ZRrKXfveDnu06VDD1MufGc1zBh9G7sCPARtko5hCuk
         XaTqvehJrZAtnyMLCf3UHNM9Lkvcn+usRuQbNdWGmRLVuTEo4CZO8veazAo0L4nL/UQh
         OgGg==
X-Gm-Message-State: AOAM5300BBZFWQg1sqV5Oav1K/lVg0hS/CCe4CU6T+aOY/1vU+mM6axx
        thqwoJ+G01A0VC39CpFncuK0TZecm6MM7mA2
X-Google-Smtp-Source: ABdhPJzzgZ47l2kSeApwFla3sxg6zVPHHzgCdPGILw+FrgqzFUwOWeF1xGZyJRySfGle27e7Yyyqug==
X-Received: by 2002:a17:90a:5901:: with SMTP id k1mr326240pji.7.1606157827142;
        Mon, 23 Nov 2020 10:57:07 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id w15sm11043098pgi.20.2020.11.23.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:57:06 -0800 (PST)
From:   rentao.bupt@gmail.com
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Cc:     Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v5 0/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring
Date:   Mon, 23 Nov 2020 10:56:56 -0800
Message-Id: <20201123185658.7632-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

The patch series adds hardware monitoring driver for the Maxim MAX127
chip.

Patch #1 adds the max127 hardware monitoring driver, and patch #2 adds
documentation for the driver.

Tao Ren (2):
  hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
  docs: hwmon: Document max127 driver

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/max127.rst |  45 +++++
 drivers/hwmon/Kconfig          |   9 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/max127.c         | 352 +++++++++++++++++++++++++++++++++
 5 files changed, 408 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst
 create mode 100644 drivers/hwmon/max127.c

-- 
2.17.1

