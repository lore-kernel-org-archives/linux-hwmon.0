Return-path: <tthayer@opensource.altera.com>
From: <tthayer@opensource.altera.com>
To: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <dinguyen@opensource.altera.com>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Thor Thayer <tthayer@opensource.altera.com>
Subject: [RFC 2/8] MAINTAINERS: Addition of Altera Arria10 System Resource Chip
Date: Tue, 29 Mar 2016 14:13:05 -0500
Message-ID: <1459278791-3646-3-git-send-email-tthayer@opensource.altera.com>
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

From: Thor Thayer <tthayer@opensource.altera.com>

Add maintainer for the Altera Arria10 files.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 MAINTAINERS |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 972f25d..567ce60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -608,6 +608,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
+ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
+M:	Thor Thayer <tthayer@opensource.altera.com>
+S:	Maintained
+F:	drivers/mfd/altera-a10sr.c
+F:	include/linux/mfd/altera-a10sr.h
+F:	drivers/gpio/gpio-altera-a10sr.c
+F:	drivers/hwmon/altera-a10sr-hwmon.c
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Vince Bridgers <vbridger@opensource.altera.com>
 L:	netdev@vger.kernel.org
-- 
1.7.9.5
