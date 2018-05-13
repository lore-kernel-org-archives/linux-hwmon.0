Return-Path: <tglx@linutronix.de>
Return-path: <tglx@linutronix.de>
Date: Sun, 13 May 2018 16:21:07 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
cc: Clemens Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>,
    Borislav Petkov <bp@suse.de>, Yazen Ghannam <Yazen.Ghannam@amd.com>,
    Brian Woods <brian.woods@amd.com>, linux-kernel@vger.kernel.org,
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] x86/amd_nb: Add support for Raven Ridge CPUs
In-Reply-To: <1525464093-20280-1-git-send-email-linux@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1805131620170.1582@nanos.tec.linutronix.de>
References: <1525464093-20280-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, 4 May 2018, Guenter Roeck wrote:

> Add Raven Ridge root bridge and data fabric PCI IDs.
> This is required for amd_pci_dev_to_node_id() and amd_smn_read().
> 
> Tested-by: Gabriel Craciunescu <nix.or.die@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Guenter, if you want to take that through hwmon:

	 Acked-by: Thomas Gleixner <tglx@linutronix.de>

If not, let me know.

> ---
> v3: No change.
> v2: Use naming scheme suggested by Borislav Petkov.
> 
>  arch/x86/kernel/amd_nb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index c88e0b127810..b481b95bd8f6 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -14,8 +14,11 @@
>  #include <asm/amd_nb.h>
>  
>  #define PCI_DEVICE_ID_AMD_17H_ROOT	0x1450
> +#define PCI_DEVICE_ID_AMD_17H_M10H_ROOT	0x15d0
>  #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
>  #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
> +#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
> +#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
>  
>  /* Protect the PCI config register pairs used for SMN and DF indirect access. */
>  static DEFINE_MUTEX(smn_mutex);
> @@ -24,6 +27,7 @@ static u32 *flush_words;
>  
>  static const struct pci_device_id amd_root_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_ROOT) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_ROOT) },
>  	{}
>  };
>  
> @@ -39,6 +43,7 @@ const struct pci_device_id amd_nb_misc_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
>  	{}
>  };
> @@ -51,6 +56,7 @@ static const struct pci_device_id amd_nb_link_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_NB_F4) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F4) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F4) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F4) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
>  	{}
>  };
> -- 
> 2.7.4
> 
> 
