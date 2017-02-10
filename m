Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux v7 3/6] hwmon: occ: Add I2C transport implementation
 for SCOM operations
To: Joel Stanley <joel@jms.id.au>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486509056-25838-4-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XcdsG83HsQW1Pv5zR339mgTzYjfuLQE+gE8yk8Z88MrTA@mail.gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 10 Feb 2017 15:05:05 -0600
MIME-Version: 1.0
In-Reply-To: <CACPK8XcdsG83HsQW1Pv5zR339mgTzYjfuLQE+gE8yk8Z88MrTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <4224dbab-d48c-be48-154d-5ed14dd5231e@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 02/09/2017 11:31 PM, Joel Stanley wrote:
> On Wed, Feb 8, 2017 at 9:40 AM,<eajames@linux.vnet.ibm.com>  wrote:
>> From: "Edward A. James"<eajames@us.ibm.com>
>>
>> Add functions to send SCOM operations over I2C bus. The BMC can
>> communicate with the Power8 host processor over I2C, but needs to use SCOM
>> operations in order to access the OCC register space.
> This doesn't need to be separate from the p8_occ_i2c.c file. You can
> remove a layer of function calls by merging this in and having these
> be your getscom putscom bus_ops callbacks.

The purpose of having this separate was so that we could do the scom 
address shift for p8 separately.

>> Signed-off-by: Edward A. James<eajames@us.ibm.com>
>> Signed-off-by: Andrew Jeffery<andrew@aj.id.au>
>> ---
>>   drivers/hwmon/occ/occ_scom_i2c.c | 77 ++++++++++++++++++++++++++++++++++++++++
>>   drivers/hwmon/occ/occ_scom_i2c.h | 26 ++++++++++++++
>>   2 files changed, 103 insertions(+)
>>   create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
>>   create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
>>
>> diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
>> new file mode 100644
>> index 0000000..74bd6ff
>> --- /dev/null
>> +++ b/drivers/hwmon/occ/occ_scom_i2c.c
>> @@ -0,0 +1,77 @@
>> +
>> +int occ_i2c_getscom(void *bus, u32 address, u64 *data)
>> +{
>> +       ssize_t rc;
>> +       u64 buf;
> If you add endianness annotations sparse can check your types are
> consistent. The warning looks like this:
>
> make C=2 drivers/hwmon/occ/occ_scom_i2c.o
> drivers/hwmon/occ/occ_scom_i2c.c:48:17: warning: cast to restricted __be64
>
> Which tells you it expects the type you pass to be64_to_cpu to be __be64.
>
>
>> +       struct i2c_client *client = bus;
>> +       struct i2c_msg msgs[2];
>> +
>> +       msgs[0].addr = client->addr;
>> +       msgs[0].flags = client->flags & I2C_M_TEN;
>> +       msgs[0].len = sizeof(u32);
>> +       msgs[0].buf = (char *)&address;
>> +
>> +       msgs[1].addr = client->addr;
>> +       msgs[1].flags = client->flags & I2C_M_TEN;
>> +       msgs[1].flags |= I2C_M_RD;
> I first thought you had made a mistake here. Instead you could do:
>
>         msgs[1].flags = client->flags & I2C_M_TEN | I2C_M_RD;

Sure. Was just copying i2c_master_recv.

>> +       msgs[1].len = sizeof(u64);
>> +       msgs[1].buf = (char *)&buf;
>> +
>> +       rc = i2c_transfer(client->adapter, msgs, 2);
>> +       if (rc < 0)
>> +               return rc;
>> +
