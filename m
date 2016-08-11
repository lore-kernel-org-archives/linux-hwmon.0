Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41302 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbcHKExA (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 11 Aug 2016 00:53:00 -0400
Subject: Re: I2c Detect Function for Teutates HWMon
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <1470812719.12983.6.camel@ts.fujitsu.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8006ae93-cc49-20aa-5eec-99d511a1d5b4@roeck-us.net>
Date: Wed, 10 Aug 2016 21:52:52 -0700
MIME-Version: 1.0
In-Reply-To: <1470812719.12983.6.camel@ts.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/10/2016 12:08 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> Hey!
>
> The Firmware developer of the Teutates Chip will implement more "detect"-register so the ftsteutates module can add a i2c detect function.
>
> Would it be sufficient to have 3 register with specific content (0x54,0x54,0x54) plus the Device ID Reg shown below to identify the chip?
> Or do you advise another mechanism to identify it?
>

Registers should have different values. One or two should reflect a Fujitsu manufacturer Id,
one should reflect the device Id. 4 bit for the device is a bit limited; I would prefer device
and version in separate registers. It would also be great if you could use common
manufacturer/device ID registers (such as 0xfd for the device ID and 0xfe/0xff for the
manufacturer ID).

I see that 0x10CF is used as Fujitsu PCI Id. Unless Fujitsu has a well defined I2C
Manufacturer Id, maybe you could use that in two registers (0xfe/0xff).

Thanks,
Guenter

>>> +static int ftsteutates_detect(struct i2c_client *client,
>>> +             struct i2c_board_info *info)
>>> +{
>>> +     int val = ftsteutates_read_byte(client, FTSTEUTATES_DEVICE_ID_REG);
>>> +
>>> +     /* Baseboard Management Controller */
>>> +     if ((val & 0xF0) == 0x10) {
>>> +             switch (val & 0x0F) {
>>> +             case 0x01:
>>> +                     strlcpy(info->type, ftsteutates_id[teutates].name,
>>> +                     I2C_NAME_SIZE);
>>> +                     info->flags = 0;
>>> +                     return 0;
>>> +             }
>>> +     }
>>> +     return -ENODEV;
>>> +}
>>
>> This is not sufficient for a detect function; it would result in many false
>> positives. Please drop it unless a much better means to detect the chip
>> is available.
>>
>
>
> Cheers,
> Thilo
>

