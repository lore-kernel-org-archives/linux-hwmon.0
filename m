Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49676 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932177AbcIAMKS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2016 08:10:18 -0400
Subject: Re: [PATCH] hwmon: adt7470: Allow faster removal
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <61bb13ce-5040-40d8-c824-624a3cf08cf1@roeck-us.net>
Date: Thu, 1 Sep 2016 05:10:13 -0700
MIME-Version: 1.0
In-Reply-To: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/31/2016 10:17 PM, Joshua Scott wrote:
> adt7470_remove will wait for the update thread to complete before
> returning. This has a worst-case time of up to the user-configurable
> auto_update_interval.
>
> Break this delay into smaller slices to allow the thread to exit quickly
> when adt7470_remove is called.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
>  drivers/hwmon/adt7470.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 7d185a9..ba97392 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -268,14 +268,21 @@ static int adt7470_update_thread(void *p)
>  {
>  	struct i2c_client *client = p;
>  	struct adt7470_data *data = i2c_get_clientdata(client);
> +	unsigned long next_read = jiffies - 1;
>
>  	while (!kthread_should_stop()) {
> -		mutex_lock(&data->lock);
> -		adt7470_read_temperatures(client, data);
> -		mutex_unlock(&data->lock);
> +
> +		if (time_after_eq(jiffies, next_read)) {
> +			next_read = jiffies + data->auto_update_interval * HZ / 1000;
> +			mutex_lock(&data->lock);
> +			adt7470_read_temperatures(client, data);
> +			mutex_unlock(&data->lock);
> +		}
> +
> +		msleep_interruptible(1);
> +


This puts a heavy burden on the system, forcing it to run every ms, just for
the unlikely case of driver removal. Why is quick removal so important ?
If it is, we'll have to find a better solution.

Guenter

>  		if (kthread_should_stop())
>  			break;
> -		msleep_interruptible(data->auto_update_interval);
>  	}
>
>  	complete_all(&data->auto_update_stop);
>

