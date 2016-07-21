Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34067 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553AbcGUObo (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 21 Jul 2016 10:31:44 -0400
Subject: Re: [patch] Disable PMBus status check for DPS400 PSU controller
To: Vadim Pasternak <vadimp@mellanox.com>
References: <1469112953-77032-1-git-send-email-vadimp@mellanox.com>
 <5790D10A.9070404@roeck-us.net>
 <AM5PR0501MB209769770BC712B75FB7F768A2090@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5790DCBD.3030903@roeck-us.net>
Date: Thu, 21 Jul 2016 07:31:25 -0700
MIME-Version: 1.0
In-Reply-To: <AM5PR0501MB209769770BC712B75FB7F768A2090@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/21/2016 07:08 AM, Vadim Pasternak wrote:

[ ... ]

>>>    };
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c
>>> b/drivers/hwmon/pmbus/pmbus_core.c
>>> index ba59eae..3d98070 100644
>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>> @@ -1931,8 +1931,11 @@ EXPORT_SYMBOL_GPL(pmbus_do_probe);
>>>    int pmbus_do_remove(struct i2c_client *client)
>>>    {
>>>    	struct pmbus_data *data = i2c_get_clientdata(client);
>>> +	const struct pmbus_platform_data *pdata =
>>> +				dev_get_platdata(&client->dev);
>>>    	hwmon_device_unregister(data->hwmon_dev);
>>>    	kfree(data->group.attrs);
>>> +	kfree(pdata);
>
> So, if I use in allocation
>                 pdata = devm_kzalloc(&client->dev,
>                                      sizeof(struct pmbus_platform_data),
>                                      GFP_KERNEL);
> I also can drop the above three lines, right?
>

Correct.

Guenter

