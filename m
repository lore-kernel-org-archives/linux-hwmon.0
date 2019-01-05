From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 19:06:56 -0800
Subject: [PATCH v2 2/2] hwmon: (ina3221) Implement ti,single-shot DT property
In-Reply-To: <20190105030636.533-1-nicoleotsuka@gmail.com>
Message-ID: <20190105030636.533-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

By default, ina3221, as a hardware monitor, continuously measures
the inputs and generates corresponding data. However, for battery
powered devices, this mode might be power consuming.

The DT binding doc is updated with a new boolean type property to
allow changing the default operating mode from consuming mode to
single-shot mode, which will measure input on demand and then shut
down to save power.

So this patch implements the DT property accordingly.

Signed-off-by: Nicolin Chen <nicoleots...@gmail.com>
---
Changelog
v1->v2:
 * Replaced the useless mode defines with a boolean variable.

 drivers/hwmon/ina3221.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e90ccac8bebb..4258a6ebe195 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -111,6 +111,7 @@ struct ina3221_input {
  * @inputs: Array of channel input source specific structures
  * @lock: mutex lock to serialize sysfs attribute accesses
  * @reg_config: Register value of INA3221_CONFIG
+ * @single_shot: running in single-shot operating mode
  */
 struct ina3221_data {
        struct device *pm_dev;
@@ -119,6 +120,8 @@ struct ina3221_data {
        struct ina3221_input inputs[INA3221_NUM_CHANNELS];
        struct mutex lock;
        u32 reg_config;
+
+       bool single_shot;
 };
 
 static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
@@ -188,6 +191,11 @@ static int ina3221_read_in(struct device *dev, u32 attr, 
int channel, long *val)
                if (!ina3221_is_enabled(ina, channel))
                        return -ENODATA;
 
+               /* Write CONFIG register to trigger a single-shot measurement */
+               if (ina->single_shot)
+                       regmap_write(ina->regmap, INA3221_CONFIG,
+                                    ina->reg_config);
+
                ret = ina3221_wait_for_data(ina);
                if (ret)
                        return ret;
@@ -232,6 +240,11 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
                if (!ina3221_is_enabled(ina, channel))
                        return -ENODATA;
 
+               /* Write CONFIG register to trigger a single-shot measurement */
+               if (ina->single_shot)
+                       regmap_write(ina->regmap, INA3221_CONFIG,
+                                    ina->reg_config);
+
                ret = ina3221_wait_for_data(ina);
                if (ret)
                        return ret;
@@ -617,6 +630,9 @@ static int ina3221_probe_from_dt(struct device *dev, struct 
ina3221_data *ina)
        if (!np)
                return 0;
 
+       if (of_property_read_bool(np, "ti,single-shot"))
+               ina->single_shot = true;
+
        for_each_child_of_node(np, child) {
                ret = ina3221_probe_child_from_dt(dev, child, ina);
                if (ret)
@@ -666,6 +682,10 @@ static int ina3221_probe(struct i2c_client *client,
        /* The driver will be reset, so use reset value */
        ina->reg_config = INA3221_CONFIG_DEFAULT;
 
+       /* Clear continuous bit to use single-shot mode */
+       if (ina->single_shot)
+               ina->reg_config &= ~INA3221_CONFIG_MODE_CONTINUOUS;
+
        /* Disable channels if their inputs are disconnected */
        for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
                if (ina->inputs[i].disconnected)
-- 
2.17.1
