Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:37064 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbdGZOJS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2017 10:09:18 -0400
Received: by mail-yw0-f194.google.com with SMTP id s143so2842144ywg.4
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Jul 2017 07:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170726112435.32575-1-c_mykolak@mellanox.com>
References: <20170726112435.32575-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 23:38:57 +0930
Message-ID: <CACPK8XcgN2-X_LyTn+KJZ-fsibdCjwkGJocBRGK4U3qsYa1BWA@mail.gmail.com>
Subject: Re: [patch v4] hwmon: (aspeed-pwm-tacho) cooling device support.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Patrick Venture <venture@google.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Ohad Oz <ohado@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 26, 2017 at 8:54 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>
> v1 -> v2:
>  - Remove device tree binding file from the patch.
>  - Move of_node_put out of cycle because of_get_next_child
>    already do of_put_node on previous child.
>
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
>
> v3 -> v4:
>  Pointed out by Joel Stanley:
>  - Move patch history after Signoff.
>  - Remove unnecessary type cast.
>  - Use array instead of pointers for colling_levels.
>  - Rename num_level to num_levels.
>  - Use local variable to make function easier to read.
>  - Drop unnesesary sizeof(u8).
>  - Use IS_ERR instead of PTR_ERR_OR_ZERO.

Changes look good!

> +static int aspeed_create_pwm_cooling(struct device *dev,
> +                                    struct device_node *child,
> +                                    struct aspeed_pwm_tacho_data *priv,
> +                                    u32 pwm_port, u8 num_levels)
> +{
> +       int ret;
> +       struct aspeed_cooling_device *cdev;
> +
> +       cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +
> +       if (!cdev)
> +               return -ENOMEM;
> +
> +       cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> +       if (!cdev->cooling_levels)
> +               return -ENOMEM;
> +
> +       cdev->max_state = num_levels - 1;
> +       ret = of_property_read_u8_array(child, "cooling-levels",
> +                                       cdev->cooling_levels,
> +                                       num_levels);
> +       if (ret) {
> +               dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +               return ret;
> +       }
> +       sprintf(cdev->name, "%s%d", child->name, pwm_port);

Oops, I missed this one. It looks like if child->name is too long then
this will overflow name[16]. You could dynamically allocate
cdev->name[16], or use snprintf.

Once you've fixed that I will add my reviewed-by.

Cheers,

Joel
