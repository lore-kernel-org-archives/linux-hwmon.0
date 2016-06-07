Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60267 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751412AbcFGDS1 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2016 23:18:27 -0400
Subject: Re: [PATCH] added kernel module for FTS sensor chip "Teutates"
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <1464684950-31113-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
 <57526C5B.9000104@roeck-us.net> <1465204713.5580.25.camel@ts.fujitsu.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57563D00.3030005@roeck-us.net>
Date: Mon, 6 Jun 2016 20:18:24 -0700
MIME-Version: 1.0
In-Reply-To: <1465204713.5580.25.camel@ts.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/06/2016 02:21 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> Hey Guenter!
>
> Thanks for your patience and very detailed review!
> I will change the code to address all you hints where no discussion is needed.
> The others follow down here.
>
> On Fr, 2016-06-03 at 22:51 -0700, Guenter Roeck wrote:
>>> +#define FTSTEUTATES_WATCHDOG_RESOLUTION		   60
>>> +
>> 60 seconds (minimum) resolution ? Really ? This is very unusual.
> Will double check and talk to the hw guy.
>
>>> +static ssize_t show_fan_fault(struct device *dev,
>>> +	struct device_attribute *devattr, char *buf)
>>> +{
>>> +	int index = to_sensor_dev_attr(devattr)->index;
>>> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
>>> +
>>> +	return sprintf(buf, "%d\n", data->fan_present[index] == 1 ? 0 : 1);
>> A non-present fan does not indicate a fan fault.
> For me a fan fault was a not existing fan, as the alarm is handled via fan_alarm.
> What is the understanding of fan_fault and fan_alarm?
>

Some fan controllers can detect if a fan is faulty, for example if it consumes
power but does not turn. Unless you know for sure that a fan is faulty, don't
report that it is. A non-existing fan is definitely not faulty.

>>> +static ssize_t show_fan_source(struct device *dev,
>>> +		struct device_attribute *devattr, char *buf)
>>> +{
>>> +	int index = to_sensor_dev_attr(devattr)->index;
>>> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
>>> +
>>> +	if (data->fan_present[index]) {
>>> +		if (data->fan_source[index] == 0xFF)
>>> +			return sprintf(buf, "none\n");
>>> +		else
>>> +			return sprintf(buf, "%d\n", data->fan_source[index]);
>>> +	} else
>>> +		return sprintf(buf, "-\n");
>> is_visible() is your friend here. If the fan is not present, don't display
>> the attributes. If fan presence can change at runtime, just display 0.
> I just tried to change to presence at runtime (pull the fan cable),
> and it looks like I don't change. So I'll use the is_visible function of the
> sysfs entries.
>
>> In general though I don't understand what fan presence has to do with
>> the the fan source. What is the fan source anyway ? This is a non-standard
>> attribute, so you will need to explain why it is needed and what data
>> it provides in detail.
> The fan source represents the sensor number which actually defines the fan-speed.
> And the present or not present check is just to show another value if not present.
> Which will be unnecessary when the module uses is_visible.
>
>>> +SENSOR_DEVICE_ATTR(overall_uptime, S_IRUGO, show_overall_uptime, NULL, 0);
>>> +
>> I am not inclined to accept those (non-standard) attributes unless you make
>> a really good case why they are needed.
> The chip has this functionality, so I wanted to provide access to it.
> If this non-standard "export" of functionality disturbs anyone,
> I have no problem with removing it.
>
>>> +	err = watchdog_register_device(&ftsteutates_wdt);
>>> +	if (err) {
>>> +		dev_err(&client->dev,
>>> +			"Registering watchdog device failed: %d\n", err);
>>> +		goto exit_detach;
>>> +	}
>> I don't really like combining those drivers. There should really be a means
>> (other than mfd) to write two separate drivers for a chip like this.
>> I'll have to research that a bit.
> So export the watchdog part into a separate module?
> Is the i2c client forwarded to another driver if a driver which uses it was found?

An mfd driver would handle that. As I said, I'll have to research if there is an
easier way to do it.

Guenter

