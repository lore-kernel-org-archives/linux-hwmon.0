Return-Path: <SRS0=iNK7=AK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5593C433E1
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Jun 2020 20:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88316206C0
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Jun 2020 20:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="MFHsR5ID"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgF2UuA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731480AbgF2TNj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31021C08EC11
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s10so15292390wrw.12
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0FbmkW7UOcYY7LkyFQeYD+n43SXMQXYjstj7AfGPBFY=;
        b=MFHsR5IDjPY0E1cBnmOdDmaaexsDnuGaeCom8ugM6D2bx/csHHWIKc48ZfoIzQ1WnQ
         wH2T1DsKev7yAD8X37BfHZeGwcp165BuatzBqWpk9PKAHPFguntRaNcNM+9ylDmq1Njl
         NVuN0ckQWhi9I84VLdztbSBWb2IQ1+HBDHXb622lxqQpwfrwmNWd9Mkyxhm4TdXQF1a6
         Qu7nv7GnKuaQtAdamC+YNXe2VGuqkZAdM7PXqkyxRPuNL0QCsk4OeEyOd44jJct2xsgz
         /DRypuk9B9Sua+ocxb2STpKn4HHeSpfcsjEMcVSUlGI2ghJFdvn2DzB6bgnCgXysJtma
         CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0FbmkW7UOcYY7LkyFQeYD+n43SXMQXYjstj7AfGPBFY=;
        b=eSmQiqTha09wa9SXwtsot/uPh+aXQ0lnIM3cfZxRqMAkXmvTPJW+NiszIRrIx8y94z
         clc7/MnOMYoxB1mjVxnPsM78Fc1UT6IBlbMXBgNGF9aJ7APHYhYVj/7XJb3z2JnoRos2
         OeATFSXvGibXBF6Q+gV1cmGf23BpHet6KPnuoEIqcgh4kVxg0PjGYBzE5pjHAOi0I/qN
         qPRPNIj+UVuHZzeoXjc/hSnPCmki96v2IZepB4Uo8KQmfe+qmDF3yVbp19ylLxFY439z
         8FY6ik80LIfHg0F9XP7KVxZwnK4fYVqWfTxbQi8SLXUUhxhiL3tK/6WdpH7lbXHlfxLz
         Mh7g==
X-Gm-Message-State: AOAM532FSA+sCItP0A8gf2IqPtvETBOXEYVYyw8p1AT7TV32veM+mNf8
        SZ6OpLHqIYcnNaw49MCipuKbUw==
X-Google-Smtp-Source: ABdhPJxSUzNN1zV4gXxXOT8r64Q07nF/D8nrR8lGdd7yU4bCgcU0Q04rNUK9eOM5Le0U05BUn4D0PA==
X-Received: by 2002:a5d:4ec7:: with SMTP id s7mr15362311wrv.400.1593413413900;
        Sun, 28 Jun 2020 23:50:13 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z25sm26400850wmk.28.2020.06.28.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:50:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/6] devres: provide and use devm_krealloc()
Date:   Mon, 29 Jun 2020 08:50:02 +0200
Message-Id: <20200629065008.27620-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Regular krealloc() obviously can't work with managed memory. This series
implements devm_krealloc() and adds the first user with hope that this
helper will be adopted by other drivers currently using non-managed
krealloc().

Some additional changes to the code modified by main patches are included.

v1 -> v2:
- remove leftover call to hwmon_device_unregister() from pmbus_core.c
- add a patch extending devm_kmalloc() to handle zero size case
- use WARN_ON() instead of WARN_ONCE() in devm_krealloc() when passed
  a pointer to non-managed memory
- correctly handle the case when devm_krealloc() is passed a pointer to
  memory in .rodata (potentially returned by devm_kstrdup_const())
- correctly handle ZERO_SIZE_PTR passed as the ptr argument in devm_krealloc()

Bartosz Golaszewski (6):
  devres: remove stray space from devm_kmalloc() definition
  devres: move the size check from alloc_dr() into a separate function
  device: remove 'extern' attribute from function prototypes in device.h
  devres: handle zero size in devm_kmalloc()
  devres: provide devm_krealloc()
  hwmon: pmbus: use more devres helpers

 .../driver-api/driver-model/devres.rst        |   1 +
 drivers/base/devres.c                         |  75 +++++-
 drivers/hwmon/pmbus/pmbus_core.c              |  28 +--
 include/linux/device.h                        | 225 +++++++++---------
 4 files changed, 187 insertions(+), 142 deletions(-)

-- 
2.26.1

