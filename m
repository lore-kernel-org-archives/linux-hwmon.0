From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 18:38:32 -0800
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Implement ti,single-shot DT property
In-Reply-To: <20190105004904.17947-1-nicoleotsuka@gmail.com>
Message-ID: <c5d8771d-3274-6982-2f9f-903fd5310488@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>


On 1/4/19 4:49 PM, Nicolin Chen wrote:

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
  drivers/hwmon/ina3221.c | 28 ++++++++++++++++++++++++++++
  1 file changed, 28 insertions(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e90ccac8bebb..152735659e19 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -91,6 +91,12 @@ enum ina3221_channels {
        INA3221_NUM_CHANNELS
  };
  
+enum ina3221_modes {

+       INA3221_MODE_SINGLE_SHOT,
+       INA3221_MODE_CONTINUOUS,
+       INA3221_NUM_MODES,


Is NUM_MODES used anywhere ? Please drop unless there is a reason to keep it.

Guenter


+};
+
  /**
   * struct ina3221_input - channel input source specific information
   * @label: label of channel input source
@@ -111,6 +117,7 @@ struct ina3221_input {
   * @inputs: Array of channel input source specific structures
   * @lock: mutex lock to serialize sysfs attribute accesses
   * @reg_config: Register value of INA3221_CONFIG
+ * @mode: Operating mode -- continuous or single-shot
   */
  struct ina3221_data {
        struct device *pm_dev;
@@ -119,6 +126,7 @@ struct ina3221_data {
        struct ina3221_input inputs[INA3221_NUM_CHANNELS];
        struct mutex lock;
        u32 reg_config;
+       enum ina3221_modes mode;
  };
  
  static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)

@@ -188,6 +196,11 @@ static int ina3221_read_in(struct device *dev, u32 attr, 
int channel, long *val)
                if (!ina3221_is_enabled(ina, channel))
                        return -ENODATA;
  
+		/* Write CONFIG register to trigger a single-shot measurement */

+               if (ina->mode == INA3221_MODE_SINGLE_SHOT)
+                       regmap_write(ina->regmap, INA3221_CONFIG,
+                                    ina->reg_config);
+
                ret = ina3221_wait_for_data(ina);
                if (ret)
                        return ret;
@@ -232,6 +245,11 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
                if (!ina3221_is_enabled(ina, channel))
                        return -ENODATA;
  
+		/* Write CONFIG register to trigger a single-shot measurement */

+               if (ina->mode == INA3221_MODE_SINGLE_SHOT)
+                       regmap_write(ina->regmap, INA3221_CONFIG,
+                                    ina->reg_config);
+
                ret = ina3221_wait_for_data(ina);
                if (ret)
                        return ret;
@@ -617,6 +635,9 @@ static int ina3221_probe_from_dt(struct device *dev, struct 
ina3221_data *ina)
        if (!np)
                return 0;
  
+	if (of_property_read_bool(np, "ti,single-shot"))

+               ina->mode = INA3221_MODE_SINGLE_SHOT;
+
        for_each_child_of_node(np, child) {
                ret = ina3221_probe_child_from_dt(dev, child, ina);
                if (ret)
@@ -654,6 +675,9 @@ static int ina3221_probe(struct i2c_client *client,
                }
        }
  
+	/* Hardware default uses the continuous mode */

+       ina->mode = INA3221_MODE_CONTINUOUS;
+
        for (i = 0; i < INA3221_NUM_CHANNELS; i++)
                ina->inputs[i].shunt_resistor = INA3221_RSHUNT_DEFAULT;
  
@@ -666,6 +690,10 @@ static int ina3221_probe(struct i2c_client *client,

        /* The driver will be reset, so use reset value */
        ina->reg_config = INA3221_CONFIG_DEFAULT;
  
+	/* Clear continuous bit to use single-shot mode */

+       if (ina->mode == INA3221_MODE_SINGLE_SHOT)
+               ina->reg_config &= ~INA3221_CONFIG_MODE_CONTINUOUS;
+
        /* Disable channels if their inputs are disconnected */
        for (i = 0; i < INA3221_NUM_CHANNELS; i++) {
                if (ina->inputs[i].disconnected)
