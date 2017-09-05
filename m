Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:40212 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754095AbdIEFhI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 01:37:08 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v3 0/2] Add support for Maxim MAX6621 temperature sensor device
Date: Tue,  5 Sep 2017 07:34:06 +0000
Message-Id: <1504596848-160952-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patchset:
- support for MAX6621 temperature sensor;
- binding documentation for this device;

Vadim Pasternak (2):
  hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor
  dt-bindings: hwmon: add binding documentation for max6621 device

 .../devicetree/bindings/hwmon/max6621.txt          |  14 +
 drivers/hwmon/Kconfig                              |  14 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/max6621.c                            | 602 +++++++++++++++++++++
 4 files changed, 631 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt
 create mode 100644 drivers/hwmon/max6621.c

-- 
2.1.4

