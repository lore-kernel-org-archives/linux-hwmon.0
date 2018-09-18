Return-Path: <jae.hyun.yoo@linux.intel.com>
Return-path: <jae.hyun.yoo@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Eric Sandeen <sandeen@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Wu Hao <hao.wu@intel.com>,
	Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
	"Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
	Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Vinod Koul <vkoul@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Kershner <david.kershner@unisys.com>,
	Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
	Sagar Dharia <sdharia@codeaurora.org>,
	Johan Hovold <johan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jason M Biils <jason.m.bills@linux.intel.com>
Subject: [PATCH v8 12/12] Add maintainers for the PECI subsystem
Date: Tue, 18 Sep 2018 14:51:24 -0700
Message-Id: <20180918215124.14003-13-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
List-ID: <linux-hwmon@vger.kernel.org>

This commit adds maintainer information for the PECI subsystem.

Cc: David S. Miller <davem@davemloft.net>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ece30f15777..b9ffc217ec68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11361,6 +11361,19 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/peaq-wmi.c
 
+PECI SUBSYSTEM
+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+M:	Jason M Biils <jason.m.bills@linux.intel.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/peci/
+F:	drivers/mfd/intel-peci-client.c
+F:	drivers/peci/
+F:	drivers/hwmon/peci-*.c
+F:	include/linux/mfd/intel-peci-client.h
+F:	include/linux/peci.h
+F:	include/uapi/linux/peci-ioctl.h
+
 PER-CPU MEMORY ALLOCATOR
 M:	Dennis Zhou <dennis@kernel.org>
 M:	Tejun Heo <tj@kernel.org>
-- 
2.18.0
