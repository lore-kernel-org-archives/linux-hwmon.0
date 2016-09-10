Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49872 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751174AbcIJXXi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Sep 2016 19:23:38 -0400
Subject: Re: [PATCH 2/2] hwmon: adt7470: Allow faster removal
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20160909051926.4253-1-joshua.scott@alliedtelesis.co.nz>
 <20160909051926.4253-2-joshua.scott@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d0a0b2ab-a756-1f1e-1771-e889d1c51a81@roeck-us.net>
Date: Sat, 10 Sep 2016 16:23:36 -0700
MIME-Version: 1.0
In-Reply-To: <20160909051926.4253-2-joshua.scott@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/08/2016 10:19 PM, Joshua Scott wrote:
> adt7470_remove will wait for the update thread to complete before
> returning. This had a worst-case time of up to the user-configurable
> auto_update_interval.
>
> Replace msleep_interruptible with set_current_state and schedule_timeout
> so that kthread_stop will interrupt the sleep.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>

Applied to -next.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7470.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index dbd758b..ffe1edc 100644
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
> +		schedule_timeout(msecs_to_jiffies(data->auto_update_interval));
>  	}
>
>  	complete_all(&data->auto_update_stop);
>

