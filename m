Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42422 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932616AbeD0TdL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Apr 2018 15:33:11 -0400
Date: Fri, 27 Apr 2018 12:33:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ojab <ojab@ojab.ru>
Cc: clemens@ladisch.de, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH]  hwmon: (k10temp) Add support for Raven Ridge (Ryzen APU)
Message-ID: <20180427193309.GA12758@roeck-us.net>
References: <20180427191529.4923-1-ojab@ojab.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180427191529.4923-1-ojab@ojab.ru>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

On Fri, Apr 27, 2018 at 07:15:29PM +0000, ojab wrote:
> Signed-off-by: ojab <ojab@ojab.ru>

Thanks a lot for your patch. Note though that a similar patch
was applied yesterday to the upstream kernel, so your patch is
no longer necessary.

For future submissions, please consider the following.

- Please provide additional information in the patch description.
- Please provide a full name. 
- Please follow existing naming conventions.

Thanks,
Guenter

> ---
>  drivers/hwmon/k10temp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 051a72e..0e428b0 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -39,6 +39,7 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
>  #ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
>  #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
>  #endif
> +#define PCI_DEVICE_ID_AMD_RAVEN_RIDGE	0x15d0
>  
>  /* CPUID function 0x80000001, ebx */
>  #define CPUID_PKGTYPE_MASK	0xf0000000
> @@ -292,6 +293,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_NB_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_RAVEN_RIDGE) },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, k10temp_id_table);
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
