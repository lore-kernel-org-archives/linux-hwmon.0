Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:49224 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdKIHJg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Nov 2017 02:09:36 -0500
From: Lei YU <mine260309@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc: Lei YU <mine260309@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 1/3] DT: i2c: W83773G is a trivial device
Date: Thu,  9 Nov 2017 15:08:59 +0800
Message-Id: <1510211341-17415-2-git-send-email-mine260309@gmail.com>
In-Reply-To: <1510211341-17415-1-git-send-email-mine260309@gmail.com>
References: <1510211341-17415-1-git-send-email-mine260309@gmail.com>
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

