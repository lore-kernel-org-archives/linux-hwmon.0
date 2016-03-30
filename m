From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 01:18:41 -0700
Subject: Re: [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160330081825.GG3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:

> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> Add the GPIO functionality for the Altera Arria10 MAX5 System Resource
> Chip. The A10 MAX5 has 12 bits of GPIO assigned to switches, buttons,
> and LEDs as a GPIO extender on the SPI bus.
> 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  drivers/gpio/Kconfig             |    8 ++
>  drivers/gpio/Makefile            |    1 +
>  drivers/gpio/gpio-altera-a10sr.c |  158 
> ++++++++++++++++++++++++++++++++++++++
>  drivers/mfd/altera-a10sr.c       |    4 +

Seperate patch please.

>  include/linux/mfd/altera-a10sr.h |   22 ++++++
>  5 files changed, 193 insertions(+)
>  create mode 100644 drivers/gpio/gpio-altera-a10sr.c

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
