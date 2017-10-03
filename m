Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:57578 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752024AbdJCQLf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Oct 2017 12:11:35 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v4 0/2] Add support for Maxim MAX6621 temperature sensor device
Date: Tue,  3 Oct 2017 18:08:26 +0000
Message-Id: <1507054108-195806-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patchset:
- support for MAX6621 temperature sensor;
- add documentation record for this device;

Vadim Pasternak (2):
  hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor
  Documentation: devicetree: add max6621 device

 .../devicetree/bindings/trivial-devices.txt        |   1 +
 drivers/hwmon/Kconfig                              |  14 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/max6621.c                            | 593 +++++++++++++++++++++
 4 files changed, 609 insertions(+)
 create mode 100644 drivers/hwmon/max6621.c

-- 
2.1.4

