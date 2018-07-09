Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:39838 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932806AbeGIQLJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jul 2018 12:11:09 -0400
Subject: Re: [PATCH] hwmon: rpi: fix link error against rpi_firmware module
To: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Jean Delvare <jdelvare@suse.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Vadim Pasternak <vadimp@mellanox.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180709154301.1781663-1-arnd@arndb.de>
 <20180709155509.GA4191@roeck-us.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4fe1c931-772c-0df0-6bf7-d32a495b5f80@gmail.com>
Date: Mon, 9 Jul 2018 09:11:04 -0700
MIME-Version: 1.0
In-Reply-To: <20180709155509.GA4191@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 07/09/2018 08:55 AM, Guenter Roeck wrote:
> On Mon, Jul 09, 2018 at 05:42:44PM +0200, Arnd Bergmann wrote:
>> Compile-testing without CONFIG_RASPBERRYPI_FIRMWARE is possible, but we
>> cannot build the rpi hwmon driver into the kernel if the firmware code
>> is a loadable module:
>>
>> drivers/hwmon/raspberrypi-hwmon.o: In function `rpi_hwmon_probe':
>> raspberrypi-hwmon.c:(.text+0x140): undefined reference to `rpi_firmware_property'
>> drivers/hwmon/raspberrypi-hwmon.o: In function `get_values_poll':
>> raspberrypi-hwmon.c:(.text+0x350): undefined reference to `rpi_firmware_property'
>>
>> This adapts the dependency to disallow that combination.
>>
>> Fixes: 3c493c885cf8 ("hwmon: Add support for RPi voltage sensor")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> This will have to go through Florian's tree.

Thanks for looping me in, I just sent the pull requests out Arnd, do you
want me to squash this into 3c493c885cf8 ("hwmon: Add support for RPi
voltage sensor") and resubmit?

Ray just informed me he has additional DTS stuff he would like to see
included.

> 
> Guenter
> 
>> ---
>>  drivers/hwmon/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index a4e5d3c9fc71..81da17a42dc9 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1322,7 +1322,7 @@ config SENSORS_PWM_FAN
>>  
>>  config SENSORS_RASPBERRYPI_HWMON
>>  	tristate "Raspberry Pi voltage monitor"
>> -	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
>> +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> 
> Is that one of the situations where "imply RASPBERRYPI_FIRMWARE"
> would be useful ?
> 
>>  	help
>>  	  If you say yes here you get support for voltage sensor on the
>>  	  Raspberry Pi.
>> -- 
>> 2.9.0
>>

-- 
Florian
