Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54821 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbdHMNiW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Aug 2017 09:38:22 -0400
Date: Sun, 13 Aug 2017 06:38:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v2,2/4] hwmon: (pmbus): Access word data for STATUS_WORD
Message-ID: <20170813133820.GA5224@roeck-us.net>
References: <1502402270-15328-3-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502402270-15328-3-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2017 at 04:57:48PM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Pmbus always reads byte data from the status register, even if
> configured to use STATUS_WORD. Use a function pointer to read the
> correct amount of data from the registers.
> Also switch to try STATUS_WORD first before STATUS_BYTE on init.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 54 +++++++++++++++++++++++++++++-----------
>  1 file changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 4ec7586..277d170 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -113,7 +113,8 @@ struct pmbus_data {
>  	 * so we keep them all together.
>  	 */
>  	u16 status[PB_NUM_STATUS_REG];
> -	u8 status_register;
> +
> +	int (*read_status)(struct i2c_client *client, int page);
>  
>  	u8 currpage;
>  };
> @@ -324,7 +325,7 @@ static int pmbus_check_status_cml(struct i2c_client *client)
>  	struct pmbus_data *data = i2c_get_clientdata(client);
>  	int status, status2;
>  
> -	status = _pmbus_read_byte_data(client, -1, data->status_register);
> +	status = data->read_status(client, -1);
>  	if (status < 0 || (status & PB_STATUS_CML)) {
>  		status2 = _pmbus_read_byte_data(client, -1, PMBUS_STATUS_CML);
>  		if (status2 < 0 || (status2 & PB_CML_FAULT_INVALID_COMMAND))
> @@ -348,6 +349,23 @@ static bool pmbus_check_register(struct i2c_client *client,
>  	return rv >= 0;
>  }
>  
> +static bool pmbus_check_status_register(struct i2c_client *client, int page)
> +{
> +	int status;
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +
> +	status = data->read_status(client, page);
> +	if (status >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK) &&
> +	    (status & PB_STATUS_CML)) {
> +		status = _pmbus_read_byte_data(client, -1, PMBUS_STATUS_CML);
> +		if (status < 0 || (status & PB_CML_FAULT_INVALID_COMMAND))
> +			status = -EIO;
> +	}
> +
> +	pmbus_clear_fault_page(client, -1);
> +	return status >= 0;
> +}
> +
>  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
>  {
>  	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
> @@ -394,8 +412,7 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
>  
>  		for (i = 0; i < info->pages; i++) {
>  			data->status[PB_STATUS_BASE + i]
> -			    = _pmbus_read_byte_data(client, i,
> -						    data->status_register);
> +			    = data->read_status(client, i);
>  			for (j = 0; j < ARRAY_SIZE(pmbus_status); j++) {
>  				struct _pmbus_status *s = &pmbus_status[j];
>  
> @@ -1051,8 +1068,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  		 * the generic status register for this page is accessible.
>  		 */
>  		if (!ret && attr->gbit &&
> -		    pmbus_check_byte_register(client, page,
> -					      data->status_register)) {
> +		    pmbus_check_status_register(client, page)) {
>  			ret = pmbus_add_boolean(data, name, "alarm", index,
>  						NULL, NULL,
>  						PB_STATUS_BASE + page,
> @@ -1729,6 +1745,16 @@ static int pmbus_identify_common(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static int pmbus_read_status_byte(struct i2c_client *client, int page)
> +{
> +	return _pmbus_read_byte_data(client, page, PMBUS_STATUS_BYTE);
> +}
> +
> +static int pmbus_read_status_word(struct i2c_client *client, int page)
> +{
> +	return _pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
> +}
> +
>  static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  			     struct pmbus_driver_info *info)
>  {
> @@ -1736,16 +1762,16 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	int page, ret;
>  
>  	/*
> -	 * Some PMBus chips don't support PMBUS_STATUS_BYTE, so try
> -	 * to use PMBUS_STATUS_WORD instead if that is the case.
> +	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
> +	 * to use PMBUS_STATUS_BYTE instead if that is the case.
>  	 * Bail out if both registers are not supported.
>  	 */
> -	data->status_register = PMBUS_STATUS_BYTE;
> -	ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
> -	if (ret < 0 || ret == 0xff) {
> -		data->status_register = PMBUS_STATUS_WORD;
> -		ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> -		if (ret < 0 || ret == 0xffff) {
> +	data->read_status = pmbus_read_status_word;
> +	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> +	if (ret < 0 || ret == 0xffff) {
> +		data->read_status = pmbus_read_status_byte;
> +		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
> +		if (ret < 0 || ret == 0xff) {
>  			dev_err(dev, "PMBus status register not found\n");
>  			return -ENODEV;
>  		}
