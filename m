Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34717 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755119AbcIRRKR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Sep 2016 13:10:17 -0400
Subject: Re: [PATCH] hwmon: (adt7470) No need for additional synchronization
 on kthread_stop()
To: Daniel Wagner <wagi@monom.org>, linux-kernel@vger.kernel.org
References: <1474013256-9996-1-git-send-email-wagi@monom.org>
Cc: Daniel Wagner <daniel.wagner@bmw-carit.de>,
        "Darrick J . Wong" <djwong@us.ibm.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0351c5d6-cdd0-72b1-c941-f9deafd3eb72@roeck-us.net>
Date: Sun, 18 Sep 2016 10:10:13 -0700
MIME-Version: 1.0
In-Reply-To: <1474013256-9996-1-git-send-email-wagi@monom.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/16/2016 01:07 AM, Daniel Wagner wrote:
> From: Daniel Wagner <daniel.wagner@bmw-carit.de>
>
> The kthread_stop() waits for the thread to exit. There is no need for an
> additional synchronization needed to join on the kthread.
>
> The completation was added by 89fac11cb3e7 ("adt7470: make automatic fan
> control really work").
>
> Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
> Cc: Darrick J. Wong <djwong@us.ibm.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7470.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index f5da39a..f5d618c 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -170,7 +170,6 @@ struct adt7470_data {
>  	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
>
>  	struct task_struct	*auto_update;
> -	struct completion	auto_update_stop;
>  	unsigned int		auto_update_interval;
>  };
>
> @@ -271,7 +270,6 @@ static int adt7470_update_thread(void *p)
>  		msleep_interruptible(data->auto_update_interval);
>  	}
>
> -	complete_all(&data->auto_update_stop);
>  	return 0;
>  }
>
> @@ -1256,7 +1254,6 @@ static int adt7470_probe(struct i2c_client *client,
>  	if (IS_ERR(hwmon_dev))
>  		return PTR_ERR(hwmon_dev);
>
> -	init_completion(&data->auto_update_stop);
>  	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",
>  					dev_name(hwmon_dev));
>  	if (IS_ERR(data->auto_update)) {
> @@ -1271,7 +1268,6 @@ static int adt7470_remove(struct i2c_client *client)
>  	struct adt7470_data *data = i2c_get_clientdata(client);
>
>  	kthread_stop(data->auto_update);
> -	wait_for_completion(&data->auto_update_stop);
>  	return 0;
>  }
>
>

