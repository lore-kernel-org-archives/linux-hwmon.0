Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42989 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbeJ1COU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Oct 2018 22:14:20 -0400
Date: Sat, 27 Oct 2018 10:32:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: hwmon: remove redundant cast
Message-ID: <20181027173236.GA26153@roeck-us.net>
References: <20181026223059.17652-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181026223059.17652-1-linux@rasmusvillemoes.dk>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Oct 27, 2018 at 12:30:59AM +0200, Rasmus Villemoes wrote:
> struct attribute::name which this local variable name is eventually
> assigned to is "const char*", and so is the template parameter. We might
> as well preserve the constness all the way through.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Applied to hwmon-next.

Note that the "drivers:" tag is unnecessary; I removed it when applying
the patch.

Guenter

> ---
>  drivers/hwmon/hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 975c95169884..ea42c5ec40d9 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -267,7 +267,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
>  	struct device_attribute *dattr;
>  	struct attribute *a;
>  	umode_t mode;
> -	char *name;
> +	const char *name;
>  	bool is_string = is_string_attr(type, attr);
>  
>  	/* The attribute is invisible if there is no template string */
> @@ -289,7 +289,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
>  		return ERR_PTR(-ENOMEM);
>  
>  	if (type == hwmon_chip) {
> -		name = (char *)template;
> +		name = template;
>  	} else {
>  		scnprintf(hattr->name, sizeof(hattr->name), template,
>  			  index + hwmon_attr_base(type));
