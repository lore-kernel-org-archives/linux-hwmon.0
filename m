Return-Path: <bp@alien8.de>
Return-path: <bp@alien8.de>
Date: Sat, 8 Dec 2018 12:13:25 +0100
From: Borislav Petkov <bp@alien8.de>
To: Pu Wen <puwen@hygon.cn>
Cc: clemens@ladisch.de, jdelvare@suse.com, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] hwmon/k10temp: Add Hygon Dhyana support
Message-ID: <20181208111325.GC30399@zn.tnic>
References: <1544250808-20462-1-git-send-email-puwen@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1544250808-20462-1-git-send-email-puwen@hygon.cn>
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Dec 08, 2018 at 02:33:28PM +0800, Pu Wen wrote:
> Add support for Hygon Dhyana family 18h processor for k10temp to get the
> temperature. As Hygon Dhyana shares the same function interface with AMD
> family 17h, so add Hygon PCI Vendor ID and reuse the code path of AMD.
> 
> Signed-off-by: Pu Wen <puwen@hygon.cn>
> ---
>  drivers/hwmon/k10temp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 2cef0c3..e24ba10 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -330,7 +330,7 @@ static int k10temp_probe(struct pci_dev *pdev,
>  	     (boot_cpu_data.x86_model & 0xf0) == 0x70)) {
>  		data->read_htcreg = read_htcreg_nb_f15;
>  		data->read_tempreg = read_tempreg_nb_f15;
> -	} else if (boot_cpu_data.x86 == 0x17) {
> +	} else if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
>  		data->temp_adjust_mask = 0x80000;
>  		data->read_tempreg = read_tempreg_nb_f17;
>  		data->show_tdie = true;
> @@ -367,6 +367,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
> +	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, k10temp_id_table);
> -- 

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
