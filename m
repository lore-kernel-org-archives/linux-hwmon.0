Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33752 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751365AbdGZGsl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2017 02:48:41 -0400
Received: by mail-yw0-f194.google.com with SMTP id u207so4165172ywc.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Jul 2017 23:48:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170725141727.13105-1-c_mykolak@mellanox.com>
References: <20170725141727.13105-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 16:18:20 +0930
Message-ID: <CACPK8XeidChD_LT6o8MQBmyJ4r3mPCPfwEX_1REmQJkMNGELeQ@mail.gmail.com>
Subject: Re: [patch v3] hwmon: (aspeed-pwm-tacho) cooling device support.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Ohad Oz <ohado@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Patrick Venture <venture@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Mykola,

On Tue, Jul 25, 2017 at 11:47 PM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>
> v1 -> v2:
>  - Remove device tree binding file from the patch.
>  - Move of_node_put out of cycle because of_get_next_child
>    already do of_put_node on previous child.
>
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.

Looking better! I have a few comments below. Some are nits (small
issues that aren't a big deal), but I chose to point them out so you
learn for next time. If you have any questions then please ask.

>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---

Convention is to stick the changes between versions (the v2-> v3 bits)
down here, so that it doesn't end up in the final commit message.


>  drivers/hwmon/aspeed-pwm-tacho.c | 118 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index ddfe66b..ae8dfee 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/regmap.h>
> +#include <linux/thermal.h>
>
>  /* ASPEED PWM & FAN Tach Register Definition */
>  #define ASPEED_PTCR_CTRL               0x00
> @@ -166,6 +167,16 @@
>  /* How long we sleep in us while waiting for an RPM result. */
>  #define ASPEED_RPM_STATUS_SLEEP_USEC   500
>
> +struct aspeed_cooling_device {
> +       char name[16];
> +       struct aspeed_pwm_tacho_data *priv;
> +       struct thermal_cooling_device *tcdev;
> +       int pwm_port;
> +       u8 *cooling_levels;
> +       u8 max_state;
> +       u8 cur_state;
> +};
> +
>  struct aspeed_pwm_tacho_data {
>         struct regmap *regmap;
>         unsigned long clk_freq;
> @@ -180,6 +191,7 @@ struct aspeed_pwm_tacho_data {
>         u8 pwm_port_type[8];
>         u8 pwm_port_fan_ctrl[8];
>         u8 fan_tach_ch_source[16];
> +       struct aspeed_cooling_device *cdev[8];
>         const struct attribute_group *groups[3];
>  };
>
> @@ -765,6 +777,97 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
>         }
>  }
>
> +static int
> +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long *state)
> +{
> +       struct aspeed_cooling_device *cdev =
> +                               (struct aspeed_cooling_device *)tcdev->devdata;
> +
> +       *state = cdev->max_state;
> +
> +       return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long *state)
> +{
> +       struct aspeed_cooling_device *cdev =
> +                               (struct aspeed_cooling_device *)tcdev->devdata;
> +
> +       *state = cdev->cur_state;
> +
> +       return 0;
> +}
> +
> +static int
> +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
> +                           unsigned long state)
> +{
> +       struct aspeed_cooling_device *cdev =
> +                               (struct aspeed_cooling_device *)tcdev->devdata;

You can drop the cast, as devdata is a void *:

      struct aspeed_cooling_device *cdev = tcdev->devdata;

> +
> +       if (state > cdev->max_state)
> +               return -EINVAL;
> +
> +       cdev->cur_state = state;
> +       cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] = *(cdev->cooling_levels
> +                                                         + cdev->cur_state);

That pointer maths looks scary :) How about this instead?

       cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =
cdev->cooling_levels[cdev->cur_state]


> +       aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> +                                    *(cdev->cooling_levels +
> +                                      cdev->cur_state));

Same here:

       aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,

cdev->cooling_levels[cdev->cur_state]);

> +
> +       return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops = {
> +       .get_max_state = aspeed_pwm_cz_get_max_state,
> +       .get_cur_state = aspeed_pwm_cz_get_cur_state,
> +       .set_cur_state = aspeed_pwm_cz_set_cur_state,
> +};
> +
> +static int aspeed_create_pwm_cooling(struct device *dev,
> +                            struct device_node *child,
> +                            struct aspeed_pwm_tacho_data *priv,
> +                            u32 pwm_port, u8 num_level)

Can we call this num_levels instead of num_level?

> +{
> +       int ret;
> +
> +       priv->cdev[pwm_port] = devm_kzalloc(dev, sizeof(*priv->cdev[pwm_port]),
> +                                           GFP_KERNEL);

This function would be easier to read if we used a local variable:

struct pwm_port *port;
port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);

Then at the bottom of the function, do

priv->cdev[pwm_port] = port;


> +       if (!priv->cdev[pwm_port])
> +               return -ENOMEM;
> +
> +       priv->cdev[pwm_port]->cooling_levels = devm_kzalloc(dev, num_level *

The sizeof(8) isn't useful, you could drop it.

> +                                                           sizeof(u8),
> +                                                           GFP_KERNEL);
> +       if (!priv->cdev[pwm_port]->cooling_levels)
> +               return -ENOMEM;
> +
> +       priv->cdev[pwm_port]->max_state = num_level - 1;
> +       ret = of_property_read_u8_array(child, "cooling-levels",
> +                                       priv->cdev[pwm_port]->cooling_levels,
> +                                       num_level);
> +       if (ret) {
> +               dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +               return ret;
> +       }
> +       sprintf(priv->cdev[pwm_port]->name, "%s%d", child->name, pwm_port);
> +
> +       priv->cdev[pwm_port]->tcdev = thermal_of_cooling_device_register(child,
> +                                               priv->cdev[pwm_port]->name,
> +                                               priv->cdev[pwm_port],
> +                                               &aspeed_pwm_cool_ops);
> +       if (PTR_ERR_OR_ZERO(priv->cdev[pwm_port]->tcdev))
> +               return PTR_ERR(priv->cdev[pwm_port]->tcdev);

I think you meant this:

if (IS_ERR(priv->cdev[pwm_port]->tcdev))
   return PTR_ERR(priv->cdev[pwm_port]->tcdev);

> +
> +       priv->cdev[pwm_port]->priv = priv;
> +       priv->cdev[pwm_port]->pwm_port = pwm_port;
> +
> +       return 0;
> +}
> +
>  static int aspeed_create_fan(struct device *dev,
>                              struct device_node *child,
>                              struct aspeed_pwm_tacho_data *priv)
> @@ -778,6 +881,15 @@ static int aspeed_create_fan(struct device *dev,
>                 return ret;
>         aspeed_create_pwm_port(priv, (u8)pwm_port);
>
> +       ret = of_property_count_u8_elems(child, "cooling-levels");
> +
> +       if (ret > 0) {
> +               ret = aspeed_create_pwm_cooling(dev, child, priv, pwm_port,
> +                                               ret);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         count = of_property_count_u8_elems(child, "aspeed,fan-tach-ch");
>         if (count < 1)
>                 return -EINVAL;
> @@ -834,10 +946,12 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>
>         for_each_child_of_node(np, child) {
>                 ret = aspeed_create_fan(dev, child, priv);
> -               of_node_put(child);
> -               if (ret)
> +               if (ret) {
> +                       of_node_put(child);
>                         return ret;
> +               }
>         }
> +       of_node_put(child);

I'm not sure about these.

Cheers,

Joel
