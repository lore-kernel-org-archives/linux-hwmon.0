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
	James Feist <james.feist@linux.intel.com>,
	Jason M Biils <jason.m.bills@linux.intel.com>,
	Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: [PATCH v8 02/12] Documentation: ioctl: Add ioctl numbers for PECI subsystem
Date: Tue, 18 Sep 2018 14:51:14 -0700
Message-Id: <20180918215124.14003-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
List-ID: <linux-hwmon@vger.kernel.org>

This commit updates ioctl-number.txt to reflect ioctl numbers used
by the PECI subsystem.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Tomohiro Kusumi <kusumi.tomohiro@gmail.com>
Cc: Eric Sandeen <sandeen@redhat.com>
Cc: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Cc: Bryant G. Ly <bryantly@linux.vnet.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: James Feist <james.feist@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 Documentation/ioctl/ioctl-number.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
index 13a7c999c04a..d9577593647e 100644
--- a/Documentation/ioctl/ioctl-number.txt
+++ b/Documentation/ioctl/ioctl-number.txt
@@ -325,6 +325,8 @@ Code  Seq#(hex)	Include File		Comments
 0xB4	00-0F	linux/gpio.h		<mailto:linux-gpio@vger.kernel.org>
 0xB5	00-0F	uapi/linux/rpmsg.h	<mailto:linux-remoteproc@vger.kernel.org>
 0xB6	all	linux/fpga-dfl.h
+0xB7	00-0F	uapi/linux/peci-ioctl.h	PECI subsystem
+					<mailto:jae.hyun.yoo@linux.intel.com>
 0xC0	00-0F	linux/usb/iowarrior.h
 0xCA	00-0F	uapi/misc/cxl.h
 0xCA	10-2F	uapi/misc/ocxl.h
-- 
2.18.0
