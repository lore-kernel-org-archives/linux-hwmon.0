Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34485 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbeKCDcx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Nov 2018 23:32:53 -0400
Date: Fri, 2 Nov 2018 11:24:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Woods, Brian" <Brian.Woods@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Bjorn Helgaas <bhelgaas@google.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 1/4] k10temp: x86/amd_nb: consolidate shared device IDs
Message-ID: <20181102182444.GA5782@roeck-us.net>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-2-brian.woods@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102181055.130531-2-brian.woods@amd.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 02, 2018 at 06:11:04PM +0000, Woods, Brian wrote:
> Consolidate shared PCI_DEVICE_IDs that were scattered through k10temp
> and amd_nb, and move them into pci_ids.
> 
> Signed-off-by: Brian Woods <brian.woods@amd.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/x86/kernel/amd_nb.c | 3 +--
>  drivers/hwmon/k10temp.c  | 9 +--------
>  include/linux/pci_ids.h  | 2 ++
>  3 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index a6eca647bc76..19d489ee2b1e 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -11,13 +11,12 @@
>  #include <linux/errno.h>
>  #include <linux/export.h>
>  #include <linux/spinlock.h>
> +#include <linux/pci_ids.h>
>  #include <asm/amd_nb.h>
>  
>  #define PCI_DEVICE_ID_AMD_17H_ROOT	0x1450
>  #define PCI_DEVICE_ID_AMD_17H_M10H_ROOT	0x15d0
> -#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
>  #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
> -#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
>  #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
>  
>  /* Protect the PCI config register pairs used for SMN and DF indirect access. */
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 2cef0c37ff6f..bc6871c8dd4e 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -23,6 +23,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/pci_ids.h>
>  #include <asm/amd_nb.h>
>  #include <asm/processor.h>
>  
> @@ -41,14 +42,6 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
>  #define PCI_DEVICE_ID_AMD_15H_M70H_NB_F3	0x15b3
>  #endif
>  
> -#ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
> -#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
> -#endif
> -
> -#ifndef PCI_DEVICE_ID_AMD_17H_M10H_DF_F3
> -#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3	0x15eb
> -#endif
> -
>  /* CPUID function 0x80000001, ebx */
>  #define CPUID_PKGTYPE_MASK	0xf0000000
>  #define CPUID_PKGTYPE_F		0x00000000
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 69f0abe1ba1a..78d5cd29778a 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -545,6 +545,8 @@
>  #define PCI_DEVICE_ID_AMD_16H_NB_F4	0x1534
>  #define PCI_DEVICE_ID_AMD_16H_M30H_NB_F3 0x1583
>  #define PCI_DEVICE_ID_AMD_16H_M30H_NB_F4 0x1584
> +#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
> +#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
>  #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
>  #define PCI_DEVICE_ID_AMD_LANCE		0x2000
>  #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
> -- 
> 2.11.0
> 
