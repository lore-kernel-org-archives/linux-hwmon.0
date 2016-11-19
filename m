Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46969 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752881AbcKSVBF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 16:01:05 -0500
Date: Sat, 19 Nov 2016 13:01:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC,2/2] hwmon: adt7411: add min, max and alarm attributes
Message-ID: <20161119210103.GA2767@roeck-us.net>
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

>  
> +static int adt7411_write_in(struct device *dev, u32 attr, int channel,
> +			    long val)
> +{
> +	struct adt7411_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int ret, reg;
> +
> +	mutex_lock(&data->update_lock);
> +	ret = adt7411_update_vref(dev);
> +	if (ret < 0)
> +		goto exit_unlock;
> +	val = DIV_ROUND_CLOSEST(val * 256, data->vref_cached);
> +	val = clamp_val(val, 0, 255);
> +
> +	switch (attr) {
> +	case hwmon_in_min:
> +		reg = ADT7411_REG_IN_LOW(channel);
> +		break;
> +	case hwmon_in_max:
> +		reg = ADT7411_REG_IN_HIGH(channel);
> +		break;

This is also used to set the vdd limits, but it does not write into the vdd
limit registers. ADT7411_REG_IN_HIGH(0) == ADT7411_REG_IN_HIGH(1) == 0x27,
but it should be 0x23. Same for the low limit register.

Guenter
