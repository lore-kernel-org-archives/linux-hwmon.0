Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52222 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752198AbeCMUAV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Mar 2018 16:00:21 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2DJvK0W036479
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Mar 2018 16:00:20 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gphg827mb-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Mar 2018 16:00:19 -0400
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 13 Mar 2018 14:00:18 -0600
Subject: Re: [PATCH 2/2] hwmon: (ucd9000) Add debugfs attributes to provide
 mfr_status
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au,
        Christopher Bostic <cbostic@linux.vnet.ibm.com>,
        Andrew Jeffery <andrew@aj.id.au>
References: <1520623196-9534-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1520623196-9534-3-git-send-email-eajames@linux.vnet.ibm.com>
 <cedded07-3b6d-1b1f-573b-3790a52e1700@roeck-us.net>
 <d83cb66b-5cbf-ebb6-9ba9-13981d126360@linux.vnet.ibm.com>
 <20180313192903.GA14572@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 13 Mar 2018 15:00:13 -0500
MIME-Version: 1.0
In-Reply-To: <20180313192903.GA14572@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Message-Id: <3b85f5d8-f974-4914-a2c4-1583adeb1588@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 03/13/2018 02:29 PM, Guenter Roeck wrote:
> On Tue, Mar 13, 2018 at 02:01:51PM -0500, Eddie James wrote:
>>
>> On 03/10/2018 10:50 AM, Guenter Roeck wrote:
>>> On 03/09/2018 11:19 AM, Eddie James wrote:
>>>> From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>>>
>>>> Expose the gpiN_fault fields of mfr_status as individual debugfs
>>>> attributes. This provides a way for users to be easily notified of gpi
>>>> faults. Also provide the whole mfr_status register in debugfs.
>>>>
>>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>>> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
>>>> ---
>>>>    drivers/hwmon/pmbus/ucd9000.c | 172
>>>> +++++++++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 171 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/ucd9000.c
>>>> b/drivers/hwmon/pmbus/ucd9000.c
>>>> index e3a507f..297da0e 100644
>>>> --- a/drivers/hwmon/pmbus/ucd9000.c
>>>> +++ b/drivers/hwmon/pmbus/ucd9000.c
>>>> @@ -19,6 +19,7 @@
>>>>     * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>>>>     */
>>>>    +#include <linux/debugfs.h>
>>>>    #include <linux/kernel.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/of_device.h>
>>>> @@ -36,6 +37,7 @@
>>>>    #define UCD9000_NUM_PAGES        0xd6
>>>>    #define UCD9000_FAN_CONFIG_INDEX    0xe7
>>>>    #define UCD9000_FAN_CONFIG        0xe8
>>>> +#define UCD9000_MFR_STATUS        0xf3
>>>>    #define UCD9000_GPIO_SELECT        0xfa
>>>>    #define UCD9000_GPIO_CONFIG        0xfb
>>>>    #define UCD9000_DEVICE_ID        0xfd
>>>> @@ -63,13 +65,22 @@
>>>>    #define UCD901XX_NUM_GPIOS    26
>>>>    #define UCD90910_NUM_GPIOS    26
>>>>    +#define UCD9000_DEBUGFS_NAME_LEN    24
>>>> +#define UCD9000_GPI_COUNT        8
>>>> +
>>>>    struct ucd9000_data {
>>>>        u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
>>>>        struct pmbus_driver_info info;
>>>>        struct gpio_chip gpio;
>>>> +    struct dentry *debugfs;
>>>>    };
>>>>    #define to_ucd9000_data(_info) container_of(_info, struct
>>>> ucd9000_data, info)
>>>>    +struct ucd9000_debugfs_entry {
>>>> +    struct i2c_client *client;
>>>> +    u8 index;
>>>> +};
>>>> +
>>>>    static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
>>>>    {
>>>>        int fan_config = 0;
>>>> @@ -328,6 +339,156 @@ static int ucd9000_gpio_direction_output(struct
>>>> gpio_chip *gc,
>>>>                          val);
>>>>    }
>>>>    +#if IS_ENABLED(CONFIG_DEBUG_FS)
>>>> +static int ucd9000_get_mfr_status(struct i2c_client *client, u8
>>>> *buffer)
>>>> +{
>>>> +    int ret = pmbus_set_page(client, 0);
>>>> +
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    /*
>>>> +     * With the ucd90120 and ucd90124 devices, this command
>>>> [MFR_STATUS]
>>>> +     * is 2 bytes long (bits 0-15).  With the ucd90240 this command is
>>>> 5
>>>> +     * bytes long.  With all other devices, it is 4 bytes long.
>>>> +     */
>>>> +    return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
>>>> buffer);
>>>> +}
>>>> +
>>>> +static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
>>>> +{
>>>> +    struct ucd9000_debugfs_entry *entry = data;
>>>> +    struct i2c_client *client = entry->client;
>>>> +    u8 buffer[4];
>>>> +    int ret;
>>>> +
>>>> +    /*
>>>> +     * This attribute is only created for devices that return 4 bytes
>>>> for
>>>> +     * status_mfr, so it's safe to call with 4-byte buffer.
>>>> +     */
>>>> +    ret = ucd9000_get_mfr_status(client, buffer);
>>>> +    if (ret < 0) {
>>>> +        dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
>>>> +            ret);
>>>> +
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Attribute only created for devices with gpi fault bits at bits
>>>> +     * 16-23, which is the second byte of the response.
>>>> +     */
>>>> +    *val = !!(buffer[1] & BIT(entry->index));
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_bit,
>>>> +             ucd9000_debugfs_show_mfr_status_bit, NULL, "%1lld\n");
>>>> +
>>>> +static int ucd9000_debugfs_show_mfr_status_word2(void *data, u64 *val)
>>>> +{
>>>> +    struct i2c_client *client = data;
>>>> +    __be16 buffer;
>>>> +    int ret;
>>>> +
>>>> +    ret = ucd9000_get_mfr_status(client, (u8 *)&buffer);
>>>> +    if (ret < 0) {
>>>> +        dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
>>>> +            ret);
>>>> +
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    *val = be16_to_cpu(buffer);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_word2,
>>>> +             ucd9000_debugfs_show_mfr_status_word2, NULL,
>>>> +             "%04llx\n");
>>>> +
>>>> +static int ucd9000_debugfs_show_mfr_status_word4(void *data, u64 *val)
>>>> +{
>>>> +    struct i2c_client *client = data;
>>>> +    __be32 buffer;
>>>> +    int ret;
>>>> +
>>>> +    ret = ucd9000_get_mfr_status(client, (u8 *)&buffer);
>>>> +    if (ret < 0) {
>>>> +        dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
>>>> +            ret);
>>>> +
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    *val = be32_to_cpu(buffer);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_word4,
>>>> +             ucd9000_debugfs_show_mfr_status_word4, NULL,
>>>> +             "%08llx\n");
>>>> +
>>>> +static int ucd9000_init_debugfs(struct i2c_client *client,
>>>> +                const struct i2c_device_id *mid,
>>>> +                struct ucd9000_data *data)
>>>> +{
>>>> +    struct dentry *debugfs;
>>>> +    struct ucd9000_debugfs_entry *entries;
>>>> +    int i;
>>>> +    char name[UCD9000_DEBUGFS_NAME_LEN];
>>>> +
>>>> +    debugfs = pmbus_get_debugfs_dir(client);
>>>> +    if (!debugfs)
>>>> +        return -ENOENT;
>>>> +
>>>> +    data->debugfs = debugfs_create_dir(client->name, debugfs);
>>>> +    if (!data->debugfs)
>>>> +        return -ENOENT;
>>>> +
>>>> +    /*
>>>> +     * Of the chips this driver supports, only the UCD9090, UCD90160,
>>>> +     * and UCD90910 report GPI faults in their MFR_STATUS register, so
>>>> only
>>>> +     * create the GPI fault debugfs attributes for those chips.
>>>> +     */
>>>> +    if (mid->driver_data == ucd9090 || mid->driver_data == ucd90160 ||
>>>> +        mid->driver_data == ucd90910) {
>>>> +        entries = devm_kzalloc(&client->dev,
>>>> +                       sizeof(*entries) * UCD9000_GPI_COUNT,
>>>> +                       GFP_KERNEL);
>>>> +        if (!entries)
>>>> +            return -ENOMEM;
>>>> +
>>>> +        for (i = 0; i < UCD9000_GPI_COUNT; i++) {
>>>> +            entries[i].client = client;
>>>> +            entries[i].index = i;
>>>> +            scnprintf(name, UCD9000_DEBUGFS_NAME_LEN,
>>>> +                  "gpi%d_alarm", i + 1);
>>>> +            debugfs_create_file(name, 0444, data->debugfs,
>>>> +                        &entries[i],
>>>> +                        &ucd9000_debugfs_mfr_status_bit);
>>>> +        }
>>>> +
>>>> +        scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
>>>> +        debugfs_create_file(name, 0444, data->debugfs, client,
>>>> +                    &ucd9000_debugfs_mfr_status_word4);
>>>> +    } else if (mid->driver_data == ucd90120 ||
>>>> +           mid->driver_data == ucd90124) {
>>>> +        scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
>>>> +        debugfs_create_file(name, 0444, data->debugfs, client,
>>>> +                    &ucd9000_debugfs_mfr_status_word2);
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>> Is all that complexity really worth it ? Why not just read the
>>> manufacturing
>>> status as byte string into a buffer and use hexdump to pront it, no matter
>>> how
>>> many bytes are actually returned ? This would also be less error prone,
>>> and
>>> automatically support future chips.
>> Hm, well then we have the additional complexity of setting up custom debugfs
>> file operations to show the binary data instead of just using
>> DEFINE_DEBUGFS_ATTRIBUTE. Plus, at some point someone has to interpret it as
>> either a word, half-word, or 5 bytes chunk. Where better to do it than the
>> driver, as this is hw-dependent?
>>
> I can't exactly follow your logic. You mean it is acceptable for the user to
> have to look into the datasheet to find out what the 1/2/4 byte hex value means,
> but it is unacceptable to expect the user to have to use the datasheet to
> identify what a 1..5 byte hex string, displayed in the order received from the
> chip, means ? I am having difficulties understanding the difference. How is
> 12345678 different from, say, 12 34 56 78 (which you could display as 12345678
> as well) ?

Yea, it's not different at all. Sorry, I wasn't very clear, when I said 
"interpret," I meant "figure out the endian swapping," so my proposal 
would display 78563412, so the user can directly use the value. I 
typically expect the kernel to provide data through interfaces in host 
endian, but displaying it as-received is fine as well. User can figure 
it out.

V2 incoming.

Thanks,
Eddie

>
> The macro generates the file operations as part of the define, so I don't see
> having to define as valid argument. One could instead add a generic debugfs
> macro to display a string if that is of interest.
>
>> I could just use one function and do a byte-swap based on data length in a
>> loop within #ifdef LITTLE_ENDIAN, but that's a little messy. It will handle
>> all the cases though. What do you think?
>>
> Personally I don't see a problem displaying data as received. Either case, there
> are functions/macros to convert from big/little endian to host byte order, so
> related ifdefs in the code should never be necessary.
>
> Guenter
>
>> Thanks,
>> Eddie
>>
>>> Thanks,
>>> Guenter
>>>
>>>> +#else
>>>> +static int ucd9000_init_debugfs(struct i2c_client *client,
>>>> +                struct ucd9000_data *data)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
>>>> +
>>>>    static int ucd9000_probe(struct i2c_client *client,
>>>>                 const struct i2c_device_id *id)
>>>>    {
>>>> @@ -483,7 +644,16 @@ static int ucd9000_probe(struct i2c_client *client,
>>>>            return ret;
>>>>        }
>>>>    -    return pmbus_do_probe(client, mid, info);
>>>> +    ret = pmbus_do_probe(client, mid, info);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    ret = ucd9000_init_debugfs(client, mid, data);
>>>> +    if (ret)
>>>> +        dev_warn(&client->dev, "Failed to register debugfs: %d\n",
>>>> +             ret);
>>>> +
>>>> +    return 0;
>>>>    }
>>>>      /* This is the driver that will be inserted */
>>>>

