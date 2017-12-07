Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] hwmon (pmbus): cffps: Add debugfs entries
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, mspinler@linux.vnet.ibm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
References: <1512676238-8020-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1512676238-8020-3-git-send-email-eajames@linux.vnet.ibm.com>
 <20171207205321.GB7736@roeck-us.net>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 7 Dec 2017 16:19:45 -0600
MIME-Version: 1.0
In-Reply-To: <20171207205321.GB7736@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Message-Id: <68d9f677-3dd7-24b3-141a-f1d49bd6bb5d@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 12/07/2017 02:53 PM, Guenter Roeck wrote:
> On Thu, Dec 07, 2017 at 01:50:38PM -0600, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add debugfs entries for additional power supply data, including part
>> number, serial number, FRU number, firmware revision, ccin, and the
>> input history of the power supply. The input history is 10 minutes of
>> input power data in the form of twenty 30-second packets. Each packet
>> contains average and maximum power for that 30 second period.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/pmbus/ibm-cffps.c | 199 +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 198 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
>> index cb56da6..6d19399 100644
>> --- a/drivers/hwmon/pmbus/ibm-cffps.c
>> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
>> @@ -8,12 +8,26 @@
>>    */
>>   
>>   #include <linux/bitops.h>
>> +#include <linux/debugfs.h>
>>   #include <linux/device.h>
>> +#include <linux/fs.h>
>>   #include <linux/i2c.h>
>> +#include <linux/jiffies.h>
>>   #include <linux/module.h>
>> +#include <linux/mutex.h>
>>   
>>   #include "pmbus.h"
>>   
>> +#define CFFPS_FRU_CMD				0x9A
>> +#define CFFPS_PN_CMD				0x9B
>> +#define CFFPS_SN_CMD				0x9E
>> +#define CFFPS_CCIN_CMD				0xBD
>> +#define CFFPS_FW_CMD_START			0xFA
>> +#define CFFPS_FW_NUM_BYTES			4
>> +
>> +#define CFFPS_INPUT_HISTORY_CMD			0xD6
>> +#define CFFPS_INPUT_HISTORY_SIZE		100
>> +
>>   /* STATUS_MFR_SPECIFIC bits */
>>   #define CFFPS_MFR_FAN_FAULT			BIT(0)
>>   #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
>> @@ -24,6 +38,144 @@
>>   #define CFFPS_MFR_VAUX_FAULT			BIT(6)
>>   #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>>   
>> +enum {
>> +	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
>> +	CFFPS_DEBUGFS_FRU,
>> +	CFFPS_DEBUGFS_PN,
>> +	CFFPS_DEBUGFS_SN,
>> +	CFFPS_DEBUGFS_CCIN,
>> +	CFFPS_DEBUGFS_FW,
>> +	CFFPS_DEBUGFS_NUM_ENTRIES
>> +};
>> +
>> +struct ibm_cffps_input_history {
>> +	struct mutex update_lock;
>> +	unsigned long last_update;
>> +
>> +	u8 byte_count;
>> +	u8 data[CFFPS_INPUT_HISTORY_SIZE];
>> +};
>> +
>> +struct ibm_cffps {
>> +	struct i2c_client *client;
>> +
>> +	struct ibm_cffps_input_history input_history;
>> +
>> +	int debugfs_entries[CFFPS_DEBUGFS_NUM_ENTRIES];
>> +};
>> +
>> +#define to_psu(x, y) container_of((x), struct ibm_cffps, debugfs_entries[(y)])
>> +
>> +static ssize_t ibm_cffps_read_input_history(struct ibm_cffps *psu,
>> +					    char __user *buf, size_t count,
>> +					    loff_t *ppos)
>> +{
>> +	int rc;
>> +	u8 msgbuf0[1] = { CFFPS_INPUT_HISTORY_CMD };
>> +	u8 msgbuf1[CFFPS_INPUT_HISTORY_SIZE + 1] = { 0 };
>> +	struct i2c_msg msg[2] = {
>> +		{
>> +			.addr = psu->client->addr,
>> +			.flags = psu->client->flags,
>> +			.len = 1,
>> +			.buf = msgbuf0,
>> +		}, {
>> +			.addr = psu->client->addr,
>> +			.flags = psu->client->flags | I2C_M_RD,
>> +			.len = CFFPS_INPUT_HISTORY_SIZE + 1,
>> +			.buf = msgbuf1,
>> +		},
>> +	};
>> +
>> +	if (!*ppos) {
>> +		mutex_lock(&psu->input_history.update_lock);
>> +		if (time_after(jiffies, psu->input_history.last_update + HZ)) {
>> +			/*
>> +			 * Use a raw i2c transfer, since we need more bytes
>> +			 * than Linux I2C supports through smbus xfr (only 32).
>> +			 */
>> +			rc = i2c_transfer(psu->client->adapter, msg, 2);
>> +			if (rc < 0) {
>> +				mutex_unlock(&psu->input_history.update_lock);
>> +				return rc;
>> +			}
>> +
>> +			psu->input_history.byte_count = msgbuf1[0];
>> +			memcpy(psu->input_history.data, &msgbuf1[1],
>> +			       CFFPS_INPUT_HISTORY_SIZE);
>> +			psu->input_history.last_update = jiffies;
>> +		}
>> +
>> +		mutex_unlock(&psu->input_history.update_lock);
>> +	}
>> +
>> +	return simple_read_from_buffer(buf, count, ppos,
>> +				       psu->input_history.data,
>> +				       psu->input_history.byte_count);
>> +}
>> +
>> +static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
>> +				    size_t count, loff_t *ppos)
>> +{
>> +	u8 cmd;
>> +	int i, rc;
>> +	int *idxp = file->private_data;
>> +	int idx = *idxp;
>> +	struct ibm_cffps *psu = to_psu(idxp, idx);
>> +	char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
>> +
>> +	switch (idx) {
>> +	case CFFPS_DEBUGFS_INPUT_HISTORY:
>> +		return ibm_cffps_read_input_history(psu, buf, count, ppos);
>> +	case CFFPS_DEBUGFS_FRU:
>> +		cmd = CFFPS_FRU_CMD;
>> +		break;
>> +	case CFFPS_DEBUGFS_PN:
>> +		cmd = CFFPS_PN_CMD;
>> +		break;
>> +	case CFFPS_DEBUGFS_SN:
>> +		cmd = CFFPS_SN_CMD;
>> +		break;
>> +	case CFFPS_DEBUGFS_CCIN:
>> +		rc = i2c_smbus_read_word_data(psu->client, CFFPS_CCIN_CMD);
>> +		if (rc < 0)
>> +			return rc;
>> +
>> +		rc = snprintf(data, 5, "%04X", rc);
>> +		goto done;
>> +	case CFFPS_DEBUGFS_FW:
>> +		for (i = 0; i < CFFPS_FW_NUM_BYTES; ++i) {
>> +			rc = i2c_smbus_read_byte_data(psu->client,
>> +						      CFFPS_FW_CMD_START + i);
>> +			if (rc < 0)
>> +				return rc;
>> +
>> +			snprintf(&data[i * 2], 3, "%02X", rc);
>> +		}
>> +
>> +		rc = i * 2;
>> +		goto done;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = i2c_smbus_read_block_data(psu->client, cmd, data);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +done:
>> +	data[rc] = '\n';
>> +	rc += 2;
>> +
>> +	return simple_read_from_buffer(buf, count, ppos, data, rc);
>> +}
>> +
>> +static const struct file_operations ibm_cffps_fops = {
>> +	.llseek = noop_llseek,
>> +	.read = ibm_cffps_debugfs_op,
>> +	.open = simple_open,
>> +};
>> +
>>   static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
>>   				    int reg)
>>   {
>> @@ -119,7 +271,52 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
>>   static int ibm_cffps_probe(struct i2c_client *client,
>>   			   const struct i2c_device_id *id)
>>   {
>> -	return pmbus_do_probe(client, id, &ibm_cffps_info);
>> +	int i, rc;
>> +	struct dentry *debugfs;
>> +	struct ibm_cffps *psu;
>> +
>> +	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Don't fail the probe if we can't create debugfs */
>> +	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
>> +	if (!psu)
>> +		return 0;
>> +
>> +	psu->client = client;
>> +	mutex_init(&psu->input_history.update_lock);
>> +	if (jiffies > HZ)
>> +		/* time_after wouldn't succeed with last_update = 0 in test */
> ... but you are setting it to 'jiffies' elsewhere, so it can still end up
> being 0 at some point, especially since 'jiffies' starts with a large number
> and wraps a few minutes after boot. Not sure I understand the problem,
> actually.  Can you elaborate ?

Yea, not sure I understand it either, but basically, if we don't set 
last_update to jiffies - HZ or similar at start up, the check above for 
time_after(jiffies, last_upate + HZ) doesn't succeed soon after the 
boot. This doesn't make any sense to me, unless time_after is broken, 
but setting last_update to something relative to jiffies during probe 
fixes it.

[  279.480000] failed time_after with jiffies[-2052] last_update[0]
[  302.050000] succeeded time_after with jiffies[205] last_update[0]

tested with this (should have used %u instead of %d, but you get the idea):

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c 
b/drivers/hwmon/pmbus/ibm-cffps.c
index 6d19399..e5cb52a 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -90,6 +90,7 @@ static ssize_t ibm_cffps_read_input_history(struct 
ibm_cffps *psu,
      if (!*ppos) {
          mutex_lock(&psu->input_history.update_lock);
          if (time_after(jiffies, psu->input_history.last_update + HZ)) {
+printk("succeeded time_after with jiffies[%d] last_update[%d]\n", 
jiffies, psu->input_history.last_update);
              /*
               * Use a raw i2c transfer, since we need more bytes
               * than Linux I2C supports through smbus xfr (only 32).
@@ -105,6 +106,8 @@ static ssize_t ibm_cffps_read_input_history(struct 
ibm_cffps *psu,
                     CFFPS_INPUT_HISTORY_SIZE);
              psu->input_history.last_update = jiffies;
          }
+        else
+printk("failed time_after with jiffies[%d] last_update[%d]\n", jiffies, 
psu->input_history.last_update);

          mutex_unlock(&psu->input_history.update_lock);
      }
@@ -286,9 +289,6 @@ static int ibm_cffps_probe(struct i2c_client *client,

      psu->client = client;
      mutex_init(&psu->input_history.update_lock);
-    if (jiffies > HZ)
-        /* time_after wouldn't succeed with last_update = 0 in test */
-        psu->input_history.last_update = jiffies - HZ;

      debugfs = pmbus_get_debugfs_dir(client);
      if (!debugfs)
-- 


>
>> +		psu->input_history.last_update = jiffies - HZ;
>> +
>> +	debugfs = pmbus_get_debugfs_dir(client);
>> +	if (!debugfs)
>> +		return 0;
>> +
> It might be better to do that first, to avoid allocating memory unnecessarily.
> That memory would only be freed when the driver is unloaded.

True.

>
>> +	for (i = 0; i < CFFPS_DEBUGFS_NUM_ENTRIES; ++i)
>> +		psu->debugfs_entries[i] = i;
>> +
>> +	debugfs_create_file("ibm_cffps_input_history", 0444, debugfs,
>> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_INPUT_HISTORY],
>> +			    &ibm_cffps_fops);
>> +	debugfs_create_file("ibm_cffps_fru", 0444, debugfs,
>> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_FRU],
>> +			    &ibm_cffps_fops);
>> +	debugfs_create_file("ibm_cffps_pn", 0444, debugfs,
>> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_PN],
>> +			    &ibm_cffps_fops);
>> +	debugfs_create_file("ibm_cffps_sn", 0444, debugfs,
>> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_SN],
>> +			    &ibm_cffps_fops);
>> +	debugfs_create_file("ibm_cffps_ccin", 0444, debugfs,
>> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_CCIN],
>> +			    &ibm_cffps_fops);
>> +	debugfs_create_file("ibm_cffps_fw", 0444, debugfs,
>> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_FW],
>> +			    &ibm_cffps_fops);
> Can you put those into their own subdirectory ?
>
> 	.../ibm_cffps/input_history
> 	.../ibm_cffps/fru
>
> and so on. Also, consider using ibm_cffps1 (or client->name) to align
> with the the hwmon 'name' attribute.

Good idea.

Thanks,
Eddie

>
> Thanks,
> Guenter
>
>> +
>> +	return 0;
>>   }
>>   
>>   static const struct i2c_device_id ibm_cffps_id[] = {
>> -- 
>> 1.8.3.1
>>
