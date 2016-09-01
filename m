Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41377 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752547AbcIAIR4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 1 Sep 2016 04:17:56 -0400
Date: Thu, 1 Sep 2016 10:17:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] hwmon: adt7470: Allow faster removal
Message-ID: <20160901101752.27d3d5f9@endymion>
In-Reply-To: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
References: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Joshua,

On Thu,  1 Sep 2016 17:17:21 +1200, Joshua Scott wrote:
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
>  		if (kthread_should_stop())
>  			break;
> -		msleep_interruptible(data->auto_update_interval);
>  	}
>  
>  	complete_all(&data->auto_update_stop);

This change looks terribly costly to me. In order to shorten the
duration of a rare event (you don't "rmmod adt7470" on a regular basis,
do you?) you increase the cost of a kernel thread which runs all the
time. I'm afraid this msleep_interruptible(1) is going to prevent the
CPU from entering low power states at all, leading to an increased
system temperature and power consumption. Have you compared the output
of "powertop" (specifically the "Idle stats" section) before and after
your patch?

Is there no way to voluntarily interrupt this long msleep_interruptible?

-- 
Jean Delvare
SUSE L3 Support
