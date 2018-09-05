Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35827 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbeIFCV3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Sep 2018 22:21:29 -0400
Date: Wed, 5 Sep 2018 14:49:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6775) Clean up a condition
Message-ID: <20180905214921.GA5227@roeck-us.net>
References: <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
 <20180905074655.w6uypipr5lgmpr4g@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180905074655.w6uypipr5lgmpr4g@kili.mountain>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 05, 2018 at 10:46:55AM +0300, Dan Carpenter wrote:
> I removed the "dsw_en &&" chunk of the condition because we know that
> "dsw_en" is set.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to hwmon-next.

Thanks,
Guenter

> 
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index 139781ae830b..719effe53ceb 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -3533,8 +3533,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
>  
>  				if (!fan6pin)
>  					fan6pin = (regval_2a & BIT(4)) &&
> -					  (!dsw_en ||
> -					   (dsw_en && (regval_ed & BIT(4))));
> +					  (!dsw_en || (regval_ed & BIT(4)));
>  				if (!pwm6pin)
>  					pwm6pin = (regval_2a & BIT(3)) &&
>  					  (regval_ed & BIT(2));
