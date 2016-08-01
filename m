Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Kamil Debski <k.debski@samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Kamil Debski <k.debski@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-hwmon@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        Lukasz Majewski <l.majewski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kamil Debski <kamil@wypas.org>
Subject: [PATCH] MAINTAINERS: update email and list of Samsung HW driver
 maintainers
Date: Mon, 01 Aug 2016 16:11:43 +0200
Message-id: <1470060703-20423-1-git-send-email-k.debski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

Change my email address in the MAINTAINERS file.
Add new maintainers of selected Samsung HW drivers.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-hwmon@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kamil Debski <kamil@wypas.org>
---
 MAINTAINERS | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c20323..76e5953 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1623,7 +1623,8 @@ F:	arch/arm/mach-s5pv210/
 
 ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
 M:	Kyungmin Park <kyungmin.park@samsung.com>
-M:	Kamil Debski <k.debski@samsung.com>
+M:	Kamil Debski <kamil@wypas.org>
+M:	Andrzej Hajda <a.hajda@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -1631,8 +1632,9 @@ F:	drivers/media/platform/s5p-g2d/
 
 ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
 M:	Kyungmin Park <kyungmin.park@samsung.com>
-M:	Kamil Debski <k.debski@samsung.com>
+M:	Kamil Debski <kamil@wypas.org>
 M:	Jeongtae Park <jtp.park@samsung.com>
+M:	Andrzej Hajda <a.hajda@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -9241,7 +9243,8 @@ S:	Maintained
 F:	drivers/media/usb/pwc/*
 
 PWM FAN DRIVER
-M:	Kamil Debski <k.debski@samsung.com>
+M:	Kamil Debski <kamil@wypas.org>
+M:	Lukasz Majewski <l.majewski@samsung.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -9985,7 +9988,8 @@ T:	git https://github.com/lmajewski/linux-samsung-thermal.git
 F:	drivers/thermal/samsung/
 
 SAMSUNG USB2 PHY DRIVER
-M:	Kamil Debski <k.debski@samsung.com>
+M:	Kamil Debski <kamil@wypas.org>
+M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/samsung-phy.txt
-- 
1.9.1
