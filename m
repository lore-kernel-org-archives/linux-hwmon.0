Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85C30C630
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Feb 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770480720; cv=none; b=He9m2R6j6MftLadw3cF2svVP+HGHMnsWvK2NlEKN2dhaKB1H2xqPJuhyzBolF1yBwURbNzcTbeBITZQpENDuN4T1Tybw72+1CesDMzd9jcLMlCwetp54KRlZt+UqabUVl1CeeuzcymHKuctS4I3nmR7uE8j0DQybrsv7kKR8pyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770480720; c=relaxed/simple;
	bh=ttNEJfocEISpZ4rKWR2uBUqDtMoKoJo8W8gGCSoRE1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsjfTTgYldtPIGab09HeA0CCTjslmdwabydrDnUBBa9mhNe69ttQ7QZzb299AfEbpxWAE6bPRzQgKiaRRIufZUcYx5zqfBJnbEIzV5jmA9UI96Bg4s4exa5JZRwqf8ovP0SwgZZmemWXQ6Q7ji6JMuWJQrW1ut9Co1kPaIbl/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf6roek6; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf6roek6"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b8397e3e09so3686470eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Feb 2026 08:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770480719; x=1771085519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9H6yn0vf+9uk85MubEHWRAx4fvBOqAuNF042pRNy3w=;
        b=gf6roek6X6XvYMniJbziscXQqMUOyhP5vrXQEDxd8oIADiYua5ViwxKa5NUr32qIzW
         Y9ANCYo6UzjRunuBCwU4p5QYTsVXeZUmfZZIlUjOXC00/foGqmeIOoRt8GBVwbIrZsFw
         XoOzflwdZkSpRPjnLHetsy4V+eIbFLzwY/Xdftsyprwx4bsUe9xqPBy9rvm9yGpezODX
         u2h/HXLGJCoHGTfXhB9s9KyPL/iHHLzPA038hWAFu+XGLOPmRkn+oe8ifDUwDfWP4oG1
         d+VQ7e91HVNQG/k/tVNvsvjFmapErIrgWmoqjWN7dChB4AzSubE6/j3LiTw56gniymZ9
         8j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770480719; x=1771085519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9H6yn0vf+9uk85MubEHWRAx4fvBOqAuNF042pRNy3w=;
        b=SC9/KFIpRwREbJXn39yMjxXO999r9Bhx2brkhb1RhDQ93UfkEErlnDnFQbTiZdFXYq
         Fgb46rKTEDsphPcUXvUDRLzgiLQyohy3aglwRg37kDyjHTa9bz1s8sobAEFRxlPThN0w
         diRQdKAGCkgL5jPLyNDCLO0EyT4qC5wuXXAmQADmZpb30hYb0d/YQJ7iWwiFaw2CG5h8
         PFCLmD/q0nHjgYrqatmSjkinC8fOXx1IrpgUOcTiDa+eJWj2Q4l0GBwTShBWZZFITjyZ
         UWkAah1SvWXK80/a4CYyqmbAcnQQ9xiajm/bUZ1Djbt4GvflsxIkrzUldUT8seNUgnBS
         X6ig==
X-Forwarded-Encrypted: i=1; AJvYcCV/ej6Aj7L3Y43xAIwzZbjFwIPfIMUVdPO2kbnlU0ptXVYnVOpe/hg1i9vv0QW534n4YTVCyg5OR8D5bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhqKiehnhCQiY7QSedwDyN1GcdVJ+uloZaiqQEovcJm3i7vYzv
	Yq8dKSz55sf1/SCYZc9+yLHbLsfhJ+k1iTaypepHw6uwwyvjhyZwjGyXG01u2bBK
