Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([198.47.19.11]:56862 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751842AbcFZNcg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 26 Jun 2016 09:32:36 -0400
Subject: Re: [PATCH v2 3/5] hwmon: (tmp102) Improve handling of initial read
 delay
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
 <1466908825-14222-3-git-send-email-linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>
From: Nishanth Menon <nm@ti.com>
Message-ID: <576FD940.4070102@ti.com>
Date: Sun, 26 Jun 2016 08:31:44 -0500
MIME-Version: 1.0
In-Reply-To: <1466908825-14222-3-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/25/2016 09:40 PM, Guenter Roeck wrote:
[...]
>  /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
> @@ -78,8 +82,16 @@ static struct tmp102 *tmp102_update_device(struct device *dev)
>  	struct tmp102 *tmp102 = dev_get_drvdata(dev);
>  	struct i2c_client *client = tmp102->client;
>  
> +	/* Is it too early to return a conversion ? */
> +	if (time_before(jiffies, tmp102->ready_time)) {
> +		unsigned long sleeptime = tmp102->ready_time - jiffies;
> +
> +		msleep(jiffies_to_msecs(sleeptime));
> +	}
> +

While msleep can indeed work and simplify, in case of usage for
example with thermal framework, if the data is not ready and we return
-EAGAIN, it lets the thermal framework go and read other sensors
instead of being blocked on the tmp102 conversion of data.

Eduardo, Rui: what is your view on this approach?
Patch: https://patchwork.kernel.org/patch/9198961/

-- 
Regards,
Nishanth Menon
