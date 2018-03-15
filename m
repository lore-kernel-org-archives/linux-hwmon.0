Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH -next] hwmon: (scmi) return -EINVAL when sensor
 information is unavailable
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-hwmon@vger.kernel.org
References: <1521137299-31363-1-git-send-email-sudeep.holla@arm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <91ffbe33-29c7-9836-283c-0c6c13c60b1e@roeck-us.net>
Date: Thu, 15 Mar 2018 14:27:21 -0700
MIME-Version: 1.0
In-Reply-To: <1521137299-31363-1-git-send-email-sudeep.holla@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

On 03/15/2018 11:08 AM, Sudeep Holla wrote:
> Passing NULL pointer to PTR_ERR will result in return value of 0
> indicating success which is clearly not what it is intended here.
> 
> This patch returns -EINVAL instead when the sensor information is not
> available.
> 
> Fixes: b23688aefb8b ("hwmon: add support for sensors exported via ARM SCMI")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/scmi-hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hi Guenter,
> 
> I will try to push this via ARM-SoC if possible before v4.17 merge window.
> So please provide Ack if you are fine.
> 
> Regards,
> Sudeep
> 
> diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
> index 32e750373ced..363bf56eb0f2 100644
> --- a/drivers/hwmon/scmi-hwmon.c
> +++ b/drivers/hwmon/scmi-hwmon.c
> @@ -138,7 +138,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
>   	for (i = 0; i < nr_sensors; i++) {
>   		sensor = handle->sensor_ops->info_get(handle, i);
>   		if (!sensor)
> -			return PTR_ERR(sensor);
> +			return -EINVAL;
>   
>   		switch (sensor->type) {
>   		case TEMPERATURE_C:
> 
