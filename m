Return-path: <raltherr@google.com>
MIME-Version: 1.0
In-Reply-To: <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net>
References: <20170228201404.32125-1-raltherr@google.com> <20170228201404.32125-2-raltherr@google.com>
 <CACPK8XfOZiNdrQJaDZcSZkJ4gSZZpGy-r9RQAeykeyUS0yzXMA@mail.gmail.com> <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 1 Mar 2017 11:11:54 -0800
Message-ID: <CAPLgG==TYx=+FkpspsPFs8yfaUQRCGzZbooC4pr+wr50yrkgtw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Aspeed AST2400/AST2500 ADC
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Type: multipart/alternative; boundary=94eb2c05a380f744660549b01511
List-ID: <linux-hwmon@vger.kernel.org>

--94eb2c05a380f744660549b01511
Content-Type: text/plain; charset=UTF-8

On Feb 28, 2017 7:45 PM, "Guenter Roeck" <linux@roeck-us.net> wrote:

On 02/28/2017 04:49 PM, Joel Stanley wrote:

> On Wed, Mar 1, 2017 at 6:44 AM, Rick Altherr <raltherr@google.com> wrote:
>
>> Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This
>> driver implements reading the ADC values, enabling channels via device
>> tree, and optionally providing channel labels via device tree.  Low and
>> high threshold interrupts are supported by the hardware but not
>> implemented.
>>
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>>
>
> Looks good. Some minor comments below.
>
> Is there a reason you wrote a hwmon driver instead of an iio driver? I
> wasn't sure what the recommended subsystem is.
>

Excellent point. Question is really if there is a plan to add support for
thresholds. If not, an iio driver might be more appropriate.

Guenter


The hardware supports firing interrupts on high and low thresholds. I'm not
planning to use that feature yet so I didn't implement it. Would you prefer
that I leave it as is (maybe with a TODO), implement the thresholding, or
change to iio?

Rick




