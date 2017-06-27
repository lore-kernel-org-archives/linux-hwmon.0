Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58219 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751704AbdF0OjO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2017 10:39:14 -0400
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
To: Sebastian Reichel <sre@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 1/3] mfd: da9052: fix manual ADC read after timed out read
Date: Tue, 27 Jun 2017 16:38:57 +0200
Message-Id: <20170627143859.21312-2-sebastian.reichel@collabora.co.uk>
In-Reply-To: <20170627143859.21312-1-sebastian.reichel@collabora.co.uk>
References: <20170627143859.21312-1-sebastian.reichel@collabora.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

It is possible that under heavy system load, the counter in the completion
struct, used for waiting for end of AD conversion, gets incremented twice.
To make sure the driver recovers from this situation, the completion struct
should be reinitialized.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/mfd/da9052-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/da9052-core.c b/drivers/mfd/da9052-core.c
index a88c2065d8ab..977418ca9117 100644
--- a/drivers/mfd/da9052-core.c
+++ b/drivers/mfd/da9052-core.c
@@ -386,6 +386,8 @@ int da9052_adc_manual_read(struct da9052 *da9052, unsigned char channel)
 
 	mutex_lock(&da9052->auxadc_lock);
 
+	reinit_completion(&da9052->done);
+
 	/* Channel gets activated on enabling the Conversion bit */
 	mux_sel = chan_mux[channel] | DA9052_ADC_MAN_MAN_CONV;
 
-- 
2.11.0

