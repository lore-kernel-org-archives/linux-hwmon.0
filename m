Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:56309 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751295AbdJ1PnH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Oct 2017 11:43:07 -0400
Date: Sat, 28 Oct 2017 08:43:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@aj.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v2] hwmon: (pmbus/core): Prevent unintentional setting of page
 to 0xFF
Message-ID: <20171028154304.GA5541@roeck-us.net>
References: <1509123305-10050-1-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509123305-10050-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 27, 2017 at 11:55:05AM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> The pmbus core may call read/write word data functions with a page value
> of -1, intending to perform the operation without setting the page.
> However, the read/write word data functions accept only unsigned 8-bit
> page numbers, and therefore cannot check for negative page number to
> avoid setting the page. This results in setting the page number to 0xFF.
> This may result in errors or undefined behavior of some devices
> (specifically the ir35221, which allows the page to be set to 0xFF,
> but some subsequent operations to read registers may fail).
> 
> Switch the pmbus_set_page page parameter to an integer and perform the
> check for negative page there. Make read/write functions consistent in
> accepting an integer page number parameter.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied. Note that the problem was introduced with commit cbcdec6202c9
("hwmon: (pmbus): Access word data for STATUS_WORD"). I marked the patch
accordingly.

Thanks,
Guenter

> ---
> 
> Changes since v1:
>  * Move check for negative page to pmbus_set_page and change pmbus_set_page
>    page parameter to int.
> 
>  drivers/hwmon/pmbus/pmbus.h      |  6 +++---
>  drivers/hwmon/pmbus/pmbus_core.c | 25 +++++++++++--------------
>  2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 4efa2bd..fa613bd 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -404,9 +404,9 @@ struct pmbus_driver_info {
>  /* Function declarations */
>  
>  void pmbus_clear_cache(struct i2c_client *client);
> -int pmbus_set_page(struct i2c_client *client, u8 page);
> -int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
> -int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word);
> +int pmbus_set_page(struct i2c_client *client, int page);
> +int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg);
> +int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg, u16 word);
>  int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg);
>  int pmbus_write_byte(struct i2c_client *client, int page, u8 value);
>  int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 302f0ae..52a58b8 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -136,13 +136,13 @@ void pmbus_clear_cache(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_clear_cache);
>  
> -int pmbus_set_page(struct i2c_client *client, u8 page)
> +int pmbus_set_page(struct i2c_client *client, int page)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
>  	int rv = 0;
>  	int newpage;
>  
> -	if (page != data->currpage) {
> +	if (page >= 0 && page != data->currpage) {
>  		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
>  		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
>  		if (newpage != page)
> @@ -158,11 +158,9 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
>  {
>  	int rv;
>  
> -	if (page >= 0) {
> -		rv = pmbus_set_page(client, page);
> -		if (rv < 0)
> -			return rv;
> -	}
> +	rv = pmbus_set_page(client, page);
> +	if (rv < 0)
> +		return rv;
>  
>  	return i2c_smbus_write_byte(client, value);
>  }
> @@ -186,7 +184,8 @@ static int _pmbus_write_byte(struct i2c_client *client, int page, u8 value)
>  	return pmbus_write_byte(client, page, value);
>  }
>  
> -int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
> +int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
> +			  u16 word)
>  {
>  	int rv;
>  
> @@ -219,7 +218,7 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
>  	return pmbus_write_word_data(client, page, reg, word);
>  }
>  
> -int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
> +int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
>  {
>  	int rv;
>  
> @@ -255,11 +254,9 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
>  {
>  	int rv;
>  
> -	if (page >= 0) {
> -		rv = pmbus_set_page(client, page);
> -		if (rv < 0)
> -			return rv;
> -	}
> +	rv = pmbus_set_page(client, page);
> +	if (rv < 0)
> +		return rv;
>  
>  	return i2c_smbus_read_byte_data(client, reg);
>  }
