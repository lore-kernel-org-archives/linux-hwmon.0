Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56920 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753856AbcGDVEl (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Jul 2016 17:04:41 -0400
Subject: Re: [RFC PATCH] hwmon: (jc42) Add I2C_CLASS_HWMON to detection class
To: Alison Schofield <amsfield22@gmail.com>
References: <20160704191908.GA9056@d830.WORKGROUP>
Cc: Jean Delvare <jdelvare@suse.com>,
	"open list:JC42.4 TEMPERATURE SENSOR DRIVER"
	<linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org,
	daniel.baluta@gmail.com
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <577ACF62.9030109@roeck-us.net>
Date: Mon, 4 Jul 2016 14:04:34 -0700
MIME-Version: 1.0
In-Reply-To: <20160704191908.GA9056@d830.WORKGROUP>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/04/2016 12:19 PM, Alison Schofield wrote:
> In 2011, commit 774466add7c810fd7e4c8bcf41995b6799608880 changed
> the detection class of these chips to I2C_CLASS_SPD based on this
> premise: "makes more sense because these chips always live on
> memory modules"
>
> Today these chips have applications beyond memory modules.
>

Do you have a specific example ?

> Add I2C_CLASS_HWMON as an additional detection class to allow
> detection by hwmon class i2c adapters.
>

Practical impact should be limited, though. Most adapters have both
I2C_CLASS_HWMON and I2C_CLASS_SPD flags set. Besides the Diolan adapters,
which are experimental in nature anyway (and where it actually might make
sense to add I2C_CLASS_SPD), do you have an example where a JC-42 compatible
chip is used with an adapter which does not have I2C_CLASS_SPD set in
its flags ?

> Alternative is to replace the SPD w HWMON class, but that carries
> risk for existing usage.
>
Yes, the driver would stop working on adapters which only have I2C_CLASS_SPD
set. There are only two of those, but those two presumably _do_ have memory
modules connected.

Guenter

> Signed-off-by: Alison Schofield <amsfield22@gmail.com>
> Cc: Daniel Baluta <daniel.baluta@gmail.com>
> ---
>   drivers/hwmon/jc42.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index 9887d32..1537ba0 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -538,7 +538,7 @@ static const struct i2c_device_id jc42_id[] = {
>   MODULE_DEVICE_TABLE(i2c, jc42_id);
>
>   static struct i2c_driver jc42_driver = {
> -	.class		= I2C_CLASS_SPD,
> +	.class		= I2C_CLASS_SPD | I2C_CLASS_HWMON,
>   	.driver = {
>   		.name	= "jc42",
>   		.pm = JC42_DEV_PM_OPS,
>

