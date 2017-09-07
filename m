Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:37261 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752200AbdIGPK4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Sep 2017 11:10:56 -0400
Received: by mail-pg0-f68.google.com with SMTP id v5so521pgn.4
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Sep 2017 08:10:56 -0700 (PDT)
Date: Thu, 7 Sep 2017 08:10:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Davide Hug <d@videhug.ch>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: hwmon/sht15: gpio irq problem
Message-ID: <20170907151053.GA15047@roeck-us.net>
References: <20170906235001.d54617b600ae192ffc0cf206@videhug.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170906235001.d54617b600ae192ffc0cf206@videhug.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 06, 2017 at 11:50:01PM +0200, Davide Hug wrote:
> Hello,
> 
> the problem is that hwmon/sht15 requests a GPIO line as IRQ and later switches
> the same GPIO line from input to output. This is not allowed by gpiolib. (The
> driver does this because the serial data line is used for a data ready signal)
> 
> I asked about this on linux-gpio[1] and there it was suggested to use "timer
> based polling" instead of IRQs. Since my original question went in a completely
> different direction I start a new thread here.
> 
> Below are my two propositions. The first using timer based polling. The second
> fixing the issues with GPIO IRQs in the current driver.
> 
> Since I'm new to kernel drivers any feedback is much appreciated but my
> questions are:
> 
>   - Did I get "timer based polling" right?

It appears too complex. If you poll anyway, might as well use a simple loop and
either msleep or better usleep_range() to sleep, with a jiffies based timeout.
I don't see the benefit of using timer based polling, except that it adds a lot
of complexity. If you want to do that, you'll have to explain why it is better
than

	while (!timed out) {
		check_if_done();
		if (done)
			return result;
		sleep();
	}


>   - Is my fixed irq solution viable?

Seems weird. Definitely don't used devm_ functions to request and release
interrupts - those are meant only to be used if the release happpens
automatically.

>   - Which solution is preferable?

Neither. If the gpio subsystem does not support interrupts on
bidirectional gpio pins, it sould really refuse to change direction
on a pin which has an interrupt assigned to it. But of course that does not
help. However, since it does not support interrupts on such pins, it seems
risky to rely on it even temporarily (while the pin is configured as input).
Repeatedly requesting and releasing interrupts is expensive and may have
undesired side effects. I am not really interested testing the interrupt
subsystem with high frequency interrupt request/release operations.

>   - How to choose the polling interval?

Datasheet ? One solution might be to have an initial long sleep based
on a response time from the datasheet, then smaller sleeps for subsequent
polls.

Guenter

