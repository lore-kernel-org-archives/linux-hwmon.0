Return-Path: <c_mykolak@mellanox.com>
Return-path: <c_mykolak@mellanox.com>
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1] hwmon: (aspeed-pwm-tacho) cooling device support.
Date: Thu,  6 Jul 2017 17:23:38 +0300
Message-Id: <20170706142338.32732-1-c_mykolak@mellanox.com>
List-ID: <linux-hwmon@vger.kernel.org>

Add support in aspeed-pwm-tacho driver for cooling device creation.
This cooling device could be bound to a thermal zone
for the thermal control. Device will appear in /sys/class/thermal
folder as cooling_deviceX. Then it could be bound to particular
thermal zones. Allow specification of the cooling levels
vector - PWM duty cycle values in a range from 0 to 255
which correspond to thermal cooling states.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  52 ++++++--
 drivers/hwmon/aspeed-pwm-tacho.c                   | 141 ++++++++++++++++++++-
 2 files changed, 179 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index cf44605..293a994 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -23,9 +23,14 @@ Required properties for pwm-tacho node:
 - clocks : a fixed clock providing input clock frequency(PWM
 	   and Fan Tach clock)
 
-fan subnode format:
+tach-channels subnode format:
 ===================
-Under fan subnode there can upto 8 child nodes, with each child node
+Required properties for tach-channels node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 0.
+
+Under tach-channels subnode there can be upto 8 child nodes, with each child node
 representing a fan. If there are 8 fans each fan can have one PWM port and
 one/two Fan tach inputs.
 
@@ -39,6 +44,22 @@ Required properties for each child node:
 		Fan tach channel 0 and 15 indicating Fan tach channel 15.
 		Atleast one Fan tach input channel is required.
 
+pwm-channels subnode format:
+Under pwm-channels subnode there can be pwm child nodes.
+Required properties for tach-channels node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 0.
+
+- #cooling-cells : should be 2;
+
+pwm subnode format:
+- reg : should be <0x00>.
+
+- cooling-levels      : PWM duty cycle values in a range from 0 to 255
+			which correspond to thermal cooling states.
+
+
 Examples:
 
 pwm_tacho_fixed_clk: fixedclk {
@@ -55,14 +76,25 @@ pwm_tacho: pwmtachocontroller@1e786000 {
 	clocks = <&pwm_tacho_fixed_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
-
-	fan@0 {
-		reg = <0x00>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	tach-channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		fan@0 {
+			reg = <0x00>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+		};
+		fan@1 {
+			reg = <0x01>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+		};
 	};
-
-	fan@1 {
-		reg = <0x01>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+	pwm-channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#cooling-cells = <2>;
+		pwm@0 {
+			reg = <0x00>;
+			cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		};
 	};
 };
diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index ddfe66b..c10a37e 100644
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
@@ -833,10 +946,30 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 	aspeed_create_type(priv);
 
 	for_each_child_of_node(np, child) {
-		ret = aspeed_create_fan(dev, child, priv);
+		if (!of_node_cmp(child->name, "tach-channels")) {
+			for_each_child_of_node(child, grandchild) {
+				ret = aspeed_create_fan(dev, grandchild, priv);
+				of_node_put(grandchild);
+				if (ret) {
+					of_node_put(child);
+					return ret;
+				}
+			}
+		}
+
+		if (!of_node_cmp(child->name, "pwm-channels")) {
+			for_each_child_of_node(child, grandchild) {
+				ret = aspeed_create_pwm_cooling(dev,
+								grandchild,
+								priv);
+				of_node_put(grandchild);
+				if (ret) {
+					of_node_put(child);
+					return ret;
+				}
+			}
+		}
 		of_node_put(child);
-		if (ret)
-			return ret;
 	}
 
 	priv->groups[0] = &pwm_dev_group;
-- 
2.8.4
