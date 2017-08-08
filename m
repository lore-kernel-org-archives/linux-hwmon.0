Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:47420
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752387AbdHHPeh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 8 Aug 2017 11:34:37 -0400
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: linux-rpi-kernel@lists.infradead.org
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 0/9 v2] constify thermal_zone_of_device_ops structures
Date: Tue,  8 Aug 2017 17:08:54 +0200
Message-Id: <1502204943-20075-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The thermal_zone_of_device_ops structures are only passed as the fourth
argument to thermal_zone_of_sensor_register or
devm_thermal_zone_of_sensor_register, both of which are declared as const.
Thus the thermal_zone_of_device_ops structures themselves can be const.

v2: add structures passed to devm_thermal_zone_of_sensor_register also.

Done with the help of Coccinelle.

---

 drivers/hwmon/hwmon.c                      |    2 +-
 drivers/hwmon/scpi-hwmon.c                 |    2 +-
 drivers/input/touchscreen/sun4i-ts.c       |    2 +-
 drivers/thermal/broadcom/bcm2835_thermal.c |    2 +-
 drivers/thermal/hisi_thermal.c             |    2 +-
 drivers/thermal/qoriq_thermal.c            |    2 +-
 drivers/thermal/rcar_gen3_thermal.c        |    2 +-
 drivers/thermal/samsung/exynos_tmu.c       |    2 +-
 drivers/thermal/zx2967_thermal.c           |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
