Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146744F5E04
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896277; cv=none; b=GFxNBlAbTTI2ZrkLk3/8wPXstJLZ0I4G/p0s4O9tux0MER3RcDEMtw4g1gPqRxTJVf/XbxHax8CZShwtEpQwJqJ92/lWtKL9kTtZiR549VVMYlDAsaJ58W/y4VDK65SRMM3wR/OlhFJVOANtzPHIFfEMZjTNF9tM9Br26lx4f9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896277; c=relaxed/simple;
	bh=9CzWCCddnY9sFxnREevsFNM4LaigT5QxcfZyr2Va44I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qO4qBamtIfJ8QM14fywHbJxendxIjwrI7XYQYElF/oGNAIdq0vdWhM4z2YULAdtEp86oyuYAT0+fnssx7QLf49W8m+DyTDSiTLKDC2+qzUpuql46nGVUtEujlm+1idaGrMB1URptGwy+U+5BrWqhJRXfilHNHSgwCzyuvWqxUW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=vtYPl6dr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="vtYPl6dr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso353451766b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896274; x=1792501074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrgOGdMLkV0WrLy0TUjWMoYb0B8/UDJwOZrA1ohaJT0=;
        b=vtYPl6drQ+WK+iPneGi0dxMWMZ6cOwsZqzygzMntKK/OwANSdia92srm3UpRa3Z2Sr
         wCZh+yX4WJgtKrO3pzlSuN0cxNMGDiuktXHt22y48uXxTk/2ZVvHtllX+czdVBEsJbWL
         AhgzBN88TjAV4vQxE2b9M/nCOTN4LEHy/Q07Yulsc+HnCAhYBkH62TJKdyWpxhCt80Vg
         anZQxVSSxKhPzN2gcUCwLz+F44AMcN3xI1fAQbhLLf/W043K3UBOLVN7HD+lTLHDyfXO
         NJihJOt1HJzfbfPAtLA3Ylr8i3E89eHAlbcvk33WYIogkKiYeCE7x9s/MKVI1bTa4YvW
         XOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896274; x=1792501074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrgOGdMLkV0WrLy0TUjWMoYb0B8/UDJwOZrA1ohaJT0=;
        b=KlRuahHClkxcN6b9KGONdssakvUQui1MUm4MkvG/QuD45N5mjFufirOzCCWJ7gyTOA
         2XPDomW+r4voVeLypX9FzNvJoqm6MKbm/VeK5DC4SGZBX+fRwrQ1BaYFreBwIHZ+jyr2
         KoRTs1XUtx8tvsQqmW7zJZ9tTTIpcmIG+OEGu82Kc225Udt4MC9DIWL0hRW/56HAeX6n
         hxjVG5uEwUUYigaurPAy3SXj9wjwWaZ6+V8xr4dzyZJ09H5RO0/IscCfmP0wKHfWaGGu
         Agy8VdB6+KMM6CTOJJnvjkteXza4/YGQ2S8FRQlJ9AKbl4TZcwK+SX/d/DbvcZXZ1eKp
         kp1A==
X-Forwarded-Encrypted: i=1; AKwUvBzyBKNZLCwOHSq+r5G8mm/YVtcEbLe1QCO5OJdm0Sd0VjCuwGXnxjPVpiybdb9rQ9JC3ALmF1GxNX8mkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxDL6LM0z/vG1/QC2vyaFm9JTohZzs1JPq90C4MVDLpMw8yyoC
	I0taqqSPQEHqQ8c2/l7j/vWfXqZ+n0YJsbsa4S+ncevumkU/ZMmNC3jvIyrePLu/HLywMFcTto8
	bkS0f
X-Gm-Gg: AYBFou3c8QIpZNU7rGVfLVLUwb8dvxAJUxhBnYD6QQguOd7XeqpTAyH8S2xv2Srn70j
	Olg6KlQliVNDFGtUWoEgH2VgsYbNrXMO3vyABIuZQaY0ZP8Q9I/wRHm6Jt49Gucu4GUeHYMoJJe
	2TboKS6TKJXxvYhcMUXlSqVr+U2392WlqqRCpMfmXUT52IwuQ/UPzE4GNqQSkohzoPmLQINQhW3
	9vBZNfc8/3r/sFDTDvgV2KLjprXlBdsVnW2cmWGDvfLcgy1eRp8i0hy78hIbmtERlNMnt7yYzev
	ktZMhLLWfnsgf7PDD76Rv4Z2GpIhNqNdjFsQH5iMgBQQvz+z68sVU/YElMRSb8AricVgosz8YYA
	xE4EIn9GFdAh9afRM/BsPLZjC+VAzuhggZnMq6lSEIZogy7Ze/Pzx+TItG9IeuxNF5eX+yJhP/E
	Klg7sBQE0T/uGMZyGGjLBSCWCnINe/OL9d5q9+SVKAWVooRyCL41/HeCAs/OS8DirGuYfVuPstf
	vEPAw1jrRNMP07DbzbZPgaTbKl3aX3WGdlRu7qykwNx0Mk7wZyMIb1bqryGxn3Y2NvbUAqDYGWC
	1IA0KKbsXaT0BW8cSzh/H5E4KZ0Z79Y=
