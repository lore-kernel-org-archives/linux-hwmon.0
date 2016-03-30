From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 01:19:48 -0700
Subject: Re: [RFC 2/8] MAINTAINERS: Addition of Altera Arria10 System Resource Chip
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160330081908.GH3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:

> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> Add maintainer for the Altera Arria10 files.
> 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  MAINTAINERS |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 972f25d..567ce60 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -608,6 +608,14 @@ L:       linux-g...@vger.kernel.org
>  S:   Maintained
>  F:   drivers/gpio/gpio-altera.c
>  
> +ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
> +M:   Thor Thayer <ttha...@opensource.altera.com>
> +S:   Maintained
> +F:   drivers/mfd/altera-a10sr.c
> +F:   include/linux/mfd/altera-a10sr.h
> +F:   drivers/gpio/gpio-altera-a10sr.c
> +F:   drivers/hwmon/altera-a10sr-hwmon.c

Alphabetical makes more sense.

>  ALTERA TRIPLE SPEED ETHERNET DRIVER
>  M:   Vince Bridgers <vbrid...@opensource.altera.com>
>  L:   net...@vger.kernel.org

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
