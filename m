Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48725 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbcJZEW7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Oct 2016 00:22:59 -0400
Subject: Re: [PATCH] lm87: Use hwmon to create the sysfs groups
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
References: <20161025232621.GB20339@obsidianresearch.com>
 <db1b73af-8560-0739-a873-16774eed2a12@roeck-us.net>
 <20161026025428.GB4929@obsidianresearch.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5732db06-c5e5-9300-b7ff-b6998dd45bce@roeck-us.net>
Date: Tue, 25 Oct 2016 21:22:57 -0700
MIME-Version: 1.0
In-Reply-To: <20161026025428.GB4929@obsidianresearch.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/25/2016 07:54 PM, Jason Gunthorpe wrote:
> On Tue, Oct 25, 2016 at 06:50:01PM -0700, Guenter Roeck wrote:
>>> +
>>> +	const struct attribute_group *attr_groups[5];
>>
>> There can be up to 5 active groups total, so this array needs to have
>> 6 entries (it needs to be NULL_terminated).
>
> Agh right, I forgot about that. I will send a v2
>
>>> {
>>> 	struct lm87_data *data = i2c_get_clientdata(client);
>>>
>>> -	hwmon_device_unregister(data->hwmon_dev);
>>> -	lm87_remove_files(client);
>>> -
>>> 	lm87_write_value(client, LM87_REG_CONFIG, data->config);
>>
>> Strictly speaking this is now racy: The sysfs attributes still exist here,
>> meaning the chip can still be accessed. Consider using devm_add_action();
>> then you can drop the remove function entirely, and simplify error cleanup
>> in the probe function.
>
> I guess, but that is very obscure. If you unload the driver while
> monitoring it with sysfs and the boot firmware left the chip in the
> low power state then a sysfs right might race and return garbage..
>
Exactly my point.

> I can switch it to use hwmon_device_register_with_groups and put the
> hwmon_device_unregister back - I'm not sure wrapping the write in devm
> would be a simplification..
>

Sure, that is a possibility. I personally prefer devm_add_action().
Effectively you claim that devm_add_action() would not add value,
meaning there are - as of today - 67 calls in the kernel which don't add
value. I'll leave that up to you, though - not worth arguing about.

Thanks,
Guenter

