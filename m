Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34688 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751572AbdCBN7u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Mar 2017 08:59:50 -0500
Received: by mail-wm0-f68.google.com with SMTP id m70so12602028wma.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Mar 2017 05:58:42 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux@endlessm.com,
        punit.agrawal@arm.com, sudeep.holla@arm.com, robh+dt@kernel.org
Cc: Carlo Caione <carlo@endlessm.com>
Subject: [PATCH 0/2] scpi-sensors: Fix SCP sensor readings scale
Date: Thu,  2 Mar 2017 13:14:58 +0100
Message-Id: <20170302121500.8121-1-carlo@caione.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

The implementation details for SCPI seems to suggest that the sensor
readings must be reported by SCP using a well defined scale
(millidegree Celsius for temperature, millivolts for voltage,
milliamperes for current, microwatts for power and microjoules for
energy).

This is also important for the interaction with other subsystems: for
example both the thermal sub-system and the hwmon sysfs interface expect
the temperature expressed in millidegree Celsius.

Unfortunately since this behaviour is dependent on the firmware
implementation there are cases where the sensor readings are reported
using a different scale. For example in the Amlogic SoCs the
temperature is reported in degree and not millidegree Celsius.

In this patchset we introduce a new DT property `scpi,sensors-scale` that is
used by the scpi-hwmon driver to convert the sensor readings to the expected
scale.

Carlo Caione (2):
  Documentation: bindings: Introduce scpi,sensors-scale
  hwmon: (scpi) Fix the scale of SCP sensor readings

 Documentation/devicetree/bindings/arm/arm,scpi.txt | 18 ++++++++++++++++
 drivers/hwmon/scpi-hwmon.c                         | 25 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.12.0

