Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51002 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbcFINZW (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Jun 2016 09:25:22 -0400
Subject: Re: [PATCH] added kernel module for FTS sensor chip "Teutates"
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <1464684950-31113-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
 <57526C5B.9000104@roeck-us.net> <1465463437.4558.6.camel@ts.fujitsu.com>
Cc: "thilo@cestona.ro" <thilo@cestona.ro>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57596E3E.30705@roeck-us.net>
Date: Thu, 9 Jun 2016 06:25:18 -0700
MIME-Version: 1.0
In-Reply-To: <1465463437.4558.6.camel@ts.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/09/2016 02:13 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> Hey Guenter,
>
>>> +static int ftsteutates_detect(struct i2c_client *client,
>>> +		struct i2c_board_info *info)
>>> +{
>>> +	int val = ftsteutates_read_byte(client, FTSTEUTATES_DEVICE_ID_REG);
>>> +
>>> +	/* Baseboard Management Controller */
>>> +	if ((val & 0xF0) == 0x10) {
>>> +		switch (val & 0x0F) {
>>> +		case 0x01:
>>> +			strlcpy(info->type, ftsteutates_id[teutates].name,
>>> +			I2C_NAME_SIZE);
>>> +			info->flags = 0;
>>> +			return 0;
>>> +		}
>>> +	}
>> This is not sufficient for a detect function; it would result in many false
>> positives. Please drop it unless a much better means to detect the chip
>> is available.
>>
> Would it be sufficient, if I use dmi_name_in_vendors and check for Fujitsu? So the
> BMC check will only be used on FJ Boards?
>
> The problem is, that the firmware itself has only this device ID register.
> For future revisions I'll ask for more possibilities to identify the chip but for now
> I need to use other methods.
>

You don't need a detect function to start with. Using DMI in an i2c driver
is not appropriate either; an i2c driver is expected to be board agnostic.

If you can determine that the chip is present in the system using DMI, you
would normally have a second (platform)) driver which detects the platform
and instantiate the device, using either i2c_new_device() or
i2c_register_board_info(). See  Documentation/i2c/instantiating-devices
for more details.

Hope this helps,
Guenter

