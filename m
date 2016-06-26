Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60627 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752333AbcFZOCN (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 26 Jun 2016 10:02:13 -0400
Subject: Re: [PATCH v2 3/5] hwmon: (tmp102) Improve handling of initial read
 delay
To: Nishanth Menon <nm@ti.com>, Jean Delvare <jdelvare@suse.com>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
 <1466908825-14222-3-git-send-email-linux@roeck-us.net>
 <576FD940.4070102@ti.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eduardo Valentin <edubezval@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <576FE062.1070605@roeck-us.net>
Date: Sun, 26 Jun 2016 07:02:10 -0700
MIME-Version: 1.0
In-Reply-To: <576FD940.4070102@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/26/2016 06:31 AM, Nishanth Menon wrote:
> On 06/25/2016 09:40 PM, Guenter Roeck wrote:
> [...]
>>   /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
>> @@ -78,8 +82,16 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
>>   	struct tmp102 *tmp102 = dev_get_drvdata(dev);
>>   	struct i2c_client *client = tmp102->client;
>>
>> +	/* Is it too early to return a conversion ? */
>> +	if (time_before(jiffies, tmp102->ready_time)) {
>> +		unsigned long sleeptime = tmp102->ready_time - jiffies;
>> +
>> +		msleep(jiffies_to_msecs(sleeptime));
>> +	}
>> +
>
> While msleep can indeed work and simplify, in case of usage for
> example with thermal framework, if the data is not ready and we return
> -EAGAIN, it lets the thermal framework go and read other sensors
> instead of being blocked on the tmp102 conversion of data.
>

My thought was that returning -EAGAIN was more appropriate for the
1/3s wait time we had earlier. With 35ms, it is much more questionable
if we hit this condition in the first place than it was before,
and the impact if waiting is much less severe. Furthermore,
it is no longer unconditional but only occurs if the sensor
was in fact disabled.

But, yes, you have a point. I do prefer to wait, but if Rui and you
both agree that we should return -EAGAIN, I'll be happy to change
the code back to the old behavior.

Thanks,
Guenter

