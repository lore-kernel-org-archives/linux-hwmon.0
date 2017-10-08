Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56545 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbdJHOc3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Oct 2017 10:32:29 -0400
Date: Sun, 8 Oct 2017 07:32:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [6/9] hwmon: gpio-fan: Get rid of platform data struct
Message-ID: <20171008143226.GA5379@roeck-us.net>
References: <20170925230911.20824-7-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170925230911.20824-7-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 26, 2017 at 01:09:08AM +0200, Linus Walleij wrote:
> We are not passing the platform data struct into the driver from the
> outside, there is no point of having it around separately so instead
> of first populating the platform data struct and assigning the result
> into the same variables in the state container (struct gpio_fan_data)
> just assign the configuration from the device tree directly into the
> state container members.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 88 +++++++++++++++++-------------------------------
>  1 file changed, 30 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 55dbdb223e02..000c8d2e0987 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -45,18 +45,6 @@ struct gpio_fan_speed {
>  	int ctrl_val;
>  };
>  
> -struct gpio_fan_platform_data {
> -	int			num_ctrl;
> -	unsigned int		*ctrl;	/* fan control GPIOs. */
> -	struct gpio_fan_alarm	*alarm;	/* fan alarm GPIO. */
> -	/*
> -	 * Speed conversion array: rpm from/to GPIO bit field.
> -	 * This array _must_ be sorted in ascending rpm order.
> -	 */
> -	int			num_speed;
> -	struct gpio_fan_speed	*speed;
> -};
> -
>  struct gpio_fan_data {
>  	struct device		*dev;
>  	struct device		*hwmon_dev;
> @@ -113,14 +101,12 @@ static ssize_t fan1_alarm_show(struct device *dev,
>  
>  static DEVICE_ATTR_RO(fan1_alarm);
>  
> -static int fan_alarm_init(struct gpio_fan_data *fan_data,
> -			  struct gpio_fan_alarm *alarm)
> +static int fan_alarm_init(struct gpio_fan_data *fan_data)
>  {
>  	int err;
>  	int alarm_irq;
>  	struct device *dev = fan_data->dev;
> -
> -	fan_data->alarm = alarm;
> +	struct gpio_fan_alarm *alarm = fan_data->alarm;
>  
>  	err = devm_gpio_request(dev, alarm->gpio, "GPIO fan alarm");
>  	if (err)
> @@ -379,12 +365,11 @@ static const struct attribute_group *gpio_fan_groups[] = {
>  	NULL
>  };
>  
> -static int fan_ctrl_init(struct gpio_fan_data *fan_data,
> -			 struct gpio_fan_platform_data *pdata)
> +static int fan_ctrl_init(struct gpio_fan_data *fan_data)
>  {
>  	struct device *dev = fan_data->dev;
> -	int num_ctrl = pdata->num_ctrl;
> -	unsigned *ctrl = pdata->ctrl;
> +	int num_ctrl = fan_data->num_ctrl;
> +	unsigned int *ctrl = fan_data->ctrl;
>  	int i, err;
>  
>  	for (i = 0; i < num_ctrl; i++) {
> @@ -399,10 +384,6 @@ static int fan_ctrl_init(struct gpio_fan_data *fan_data,
>  			return err;
>  	}
>  
> -	fan_data->num_ctrl = num_ctrl;
> -	fan_data->ctrl = ctrl;
> -	fan_data->num_speed = pdata->num_speed;
> -	fan_data->speed = pdata->speed;
>  	fan_data->pwm_enable = true; /* Enable manual fan speed control. */
>  	fan_data->speed_index = get_fan_speed_index(fan_data);
>  	if (fan_data->speed_index < 0)
> @@ -456,21 +437,19 @@ static const struct thermal_cooling_device_ops gpio_fan_cool_ops = {
>  /*
>   * Translate OpenFirmware node properties into platform_data
>   */
> -static int gpio_fan_get_of_pdata(struct device *dev,
> -			    struct gpio_fan_platform_data *pdata)
> +static int gpio_fan_get_of_data(struct gpio_fan_data *fan_data)
>  {
> -	struct device_node *node;
>  	struct gpio_fan_speed *speed;
> +	struct device *dev = fan_data->dev;
> +	struct device_node *np = dev->of_node;
>  	unsigned *ctrl;
>  	unsigned i;
>  	u32 u;
>  	struct property *prop;
>  	const __be32 *p;
>  
> -	node = dev->of_node;
> -
>  	/* Alarm GPIO if one exists */
> -	if (of_gpio_named_count(node, "alarm-gpios") > 0) {
> +	if (of_gpio_named_count(np, "alarm-gpios") > 0) {
>  		struct gpio_fan_alarm *alarm;
>  		int val;
>  		enum of_gpio_flags flags;
> @@ -480,39 +459,39 @@ static int gpio_fan_get_of_pdata(struct device *dev,
>  		if (!alarm)
>  			return -ENOMEM;
>  
> -		val = of_get_named_gpio_flags(node, "alarm-gpios", 0, &flags);
> +		val = of_get_named_gpio_flags(np, "alarm-gpios", 0, &flags);
>  		if (val < 0)
>  			return val;
>  		alarm->gpio = val;
>  		alarm->active_low = flags & OF_GPIO_ACTIVE_LOW;
>  
> -		pdata->alarm = alarm;
> +		fan_data->alarm = alarm;
>  	}
>  
>  	/* Fill GPIO pin array */
> -	pdata->num_ctrl = of_gpio_count(node);
> -	if (pdata->num_ctrl <= 0) {
> -		if (pdata->alarm)
> +	fan_data->num_ctrl = of_gpio_count(np);
> +	if (fan_data->num_ctrl <= 0) {
> +		if (fan_data->alarm)
>  			return 0;
>  		dev_err(dev, "DT properties empty / missing");
>  		return -ENODEV;
>  	}
> -	ctrl = devm_kzalloc(dev, pdata->num_ctrl * sizeof(unsigned),
> -				GFP_KERNEL);
> +	ctrl = devm_kzalloc(dev, fan_data->num_ctrl * sizeof(unsigned int),
> +			    GFP_KERNEL);
>  	if (!ctrl)
>  		return -ENOMEM;
> -	for (i = 0; i < pdata->num_ctrl; i++) {
> +	for (i = 0; i < fan_data->num_ctrl; i++) {
>  		int val;
>  
> -		val = of_get_gpio(node, i);
> +		val = of_get_gpio(np, i);
>  		if (val < 0)
>  			return val;
>  		ctrl[i] = val;
>  	}
> -	pdata->ctrl = ctrl;
> +	fan_data->ctrl = ctrl;
>  
>  	/* Get number of RPM/ctrl_val pairs in speed map */
> -	prop = of_find_property(node, "gpio-fan,speed-map", &i);
> +	prop = of_find_property(np, "gpio-fan,speed-map", &i);
>  	if (!prop) {
>  		dev_err(dev, "gpio-fan,speed-map DT property missing");
>  		return -ENODEV;
> @@ -522,7 +501,7 @@ static int gpio_fan_get_of_pdata(struct device *dev,
>  		dev_err(dev, "gpio-fan,speed-map contains zero/odd number of entries");
>  		return -ENODEV;
>  	}
> -	pdata->num_speed = i / 2;
> +	fan_data->num_speed = i / 2;
>  
>  	/*
>  	 * Populate speed map
> @@ -530,12 +509,12 @@ static int gpio_fan_get_of_pdata(struct device *dev,
>  	 * this needs splitting into pairs to create gpio_fan_speed structs
>  	 */
>  	speed = devm_kzalloc(dev,
> -			pdata->num_speed * sizeof(struct gpio_fan_speed),
> +			fan_data->num_speed * sizeof(struct gpio_fan_speed),
>  			GFP_KERNEL);
>  	if (!speed)
>  		return -ENOMEM;
>  	p = NULL;
> -	for (i = 0; i < pdata->num_speed; i++) {
> +	for (i = 0; i < fan_data->num_speed; i++) {
>  		p = of_prop_next_u32(prop, p, &u);
>  		if (!p)
>  			return -ENODEV;
> @@ -545,7 +524,7 @@ static int gpio_fan_get_of_pdata(struct device *dev,
>  			return -ENODEV;
>  		speed[i].ctrl_val = u;
>  	}
> -	pdata->speed = speed;
> +	fan_data->speed = speed;
>  
>  	return 0;
>  }
> @@ -562,20 +541,13 @@ static int gpio_fan_probe(struct platform_device *pdev)
>  	struct gpio_fan_data *fan_data;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct gpio_fan_platform_data *pdata;
>  
>  	fan_data = devm_kzalloc(dev, sizeof(struct gpio_fan_data),
>  				GFP_KERNEL);
>  	if (!fan_data)
>  		return -ENOMEM;
>  
> -	pdata = devm_kzalloc(dev,
> -			     sizeof(struct gpio_fan_platform_data),
> -			     GFP_KERNEL);
> -	if (!pdata)
> -		return -ENOMEM;
> -
> -	err = gpio_fan_get_of_pdata(dev, pdata);
> +	err = gpio_fan_get_of_data(fan_data);
>  	if (err)
>  		return err;
>  
> @@ -584,17 +556,17 @@ static int gpio_fan_probe(struct platform_device *pdev)
>  	mutex_init(&fan_data->lock);
>  
>  	/* Configure alarm GPIO if available. */
> -	if (pdata->alarm) {
> -		err = fan_alarm_init(fan_data, pdata->alarm);
> +	if (fan_data->alarm) {
> +		err = fan_alarm_init(fan_data);
>  		if (err)
>  			return err;
>  	}
>  
>  	/* Configure control GPIOs if available. */
> -	if (pdata->ctrl && pdata->num_ctrl > 0) {
> -		if (!pdata->speed || pdata->num_speed <= 1)
> +	if (fan_data->ctrl && fan_data->num_ctrl > 0) {
> +		if (!fan_data->speed || fan_data->num_speed <= 1)
>  			return -EINVAL;
> -		err = fan_ctrl_init(fan_data, pdata);
> +		err = fan_ctrl_init(fan_data);
>  		if (err)
>  			return err;
>  	}
