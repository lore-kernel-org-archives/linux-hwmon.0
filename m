Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:44639 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdLGUmg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Dec 2017 15:42:36 -0500
Date: Thu, 7 Dec 2017 12:42:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, mspinler@linux.vnet.ibm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH 1/2] hwmon: (pmbus): Export pmbus device debugfs
 directory entry
Message-ID: <20171207204234.GA7736@roeck-us.net>
References: <1512676238-8020-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1512676238-8020-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512676238-8020-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 07, 2017 at 01:50:37PM -0600, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Pmbus client drivers, if they want to use debugfs, should use the same
> root directory as the pmbus debugfs entries are using. Therefore, export
> the device dentry for the pmbus client.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/pmbus/pmbus.h      | 2 ++
>  drivers/hwmon/pmbus/pmbus_core.c | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index d39d506..1d24397 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -461,4 +461,6 @@ int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
>  			      enum pmbus_fan_mode mode);
>  int pmbus_update_fan(struct i2c_client *client, int page, int id,
>  		     u8 config, u8 mask, u16 command);
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
> +
>  #endif /* PMBUS_H */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 99ab39f..9abd382 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2381,6 +2381,13 @@ int pmbus_do_remove(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_do_remove);
>  
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +
> +	return data->debugfs;
> +}
EXPORT_SYMBOL_GPL(pmbus_get_debugfs_dir);

> +
>  static int __init pmbus_core_init(void)
>  {
>  	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
