Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-bl2nam02on0048.outbound.protection.outlook.com ([104.47.38.48]:36479
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751326AbdBJOaG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Feb 2017 09:30:06 -0500
From: Marco Franchi <marco.franchi@nxp.com>
To: <linux@roeck-us.net>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <marcofrk@gmail.com>,
        <FoxPeter@kabelbw.de>, Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH 1/2] dt: Add vendor prefix for Sensirion
Date: Fri, 10 Feb 2017 12:29:31 -0200
Message-ID: <1486736971-31951-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Sensirion is a sensor manufacturer, providing relative humidity sensors,
temperature sensor and flow sensor solutions.

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
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

