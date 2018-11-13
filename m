Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35090 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbeKNDLv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 22:11:51 -0500
Date: Tue, 13 Nov 2018 09:12:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon (lm63) Do not overwrite data->kind
Message-ID: <20181113171249.GA21521@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 12, 2018 at 08:36:56PM -0800, Nicolin Chen wrote:
> According to the code right before the removed line, data->kind
> should be either from DT or from id pointer. So there shouldn't
> be an additional overwriting after the if-else statement.
> 
> So this patch just removes the overwriting line.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Guenter,
>     I have not really tested this change but still sent it out
>     since it looks obvious. Please feel free to drop it if you
>     have concern at an untested change. Thanks.

Good find. You are right, the patch introducing the DT code didn't
really do anything. Given that no one (including me) noticed that
commit b25f663b91f1a was effectively a no-op, I'll queue this up
for the next kernel release.

Thanks,
Guenter

> 
>  drivers/hwmon/lm63.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 4c1770920d29..eac54b9cdeec 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
> @@ -1120,7 +1120,6 @@ static int lm63_probe(struct i2c_client *client,
>  		data->kind = (enum chips)of_device_get_match_data(&client->dev);
>  	else
>  		data->kind = id->driver_data;
> -	data->kind = id->driver_data;
>  	if (data->kind == lm64)
>  		data->temp2_offset = 16000;
>  
> -- 
> 2.17.1
> 
