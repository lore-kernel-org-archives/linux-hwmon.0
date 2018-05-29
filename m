Return-Path: <Tomer.Maimon@nuvoton.com>
Return-path: <Tomer.Maimon@nuvoton.com>
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        linux@roeck-us.net, avifishman70@gmail.com, yuenn@google.com,
        brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] hwmon: Add NPCM7xx PWM driver support
Date: Tue, 29 May 2018 13:02:19 +0300
Message-Id: <1527588141-18639-1-git-send-email-tmaimon77@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This patch set adds Pulse Width Modulation (PWM) support 
for the Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The NPCM7xx PWM controller can support 8 PWM output ports.

The hwmon driver provides sysfs entries through which the user can 
configure and get the duty cycle between 0 (disable the specific PWM) 
to 255 of particular PWM output port.

The NPCM7xx PWM driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: hwmon: Add NPCM7xx PWM documentation
  hwmon: npcm-pwm: add NPCM7xx PWM driver

 .../devicetree/bindings/hwmon/npcm7xx-pwm.txt      |  25 ++
 drivers/hwmon/Kconfig                              |   6 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/npcm7xx-pwm.c                        | 363 +++++++++++++++++++++
 4 files changed, 395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
 create mode 100644 drivers/hwmon/npcm7xx-pwm.c

-- 
2.14.1