X-Gm-Gg: AZuq6aIxiFvYf4Mw/DXRVoCWRHLhrCE1TXDfXPRn9XD65JkqUukPDCy/Qj+panD3Az5
	nnPMQ83fJJO1FOrCzmH4Xep4nSate2HDL8YhIIIKf/xTcyZ71AnRZJgXo++CESSUEWfw5xvF0m2
	409Y4TPuXOYhP4RQ6Xta8baBeBBSxEqMPa2feey6Fz7c3sSJTaPmmrT2WKXzvys/BYNYVc7eBYh
	dDp3+FkaVUCzAPr10gCipLPNGyJEDHI58zQ1QNQ8FBx3NNAAcL6fQl7g4T8wHfxSw6kw8M7tdpE
	vDfWrJhZYvHVLVpjQFS/TrbAIliPakbw7vP0MtlTncvjVXVeQ8q7s1yAT1lgL8SUSm+nEKr/qR4
	/p5RU64w5VszjVfAQU8rQ5fsBFoKONWbll5mgGQp99Fq7D4lahm5UsqE0C9ce61Ao9ZYQLV1Pr+
	79rth+fDUrC8tR/6nQnBO24N1E
X-Received: by 2002:a05:7300:a494:b0:2ae:5e93:b6d with SMTP id 5a478bee46e88-2b856a3bcacmr3169827eec.38.1770480719069;
        Sat, 07 Feb 2026 08:11:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c5ec07sm3904163eec.24.2026.02.07.08.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 08:11:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Feb 2026 08:11:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: Junrui Luo <moonafterrain@outlook.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ibmpex) fix use-after-free in high/low store
Message-ID: <112b794a-a735-4cfd-bb96-b251a4da733c@roeck-us.net>
References: <MEYPR01MB7886BE2F51BFE41875B74B60AFA0AMEYPR01MB7886!ausprd01!prod!outlook!com>
 <20260121095342.73e723cb@endymion>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121095342.73e723cb@endymion>

