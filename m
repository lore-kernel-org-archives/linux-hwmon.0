Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33798C54EE9
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiIYR3f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiIYR3c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:29:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9162292
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:29:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 409BE61547
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 17:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B998C433C1;
        Sun, 25 Sep 2022 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664126969;
        bh=qvu+CJ60iB/V2jdEPEPqSWgjfl0VNOqDOYEWOXThxXg=;
        h=From:To:Cc:Subject:Date:From;
        b=Ku/075yx4N7tt+hbDeErBFxrngIYsjcdA3KVI1yUZoo/82YV7Azur0cuaPaKn6NQr
         XZ99FV1+MJdtclaWmwAODER0MfkQFTIrQhRwiNqqm8hCJu4XRT7L9vqobvqgPXJVku
         CnuCsFzx/xZjhlCfdes5dW8xR0E/9upgjuWonRhSCNQO9jSNRTt6q0+tKEkWaRpZwO
         NJ10L1ZXQ/uuU2c3nW/nORG1jtzLI1gwHN3G2TANiM+1yx2kEWbIqvjpsoOlarE7Xz
         HbzzXe59MYpRbXHjxmD3WXNOZVJPcdcqJ4do6a+R5onRAfqVqfJq8rIQq11ljdCnV7
         pwAStgC5nDpRA==
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Roland Stigge <stigge@antcom.de>,
        =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= 
        <dirty.ice.hu@gmail.com>, Ninad Malwade <nmalwade@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 00/18] hwmon: Move to new PM macros reducing driver complexity
Date:   Sun, 25 Sep 2022 18:27:41 +0100
Message-Id: <20220925172759.3573439-1-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Recently a solution was added to avoiding the need to either guard
pm functions with #ifdef magic, or mark the __maybe_unused.
https://lore.kernel.org/all/20220107181723.54392-1-paul@crapouillou.net/

This series switches hwmon over to the new macros that are intended to replace
SIMPLE_DEV_PM_OPS and similar.

There are a few drivers in hwmon that might be able fine using
DEFINE_SIMPLE_PM_OPS() but currently do not define as many of the
callbacks as that macro does. As such I haven't touched them in this set.

This is part of general effort to get rid of examples of the older macros
that might get copied in new drivers.

Jonathan Cameron (18):
  hwmon: (abitguru) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (abitguru3) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (acpi_power_meter) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (adt7x10) Switch to EXPORT_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (gpio-fan) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (it87) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
  hwmon: (lm90) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
  hwmon: (ltc2947) Switch to EXPORT_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (max31722) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (max31730) witch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (max6639) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (nct6775) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (pwm-fan) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (tmp102) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (tmp103) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (tmp108) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (w83627ehf) Switch to DEFINE_SIMPLE_DEV_PM_OPS() and
    pm_sleep_ptr()
  hwmon: (ina3221) Use DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr()

 drivers/hwmon/abituguru.c        |  9 ++-------
 drivers/hwmon/abituguru3.c       |  9 ++-------
 drivers/hwmon/acpi_power_meter.c |  9 +++------
 drivers/hwmon/adt7310.c          |  2 +-
 drivers/hwmon/adt7410.c          |  2 +-
 drivers/hwmon/adt7x10.c          |  7 +------
 drivers/hwmon/adt7x10.h          |  5 -----
 drivers/hwmon/gpio-fan.c         |  9 ++-------
 drivers/hwmon/ina3221.c          | 13 +++++--------
 drivers/hwmon/it87.c             |  8 ++++----
 drivers/hwmon/lm90.c             |  8 ++++----
 drivers/hwmon/ltc2947-core.c     |  7 +++----
 drivers/hwmon/ltc2947-i2c.c      |  2 +-
 drivers/hwmon/ltc2947-spi.c      |  2 +-
 drivers/hwmon/max31722.c         |  8 ++++----
 drivers/hwmon/max31730.c         |  8 ++++----
 drivers/hwmon/max6639.c          |  6 ++----
 drivers/hwmon/nct6775-platform.c |  8 ++++----
 drivers/hwmon/pwm-fan.c          |  6 ++----
 drivers/hwmon/tmp102.c           |  6 ++----
 drivers/hwmon/tmp103.c           |  8 ++++----
 drivers/hwmon/tmp108.c           |  8 ++++----
 drivers/hwmon/w83627ehf.c        |  8 ++++----
 23 files changed, 60 insertions(+), 98 deletions(-)

-- 
2.37.2

