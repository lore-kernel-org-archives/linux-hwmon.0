Return-Path: <vadimp@mellanox.com>
Return-path: <vadimp@mellanox.com>
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jiri@resnulli.us,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 0/2] Add support for Maxim MAX6621 temperature sensor device
Date: Mon, 11 Sep 2017 10:45:23 +0000
Message-Id: <1505126725-4336-1-git-send-email-vadimp@mellanox.com>
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
 drivers/hwmon/max6621.c                            | 484 +++++++++++++++++++++
 4 files changed, 513 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt
 create mode 100644 drivers/hwmon/max6621.c

-- 
2.1.4
