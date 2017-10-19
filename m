Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43236 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbdJSPvz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Oct 2017 11:51:55 -0400
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: Support Opensource <support.opensource@diasemi.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        stable@vger.kernel.org
Subject: [PATCH] hwmon: da9052 Increase sample rate when using TSI
Date: Thu, 19 Oct 2017 16:51:44 +0100
Message-Id: <1508428304-31106-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The TSI channel, which is usually used for touchscreen support, but can
be used as 4 general purpose ADCs. When used as a touchscreen interface
the touchscreen driver switches the device into 1ms sampling mode (rather
than the default 10ms economy mode) as recommended by the manufacturer.
When using the TSI channels as a general purpose ADC we are currently not
doing this and testing suggests that this can result in ADC timeouts:

[ 5827.198289] da9052 spi2.0: timeout waiting for ADC conversion interrupt
[ 5827.728293] da9052 spi2.0: timeout waiting for ADC conversion interrupt
[ 5993.808335] da9052 spi2.0: timeout waiting for ADC conversion interrupt
[ 5994.328441] da9052 spi2.0: timeout waiting for ADC conversion interrupt
[ 5994.848291] da9052 spi2.0: timeout waiting for ADC conversion interrupt

Switching to the 1ms timing resolves this issue.

Cc: stable@vger.kernel.org
Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
 drivers/hwmon/da9052-hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 97a62f5..a973eb6 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -477,6 +477,11 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		/* disable touchscreen features */
 		da9052_reg_write(hwmon->da9052, DA9052_TSI_CONT_A_REG, 0x00);
 
+		/* Sample every 1ms */
+		da9052_reg_update(hwmon->da9052, DA9052_ADC_CONT_REG,
+					  DA9052_ADCCONT_ADCMODE,
+					  DA9052_ADCCONT_ADCMODE);
+
 		err = da9052_request_irq(hwmon->da9052, DA9052_IRQ_TSIREADY,
 					 "tsiready-irq", da9052_tsi_datardy_irq,
 					 hwmon);
-- 
1.8.3.1

