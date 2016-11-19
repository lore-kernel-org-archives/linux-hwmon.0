Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41976 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753273AbcKSUy4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 15:54:56 -0500
Date: Sat, 19 Nov 2016 12:54:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC,2/2] hwmon: adt7411: add min, max and alarm attributes
Message-ID: <20161119205454.GA14249@roeck-us.net>
References: <1476438215-6654-2-git-send-email-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476438215-6654-2-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 14, 2016 at 11:43:35AM +0200, Michael Walle wrote:
> This patch adds support for the min, max and alarm attributes of the
> voltage and temperature channels. Additionally, the temp2_fault attribute
> is supported which indicates a fault of the external temperature diode.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/hwmon/adt7411.c | 306 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 271 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
> index 2f44cdc..c6351b8 100644
> --- a/drivers/hwmon/adt7411.c
> +++ b/drivers/hwmon/adt7411.c
[ ... ]
>  static int adt7411_read_in_vdd(struct device *dev, u32 attr, long *val)
>  {
>  	struct adt7411_data *data = dev_get_drvdata(dev);
> @@ -179,32 +242,40 @@ static int adt7411_read_in_vdd(struct device *dev, u32 attr, long *val)
>  			return ret;
>  		*val = ret * 7000 / 1024;
>  		return 0;
> +	case hwmon_in_min:
> +		ret = i2c_smbus_read_byte_data(client, ADT7411_REG_VDD_LOW);
> +		if (ret < 0)
> +			return ret;
> +		*val = ret * 7000 / 256;
> +		return 0;
> +	case hwmon_in_max:
> +		ret = i2c_smbus_read_byte_data(client, ADT7411_REG_VDD_HIGH);
> +		if (ret < 0)
> +			return ret;
> +		*val = ret * 7000 / 256;

		return 0;

> +	case hwmon_in_alarm:
> +		return adt7411_read_in_alarm(dev, 0, val);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
>  }
