Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35693 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750905AbcK0FNJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2016 00:13:09 -0500
Received: by mail-pf0-f196.google.com with SMTP id i88so4685496pfk.2
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Nov 2016 21:13:09 -0800 (PST)
From: John Muir <john@jmuir.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: John Muir <john@jmuir.com>, John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: [PATCH 0/3] Texas Instruments TMP108 temperature sensor driver.
Date: Sat, 26 Nov 2016 21:12:29 -0800
Message-Id: <1480223553-81972-1-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

(Attempting a resend due to apparent delivery failure.)

This driver is split into three patches as it is being ported forward from
a Linux 4.4 implementation where it was tested. The final driver code uses
interfaces that are not available in 4.4.

John Muir (3):
  hwmon: Add Texas Instruments TMP108 temperature sensor driver.
  hwmon: tmp108: Use devm variants of registration interfaces.
  hwmon: tmp108: Update driver to use hwmon_chip_info.

 Documentation/devicetree/bindings/hwmon/tmp108.txt |  27 ++
 Documentation/hwmon/tmp108                         |  38 ++
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/tmp108.c                             | 421 +++++++++++++++++++++
 5 files changed, 498 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
 create mode 100644 Documentation/hwmon/tmp108
 create mode 100644 drivers/hwmon/tmp108.c

-- 
2.8.0.rc3.226.g39d4020

