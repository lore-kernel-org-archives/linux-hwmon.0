Return-Path: <peda@axentia.se>
Return-path: <peda@axentia.se>
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: add B57891S0103 thermistor from Epcos
Date: Sat, 17 Nov 2018 12:12:57 +0000
Message-ID: <20181117121248.32143-1-peda@axentia.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

These are Negative Temperature Coefficient thermistors, like the others
in the list.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt b/D=
ocumentation/devicetree/bindings/hwmon/ntc_thermistor.txt
index c3b9c4cfe8df..37f18d684f6a 100644
--- a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
+++ b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
@@ -4,6 +4,7 @@ NTC Thermistor hwmon sensors
 Requires node properties:
 - "compatible" value : one of
 	"epcos,b57330v2103"
+	"epcos,b57891s0103"
 	"murata,ncp15wb473"
 	"murata,ncp18wb473"
 	"murata,ncp21wb473"
--=20
2.11.0
