Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44545 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbeKCDeT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Nov 2018 23:34:19 -0400
Date: Fri, 2 Nov 2018 11:26:10 -0700
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
Subject: Re: [PATCH 4/4] hwmon: k10temp: add support for AMD F17h M30h CPUs
Message-ID: <20181102182610.GB5782@roeck-us.net>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-5-brian.woods@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102181055.130531-5-brian.woods@amd.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 02, 2018 at 06:11:12PM +0000, Woods, Brian wrote:
> Add support for AMD family 17h model 30h processors for k10temp.  Model
> 30h is functionally the same as model 01h processors (as far as k10temp
> is concerned), just the PCI device IDs need to be updated.
> 
> Signed-off-by: Brian Woods <brian.woods@amd.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

(assuming the patch will be sent upstream as part of the series
 and not through hwmon)

> ---
>  arch/x86/kernel/amd_nb.c | 1 -
>  drivers/hwmon/k10temp.c  | 1 +
>  include/linux/pci_ids.h  | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index fd69067f6eb1..e491aa4a1970 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -17,7 +17,6 @@
>  #define PCI_DEVICE_ID_AMD_17H_ROOT	0x1450
>  #define PCI_DEVICE_ID_AMD_17H_M10H_ROOT	0x15d0
>  #define PCI_DEVICE_ID_AMD_17H_M30H_ROOT	0x1480
> -#define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
>  #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
>  #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
>  #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F4 0x1494
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index bc6871c8dd4e..9790f1f5eb98 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -360,6 +360,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, k10temp_id_table);
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 78d5cd29778a..349276fbd269 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -547,6 +547,7 @@
>  #define PCI_DEVICE_ID_AMD_16H_M30H_NB_F4 0x1584
>  #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
>  #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
> +#define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
>  #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
>  #define PCI_DEVICE_ID_AMD_LANCE		0x2000
>  #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
> -- 
> 2.11.0
> 
