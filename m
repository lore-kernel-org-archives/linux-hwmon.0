Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-by2nam03on0060.outbound.protection.outlook.com ([104.47.42.60]:63936
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751478AbdBOMol (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Feb 2017 07:44:41 -0500
From: Marco Franchi <marco.franchi@nxp.com>
To: <linux@roeck-us.net>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <marcofrk@gmail.com>,
        <FoxPeter@kabelbw.de>, Marco Franchi <marco.franchi@nxp.com>
Subject: [PATCH v3 1/2] dt: Add vendor prefix for Sensirion
Date: Wed, 15 Feb 2017 10:45:01 -0200
Message-ID: <1487162701-12097-2-git-send-email-marco.franchi@nxp.com>
In-Reply-To: <1487162701-12097-1-git-send-email-marco.franchi@nxp.com>
References: <1487162701-12097-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Sensirion is a sensor manufacturer, providing relative humidity sensors,
temperature sensor and flow sensor solutions.

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
---
Changes since v2:
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

