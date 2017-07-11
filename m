Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41800 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755854AbdGKORe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2017 10:17:34 -0400
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Ohad Oz <ohado@mellanox.com>
Subject: [patch v2] hwmon: (aspeed-pwm-tacho) cooling device support.
Date: Tue, 11 Jul 2017 16:18:49 +0300
Message-Id: <20170711131849.9388-1-c_mykolak@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support in aspeed-pwm-tacho driver for cooling device creation.
This cooling device could be bound to a thermal zone
for the thermal control. Device will appear in /sys/class/thermal
folder as cooling_deviceX. Then it could be bound to particular
thermal zones. Allow specification of the cooling levels
vector - PWM duty cycle values in a range from 0 to 255
which correspond to thermal cooling states.

v1 -> v2:
 - Remove device tree binding file from the patch.
 - Move of_node_put out of cycle because of_get_next_child
   already do of_put_node on previous child.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 144 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index ddfe66b..0c50ff8 100644
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
 
@@ -794,10 +806,111 @@ static int aspeed_create_fan(struct device *dev,
 	return 0;
 }
 
+static int
+aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
+			    unsigned long *state)
+{
+	struct aspeed_cooling_device *cdev =
+				(struct aspeed_cooling_device *)tcdev->devdata;
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
+	struct aspeed_cooling_device *cdev =
+				(struct aspeed_cooling_device *)tcdev->devdata;
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
+	struct aspeed_cooling_device *cdev =
+				(struct aspeed_cooling_device *)tcdev->devdata;
+
+	if (state > cdev->max_state)
+		return -EINVAL;
+
+	cdev->cur_state = state;
+	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] = *(cdev->cooling_levels
+							  + cdev->cur_state);
+	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
+				     *(cdev->cooling_levels +
+				       cdev->cur_state));
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
+				     struct aspeed_pwm_tacho_data *priv)
+{
+	u32 pwm_port;
+	int ret;
+
+	ret = of_property_read_u32(child, "reg", &pwm_port);
+	if (ret)
+		return ret;
+
+	ret = of_property_count_u8_elems(child, "cooling-levels");
+	if (ret <= 0) {
+		dev_err(dev, "Wrong cooling-levels data.\n");
+		return -EINVAL;
+	}
+
+	priv->cdev[pwm_port] = devm_kzalloc(dev, sizeof(*priv->cdev[pwm_port]),
+					    GFP_KERNEL);
+	if (!priv->cdev[pwm_port])
+		return -ENOMEM;
+
+	priv->cdev[pwm_port]->cooling_levels = devm_kzalloc(dev, ret *
+							    sizeof(u8),
+							    GFP_KERNEL);
+	if (!priv->cdev[pwm_port]->cooling_levels)
+		return -ENOMEM;
+
+	priv->cdev[pwm_port]->max_state = ret - 1;
+	ret = of_property_read_u8_array(child, "cooling-levels",
+					priv->cdev[pwm_port]->cooling_levels,
+					ret);
+	if (ret) {
+		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
+		return ret;
+	}
+
+	sprintf(priv->cdev[pwm_port]->name, "%s%d", child->name, pwm_port);
+	priv->cdev[pwm_port]->tcdev = thermal_of_cooling_device_register(child,
+						priv->cdev[pwm_port]->name,
+						priv->cdev[pwm_port],
+						&aspeed_pwm_cool_ops);
+	if (PTR_ERR_OR_ZERO(priv->cdev[pwm_port]->tcdev))
+		return PTR_ERR(priv->cdev[pwm_port]->tcdev);
+
+	priv->cdev[pwm_port]->priv = priv;
+	priv->cdev[pwm_port]->pwm_port = pwm_port;
+
+	return 0;
+}
+
 static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np, *child;
+	struct device_node *np, *child, *grandchild;
 	struct aspeed_pwm_tacho_data *priv;
 	void __iomem *regs;
 	struct resource *res;
@@ -833,11 +946,31 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 	aspeed_create_type(priv);
 
 	for_each_child_of_node(np, child) {
-		ret = aspeed_create_fan(dev, child, priv);
-		of_node_put(child);
-		if (ret)
-			return ret;
+		if (!of_node_cmp(child->name, "tach-channels")) {
+			for_each_child_of_node(child, grandchild) {
+				ret = aspeed_create_fan(dev, grandchild, priv);
+				if (ret) {
+					of_node_put(grandchild);
+					of_node_put(child);
+					return ret;
+				}
+			}
+		}
+		of_node_put(grandchild);
+		if (!of_node_cmp(child->name, "pwm-channels")) {
+			for_each_child_of_node(child, grandchild) {
+				ret = aspeed_create_pwm_cooling(dev, grandchild,
+								priv);
+				if (ret) {
+					of_node_put(grandchild);
+					of_node_put(child);
+					return ret;
+				}
+			}
+		}
+		of_node_put(grandchild);
 	}
+	of_node_put(child);
 
 	priv->groups[0] = &pwm_dev_group;
 	priv->groups[1] = &fan_dev_group;
@@ -868,3 +1001,4 @@ module_platform_driver(aspeed_pwm_tacho_driver);
 MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
 MODULE_DESCRIPTION("ASPEED PWM and Fan Tacho device driver");
 MODULE_LICENSE("GPL");
+
-- 
2.8.4