X-Received: by 2002:a17:907:3fa9:b0:c2a:6c3:9e98 with SMTP id a640c23a62f3a-c31aa098468mr1181829066b.40.1791896274364;
        Tue, 13 Oct 2026 05:57:54 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:53 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 5/6] hwmon: sparx5: register LAN969x fan as a cooling device
Date: Tue, 13 Oct 2026 14:56:29 +0200
Message-ID: <20261013125735.1542349-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the LAN969x hardware fan controller to be used by thermal-zone
cooling maps when cooling-levels are provided on the fan child node.

Translate cooling states to PWM duty-cycle values and keep the cooling
state synchronized with direct pwm1 writes. Register the cooling device
against the fan child so thermal references resolve to the correct node.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/sparx5-temp.rst |  14 +++
 drivers/hwmon/sparx5-temp.c         | 144 ++++++++++++++++++++++++++--
 2 files changed, 150 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index a1f8218e68794..28f91537fc376 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -48,3 +48,17 @@ PWM consumers. The pwm1 value describes the logical duty cycle independently
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
index 5130140e1b579..3eabcc7946098 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/thermal.h>
 
 #include <dt-bindings/pwm/pwm.h>
 
@@ -53,6 +54,9 @@ struct s5_hwmon {
 	u32 pulses_per_revolution;
 	u32 pwm_frequency;
 	bool pwm_inverted;
+	u32 *cooling_levels;
+	unsigned long cooling_state;
+	unsigned long max_cooling_state;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -123,6 +127,20 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
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
@@ -184,19 +202,25 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
-static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+/* Caller must hold hwmon->lock. */
+static void s5_set_pwm(struct s5_hwmon *hwmon, u32 pwm)
 {
 	u32 data;
 
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, pwm);
+	writel_relaxed(data, hwmon->fan + FAN_CFG);
+}
+
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
 	if (val < 0 || val > 255)
 		return -EINVAL;
 
 	mutex_lock(&hwmon->lock);
-
-	data = readl_relaxed(hwmon->fan + FAN_CFG);
-	data &= ~FAN_CFG_DUTY_CYCLE;
-	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
-	writel_relaxed(data, hwmon->fan + FAN_CFG);
+	s5_set_pwm(hwmon, val);
+	s5_update_cooling_state(hwmon, val);
 
 	mutex_unlock(&hwmon->lock);
 
@@ -289,6 +313,90 @@ static const struct hwmon_chip_info s5_chip_info = {
 	.info = s5_info,
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
+	mutex_lock(&hwmon->lock);
+	*state = hwmon->cooling_state;
+	mutex_unlock(&hwmon->lock);
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
+	mutex_lock(&hwmon->lock);
+	s5_set_pwm(hwmon, hwmon->cooling_levels[state]);
+	hwmon->cooling_state = state;
+
+	mutex_unlock(&hwmon->lock);
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
@@ -320,16 +428,18 @@ static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
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
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
 	struct device_node *fan_np __free(device_node) = NULL;
+	u32 initial_pwm;
 	int ret;
 
 	match_data = device_get_match_data(dev);
@@ -372,14 +482,32 @@ static int s5_temp_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, ret,
 						     "invalid fan PWM period\n");
 		}
+
+		if (hwmon->cooling_levels) {
+			initial_pwm = hwmon->cooling_levels[hwmon->max_cooling_state];
+			ret = s5_write_pwm(hwmon, initial_pwm);
+			if (ret)
+				return ret;
+		}
 	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "s5_temp",
 							 hwmon,
 							 &s5_chip_info,
 							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
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
 
 static const struct s5_match_data lan969x_match_data = {
-- 
2.56.0

