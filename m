Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36708 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932624AbcI0MH5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2016 08:07:57 -0400
Received: by mail-wm0-f68.google.com with SMTP id b184so844292wma.3
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Sep 2016 05:07:56 -0700 (PDT)
From: Andrea Merello <andrea.merello@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Andrea Merello <andrea.merello@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: [PATCH v2 0/2] Add driver for ST stts751 thermal sensor
Date: Tue, 27 Sep 2016 14:07:25 +0200
Message-Id: <1474978047-28290-1-git-send-email-andrea.merello@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This series adds new driver for ST stts751 thermal sensor

Changes since v1:
- removed the "manual mode" logic; always use automatic mode
- changed the way 16-bit data is read from two 8-bit regs (now similar to lm90)
- code simplifications
- comment style fixes

Andrea Merello (2):
  DT: add binding documentation for STTS751
  hwmon: new driver for ST stts751 thermal sensor

 .../devicetree/bindings/hwmon/stts751.txt          |  19 +
 drivers/hwmon/Kconfig                              |  12 +-
 drivers/hwmon/Makefile                             |   2 +-
 drivers/hwmon/stts751.c                            | 805 +++++++++++++++++++++
 4 files changed, 836 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/stts751.txt
 create mode 100644 drivers/hwmon/stts751.c

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>


--
2.7.4
