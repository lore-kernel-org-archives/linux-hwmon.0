Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39840 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753355AbdHNQOB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Aug 2017 12:14:01 -0400
Date: Mon, 14 Aug 2017 09:13:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH v3] hwmon: (pmbus): Add debugfs for status registers
Message-ID: <20170814161358.GE7025@roeck-us.net>
References: <1502722790-12704-1-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502722790-12704-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 14, 2017 at 09:59:50AM -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Export all the available status registers through debugfs. This is
> useful for hardware diagnostics, especially on multi-page pmbus devices,
> as user-space access of the i2c space could corrupt the pmbus page
> accounting.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> 
> Changes since v2:
>  * Remove client driver conditional debugfs - add it for all devices.
>  * Use scnprintf instead of snprintf.
>  * Add module_init and module_exit to create root pmbus debugfs
>    directory.
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 200 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ef135d8..677bea1 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -19,6 +19,7 @@
>   * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -101,6 +102,7 @@ struct pmbus_data {
>  	int num_attributes;
>  	struct attribute_group group;
>  	const struct attribute_group *groups[2];
> +	struct dentry *debugfs;		/* debugfs device directory */
>  
>  	struct pmbus_sensor *sensors;
>  
> @@ -120,6 +122,12 @@ struct pmbus_data {
>  	u8 currpage;
>  };
>  
> +struct pmbus_debugfs_entry {
> +	struct i2c_client *client;
> +	u8 page;
> +	u8 reg;
> +};
> +
>  void pmbus_clear_cache(struct i2c_client *client)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> @@ -1893,6 +1901,174 @@ static int pmbus_regulator_register(struct pmbus_data *data)
>  }
>  #endif
>  
> +static struct dentry *pmbus_debugfs_dir;	/* pmbus debugfs directory */
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static int pmbus_debugfs_get(void *data, u64 *val)
> +{
> +	struct pmbus_debugfs_entry *entry = data;
> +
> +	*val = _pmbus_read_byte_data(entry->client, entry->page, entry->reg);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
> +			 "0x%02llx\n");
> +
> +static int pmbus_debugfs_get_status(void *data, u64 *val)
> +{
> +	struct pmbus_debugfs_entry *entry = data;
> +	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
> +
> +	*val = pdata->read_status(entry->client, entry->page);

Wait ... read_status() returns an integer where a negative value reflects
an error. Are you sure you want to display that as 4-digit hex value ?
Wouldn't it be better to return that error instead ?

Guenter

> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
> +			 NULL, "0x%04llx\n");
> +
> +static int pmbus_init_debugfs(struct i2c_client *client,
> +			      struct pmbus_data *data)
> +{
> +	int i, idx = 0;
> +	char name[PMBUS_NAME_SIZE];
> +	struct pmbus_debugfs_entry *entries;
> +
> +	if (!pmbus_debugfs_dir)
> +		return -ENODEV;
> +
> +	/*
> +	 * Create the debugfs directory for this device. Use the hwmon device
> +	 * name to avoid conflicts (hwmon numbers are globally unique).
> +	 */
> +	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
> +					   pmbus_debugfs_dir);
> +	if (IS_ERR_OR_NULL(data->debugfs)) {
> +		data->debugfs = NULL;
> +		return -ENODEV;
> +	}
> +
> +	/* Allocate the max possible entries we need. */
> +	entries = devm_kzalloc(data->dev,
> +			       sizeof(*entries) * (data->info->pages * 10),
> +			       GFP_KERNEL);
> +	if (!entries)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->info->pages; ++i) {
> +		/* Check accessibility of status register if it's not page 0 */
> +		if (!i || pmbus_check_status_register(client, i)) {
> +			/* No need to set reg as we have special read op. */
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops_status);
> +		}
> +
> +		if (data->info->func[i] & PMBUS_HAVE_STATUS_VOUT) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_VOUT;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (data->info->func[i] & PMBUS_HAVE_STATUS_IOUT) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_IOUT;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (data->info->func[i] & PMBUS_HAVE_STATUS_INPUT) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_INPUT;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (data->info->func[i] & PMBUS_HAVE_STATUS_TEMP) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_TEMPERATURE;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_CML)) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_CML;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_OTHER)) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_OTHER;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (pmbus_check_byte_register(client, i,
> +					      PMBUS_STATUS_MFR_SPECIFIC)) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_MFR_SPECIFIC;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN12) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_FAN_12;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +
> +		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN34) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_STATUS_FAN_34;
> +			scnprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
> +			debugfs_create_file(name, 0444, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops);
> +		}
> +	}
> +
> +	return 0;
> +}
> +#else
> +static int pmbus_init_debugfs(struct i2c_client *client,
> +			      struct pmbus_data *data)
> +{
> +	return 0;
> +}
> +#endif	/* IS_ENABLED(CONFIG_DEBUG_FS) */
> +
>  int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  		   struct pmbus_driver_info *info)
>  {
> @@ -1952,6 +2128,10 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  	if (ret)
>  		goto out_unregister;
>  
> +	ret = pmbus_init_debugfs(client, data);
> +	if (ret)
> +		dev_warn(dev, "Failed to register debugfs\n");
> +
>  	return 0;
>  
>  out_unregister:
> @@ -1965,12 +2145,32 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  int pmbus_do_remove(struct i2c_client *client)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> +
> +	debugfs_remove_recursive(data->debugfs);
> +
>  	hwmon_device_unregister(data->hwmon_dev);
>  	kfree(data->group.attrs);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(pmbus_do_remove);
>  
> +static int __init pmbus_core_init(void)
> +{
> +	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
> +	if (IS_ERR(pmbus_debugfs_dir))
> +		pmbus_debugfs_dir = NULL;
> +
> +	return 0;
> +}
> +
> +static void __exit pmbus_core_exit(void)
> +{
> +	debugfs_remove_recursive(pmbus_debugfs_dir);
> +}
> +
> +module_init(pmbus_core_init);
> +module_exit(pmbus_core_exit);
> +
>  MODULE_AUTHOR("Guenter Roeck");
>  MODULE_DESCRIPTION("PMBus core driver");
>  MODULE_LICENSE("GPL");
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
