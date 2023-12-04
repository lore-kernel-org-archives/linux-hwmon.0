Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch [IPv6:2a00:d70:0:e::317])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0F2BB;
	Mon,  4 Dec 2023 08:51:48 -0800 (PST)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1rACAV-000EP4-1k;
	Mon, 04 Dec 2023 17:51:39 +0100
Received: from 157.20.79.83.dynamic.wline.res.cust.swisscom.ch ([83.79.20.157] helo=thinkpad.localdomain)
	by asmtp013.mail.hostpoint.ch with esmtpa (Exim 4.96.2 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1rACAV-000JX2-1G;
	Mon, 04 Dec 2023 17:51:39 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
From: Stefan Gloor <code@stefan-gloor.ch>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Gloor <code@stefan-gloor.ch>
Subject: [PATCH v2 1/2] hwmon: sht3x: add sts3x support
Date: Mon,  4 Dec 2023 17:50:03 +0100
Message-ID: <20231204165004.8491-2-code@stefan-gloor.ch>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204165004.8491-1-code@stefan-gloor.ch>
References: <20231204165004.8491-1-code@stefan-gloor.ch>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Vs-State: 0

Add information regarding the existing support for sts3x series and
update the datasheet links.

Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
---
 Documentation/hwmon/sht3x.rst | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 87864ffd1777..957c854f5d08 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -9,7 +9,19 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: https://www.sensirion.com/file/datasheet_sht3x_digital
+    Datasheets:
+        - https://sensirion.com/media/documents/213E6A3B/63A5A569/Datasheet_SHT3x_DIS.pdf
+        - https://sensirion.com/media/documents/051DF50B/639C8101/Sensirion_Humidity_and_Temperature_Sensors_Datasheet_SHT33.pdf
+
+  * Sensirion STS3x-DIS
+
+    Prefix: 'sts3x'
+
+    Addresses scanned: none
+
+    Datasheets:
+        - https://sensirion.com/media/documents/1DA31AFD/61641F76/Sensirion_Temperature_Sensors_STS3x_Datasheet.pdf
+        - https://sensirion.com/media/documents/292A335C/65537BAF/Sensirion_Datasheet_STS32_STS33.pdf
 
 Author:
 
@@ -19,16 +31,17 @@ Author:
 Description
 -----------
 
-This driver implements support for the Sensirion SHT3x-DIS chip, a humidity
-and temperature sensor. Temperature is measured in degrees celsius, relative
-humidity is expressed as a percentage. In the sysfs interface, all values are
-scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
+This driver implements support for the Sensirion SHT3x-DIS and STS3x-DIS
+series of humidity and temperature sensors. Temperature is measured in degrees
+celsius, relative humidity is expressed as a percentage. In the sysfs interface,
+all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
 
 The device communicates with the I2C protocol. Sensors can have the I2C
-addresses 0x44 or 0x45, depending on the wiring. See
-Documentation/i2c/instantiating-devices.rst for methods to instantiate the device.
+addresses 0x44 or 0x45 (0x4a or 0x4b for sts3x), depending on the wiring. See
+Documentation/i2c/instantiating-devices.rst for methods to instantiate the
+device.
 
-Even if sht3x sensor supports clock-strech(blocking mode) and non-strench
+Even if sht3x sensor supports clock-stretch (blocking mode) and non-stretch
 (non-blocking mode) in single-shot mode, this driver only supports the latter.
 
 The sht3x sensor supports a single shot mode as well as 5 periodic measure
-- 
2.41.0

