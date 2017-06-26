Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/7] drivers/hwmon/occ: Add command transport method for
 P8 and P9
To: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
        mark.rutland@arm.com, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        cbostic@linux.vnet.ibm.com, jk@ozlabs.org, joel@jms.id.au,
        andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
References: <1498171716-26620-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498171716-26620-3-git-send-email-eajames@linux.vnet.ibm.com>
 <660f0d44-907d-72b7-440c-b2bbec0f880d@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 26 Jun 2017 10:30:28 -0500
MIME-Version: 1.0
In-Reply-To: <660f0d44-907d-72b7-440c-b2bbec0f880d@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <643d9dff-32bb-d8d5-6e23-82a7fa03abc6@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 06/24/2017 09:49 AM, Guenter Roeck wrote:
> On 06/22/2017 03:48 PM, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> For the P8 OCC, add the procedure to send a command to the OCC over I2C
>> bus. This involves writing the OCC command registers with serial
>> communication operations (SCOMs) interpreted by the I2C slave. For the
>> P9 OCC, add a procedure to use the OCC in-kernel API to send a command
>> to the OCC through the SBE engine.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/occ/common.h |  13 ++++
>>   drivers/hwmon/occ/p8_i2c.c | 166 
>> ++++++++++++++++++++++++++++++++++++++++++++-
>>   drivers/hwmon/occ/p9_sbe.c |  66 +++++++++++++++++-
>>   3 files changed, 243 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
>> index dca642a..0c3f26f 100644
>> --- a/drivers/hwmon/occ/common.h
>> +++ b/drivers/hwmon/occ/common.h
>> @@ -15,6 +15,19 @@
>>     #define OCC_RESP_DATA_BYTES        4089
>>   +#define OCC_TIMEOUT_MS            5000
>
> Five seconds ? Isn't that a bit excessive ?
>
>> +#define OCC_CMD_IN_PRG_MS        100
>> +
>> +/* OCC return codes */
>> +#define RESP_RETURN_CMD_IN_PRG        0xFF
>> +#define RESP_RETURN_SUCCESS        0
>> +#define RESP_RETURN_CMD_INVAL        0x11
>> +#define RESP_RETURN_CMD_LEN        0x12
>> +#define RESP_RETURN_DATA_INVAL        0x13
>> +#define RESP_RETURN_CHKSUM        0x14
>> +#define RESP_RETURN_OCC_ERR        0x15
>> +#define RESP_RETURN_STATE        0x16
>> +
>
> Why are those return codes defined here ? They must be set somewhere
> outside this driver, and I would expect them to be defined there.

They are defined in code that runs on the OCC itself, and perhaps in 
applications that talk to the OCC, but it's nowhere in the kernel. I'm 
not aware of any plans to either define or use these codes anywhere else 
in the kernel at the moment.

>
> Also see below - the missing context makes it all but impossible
> th review this patch series.

Agreed, I have sent you links to the FSI client driver series that this 
driver uses. Thanks for the review, will include your suggestions in a 
v2 soon. Couple of comments below.

Thanks,
Eddie

