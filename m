Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53062 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbdFPQlg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jun 2017 12:41:36 -0400
Date: Fri, 16 Jun 2017 09:41:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Echtler <floe@butterbrot.org>
Cc: linux-hwmon@vger.kernel.org, rydberg@bitmath.org,
        rydberg@euromail.se
Subject: Re: [PATCH] export applesmc_{read,write,has}_key functions
Message-ID: <20170616164133.GA31274@roeck-us.net>
References: <1497603751-22360-1-git-send-email-floe@butterbrot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497603751-22360-1-git-send-email-floe@butterbrot.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jun 16, 2017 at 11:02:31AM +0200, Florian Echtler wrote:
> This patch exports the SMC key access functions from applesmc.c to allow
> access from other drivers, in particular, the yet-to-be-written ACPI 
> driver for Target Display Mode (TDM).
> 

It is structurally deficient to have the hwmon driver export those functions.
If used by another driver, the functions should be moved to a common
driver, possibly in mfd. This driver would then also be responsible to
instantiate its child drivers.

FWIW, the applesmc hwmon driver should be split into separate drivers,
but that is a different issue.

Guenter

> Signed-off-by: Florian Echtler <floe@butterbrot.org>
> ---
>  drivers/hwmon/applesmc.c | 10 +++++++---
>  include/linux/applesmc.h | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/linux/applesmc.h
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 0af7fd3..ec637c1 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -44,6 +44,7 @@
>  #include <linux/hwmon.h>
>  #include <linux/workqueue.h>
>  #include <linux/err.h>
> +#include <linux/applesmc.h>
>  
>  /* data port used by Apple SMC */
>  #define APPLESMC_DATA_PORT	0x300
> @@ -433,7 +434,7 @@ static const struct applesmc_entry *applesmc_get_entry_by_key(const char *key)
>  	return applesmc_get_entry_by_index(begin);
>  }
>  
> -static int applesmc_read_key(const char *key, u8 *buffer, u8 len)
> +int applesmc_read_key(const char *key, u8 *buffer, u8 len)
>  {
>  	const struct applesmc_entry *entry;
>  
> @@ -443,8 +444,9 @@ static int applesmc_read_key(const char *key, u8 *buffer, u8 len)
>  
>  	return applesmc_read_entry(entry, buffer, len);
>  }
> +EXPORT_SYMBOL(applesmc_read_key);
>  
> -static int applesmc_write_key(const char *key, const u8 *buffer, u8 len)
> +int applesmc_write_key(const char *key, const u8 *buffer, u8 len)
>  {
>  	const struct applesmc_entry *entry;
>  
> @@ -454,8 +456,9 @@ static int applesmc_write_key(const char *key, const u8 *buffer, u8 len)
>  
>  	return applesmc_write_entry(entry, buffer, len);
>  }
> +EXPORT_SYMBOL(applesmc_write_key);
>  
> -static int applesmc_has_key(const char *key, bool *value)
> +int applesmc_has_key(const char *key, bool *value)
>  {
>  	const struct applesmc_entry *entry;
>  
> @@ -466,6 +469,7 @@ static int applesmc_has_key(const char *key, bool *value)
>  	*value = !IS_ERR(entry);
>  	return 0;
>  }
> +EXPORT_SYMBOL(applesmc_has_key);
>  
>  /*
>   * applesmc_read_s16 - Read 16-bit signed big endian register
> diff --git a/include/linux/applesmc.h b/include/linux/applesmc.h
> new file mode 100644
> index 0000000..932d352
> --- /dev/null
> +++ b/include/linux/applesmc.h
> @@ -0,0 +1,39 @@
> +/*
> + * applesmc.h - functions to read/write keys in the Apple SMC
> + *
> + * Copyright (c) 2017 Florian 'floe' Echtler <floe@butterbrot.org>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef _LINUX_APPLESMC_H_
> +#define _LINUX_APPLESMC_H_
> +
> +#if defined(CONFIG_SENSORS_APPLESMC)
> +
> +int applesmc_has_key(const char *key, bool *value);
> +int applesmc_read_key(const char *key, u8 *buffer, u8 len);
> +int applesmc_write_key(const char *key, const u8 *buffer, u8 len);
> +
> +#endif
> +#endif /* _LINUX_APPLESMC_H_ */
> +
> -- 
> 2.7.4
> 
