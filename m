Return-Path: <nix.or.die@gmail.com>
Return-path: <nix.or.die@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1525018605-22302-1-git-send-email-linux@roeck-us.net>
References: <1525018605-22302-1-git-send-email-linux@roeck-us.net>
From: Gabriel C <nix.or.die@gmail.com>
Date: Sun, 29 Apr 2018 18:28:11 +0200
Message-ID: <CAEJqkgic1kvLiGwOtEWOWh7V_icht_cGpCTis+1NH-31sw+BGw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (k10temp) Add support for Stoney Ridge and Bristol
 Ridge CPUs
To: Guenter Roeck <linux@roeck-us.net>
Cc: Clemens Ladisch <clemens@ladisch.de>, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

2018-04-29 18:16 GMT+02:00 Guenter Roeck <linux@roeck-us.net>:
> Add support for Stoney Ridge and Bristol Ridge (Family 15h Model 0x70)
> CPUs. Registers match those of Family 15h Model 0x60.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/k10temp.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 34b5448b00be..f014e03eee5a 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -36,6 +36,10 @@ MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
>  /* Provide lock for writing to NB_SMU_IND_ADDR */
>  static DEFINE_MUTEX(nb_smu_ind_mutex);
>
> +#ifndef PCI_DEVICE_ID_AMD_15H_M70H_NB_F3
> +#define PCI_DEVICE_ID_AMD_15H_M70H_NB_F3       0x15b3
> +#endif
> +
>  #ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
>  #define PCI_DEVICE_ID_AMD_17H_DF_F3    0x1463
>  #endif
> @@ -319,6 +323,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>         { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M10H_F3) },
>         { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M30H_NB_F3) },
>         { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M60H_NB_F3) },
> +       { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M70H_NB_F3) },
>         { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
>         { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
>         { PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
> --
> 2.7.4
>

Is working fine for me on an A6-9220 APU.

Tested-by: Gabriel Craciunescu <nix.or.die@gmail.com>

Regards