> ---
>>  drivers/hwmon/Kconfig      |  10 ++
>>  drivers/hwmon/Makefile     |   1 +
>>  drivers/hwmon/aspeed_adc.c | 383 ++++++++++++++++++++++++++++++
>> +++++++++++++++
>>  3 files changed, 394 insertions(+)
>>  create mode 100644 drivers/hwmon/aspeed_adc.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 0649d53f3d16..c99a67b4afe4 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -261,6 +261,16 @@ config SENSORS_ASC7621
>>           This driver can also be built as a module.  If so, the module
>>           will be called asc7621.
>>
>> +config SENSORS_ASPEED_ADC
>> +       tristate "Aspeed AST2400/AST2500 ADC"
>> +       depends on ARCH_ASPEED
>>
>
> depends on ARCH_ASPEED || COMPILE_TEST.
>
> +       help
>> +         If you say yes here you get support for the Aspeed
>> AST2400/AST2500
>> +         ADC.
>> +
>> +         This driver can also be built as a module.  If so, the module
>> +         will be called aspeed_adc.
>> +
>>  config SENSORS_K8TEMP
>>         tristate "AMD Athlon64/FX or Opteron temperature sensor"
>>         depends on X86 && PCI
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index 5509edf6186a..eede049c9d0d 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475) += adt7475.o
>>  obj-$(CONFIG_SENSORS_APPLESMC) += applesmc.o
>>  obj-$(CONFIG_SENSORS_ARM_SCPI) += scpi-hwmon.o
>>  obj-$(CONFIG_SENSORS_ASC7621)  += asc7621.o
>> +obj-$(CONFIG_SENSORS_ASPEED_ADC) += aspeed_adc.o
>>  obj-$(CONFIG_SENSORS_ATXP1)    += atxp1.o
>>  obj-$(CONFIG_SENSORS_CORETEMP) += coretemp.o
>>  obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
>> diff --git a/drivers/hwmon/aspeed_adc.c b/drivers/hwmon/aspeed_adc.c
>> new file mode 100644
>> index 000000000000..098e32315264
>> --- /dev/null
>> +++ b/drivers/hwmon/aspeed_adc.c
>> @@ -0,0 +1,383 @@
>> +/*
>> + * Aspeed AST2400/2500 ADC
>> + *
>> + * Copyright (C) 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#include <asm/io.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +
>> +#define ASPEED_ADC_NUM_CHANNELS        16
>> +#define ASPEED_ADC_REF_VOLTAGE 2500 /* millivolts */
>> +
>> +#define ASPEED_ADC_REG_ADC00 0x00
>> +#define ASPEED_ADC_REG_ADC04 0x04
>> +#define ASPEED_ADC_REG_ADC08 0x08
>> +#define ASPEED_ADC_REG_ADC0C 0x0C
>> +#define ASPEED_ADC_REG_ADC10 0x10
>> +#define ASPEED_ADC_REG_ADC14 0x14
>> +#define ASPEED_ADC_REG_ADC18 0x18
>> +#define ASPEED_ADC_REG_ADC1C 0x1C
>> +#define ASPEED_ADC_REG_ADC20 0x20
>> +#define ASPEED_ADC_REG_ADC24 0x24
>> +#define ASPEED_ADC_REG_ADC28 0x28
>> +#define ASPEED_ADC_REG_ADC2C 0x2C
>>
>
> I'm not sure that these defines add any value. I'd either give them
> names such as "ASPEED_ADC_ENGINE_CTRL". or just use the register
> offset directly.
>
> +
>> +#define ASPEED_ADC_OPERATION_MODE_POWER_DOWN   (0x0 << 1)
>> +#define ASPEED_ADC_OPERATION_MODE_STANDBY      (0x1 << 1)
>> +#define ASPEED_ADC_OPERATION_MODE_NORMAL       (0x7 << 1)
>> +
>> +#define ASPEED_ADC_ENGINE_ENABLE       BIT(0)
>> +
>> +struct aspeed_adc_data {
>> +       struct device   *dev;
>> +       void __iomem    *base;
>> +       struct clk      *pclk;
>> +       struct mutex    lock;
>> +       unsigned long   update_interval_ms;
>> +       u32             enabled_channel_mask;
>> +       const char*     channel_labels[ASPEED_ADC_NUM_CHANNELS];
>> +};
>> +
>> +static int aspeed_adc_set_adc_clock_frequency(
>> +               struct aspeed_adc_data *data,
>> +               unsigned long desired_update_interval_ms)
>> +{
>> +       long pclk_hz = clk_get_rate(data->pclk);
>> +       long adc_combined_divisor;
>> +       long adc_pre_divisor;
>> +       long adc_divisor;
>> +       long adc_clock_control_reg_val;
>> +        long num_enabled_channels = hweight32(data->enabled_channe
>> l_mask);
>>
>
> Some whitespace damage here.
>
> +
>> +       if (desired_update_interval_ms < 1)
>> +               return -EINVAL;
>> +
>> +       /* From the AST2400 datasheet:
>>
>
> Nit: kernel style is to leave a blank line on the first line of
> multi-line comments:
>
>  /*
>   * Foo
>   * etc
>
> +        *   adc_period_s = pclk_period_s * 2 * (pre_divisor+1) *
>> (divisor+1)
>> +        *
>> +        *   and
>> +        *
>> +        *   sample_period_s = 12 * adc_period_s
>> +        *
>> +        * Substitute pclk_period_s = (1 / pclk_hz)
>> +        *
>> +        * Solve for (pre-divisor+1) * (divisor+1) as those are settings
>> we need
>> +        * to program:
>> +        *   (pre-divisor+1) * (divisor+1) = (sample_period_s * pclk_hz)
>> / 24
>> +        */
>> +
>> +       /* Assume PCLK runs at a fairly high frequency so dividing it
>> first
>> +        * loses little accuracy.  Also note that the above formulas have
>> +        * sample_period in seconds while our desired_update_interval is
>> in
>> +        * milliseconds, hence the divide by 1000.
>> +        */
>> +       adc_combined_divisor = desired_update_interval_ms *
>> +                       (pclk_hz / 24 / 1000 / num_enabled_channels);
>> +
>> +       /* Prefer to use the ADC divisor over the ADC pre-divisor.  ADC
>> divisor
>> +        * is 10-bits wide so anything over 1024 must use the pre-divisor.
>> +        */
>> +       adc_pre_divisor = 1;
>> +       while (adc_combined_divisor/adc_pre_divisor > (1<<10)) {
>> +               adc_pre_divisor += 1;
>> +       };
>> +       adc_divisor = adc_combined_divisor / adc_pre_divisor;
>> +
>> +       /* Since ADC divisor and pre-divisor are used in division, the
>> register
>> +        * value is implicitly incremented by one before use.  This means
>> we
>> +        * need to subtract one from our calculated values above.
>> +        */
>> +       adc_pre_divisor -= 1;
>> +       adc_divisor -= 1;
>> +
>> +       adc_clock_control_reg_val = (adc_pre_divisor << 17) | adc_divisor;
>> +
>> +       mutex_lock(&data->lock);
>> +       data->update_interval_ms =
>> +                       (adc_pre_divisor + 1) * (adc_divisor + 1)
>> +                       / (pclk_hz / 24 / 1000);
>> +       writel(adc_clock_control_reg_val, data->base +
>> ASPEED_ADC_REG_ADC0C);
>> +       mutex_unlock(&data->lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static int aspeed_adc_get_channel_reading(struct aspeed_adc_data *data,
>> +                                               int channel, long *val)
>> +{
>> +       u32 data_reg;
>> +       u32 data_reg_val;
>> +       long adc_val;
>> +
>> +       /* Each 32-bit data register contains 2 10-bit ADC values. */
>> +       data_reg = ASPEED_ADC_REG_ADC10 + (channel / 2) * 4;
>> +       data_reg_val = readl(data->base + data_reg);
>> +       if (channel % 2 == 0) {
>> +               adc_val = data_reg_val & 0x3FF;
>> +       } else {
>> +               adc_val = (data_reg_val >> 16) & 0x3FF;
>> +       }
>>
>
> I wonder if you could replace the above block with:
>
>             adc_val = readw(data->base + ASPEED_ADC_REG_ADC10 + channel);
>
> +
>> +       /* Scale 10-bit input reading to millivolts. */
>> +       *val = adc_val * ASPEED_ADC_REF_VOLTAGE / 1024;
>> +
>> +       return 0;
>> +}
>> +
>> +static umode_t aspeed_adc_hwmon_is_visible(const void *_data,
>> +                                               enum hwmon_sensor_types
>> type,
>> +                                               u32 attr, int channel)
>> +{
>> +       const struct aspeed_adc_data* data = _data;
>> +
>> +       if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
>> +               return S_IRUGO | S_IWUSR;
>> +       } else if (type == hwmon_in) {
>> +               /* Only channels that are enabled should be visible. */
>> +               if (channel >= 0 && channel <= ASPEED_ADC_NUM_CHANNELS &&
>> +                   (data->enabled_channel_mask & BIT(channel))) {
>> +
>> +                       /* All enabled channels have an input but labels
>> are
>> +                        * optional in the device tree.
>> +                        */
>> +                       if (attr == hwmon_in_input) {
>> +                               return S_IRUGO;
>> +                       } else if (attr == hwmon_in_label &&
>> +                                       data->channel_labels[channel] !=
>> NULL) {
>> +                               return S_IRUGO;
>> +                       }
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int aspeed_adc_hwmon_read(struct device *dev, enum
>> hwmon_sensor_types type,
>> +                        u32 attr, int channel, long *val)
>> +{
>> +       struct aspeed_adc_data *data = dev_get_drvdata(dev);
>> +
>> +       if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
>> +               *val = data->update_interval_ms;
>> +               return 0;
>> +       } else if (type == hwmon_in && attr == hwmon_in_input) {
>> +               return aspeed_adc_get_channel_reading(data, channel,
>> val);
>> +       }
>> +
>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +static int aspeed_adc_hwmon_read_string(struct device *dev,
>> +                                       enum hwmon_sensor_types type,
>> +                                       u32 attr, int channel, char **str)
>> +{
>> +       struct aspeed_adc_data *data = dev_get_drvdata(dev);
>> +
>> +       if (type == hwmon_in && attr == hwmon_in_label) {
>> +               *str = (char*)data->channel_labels[channel];
>> +               return 0;
>> +       }
>> +
>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +static int aspeed_adc_hwmon_write(struct device *dev, enum
>> hwmon_sensor_types type,
>> +                         u32 attr, int channel, long val)
>> +{
>> +       struct aspeed_adc_data *data = dev_get_drvdata(dev);
>> +
>> +       if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
>> +               return aspeed_adc_set_adc_clock_frequency(data, val);
>> +       }
>> +
>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +static const struct hwmon_ops aspeed_adc_hwmon_ops = {
>> +       .is_visible = aspeed_adc_hwmon_is_visible,
>> +       .read = aspeed_adc_hwmon_read,
>> +       .read_string = aspeed_adc_hwmon_read_string,
>> +       .write = aspeed_adc_hwmon_write,
>> +};
>> +
>> +static const u32 aspeed_adc_hwmon_chip_config[] = {
>> +       HWMON_C_UPDATE_INTERVAL,
>> +       0
>> +};
>> +
>> +static const struct hwmon_channel_info aspeed_adc_hwmon_chip_channel = {
>> +       .type = hwmon_chip,
>> +       .config = aspeed_adc_hwmon_chip_config,
>> +};
>> +
>> +static const u32 aspeed_adc_hwmon_in_config[] = {
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       HWMON_I_INPUT | HWMON_I_LABEL,
>> +       0
>> +};
>> +
>> +static const struct hwmon_channel_info aspeed_adc_hwmon_in_channel = {
>> +       .type = hwmon_in,
>> +       .config = aspeed_adc_hwmon_in_config,
>> +};
>> +
>> +static const struct hwmon_channel_info *aspeed_adc_hwmon_channel_info[]
>> = {
>> +       &aspeed_adc_hwmon_chip_channel,
>> +       &aspeed_adc_hwmon_in_channel,
>> +       NULL
>> +};
>> +
>> +static const struct hwmon_chip_info aspeed_adc_hwmon_chip_info = {
>> +       .ops = &aspeed_adc_hwmon_ops,
>> +       .info = aspeed_adc_hwmon_channel_info,
>> +};
>> +
>> +static int aspeed_adc_probe(struct platform_device *pdev)
>> +{
>> +       struct aspeed_adc_data *data;
>> +       struct resource *res;
>> +       int ret;
>> +       struct device *hwmon_dev;
>> +       u32 desired_update_interval_ms;
>> +       u32 adc_engine_control_reg_val;
>> +       struct device_node* node;
>> +
>> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       data->pclk = devm_clk_get(&pdev->dev, NULL);
>> +       if (IS_ERR(data->pclk)) {
>> +               dev_err(&pdev->dev, "clk_get failed\n");
>> +               return PTR_ERR(data->pclk);
>> +       }
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       data->base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(data->base))
>> +               return PTR_ERR(data->base);
>> +
>> +       ret = of_property_read_u32(pdev->dev.of_node,
>> +                       "update-interval-ms",
>> &desired_update_interval_ms);
>> +       if (ret < 0 || desired_update_interval_ms == 0) {
>> +               dev_err(&pdev->dev,
>> +                               "Missing or zero update-interval-ms
>> property, "
>> +                               "defaulting to 100ms\n");
>>
>
> Put the string on one line so it can be easily searched for.
>
> +               desired_update_interval_ms = 100;
>> +       }
>> +
>> +       mutex_init(&data->lock);
>> +
>> +       ret = clk_prepare_enable(data->pclk);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "failed to enable clock\n");
>> +               mutex_destroy(&data->lock);
>> +                return ret;
>>
>
> Strange whitespace here.
>
> +       }
>> +
>> +       /* Figure out which channels are marked available in the device
>> tree. */
>> +       data->enabled_channel_mask = 0;
>> +       for_each_available_child_of_node(pdev->dev.of_node, node) {
>> +               u32 pval;
>> +               unsigned int channel;
>> +
>> +               if (of_property_read_u32(node, "reg", &pval)) {
>> +                       dev_err(&pdev->dev, "invalid reg on %s\n",
>> +                               node->full_name);
>> +                       continue;
>> +               }
>> +
>> +               channel = pval;
>> +               if (channel >= ASPEED_ADC_NUM_CHANNELS) {
>> +                       dev_err(&pdev->dev,
>> +                               "invalid channel index %d on %s\n",
>> +                               channel, node->full_name);
>> +                       continue;
>> +               }
>> +
>> +               data->enabled_channel_mask |= BIT(channel);
>> +
>> +               /* Cache a pointer to the label if one is specified.
>> Ignore any
>> +                * errors as the label property is optional.
>> +                */
>> +               of_property_read_string(node, "label",
>> &data->channel_labels[channel]);
>>
>
> I was wondering how long we could keep that pointer around. I think we
> are ok for the lifetime of the driver, as we hold a reference to the
> node in dev.of_node.
>
> +       }
>> +
>> +       platform_set_drvdata(pdev, data);
>> +       aspeed_adc_set_adc_clock_frequency(data,
>> desired_update_interval_ms);
>>
>
> This reads funny. aspeed_adc_set_clock_frequency instead?
>
> +
>> +       /* Start all the requested channels in normal mode. */
>> +       adc_engine_control_reg_val = (data->enabled_channel_mask << 16) |
>> +               ASPEED_ADC_OPERATION_MODE_NORMAL |
>> ASPEED_ADC_ENGINE_ENABLE;
>> +       writel(adc_engine_control_reg_val, data->base +
>> ASPEED_ADC_REG_ADC00);
>> +
>> +       /* Register sysfs hooks */
>> +       hwmon_dev = devm_hwmon_device_register_with_info(
>> +                       &pdev->dev, "aspeed_adc", data,
>> +                       &aspeed_adc_hwmon_chip_info, NULL);
>> +       if (IS_ERR(hwmon_dev)) {
>> +               clk_disable_unprepare(data->pclk);
>> +               mutex_destroy(&data->lock);
>> +               return PTR_ERR(hwmon_dev);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int aspeed_adc_remove(struct platform_device *pdev) {
>> +       struct aspeed_adc_data *data = dev_get_drvdata(&pdev->dev);
>> +       clk_disable_unprepare(data->pclk);
>> +       mutex_destroy(&data->lock);
>> +       return 0;
>> +}
>> +
>> +const struct of_device_id aspeed_adc_matches[] = {
>> +       { .compatible = "aspeed,ast2400-adc" },
>> +       { .compatible = "aspeed,ast2500-adc" },
>> +};
>> +MODULE_DEVICE_TABLE(of, aspeed_adc_matches);
>> +
>> +static struct platform_driver aspeed_adc_driver = {
>> +       .probe = aspeed_adc_probe,
>> +       .remove = aspeed_adc_remove,
>> +       .driver = {
>> +               .name = KBUILD_MODNAME,
>> +               .of_match_table = aspeed_adc_matches,
>> +       }
>> +};
>> +
>> +module_platform_driver(aspeed_adc_driver);
>> +
>> +MODULE_AUTHOR("Rick Altherr <raltherr@google.com>");
>> +MODULE_DESCRIPTION("Aspeed AST2400/2500 ADC Driver");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.11.0.483.g087da7b7c-goog
>>
>> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

--94eb2c05a380f744660549b01511
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Feb 28, 2017 7:45 PM, &quot;Guenter Roeck&quot; &lt;<a href=3D=
"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; wrote:<br type=3D"at=
tribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">On 02/28/201=
7 04:49 PM, Joel Stanley wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Mar 1, 2017 at 6:44 AM, Rick Altherr &lt;<a href=3D"mailto:raltherr=
@google.com" target=3D"_blank">raltherr@google.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This<br>
driver implements reading the ADC values, enabling channels via device<br>
tree, and optionally providing channel labels via device tree.=C2=A0 Low an=
d<br>
high threshold interrupts are supported by the hardware but not<br>
implemented.<br>
<br>
Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com" targ=
et=3D"_blank">raltherr@google.com</a>&gt;<br>
</blockquote>
<br>
Looks good. Some minor comments below.<br>
<br>
Is there a reason you wrote a hwmon driver instead of an iio driver? I<br>
wasn&#39;t sure what the recommended subsystem is.<br>
</blockquote>
<br></div>
Excellent point. Question is really if there is a plan to add support for<b=
r>
thresholds. If not, an iio driver might be more appropriate.<br>
<br>
Guenter<br></blockquote></div></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">The hardware supports firing interrupts on high and low thresh=
olds. I&#39;m not planning to use that feature yet so I didn&#39;t implemen=
t it. Would you prefer that I leave it as is (maybe with a TODO), implement=
 the thresholding, or change to iio?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Rick</div><div dir=3D"auto"><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"elided-text">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
---<br>
=C2=A0drivers/hwmon/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 ++<br>
=C2=A0drivers/hwmon/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/hwmon/aspeed_adc.c | 383 ++++++++++++++++++++++++++++++<wbr>+=
++++++++++++++<br>
=C2=A03 files changed, 394 insertions(+)<br>
=C2=A0create mode 100644 drivers/hwmon/aspeed_adc.c<br>
<br>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig<br>
index 0649d53f3d16..c99a67b4afe4 100644<br>
--- a/drivers/hwmon/Kconfig<br>
+++ b/drivers/hwmon/Kconfig<br>
@@ -261,6 +261,16 @@ config SENSORS_ASC7621<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a modul=
e.=C2=A0 If so, the module<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be called asc7621.<br>
<br>
+config SENSORS_ASPEED_ADC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Aspeed AST2400/AST2500 ADC&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_ASPEED<br>
</blockquote>
<br>
depends on ARCH_ASPEED || COMPILE_TEST.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support for =
the Aspeed AST2400/AST2500<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ADC.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a modul=
e.=C2=A0 If so, the module<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called aspeed_adc.<br>
+<br>
=C2=A0config SENSORS_K8TEMP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;AMD Athlon64/FX or Opteron tempe=
rature sensor&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on X86 &amp;&amp; PCI<br>
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile<br>
index 5509edf6186a..eede049c9d0d 100644<br>
--- a/drivers/hwmon/Makefile<br>
+++ b/drivers/hwmon/Makefile<br>
@@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475) +=3D adt7475.o<br>
=C2=A0obj-$(CONFIG_SENSORS_<wbr>APPLESMC) +=3D applesmc.o<br>
=C2=A0obj-$(CONFIG_SENSORS_ARM_<wbr>SCPI) +=3D scpi-hwmon.o<br>
=C2=A0obj-$(CONFIG_SENSORS_ASC7621)<wbr>=C2=A0 +=3D asc7621.o<br>
+obj-$(CONFIG_SENSORS_ASPEED_A<wbr>DC) +=3D aspeed_adc.o<br>
=C2=A0obj-$(CONFIG_SENSORS_ATXP1)=C2=A0 =C2=A0 +=3D atxp1.o<br>
=C2=A0obj-$(CONFIG_SENSORS_<wbr>CORETEMP) +=3D coretemp.o<br>
=C2=A0obj-$(CONFIG_SENSORS_DA9052_A<wbr>DC)+=3D da9052-hwmon.o<br>
diff --git a/drivers/hwmon/aspeed_adc.c b/drivers/hwmon/aspeed_adc.c<br>
new file mode 100644<br>
index 000000000000..098e32315264<br>
--- /dev/null<br>
+++ b/drivers/hwmon/aspeed_adc.c<br>
@@ -0,0 +1,383 @@<br>
+/*<br>
+ * Aspeed AST2400/2500 ADC<br>
+ *<br>
+ * Copyright (C) 2017 Google, Inc.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2, as published by the Free Software Foundation.<br>
+ *<br>
+ */<br>
+<br>
+#include &lt;asm/io.h&gt;<br>
+#include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/errno.h&gt;<br>
+#include &lt;linux/hwmon.h&gt;<br>
+#include &lt;linux/hwmon-sysfs.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/mutex.h&gt;<br>
+#include &lt;linux/of_platform.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/types.h&gt;<br>
+<br>
+#define ASPEED_ADC_NUM_CHANNELS=C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
+#define ASPEED_ADC_REF_VOLTAGE 2500 /* millivolts */<br>
+<br>
+#define ASPEED_ADC_REG_ADC00 0x00<br>
+#define ASPEED_ADC_REG_ADC04 0x04<br>
+#define ASPEED_ADC_REG_ADC08 0x08<br>
+#define ASPEED_ADC_REG_ADC0C 0x0C<br>
+#define ASPEED_ADC_REG_ADC10 0x10<br>
+#define ASPEED_ADC_REG_ADC14 0x14<br>
+#define ASPEED_ADC_REG_ADC18 0x18<br>
+#define ASPEED_ADC_REG_ADC1C 0x1C<br>
+#define ASPEED_ADC_REG_ADC20 0x20<br>
+#define ASPEED_ADC_REG_ADC24 0x24<br>
+#define ASPEED_ADC_REG_ADC28 0x28<br>
+#define ASPEED_ADC_REG_ADC2C 0x2C<br>
</blockquote>
<br>
I&#39;m not sure that these defines add any value. I&#39;d either give them=
<br>
names such as &quot;ASPEED_ADC_ENGINE_CTRL&quot;. or just use the register<=
br>
offset directly.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+#define ASPEED_ADC_OPERATION_MODE_POWE<wbr>R_DOWN=C2=A0 =C2=A0(0x0 &lt;&lt=
; 1)<br>
+#define ASPEED_ADC_OPERATION_MODE_STAN<wbr>DBY=C2=A0 =C2=A0 =C2=A0 (0x1 &l=
t;&lt; 1)<br>
+#define ASPEED_ADC_OPERATION_MODE_NORM<wbr>AL=C2=A0 =C2=A0 =C2=A0 =C2=A0(0=
x7 &lt;&lt; 1)<br>
+<br>
+#define ASPEED_ADC_ENGINE_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
+<br>
+struct aspeed_adc_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0*dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 *base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 *pclk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0update_interval_ms;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0enabled_channel_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char*=C2=A0 =C2=A0 =C2=A0channel_labels[A=
SPEED_ADC_<wbr>NUM_CHANNELS];<br>
+};<br>
+<br>
+static int aspeed_adc_set_adc_clock_frequ<wbr>ency(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_adc_d=
ata *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long desir=
ed_update_interval_ms)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long pclk_hz =3D clk_get_rate(data-&gt;pclk);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long adc_combined_divisor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long adc_pre_divisor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long adc_divisor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long adc_clock_control_reg_val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 long num_enabled_channels =3D hweight32(data-&=
gt;enabled_channe<wbr>l_mask);<br>
</blockquote>
<br>
Some whitespace damage here.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desired_update_interval_ms &lt; 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* From the AST2400 datasheet:<br>
</blockquote>
<br>
Nit: kernel style is to leave a blank line on the first line of<br>
multi-line comments:<br>
<br>
=C2=A0/*<br>
=C2=A0 * Foo<br>
=C2=A0 * etc<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0adc_period_s =3D pclk_period_s *=
 2 * (pre_divisor+1) * (divisor+1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0sample_period_s =3D 12 * adc_per=
iod_s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Substitute pclk_period_s =3D (1 / pclk_hz)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Solve for (pre-divisor+1) * (divisor+1) as t=
hose are settings we need<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to program:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0(pre-divisor+1) * (divisor+1) =
=3D (sample_period_s * pclk_hz) / 24<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Assume PCLK runs at a fairly high frequency =
so dividing it first<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * loses little accuracy.=C2=A0 Also note that =
the above formulas have<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * sample_period in seconds while our desired_u=
pdate_interval is in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * milliseconds, hence the divide by 1000.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_combined_divisor =3D desired_update_interva=
l_ms *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(pclk_hz / 24 / 1000 / num_enabled_channels);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Prefer to use the ADC divisor over the ADC p=
re-divisor.=C2=A0 ADC divisor<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is 10-bits wide so anything over 1024 must u=
se the pre-divisor.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_pre_divisor =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (adc_combined_divisor/adc_pre_<wbr>diviso=
r &gt; (1&lt;&lt;10)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adc_pre_divisor +=
=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_divisor =3D adc_combined_divisor / adc_pre_=
divisor;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Since ADC divisor and pre-divisor are used i=
n division, the register<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * value is implicitly incremented by one befor=
e use.=C2=A0 This means we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * need to subtract one from our calculated val=
ues above.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_pre_divisor -=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_divisor -=3D 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_clock_control_reg_val =3D (adc_pre_divisor =
&lt;&lt; 17) | adc_divisor;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;data-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;update_interval_ms =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(adc_pre_divisor + 1) * (adc_divisor + 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/ (pclk_hz / 24 / 1000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(adc_clock_control_reg_<wbr>val, data-&gt=
;base + ASPEED_ADC_REG_ADC0C);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;data-&gt;lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int aspeed_adc_get_channel_reading<wbr>(struct aspeed_adc_data *dat=
a,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0int channel, long *val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 data_reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 data_reg_val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long adc_val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Each 32-bit data register contains 2 10-bit =
ADC values. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data_reg =3D ASPEED_ADC_REG_ADC10 + (channel / =
2) * 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data_reg_val =3D readl(data-&gt;base + data_reg=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel % 2 =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adc_val =3D data_re=
g_val &amp; 0x3FF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adc_val =3D (data_r=
eg_val &gt;&gt; 16) &amp; 0x3FF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
</blockquote>
<br>
I wonder if you could replace the above block with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_val =3D readw(data-&gt;base +=
 ASPEED_ADC_REG_ADC10 + channel);<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Scale 10-bit input reading to millivolts. */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D adc_val * ASPEED_ADC_REF_VOLTAGE / 102=
