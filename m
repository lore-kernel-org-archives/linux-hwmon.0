Return-Path: <joel.stan@gmail.com>
Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <20170718033653.10298-2-andrew@aj.id.au>
References: <20170718033653.10298-1-andrew@aj.id.au> <20170718033653.10298-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jul 2017 00:35:01 +0930
Message-ID: <CACPK8XdSwHHziOFGhMn9n9NJk0dWnkqMBKuO0tNrYh72W8e4dg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] hwmon: pmbus: Add fan control support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	msbarth <msbarth@linux.vnet.ibm.com>, Matt Spinler <mspinler@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Jul 18, 2017 at 1:06 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Expose fanX_target, pwmX and pwmX_enable hwmon sysfs attributes.

Nice! I had a bit of a read. I'm not a pmbus expert, so most of the
review is nitpicks about types, etc.

I'll defer to Guenter for the real stuff.

>
> Fans in a PMBus device are driven by the configuration of two registers:
> FAN_CONFIG_x_y and FAN_COMMAND_x: FAN_CONFIG_x_y dictates how the fan
> and the tacho operate (if installed), while FAN_COMMAND_x sets the
> desired fan rate. The unit of FAN_COMMAND_x is dependent on the
> operational fan mode, RPM or PWM percent duty, as determined by the
> corresponding FAN_CONFIG_x_y.
>
> The mapping of fanX_target, pwmX and pwmX_enable onto FAN_CONFIG_x_y and
> FAN_COMMAND_x is implemented with the addition of virtual registers and
> generic implementations in the core:
>
> 1. PMBUS_VIRT_FAN_TARGET_x
> 2. PMBUS_VIRT_PWM_x
> 3. PMBUS_VIRT_PWM_ENABLE_x
>
> The facilitate the necessary side-effects of each access. Examples of
> the read case, assuming m = 1, b = 0, R = 0:
>
>              Read     |              With              || Gives
>          -------------------------------------------------------
>            Attribute  | FAN_CONFIG_x_y | FAN_COMMAND_y || Value
>          ----------------------------------------------++-------
>           fanX_target | ~PB_FAN_z_RPM  | 0x0001        || 1
>           pwm1        | ~PB_FAN_z_RPM  | 0x0064        || 255
>           pwmX_enable | ~PB_FAN_z_RPM  | 0x0001        || 1
>           fanX_target |  PB_FAN_z_RPM  | 0x0001        || 1
>           pwm1        |  PB_FAN_z_RPM  | 0x0064        || 0
>           pwmX_enable |  PB_FAN_z_RPM  | 0x0001        || 1
>
> And the write case:
>
>              Write    | With  ||               Sets
>          -------------+-------++----------------+---------------
>            Attribute  | Value || FAN_CONFIG_x_y | FAN_COMMAND_x
>          -------------+-------++----------------+---------------
>           fanX_target | 1     ||  PB_FAN_z_RPM  | 0x0001
>           pwmX        | 255   || ~PB_FAN_z_RPM  | 0x0064
>           pwmX_enable | 1     || ~PB_FAN_z_RPM  | 0x0064
>
> Also, the DIRECT mode scaling of some controllers is different between
> RPM and PWM percent duty control modes, so PSC_PWM is introduced to
> capture the necessary coefficients.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> v1 -> v2:
> * Convert to using virtual registers
> * Drop struct pmbus_fan_ctrl
> * Introduce PSC_PWM
> * Drop struct pmbus_coeffs
> * Drop additional callbacks
>
>  drivers/hwmon/pmbus/pmbus.h      |  19 ++++
>  drivers/hwmon/pmbus/pmbus_core.c | 215 +++++++++++++++++++++++++++++++++++----
>  2 files changed, 217 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index bfcb13bae34b..226a37bd525f 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -190,6 +190,20 @@ enum pmbus_regs {
>         PMBUS_VIRT_VMON_UV_FAULT_LIMIT,
>         PMBUS_VIRT_VMON_OV_FAULT_LIMIT,
>         PMBUS_VIRT_STATUS_VMON,
> +
> +       /* Fan control */
> +       PMBUS_VIRT_FAN_TARGET_1,
> +       PMBUS_VIRT_FAN_TARGET_2,
> +       PMBUS_VIRT_FAN_TARGET_3,
> +       PMBUS_VIRT_FAN_TARGET_4,
> +       PMBUS_VIRT_PWM_1,
> +       PMBUS_VIRT_PWM_2,
> +       PMBUS_VIRT_PWM_3,
> +       PMBUS_VIRT_PWM_4,
> +       PMBUS_VIRT_PWM_ENABLE_1,
> +       PMBUS_VIRT_PWM_ENABLE_2,
> +       PMBUS_VIRT_PWM_ENABLE_3,
> +       PMBUS_VIRT_PWM_ENABLE_4,
>  };
>
>  /*
> @@ -223,6 +237,8 @@ enum pmbus_regs {
>  #define PB_FAN_1_RPM                   BIT(6)
>  #define PB_FAN_1_INSTALLED             BIT(7)
>
> +enum pmbus_fan_mode { percent = 0, rpm };
> +
>  /*
>   * STATUS_BYTE, STATUS_WORD (lower)
>   */
> @@ -313,6 +329,7 @@ enum pmbus_sensor_classes {
>         PSC_POWER,
>         PSC_TEMPERATURE,
>         PSC_FAN,
> +       PSC_PWM,
>         PSC_NUM_CLASSES         /* Number of power sensor classes */
>  };
>
> @@ -413,6 +430,8 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
>                           u8 value);
>  int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>                            u8 mask, u8 value);
> +int pmbus_update_fan(struct i2c_client *client, int page, int id,
> +                    int config, int mask, int command);
>  void pmbus_clear_faults(struct i2c_client *client);
>  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
>  bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ba59eaef2e07..712a8b6c4bd6 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -63,6 +63,7 @@ struct pmbus_sensor {
>         u16 reg;                /* register */
>         enum pmbus_sensor_classes class;        /* sensor class */
>         bool update;            /* runtime sensor update needed */
> +       bool convert;           /* Whether or not to apply linear/vid/direct */
>         int data;               /* Sensor data.
>                                    Negative if there was a read error */
>  };
> @@ -118,6 +119,27 @@ struct pmbus_data {
>         u8 currpage;
>  };
>
> +static const int pmbus_fan_rpm_mask[] = {
> +       PB_FAN_1_RPM,
> +       PB_FAN_2_RPM,
> +       PB_FAN_1_RPM,
> +       PB_FAN_2_RPM,
> +};
> +
> +static const int pmbus_fan_config_registers[] = {

u8?

> +       PMBUS_FAN_CONFIG_12,
> +       PMBUS_FAN_CONFIG_12,
> +       PMBUS_FAN_CONFIG_34,
> +       PMBUS_FAN_CONFIG_34
> +};
> +
> +static const int pmbus_fan_command_registers[] = {

u8?

> +       PMBUS_FAN_COMMAND_1,
> +       PMBUS_FAN_COMMAND_2,
> +       PMBUS_FAN_COMMAND_3,
> +       PMBUS_FAN_COMMAND_4,
> +};
> +
>  void pmbus_clear_cache(struct i2c_client *client)
>  {
>         struct pmbus_data *data = i2c_get_clientdata(client);
> @@ -188,6 +210,29 @@ int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_write_word_data);
>
> +int pmbus_update_fan(struct i2c_client *client, int page, int id,
> +                              int config, int mask, int command)
> +{
> +       int from, to;
> +       int rv;
> +
> +       from = pmbus_read_byte_data(client, page,
> +                                   pmbus_fan_config_registers[id]);
> +       if (from < 0)
> +               return from;
> +
> +       to = (from & ~mask) | (config & mask);
> +
> +       rv = pmbus_write_byte_data(client, page,
> +                                  pmbus_fan_config_registers[id], to);

to is a u8. Perhaps define it as such?

> +       if (rv < 0)
> +               return rv;
> +
> +       return pmbus_write_word_data(client, page,
> +                                    pmbus_fan_command_registers[id], command);

Similar with command - it's a u16. This would help the definition of
pmbus_update_fan match the others in the pmbus header, which mostly
deal with explicitly sized types. mask and config could be u8 as well
I think.

> +}
> +EXPORT_SYMBOL_GPL(pmbus_update_fan);
> +
>  /*
>   * _pmbus_write_word_data() is similar to pmbus_write_word_data(), but checks if
>   * a device specific mapping function exists and calls it if necessary.
> @@ -197,15 +242,47 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
>  {
>         struct pmbus_data *data = i2c_get_clientdata(client);
>         const struct pmbus_driver_info *info = data->info;
> -       int status;
> +       int status = -ENODATA;

It looks like you modify this value in all of the code paths (except
the one I suggest you remove below).

>
>         if (info->write_word_data) {
>                 status = info->write_word_data(client, page, reg, word);
>                 if (status != -ENODATA)
>                         return status;
>         }
> -       if (reg >= PMBUS_VIRT_BASE)
> -               return -ENXIO;
> +       if (status == -ENODATA && reg >= PMBUS_VIRT_BASE) {

status will always be -ENODATA if we get down here. I don't think you
need to make this change.

> +               int id, bit;
> +
> +               switch (reg) {
> +               case PMBUS_VIRT_FAN_TARGET_1:
> +               case PMBUS_VIRT_FAN_TARGET_2:
> +               case PMBUS_VIRT_FAN_TARGET_3:
> +               case PMBUS_VIRT_FAN_TARGET_4:

I haven't read the pmbus spec (feel free to point me to a page in the
PDF if you think it will help). Can you educate me why we have 1..4?
for all of these virtual registers? Why not 5, or 3?

> +                       id = reg - PMBUS_VIRT_FAN_TARGET_1;
> +                       bit = pmbus_fan_rpm_mask[id];
> +                       status = pmbus_update_fan(client, page, id, bit, bit,
> +                                               word);
> +                       break;
> +               case PMBUS_VIRT_PWM_1:
> +               case PMBUS_VIRT_PWM_2:
> +               case PMBUS_VIRT_PWM_3:
> +               case PMBUS_VIRT_PWM_4:
> +               {
> +                       long command = word;

long seems a bit... long. And we don't need the sign. Perhaps u32?

> +
> +                       id = reg - PMBUS_VIRT_PWM_1;
> +                       bit = pmbus_fan_rpm_mask[id];
> +                       command *= 100;
> +                       command /= 255;
> +                       status = pmbus_update_fan(client, page, id, 0, bit,
> +                                               command);
> +                       break;
> +               }
> +               default:
> +                       status = -ENXIO;
> +                       break;
> +               }
> +               return status;
> +       }
>         return pmbus_write_word_data(client, page, reg, word);
>  }
>
> @@ -221,6 +298,9 @@ int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_read_word_data);
>
> +static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
> +                                enum pmbus_fan_mode mode);
> +
>  /*
>   * _pmbus_read_word_data() is similar to pmbus_read_word_data(), but checks if
>   * a device specific mapping function exists and calls it if necessary.
> @@ -229,15 +309,49 @@ static int _pmbus_read_word_data(struct i2c_client *client, int page, int reg)
>  {
>         struct pmbus_data *data = i2c_get_clientdata(client);
>         const struct pmbus_driver_info *info = data->info;
> -       int status;
> +       int status = -ENODATA;
>
>         if (info->read_word_data) {
>                 status = info->read_word_data(client, page, reg);
>                 if (status != -ENODATA)
>                         return status;
>         }
> -       if (reg >= PMBUS_VIRT_BASE)
> -               return -ENXIO;
> +       if (status == -ENODATA && reg >= PMBUS_VIRT_BASE) {

Same comments as the write case.

> +               int id;
> +
> +               switch (reg) {
> +               case PMBUS_VIRT_FAN_TARGET_1:
> +               case PMBUS_VIRT_FAN_TARGET_2:
> +               case PMBUS_VIRT_FAN_TARGET_3:
> +               case PMBUS_VIRT_FAN_TARGET_4:
> +                       id = reg - PMBUS_VIRT_FAN_TARGET_1;
> +                       status = pmbus_get_fan_command(client, page, id, rpm);
> +                       break;
> +               case PMBUS_VIRT_PWM_1:
> +               case PMBUS_VIRT_PWM_2:
> +               case PMBUS_VIRT_PWM_3:
> +               case PMBUS_VIRT_PWM_4:
> +               {
> +                       long rv;
> +
> +                       id = reg - PMBUS_VIRT_PWM_1;
> +                       rv = pmbus_get_fan_command(client, page, id, percent);
> +                       if (rv < 0)
> +                               return rv;
> +
> +                       rv *= 255;
> +                       rv /= 100;
> +
> +                       status = rv;
> +                       break;
> +               }
> +               default:
> +                       status = -ENXIO;
> +                       break;
> +               }
> +
> +               return status;
> +       }
>         return pmbus_read_word_data(client, page, reg);
>  }
>
> @@ -304,6 +418,23 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
>         return pmbus_read_byte_data(client, page, reg);
>  }
>
> +static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
> +                                enum pmbus_fan_mode mode)
> +{
> +       int config;
> +
> +       config = _pmbus_read_byte_data(client, page,
> +                                      pmbus_fan_config_registers[id]);
> +       if (config < 0)
> +               return config;
> +
> +       if ((mode == rpm) != (!!(config & pmbus_fan_rpm_mask[id])))

What's (config & mask[id]) testing? Perhaps give it a variable so it's
obvious. Avoids the ((())) too.

This looks like it's testing for an error case. Should you be
returning a negative value instead of zero?

> +               return 0;
> +
> +       return _pmbus_read_word_data(client, page,
> +                                    pmbus_fan_command_registers[id]);
> +}
> +
>  static void pmbus_clear_fault_page(struct i2c_client *client, int page)
>  {
>         _pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> @@ -489,7 +620,7 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>         /* X = 1/m * (Y * 10^-R - b) */
>         R = -R;
>         /* scale result to milli-units for everything but fans */

