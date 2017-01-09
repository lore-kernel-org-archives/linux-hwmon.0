Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:33750 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbdAIV7l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2017 16:59:41 -0500
Received: by mail-pf0-f170.google.com with SMTP id y143so13349306pfb.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Jan 2017 13:59:40 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, jdelvare@suse.com,
        linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver
Date: Mon,  9 Jan 2017 13:59:33 -0800
Message-Id: <20170109215935.30067-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver.
The AST2400/AST2500 PWM controller can support 8 PWM output ports.
The AST2400/AST2500 Fan Tach controller can support 16 tachometer inputs.
There can be three different PWM clock types (Type M, N and O); Those three
types just to have three independent PWM sources.
The driver provides sysfs entries through which the user can configure the
duty cycle for the particular PWM output port and read the fan rpm value for
the particular tachometer input.
Added devicetree binding documentation for AST2400/AST2500 PWM and Fan Tach
support.

Tested on Zaius board (which has AST2500 chip) and observed that when
duty cycle is lowered then the fan speed is lowered and lower fan rpm value(
corresponding to the duty cycle) is reported and when the duty cycle is
increased then the fan speed increases and higher fan rpm value(corresponding
to the duty cycle) is reported.

Tested on AST2500 EVB board and observed the PWM output pulses come
correctly based on the given settings using Logic Saleae Analyzer.

Jaghathiswari Rankappagounder Natarajan (2):
  Documentation: dt-bindings: Document bindings for aspeed pwm and fan
    tach controller device driver
  drivers: hwmon: hwmon driver for ASPEED AST2400/2500 PWM and Fan tach
    controller

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153 ++++
 Documentation/hwmon/aspeed-pwm-tacho               |  22 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   | 884 +++++++++++++++++++++
 5 files changed, 1069 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.11.0.390.gc69c2f50cf-goog

