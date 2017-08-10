Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35398 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752882AbdHJU3z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 16:29:55 -0400
Date: Thu, 10 Aug 2017 13:29:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 4/4] drivers/hwmon/pmbus: Add debugfs for status registers
Message-ID: <20170810202952.GA13007@roeck-us.net>
References: <1502317157-12648-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502317157-12648-5-git-send-email-eajames@linux.vnet.ibm.com>
 <20170810011524.GB6828@roeck-us.net>
 <318473de-fa13-2bf7-4f08-95db28c57d49@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <318473de-fa13-2bf7-4f08-95db28c57d49@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2017 at 03:15:57PM -0500, Eddie James wrote:
> 
> 
> On 08/09/2017 08:15 PM, Guenter Roeck wrote:
> >On Wed, Aug 09, 2017 at 05:19:17PM -0500, Eddie James wrote:
> >>From: "Edward A. James" <eajames@us.ibm.com>
> >>
> >>Export all the available status registers through debugfs, if the client
> >>driver wants them.
> >>
> >>Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >>---
> >>  drivers/hwmon/pmbus/pmbus.c      |  24 +++++-
> >>  drivers/hwmon/pmbus/pmbus.h      |  11 +++
> >>  drivers/hwmon/pmbus/pmbus_core.c | 175 +++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 209 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> >>index 7718e58..fc27417 100644
> >>--- a/drivers/hwmon/pmbus/pmbus.c
> >>+++ b/drivers/hwmon/pmbus/pmbus.c
> >That won't work: SENSORS_PMBUS is independent of PMBUS and does not have
> >to be enabled even if PMBUS is enabled. This will have to be in pmbus_core.c.
> >
> >I would suggest to do the same as done with other drivers. Move
> >pmbus_debugfs_dir into pmbus_core.c and create the directory on probe
> >if it has not already been created.
> 
> Hmm, I'm having trouble with this. Don't I have to call
> debugfs_recursive_remove() on the pmbus_debugfs_dir when the pmbus driver is
> unloaded? That can't be done from pmbus_core.c, as that is just device
> probe/remove. I agree it makes sense to only create it if a device is going
> to be using it (and is enabled in the kernel) but I think I need to declare
> it here so I can remove it on unload.
> 
So if CONFIG_SENSORS_PMBUS is not enabled, you won't have debugfs.
actually, even worse, this effectively mandates that CONFIG_SENSORS_PMBUS
must be enabled since it derclares a variable used by the core.
That doesn't make sense. What makes even less sense is that it defines the
variable in a module, thus _mandating_ that PMBUS_CORE is also built as module
if this driver is built as module. Which you can't even express in Kconfig
right now without adding a lot of complexity.

Guenter

