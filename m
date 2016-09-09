Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50285 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbcIIERR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2016 00:17:17 -0400
Subject: Re: [PATCH] hwmon: adt7470: Allow faster removal
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20160906224938.6640-1-joshua.scott@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <62a97927-38ec-071c-30c9-98ad0cea95fd@roeck-us.net>
Date: Thu, 8 Sep 2016 21:17:13 -0700
MIME-Version: 1.0
In-Reply-To: <20160906224938.6640-1-joshua.scott@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/06/2016 03:49 PM, Joshua Scott wrote:
> adt7470_remove will wait for the update thread to complete before
> returning. This had a worst-case time of up to the user-configurable
> auto_update_interval.
>
> Replace msleep_interruptible with set_current_state and schedule_timeout
> so that kthread_stop will interrupt the sleep.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
>  drivers/hwmon/adt7470.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 7d185a9..e93c528 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -273,9 +273,12 @@ static int adt7470_update_thread(void *p)
>  		mutex_lock(&data->lock);
>  		adt7470_read_temperatures(client, data);
>  		mutex_unlock(&data->lock);
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
>  		if (kthread_should_stop())
>  			break;
> -		msleep_interruptible(data->auto_update_interval);
> +
> +		schedule_timeout(data->auto_update_interval * HZ / 1000);

Please use msecs_to_jiffies(data->auto_update_interval).

Thanks,
Guenter