>
>>   /* Same response format for all OCC versions.
>>    * Allocate the largest possible response.
>>    */
>> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
>> index 5075146..d6d70ce 100644
>> --- a/drivers/hwmon/occ/p8_i2c.c
>> +++ b/drivers/hwmon/occ/p8_i2c.c
>> @@ -7,6 +7,7 @@
>>    * (at your option) any later version.
>>    */
>>   +#include <asm/unaligned.h>
>
> Alphabetic order, though it is ok to list linux.. includes first 
> followed by
> asm... includes followed by local includes.
>
>>   #include "common.h"
>>   #include <linux/i2c.h>
>>   #include <linux/init.h>
>> @@ -19,9 +20,172 @@ struct p8_i2c_occ {
>>     #define to_p8_i2c_occ(x)    container_of((x), struct p8_i2c_occ, 
>> occ)
>>   +static int p8_i2c_occ_getscom(struct i2c_client *client, u32 
>> address, u8 *data)
>> +{
>> +    ssize_t rc;
>> +    __be64 buf_be;
>
> _be is redundant. Yes, you have buf as well, but that is really not 
> needed.
>
>> +    u64 buf;
>> +    struct i2c_msg msgs[2];
>> +
>> +    /* p8 i2c slave requires shift */
>> +    address <<= 1;
>> +
>> +    msgs[0].addr = client->addr;
>> +    msgs[0].flags = client->flags & I2C_M_TEN;
>> +    msgs[0].len = sizeof(u32);
>> +    msgs[0].buf = (char *)&address;
>
> No endianness concerns here ?
>
>> +
>> +
> checkpatch --strict, please
>
>> +    msgs[1].addr = client->addr;
>> +    msgs[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
>> +    msgs[1].len = sizeof(u64);
>> +    msgs[1].buf = (char *)&buf_be;
>> +
>> +    rc = i2c_transfer(client->adapter, msgs, 2);
>> +    if (rc < 0)
>> +        return rc;
>> +
>> +    buf = be64_to_cpu(buf_be);
>> +    memcpy(data, &buf, sizeof(u64));
>
>     *(u64 *)data = be64_to_cpu(buf_be);
>
>> +
>> +    return 0;
>> +}
>> +
>> +static int p8_i2c_occ_putscom(struct i2c_client *client, u32 
>> address, u8 *data)
>> +{
>> +    u32 buf[3];
>> +    ssize_t rc;
>> +
>> +    /* p8 i2c slave requires shift */
>> +    address <<= 1;
>> +
>> +    buf[0] = address;
>> +    memcpy(&buf[1], &data[4], sizeof(u32));
>> +    memcpy(&buf[2], data, sizeof(u32));
>
> No endianness concerns ? Presumably not, but that might warrant a comment
> above, with the function declaration.
>
>> +
>> +    rc = i2c_master_send(client, (const char *)buf, sizeof(buf));
>> +    if (rc < 0)
>> +        return rc;
>> +    else if (rc != sizeof(buf))
>> +        return -EIO;
>> +
>> +    return 0;
>> +}
>> +
>> +static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 
>> address,
>> +                  u32 data0, u32 data1)
>> +{
>> +    u8 buf[8];
>> +
>> +    memcpy(buf, &data0, 4);
>> +    memcpy(buf + 4, &data1, 4);
>> +
>> +    return p8_i2c_occ_putscom(client, address, buf);
>> +}
>> +
>> +static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 
>> address,
>> +                 u8 *data)
>> +{
>> +    __be32 data0, data1;
>> +
>> +    memcpy(&data0, data, 4);
>> +    memcpy(&data1, data + 4, 4);
>> +
>> +    return p8_i2c_occ_putscom_u32(client, address, be32_to_cpu(data0),
>> +                      be32_to_cpu(data1));
>> +}
>> +
>>   static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>>   {
>> -    return -EOPNOTSUPP;
>> +    int i, rc;
>> +    unsigned long start;
>> +    u16 data_length;
>> +    struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
>> +    struct i2c_client *client = p8_i2c_occ->client;
>> +    struct occ_response *resp = &occ->resp;
>> +
>> +    start = jiffies;
>> +
>> +    /* set sram address for command */
>> +    rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF6000, 0);
>
> Please declare those magics as defines to give readers an idea
> what this is about.
>
>> +    if (rc)
>> +        goto err;
>> +
>> +    /* write command (must already be BE), i2c expects cpu-endian */
>> +    rc = p8_i2c_occ_putscom_be(client, 0x6B075, cmd);
>> +    if (rc)
>> +        goto err;
>> +
>> +    /* trigger OCC attention */
>> +    rc = p8_i2c_occ_putscom_u32(client, 0x6B035, 0x20010000, 0);
>> +    if (rc)
>> +        goto err;
>> +
>> +retry:
>> +    /* set sram address for response */
>> +    rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF7000, 0);
>> +    if (rc)
>> +        goto err;
>> +
>> +    /* read response */
>> +    rc = p8_i2c_occ_getscom(client, 0x6B075, (u8 *)resp);
>> +    if (rc)
>> +        goto err;
>> +
>> +    /* check the OCC response */
>> +    switch (resp->return_status) {
>> +    case RESP_RETURN_CMD_IN_PRG:
>> +        if (time_after(jiffies,
>> +                   start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
>> +            rc = -EALREADY;
>> +        else {
>> +            set_current_state(TASK_INTERRUPTIBLE);
>> + schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
>> +
>> +            goto retry;
>
> Please refactor as loop.
>
>> +        }
>> +        break;
>> +    case RESP_RETURN_SUCCESS:
>> +        rc = 0;
>> +        break;
>> +    case RESP_RETURN_CMD_INVAL:
>> +    case RESP_RETURN_CMD_LEN:
>> +    case RESP_RETURN_DATA_INVAL:
>> +    case RESP_RETURN_CHKSUM:
>> +        rc = -EINVAL;
>> +        break;
>> +    case RESP_RETURN_OCC_ERR:
>> +        rc = -EREMOTE;
>
> "Object is remote"

Closest error code i could find to say "the error is not in the driver, 
but on the OCC". I'll add a comment.

>
>> +        break;
>> +    default:
>> +        rc = -EFAULT;
>
> "Bad address" ?
>
>> +    }
>> +
>> +    if (rc < 0) {
>> +        dev_warn(&client->dev, "occ bad response: %d\n",
>> +             resp->return_status);
>> +        return rc;
>> +    }
>> +
>> +    data_length = get_unaligned_be16(&resp->data_length_be);
>> +    if (data_length > OCC_RESP_DATA_BYTES) {
>> +        dev_warn(&client->dev, "occ bad data length: %d\n",
>> +             data_length);
>> +        return -EDOM;
>
> "Math argument out of domain" ?
>
>
> Your error codes seem to be kind of random.

Tricky to match up the OCC errors with linux errnos.

>
>> +    }
>> +
>> +    /* read remaining response */
>> +    for (i = 8; i < data_length + 7; i += 8) {
>> +        rc = p8_i2c_occ_getscom(client, 0x6B075, ((u8 *)resp) + i);
>> +        if (rc)
>> +            goto err;
>> +    }
>> +
>> +    return data_length + 7;
>> +
>> +err:
>> +    dev_err(&client->dev, "i2c scom op failed rc: %d\n", rc);
>> +    return rc;
>>   }
>>     static int p8_i2c_occ_probe(struct i2c_client *client,
>> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
>> index 0cef428..981c53f 100644
>> --- a/drivers/hwmon/occ/p9_sbe.c
>> +++ b/drivers/hwmon/occ/p9_sbe.c
>> @@ -22,7 +22,71 @@ struct p9_sbe_occ {
>>     static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>>   {
>> -    return -EOPNOTSUPP;
>> +    int rc;
>> +    unsigned long start;
>> +    struct occ_client *client;
>> +    struct occ_response *resp = &occ->resp;
>> +    struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
>> +
>> +    start = jiffies;
>> +
>> +retry:
>> +    client = occ_drv_open(p9_sbe_occ->sbe, 0);
>
> Where does this come from ? Ah, I see, there is an "include 
> <linux/occ.h>",
> but no mention where it comes from.
>
> I'll stop reviewing the series here. I can not review it without 
> complete context.
>
>> +    if (!client)
>> +        return -ENODEV;
>> +
>> +    /* skip first byte (sequence number), OCC driver handles it */
>> +    rc = occ_drv_write(client, (const char *)&cmd[1], 7);
>> +    if (rc < 0)
>> +        goto err;
>> +
>> +    rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
>> +    if (rc < 0)
>> +        goto err;
>> +
>> +    occ_drv_release(client);
>
> Might as well cann release() first to save the double call below.
>
>> +
>> +    /* check the OCC response */
>> +    switch (resp->return_status) {
>> +    case RESP_RETURN_CMD_IN_PRG:
>> +        if (time_after(jiffies,
>> +                   start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
>> +            rc = -EALREADY;
>
> This is another odd return value. Normally one would expect something 
> like
> -ETIMEDOUT.

Could do, but EALREADY more closely matches the "command in progress" 
return code from the OCC.

>
>> +        else {
>> +            set_current_state(TASK_INTERRUPTIBLE);
>> + schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
>> +
>
> Does the called code generate an interrupt if the command is complete ?
>
> Makes me wonder why the write/read sequence isn't just synchronous.
> Again, missing context.
>
>> +            goto retry;
>
> Please refactor as loop.
>
>> +        }
>> +        break;
>> +    case RESP_RETURN_SUCCESS:
>> +        rc = 0;
>> +        break;
>> +    case RESP_RETURN_CMD_INVAL:
>> +    case RESP_RETURN_CMD_LEN:
>> +    case RESP_RETURN_DATA_INVAL:
>> +    case RESP_RETURN_CHKSUM:
>> +        rc = -EINVAL;
>> +        break;
>> +    case RESP_RETURN_OCC_ERR:
>> +        rc = -EREMOTE;
>> +        break;
>> +    default:
>> +        rc = -EFAULT;
>> +    }
>> +
>> +    if (rc < 0) {
>> +        dev_warn(occ->bus_dev, "occ bad response: %d\n",
>> +             resp->return_status);
>> +        return rc;
>> +    }
>> +
>> +    return 0;
>> +
>> +err:
>> +    occ_drv_release(client);
>> +    dev_err(occ->bus_dev, "occ bus op failed rc: %d\n", rc);
>
> Is all this noise really needed ? I can understand it for debugging,
> but for released code ?

Errors can come from a lot of different places in this driver, so I 
thought it helpful. We'd only get one dev_x print per failure, so 
doesn't seem too excessive to me.

>
>> +    return rc;
>>   }
>>     static int p9_sbe_occ_probe(struct platform_device *pdev)
>>
>
