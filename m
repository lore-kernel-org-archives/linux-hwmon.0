Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:55204 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbdIYXJ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:26 -0400
Received: by mail-pg0-f47.google.com with SMTP id c137so4864051pga.11
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/9] GPIO controlled fans refactoring
Date: Tue, 26 Sep 2017 01:09:02 +0200
Message-Id: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series:

- Cleans up the GPIO controlled fan driver to correspond to
  my personal idea of clean.

- Cuts the support for platform data from board files that
  noone is using, making the driver self-contained.

- Convert the driver to use GPIO descriptors.

It needs some testing. Also by myself, but especially from people
with fans using several GPIO lines.

Linus Walleij (9):
  hwmon: gpio-fan: Move DT bindings to the right place
  hwmon: gpio-fan: Use local variable pointers
  hwmon: gpio-fan: Localize platform data
  hwmon: gpio-fan: Send around device pointer
  hwmon: gpio-fan: Mandate OF_GPIO and cut pdata path
  hwmon: gpio-fan: Get rid of platform data struct
  hwmon: gpio-fan: Get rid of the gpio alarm struct
  hwmon: gpio-fan: Rename GPIO line state variables
  hwmon: gpio-fan: Convert to use GPIO descriptors

 .../bindings/{gpio => hwmon}/gpio-fan.txt          |   0
 drivers/hwmon/Kconfig                              |   1 +
 drivers/hwmon/gpio-fan.c                           | 219 ++++++++-------------
 include/linux/gpio-fan.h                           |  36 ----
 4 files changed, 83 insertions(+), 173 deletions(-)
 rename Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt (100%)
 delete mode 100644 include/linux/gpio-fan.h

-- 
2.13.5

