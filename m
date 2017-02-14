Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-sn1nam01on0081.outbound.protection.outlook.com ([104.47.32.81]:13376
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753147AbdBNNXE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2017 08:23:04 -0500
From: Marco Franchi <marco.franchi@nxp.com>
To: <linux@roeck-us.net>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <marcofrk@gmail.com>,
        <FoxPeter@kabelbw.de>, Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH v2 1/2] dt: Add vendor prefix for Sensirion
Date: Tue, 14 Feb 2017 11:23:25 -0200
Message-ID: <1487078605-11067-2-git-send-email-marco.franchi@nxp.com>
In-Reply-To: <1487078605-11067-1-git-send-email-marco.franchi@nxp.com>
References: <1487078605-11067-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Sensirion is a sensor manufacturer, providing relative humidity sensors,
temperature sensor and flow sensor solutions.

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
Changes since v1:
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

