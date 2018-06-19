Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:33935 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S936108AbeFSKy4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Jun 2018 06:54:56 -0400
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        linux@roeck-us.net, avifishman70@gmail.com, yuenn@google.com,
        brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 0/2] hwmon: Add NPCM7xx PWM and Fan driver support
Date: Tue, 19 Jun 2018 13:53:50 +0300
Message-Id: <20180619105352.97181-1-tmaimon77@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch set adds Pulse Width Modulation (PWM) and Fan tacho
support for the Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The Nuvoton BMC NPCM7xx has two identical PWM controller modules,
each module has four PWM controller outputs and eight identical Fan
controller modules, each module has two Fan controller inputs.

The hwmon driver provides sysfs entries through which the user can
configure and get the duty cycle between 0 (disable the specific PWM)
to 255 of particular PWM output port.

The driver support cooling device creation, that could be bound
to a thermal zone for the thermal control.

The NPCM7xx PWM and Fan driver tested on NPCM750 evaluation board.

Addressed comments from:.
 - Guenter Roeck: https://www.spinics.net/lists/devicetree/msg231982.html

Changes since version 1:
 - Rename driver name
 - Adding Fan Controller support
 - Adding cooling device support
 - Modifying dt-binding documentation for Fan and cooling binding

Tomer Maimon (2):
  dt-binding: hwmon: Add NPCM7xx PWM and Fan controller documentation
  hwmon: npcm750: add NPCM7xx PWM and Fan driver

 .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  |   84 ++
 drivers/hwmon/Kconfig                              |    7 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/npcm750-pwm-fan.c                    | 1099 ++++++++++++++++++++
 4 files changed, 1191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
 create mode 100644 drivers/hwmon/npcm750-pwm-fan.c

-- 
2.14.1