Does this comment need updating?

> -       if (sensor->class != PSC_FAN) {
> +       if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {
>                 R += 3;
>                 b *= 1000;
>         }
> @@ -539,6 +670,9 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
>  {
>         long val;
>
> +       if (!sensor->convert)
> +               return sensor->data;
> +
>         switch (data->info->format[sensor->class]) {
>         case direct:
>                 val = pmbus_reg2data_direct(data, sensor);
> @@ -642,7 +776,7 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>         }
>
>         /* Calculate Y = (m * X + b) * 10^R */
> -       if (sensor->class != PSC_FAN) {
> +       if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {
>                 R -= 3;         /* Adjust R and b for data in milli-units */
>                 b *= 1000;
>         }
> @@ -673,6 +807,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
>  {
>         u16 regval;
>
> +       if (!sensor->convert)
> +               return val;
> +
>         switch (data->info->format[sensor->class]) {
>         case direct:
>                 regval = pmbus_data2reg_direct(data, sensor, val);
> @@ -895,12 +1032,13 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
>                 return NULL;
>         a = &sensor->attribute;
>
> -       snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
> -                name, seq, type);
> +       snprintf(sensor->name, sizeof(sensor->name), "%s%d%s%s",
> +                name, seq, type ? "_" : "", type ? type : "");

Perhaps something like this would be more readable:

if (type)
       snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s,
                name, seq, type);
else
       snprintf(sensor->name, sizeof(sensor->name), "%s%d,
                name, seq);



>         sensor->page = page;
>         sensor->reg = reg;
>         sensor->class = class;
>         sensor->update = update;
> +       sensor->convert = true;
>         pmbus_dev_attr_init(a, sensor->name,
>                             readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
>                             pmbus_show_sensor, pmbus_set_sensor);
> @@ -1558,13 +1696,6 @@ static const int pmbus_fan_registers[] = {
>         PMBUS_READ_FAN_SPEED_4
>  };
>
> -static const int pmbus_fan_config_registers[] = {
> -       PMBUS_FAN_CONFIG_12,
> -       PMBUS_FAN_CONFIG_12,
> -       PMBUS_FAN_CONFIG_34,
> -       PMBUS_FAN_CONFIG_34
> -};
> -
>  static const int pmbus_fan_status_registers[] = {
>         PMBUS_STATUS_FAN_12,
>         PMBUS_STATUS_FAN_12,
> @@ -1587,6 +1718,47 @@ static const u32 pmbus_fan_status_flags[] = {
>  };
>
>  /* Fans */
> +static int pmbus_add_fan_ctrl(struct i2c_client *client,
> +               struct pmbus_data *data, int index, int page, int id,
> +               u8 config)
> +{
> +       struct pmbus_sensor *sensor;
> +       int rv;
> +
> +       rv = _pmbus_read_word_data(client, page,
> +                                  pmbus_fan_command_registers[id]);
> +       if (rv < 0)
> +               return rv;
> +
> +       sensor = pmbus_add_sensor(data, "fan", "target", index, page,
> +                                 PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
> +                                 true, false);
> +
> +       if (!sensor)
> +               return -ENOMEM;
> +
> +       if (!data->info->m[PSC_PWM])
> +               return 0;
> +
> +       sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
> +                                 PMBUS_VIRT_PWM_1 + id, PSC_PWM,
> +                                 true, false);
> +
> +       if (!sensor)
> +               return -ENOMEM;
> +
> +       sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
> +                                 PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
> +                                 true, false);
> +
> +       if (!sensor)
> +               return -ENOMEM;
> +
> +       sensor->convert = false;
> +
> +       return 0;
> +}
> +
>  static int pmbus_add_fan_attributes(struct i2c_client *client,
>                                     struct pmbus_data *data)
>  {
> @@ -1624,6 +1796,15 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>                                              PSC_FAN, true, true) == NULL)
>                                 return -ENOMEM;
>
> +                       /* Fan control */
> +                       if (pmbus_check_word_register(client, page,
> +                                       pmbus_fan_command_registers[f])) {
> +                               ret = pmbus_add_fan_ctrl(client, data, index,
> +                                                        page, f, regval);
> +                               if (ret < 0)
> +                                       return ret;
> +                       }
> +
>                         /*
>                          * Each fan status register covers multiple fans,
>                          * so we have to do some magic.
> --
> 2.11.0
>
