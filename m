Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45700 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752348AbcGTBzj (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 19 Jul 2016 21:55:39 -0400
Subject: Re: [PATCH] hwmon: adt7411: set bit 3 in CFG1 register
To: Michael Walle <michael@walle.cc>, Jean Delvare <jdelvare@suse.com>
References: <1468497127-6325-1-git-send-email-michael@walle.cc>
 <1468939406-25461-1-git-send-email-michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Rini <rini@arvoo.nl>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <578EDA0A.2060706@roeck-us.net>
Date: Tue, 19 Jul 2016 18:55:22 -0700
MIME-Version: 1.0
In-Reply-To: <1468939406-25461-1-git-send-email-michael@walle.cc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/19/2016 07:43 AM, Michael Walle wrote:
> According to the datasheet you should only write 1 to this bit. If it is
> not set, at least AIN3 will return bad values on newer silicon revisions.
>
> Fixes: d84ca5b345c2 ("hwmon: Add driver for ADT7411 voltage and temperature sensor")
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied.

Thanks,
Guenter

> ---
>
> This is v2 of the previous patch "hwmon: adt7411: add rev5 workaround".
>
> Changes since v1:
>   - use adt7411_modify_bit once with a bitmask
>   - change wording of the commit message and the comment. Just mention
>     that the datasheet requires to set this bit on writes.
>
>   drivers/hwmon/adt7411.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
> index 827c037..a7f8869 100644
> --- a/drivers/hwmon/adt7411.c
> +++ b/drivers/hwmon/adt7411.c
> @@ -30,6 +30,7 @@
>
>   #define ADT7411_REG_CFG1			0x18
>   #define ADT7411_CFG1_START_MONITOR		(1 << 0)
> +#define ADT7411_CFG1_RESERVED_BIT3		(1 << 3)
>
>   #define ADT7411_REG_CFG2			0x19
>   #define ADT7411_CFG2_DISABLE_AVG		(1 << 5)
> @@ -296,8 +297,10 @@ static int adt7411_probe(struct i2c_client *client,
>   	mutex_init(&data->device_lock);
>   	mutex_init(&data->update_lock);
>
> +	/* According to the datasheet, we must only write 1 to bit 3 */
>   	ret = adt7411_modify_bit(client, ADT7411_REG_CFG1,
> -				 ADT7411_CFG1_START_MONITOR, 1);
> +				 ADT7411_CFG1_RESERVED_BIT3
> +				 | ADT7411_CFG1_START_MONITOR, 1);
>   	if (ret < 0)
>   		return ret;
>
>

