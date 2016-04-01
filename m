Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1459278791-3646-5-git-send-email-tthayer@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
	<1459278791-3646-5-git-send-email-tthayer@opensource.altera.com>
Date: Fri, 1 Apr 2016 14:17:42 +0200
Message-ID: <CACRpkda8VTDGVsRqbCs6ESeokA3t_p2X91FUNiqA7YM=F-JXBQ@mail.gmail.com>
Subject: Re: [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
From: Linus Walleij <linus.walleij@linaro.org>
To: tthayer@opensource.altera.com
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, pawell.moll@arm.com,
	Mark Rutland <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-hwmon@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Mar 29, 2016 at 9:13 PM,  <tthayer@opensource.altera.com> wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>
> Add the GPIO functionality for the Altera Arria10 MAX5 System Resource
> Chip. The A10 MAX5 has 12 bits of GPIO assigned to switches, buttons,
> and LEDs as a GPIO extender on the SPI bus.
>
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>

OK...

As Lee says: split off the MFD patch so it is a pure GPIO driver
patch.

> +#include <linux/gpio.h>

You should instead #include <linux/gpio/driver.h>

> +#include <linux/mfd/altera-a10sr.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/syscalls.h>
> +#include <linux/uaccess.h>

Syscalls and uaccess??? I don't think so.

> +struct altr_a10sr_gpio {
> +       struct altr_a10sr *a10sc;
> +       struct gpio_chip gp;
> +};

Add some kerneldoc.

> +static inline struct altr_a10sr_gpio *to_altr_a10sr_gpio(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct altr_a10sr_gpio, gp);
> +}

Don't use this old design pattern.

Use [devm_]gpiochip_add_data() and use gpiochip_get_data(gc) to get
a data pointer from the gpiochip.

> +static int altr_a10sr_gpio_get(struct gpio_chip *gc, unsigned int nr)
> +{
> +       struct altr_a10sr_gpio *gpio = to_altr_a10sr_gpio(gc);

So this becomes
struct altr_a10sr_gpio *gpio = gpiochip_get_data(gc);

> +       int ret;
> +       unsigned char reg = ALTR_A10SR_LED_RD_REG + ALTR_A10SR_REG_OFFSET(nr);
> +
> +       ret = altr_a10sr_reg_read(gpio->a10sc, reg);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       if (ret & (1 << ALTR_A10SR_REG_BIT(nr)))
> +               return 1;

Do this instead:

return !!(ret & (1 << ALTR_A10SR_REG_BIT(nr)))

It raises the question whether ALTR_A10SR_REG_BIT
is just a reimplementation of the BIT() macro from
<linux/bitops.h>, please check this.

> +static int altr_a10sr_gpio_direction_input(struct gpio_chip *gc,
> +                                          unsigned int nr)
> +{
> +       if ((nr >= ALTR_A10SR_IN_VALID_RANGE_LO) &&
> +           (nr <= ALTR_A10SR_IN_VALID_RANGE_HI))
> +               return 0;
> +       return -EINVAL;
> +}
> +
> +static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
> +                                           unsigned int nr, int value)
> +{
> +       if ((nr >= ALTR_A10SR_OUT_VALID_RANGE_LO) &&
> +           (nr <= ALTR_A10SR_OUT_VALID_RANGE_HI))
> +               return 0;
> +       return -EINVAL;
> +}

Does this mean that all lines are *always* input and output
at the same time?

If there is no .set_direction() callback and all lines are both
input and output it kind of implies that all lines are also
implicitly open drain do you agree?

Please check:
- If there is really no direction setting anywhere
- For example if some lines are hardwired as input and
  some lines are hardwired as output
- If that is not the case, verify that all lines are really
  open drain, they should be if all are both input and
  output at the same time.

> +       ret = gpiochip_add(&gpio->gp);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> +               return ret;
> +       }

Use devm_gpiochip_add_data() instead.

Yours,
Linus Walleij