> 
> Thanks,
> Davide
> 
> [1]: http://www.spinics.net/lists/linux-gpio/msg24019.html
> 
> 
> ## Using timer based polling
> 
> 
> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index e4d642b673c6..0b8e039aa1f2 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -16,8 +16,6 @@
>   * For further information, see the Documentation/hwmon/sht15 file.
>   */
>  
> -#include <linux/interrupt.h>
> -#include <linux/irq.h>
>  #include <linux/gpio.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -32,9 +30,9 @@
>  #include <linux/err.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> -#include <linux/atomic.h>
>  #include <linux/bitrev.h>
>  #include <linux/of_gpio.h>
> +#include <linux/completion.h>
>  
>  /* Commands */
>  #define SHT15_MEASURE_TEMP		0x03
> @@ -55,12 +53,15 @@
>  #define SHT15_STATUS_HEATER		0x04
>  #define SHT15_STATUS_LOW_BATTERY	0x40
>  
> +/* Polling timer interval */
> +/* TODO: what should I choose here? */
> +#define POLLING_TIMER_INTERVAL		10	/* (msecs)*/
> +
>  /* List of supported chips */
>  enum sht15_chips { sht10, sht11, sht15, sht71, sht75 };
>  
>  /* Actions the driver may be doing */
>  enum sht15_state {
> -	SHT15_READING_NOTHING,
>  	SHT15_READING_TEMP,
>  	SHT15_READING_HUMID
>  };
> @@ -123,7 +124,6 @@ static const u8 sht15_crc8_table[] = {
>  /**
>   * struct sht15_data - device instance specific data
>   * @pdata:		platform data (gpio's etc).
> - * @read_work:		bh of interrupt handler.
>   * @wait_queue:		wait queue for getting values from device.
>   * @val_temp:		last temperature value read from device.
>   * @val_humid:		last humidity value read from device.
> @@ -131,6 +131,8 @@ static const u8 sht15_crc8_table[] = {
>   * @checksum_ok:	last value read from the device passed CRC validation.
>   * @checksumming:	flag used to enable the data validation with CRC.
>   * @state:		state identifying the action the driver is doing.
> + * @polling_timer:	timer to poll for the sensors measurement-ready signal.
> + * @measurement_ready:	completion indicating measurement data ready to be retrived.
>   * @measurements_valid:	are the current stored measures valid (start condition).
>   * @status_valid:	is the current stored status valid (start condition).
>   * @last_measurement:	time of last measure.
> @@ -147,11 +149,9 @@ static const u8 sht15_crc8_table[] = {
>   *			obtained from the regulator and so any calculations
>   *			based upon it will be invalid.
>   * @update_supply_work:	work struct that is used to update the supply_uv.
> - * @interrupt_handled:	flag used to indicate a handler has been scheduled.
>   */
>  struct sht15_data {
>  	struct sht15_platform_data	*pdata;
> -	struct work_struct		read_work;
>  	wait_queue_head_t		wait_queue;
>  	uint16_t			val_temp;
>  	uint16_t			val_humid;
> @@ -159,6 +159,8 @@ struct sht15_data {
>  	bool				checksum_ok;
>  	bool				checksumming;
>  	enum sht15_state		state;
> +	struct timer_list		polling_timer;
> +	struct completion		measurement_ready;
>  	bool				measurements_valid;
>  	bool				status_valid;
>  	unsigned long			last_measurement;
> @@ -171,7 +173,6 @@ struct sht15_data {
>  	int				supply_uv;
>  	bool				supply_uv_valid;
>  	struct work_struct		update_supply_work;
> -	atomic_t			interrupt_handled;
>  };
>  
>  /**
> @@ -441,6 +442,57 @@ static int sht15_send_status(struct sht15_data *data, u8 status)
>  	return 0;
>  }
>  
> +static int sht15_read_data(struct sht15_data *data)
> +{
> +	uint16_t val = 0;
> +	u8 dev_checksum = 0;
> +	u8 checksum_vals[3];
> +	int ret;
> +
> +	/* Read the data back from the device */
> +	val = sht15_read_byte(data);
> +	val <<= 8;
> +	ret = sht15_ack(data);
> +	if (ret)
> +		return ret;
> +	val |= sht15_read_byte(data);
> +
> +	if (data->checksumming) {
> +		/*
> +		 * Ask the device for a checksum and read it back.
> +		 * Note: the device sends the checksum byte reversed.
> +		 */
> +		ret = sht15_ack(data);
> +		if (ret)
> +			return ret;
> +		dev_checksum = bitrev8(sht15_read_byte(data));
> +		checksum_vals[0] = (data->state == SHT15_READING_TEMP) ?
> +			SHT15_MEASURE_TEMP : SHT15_MEASURE_RH;
> +		checksum_vals[1] = (u8) (val >> 8);
> +		checksum_vals[2] = (u8) val;
> +		data->checksum_ok
> +			= (sht15_crc8(data, checksum_vals, 3) == dev_checksum);
> +	}
> +
> +	/* Tell the device we are done */
> +	ret = sht15_end_transmission(data);
> +	if (ret)
> +		return ret;
> +
> +	switch (data->state) {
> +	case SHT15_READING_TEMP:
> +		data->val_temp = val;
> +		break;
> +	case SHT15_READING_HUMID:
> +		data->val_humid = val;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * sht15_update_status() - get updated status register from device if too old
>   * @data:	device instance specific data.
> @@ -523,6 +575,7 @@ static int sht15_measurement(struct sht15_data *data,
>  {
>  	int ret;
>  	u8 previous_config;
> +	unsigned long timeout;
>  
>  	ret = sht15_send_cmd(data, command);
>  	if (ret)
> @@ -531,29 +584,26 @@ static int sht15_measurement(struct sht15_data *data,
>  	ret = gpio_direction_input(data->pdata->gpio_data);
>  	if (ret)
>  		return ret;
> -	atomic_set(&data->interrupt_handled, 0);
> -
> -	enable_irq(gpio_to_irq(data->pdata->gpio_data));
> -	if (gpio_get_value(data->pdata->gpio_data) == 0) {
> -		disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
> -		/* Only relevant if the interrupt hasn't occurred. */
> -		if (!atomic_read(&data->interrupt_handled))
> -			schedule_work(&data->read_work);
> -	}
> -	ret = wait_event_timeout(data->wait_queue,
> -				 (data->state == SHT15_READING_NOTHING),
> -				 msecs_to_jiffies(timeout_msecs));
> -	if (data->state != SHT15_READING_NOTHING) { /* I/O error occurred */
> -		data->state = SHT15_READING_NOTHING;
> -		return -EIO;
> -	} else if (ret == 0) { /* timeout occurred */
> -		disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
> +
> +	reinit_completion(&data->measurement_ready);
> +	ret = mod_timer(&data->polling_timer,
> +			jiffies + msecs_to_jiffies(POLLING_TIMER_INTERVAL));
> +	if (ret)
> +		return ret;
> +	timeout = wait_for_completion_timeout(&data->measurement_ready,
> +					      msecs_to_jiffies(timeout_msecs));
> +	if (timeout == 0) { /* timeout occurred */
> +		del_timer(&data->polling_timer);
>  		ret = sht15_connection_reset(data);
>  		if (ret)
>  			return ret;
>  		return -ETIME;
>  	}
>  
> +	ret = sht15_read_data(data);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 *  Perform checksum validation on the received data.
>  	 *  Specification mentions that in case a checksum verification fails,
> @@ -803,83 +853,16 @@ static const struct attribute_group sht15_attr_group = {
>  	.attrs = sht15_attrs,
>  };
>  
> -static irqreturn_t sht15_interrupt_fired(int irq, void *d)
> +static void poll_measurement_ready(unsigned long arg)
>  {
> -	struct sht15_data *data = d;
> -
> -	/* First disable the interrupt */
> -	disable_irq_nosync(irq);
> -	atomic_inc(&data->interrupt_handled);
> -	/* Then schedule a reading work struct */
> -	if (data->state != SHT15_READING_NOTHING)
> -		schedule_work(&data->read_work);
> -	return IRQ_HANDLED;
> -}
> -
> -static void sht15_bh_read_data(struct work_struct *work_s)
> -{
> -	uint16_t val = 0;
> -	u8 dev_checksum = 0;
> -	u8 checksum_vals[3];
> -	struct sht15_data *data
> -		= container_of(work_s, struct sht15_data,
> -			       read_work);
> +	struct sht15_data *data = (struct sht15_data *)arg;
>  
> -	/* Firstly, verify the line is low */
> -	if (gpio_get_value(data->pdata->gpio_data)) {
> -		/*
> -		 * If not, then start the interrupt again - care here as could
> -		 * have gone low in meantime so verify it hasn't!
> -		 */
> -		atomic_set(&data->interrupt_handled, 0);
> -		enable_irq(gpio_to_irq(data->pdata->gpio_data));
> -		/* If still not occurred or another handler was scheduled */
> -		if (gpio_get_value(data->pdata->gpio_data)
> -		    || atomic_read(&data->interrupt_handled))
> -			return;
> -	}
> -
> -	/* Read the data back from the device */
> -	val = sht15_read_byte(data);
> -	val <<= 8;
> -	if (sht15_ack(data))
> -		goto wakeup;
> -	val |= sht15_read_byte(data);
> -
> -	if (data->checksumming) {
> -		/*
> -		 * Ask the device for a checksum and read it back.
> -		 * Note: the device sends the checksum byte reversed.
> -		 */
> -		if (sht15_ack(data))
> -			goto wakeup;
> -		dev_checksum = bitrev8(sht15_read_byte(data));
> -		checksum_vals[0] = (data->state == SHT15_READING_TEMP) ?
> -			SHT15_MEASURE_TEMP : SHT15_MEASURE_RH;
> -		checksum_vals[1] = (u8) (val >> 8);
> -		checksum_vals[2] = (u8) val;
> -		data->checksum_ok
> -			= (sht15_crc8(data, checksum_vals, 3) == dev_checksum);
> -	}
> -
> -	/* Tell the device we are done */
> -	if (sht15_end_transmission(data))
> -		goto wakeup;
> -
> -	switch (data->state) {
> -	case SHT15_READING_TEMP:
> -		data->val_temp = val;
> -		break;
> -	case SHT15_READING_HUMID:
> -		data->val_humid = val;
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	data->state = SHT15_READING_NOTHING;
> -wakeup:
> -	wake_up(&data->wait_queue);
> +	/* Check if the sensor is still measuring */
> +	if (gpio_get_value(data->pdata->gpio_data))
> +		mod_timer(&data->polling_timer,
> +			  jiffies + msecs_to_jiffies(POLLING_TIMER_INTERVAL));
> +	else
> +		complete(&data->measurement_ready);
>  }
>  
>  static void sht15_update_voltage(struct work_struct *work_s)
> @@ -970,7 +953,6 @@ static int sht15_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	INIT_WORK(&data->read_work, sht15_bh_read_data);
>  	INIT_WORK(&data->update_supply_work, sht15_update_voltage);
>  	platform_set_drvdata(pdev, data);
>  	mutex_init(&data->read_lock);
> @@ -1044,16 +1026,11 @@ static int sht15_probe(struct platform_device *pdev)
>  		goto err_release_reg;
>  	}
>  
> -	ret = devm_request_irq(&pdev->dev, gpio_to_irq(data->pdata->gpio_data),
> -			       sht15_interrupt_fired,
> -			       IRQF_TRIGGER_FALLING,
> -			       "sht15 data",
> -			       data);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get irq for data line\n");
> -		goto err_release_reg;
> -	}
> -	disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
> +	/* Setup measurement-ready polling */
> +	init_completion(&data->measurement_ready);
> +	setup_timer(&data->polling_timer, poll_measurement_ready,
> +		    (unsigned long)data);
> +
>  	ret = sht15_connection_reset(data);
>  	if (ret)
>  		goto err_release_reg;
> @@ -1101,6 +1078,7 @@ static int sht15_remove(struct platform_device *pdev)
>  	 * prevent new ones beginning
>  	 */
>  	mutex_lock(&data->read_lock);
> +	del_timer(&data->polling_timer);
>  	if (sht15_soft_reset(data)) {
>  		mutex_unlock(&data->read_lock);
>  		return -EFAULT;
> 
> 
> 
> 
> 
> 
> ## Fixing the current driver using irqs
> 
> 
> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index e4d642b673c6..d4081c58c33d 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -510,6 +510,19 @@ static int sht15_update_status(struct sht15_data *data)
>  	return ret;
>  }
>  
> +static irqreturn_t sht15_interrupt_fired(int irq, void *d)
> +{
> +	struct sht15_data *data = d;
> +
> +	/* First disable the interrupt */
> +	disable_irq_nosync(irq);
> +	atomic_inc(&data->interrupt_handled);
> +	/* Then schedule a reading work struct */
> +	if (data->state != SHT15_READING_NOTHING)
> +		schedule_work(&data->read_work);
> +	return IRQ_HANDLED;
> +}
> +
>  /**
>   * sht15_measurement() - get a new value from device
>   * @data:		device instance specific data
> @@ -533,7 +546,16 @@ static int sht15_measurement(struct sht15_data *data,
>  		return ret;
>  	atomic_set(&data->interrupt_handled, 0);
>  
> -	enable_irq(gpio_to_irq(data->pdata->gpio_data));
> +	ret = devm_request_irq(data->dev, gpio_to_irq(data->pdata->gpio_data),
> +			       sht15_interrupt_fired,
> +			       IRQF_TRIGGER_FALLING,
> +			       "sht15 data",
> +			       data);
> +	if (ret) {
> +		dev_err(data->dev, "failed to get irq for data line\n");
> +		return ret;
> +	}
> +
>  	if (gpio_get_value(data->pdata->gpio_data) == 0) {
>  		disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
>  		/* Only relevant if the interrupt hasn't occurred. */
> @@ -548,6 +570,8 @@ static int sht15_measurement(struct sht15_data *data,
>  		return -EIO;
>  	} else if (ret == 0) { /* timeout occurred */
>  		disable_irq_nosync(gpio_to_irq(data->pdata->gpio_data));
> +		devm_free_irq(data->dev, gpio_to_irq(data->pdata->gpio_data), data);
> +
>  		ret = sht15_connection_reset(data);
>  		if (ret)
>  			return ret;
> @@ -803,19 +827,6 @@ static const struct attribute_group sht15_attr_group = {
>  	.attrs = sht15_attrs,
>  };
>  
> -static irqreturn_t sht15_interrupt_fired(int irq, void *d)
> -{
> -	struct sht15_data *data = d;
> -
> -	/* First disable the interrupt */
> -	disable_irq_nosync(irq);
> -	atomic_inc(&data->interrupt_handled);
> -	/* Then schedule a reading work struct */
> -	if (data->state != SHT15_READING_NOTHING)
> -		schedule_work(&data->read_work);
> -	return IRQ_HANDLED;
> -}
> -
>  static void sht15_bh_read_data(struct work_struct *work_s)
>  {
>  	uint16_t val = 0;
> @@ -839,6 +850,7 @@ static void sht15_bh_read_data(struct work_struct *work_s)
>  			return;
>  	}
>  
> +	devm_free_irq(data->dev, gpio_to_irq(data->pdata->gpio_data), data);
>  	/* Read the data back from the device */
>  	val = sht15_read_byte(data);
>  	val <<= 8;
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
