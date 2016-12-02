Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34836 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756531AbcLBCdK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 21:33:10 -0500
Received: by mail-pg0-f67.google.com with SMTP id p66so6368420pga.2
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2016 18:33:09 -0800 (PST)
From: John Muir <john@jmuir.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: John Muir <john@jmuir.com>, John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: [PATCH v3 0/2] Texas Instruments TMP108 temperature sensor driver.
Date: Thu,  1 Dec 2016 18:32:40 -0800
Message-Id: <1480645962-55584-1-git-send-email-john@jmuir.com>
In-Reply-To: <1480538179-75901-1-git-send-email-john@jmuir.com>
References: <1480538179-75901-1-git-send-email-john@jmuir.com>
In-Reply-To: <1480538179-75901-1-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This adds a device driver for the Texas Instruments TMP108 temperature
sensor. The driver provides support to read the temperature, read or modify
the update interval, min and max temperature and hysteresis values, as well
as read current alarm status. Support for alarm interrupts will come in a
future patch.

John Muir (2):
  hwmon: Add Texas Instruments TMP108 temperature sensor driver.
  devicetree: hwmon: Add documentation for TMP108 driver.

 Documentation/devicetree/bindings/hwmon/tmp108.txt |  14 +
 Documentation/hwmon/tmp108                         |  36 ++
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/tmp108.c                             | 466 +++++++++++++++++++++
 5 files changed, 528 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
 create mode 100644 Documentation/hwmon/tmp108
 create mode 100644 drivers/hwmon/tmp108.c

-- 
2.8.0.rc3.226.g39d4020