4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static umode_t aspeed_adc_hwmon_is_visible(co<wbr>nst void *_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enum hwmon_sensor_types type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0u32 attr, int channel)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct aspeed_adc_data* data =3D _data;<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D hwmon_chip &amp;&amp; attr =3D=
=3D hwmon_chip_update_interval) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return S_IRUGO | S_=
IWUSR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (type =3D=3D hwmon_in) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only channels th=
at are enabled should be visible. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel &gt;=3D=
 0 &amp;&amp; channel &lt;=3D ASPEED_ADC_NUM_CHANNELS &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(data=
-&gt;enabled_channel_mask &amp; BIT(channel))) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* All enabled channels have an input but labels are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * optional in the device tree.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (attr =3D=3D hwmon_in_input) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return S_IRUGO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else if (attr =3D=3D hwmon_in_label &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;=
channel_labels[channel] !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return S_IRUGO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int aspeed_adc_hwmon_read(struct device *dev, enum hwmon_sensor_typ=
es type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u32 attr, int channel, long *val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_adc_data *data =3D dev_get_drvdat=
a(dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D hwmon_chip &amp;&amp; attr =3D=
=3D hwmon_chip_update_interval) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D data-&gt;u=
pdate_interval_ms;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (type =3D=3D hwmon_in &amp;&amp; attr=
 =3D=3D hwmon_in_input) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return aspeed_adc_g=
et_channel_reading<wbr>(data, channel, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
+}<br>
+<br>
+static int aspeed_adc_hwmon_read_string(s<wbr>truct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum hwmo=
n_sensor_types type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 attr,=
 int channel, char **str)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_adc_data *data =3D dev_get_drvdat=
a(dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D hwmon_in &amp;&amp; attr =3D=3D=
 hwmon_in_label) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*str =3D (char*)dat=
a-&gt;channel_labels[ch<wbr>annel];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
+}<br>
+<br>
+static int aspeed_adc_hwmon_write(struct device *dev, enum hwmon_sensor_ty=
pes type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0u32 attr, int channel, long val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_adc_data *data =3D dev_get_drvdat=
a(dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D hwmon_chip &amp;&amp; attr =3D=
=3D hwmon_chip_update_interval) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return aspeed_adc_s=
et_adc_clock_frequ<wbr>ency(data, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
+}<br>
+<br>
+static const struct hwmon_ops aspeed_adc_hwmon_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.is_visible =3D aspeed_adc_hwmon_is_visible,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D aspeed_adc_hwmon_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read_string =3D aspeed_adc_hwmon_read_string,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D aspeed_adc_hwmon_write,<br>
+};<br>
+<br>
+static const u32 aspeed_adc_hwmon_chip_config[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_C_UPDATE_INTERVAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+};<br>
+<br>
+static const struct hwmon_channel_info aspeed_adc_hwmon_chip_channel =3D {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_chip,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D aspeed_adc_hwmon_chip_config,<br>
+};<br>
+<br>
+static const u32 aspeed_adc_hwmon_in_config[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_LABEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+};<br>
+<br>
+static const struct hwmon_channel_info aspeed_adc_hwmon_in_channel =3D {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_in,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D aspeed_adc_hwmon_in_config,<br>
+};<br>
+<br>
+static const struct hwmon_channel_info *aspeed_adc_hwmon_channel_info<wbr>=
[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;aspeed_adc_hwmon_chip_channe<wbr>l,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;aspeed_adc_hwmon_in_channel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
+};<br>
+<br>
+static const struct hwmon_chip_info aspeed_adc_hwmon_chip_info =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;aspeed_adc_hwmon_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.info =3D aspeed_adc_hwmon_channel_info,<br>
+};<br>
+<br>
+static int aspeed_adc_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_adc_data *data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *hwmon_dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 desired_update_interval_ms;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 adc_engine_control_reg_val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node* node;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof=
(*data), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;pclk =3D devm_clk_get(&amp;pdev-&gt;de=
v, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(data-&gt;pclk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;clk_get failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(data=
-&gt;pclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;base =3D devm_ioremap_resource(&amp;pd=
ev-&gt;d<wbr>ev, res);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(data-&gt;base))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(data=
-&gt;base);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(pdev-&gt;dev<wbr>.=
of_node,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;update-interval-ms&quot;, &amp;desired_update_interval_ms);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0 || desired_update_interval_ms =
=3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Missing or zero update-interval=
-ms property, &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;defaulting to 100ms\n&quot;);<b=
r>
</blockquote>
<br>
Put the string on one line so it can be easily searched for.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desired_update_inte=
rval_ms =3D 100;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;data-&gt;lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(data-&gt;pclk)<wbr>;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to enable clock\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;=
data-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
</blockquote>
<br>
Strange whitespace here.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Figure out which channels are marked availab=
le in the device tree. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;enabled_channel_mask =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_available_child_of_n<wbr>ode(pdev-&gt;=
dev.of_node, node) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pval;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int channe=
l;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_rea=
d_u32(node, &quot;reg&quot;, &amp;pval)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;invalid reg on %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-&gt;full_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D pval;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel &gt;=3D=
 ASPEED_ADC_NUM_CHANNELS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(&amp;pdev-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;invalid channel index %d on %s\=
n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel, node-&gt;full_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;enabled_ch=
annel_mask |=3D BIT(channel);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cache a pointer =
to the label if one is specified.=C2=A0 Ignore any<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * errors as the la=
bel property is optional.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_st=
ring(node, &quot;label&quot;, &amp;data-&gt;channel_labels[channel]<wbr>);<=
br>
</blockquote>
<br>
I was wondering how long we could keep that pointer around. I think we<br>
are ok for the lifetime of the driver, as we hold a reference to the<br>
node in dev.of_node.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_adc_set_adc_clock_freq<wbr>uency(data, d=
esired_update_interval_ms);<br>
</blockquote>
<br>
This reads funny. aspeed_adc_set_clock_frequency instead?<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Start all the requested channels in normal m=
ode. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adc_engine_control_reg_val =3D (data-&gt;enable=
d_channel_mask &lt;&lt; 16) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASPEED_ADC_OPERATIO=
N_MODE_NOR<wbr>MAL | ASPEED_ADC_ENGINE_ENABLE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(adc_engine_control_<wbr>reg_val, data-&g=
t;base + ASPEED_ADC_REG_ADC00);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register sysfs hooks */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon_dev =3D devm_hwmon_device_register_wit<wb=
r>h_info(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;pdev-&gt;dev, &quot;aspeed_adc&quot;, data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;aspeed_adc_hwmon_chip_info, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hwmon_dev)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(data-&gt;p<wbr>clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;=
data-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(hwmo=
n_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int aspeed_adc_remove(struct platform_device *pdev) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_adc_data *data =3D dev_get_drvdat=
a(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(data-&gt;p<wbr>clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;data-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+const struct of_device_id aspeed_adc_matches[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;aspeed,ast2400-adc&quot=
; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;aspeed,ast2500-adc&quot=
; },<br>
+};<br>
+MODULE_DEVICE_TABLE(of, aspeed_adc_matches);<br>
+<br>
+static struct platform_driver aspeed_adc_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D aspeed_adc_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D aspeed_adc_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D KBUILD_MO=
DNAME,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 aspeed_adc_matches,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+};<br>
+<br>
+module_platform_driver(aspeed<wbr>_adc_driver);<br>
+<br>
+MODULE_AUTHOR(&quot;Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com=
" target=3D"_blank">raltherr@google.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;Aspeed AST2400/2500 ADC Driver&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
--<br>
2.11.0.483.g087da7b7c-goog<br>
<br>
</blockquote></div><font color=3D"#888888">
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-hwmon&=
quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" targe=
t=3D"_blank">majordomo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/majord=
o<wbr>mo-info.html</a><br>
<br>
</font></blockquote>
<br>
</blockquote></div><br></div></div></div>

--94eb2c05a380f744660549b01511--
