Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:59159 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751034AbdGZLYp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2017 07:24:45 -0400
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Ohad Oz <ohado@mellanox.com>, Joel Stanley <joel@jms.id.au>
Subject: [patch v4] hwmon: (aspeed-pwm-tacho) cooling device support.
Date: Wed, 26 Jul 2017 14:24:35 +0300
Message-Id: <20170726112435.32575-1-c_mykolak@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support in aspeed-pwm-tacho driver for cooling device creation.
This cooling device could be bound to a thermal zone
for the thermal control. Device will appear in /sys/class/thermal
folder as cooling_deviceX. Then it could be bound to particular
thermal zones. Allow specification of the cooling levels
vector - PWM duty cycle values in a range from 0 to 255
which correspond to thermal cooling states.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

v1 -> v2:
 - Remove device tree binding file from the patch.
 - Move of_node_put out of cycle because of_get_next_child
   already do of_put_node on previous child.

v2 -> v3:
 Pointed out by Rob Herring:
 - Put cooling-levels under fan subnodes.

v3 -> v4:
 Pointed out by Joel Stanley:
 - Move patch history after Signoff.
 - Remove unnecessary type cast.
 - Use array instead of pointers for colling_levels.
 - Rename num_level to num_levels.
 - Use local variable to make function easier to read.
 - Drop unnesesary sizeof(u8).
 - Use IS_ERR instead of PTR_ERR_OR_ZERO.
---
 drivers/hwmon/aspeed-pwm-tacho.c | 115 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index ddfe66b..9adf9d7 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/thermal.h>
 
 /* ASPEED PWM & FAN Tach Register Definition */
 #define ASPEED_PTCR_CTRL		0x00
@@ -166,6 +167,16 @@
 /* How long we sleep in us while waiting for an RPM result. */
 #define ASPEED_RPM_STATUS_SLEEP_USEC	500
 
+struct aspeed_cooling_device {
+	char name[16];
+	struct aspeed_pwm_tacho_data *priv;
+	struct thermal_cooling_device *tcdev;
+	int pwm_port;
+	u8 *cooling_levels;
+	u8 max_state;
+	u8 cur_state;
+};
+
 struct aspeed_pwm_tacho_data {
 	struct regmap *regmap;
 	unsigned long clk_freq;
@@ -180,6 +191,7 @@ struct aspeed_pwm_tacho_data {
 	u8 pwm_port_type[8];
 	u8 pwm_port_fan_ctrl[8];
 	u8 fan_tach_ch_source[16];
+	struct aspeed_cooling_device *cdev[8];
 	const struct attribute_group *groups[3];
 };
 
@@ -765,6 +777,94 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
 	}
 }
 
+static int
+aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
+			    unsigned long *state)
+{
+	struct aspeed_cooling_device *cdev = tcdev->devdata;
+
+	*state = cdev->max_state;
+
+	return 0;
+}
+
+static int
+aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
+			    unsigned long *state)
+{
+	struct aspeed_cooling_device *cdev = tcdev->devdata;
+
+	*state = cdev->cur_state;
+
+	return 0;
+}
+
+static int
+aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
+			    unsigned long state)
+{
+	struct aspeed_cooling_device *cdev = tcdev->devdata;
+
+	if (state > cdev->max_state)
+		return -EINVAL;
+
+	cdev->cur_state = state;
+	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =
+					cdev->cooling_levels[cdev->cur_state];
+	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
+				     cdev->cooling_levels[cdev->cur_state]);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops = {
+	.get_max_state = aspeed_pwm_cz_get_max_state,
+	.get_cur_state = aspeed_pwm_cz_get_cur_state,
+	.set_cur_state = aspeed_pwm_cz_set_cur_state,
+};
+
+static int aspeed_create_pwm_cooling(struct device *dev,
+				     struct device_node *child,
+				     struct aspeed_pwm_tacho_data *priv,
+				     u32 pwm_port, u8 num_levels)
+{
+	int ret;
+	struct aspeed_cooling_device *cdev;
+
+	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
+
+	if (!cdev)
+		return -ENOMEM;
+
+	cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
+	if (!cdev->cooling_levels)
+		return -ENOMEM;
+
+	cdev->max_state = num_levels - 1;
+	ret = of_property_read_u8_array(child, "cooling-levels",
+					cdev->cooling_levels,
+					num_levels);
+	if (ret) {
+		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
+		return ret;
+	}
+	sprintf(cdev->name, "%s%d", child->name, pwm_port);
+
+	cdev->tcdev = thermal_of_cooling_device_register(child,
+							 cdev->name,
+							 cdev,
+							 &aspeed_pwm_cool_ops);
+	if (IS_ERR(cdev->tcdev))
+		return PTR_ERR(cdev->tcdev);
+
+	cdev->priv = priv;
+	cdev->pwm_port = pwm_port;
+
+	priv->cdev[pwm_port] = cdev;
+
+	return 0;
+}
+
 static int aspeed_create_fan(struct device *dev,
 			     struct device_node *child,
 			     struct aspeed_pwm_tacho_data *priv)
@@ -778,6 +878,15 @@ static int aspeed_create_fan(struct device *dev,
 		return ret;
 	aspeed_create_pwm_port(priv, (u8)pwm_port);
 
+	ret = of_property_count_u8_elems(child, "cooling-levels");
+
+	if (ret > 0) {
+		ret = aspeed_create_pwm_cooling(dev, child, priv, pwm_port,
+						ret);
+		if (ret)
+			return ret;
+	}
+
 	count = of_property_count_u8_elems(child, "aspeed,fan-tach-ch");
 	if (count < 1)
 		return -EINVAL;
@@ -834,10 +943,12 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 
 	for_each_child_of_node(np, child) {
 		ret = aspeed_create_fan(dev, child, priv);
-		of_node_put(child);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 	}
+	of_node_put(child);
 
 	priv->groups[0] = &pwm_dev_group;
 	priv->groups[1] = &fan_dev_group;
-- 
2.8.4

