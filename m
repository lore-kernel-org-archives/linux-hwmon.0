Return-path: <juergh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1480199209-28532-1-git-send-email-linux@roeck-us.net>
References: <1480199209-28532-1-git-send-email-linux@roeck-us.net>
From: Juerg Haefliger <juergh@gmail.com>
Date: Mon, 28 Nov 2016 10:23:06 +0100
Message-ID: <CADLDEKubHgVJo7Or5qpfHUbo_UBMW1BvJmmxUJA_w6APkN8JkA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (dme1737) Convert to use devm_hwmon_device_register_with_groups
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

This is a large patch. Is it possible to break it up into smaller ones
or does it have to be one single patch?


On Sat, Nov 26, 2016 at 11:26 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> Reduce code size and simplify code.
>
> Before:
> text       data     bss     dec     hex filename
> 46341     52528    8064  106933   1a1b5 drivers/hwmon/dme1737.o
>
> After:
> text       data     bss     dec     hex filename
> 39167     35768     384   75319   12637 drivers/hwmon/dme1737.o
>
> A slight behavioral change is that the pwm attributes now always show
> write permissions, but still return -EPERM if an attempt is made to write
> into a pwm attribute but the pwm control is not in manual mode.

Update Documentation/hwmon/dme1737 accordingly?



> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/dme1737.c | 596 ++++++++++++------------------------------------
>  1 file changed, 152 insertions(+), 444 deletions(-)
>
> diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
> index 8763c4a8280c..9f6ef9650eec 100644
> --- a/drivers/hwmon/dme1737.c
> +++ b/drivers/hwmon/dme1737.c
> @@ -211,8 +211,6 @@ static const u8 DME1737_BIT_ALARM_FAN[] = {10, 11, 12, 13, 22, 23};
>
>  struct dme1737_data {
>         struct i2c_client *client;      /* for I2C devices only */
> -       struct device *hwmon_dev;
> -       const char *name;
>         unsigned int addr;              /* for ISA devices only */
>
>         struct mutex update_lock;
> @@ -222,6 +220,8 @@ struct dme1737_data {
>         enum chips type;
>         const int *in_nominal;          /* pointer to IN_NOMINAL array */
>
> +       const struct attribute_group *groups[8];
> +

There only seem to be 7 groups.


>         u8 vid;
>         u8 pwm_rr_en;
>         u32 has_features;
> @@ -1263,7 +1263,6 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
>  }
>
>  static struct attribute *dme1737_pwm_chmod_attr[];

This is not needed anymore.


> -static void dme1737_chmod_file(struct device*, struct attribute*, umode_t);
>
>  static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>                        const char *buf, size_t count)
> @@ -1283,6 +1282,11 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>         mutex_lock(&data->update_lock);
>         switch (fn) {
>         case SYS_PWM:
> +               /* pwm value only writeable in manual mode */
> +               if (PWM_EN_FROM_REG(data->pwm_config[ix]) != 1) {
> +                       count = -EPERM;
> +                       break;
> +               }
>                 data->pwm[ix] = clamp_val(val, 0, 255);
>                 dme1737_write(data, DME1737_REG_PWM(ix), data->pwm[ix]);
>                 break;
> @@ -1329,9 +1333,6 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>                 /* Set the new PWM mode */
>                 switch (val) {
>                 case 0:
> -                       /* Change permissions of pwm[ix] to read-only */
> -                       dme1737_chmod_file(dev, dme1737_pwm_chmod_attr[ix],
> -                                          S_IRUGO);
>                         /* Turn fan fully on */
>                         data->pwm_config[ix] = PWM_EN_TO_REG(0,
>                                                         data->pwm_config[ix]);
> @@ -1344,14 +1345,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>                                                         data->pwm_config[ix]);
>                         dme1737_write(data, DME1737_REG_PWM_CONFIG(ix),
>                                       data->pwm_config[ix]);
> -                       /* Change permissions of pwm[ix] to read-writeable */
> -                       dme1737_chmod_file(dev, dme1737_pwm_chmod_attr[ix],
> -                                          S_IRUGO | S_IWUSR);
>                         break;
>                 case 2:
> -                       /* Change permissions of pwm[ix] to read-only */
> -                       dme1737_chmod_file(dev, dme1737_pwm_chmod_attr[ix],
> -                                          S_IRUGO);
>                         /*
>                          * Turn on auto mode using the saved zone channel
>                          * assignment
> @@ -1471,8 +1466,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>  static ssize_t show_vrm(struct device *dev, struct device_attribute *attr,
>                         char *buf)
>  {
> -       struct i2c_client *client = to_i2c_client(dev);
> -       struct dme1737_data *data = i2c_get_clientdata(client);
> +       struct dme1737_data *data = dev_get_drvdata(dev);
>
>         return sprintf(buf, "%d\n", data->vrm);
>  }
> @@ -1503,14 +1497,6 @@ static ssize_t show_vid(struct device *dev, struct device_attribute *attr,
>         return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
>  }
>
> -static ssize_t show_name(struct device *dev, struct device_attribute *attr,
> -                        char *buf)
> -{
> -       struct dme1737_data *data = dev_get_drvdata(dev);
> -
> -       return sprintf(buf, "%s\n", data->name);
> -}
> -

Where did this go? Is this handled by the subsystem now or did we get
rid of the 'name' attribute altogether?


>  /* ---------------------------------------------------------------------
>   * Sysfs device attribute defines and structs
>   * --------------------------------------------------------------------- */
> @@ -1609,7 +1595,7 @@ SENSOR_DEVICE_ATTR_FAN_5TO6(6);
>  /* PWMs 1-3 */
>
>  #define SENSOR_DEVICE_ATTR_PWM_1TO3(ix) \
> -static SENSOR_DEVICE_ATTR_2(pwm##ix, S_IRUGO, \
> +static SENSOR_DEVICE_ATTR_2(pwm##ix, S_IRUGO | S_IWUSR, \
>         show_pwm, set_pwm, SYS_PWM, ix-1); \
>  static SENSOR_DEVICE_ATTR_2(pwm##ix##_freq, S_IRUGO, \
>         show_pwm, set_pwm, SYS_PWM_FREQ, ix-1); \
> @@ -1647,7 +1633,6 @@ SENSOR_DEVICE_ATTR_PWM_5TO6(6);
>
>  static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);
>  static DEVICE_ATTR(cpu0_vid, S_IRUGO, show_vid, NULL);
> -static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);   /* for ISA devices */
>
>  /*
>   * This struct holds all the attributes that are always present and need to be

The comment is no longer correct.


> @@ -1701,15 +1686,6 @@ static struct attribute *dme1737_attr[] = {
>         &sensor_dev_attr_temp3_max.dev_attr.attr,
>         &sensor_dev_attr_temp3_alarm.dev_attr.attr,
>         &sensor_dev_attr_temp3_fault.dev_attr.attr,
> -       /* Zones */
> -       &sensor_dev_attr_zone1_auto_point1_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone1_auto_point2_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone1_auto_point3_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone1_auto_channels_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_point1_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_point2_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_point3_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_channels_temp.dev_attr.attr,
>         NULL
>  };
>
> @@ -1717,6 +1693,19 @@ static const struct attribute_group dme1737_group = {
>         .attrs = dme1737_attr,
>  };
>
> +static umode_t dme1737_temp_offset_visible(struct kobject *kobj,
> +                                          struct attribute *attr, int index)
> +{
> +       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct dme1737_data *data = dev_get_drvdata(dev);
> +
> +       /* Temperature offsets are writable unless chip is locked */
> +       if (!(data->config & 0x02))
> +               return attr->mode | S_IWUSR;
> +
> +       return attr->mode;
> +}
> +

