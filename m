Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:56492 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933039AbdKGI2h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Nov 2017 03:28:37 -0500
From: Lei YU <mine260309@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc: Lei YU <mine260309@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/3] DT: i2c: W83773G is a trivial device
Date: Tue,  7 Nov 2017 16:27:52 +0800
Message-Id: <1510043274-4778-2-git-send-email-mine260309@gmail.com>
In-Reply-To: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
References: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index af284fb..63ad2f1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -188,3 +188,4 @@ ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Inter
 ti,tmp275		Digital Temperature Sensor
 winbond,w83793		Winbond/Nuvoton H/W Monitor
 winbond,wpct301		i2c trusted platform module (TPM)
+nuvoton,w83773g		Nuvoton Temperature Sensor
-- 
1.9.1

