Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:43464 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752355AbdLNOiu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Dec 2017 09:38:50 -0500
Date: Thu, 14 Dec 2017 06:38:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, joel@jms.id.au, bjwyman@gmail.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v3,1/2] hwmon (pmbus): Export pmbus device debugfs directory
 entry
Message-ID: <20171214143848.GA1267@roeck-us.net>
References: <1513027970-3494-2-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513027970-3494-2-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Dec 11, 2017 at 03:32:49PM -0600, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Pmbus client drivers, if they want to use debugfs, should use the same
> root directory as the pmbus debugfs entries are using. Therefore, export
> the device dentry for the pmbus client.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      | 2 ++
>  drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
>  2 files changed, 10 insertions(+)
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
> index 99ab39f..f7c47d7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2381,6 +2381,14 @@ int pmbus_do_remove(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_do_remove);
>  
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +
> +	return data->debugfs;
> +}
> +EXPORT_SYMBOL_GPL(pmbus_get_debugfs_dir);
> +
>  static int __init pmbus_core_init(void)
>  {
>  	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
