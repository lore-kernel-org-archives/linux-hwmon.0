Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36777 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbeKOP3o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 10:29:44 -0500
Received: by mail-pl1-f193.google.com with SMTP id y6-v6so1342749plt.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Nov 2018 21:23:24 -0800 (PST)
Date: Wed, 14 Nov 2018 21:23:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Huacai Chen <chenhc@lemote.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>, Yao Wang <wangyao@lemote.com>
Subject: Re: [PATCH] hwmon: (w83795) temp4_type has writable permission
Message-ID: <20181115052320.GA5535@roeck-us.net>
References: <1542249898-20406-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542249898-20406-1-git-send-email-chenhc@lemote.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 15, 2018 at 10:44:57AM +0800, Huacai Chen wrote:
> Signed-off-by: Yao Wang <wangyao@lemote.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Sorry, that really lacks context. Please add some details.

Guenter

> ---
>  drivers/hwmon/w83795.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
> index 49276bb..1bb80f9 100644
> --- a/drivers/hwmon/w83795.c
> +++ b/drivers/hwmon/w83795.c
> @@ -1691,7 +1691,7 @@ store_sf_setup(struct device *dev, struct device_attribute *attr,
>   * somewhere else in the code
>   */
>  #define SENSOR_ATTR_TEMP(index) {					\
> -	SENSOR_ATTR_2(temp##index##_type, S_IRUGO | (index < 4 ? S_IWUSR : 0), \
> +	SENSOR_ATTR_2(temp##index##_type, S_IRUGO | (index < 5 ? S_IWUSR : 0), \
>  		show_temp_mode, store_temp_mode, NOT_USED, index - 1),	\
>  	SENSOR_ATTR_2(temp##index##_input, S_IRUGO, show_temp,		\
>  		NULL, TEMP_READ, index - 1),				\
> -- 
> 2.7.0
> 
