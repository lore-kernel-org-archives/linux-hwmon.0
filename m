From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 01:18:08 -0700
Subject: Re: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160330081735.GF3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:

> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> This patch adds the hwmon functionality to the Arria10 System
> Resource Chip. The hwmon encapsulates the PCIe Enable, USB Enable,
> and all the Power Good signals on the System Controller.
> 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  drivers/hwmon/Kconfig              |    9 +
>  drivers/hwmon/Makefile             |    1 +
>  drivers/hwmon/altera-a10sr-hwmon.c |  544 
> ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/altera-a10sr.c         |    4 +
>  include/linux/mfd/altera-a10sr.h   |  107 +++++--
>  5 files changed, 645 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/hwmon/altera-a10sr-hwmon.c

[...]

> diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
> index 517b895..3eedad7 100644
> --- a/drivers/mfd/altera-a10sr.c
> +++ b/drivers/mfd/altera-a10sr.c
> @@ -34,6 +34,10 @@ static const struct mfd_cell altr_a10sr_subdev_info[] = {
>               .name = "altr_a10sr_gpio",
>               .of_compatible = "altr,a10sr-gpio",
>       },
> +     {
> +             .name = "altr_a10sr_hwmon",
> +             .of_compatible = "altr,a10sr-hwmon",
> +     },
>  };
>  
>  static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)

This belongs in a patch of its own.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
