Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:43336 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752801AbdK2VPU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Nov 2017 16:15:20 -0500
Date: Wed, 29 Nov 2017 13:15:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v6,3/4] pmbus (core): Add virtual page config bit
Message-ID: <20171129211518.GA22235@roeck-us.net>
References: <57d31e056da37bab946a42c30c1aa4f0a0a595f1.1511152748.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57d31e056da37bab946a42c30c1aa4f0a0a595f1.1511152748.git-series.andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 20, 2017 at 03:12:05PM +1030, Andrew Jeffery wrote:
> Some circumstances call for virtual pages, to expose multiple values
> packed into an extended PMBus register in a manner non-compliant with
> the PMBus standard. An example of this is the Maxim MAX31785 controller,
> which extends the READ_FAN_SPEED_1 PMBus register from two to four bytes
> to support tach readings for both rotors of a dual rotor fan. This extended
> register contains two word-sized values, one reporting the rate of the
> fastest rotor, the other the rate of the slowest. The concept of virtual
> pages aids this situation by mapping the page number onto the value to be
> selected from the vectored result.
> 
> We should not try to set virtual pages on the device as such a page
> explicitly doesn't exist; add a flag so we can avoid doing so.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      |  2 ++
>  drivers/hwmon/pmbus/pmbus_core.c | 27 ++++++++++++++++++---------
>  2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index b54d7604d3ef..d39d506aa63e 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
>  #define PMBUS_HAVE_PWM12	BIT(20)
>  #define PMBUS_HAVE_PWM34	BIT(21)
>  
> +#define PMBUS_PAGE_VIRTUAL	BIT(31)
> +
>  enum pmbus_data_format { linear = 0, direct, vid };
>  enum vrm_version { vr11 = 0, vr12, vr13 };
>  
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index edc25efe7552..e215bbd403a5 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -161,18 +161,27 @@ EXPORT_SYMBOL_GPL(pmbus_clear_cache);
>  int pmbus_set_page(struct i2c_client *client, int page)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> -	int rv = 0;
> -	int newpage;
> +	int rv;
> +
> +	if (page < 0 || page == data->currpage)
> +		return 0;
>  
> -	if (page >= 0 && page != data->currpage) {
> +	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
>  		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> -		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> -		if (newpage != page)
> -			rv = -EIO;
> -		else
> -			data->currpage = page;
> +		if (rv < 0)
> +			return rv;
> +
> +		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> +		if (rv < 0)
> +			return rv;
> +
> +		if (rv != page)
> +			return -EIO;
>  	}
> -	return rv;
> +
> +	data->currpage = page;
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(pmbus_set_page);
>  
