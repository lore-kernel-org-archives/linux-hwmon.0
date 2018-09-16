Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:40599 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726852AbeIPUTw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Sep 2018 16:19:52 -0400
Message-ID: <5B9E6F1F.5030908@huawei.com>
Date: Sun, 16 Sep 2018 22:56:31 +0800
From: zhong jiang <zhongjiang@huawei.com>
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
CC: <kronos.it@gmail.com>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Use PTR_ERR_OR_ZERO instead of reimplementing
 its function
References: <20180916004318.GA30797@roeck-us.net>
In-Reply-To: <20180916004318.GA30797@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 2018/9/16 8:43, Guenter Roeck wrote:
> On Tue, Sep 11, 2018 at 08:03:37PM +0800, zhong jiang wrote:
>> PTR_ERR_OR_ZERO has implemented the same function. We prefer to use
>> inlined function rather than code-opened implementation.
>>
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> Applied to hwmon-next. For future patches, please also refer to the
> affected driver in the Subject line, unless the change is in the
> subsystem core code.
Get it.  Thanks.

Sincerely,
zhong jiang
> Thanks,
> Guenter
>
>> ---
>>  drivers/hwmon/asus_atk0110.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
>> index a6636fe..a7cf008 100644
>> --- a/drivers/hwmon/asus_atk0110.c
>> +++ b/drivers/hwmon/asus_atk0110.c
>> @@ -1210,10 +1210,8 @@ static int atk_register_hwmon(struct atk_data *data)
>>  	data->hwmon_dev = hwmon_device_register_with_groups(dev, "atk0110",
>>  							    data,
>>  							    data->attr_groups);
>> -	if (IS_ERR(data->hwmon_dev))
>> -		return PTR_ERR(data->hwmon_dev);
>>  
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(data->hwmon_dev);
>>  }
>>  
>>  static int atk_probe_if(struct atk_data *data)
>> -- 
>> 1.7.12.4
>>
>
