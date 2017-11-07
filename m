Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:47589 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933039AbdKGI2b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Nov 2017 03:28:31 -0500
From: Lei YU <mine260309@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc: Lei YU <mine260309@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/3] Add W83773G hwmon sensor driver and doc 
Date: Tue,  7 Nov 2017 16:27:51 +0800
Message-Id: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Nuvoton W83773G is a hardware monitoring chip, which integrates two remote
and one local temperature sensors.
---
v2:
 - The driver is re-written as v1's comment, so the author is changed to me.
 - Added the device to trivial-devices.txt

Lei YU (3):
  DT: i2c: W83773G is a trivial device
  drivers: hwmon: Add W83773G driver
  hwmon: (w83773g) Add documentation

 .../devicetree/bindings/trivial-devices.txt        |   1 +
 Documentation/hwmon/w83773g                        |  33 +++
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/w83773g.c                            | 281 +++++++++++++++++++++
 5 files changed, 326 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g
 create mode 100644 drivers/hwmon/w83773g.c

-- 
1.9.1

