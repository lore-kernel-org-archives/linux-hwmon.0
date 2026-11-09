Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231394;
	b=YIGP2CQZfUhv3yk5eY1IxEAsMIb4vY52gyRTDM7OaJBBJnx9i1QR1s1rCfBbamxQcFMV
	 tV/1N7UpPcXGJLOA22Gu43K7TAjVdaqdaFndWD+98y14JiXYR8nzxLD8wg82bE2NPDDpj
	 2HhJ/24UZOqL+DJsRt9U3BlZcIvIvl2uygxBm8qps1TE/nYjNGcBuCXudpIlAkPb4dWpK
	 iHXY2+UaMyo3X5qMadeUm+OG0BiJd76Dxy4idqIPMqe4eDywvJr2LbAs0N7CSYx2MTEee
	 7+4cR2ebZY4KteXxoTe/evbgL5JMnew+UmyVrFDMf2/0oWCvO57aPIRnN/XuZCQPQJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4NRkATOS7zVqPGKPDehqJ5moLmosYe5MEheGQEZKtl4=;
	b=2EogATlQrHmPAEUQmyYeiiYVfyfmQ5Ph+OWHWsuHnG6YecKLNEsYk4wnNVpupx0IuoOB
	 G+5JcryjK4y+DoW1izOL3LonYfZoDlI6tyKeAvBqu1htka3SY3nd0phSBuy4LSWXA5ij7
	 9jNp8jiRNdAPVWcBLK4HPWSYlzbmipl8J6AugP3bZFkygdXS3zgrz9nLbqecFyuwV00hG
	 sPf6K5BFlqoL7M1HenNcJH7Qx7R6rze7tQJLnnBL+cyN5B2iFDabVXil0bzUZ0PfVtnrs
	 5Rj2srYijVdAqF8kwzLcWUxau6GBdEGc30eSbuMQYEvSs3UQRGwG+XI/lprEJHsqq7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=m7f2MQj8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E572608362C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E572608362C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=m7f2MQj8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8249185e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 05:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231392; x=1794836192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NRkATOS7zVqPGKPDehqJ5moLmosYe5MEheGQEZKtl4=;
        b=m7f2MQj8DOelwTy+9dXazumTVrOOGmC/Hxj1SBjvuuLwf1GqEH0SANYiJXd72HejXe
         JwMnSANn3PKdzoQUwJZp/449jI9qQUXnr0t8ISIGcyA8oAnZTbqNwPw86If+Ly47GOng
         Z1gJJIQ5x0re5fWBfBF93NkExn5zwsQwImg57BIw/5AoplX+VnCARRUeYByS+4shbfZE
         o7BNCRuUnTjXTqymVGcflaVk2fdY36KKeeWu++Eu8jP9TI1z9FhHzTjdDe4q645Upu4s
         FIv/1t/KWnlB6a2ee+qWCugRS+6scBUBgr/wC/iKUHPBlpvvKbLde3U6EUFHuQWgLwPa
         dYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231392; x=1794836192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NRkATOS7zVqPGKPDehqJ5moLmosYe5MEheGQEZKtl4=;
        b=ycSGsDLbw0X5PDHx09gQd6D+lOYTSQxDC++D4jITk8TZaZ7WtTpMSBzuhRFzgK4izL
         r9TLedjVI9KjW26smJVHEA8cQmRp0k50SaLzTvNIoLWhb2MMldK5sCGR1EdHG4d2ZNdg
         J8jt0oqhy2XcM6MAoaTSWBnfh7Zxy0SmKKZopl1pBFq1R/Ro84BKGOpaAX3BdPBVldeA
         rUR1SL2ka9ysv4fkTPY2GNj29+fx256WHOXdCCAE+IgtX/Aw171YS0SKWqP643oE36H4
         5zm9V/zScLoZ0rpk84YcwaAMXmTefaIe0VYqBrOS4NEFXINxwY2BTzBN978TqFLDiygl
         5OLQ==
X-Forwarded-Encrypted: i=1; AL+hErH6vt9mZlEJp/yDBHInug0ZImJ0MvRqGXwv/suZ1jMbJ07Rw7AFwjrnWY/lNfLNihABIH9mbTDITZ5uww==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zpduihlpnn93vS6W6gB+ubPnqDi97x7JE2LJcf0Ftm5NgwzAa
	3rVTioxFlYxStd7okIZJfsn3PqoWs1JMeWEnDkKVKt+tAcGThCY4I0pw6NvEJJf12j4=
