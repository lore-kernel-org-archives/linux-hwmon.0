Return-path: <michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Jul 2016 00:24:54 +0200
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, Rini
 <rini@arvoo.nl>, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: adt7411: add rev5 workaround
In-Reply-To: <20160714205611.GB13933@roeck-us.net>
References: <1468497127-6325-1-git-send-email-michael@walle.cc>
 <20160714205611.GB13933@roeck-us.net>
Message-ID: <136b2f5f223ea8460edf3c2024f710d3@walle.cc>
List-ID: <linux-hwmon@vger.kernel.org>

Am 2016-07-14 22:56, schrieb Guenter Roeck:
> On Thu, Jul 14, 2016 at 01:52:07PM +0200, Michael Walle wrote:
>> Bit 3 in the CFG1 register has to be 1 to make AIN3 work properly 
>> since
>> silicon revision 5. Although otherwise stated in the datasheet, the 
>> default
>> value is not 1. Set it to 1 to make AIN3 work.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Cc: stable@vger.kernel.org
>> ---
>> 
>> There was already submission back in 2010.
>>   https://www.spinics.net/lists/lm-sensors/msg29973.html
>> 
>> I don't want to take the ownership, but there wasn't a reaction of the
>> original author. Anyway, I want to answer the raised questions.
>> 
>> > And what is the problem with this? And what's your hardware?
>> ADT7411 silicon rev5 either forgot to default this bit to 1 or any 
>> earlier
>> revision didn't care about it. But with rev5, this bit has to be set
>> otherwise the AIN3 input returns garbage.
>> 
>> > [two uses of adt7411_modify_bit()]
>> >
>> > This is inefficient: you read and write the same register twice in a
>> > row. It would be much better to read it once, modify all bits and write
>> > it once.
>> This patch does it the same way. IMHO the small size of the change
>> justifies the slight inefficiency in the one time probe. The other way 
>> you
>> have to take the lock, add extra code for unlock in error cases etc. 
>> But of
>> course its up to you to decide. I'm happy to provide another patch 
>> with
>> read, modify both bits and write back the value.
>> 
>>  drivers/hwmon/adt7411.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
>> index 827c037..5ed9b11 100644
>> --- a/drivers/hwmon/adt7411.c
>> +++ b/drivers/hwmon/adt7411.c
>> @@ -30,6 +30,7 @@
>> 
>>  #define ADT7411_REG_CFG1			0x18
>>  #define ADT7411_CFG1_START_MONITOR		(1 << 0)
>> +#define ADT7411_CFG1_RESERVED_BIT3		(1 << 3)
>> 
>>  #define ADT7411_REG_CFG2			0x19
>>  #define ADT7411_CFG2_DISABLE_AVG		(1 << 5)
>> @@ -296,6 +297,16 @@ static int adt7411_probe(struct i2c_client 
>> *client,
>>  	mutex_init(&data->device_lock);
>>  	mutex_init(&data->update_lock);
>> 
>> +	/*
>> +	 * Silicon rev5 workaround, bit 3 has to be set, but unlike 
>> mentioned
>> +	 * in the datasheet, this is not set by default. If this bit is not
>> +	 * set, AIN3 won't work at all.
> 
> The datasheet actually says "Write only 1 to this bit", period. While 
> it
> _does_ say that its default is 1, it doesn't say that it is read-only
> (meaning any entity, such as the rommon, the BIOS, or a user having 
> fun,
> may have set the bit to 0 on any chip revision).

Yeah this is possible. But IIRC, older chip revisions (which we 
assembled on our boards before) worked out of the box with this driver. 
And I'm pretty sure, no other entity sets this bit to zero before linux 
starts, meaning at least rev5 doesn't work without this. But I can 
double check this tomorrow.

Nevertheless, I don't know what you wanna say ;) Should I remove the 
comment entirely or replace it with "Datasheet says write only 1"?

> 
>> +	 */
>> +	ret = adt7411_modify_bit(client, ADT7411_REG_CFG1,
>> +				 ADT7411_CFG1_RESERVED_BIT3, 1);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>  	ret = adt7411_modify_bit(client, ADT7411_REG_CFG1,
>>  				 ADT7411_CFG1_START_MONITOR, 1);
> 
> 	ret = adt7411_modify_bit(client, ADT7411_REG_CFG1,
> 		ADT7411_CFG1_RESERVED_BIT3 | ADT7411_CFG1_START_MONITOR, 1);

Mh, ok. Never thought of using this function with a bitmask.

-michael
