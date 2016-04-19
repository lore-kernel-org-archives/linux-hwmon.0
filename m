Return-Path: <linux@roeck-us.net>
Date: Tue, 19 Apr 2016 06:35:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Huang Rui <ray.huang@amd.com>
Cc: Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: Re: [v6,1/6] hwmon: (fam15h_power) Add CPU_SUP_AMD as the dependence
Message-ID: <20160419133526.GA26875@roeck-us.net>
References: <1459928655-6071-2-git-send-email-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459928655-6071-2-git-send-email-ray.huang@amd.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Apr 06, 2016 at 03:44:10PM +0800, Huang Rui wrote:
> This patch adds CONFIG_CPU_SUP_AMD as the dependence of fam15h_power
> driver. Because the following patch will use the interface from
> x86/kernel/cpu/amd.c.
> 
> Otherwise, the below error might be encountered:
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/built-in.o: In function `fam15h_power_probe':
> >> fam15h_power.c:(.text+0x26e3a3): undefined reference to
> >> `amd_get_cores_per_cu'
>    fam15h_power.c:(.text+0x26e41e): undefined reference to
> `amd_get_cores_per_cu'
> 
> Reported-by: build test robot <lkp@intel.com>
> Acked-by: Borislav Petkov <bp@suse.de>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> 
Series applied.

Thanks,
Guenter

> ---
> drivers/hwmon/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5c2d13a..4be3792 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -288,7 +288,7 @@ config SENSORS_K10TEMP
>  
>  config SENSORS_FAM15H_POWER
>  	tristate "AMD Family 15h processor power"
> -	depends on X86 && PCI
> +	depends on X86 && PCI && CPU_SUP_AMD
>  	help
>  	  If you say yes here you get support for processor power
>  	  information of your AMD family 15h CPU.