Rather than creating multiple groups and associated <group>_visible()
functions, wouldn't it be easier to just have a single group with a
smart is_visible attribute?



>  /*
>   * The following struct holds temp offset attributes, which are not available
>   * in all chips. The following chips support them:
> @@ -1731,6 +1720,7 @@ static struct attribute *dme1737_temp_offset_attr[] = {
>
>  static const struct attribute_group dme1737_temp_offset_group = {
>         .attrs = dme1737_temp_offset_attr,
> +       .is_visible = dme1737_temp_offset_visible,
>  };
>
>  /*
> @@ -1748,38 +1738,56 @@ static const struct attribute_group dme1737_vid_group = {
>         .attrs = dme1737_vid_attr,
>  };
>
> -/*
> - * The following struct holds temp zone 3 related attributes, which are not
> - * available in all chips. The following chips support them:
> - * DME1737, SCH311x, SCH5027
> - */
> -static struct attribute *dme1737_zone3_attr[] = {
> -       &sensor_dev_attr_zone3_auto_point1_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone3_auto_point2_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone3_auto_point3_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone3_auto_channels_temp.dev_attr.attr,
> -       NULL
> -};
> +static umode_t dme1737_zone_visible(struct kobject *kobj,
> +                                   struct attribute *attr, int index)
> +{
> +       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct dme1737_data *data = dev_get_drvdata(dev);
> +       int nr = index / 5;
> +       int idx =  index % 5;

A comment about where the number 5 is coming from would help.


> -static const struct attribute_group dme1737_zone3_group = {
> -       .attrs = dme1737_zone3_attr,
> -};
> +       /*
> +        * Zone 3 related attributes are not available in all chips.
> +        * The following chips support them: DME1737, SCH311x, SCH5027
> +        */
> +       if (nr == 3 && !(data->has_features & HAS_ZONE3))
> +               return 0;
> +       /*
> +        * Temp zone hysteresis attributes are not available in all chips.
> +        * The following chips support them: DME1737, SCH311x
> +        */
> +       if (idx == 4 && !(data->has_features & HAS_ZONE_HYST))
> +               return 0;
>
> +       /* Temperature auto points are writable unless chip is locked */
> +       if (idx != 3 && !(data->config & 0x02))
> +               return attr->mode | S_IWUSR;
>
> -/*
> - * The following struct holds temp zone hysteresis related attributes, which
> - * are not available in all chips. The following chips support them:
> - * DME1737, SCH311x
> - */
> -static struct attribute *dme1737_zone_hyst_attr[] = {
> +       return attr->mode;
> +}
> +
> +static struct attribute *dme1737_zone_attr[] = {
> +       &sensor_dev_attr_zone1_auto_point1_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone1_auto_point2_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone1_auto_point3_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone1_auto_channels_temp.dev_attr.attr,
>         &sensor_dev_attr_zone1_auto_point1_temp_hyst.dev_attr.attr,
> +       &sensor_dev_attr_zone2_auto_point1_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone2_auto_point2_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone2_auto_point3_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone2_auto_channels_temp.dev_attr.attr,
>         &sensor_dev_attr_zone2_auto_point1_temp_hyst.dev_attr.attr,
> +       &sensor_dev_attr_zone3_auto_point1_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone3_auto_point2_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone3_auto_point3_temp.dev_attr.attr,
> +       &sensor_dev_attr_zone3_auto_channels_temp.dev_attr.attr,
>         &sensor_dev_attr_zone3_auto_point1_temp_hyst.dev_attr.attr,
>         NULL
>  };
>
> -static const struct attribute_group dme1737_zone_hyst_group = {
> -       .attrs = dme1737_zone_hyst_attr,
> +static const struct attribute_group dme1737_zone_group = {
> +       .attrs = dme1737_zone_attr,
> +       .is_visible = dme1737_zone_visible,
>  };
>
>  /*
> @@ -1799,12 +1807,49 @@ static const struct attribute_group dme1737_in7_group = {
>         .attrs = dme1737_in7_attr,
>  };
>
> +static umode_t dme1737_pwm_visible(struct kobject *kobj, struct attribute *a,
> +                                  int index)
> +{
> +       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct dme1737_data *data = dev_get_drvdata(dev);
> +       struct device_attribute *da =
> +                               container_of(a, struct device_attribute, attr);
> +       struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);

In other parts of the code the variable attr is a struct
device_attribute. Name the variables in the <group>_visible functions
more consistent with the rest of the code?


> +
> +       if (!(data->has_features & HAS_PWM(ix)))
> +               return 0;
> +
> +       switch (fn) {
> +       case SYS_PWM:
> +       case SYS_PWM_AUTO_POINT2_PWM:
> +               return a->mode;

Make this the default case?


> +       case SYS_PWM_FREQ:
> +       case SYS_PWM_ENABLE:
> +       case SYS_PWM_RAMP_RATE:
> +       case SYS_PWM_AUTO_CHANNELS_ZONE:
> +       case SYS_PWM_AUTO_POINT1_PWM:
> +               if (!(data->config & 0x02))

Would be good to add a comment what this means (device locked). On a
different note, the config register is evaluated in quite a few
different spots now, so maybe it's time to introduce defines for the
flags to make it more readable?


> +                       return a->mode | S_IWUSR;
> +               return a->mode;
> +       case SYS_PWM_AUTO_PWM_MIN:
> +               if (!(data->has_features & HAS_PWM_MIN))
> +                       return 0;
> +               if (!(data->config & 0x02))
> +                       return a->mode | S_IWUSR;
> +               return a->mode;
> +       default:
> +               return 0;
> +       }
> +}
> +
>  /*
>   * The following structs hold the PWM attributes, some of which are optional.
>   * Their creation depends on the chip configuration which is determined during
>   * module load.
>   */
> -static struct attribute *dme1737_pwm1_attr[] = {
> +static struct attribute *dme1737_pwm_attr[] = {
>         &sensor_dev_attr_pwm1.dev_attr.attr,
>         &sensor_dev_attr_pwm1_freq.dev_attr.attr,
>         &sensor_dev_attr_pwm1_enable.dev_attr.attr,
> @@ -1812,9 +1857,7 @@ static struct attribute *dme1737_pwm1_attr[] = {
>         &sensor_dev_attr_pwm1_auto_channels_zone.dev_attr.attr,
>         &sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>         &sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm2_attr[] = {
> +       &sensor_dev_attr_pwm1_auto_pwm_min.dev_attr.attr,
>         &sensor_dev_attr_pwm2.dev_attr.attr,
>         &sensor_dev_attr_pwm2_freq.dev_attr.attr,
>         &sensor_dev_attr_pwm2_enable.dev_attr.attr,
> @@ -1822,9 +1865,7 @@ static struct attribute *dme1737_pwm2_attr[] = {
>         &sensor_dev_attr_pwm2_auto_channels_zone.dev_attr.attr,
>         &sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>         &sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm3_attr[] = {
> +       &sensor_dev_attr_pwm2_auto_pwm_min.dev_attr.attr,
>         &sensor_dev_attr_pwm3.dev_attr.attr,
>         &sensor_dev_attr_pwm3_freq.dev_attr.attr,
>         &sensor_dev_attr_pwm3_enable.dev_attr.attr,
> @@ -1832,82 +1873,58 @@ static struct attribute *dme1737_pwm3_attr[] = {
>         &sensor_dev_attr_pwm3_auto_channels_zone.dev_attr.attr,
>         &sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
>         &sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm5_attr[] = {
> +       &sensor_dev_attr_pwm3_auto_pwm_min.dev_attr.attr,
>         &sensor_dev_attr_pwm5.dev_attr.attr,
>         &sensor_dev_attr_pwm5_freq.dev_attr.attr,
>         &sensor_dev_attr_pwm5_enable.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm6_attr[] = {
>         &sensor_dev_attr_pwm6.dev_attr.attr,
>         &sensor_dev_attr_pwm6_freq.dev_attr.attr,
>         &sensor_dev_attr_pwm6_enable.dev_attr.attr,
>         NULL
>  };
>
> -static const struct attribute_group dme1737_pwm_group[] = {
> -       { .attrs = dme1737_pwm1_attr },
> -       { .attrs = dme1737_pwm2_attr },
> -       { .attrs = dme1737_pwm3_attr },
> -       { .attrs = NULL },
> -       { .attrs = dme1737_pwm5_attr },
> -       { .attrs = dme1737_pwm6_attr },
> +static const struct attribute_group dme1737_pwm_group = {
> +       .attrs = dme1737_pwm_attr,
> +       .is_visible = dme1737_pwm_visible,
>  };
>
> -/*
> - * The following struct holds auto PWM min attributes, which are not available
> - * in all chips. Their creation depends on the chip type which is determined
> - * during module load.
> - */
> -static struct attribute *dme1737_auto_pwm_min_attr[] = {
> -       &sensor_dev_attr_pwm1_auto_pwm_min.dev_attr.attr,
> -       &sensor_dev_attr_pwm2_auto_pwm_min.dev_attr.attr,
> -       &sensor_dev_attr_pwm3_auto_pwm_min.dev_attr.attr,
> -};
> +static umode_t dme1737_fan_visible(struct kobject *kobj, struct attribute *a,
> +                                  int index)
> +{
> +       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct dme1737_data *data = dev_get_drvdata(dev);
> +       struct device_attribute *da =
> +                               container_of(a, struct device_attribute, attr);
> +       struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +       int ix = attr->index;
>
> -/*
> - * The following structs hold the fan attributes, some of which are optional.
> - * Their creation depends on the chip configuration which is determined during
> - * module load.
> - */
> -static struct attribute *dme1737_fan1_attr[] = {
> +       if (!(data->has_features & HAS_FAN(ix)))
> +               return 0;
> +
> +       return a->mode;
> +}
> +
> +static struct attribute *dme1737_fan_attr[] = {
>         &sensor_dev_attr_fan1_input.dev_attr.attr,
>         &sensor_dev_attr_fan1_min.dev_attr.attr,
>         &sensor_dev_attr_fan1_alarm.dev_attr.attr,
>         &sensor_dev_attr_fan1_type.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_fan2_attr[] = {
>         &sensor_dev_attr_fan2_input.dev_attr.attr,
>         &sensor_dev_attr_fan2_min.dev_attr.attr,
>         &sensor_dev_attr_fan2_alarm.dev_attr.attr,
>         &sensor_dev_attr_fan2_type.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_fan3_attr[] = {
>         &sensor_dev_attr_fan3_input.dev_attr.attr,
>         &sensor_dev_attr_fan3_min.dev_attr.attr,
>         &sensor_dev_attr_fan3_alarm.dev_attr.attr,
>         &sensor_dev_attr_fan3_type.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_fan4_attr[] = {
>         &sensor_dev_attr_fan4_input.dev_attr.attr,
>         &sensor_dev_attr_fan4_min.dev_attr.attr,
>         &sensor_dev_attr_fan4_alarm.dev_attr.attr,
>         &sensor_dev_attr_fan4_type.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_fan5_attr[] = {
>         &sensor_dev_attr_fan5_input.dev_attr.attr,
>         &sensor_dev_attr_fan5_min.dev_attr.attr,
>         &sensor_dev_attr_fan5_alarm.dev_attr.attr,
>         &sensor_dev_attr_fan5_max.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_fan6_attr[] = {
>         &sensor_dev_attr_fan6_input.dev_attr.attr,
>         &sensor_dev_attr_fan6_min.dev_attr.attr,
>         &sensor_dev_attr_fan6_alarm.dev_attr.attr,
> @@ -1915,106 +1932,9 @@ static struct attribute *dme1737_fan6_attr[] = {
>         NULL
>  };
>
> -static const struct attribute_group dme1737_fan_group[] = {
> -       { .attrs = dme1737_fan1_attr },
> -       { .attrs = dme1737_fan2_attr },
> -       { .attrs = dme1737_fan3_attr },
> -       { .attrs = dme1737_fan4_attr },
> -       { .attrs = dme1737_fan5_attr },
> -       { .attrs = dme1737_fan6_attr },
> -};
> -
> -/*
> - * The permissions of the following zone attributes are changed to read-
> - * writeable if the chip is *not* locked. Otherwise they stay read-only.
> - */
> -static struct attribute *dme1737_zone_chmod_attr[] = {
> -       &sensor_dev_attr_zone1_auto_point1_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone1_auto_point2_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone1_auto_point3_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_point1_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_point2_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone2_auto_point3_temp.dev_attr.attr,
> -       NULL
> -};
> -
> -static const struct attribute_group dme1737_zone_chmod_group = {
> -       .attrs = dme1737_zone_chmod_attr,
> -};
> -
> -
> -/*
> - * The permissions of the following zone 3 attributes are changed to read-
> - * writeable if the chip is *not* locked. Otherwise they stay read-only.
> - */
> -static struct attribute *dme1737_zone3_chmod_attr[] = {
> -       &sensor_dev_attr_zone3_auto_point1_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone3_auto_point2_temp.dev_attr.attr,
> -       &sensor_dev_attr_zone3_auto_point3_temp.dev_attr.attr,
> -       NULL
> -};
> -
> -static const struct attribute_group dme1737_zone3_chmod_group = {
> -       .attrs = dme1737_zone3_chmod_attr,
> -};
> -
> -/*
> - * The permissions of the following PWM attributes are changed to read-
> - * writeable if the chip is *not* locked and the respective PWM is available.
> - * Otherwise they stay read-only.
> - */
> -static struct attribute *dme1737_pwm1_chmod_attr[] = {
> -       &sensor_dev_attr_pwm1_freq.dev_attr.attr,
> -       &sensor_dev_attr_pwm1_enable.dev_attr.attr,
> -       &sensor_dev_attr_pwm1_ramp_rate.dev_attr.attr,
> -       &sensor_dev_attr_pwm1_auto_channels_zone.dev_attr.attr,
> -       &sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm2_chmod_attr[] = {
> -       &sensor_dev_attr_pwm2_freq.dev_attr.attr,
> -       &sensor_dev_attr_pwm2_enable.dev_attr.attr,
> -       &sensor_dev_attr_pwm2_ramp_rate.dev_attr.attr,
> -       &sensor_dev_attr_pwm2_auto_channels_zone.dev_attr.attr,
> -       &sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm3_chmod_attr[] = {
> -       &sensor_dev_attr_pwm3_freq.dev_attr.attr,
> -       &sensor_dev_attr_pwm3_enable.dev_attr.attr,
> -       &sensor_dev_attr_pwm3_ramp_rate.dev_attr.attr,
> -       &sensor_dev_attr_pwm3_auto_channels_zone.dev_attr.attr,
> -       &sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm5_chmod_attr[] = {
> -       &sensor_dev_attr_pwm5.dev_attr.attr,
> -       &sensor_dev_attr_pwm5_freq.dev_attr.attr,
> -       NULL
> -};
> -static struct attribute *dme1737_pwm6_chmod_attr[] = {
> -       &sensor_dev_attr_pwm6.dev_attr.attr,
> -       &sensor_dev_attr_pwm6_freq.dev_attr.attr,
> -       NULL
> -};
> -
> -static const struct attribute_group dme1737_pwm_chmod_group[] = {
> -       { .attrs = dme1737_pwm1_chmod_attr },
> -       { .attrs = dme1737_pwm2_chmod_attr },
> -       { .attrs = dme1737_pwm3_chmod_attr },
> -       { .attrs = NULL },
> -       { .attrs = dme1737_pwm5_chmod_attr },
> -       { .attrs = dme1737_pwm6_chmod_attr },
> -};
> -
> -/*
> - * Pwm[1-3] are read-writeable if the associated pwm is in manual mode and the
> - * chip is not locked. Otherwise they are read-only.
> - */
> -static struct attribute *dme1737_pwm_chmod_attr[] = {
> -       &sensor_dev_attr_pwm1.dev_attr.attr,
> -       &sensor_dev_attr_pwm2.dev_attr.attr,
> -       &sensor_dev_attr_pwm3.dev_attr.attr,
> +static const struct attribute_group dme1737_fan_group = {
> +       .attrs = dme1737_fan_attr,
> +       .is_visible = dme1737_fan_visible,
>  };
>
>  /* ---------------------------------------------------------------------
> @@ -2049,193 +1969,29 @@ static inline void dme1737_sio_outb(int sio_cip, int reg, int val)
>
>  static int dme1737_i2c_get_features(int, struct dme1737_data*);
>
> -static void dme1737_chmod_file(struct device *dev,
> -                              struct attribute *attr, umode_t mode)
> -{
> -       if (sysfs_chmod_file(&dev->kobj, attr, mode)) {
> -               dev_warn(dev, "Failed to change permissions of %s.\n",
> -                        attr->name);
> -       }
> -}
> -
> -static void dme1737_chmod_group(struct device *dev,
> -                               const struct attribute_group *group,
> -                               umode_t mode)
> -{
> -       struct attribute **attr;
> -
> -       for (attr = group->attrs; *attr; attr++)
> -               dme1737_chmod_file(dev, *attr, mode);
> -}
> -
> -static void dme1737_remove_files(struct device *dev)
> +static void dme1737_setup_groups(struct device *dev)
>  {
>         struct dme1737_data *data = dev_get_drvdata(dev);
> -       int ix;
> +       int groups = 0;
>
> -       for (ix = 0; ix < ARRAY_SIZE(dme1737_fan_group); ix++) {
> -               if (data->has_features & HAS_FAN(ix)) {
> -                       sysfs_remove_group(&dev->kobj,
> -                                          &dme1737_fan_group[ix]);
> -               }
> -       }
> -
> -       for (ix = 0; ix < ARRAY_SIZE(dme1737_pwm_group); ix++) {
> -               if (data->has_features & HAS_PWM(ix)) {
> -                       sysfs_remove_group(&dev->kobj,
> -                                          &dme1737_pwm_group[ix]);
> -                       if ((data->has_features & HAS_PWM_MIN) && ix < 3) {
> -                               sysfs_remove_file(&dev->kobj,
> -                                               dme1737_auto_pwm_min_attr[ix]);
> -                       }
> -               }
> -       }
> +       data->groups[groups++] = &dme1737_group;
> +       data->groups[groups++] = &dme1737_zone_group;
>
>         if (data->has_features & HAS_TEMP_OFFSET)
> -               sysfs_remove_group(&dev->kobj, &dme1737_temp_offset_group);
> -       if (data->has_features & HAS_VID)
> -               sysfs_remove_group(&dev->kobj, &dme1737_vid_group);
> -       if (data->has_features & HAS_ZONE3)
> -               sysfs_remove_group(&dev->kobj, &dme1737_zone3_group);
> -       if (data->has_features & HAS_ZONE_HYST)
> -               sysfs_remove_group(&dev->kobj, &dme1737_zone_hyst_group);
> -       if (data->has_features & HAS_IN7)
> -               sysfs_remove_group(&dev->kobj, &dme1737_in7_group);
> -       sysfs_remove_group(&dev->kobj, &dme1737_group);
> -
> -       if (!data->client)
> -               sysfs_remove_file(&dev->kobj, &dev_attr_name.attr);
> -}
> -
> -static int dme1737_create_files(struct device *dev)
> -{
> -       struct dme1737_data *data = dev_get_drvdata(dev);
> -       int err, ix;
> +               data->groups[groups++] = &dme1737_temp_offset_group;
>
> -       /* Create a name attribute for ISA devices */
> -       if (!data->client) {
> -               err = sysfs_create_file(&dev->kobj, &dev_attr_name.attr);
> -               if (err)
> -                       goto exit;
> -       }
> -
> -       /* Create standard sysfs attributes */
> -       err = sysfs_create_group(&dev->kobj, &dme1737_group);
> -       if (err)
> -               goto exit_remove;
> -
> -       /* Create chip-dependent sysfs attributes */
> -       if (data->has_features & HAS_TEMP_OFFSET) {
> -               err = sysfs_create_group(&dev->kobj,
> -                                        &dme1737_temp_offset_group);
> -               if (err)
> -                       goto exit_remove;
> -       }
> -       if (data->has_features & HAS_VID) {
> -               err = sysfs_create_group(&dev->kobj, &dme1737_vid_group);
> -               if (err)
> -                       goto exit_remove;
> -       }
> -       if (data->has_features & HAS_ZONE3) {
> -               err = sysfs_create_group(&dev->kobj, &dme1737_zone3_group);
> -               if (err)
> -                       goto exit_remove;
> -       }
> -       if (data->has_features & HAS_ZONE_HYST) {
> -               err = sysfs_create_group(&dev->kobj, &dme1737_zone_hyst_group);
> -               if (err)
> -                       goto exit_remove;
> -       }
> -       if (data->has_features & HAS_IN7) {
> -               err = sysfs_create_group(&dev->kobj, &dme1737_in7_group);
> -               if (err)
> -                       goto exit_remove;
> -       }
> +       if (data->has_features & HAS_VID)
> +               data->groups[groups++] = &dme1737_vid_group;
>
> -       /* Create fan sysfs attributes */
> -       for (ix = 0; ix < ARRAY_SIZE(dme1737_fan_group); ix++) {
> -               if (data->has_features & HAS_FAN(ix)) {
> -                       err = sysfs_create_group(&dev->kobj,
> -                                                &dme1737_fan_group[ix]);
> -                       if (err)
> -                               goto exit_remove;
> -               }
> -       }
> +       if (data->has_features & HAS_IN7)
> +               data->groups[groups++] = &dme1737_in7_group;
>
> -       /* Create PWM sysfs attributes */
> -       for (ix = 0; ix < ARRAY_SIZE(dme1737_pwm_group); ix++) {
> -               if (data->has_features & HAS_PWM(ix)) {
> -                       err = sysfs_create_group(&dev->kobj,
> -                                                &dme1737_pwm_group[ix]);
> -                       if (err)
> -                               goto exit_remove;
> -                       if ((data->has_features & HAS_PWM_MIN) && (ix < 3)) {
> -                               err = sysfs_create_file(&dev->kobj,
> -                                               dme1737_auto_pwm_min_attr[ix]);
> -                               if (err)
> -                                       goto exit_remove;
> -                       }
> -               }
> -       }
> +       data->groups[groups++] = &dme1737_fan_group;
> +       data->groups[groups++] = &dme1737_pwm_group;
>
> -       /*
> -        * Inform if the device is locked. Otherwise change the permissions of
> -        * selected attributes from read-only to read-writeable.
> -        */
> -       if (data->config & 0x02) {
> +       if (data->config & 0x02)
>                 dev_info(dev,
>                          "Device is locked. Some attributes will be read-only.\n");

Move this to dme1737_init_device where other info about config
settings are printed.


> -       } else {
> -               /* Change permissions of zone sysfs attributes */
> -               dme1737_chmod_group(dev, &dme1737_zone_chmod_group,
> -                                   S_IRUGO | S_IWUSR);
> -
> -               /* Change permissions of chip-dependent sysfs attributes */
> -               if (data->has_features & HAS_TEMP_OFFSET) {
> -                       dme1737_chmod_group(dev, &dme1737_temp_offset_group,
> -                                           S_IRUGO | S_IWUSR);
> -               }
> -               if (data->has_features & HAS_ZONE3) {
> -                       dme1737_chmod_group(dev, &dme1737_zone3_chmod_group,
> -                                           S_IRUGO | S_IWUSR);
> -               }
> -               if (data->has_features & HAS_ZONE_HYST) {
> -                       dme1737_chmod_group(dev, &dme1737_zone_hyst_group,
> -                                           S_IRUGO | S_IWUSR);
> -               }
> -
> -               /* Change permissions of PWM sysfs attributes */
> -               for (ix = 0; ix < ARRAY_SIZE(dme1737_pwm_chmod_group); ix++) {
> -                       if (data->has_features & HAS_PWM(ix)) {
> -                               dme1737_chmod_group(dev,
> -                                               &dme1737_pwm_chmod_group[ix],
> -                                               S_IRUGO | S_IWUSR);
> -                               if ((data->has_features & HAS_PWM_MIN) &&
> -                                   ix < 3) {
> -                                       dme1737_chmod_file(dev,
> -                                               dme1737_auto_pwm_min_attr[ix],
> -                                               S_IRUGO | S_IWUSR);
> -                               }
> -                       }
> -               }
> -
> -               /* Change permissions of pwm[1-3] if in manual mode */
> -               for (ix = 0; ix < 3; ix++) {
> -                       if ((data->has_features & HAS_PWM(ix)) &&
> -                           (PWM_EN_FROM_REG(data->pwm_config[ix]) == 1)) {
> -                               dme1737_chmod_file(dev,
> -                                               dme1737_pwm_chmod_attr[ix],
> -                                               S_IRUGO | S_IWUSR);
> -                       }
> -               }
> -       }
> -
> -       return 0;
> -
> -exit_remove:
> -       dme1737_remove_files(dev);
> -exit:
> -       return err;
>  }
>
>  static int dme1737_init_device(struct device *dev)
> @@ -2475,6 +2231,7 @@ static int dme1737_i2c_probe(struct i2c_client *client,
>  {
>         struct dme1737_data *data;
>         struct device *dev = &client->dev;
> +       struct device *hwmon_dev;
>         int err;
>
>         data = devm_kzalloc(dev, sizeof(struct dme1737_data), GFP_KERNEL);
> @@ -2484,7 +2241,6 @@ static int dme1737_i2c_probe(struct i2c_client *client,
>         i2c_set_clientdata(client, data);
>         data->type = id->driver_data;
>         data->client = client;
> -       data->name = client->name;
>         mutex_init(&data->update_lock);
>
>         /* Initialize the DME1737 chip */
> @@ -2494,36 +2250,12 @@ static int dme1737_i2c_probe(struct i2c_client *client,
>                 return err;
>         }
>
> -       /* Create sysfs files */
> -       err = dme1737_create_files(dev);
> -       if (err) {
> -               dev_err(dev, "Failed to create sysfs files.\n");
> -               return err;
> -       }
> +       dme1737_setup_groups(dev);
>
>         /* Register device */
> -       data->hwmon_dev = hwmon_device_register(dev);
> -       if (IS_ERR(data->hwmon_dev)) {
> -               dev_err(dev, "Failed to register device.\n");
> -               err = PTR_ERR(data->hwmon_dev);
> -               goto exit_remove;
> -       }
> -
> -       return 0;
> -
> -exit_remove:
> -       dme1737_remove_files(dev);
> -       return err;
> -}
> -
> -static int dme1737_i2c_remove(struct i2c_client *client)
> -{
> -       struct dme1737_data *data = i2c_get_clientdata(client);
> -
> -       hwmon_device_unregister(data->hwmon_dev);
> -       dme1737_remove_files(&client->dev);
> -
> -       return 0;
> +       hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
> +                                                          data, data->groups);
> +       return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>
>  static const struct i2c_device_id dme1737_id[] = {
> @@ -2539,7 +2271,6 @@ static struct i2c_driver dme1737_i2c_driver = {
>                 .name = "dme1737",
>         },
>         .probe = dme1737_i2c_probe,
> -       .remove = dme1737_i2c_remove,

All cleanup done automatically?


>         .id_table = dme1737_id,
>         .detect = dme1737_i2c_detect,
>         .address_list = normal_i2c,
> @@ -2638,6 +2369,8 @@ static int dme1737_isa_probe(struct platform_device *pdev)
>         struct resource *res;
>         struct dme1737_data *data;
>         struct device *dev = &pdev->dev;
> +       struct device *hwmon_dev;
> +       const char *name;
>         int err;
>
>         res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> @@ -2681,9 +2414,9 @@ static int dme1737_isa_probe(struct platform_device *pdev)
>         }
>
>         if (data->type == sch5127)
> -               data->name = "sch5127";
> +               name = "sch5127";
>         else
> -               data->name = "sch311x";
> +               name = "sch311x";
>
>         /* Initialize the mutex */
>         mutex_init(&data->update_lock);
> @@ -2698,36 +2431,12 @@ static int dme1737_isa_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> -       /* Create sysfs files */
> -       err = dme1737_create_files(dev);
> -       if (err) {
> -               dev_err(dev, "Failed to create sysfs files.\n");
> -               return err;
> -       }
> +       dme1737_setup_groups(dev);
>
>         /* Register device */
> -       data->hwmon_dev = hwmon_device_register(dev);
> -       if (IS_ERR(data->hwmon_dev)) {
> -               dev_err(dev, "Failed to register device.\n");
> -               err = PTR_ERR(data->hwmon_dev);
> -               goto exit_remove_files;
> -       }
> -
> -       return 0;
> -
> -exit_remove_files:
> -       dme1737_remove_files(dev);
> -       return err;
> -}
> -
> -static int dme1737_isa_remove(struct platform_device *pdev)
> -{
> -       struct dme1737_data *data = platform_get_drvdata(pdev);
> -
> -       hwmon_device_unregister(data->hwmon_dev);
> -       dme1737_remove_files(&pdev->dev);
> -
> -       return 0;
> +       hwmon_dev = hwmon_device_register_with_groups(dev, name, data,
> +                                                     data->groups);

Nit, you could drop the variable 'name' with:
       hwmon_dev = hwmon_device_register_with_groups(dev, data->type
== sch5127 ? 'SCH5127' : 'SCH311X', data,
                                                     data->groups);

> +       return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>
>  static struct platform_driver dme1737_isa_driver = {
> @@ -2735,7 +2444,6 @@ static struct platform_driver dme1737_isa_driver = {
>                 .name = "dme1737",
>         },
>         .probe = dme1737_isa_probe,
> -       .remove = dme1737_isa_remove,

Same here, all done automatically?


>  };
>
>  /* ---------------------------------------------------------------------
> --
> 2.5.0
>

Thanks for the patch! This is significant, so you should add yourself
as an author/maintainer :-)

...Juerg


-- 
Juerg Haefliger
Hewlett Packard Enterprise
