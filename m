Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 0/2] Add support for Maxim MAX6621 temperature sensor device
Date: Tue, 29 Aug 2017 20:46:47 +0000
Message-Id: <1504039609-152485-1-git-send-email-vadimp@mellanox.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patchset:
- support for MAX6621 temperature sensor;
- binding documentation for this device;

Vadim Pasternak (2):
  hwmon: Driver for Maxim MAX6621 temperature sensor
  dt-bindings: hwmon: add binding documentation for max6621 device

 .../devicetree/bindings/hwmon/max6621.txt          |  14 +
 drivers/hwmon/Kconfig                              |  14 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/max6621.c                            | 531 +++++++++++++++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt
 create mode 100644 drivers/hwmon/max6621.c

-- 
2.1.4
