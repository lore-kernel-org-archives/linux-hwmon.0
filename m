Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55295 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbdFZOss (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2017 10:48:48 -0400
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
To: Sebastian Reichel <sre@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 0/2] DA9052 hardware monitoring improvements
Date: Mon, 26 Jun 2017 16:48:30 +0200
Message-Id: <20170626144832.32322-1-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

GE Healthcare's PPD [0] uses DA9053's touchscreen pins
for hardware monitoring purposes. This adds support for
the feature and fixes a bug, which came up during
stress-testing of the driver.

[0] https://patchwork.kernel.org/patch/9809681/

-- Sebastian

Sebastian Reichel (2):
  mfd: da9052: fix manual ADC read after timed out read
  hwmon: da9052: add support for TSI channel

 .../devicetree/bindings/mfd/da9052-i2c.txt         |   8 +
 drivers/hwmon/da9052-hwmon.c                       | 229 ++++++++++++++++++++-
 drivers/input/touchscreen/da9052_tsi.c             |   5 +
 drivers/mfd/da9052-core.c                          |   2 +
 include/linux/mfd/da9052/da9052.h                  |   6 +
 5 files changed, 246 insertions(+), 4 deletions(-)

-- 
2.11.0

