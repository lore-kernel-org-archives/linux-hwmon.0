Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41728 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751821AbdECV5k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 May 2017 17:57:40 -0400
Date: Wed, 3 May 2017 14:57:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Add missing break statements
Message-ID: <20170503215737.GA29602@roeck-us.net>
References: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, May 03, 2017 at 10:31:40PM +0300, Dan Carpenter wrote:
> Static checkers complain about these missing break statements.
> 
> Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Guenter

> 
> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
> index cc7b3b542531..00e4a1e264e2 100644
> --- a/drivers/hwmon/pmbus/ir35221.c
> +++ b/drivers/hwmon/pmbus/ir35221.c
> @@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>  	case PMBUS_IIN_OC_WARN_LIMIT:
>  		ret = pmbus_read_word_data(client, page, reg);
>  		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> +		break;
>  	case PMBUS_READ_VIN:
>  		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
>  		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
> @@ -222,6 +223,7 @@ static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
>  	case PMBUS_IIN_OC_WARN_LIMIT:
>  		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
>  		ret = pmbus_write_word_data(client, page, reg, val);
> +		break;
>  	default:
>  		ret = -ENODATA;
>  		break;
