Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57441 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932414AbcK1T6a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2016 14:58:30 -0500
Date: Mon, 28 Nov 2016 11:58:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
Message-ID: <20161128195825.GA10709@roeck-us.net>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
 <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 28, 2016 at 11:40:42AM -0800, John Muir wrote:
> 
> > On Nov 27, 2016, at 4:19 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > On 11/26/2016 09:15 PM, John Muir wrote:
> >> Add support for the TI TMP108 temperature sensor with some device
> >> configuration parameters.
> >> +- ti,alert-active-high : (boolean) make the alert pin active-high instead of
> >> +      the default active-low.
> > 
> > The driver doesn't support interrupts/alerts. Do those properties really add value ?
> Getting ahead of myself. I will create a patch for this in the future.
> 
> >> +static void tmp108_update_ready_time(struct tmp108 *tmp108)
> >> +{
> >> +	tmp108->ready_time = jiffies;
> >> +	if ((tmp108->config & TMP108_CONF_MODE_MASK)
> >> +	    == TMP108_MODE_CONTINUOUS) {
> > 
> > Don't you want a "!" here ? Presumably the delay is only needed
> > if the original configuration was not for continuous mode.
> > 
> >> +		tmp108->ready_time +=
> >> +			msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
> >> +	}
> >> +}
> The delay is required for both really. When the device is set into continuous mode it starts converting and the first temperature is ready (just under) 30ms later.
> 

The datasheet states, though, that the chip will start converting as soon
as the device powers up. The kernel would have to start really fast after that
to have to wait another 30 ms.

The current code ends up waiting if it doesn't have to (because it waits
if the chip was originally configured for continuous mode), and not waiting
if it has to (because the chip was not configured for continuous mode),
which doesn't seem to be such a good idea.

> For the (unsupported at this time) one-shot mode, there would likewise be a delay, but I was envisioning having the requesting task sleep while waiting for the data to be ready, rather than get an -EAGAIN until the data is ready. 
> 

We had that discussion before; the thermal subsystem doesn't like to be kept
waiting. You would end up adding a lot of complexity for very little gain.
It might make more sense to consider implementing runtime idle support
instead of one-shot mode if power consumption is a concern.

> >> +	hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
> >> +						      tmp108, tmp108_groups);
> > 
> > Please consider using the devm_ function here.
> > 
> >> +	if (IS_ERR(hwmon_dev)) {
> >> +		dev_dbg(dev, "unable to register hwmon device\n");
> >> +		return PTR_ERR(hwmon_dev);
> >> +	}
> >> +
> >> +	tmp108->hwmon_dev = hwmon_dev;
> >> +	tmp108->tz = thermal_zone_of_sensor_register(hwmon_dev, 0, hwmon_dev,
> >> +						     &tmp108_of_thermal_ops);
> >> +	if (IS_ERR(tmp108->tz))
> >> +		return PTR_ERR(tmp108->tz);
> > 
> > hwmon device not unregistered here. That would be fixed by using the devm
> > function above.
> > 
> For the above two registrations and .remove function, I was worried that there would be an order problem between the i2c->remove and the device-managed cleanup. I’ll get deeper into that code to determine if that is a problem.
> 

The thermal sensor registration will be removed first (in the remove function).
devm_ functions are all unregistered / removed after the remove function was
called (in the order of the devm_ call). Otherwise you would have trouble
with devm_kzalloc() as well.

Note that my followup-patch had a problem with the minimum hysteresis
temperature; it needs to be higher than the lower limit, not lower.

Thanks,
Guenter
