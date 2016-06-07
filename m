Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32847 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932456AbcFGNaq (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2016 09:30:46 -0400
Subject: Re: [PATCH] added kernel module for FTS sensor chip "Teutates"
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <1464684950-31113-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
 <57526C5B.9000104@roeck-us.net> <1465204713.5580.25.camel@ts.fujitsu.com>
 <57563D00.3030005@roeck-us.net> <1465284992.18490.4.camel@ts.fujitsu.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5756CC7B.70501@roeck-us.net>
Date: Tue, 7 Jun 2016 06:30:35 -0700
MIME-Version: 1.0
In-Reply-To: <1465284992.18490.4.camel@ts.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/07/2016 12:39 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> On Mo, 2016-06-06 at 20:18 -0700, Guenter Roeck wrote:
>> On 06/06/2016 02:21 AM, thilo.cestonaro@ts.fujitsu.com wrote:
>>>
>>> Hey Guenter!
>>>
>>> Thanks for your patience and very detailed review!
>>> I will change the code to address all you hints where no discussion is needed.
>>> The others follow down here.
>>>
>>> On Fr, 2016-06-03 at 22:51 -0700, Guenter Roeck wrote:
>>>>
>>>>>
>>>>> +#define FTSTEUTATES_WATCHDOG_RESOLUTION		   60
>>>>> +
>>>> 60 seconds (minimum) resolution ? Really ? This is very unusual.
>>> Will double check and talk to the hw guy.
> There is a register which sets the resolution to 1sec. but it wasn't documented :(.
> So next "version" will have 1sec. resolution.
>
Almost sounds like a common Super-IO watchdog. There is usually a register
to set the resolution (seconds or minutes) and another register to set the
value (0-255). Drivers then usually select minutes if the requested timeout
is larger than 255 seconds.

>
>>>>> +static ssize_t show_fan_fault(struct device *dev,
>>>>> +	struct device_attribute *devattr, char *buf)
>>>>> +{
>>>>> +	int index = to_sensor_dev_attr(devattr)->index;
>>>>> +	struct ftsteutates_data *data = ftsteutates_update_device(dev);
>>>>> +
>>>>> +	return sprintf(buf, "%d\n", data->fan_present[index] == 1 ? 0 : 1);
>>>> A non-present fan does not indicate a fan fault.
>>> For me a fan fault was a not existing fan, as the alarm is handled via fan_alarm.
>>> What is the understanding of fan_fault and fan_alarm?
>>>
>> Some fan controllers can detect if a fan is faulty, for example if it consumes
>> power but does not turn. Unless you know for sure that a fan is faulty, don't
>> report that it is. A non-existing fan is definitely not faulty.
> About the presence register from Teutates Spec:
> The present-detection is done by checking the Fan-Speed.
> If the fan-speed is 0 or below fan-fault-speed all the time,
> the fan will be handled as not present. If the fan-speed is
> greater than fan-fault-speed, the fan is handled as present.
>
> So the presence is the faulty fan detection?
>

It pretty much means that you can not use the presence detect flag to indicate
a fan fault. I would suggest to just drop the flag.

Thanks,
Guenter

