Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41558 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbeIBSjq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Sep 2018 14:39:46 -0400
Subject: Re: [PATCH RFC 0/2] hwmon: Add RPi PoE HAT fan driver
To: Stefan Wahren <stefan.wahren@i2se.com>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1535887251-29515-1-git-send-email-stefan.wahren@i2se.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <99ca4f6d-d2b2-36e7-9f27-189df379cfaf@roeck-us.net>
Date: Sun, 2 Sep 2018 07:23:41 -0700
MIME-Version: 1.0
In-Reply-To: <1535887251-29515-1-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/02/2018 04:20 AM, Stefan Wahren wrote:
> This series is an early stage of the hwmon driver for the fan on the
> Raspberry Pi Power over Ethernet HAT [1]. At the end this should use a
> Device Tree Overlay.
> 
> Changes by Stefan based on [2]:
> - reformat the downstream patches for submission
> - drop reboot notification
> - fix remaining checkpatch issues
> - add COMPILE_TEST to Kconfig
> 
> The driver is mostly copy & paste from pwm-fan, which isn't good. Personally
> i see two options:
> 
> 1) integrate the driver function into the pwm-fan driver (new compatible)
> 2) implement the core function as a PWM driver and use the pwm-fan driver on top
> 

I don't really see the point of thise driver. Why not implement either of those ?
2) sounds like a perfect fit to me.

Guenter

> [1] - https://www.raspberrypi.org/products/poe-hat/
> [2] - https://github.com/raspberrypi/linux/commit/0f937c8dc3201ebffa6c617c616fd7c65db65959
> 
> Serge Schneider (2):
>    dt-bindings: hwmon: Add RPi PoE HAT documentation
>    hwmon: Add RPi PoE HAT fan driver
> 
>   .../devicetree/bindings/hwmon/rpi-poe-fan.txt      |  55 +++
>   Documentation/hwmon/rpi-poe-fan                    |  15 +
>   drivers/hwmon/Kconfig                              |  11 +
>   drivers/hwmon/Makefile                             |   1 +
>   drivers/hwmon/rpi-poe-fan.c                        | 414 +++++++++++++++++++++
>   include/soc/bcm2835/raspberrypi-firmware.h         |   2 +
>   6 files changed, 498 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/rpi-poe-fan.txt
>   create mode 100644 Documentation/hwmon/rpi-poe-fan
>   create mode 100644 drivers/hwmon/rpi-poe-fan.c
> 