X-Gm-Gg: AYBFou2k+zv/82+RNV7UXTfD7glnH3KAaWzqKJ5iU2HQUyV/27dNMHwt2/zlSQi0Kc5
	MCpLz/JVmUhoHtnpqv+mIK1k6xt5crDvYaUeinUpstEvBtAqsmy3kSQvLBORaTztDINgKPPc4GT
	chyWRYdzCPrNxtuyKJgeDnxxlhw6V5G/D8vbeXnhmwfSkyaAoh7ZtS/J6vgvv5117CFJSR3qa+f
	euYGddeKuL69rd3cL0mHYqnmtOd6erXXKO9K9KE1/Y9CD0TjC6PzYP+K+6Xf9tj75HLOUXjTSZB
	1vFHCCq6qirUGF4TQqMvXsSuIXLeCwucDREV9LSTwue9d6Cm9Yk4/1lKsE8L3sijf5FaBNUQ44F
	/T+BD7W/LleNmGVU0UI25+GgFNB51/gBxsKGp9DBj26wweIZ9ADE9CDZ5GSxOtkVvBINO0aMVjw
	bqAEJWq1WMyWmVrFkME+eTWiq2klZsj05mfuxOonoWGEEGXcG1sks7lEJjzOeZe4SxUn16I9Nvw
	0GdJcObpZXCqhfmaO91Zl5MtTi7OsnmSvnG3luJVa6TOWGS5HFkcFvhqt/fcKPvZwVCgqeyzjgC
	6gX3EPMWcUeW2Y/2Z2VILw9wCbEzFVlmiGGv1YFqojxofYZoh4Z0TE4cM9Htc8S8LSK+3FKrvcC
	EJr5eMkdPkUfXhDhv3siae1KEXxQQWC/LYDUOJ6coxR3RjrPKSSC1VAsY+PV4c2u/SJCioQuzDa
	ypgoI=
X-Received: by 2002:a05:600c:3e0a:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4b94d7634e9mr71704465e9.2.1794231391656;
        Mon, 09 Nov 2026 05:36:31 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:30 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 5/6] hwmon: sparx5: register LAN969x fan as a cooling device
Date: Mon,  9 Nov 2026 14:35:09 +0100
Message-ID: <20261109133609.810876-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the LAN969x hardware fan controller to be used by thermal-zone
cooling maps when cooling-levels are provided on the fan child node.

Translate cooling states to PWM duty-cycle values and keep the cooling
state synchronized with direct pwm1 writes. Register the cooling device
against the fan child so thermal references resolve to the correct node.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Use hwmon_lock() for cooling callbacks instead of a private mutex.

 Documentation/hwmon/sparx5-temp.rst |  14 +++
 drivers/hwmon/sparx5-temp.c         | 145 ++++++++++++++++++++++++++--
 2 files changed, 150 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index edb12f890172c..522707ed5a5f5 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -49,3 +49,17 @@ PWM consumers. The pwm1 value describes the logical duty cycle independently
 of the output polarity. Frequency requests are rounded to the nearest
 hardware divider value; requests outside the divider range are rejected.
 pwm1_freq reports the resulting frequency.
+
+Thermal cooling
+---------------
+
+With device-tree thermal support enabled, the LAN969x fan can also act as a
+thermal cooling device. The fan child's cooling-levels property maps cooling
+states to PWM values from 0 to 255, in ascending order. When cooling levels
+are provided, the driver initially selects the highest level.
+
+Manual pwm1 writes remain available and update the reported cooling state
+to the highest state whose PWM value does not exceed the requested value,
+or state zero if the value is below the first level. Subsequent thermal
+cooling requests can override manual PWM settings. Each cooling request
+programs the exact PWM value associated with the requested state.
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index bdf08931f5b93..caa3fad367684 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/thermal.h>
 
 #include <dt-bindings/pwm/pwm.h>
 
@@ -47,10 +48,14 @@ struct s5_hwmon {
 	void __iomem *base;
 	void __iomem *fan;
 	struct clk *clk;
+	struct device *hwmon_dev;
 	unsigned long clk_rate;
 	u32 pulses_per_revolution;
 	u32 pwm_period;
 	bool pwm_inverted;
+	u32 *cooling_levels;
+	unsigned long cooling_state;
+	unsigned long max_cooling_state;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -124,6 +129,20 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static void s5_update_cooling_state(struct s5_hwmon *hwmon, u32 pwm)
+{
+	unsigned long state;
+
+	if (!hwmon->cooling_levels)
+		return;
+
+	for (state = 0; state < hwmon->max_cooling_state; state++)
+		if (pwm < hwmon->cooling_levels[state + 1])
+			break;
+
+	hwmon->cooling_state = state;
+}
+
 static int s5_read_pwm(struct s5_hwmon *hwmon, long *val)
 {
 	u32 data;
@@ -183,17 +202,23 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
-static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+static void s5_set_pwm(struct s5_hwmon *hwmon, u32 pwm)
 {
 	u32 data;
 
-	if (val < 0 || val > 255)
-		return -EINVAL;
-
 	data = readl_relaxed(hwmon->fan + FAN_CFG);
 	data &= ~FAN_CFG_DUTY_CYCLE;
-	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, pwm);
 	writel_relaxed(data, hwmon->fan + FAN_CFG);
+}
+
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	s5_set_pwm(hwmon, val);
+	s5_update_cooling_state(hwmon, val);
 
 	return 0;
 }
