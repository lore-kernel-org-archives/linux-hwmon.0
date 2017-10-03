Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:57616 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751642AbdJCQLp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Oct 2017 12:11:45 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v4 2/2] Documentation: devicetree: add max6621 device
Date: Tue,  3 Oct 2017 18:08:28 +0000
Message-Id: <1507054108-195806-3-git-send-email-vadimp@mellanox.com>
In-Reply-To: <1507054108-195806-1-git-send-email-vadimp@mellanox.com>
References: <1507054108-195806-1-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add device record for Maxim MAX6621 temperature sensor device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v1->v2
 Comments pointed out by Rob:
 - Add device to trivial-devices.txt instead of having separate binding
   doc file;
---
 Documentation/devicetree/bindings/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index af284fb..8bcac6e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -71,6 +71,7 @@ isil,isl29028		Intersil ISL29028 Ambient Light and Proximity Sensor
 isil,isl29030		Intersil ISL29030 Ambient Light and Proximity Sensor
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
 maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
+maxim,max6621		PECI-to-I2C translator for PECI-to-SMBus/I2C protocol conversion
 maxim,max6625		9-Bit/12-Bit Temperature Sensors with I²C-Compatible Serial Interface
 mc,rv3029c2		Real Time Clock Module with I2C-Bus
 mcube,mc3230		mCube 3-axis 8-bit digital accelerometer
-- 
2.1.4

