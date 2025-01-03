Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D81FA143;
	Fri,  3 Jan 2025 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899308; cv=none; b=aDJtZDYXlTRIPBY7U6B1IkZvusjft/D3GvXXql3ETLKDOEo5kHKI5havGmPeY0x+qM3Y1mgc6s7erDFxAim0S7QiDIKjivZwWaEOhzmkc5GbAI4zv8eEbwqFRM+B+e5usGKu2joKYhGuliCfqYsqj0hnMzM/h9JBE4y0Bw1wnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899308; c=relaxed/simple;
	bh=G9OdLxZSKtxhrHhteXpjDnC0vd4sUhFt50TPTg+R8QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZIaanPfJKFMLfmlyax4a/7USxeu0213+bIZjLX17jQkfkRgAsiQDz/FerC4MCQU8JUZWDAC5NiD2ONKdv3RB06t+xN72G29GL5yCFvVHlC4+EghhGlDz8GEzENuT4ML1fp7UGBSoM14oGcgseRUUqK7PWU05gXddM3kbUCkDXVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4448240005;
	Fri,  3 Jan 2025 10:15:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tTehn-003jno-0o;
	Fri, 03 Jan 2025 11:14:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] hwmon: (pwm-fan): Make default PWM duty cycle configurable
Date: Fri,  3 Jan 2025 11:14:48 +0100
Message-Id: <20250103101448.890946-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103101448.890946-1-peter@korsgaard.com>
References: <20250103101448.890946-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
always be desirable because of noise or power consumption peaks, so support
an optional "default-pwm" property (0..255) that can be used to specify the
default PWM duty cycle.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v3:
- Readded validation code from v2, reworded commit message

Changes since v2:
- Recreated/resent

Changes since v1:
- Rename property to default-pwm
- Drop u32 cast

 drivers/hwmon/pwm-fan.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 53a1a968d00d..f49b5c2c64a9 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -499,6 +499,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **channels;
 	u32 pwm_min_from_stopped = 0;
 	u32 *fan_channel_config;
+	u32 default_pwm = MAX_PWM;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
 
@@ -545,11 +546,17 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->enable_mode = pwm_disable_reg_enable;
 
+	device_property_read_u32(dev, "default-pwm", &default_pwm);
+	if (default_pwm > MAX_PWM) {
+		dev_err(dev, "Invalid default-pwm: %u > %d\n", default_pwm, MAX_PWM);
+		return -EINVAL;
+	}
+
 	/*
-	 * Set duty cycle to maximum allowed and enable PWM output as well as
+	 * Set duty cycle to default and enable PWM output as well as
 	 * the regulator. In case of error nothing is changed
 	 */
-	ret = set_pwm(ctx, MAX_PWM);
+	ret = set_pwm(ctx, default_pwm);
 	if (ret) {
 		dev_err(dev, "Failed to configure PWM: %d\n", ret);
 		return ret;
-- 
2.39.5

