Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:53567 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752722AbdIYXJc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2017 19:09:32 -0400
Received: by mail-pg0-f41.google.com with SMTP id j70so4862726pgc.10
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2017 16:09:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/9] hwmon: gpio-fan: Move DT bindings to the right place
Date: Tue, 26 Sep 2017 01:09:03 +0200
Message-Id: <20170925230911.20824-2-linus.walleij@linaro.org>
In-Reply-To: <20170925230911.20824-1-linus.walleij@linaro.org>
References: <20170925230911.20824-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This moves the GPIO fan bindings to the hwmon bindings. The GPIO
fan is a hwmon class hardware, not related to GPIO other than being
a consumer of GPIOs.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{gpio => hwmon}/gpio-fan.txt (100%)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-fan.txt b/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
similarity index 100%
rename from Documentation/devicetree/bindings/gpio/gpio-fan.txt
rename to Documentation/devicetree/bindings/hwmon/gpio-fan.txt
-- 
2.13.5

