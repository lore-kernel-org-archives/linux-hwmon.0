Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:40128 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbeKGN26 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Nov 2018 08:28:58 -0500
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net, robh+dt@kernel.org, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: (adt7475): inverted PWM output
Date: Wed,  7 Nov 2018 17:00:08 +1300
Message-Id: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

I have a hardware design that requires logic low PWM output. The adt7475
supports this but the current driver does not have any way of configuring=
=20this.
I've gone with a device-tree property as this is an artifact of the hardw=
are
design and not something that might be configured via sysfs.

Chris Packham (2):
=20 dt-bindings: hwmon: add binding documentation for adt7475
=20 hwmon: (adt7475): add support for inverting the pwm output

=20.../devicetree/bindings/hwmon/adt7475.txt     | 22 +++++++++++++++++++=

=20.../devicetree/bindings/trivial-devices.txt   |  4 ----
=20drivers/hwmon/adt7475.c                       | 17 ++++++++++++++
=203 files changed, 39 insertions(+), 4 deletions(-)
=20create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt=


--=20
2.19.1