> >
> >>@@ -18,6 +18,7 @@
> >>   * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> >>   */
> >>+#include <linux/debugfs.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>  #include <linux/init.h>
> >>@@ -230,7 +231,28 @@ static int pmbus_probe(struct i2c_client *client,
> >>  	.id_table = pmbus_id,
> >>  };
> >>-module_i2c_driver(pmbus_driver);
> >>+struct dentry *pmbus_debugfs_dir;
> >>+EXPORT_SYMBOL_GPL(pmbus_debugfs_dir);
> >>+
> >>+static int __init pmbus_init(void)
> >>+{
> >>+	pmbus_debugfs_dir = debugfs_create_dir(pmbus_driver.driver.name, NULL);
> >>+	if (IS_ERR(pmbus_debugfs_dir))
> >>+		/* Don't fail out if we don't have debugfs support. */
> >>+		pmbus_debugfs_dir = NULL;
> >>+
> >>+	return i2c_add_driver(&pmbus_driver);
> >>+}
> >>+
> >>+static void __exit pmbus_exit(void)
> >>+{
> >>+	debugfs_remove_recursive(pmbus_debugfs_dir);
> >>+
> >>+	i2c_del_driver(&pmbus_driver);
> >>+}
> >>+
> >>+module_init(pmbus_init);
> >>+module_exit(pmbus_exit);
> >>  MODULE_AUTHOR("Guenter Roeck");
> >>  MODULE_DESCRIPTION("Generic PMBus driver");
> >>diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> >>index bfcb13b..c772b83 100644
> >>--- a/drivers/hwmon/pmbus/pmbus.h
> >>+++ b/drivers/hwmon/pmbus/pmbus.h
> >>@@ -25,6 +25,8 @@
> >>  #include <linux/bitops.h>
> >>  #include <linux/regulator/driver.h>
> >>+struct dentry;
> >>+
> >>  /*
> >>   * Registers
> >>   */
> >>@@ -383,6 +385,12 @@ struct pmbus_driver_info {
> >>  	/* Regulator functionality, if supported by this chip driver. */
> >>  	int num_regulators;
> >>  	const struct regulator_desc *reg_desc;
> >>+
> >>+	/*
> >>+	 * Controls whether or not to create debugfs entries for this driver's
> >>+	 * devices.
> >>+	 */
> >>+	bool debugfs;
> >>  };
> >>  /* Regulator ops */
> >>@@ -401,6 +409,9 @@ struct pmbus_driver_info {
> >>  		.owner = THIS_MODULE,				\
> >>  	}
> >>+/* Handle for debugfs directory */
> >>+extern struct dentry *pmbus_debugfs_dir;
> >>+
> >>  /* Function declarations */
> >>  void pmbus_clear_cache(struct i2c_client *client);
> >>diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> >>index 1a51f8f..afbd364 100644
> >>--- a/drivers/hwmon/pmbus/pmbus_core.c
> >>+++ b/drivers/hwmon/pmbus/pmbus_core.c
> >>@@ -19,6 +19,7 @@
> >>   * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> >>   */
> >>+#include <linux/debugfs.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>  #include <linux/init.h>
> >>@@ -49,6 +50,9 @@
> >>  #define PB_STATUS_FAN34_BASE	(PB_STATUS_FAN_BASE + PMBUS_PAGES)
> >>  #define PB_STATUS_TEMP_BASE	(PB_STATUS_FAN34_BASE + PMBUS_PAGES)
> >>  #define PB_STATUS_INPUT_BASE	(PB_STATUS_TEMP_BASE + PMBUS_PAGES)
> >>+#define PB_STATUS_CML_BASE	(PB_STATUS_INPUT_BASE + PMBUS_PAGES)
> >>+#define PB_STATUS_OTHER_BASE	(PB_STATUS_CML_BASE + PMBUS_PAGES)
> >>+#define PB_STATUS_MFR_BASE	(PB_STATUS_OTHER_BASE + PMBUS_PAGES)
> >We are not actively using those status registers, are we ?
> >I am a bit concerned that we'll continuously read those status registers
> >but don't do anything with it most of the time. Ultimately I'd prefer
> >to get rid of all caching, not more, since it gets quite expensive
> >on chips with many pages.
> >
> >Maybe just display uncached status register values in debugfs ?
> 
> Sounds good.
> 
> >
> >>  #define PB_STATUS_VMON_BASE	(PB_STATUS_INPUT_BASE + 1)
> >>  #define PB_NUM_STATUS_REG	(PB_STATUS_VMON_BASE + 1)
> >>@@ -101,6 +105,7 @@ struct pmbus_data {
> >>  	int num_attributes;
> >>  	struct attribute_group group;
> >>  	const struct attribute_group *groups[2];
> >>+	struct dentry *debugfs;		/* debugfs device directory */
> >>  	struct pmbus_sensor *sensors;
> >>@@ -119,6 +124,11 @@ struct pmbus_data {
> >>  	u8 currpage;
> >>  };
> >>+struct pmbus_debugfs_entry {
> >>+	struct device *dev;
> >>+	int index;
> >>+};
> >>+
> >>  void pmbus_clear_cache(struct i2c_client *client)
> >>  {
> >>  	struct pmbus_data *data = i2c_get_clientdata(client);
> >>@@ -422,6 +432,19 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
> >>  					= _pmbus_read_byte_data(client, i,
> >>  								s->reg);
> >>  			}
> >>+
> >>+			if (!data->debugfs)
> >>+				continue;
> >>+
> >>+			data->status[PB_STATUS_CML_BASE + i]
> >>+				= _pmbus_read_byte_data(client, i,
> >>+							PMBUS_STATUS_CML);
> >>+			data->status[PB_STATUS_OTHER_BASE + i]
> >>+				= _pmbus_read_byte_data(client, i,
> >>+							PMBUS_STATUS_OTHER);
> >>+			data->status[PB_STATUS_MFR_BASE + i]
> >>+			    = _pmbus_read_byte_data(client, i,
> >>+						    PMBUS_STATUS_MFR_SPECIFIC);
> >>  		}
> >>  		if (info->func[0] & PMBUS_HAVE_STATUS_INPUT)
> >>@@ -1891,6 +1914,151 @@ static int pmbus_regulator_register(struct pmbus_data *data)
> >>  }
> >>  #endif
> >>+static int pmbus_debugfs_get(void *data, u64 *val)
> >>+{
> >>+	struct pmbus_debugfs_entry *entry = data;
> >>+	struct pmbus_data *pdata = pmbus_update_device(entry->dev);
> >>+
> >>+	*val = pdata->status[entry->index];
> >>+
> >>+	return 0;
> >>+}
> >>+
> >>+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops8, pmbus_debugfs_get, NULL,
> >>+			 "0x%02llx\n");
> >>+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops16, pmbus_debugfs_get, NULL,
> >>+			 "0x%04llx\n");
> >>+
> >>+static int pmbus_init_debugfs(struct i2c_client *client,
> >>+			      struct pmbus_data *data)
> >>+{
> >>+	int i, idx = 0;
> >>+	struct dentry *dbg;
> >>+	char name[PMBUS_NAME_SIZE];
> >>+	struct pmbus_debugfs_entry *entries;
> >>+
> >>+	/*
> >>+	 * Either user didn't request debugfs or debugfs is not enabled in
> >>+	 * kernel. Exit but don't throw an error in these cases.
> >>+	 */
> >Here might be the place to initialize pmbus_debugfs_dir
> >if it is not yet initialized.
> >
> >>+	if (!data->info->debugfs || !pmbus_debugfs_dir)
> >>+		return 0;
> >>+
> >>+	/*
> >>+	 * Create the debugfs directory for this device. Use the hwmon device
> >>+	 * name to avoid conflicts (hwmon numbers are globally unique).
> >>+	 */
> >>+	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
> >>+					   pmbus_debugfs_dir);
> >>+	if (IS_ERR_OR_NULL(data->debugfs)) {
> >>+		data->debugfs = NULL;
> >>+		return -ENODEV;
> >>+	}
> >>+
> >>+	/* Allocate the max possible entries we need. */
> >>+	entries = devm_kzalloc(data->dev,
> >>+			       sizeof(*entries) * (data->info->pages * 10),
> >>+			       GFP_KERNEL);
> >>+	if (!entries)
> >>+		return -ENOMEM;
> >>+
> >>+	for (i = 0; i < data->info->pages; ++i) {
> >>+		/* check accessibility of status register if it's not page 0 */
> >>+		if (!i || pmbus_check_status_register(client, i)) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops16);
> >What is the point of the dbg variable ?
> >
> >>+		}
> >>+
> >>+		if (data->info->func[i] & PMBUS_HAVE_STATUS_VOUT) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_VOUT_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_vout", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (data->info->func[i] & PMBUS_HAVE_STATUS_IOUT) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_IOUT_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_iout", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (data->info->func[i] & PMBUS_HAVE_STATUS_INPUT) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_INPUT_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_input", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (data->info->func[i] & PMBUS_HAVE_STATUS_TEMP) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_TEMP_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_temp", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_CML)) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_CML_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_cml", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (pmbus_check_byte_register(client, i, PMBUS_STATUS_OTHER)) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_OTHER_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_other", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (pmbus_check_byte_register(client, i,
> >>+					      PMBUS_STATUS_MFR_SPECIFIC)) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_MFR_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_mfr", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN12) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_FAN_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_fan12", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+
> >>+		if (data->info->func[i] & PMBUS_HAVE_STATUS_FAN34) {
> >>+			entries[idx].dev = data->hwmon_dev;
> >>+			entries[idx].index = PB_STATUS_FAN34_BASE + i;
> >>+			snprintf(name, PMBUS_NAME_SIZE, "status%d_fan34", i);
> >>+			dbg = debugfs_create_file(name, 0444, data->debugfs,
> >>+						  &entries[idx++],
> >>+						  &pmbus_debugfs_ops8);
> >>+		}
> >>+	}
> >>+
> >>+	return 0;
> >>+}
> >>+
> >Typically debugfs code is conditional. What happens if DEBUGFS
> >is not enabled ? See below.
> >
> >>  int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
> >>  		   struct pmbus_driver_info *info)
> >>  {
> >>@@ -1950,6 +2118,10 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
> >>  	if (ret)
> >>  		goto out_unregister;
> >>+	ret = pmbus_init_debugfs(client, data);
> >>+	if (ret)
> >>+		dev_warn(dev, "Failed to register debugfs\n");
> >I think this warning will be generated if debugfs is disabled.
> >We should not do that. Consider putting the debugfs code into
> >#fidef and have a dummy pmbus_init_debugfs() returning 0 if
> >it is disabled.
> 
> Yes, good idea.
> 
> >
> >>+
> >>  	return 0;
> >>  out_unregister:
> >>@@ -1963,6 +2135,9 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
> >>  int pmbus_do_remove(struct i2c_client *client)
> >>  {
> >>  	struct pmbus_data *data = i2c_get_clientdata(client);
> >>+
> >>+	debugfs_remove_recursive(data->debugfs);
> >>+
> >>  	hwmon_device_unregister(data->hwmon_dev);
> >>  	kfree(data->group.attrs);
> >>  	return 0;
> >>-- 
> >>1.8.3.1
> >>
> >>--
> >>To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