@@ -313,6 +338,89 @@ static const struct hwmon_chip_info s5_fan_chip_info = {
 	.info = s5_fan_info,
 };
 
+static int s5_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	*state = hwmon->max_cooling_state;
+
+	return 0;
+}
+
+static int s5_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	hwmon_lock(hwmon->hwmon_dev);
+	*state = hwmon->cooling_state;
+	hwmon_unlock(hwmon->hwmon_dev);
+
+	return 0;
+}
+
+static int s5_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	if (state > hwmon->max_cooling_state)
+		return -EINVAL;
+
+	hwmon_lock(hwmon->hwmon_dev);
+	s5_set_pwm(hwmon, hwmon->cooling_levels[state]);
+	hwmon->cooling_state = state;
+	hwmon_unlock(hwmon->hwmon_dev);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops s5_cooling_ops = {
+	.get_max_state = s5_cooling_get_max_state,
+	.get_cur_state = s5_cooling_get_cur_state,
+	.set_cur_state = s5_cooling_set_cur_state,
+};
+
+static int s5_get_cooling_data(struct device *dev, struct device_node *fan_np,
+			       struct s5_hwmon *hwmon)
+{
+	u32 *levels;
+	int count, i, ret;
+
+	if (!of_property_present(fan_np, "cooling-levels"))
+		return 0;
+
+	count = of_property_count_u32_elems(fan_np, "cooling-levels");
+	if (count <= 0)
+		return dev_err_probe(dev, count ? : -EINVAL,
+				     "invalid cooling-levels property\n");
+
+	levels = devm_kcalloc(dev, count, sizeof(*levels), GFP_KERNEL);
+	if (!levels)
+		return -ENOMEM;
+	hwmon->cooling_levels = levels;
+
+	ret = of_property_read_u32_array(fan_np, "cooling-levels",
+					 hwmon->cooling_levels, count);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read cooling-levels\n");
+
+	for (i = 0; i < count; i++) {
+		if (hwmon->cooling_levels[i] > 255)
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling level %d exceeds 255\n", i);
+		if (i && hwmon->cooling_levels[i] < hwmon->cooling_levels[i - 1])
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling levels must be ascending\n");
+	}
+
+	hwmon->max_cooling_state = count - 1;
+
+	return 0;
+}
+
 static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
 			   struct s5_hwmon *hwmon)
 {
@@ -346,18 +454,19 @@ static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
 		return dev_err_probe(dev, -EINVAL,
 				     "invalid pulses-per-revolution\n");
 
-	return 0;
+	return s5_get_cooling_data(dev, fan_np, hwmon);
 }
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
 	const struct s5_match_data *match_data;
+	struct thermal_cooling_device *cdev;
 	struct device *dev = &pdev->dev;
-	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
 	struct device_node *fan_np __free(device_node) = NULL;
 	void __iomem *base;
 	bool is_fan;
+	u32 initial_pwm;
 	int ret;
 
 	match_data = device_get_match_data(dev);
@@ -397,16 +506,34 @@ static int s5_temp_probe(struct platform_device *pdev)
 						     "invalid fan PWM period\n");
 		}
 		s5_fan_enable(hwmon);
+
+		if (hwmon->cooling_levels) {
+			initial_pwm = hwmon->cooling_levels[hwmon->max_cooling_state];
+			ret = s5_write_pwm(hwmon, initial_pwm);
+			if (ret)
+				return ret;
+		}
 	} else {
 		s5_temp_enable(hwmon);
 	}
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
 					is_fan ? "lan969x_fan" : "s5_temp", hwmon,
 					is_fan ? &s5_fan_chip_info :
 						 &s5_temp_chip_info, NULL);
+	if (IS_ERR(hwmon->hwmon_dev))
+		return PTR_ERR(hwmon->hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL_OF) && hwmon->cooling_levels) {
+		cdev = devm_thermal_of_child_cooling_device_register(dev, fan_np,
+								     "lan969x-fan", hwmon,
+								     &s5_cooling_ops);
+		if (IS_ERR(cdev))
+			return dev_err_probe(dev, PTR_ERR(cdev),
+					     "failed to register cooling device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	return 0;
 }
 
 static const struct s5_match_data lan969x_fan_match_data = {
-- 
2.56.0

