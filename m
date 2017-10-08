Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57194 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbdJHOde (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Oct 2017 10:33:34 -0400
Date: Sun, 8 Oct 2017 07:33:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [7/9] hwmon: gpio-fan: Get rid of the gpio alarm struct
Message-ID: <20171008143332.GA23820@roeck-us.net>
References: <20170925230911.20824-8-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170925230911.20824-8-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 26, 2017 at 01:09:09AM +0200, Linus Walleij wrote:
> There is no point in storing the GPIO alarm settings in their
> own struct so merge this into the main state container.
> 
> Convert the variables from "unsigned" to "unsigned int" to
> make checkpatch happy.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 38 ++++++++++++--------------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 000c8d2e0987..568ce4b25a9e 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -35,11 +35,6 @@
>  #include <linux/of_gpio.h>
>  #include <linux/thermal.h>
>  
> -struct gpio_fan_alarm {
> -	unsigned int	gpio;
> -	unsigned int	active_low;
> -};
> -
>  struct gpio_fan_speed {
>  	int rpm;
>  	int ctrl_val;
> @@ -60,7 +55,8 @@ struct gpio_fan_data {
>  	int			resume_speed;
>  #endif
>  	bool			pwm_enable;
> -	struct gpio_fan_alarm	*alarm;
> +	unsigned int		alarm_gpio;
> +	unsigned int		alarm_gpio_active_low;
>  	struct work_struct	alarm_work;
>  };
>  
> @@ -90,10 +86,9 @@ static ssize_t fan1_alarm_show(struct device *dev,
>  			       struct device_attribute *attr, char *buf)
>  {
>  	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
> -	struct gpio_fan_alarm *alarm = fan_data->alarm;
> -	int value = gpio_get_value_cansleep(alarm->gpio);
> +	int value = gpio_get_value_cansleep(fan_data->alarm_gpio);
>  
> -	if (alarm->active_low)
> +	if (fan_data->alarm_gpio_active_low)
>  		value = !value;
>  
>  	return sprintf(buf, "%d\n", value);
> @@ -106,13 +101,12 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
>  	int err;
>  	int alarm_irq;
>  	struct device *dev = fan_data->dev;
> -	struct gpio_fan_alarm *alarm = fan_data->alarm;
>  
> -	err = devm_gpio_request(dev, alarm->gpio, "GPIO fan alarm");
> +	err = devm_gpio_request(dev, fan_data->alarm_gpio, "GPIO fan alarm");
>  	if (err)
>  		return err;
>  
> -	err = gpio_direction_input(alarm->gpio);
> +	err = gpio_direction_input(fan_data->alarm_gpio);
>  	if (err)
>  		return err;
>  
> @@ -120,7 +114,7 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
>  	 * If the alarm GPIO don't support interrupts, just leave
>  	 * without initializing the fail notification support.
>  	 */
> -	alarm_irq = gpio_to_irq(alarm->gpio);
> +	alarm_irq = gpio_to_irq(fan_data->alarm_gpio);
>  	if (alarm_irq < 0)
>  		return 0;
>  
> @@ -335,7 +329,7 @@ static umode_t gpio_fan_is_visible(struct kobject *kobj,
>  	struct device *dev = container_of(kobj, struct device, kobj);
>  	struct gpio_fan_data *data = dev_get_drvdata(dev);
>  
> -	if (index == 0 && !data->alarm)
> +	if (index == 0 && !data->alarm_gpio)
>  		return 0;
>  	if (index > 0 && !data->ctrl)
>  		return 0;
> @@ -450,28 +444,20 @@ static int gpio_fan_get_of_data(struct gpio_fan_data *fan_data)
>  
>  	/* Alarm GPIO if one exists */
>  	if (of_gpio_named_count(np, "alarm-gpios") > 0) {
> -		struct gpio_fan_alarm *alarm;
>  		int val;
>  		enum of_gpio_flags flags;
>  
> -		alarm = devm_kzalloc(dev, sizeof(struct gpio_fan_alarm),
> -					GFP_KERNEL);
> -		if (!alarm)
> -			return -ENOMEM;
> -
>  		val = of_get_named_gpio_flags(np, "alarm-gpios", 0, &flags);
>  		if (val < 0)
>  			return val;
> -		alarm->gpio = val;
> -		alarm->active_low = flags & OF_GPIO_ACTIVE_LOW;
> -
> -		fan_data->alarm = alarm;
> +		fan_data->alarm_gpio = val;
> +		fan_data->alarm_gpio_active_low = flags & OF_GPIO_ACTIVE_LOW;
>  	}
>  
>  	/* Fill GPIO pin array */
>  	fan_data->num_ctrl = of_gpio_count(np);
>  	if (fan_data->num_ctrl <= 0) {
> -		if (fan_data->alarm)
> +		if (fan_data->alarm_gpio)
>  			return 0;
>  		dev_err(dev, "DT properties empty / missing");
>  		return -ENODEV;
> @@ -556,7 +542,7 @@ static int gpio_fan_probe(struct platform_device *pdev)
>  	mutex_init(&fan_data->lock);
>  
>  	/* Configure alarm GPIO if available. */
> -	if (fan_data->alarm) {
> +	if (fan_data->alarm_gpio) {
>  		err = fan_alarm_init(fan_data);
>  		if (err)
>  			return err;
