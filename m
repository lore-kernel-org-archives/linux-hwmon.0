Return-path: <tthayer@opensource.altera.com>
Reply-To: <tthayer@opensource.altera.com>
Subject: Re: [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System
 Resource Chip
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-4-git-send-email-tthayer@opensource.altera.com>
 <20160330115106.GJ3323@x1>
To: Lee Jones <lee.jones@linaro.org>
CC: <linus.walleij@linaro.org>, <gnurou@gmail.com>, <jdelvare@suse.com>,
	<linux@roeck-us.net>, <robh+dt@kernel.org>, <pawell.moll@arm.com>,
	<mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<dinguyen@opensource.altera.com>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
From: Thor Thayer <tthayer@opensource.altera.com>
Message-ID: <56FBE829.2000607@opensource.altera.com>
Date: Wed, 30 Mar 2016 09:52:25 -0500
MIME-Version: 1.0
In-Reply-To: <20160330115106.GJ3323@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Lee,

On 03/30/2016 06:51 AM, Lee Jones wrote:
> On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add support for the Altera Arria10 Development Kit System Resource
>> chip which is implemented using a MAX5 as a external gpio extender,
>> and hardware monitor with the regmap framework over a SPI bus.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---

[...]

>> index 0000000..13665d4
>> --- /dev/null
>> +++ b/drivers/mfd/altera-a10sr.c
>> @@ -0,0 +1,177 @@
>> +/*
>> + * Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>
> Any chance you can use the shorter copyright header?
>

This is the header that Altera has specified and that we're operating 
under. We haven't received guidance on Intel's header yet but it may 
change as a result of our acquisition by Intel.

[...]

>> +
>> +	/*
>> +	 * We can't use the standard regmap_update_bits function because
>> +	 * the read register has a different address than the write register.
>> +	 * Therefore, just do a read, modify, write operation here.
>> +	 */
>> +	ret = regmap_read(a10sr->regmap, (reg | READ_REG_MASK), &rval);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	rval = ((rval & ~bit_mask) | (reg_val & bit_mask));
>> +
>> +	ret = regmap_write(a10sr->regmap, (reg & WRITE_REG_MASK), rval);
>> +
>> +	return ret;
>> +}
>
> Why can't you use the Regmap update function(s)?

The read register has a different address than the write register which 
is handled in this function with the masks (read address is odd, write 
address is even).

Thank you for the review of my patch set. I will implement the changes 
that you pointed out. Thank you for reviewing!

>
>> +#endif /* __MFD_ALTERA_A10SR_H */
>
