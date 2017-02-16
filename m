Return-path: <marco.franchi@nxp.com>
From: Marco Franchi <marco.franchi@nxp.com>
To: <linux@roeck-us.net>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <marcofrk@gmail.com>, <FoxPeter@kabelbw.de>,
	Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH v4 1/2] dt: Add vendor prefix for Sensirion
Date: Thu, 16 Feb 2017 10:23:44 -0200
Message-ID: <1487247824-10005-2-git-send-email-marco.franchi@nxp.com>
In-Reply-To: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Sensirion is a sensor manufacturer, providing relative humidity sensors,
temperature sensor and flow sensor solutions.

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
Changes since v3:
- none

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7a98c33..43e1799 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -263,6 +263,7 @@ sbs	Smart Battery System
 schindler	Schindler
 seagate	Seagate Technology PLC
 semtech	Semtech Corporation
+sensirion	Sensirion AG
 sgx	SGX Sensortech
 sharp	Sharp Corporation
 si-en	Si-En Technology Ltd.
-- 
2.7.4
