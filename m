Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37402 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753199AbdGSBtp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2017 21:49:45 -0400
Subject: Re: [PATCH] hwmon: i5k_amb: constify pci_device_id.
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f6ecfc5c18a47e7b16d58ab55c562b0414595a8c.1500308632.git.arvind.yadav.cs@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <96bb044d-469a-8ea2-8213-992493a06b43@roeck-us.net>
Date: Tue, 18 Jul 2017 18:49:42 -0700
MIME-Version: 1.0
In-Reply-To: <f6ecfc5c18a47e7b16d58ab55c562b0414595a8c.1500308632.git.arvind.yadav.cs@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/17/2017 09:25 AM, Arvind Yadav wrote:
> pci_device_id are not supposed to change at runtime. All functions
> working with pci_device_id provided by <linux/pci.h> work with
> const pci_device_id. So mark the non-const structs as const.
> 
> File size before:
>     text	   data	    bss	    dec	    hex	filename
>     3562	    320	      8	   3890	    f32	drivers/hwmon/i5k_amb.o
> 
> File size After adding 'const':
>     text	   data	    bss	    dec	    hex	filename
>     3658	    224	      8	   3890	    f32	drivers/hwmon/i5k_amb.o
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>   drivers/hwmon/i5k_amb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
> index a5a9f45..9397d2f 100644
> --- a/drivers/hwmon/i5k_amb.c
> +++ b/drivers/hwmon/i5k_amb.c
> @@ -495,7 +495,7 @@ static struct {
>   };
>   
>   #ifdef MODULE
> -static struct pci_device_id i5k_amb_ids[] = {
> +static const struct pci_device_id i5k_amb_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5000_ERR) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5400_ERR) },
>   	{ 0, }
> 

