Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:43384 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933656AbdJXNR6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2017 09:17:58 -0400
Received: by mail-pf0-f193.google.com with SMTP id a8so19666835pfc.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2017 06:17:57 -0700 (PDT)
Subject: Re: [PATCH] tmp102: Fix first temperature reading
To: Jean Delvare <jdelvare@suse.de>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Ralf Goebel <ralf.goebel@imago-technologies.com>
References: <1508806526-28489-1-git-send-email-linux@roeck-us.net>
 <20171024092113.15eca700@endymion>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d44b5977-22e9-1a88-0775-a7e6b5c6bae6@roeck-us.net>
Date: Tue, 24 Oct 2017 06:17:55 -0700
MIME-Version: 1.0
In-Reply-To: <20171024092113.15eca700@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jean,

On 10/24/2017 12:21 AM, Jean Delvare wrote:
> Hi Guenter,
> 
> On Mon, 23 Oct 2017 17:55:26 -0700, Guenter Roeck wrote:
>> Commit 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read
>> delay") reduced the initial temperature read delay and made it dependent
>> on the chip's shutdown mode. If the chip was not in shutdown mode at probe,
>> the read delay no longer applies.
>>
>> This ignores the fact that the chip initialization changes the temperature
>> sensor resolution, and that the temperature register values change when
>> the resolution is changed. As a result, the reported temperature is twice
>> as high as the real temperature until the first temperature conversion
>> after the configuration change is complete. This can result in unexpected
>> behavior and, worst case, in a system shutdown. To fix the problem,
>> let's just always wait for a conversion to complete before reporting
>> a temperature.
>>
>> Fixes: 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read delay")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=197167
>> Reported-by: Ralf Goebel <ralf.goebel@imago-technologies.com>
>> Cc: Ralf Goebel <ralf.goebel@imago-technologies.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/hwmon/tmp102.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
>> index 5eafbaada795..1af1932a72db 100644
>> --- a/drivers/hwmon/tmp102.c
>> +++ b/drivers/hwmon/tmp102.c
>> @@ -268,14 +268,7 @@ static int tmp102_probe(struct i2c_client *client,
>>   		return err;
>>   	}
>>   
>> -	tmp102->ready_time = jiffies;
>> -	if (tmp102->config_orig & TMP102_CONF_SD) {
>> -		/*
>> -		 * Mark that we are not ready with data until the first
>> -		 * conversion is complete
>> -		 */
>> -		tmp102->ready_time += msecs_to_jiffies(CONVERSION_TIME_MS);
>> -	}
>> +	tmp102->ready_time = jiffies + msecs_to_jiffies(CONVERSION_TIME_MS);
>>   
>>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>>   							 tmp102,
> 
> Thanks for the quick fix. The change itself looks good but why remove
> the comment, which I think still retains its value?
> 
Good point. I'll add it back in before sending the patch upstream.

Thanks,
Guenter
