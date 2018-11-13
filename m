Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36229 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbeKMO1m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 09:27:42 -0500
Date: Mon, 12 Nov 2018 20:31:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add mutex lock to shunt nodes
Message-ID: <20181113043122.GA11205@roeck-us.net>
References: <20181113042324.852-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113042324.852-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 12, 2018 at 08:23:24PM -0800, Nicolin Chen wrote:
> The shunt resistor values are used to calculate shunt voltages
> and currents. As a part of sysfs nodes, it would be better to
> get protected with the same mutex too as other sysfs ABI nodes,
> although this is not very critical because the mutex was added
> to mainly protect register access.
> 
> So this patch adds the mutex lock to protect the shunt node.
> 

I am missing something here. I don't see the point of this mutex.
It just reads a variable and reports the result. When setting,
it just writes a value. Protecting the conversion of the passed
value with a mutex is pointless. Protecting writing the value
against reading it is just as pointless.

Guenter

> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/hwmon/ina3221.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 86281afd2619..f7a09ab6c440 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -532,8 +532,15 @@ static ssize_t ina3221_show_shunt(struct device *dev,
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>  	unsigned int channel = sd_attr->index;
>  	struct ina3221_input *input = &ina->inputs[channel];
> +	ssize_t ret;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
> +	mutex_lock(&ina->lock);
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
> +
> +	mutex_unlock(&ina->lock);
> +
> +	return ret;
>  }
>  
>  static ssize_t ina3221_set_shunt(struct device *dev,
> @@ -547,14 +554,20 @@ static ssize_t ina3221_set_shunt(struct device *dev,
>  	int val;
>  	int ret;
>  
> +	mutex_lock(&ina->lock);
> +
>  	ret = kstrtoint(buf, 0, &val);
> -	if (ret)
> +	if (ret) {
> +		mutex_unlock(&ina->lock);
>  		return ret;
> +	}
>  
>  	val = clamp_val(val, 1, INT_MAX);
>  
>  	input->shunt_resistor = val;
>  
> +	mutex_unlock(&ina->lock);
> +
>  	return count;
>  }
>  
> -- 
> 2.17.1
> 
