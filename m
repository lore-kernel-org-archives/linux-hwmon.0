Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 28 Nov 2017 13:41:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rudolf Marek <r.marek@assembler.cz>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH] hwmon/coretemp: requires CONFIG_PCI
Message-ID: <20171128214152.GA8849@roeck-us.net>
References: <588e0d93-de4f-31ec-2d0b-81843db4966d@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <588e0d93-de4f-31ec-2d0b-81843db4966d@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Nov 28, 2017 at 09:39:02AM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix coretemp.c build when CONFIG_PCI is not enabled.
> Fixes these build errors:
> 
> ../drivers/hwmon/coretemp.c: In function 'adjust_tjmax':
> ../drivers/hwmon/coretemp.c:250:9: error: implicit declaration of function 'pci_get_domain_bus_and_slot' [-Werror=implicit-function-declaration]
>   struct pci_dev *host_bridge = pci_get_domain_bus_and_slot(0, 0, devfn);
> ../drivers/hwmon/coretemp.c:250:32: warning: initialization makes pointer from integer without a cast [enabled by default]
>   struct pci_dev *host_bridge = pci_get_domain_bus_and_slot(0, 0, devfn);
> 

nack, sorry.

The dependency is artificial, and the code using it is only needed for old
CPUs. There should be a dummy function for pci_get_domain_bus_and_slot()
if PCI is disabled, similar to pci_get_bus_and_slot() and all the other
pci functions. If that is unacceptable for some reason, I rather revert
the patch introducing the use of pci_get_domain_bus_and_slot().
After all, it doesn't add any real value to enforce the use of
pci_get_domain_bus_and_slot() in the driver, a dummy function for
pci_get_bus_and_slot() _is_ available, and the new function is quite
obviously not a 1:1 replacement of pci_get_bus_and_slot().

Guenter

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rudolf Marek <r.marek@assembler.cz>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/hwmon/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- lnx-415-rc1.orig/drivers/hwmon/Kconfig
> +++ lnx-415-rc1/drivers/hwmon/Kconfig
> @@ -631,7 +631,7 @@ config SENSORS_I5500
>  
>  config SENSORS_CORETEMP
>  	tristate "Intel Core/Core2/Atom temperature sensor"
> -	depends on X86
> +	depends on X86 && PCI
>  	help
>  	  If you say yes here you get support for the temperature
>  	  sensor inside your CPU. Most of the family 6 CPUs
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
