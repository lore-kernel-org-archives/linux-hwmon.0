Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44939 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670AbcEQNyr (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 17 May 2016 09:54:47 -0400
Subject: Re: [PATCH 1/1 v2] hwmon: add support for Sensirion SHT3x sensors
To: Pascal Sachs <pascalsachs@gmail.com>, jdelvare@suse.com
References: <1461573746-13767-1-git-send-email-pascalsachs@gmail.com>
 <5737D209.1020506@roeck-us.net> <573B1A3C.4020300@gmail.com>
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Frey <david.frey@sensirion.com>,
	Pascal Sachs <pascal.sachs@sensirion.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <573B2298.6020103@roeck-us.net>
Date: Tue, 17 May 2016 06:54:32 -0700
MIME-Version: 1.0
In-Reply-To: <573B1A3C.4020300@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Pascal,

On 05/17/2016 06:18 AM, Pascal Sachs wrote:
>
[ ... ]

>>> +While in periodic measure mode, read out of humidity and temperature
>>> values are
>>> +not supported. Nevertheless it is possible to read out the values
>>> with maximal
>>
>> Really ? I seem to be missing this in the datasheet. Section 4.4
>> suggests that
>> both are supported. Besides, this would be really odd - what would be
>> the point
>> of periodic mode (or any mode, for that matter) if it doesn't really
>> measure
>> anything ?
>
> When you start the periodic measurement, the sensor will measure
> independently
> in the background and keep up to 8 values in an internal buffer. Once
> the client
> reads out the buffer, the sensor will invalidate the buffer and
> therefore return
> an error on the I2C bus until at least one new measurement was generated.
>

Hope that doesn't mean that it reports old values if the result is not read.

> This feature is used to automatically set the alert bit according to the
> configured
> limits and hysteresis values.
>
> Our Product Manager for the SHT3x sensor told me to not handle this
> behavior in
> the driver by e.g. caching the last value, since it will confuse our
> customers when the
> hardware behaves differently then the driver.
>
> If you have an other opinion and would like to share it, I'm open for
> any input.

Caching is quite widely used in hwmon drivers if it is known that the chip
doesn't report new values faster than read. If the chip's periodic
measurement interval is set to, say, 500ms, it doesn't make sense
for the driver to try to read a new value less than 500ms after the previous
reading.

[ ... ]

>>
>>> +soft_reset:         Soft reset the internal state of the sensor,
>>> clear the
>>> +                    status register, clear the alert and switch back to
>>> +                    single shot mode
>>
>> Makes me really unhappy. It is not a standard attribute, there is no
>> clear
>> indication why it is needed, and it affects other attributes (mode)
>> without updating the command pointer, thus probably breaking things.
>>
>> In general, if the chip is that unstable that it needs to be reset
>> once in a while, that should be auto-detected if possible and be handled
>> automatically. A manual "please reset me" attribute is the worst possible
>> solution and should only be used if absolutely necessary.
>
> The soft_reset is actually not really needed. It's just a way for the
> user to
> clear his configuration. I will remove this interface if it makes you
> unhappy.

Please do.

[ ... ]

>>
>> Limit attributes without alarm attributes is kind of unusual.
>> Looking into the datasheet, the chip does support a status register
>> with alert bits. Any reason for not providing alert attributes ?
>>
> The alarm feature is only present in periodic mode. In this mode the sensor
> measures by itself without the influence of the user (or a program). If
> there
> is an alert, the sensor set the alert pin to high. As long as there is
> no e.g.
> watchdog mechanism in place which notifies the driver, we can not know
> when an alert happens without some sort of polling mechanism.
> During periodic measurement the sensor measures temperature and
> humidity without any interaction of the user.
>
Most drivers expect alarm attribute polling from user space. Some implement
an interrupt handler which notifies user space (eg gpio-fan). The alert pin
of your chip can be connected to an interrupt line, in which case it could
be used for that purpose.

> We can of course implement an alarm interface which asks the status
> register whenever it is called by the user.
>
> I can't find a humidity alarm flag in the documentation? Is there a
> reason for that or did nobody used this so far?

Nobody used it. No special reason. Feel free to start using it;
we can just add it to the ABI. We don't have humidityX_{min,max} and
humidityX_{min,max}_hyst documented either, so we should add those
to the ABI as well.

Thanks,
Guenter

