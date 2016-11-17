Return-path: <jared.bents@rockwellcollins.com>
MIME-Version: 1.0
In-Reply-To: <20161116225103.GB11821@roeck-us.net>
References: <1479335033-44479-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161116225103.GB11821@roeck-us.net>
From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Thu, 17 Nov 2016 14:08:41 -0600
Message-ID: <CAM=7fbfQTOeXG-8oaQ7YDwR+Ji_R3VWM6TDrs9sU+UQqkh11wQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (amc6821) sign extension temperature
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Nov 16, 2016 at 4:51 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Nov 16, 2016 at 04:23:53PM -0600, Matt Weber wrote:
>> From: Jared Bents <jared.bents@rockwellcollins.com>
>>
>> Converts the unsigned temperature values from the i2c read
>> to be sign extended as defined in the datasheet so that
>> negative temperatures are properly read.
>>
>> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  drivers/hwmon/amc6821.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
>> index 12e851a..d7368f7 100644
>> --- a/drivers/hwmon/amc6821.c
>> +++ b/drivers/hwmon/amc6821.c
>> @@ -188,7 +188,7 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
>>                       !data->valid) {
>>
>>               for (i = 0; i < TEMP_IDX_LEN; i++)
>> -                     data->temp[i] = i2c_smbus_read_byte_data(client,
>> +                     data->temp[i] = (int8_t) i2c_smbus_read_byte_data(client,
>
> How does that fix anything ? The only difference is that errors reported from
> i2c_smbus_read_byte_data() are now capped off and stored as 0xff and no longer
> as negative numbers.  I don't see how a value of 0xff read from the chip would
> now be reported as -1 degrees C; it should be reported as 255 degrees C as it
> was all along. What am I missing here ?
>
> A real fix would be to actually check for errors either here or in the show
> function (temp[] < 0 indicates a transfer error), and to use sign_extend()
> to convert the 8-bit reading to a signed value.
>
> Guenter
>

As stated in the patch note, the amc6821 uses signed numbers for the
temperature values. 0xff is -1 Deg C and 0x80 is -128 Deg C via the
temperature range table in the amc6821 datasheet.  This change does
not break any error checking when reading the temperature over the i2c
bus in this driver as this driver does not do any error checking for
the temperature reads to begin with.  There are error checks in the
driver but they are for some i2c writes and a few i2c reads for
configuration settings.  None of those error checks are affected.
Without this patch, the temperatures that are displayed in /sys/class
when below 0 Deg C are 255 Deg C to 128 Deg C.  With the patch, the
temperatures displayed below 0 Deg C are -1 Deg C to -128 Deg C as
expected.

Jared

>>                               temp_reg[i]);
>>
>>               data->stat1 = i2c_smbus_read_byte_data(client,
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
