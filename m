Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [PATCH 02/11] MAINTAINERS: Add Altera Arria10 System Resource Chip
Date: Fri, 22 Apr 2016 10:33:30 -0500
Message-ID: <1461339219-15255-3-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add maintainer for the Altera Arria10 Max5 System Resource chip files.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 MAINTAINERS |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 724bb86..e5f2621 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -608,6 +608,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
+ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
+M:	Thor Thayer <tthayer@opensource.altera.com>
+S:	Maintained
+F:	drivers/gpio/gpio-altera-a10sr.c
+F:	drivers/hwmon/altera-a10sr-hwmon.c
+F:	drivers/mfd/altera-a10sr.c
+F:	include/linux/mfd/altera-a10sr.h
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Vince Bridgers <vbridger@opensource.altera.com>
 L:	netdev@vger.kernel.org
-- 
1.7.9.5