On Wed, Jan 21, 2026 at 09:53:42AM +0100, Jean Delvare wrote:
> Hi Junrui, Guenter,
> 
> On Wed, 10 Dec 2025 09:48:08 +0000, Junrui Luo wrote:
> > The ibmpex_high_low_store() function retrieves driver data using
> > dev_get_drvdata() and uses it without validation. This creates a race
> > condition where the sysfs callback can be invoked after the data
> > structure is freed, leading to use-after-free.
> > 
> > Fix by adding a NULL check after dev_get_drvdata(), and reordering
> > operations in the deletion path to prevent TOCTOU.
> > 
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > Reported-by: Junrui Luo <moonafterrain@outlook.com>
> > Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
> > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > ---
> >  drivers/hwmon/ibmpex.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> > index 228c5f6c6f38..129f3a9e8fe9 100644
> > --- a/drivers/hwmon/ibmpex.c
> > +++ b/drivers/hwmon/ibmpex.c
> > @@ -277,6 +277,9 @@ static ssize_t ibmpex_high_low_store(struct device *dev,
> >  {
> >  	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
> >  
> > +	if (!data)
> > +		return -ENODEV;
> > +
> 
> If this is needed here, then why don't we add a similar check to
> ibmpex_show_sensor()? It's also called by accessing the device's sysfs
> attributes, and also calls dev_get_drvdata(dev).
> 
> >  	ibmpex_reset_high_low_data(data);
> >  
> >  	return count;
> 
> To be honest, I don't really understand the purpose of this fix. As I
> read the code, either device_remove_file() waits for the file writer to
> finish before returning and the code was already safe before (because
> data is freed after removing the attribute files), or
> device_remove_file() doesn't wait and the code is still racy even after
> your fix, because then nothing prevents ibmpex_bmc_delete() from
> finishing (hence freeing data) while the writer is still in
> ibmpex_high_low_store() (after the !data check, but before calling
> ibmpex_reset_high_low_data, for example).
> 
> Or am I missing something?
> 
> Does anyone know whether sysfs guarantees that device_remove_file()
> blocks until all user-space users have called close() on the file?
> 
> If it does, then I believe this fix wasn't needed. It not, then I
> believe this fix is not sufficient (it would shrink the race window
> but does not close it completely).
> 
Gemini (using the 3 pro model and Chris Mason's prompts as guidance) agrees that
the fix is not complete. Review attached below.

I then asked it if the fix is needed and, if so, if it is complete.
Response below as well. In its verbal response it also said

"The original code likely did not have the UAF issue described in the commit
 message because device_remove_file() waits for active sysfs callbacks to
 complete. If ibmpex_high_low_store was running, device_remove_file would
 block until it finished, preventing kfree(data) from happening concurrently.
"

Based on that, I am going to revert the patch. Feel free to resubmit with a
complete fix but show that the fix is both needed and complete.

Thanks,
Guenter

---
# Commit 6946c726c3f4 ("hwmon: (ibmpex) fix use-after-free in high/low store")
commit 6946c726c3f4c36f0f049e6f97e88c510b15f65d
Author: Junrui Luo <moonafterrain@outlook.com>
Subject: hwmon: (ibmpex) fix use-after-free in high/low store

This commit fixes a use-after-free in ibmpex_high_low_store by checking for
NULL driver data, and reorders cleanup operations in ibmpex_bmc_delete to
clear driver data early.

Link: https://lore.kernel.org/r/MEYPR01MB7886BE2F51BFE41875B74B60AFA0A@MEYPR01MB7886.ausprd01.prod.outlook.com

> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> index 228c5f6c6f38..129f3a9e8fe9 100644
> --- a/drivers/hwmon/ibmpex.c
> +++ b/drivers/hwmon/ibmpex.c
> @@ -508,6 +511,9 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
>  {
>  	int i, j;
>  
> +	hwmon_device_unregister(data->hwmon_dev);
> +	dev_set_drvdata(data->bmc_device, NULL);
> +

This change sets drvdata to NULL before removing the sensor attributes.

If a user reads a sensor attribute (e.g., temp1_input) during this window,
ibmpex_show_sensor() will run.

ibmpex_show_sensor() calls dev_get_drvdata(), which now returns NULL.
It then dereferences data->sensors without checking for NULL.

Does this introduce a NULL pointer dereference in ibmpex_show_sensor()?

>  	device_remove_file(data->bmc_device,
>  			   &sensor_dev_attr_reset_high_low.dev_attr);
>  	device_remove_file(data->bmc_device, &dev_attr_name.attr);

---
commit 6946c726c3f4c36f0f049e6f97e88c510b15f65d
Author: Junrui Luo <moonafterrain@outlook.com>
Subject: hwmon: (ibmpex) fix use-after-free in high/low store

Fix a use-after-free race in ibmpex_high_low_store() by adding a NULL check
for driver data and reordering cleanup operations in ibmpex_bmc_delete().
The cleanup reordering ensures driver data is cleared before file removal.
Link: https://lore.kernel.org/r/MEYPR01MB7886BE2F51BFE41875B74B60AFA0A@MEYPR01MB7886.ausprd01.prod.outlook.com

> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> index 228c5f6c6f38..129f3a9e8fe9 100644
> --- a/drivers/hwmon/ibmpex.c
> +++ b/drivers/hwmon/ibmpex.c
[ ... ]
> @@ -508,6 +511,9 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
>  {
>  	int i, j;
>  
> +	hwmon_device_unregister(data->hwmon_dev);
> +	dev_set_drvdata(data->bmc_device, NULL);
> +
>  	device_remove_file(data->bmc_device,
>  			   &sensor_dev_attr_reset_high_low.dev_attr);
>  	device_remove_file(data->bmc_device, &dev_attr_name.attr);

This reordering sets the driver data to NULL before removing the sensor
attributes in the loop below.

ibmpex_show_sensor() retrieves this driver data via dev_get_drvdata() but
does not check if it is NULL before dereferencing it to access
data->sensors[].

If a userspace process reads a sensor file (like temp1_input) while this
delete function is running, could it race with the dev_set_drvdata(..., NULL)
call here and crash in ibmpex_show_sensor()?

Would it be safer to keep the original order where device_remove_file() is
called before clearing the driver data? device_remove_file() should wait for
any active sysfs callbacks to complete, which might already prevent the
use-after-free this patch intends to fix.

> @@ -521,8 +527,7 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
>  		}
>  
>  	list_del(&data->list);
> -	dev_set_drvdata(data->bmc_device, NULL);
> -	hwmon_device_unregister(data->hwmon_dev);
> +
>  	ipmi_destroy_user(data->user);
>  	kfree(data->sensors);
>  	kfree(data);
