Return-Path: <robin.murphy@arm.com>
Return-path: <robin.murphy@arm.com>
Subject: Re: [PATCH RFC 3/6] hwmon: Add support for RPi voltage sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>,
 Eric Anholt <eric@anholt.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Phil Elwell <phil@raspberrypi.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
 <1526477827-10859-4-git-send-email-stefan.wahren@i2se.com>
 <b053c458-e50c-d4db-3a18-699327f021f3@arm.com>
 <20180516180549.GA22705@roeck-us.net>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b332332e-ccf2-2a1d-5c6f-d8cb88c3a212@arm.com>
Date: Wed, 16 May 2018 19:23:35 +0100
MIME-Version: 1.0
In-Reply-To: <20180516180549.GA22705@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

On 16/05/18 19:05, Guenter Roeck wrote:
> On Wed, May 16, 2018 at 02:51:49PM +0100, Robin Murphy wrote:
>> Hi Stefan,
>>
>> On 16/05/18 14:37, Stefan Wahren wrote:
>>> Currently there is no easy way to detect under-voltage conditions on a remote
>>> Raspberry Pi. This hwmon driver retrieves the state of the under-voltage sensor
>>> via mailbox interface. The handling based on Noralf's modifications to the
>>> downstream firmware driver. In case of an under-voltage condition only an entry
>>> is written to the kernel log.
>>>
>>> CC: "Noralf Trønnes" <noralf@tronnes.org>
>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>> ---
>>>   drivers/hwmon/Kconfig             |  10 ++
>>>   drivers/hwmon/Makefile            |   1 +
>>>   drivers/hwmon/raspberrypi-hwmon.c | 207 ++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 218 insertions(+)
>>>   create mode 100644 drivers/hwmon/raspberrypi-hwmon.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index 768aed5..7f935cf 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -1298,6 +1298,16 @@ config SENSORS_PWM_FAN
>>>   	  This driver can also be built as a module.  If so, the module
>>>   	  will be called pwm-fan.
>>> +config SENSORS_RASPBERRYPI_HWMON
>>> +	tristate "Raspberry Pi voltage monitor"
>>> +	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
>>
>> Since RASPBERRYPI_FIRMWARE already implies ARCH_BCM2835 (via BCM2835_MBOX),
>> this is just a very roundabout way to say:
>>
>> 	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
>>
> That would permit SENSORS_RASPBERRYPI_HWMON=y combined with
> RASPBERRYPI_FIRMWARE=m, which AFAICS would result in a build error
> because include/soc/bcm2835/raspberrypi-firmware.h uses IS_ENABLED()
> and not IS_REACHABLE().

But that's only possible when COMPILE_TEST=y, where in any case there 
are stub definitions for the #else case in that header which should 
still be enough to build with, right? (and if not, that's probably its 
own bug)

Nobody's expecting COMPILE_TEST configs to actually boot and work 
perfectly, are they?

Robin.
