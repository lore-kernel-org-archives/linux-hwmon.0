Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: drivers (pmbus): ir35221: Set PMBUS_PAGE before reading id and
 model
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@aj.id.au,
        "Edward A. James" <eajames@us.ibm.com>
References: <1508446628-13112-1-git-send-email-eajames@linux.vnet.ibm.com>
 <20171021161013.GA12794@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 23 Oct 2017 10:23:02 -0500
MIME-Version: 1.0
In-Reply-To: <20171021161013.GA12794@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <1911942e-f770-dbff-969c-b98ed69f68ea@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 10/21/2017 11:10 AM, Guenter Roeck wrote:
> On Thu, Oct 19, 2017 at 03:57:08PM -0500, eajames@linux.vnet.ibm.com wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> The MFR_ID and MFR_MODEL, which are manually read before probing the
>> pmbus core,  are only valid for the two pages that the ir35221 has
>> available. Since we don't know the state of the device when we start
>> probing, set the page number first before reading id and model.
>>
> If the device only has two pages, it is highly unlikely that it is possible
> to select another page which is not supported; any attempts to do so should
> result in a command error.
>
> Is this theory or based on an actual problem observed ? If so, it will require
> some additional explanation.

Hi,

Yes, I have observed this with a physical ir35221 device off an i2c bus. 
It seems that there are some places in the PMBUS core that manage to set 
the page number to 0xFF due to pmbus_set_page being called with page=-1. 
pmbus_set_page doesn't check the CML register, so if the i2c op 
succeeds, it will be a success. I can also set it to anything with 
i2cset tool without error.

I would also like to fix calling pmbus_set_page with -1, and I will send 
up a patch if/when I have time. But I felt it makes sense to also ensure 
the page is set correctly in the ir35221 driver, since it's an unknown 
state at probe time, and this device appears a bit "weird" in that it 
doesn't return an error if it's an unsupported page.

Thanks,
Eddie

>
> Thanks,
> Guenter
>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/pmbus/ir35221.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
>> index 8b906b4..9a53930 100644
>> --- a/drivers/hwmon/pmbus/ir35221.c
>> +++ b/drivers/hwmon/pmbus/ir35221.c
>> @@ -267,6 +267,12 @@ static int ir35221_probe(struct i2c_client *client,
>>   				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
>>   		return -ENODEV;
>>   
>> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
>> +	if (ret < 0) {
>> +		dev_err(&client->dev, "Failed to set PMBUS_PAGE\n");
>> +		return ret;
>> +	}
>> +
>>   	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>>   	if (ret < 0) {
>>   		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
