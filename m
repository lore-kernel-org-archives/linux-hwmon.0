Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:52552 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755341AbdKJIHF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Nov 2017 03:07:05 -0500
Subject: Re: [v4,4/6] pmbus: max31785: Add fan control
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20171103045306.26448-5-andrew@aj.id.au>
 <20171105150441.GA26191@roeck-us.net> <1510283416.4287.43.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b67d4fd5-3a3f-44b2-03af-530599356606@roeck-us.net>
Date: Fri, 10 Nov 2017 00:07:01 -0800
MIME-Version: 1.0
In-Reply-To: <1510283416.4287.43.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/09/2017 07:10 PM, Andrew Jeffery wrote:
> On Sun, 2017-11-05 at 07:04 -0800, Guenter Roeck wrote:
>> On Fri, Nov 03, 2017 at 03:53:04PM +1100, Andrew Jeffery wrote:
>>> The implementation makes use of the new fan control virtual registers
>>> exposed by the pmbus core. It mixes use of the default implementations
>>> with some overrides via the read/write handlers to handle FAN_COMMAND_1
>>> on the MAX31785, whose definition breaks the value range into various
>>> control bands dependent on RPM or PWM mode.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>   Documentation/hwmon/max31785   |   4 ++
>>>   drivers/hwmon/pmbus/max31785.c | 104 ++++++++++++++++++++++++++++++++++++++++-
>>>   2 files changed, 107 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
>>> index 45fb6093dec2..e9edbf11948f 100644
>>> --- a/Documentation/hwmon/max31785
>>> +++ b/Documentation/hwmon/max31785
>>> @@ -32,6 +32,7 @@ Sysfs attributes
>>>   fan[1-4]_alarm		Fan alarm.
>>>   fan[1-4]_fault		Fan fault.
>>>   fan[1-4]_input		Fan RPM.
>>> +fan[1-4]_target		Fan input target
>>>   
>>>   in[1-6]_crit		Critical maximum output voltage
>>>   in[1-6]_crit_alarm	Output voltage critical high alarm
>>> @@ -44,6 +45,9 @@ in[1-6]_max_alarm	Output voltage high alarm
>>>   in[1-6]_min		Minimum output voltage
>>>   in[1-6]_min_alarm	Output voltage low alarm
>>>   
>>> +pwm[1-4]		Fan target duty cycle (0..255)
>>> +pwm[1-4]_enable		0: full-speed, 1: manual control, 2: automatic
>>> +
>>>   temp[1-11]_crit		Critical high temperature
>>>   temp[1-11]_crit_alarm	Chip temperature critical high alarm
>>>   temp[1-11]_input	Measured temperature
>>> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
>>> index 9313849d5160..0d97ddf67079 100644
>>> --- a/drivers/hwmon/pmbus/max31785.c
>>> +++ b/drivers/hwmon/pmbus/max31785.c
>>> @@ -20,8 +20,102 @@ enum max31785_regs {
>>>   
>>>   #define MAX31785_NR_PAGES		23
>>>   
>>> +static int max31785_get_pwm(struct i2c_client *client, int page)
>>> +{
>>> +	int config;
>>> +	int command;
>>> +
>>> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
>>> +	if (config < 0)
>>> +		return config;
>>> +
>>> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
>>> +	if (command < 0)
>>> +		return command;
>>> +
>>> +	if (!(config & PB_FAN_1_RPM)) {
>>> +		if (command >= 0x8000)
>>> +			return 0;
>>> +		else if (command >= 0x2711)
>>> +			return 0x2710;
>>> +
>>> +		return command;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
>>> +{
>>> +	int config;
>>> +	int command;
>>> +
>>> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
>>> +	if (config < 0)
>>> +		return config;
>>> +
>>> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
>>> +	if (command < 0)
>>> +		return command;
>>> +
>>> +	if (!(config & PB_FAN_1_RPM)) {
>>> +		if (command >= 0x8000)
>>> +			return 2;
>>> +		else if (command >= 0x2711)
>>> +			return 0;
>>> +
>>> +		return 1;
>>> +	}
>>> +
>>> +	return (command >= 0x8000) ? 2 : 1;
>>> +}
>>> +
>>> +static int max31785_read_word_data(struct i2c_client *client, int page,
>>> +				   int reg)
>>> +{
>>> +	int rv;
>>> +
>>> +	switch (reg) {
>>> +	case PMBUS_VIRT_PWM_1:
>>> +		rv = max31785_get_pwm(client, page);
>>> +		if (rv < 0)
>>> +			return rv;
>>> +
>>> +		rv *= 255;
>>> +		rv /= 100;
>>> +		break;
>>> +	case PMBUS_VIRT_PWM_ENABLE_1:
>>> +		rv = max31785_get_pwm_mode(client, page);
>>> +		break;
>>
>> I do wonder ... does it even make sense to specify generic code
>> for the new virtual attributes in the pmbus core code, or would
>> it be better to have it all in this driver, at least for now ?
> 
> I think I'll pull the generic implementations out in light of my
> response on 3/6. At best the generic implementation for the PWM virtual
> regs is a guess. We can always put it back if others come to need it.
> 

SGTM.

Thanks,
Guenter
