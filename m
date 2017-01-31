Return-path: <jdelvare@suse.de>
Date: Tue, 31 Jan 2017 10:07:11 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Relax name attribute validation for new APIs
Message-ID: <20170131100711.4e8daaba@endymion>
In-Reply-To: <1485575389-31616-1-git-send-email-linux@roeck-us.net>
References: <1485575389-31616-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter, Dmitry,

On Fri, 27 Jan 2017 19:49:49 -0800, Guenter Roeck wrote:
> While invalid name attributes are really not desirable and do mess up
> libsensors, enforcing valid names has the detrimental effect of driving
> users away from using the new hardware monitoring API, especially those
> registering name attributes violating the ABI restrictions. Another
> undesirable side effect is that this violation and the resulting error
> may only be discovered some time after a conversion to the new API,
> which in turn may trigger a revert of that conversion.
> 
> To solve the problem, relax validation and only issue a warning instead
> of returning an error if a name attribute violating the ABI is provided.
> This lets callers continue to provide invalid name attributes while
> notifying them about it.
> 
> Many thanks are due to Dmitry Torokhov for the idea.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/hwmon.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index affff8195fff..53c54a81f7ad 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -544,9 +544,10 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>  	struct device *hdev;
>  	int i, j, err, id;
>  
> -	/* Do not accept invalid characters in hwmon name attribute */
> +	/* Complain about invalid characters in hwmon name attribute */
>  	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
> -		return ERR_PTR(-EINVAL);
> +		dev_warn(dev, "hwmon: '%s' is not a valid name attribute\n",
> +			 name);

May I suggest adding ", please fix"?

>  
>  	id = ida_simple_get(&hwmon_ida, 0, 0, GFP_KERNEL);
>  	if (id < 0)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Do I understand correctly that in the long run we will make it a fatal
error again?

-- 
Jean Delvare
SUSE L3 Support
