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
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v8 01/12] dt-bindings: Add a document of PECI subsystem
Date: Tue, 18 Sep 2018 14:51:13 -0700
Message-Id: <20180918215124.14003-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
List-ID: <linux-hwmon@vger.kernel.org>

This commit adds a document of generic PECI bus, adapter and client
driver.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 .../devicetree/bindings/peci/peci.txt         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci.txt

diff --git a/Documentation/devicetree/bindings/peci/peci.txt b/Documentation/devicetree/bindings/peci/peci.txt
new file mode 100644
index 000000000000..864b7ab4e9fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci.txt
@@ -0,0 +1,43 @@
+Generic device tree configuration for PECI adapters
+===================================================
+
+Required properties:
+- #address-cells : Should be <1>. Read more about client addresses below.
+- #size-cells    : Should be <0>. Read more about client addresses below.
+
+The cells properties above define that an address of CPU clients of a PECI bus
+are described by a single value.
+
+Example:
+	peci0: peci-bus@0 {
+		compatible = "vendor,soc-peci";
+		reg = <0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+Generic device tree configuration for PECI clients
+==================================================
+
+Required properties:
+- compatible : Should contain name of PECI client.
+- reg        : Should contain address of a client CPU. Address range of CPU
+	       clients starts from 0x30 based on PECI specification.
+
+Example:
+	peci-bus@0 {
+		compatible = "vendor,soc-peci";
+		reg = <0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		peci-client@30 {
+			compatible = "intel,peci-client";
+			reg = <0x30>;
+		};
+
+		peci-client@31 {
+			compatible = "intel,peci-client";
+			reg = <0x31>;
+		};
+	};
-- 
2.18.0
