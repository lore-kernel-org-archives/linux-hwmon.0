Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59164 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752441AbcC0Svc (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 27 Mar 2016 14:51:32 -0400
Date: Sun, 27 Mar 2016 11:51:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Trek <trek00@inbox.ru>
Cc: linux-hwmon@vger.kernel.org, Huang Rui <ray.huang@amd.com>
Subject: Re: fam15h_power on a4-4000?
Message-ID: <20160327185131.GA32631@roeck-us.net>
References: <20160327201340.152ff142@enterprise>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160327201340.152ff142@enterprise>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Mar 27, 2016 at 08:13:40PM +0200, Trek wrote:
> reading the specs, it seems to me that the a4-4000 processor (amd fam
> 15h model 13h) has the tdp running average feature, implemented in
> the fam15h_power module:
> 
>   D18F5xE0, page 456, BKDG for AMD Family 15h Models 10h-1Fh Processors
>   http://support.amd.com/TechDocs/42300_15h_Mod_10h-1Fh_BKDG.pdf
> 
> if this assumption is correct, the module fails to probe the device
> only because the pci id to query is different, so the attached patch
> should fix the detection
> 
> it is untested as i'm not familiar with the hardware and i really
> appreciate some suggestion from an expert here
> 
> c-ya!

Let's ask the maintainer. Huang, is this correct ?

Also see comment inline.

Thanks,
Guenter

> diff -ur linux/drivers/hwmon/fam15h_power.c linux-fam15h_power-10h/drivers/hwmon/fam15h_power.c
> --- linux/drivers/hwmon/fam15h_power.c	2016-03-27 19:54:32.176763010 +0200
> +++ linux-fam15h_power-10h/drivers/hwmon/fam15h_power.c	2016-03-27 20:00:02.048765885 +0200
> @@ -304,6 +304,7 @@
>  
>  static const struct pci_device_id fam15h_power_id_table[] = {
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_NB_F4) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M10H_NB_F4) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M30H_NB_F4) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M60H_NB_F4) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M70H_NB_F4) },
> diff -ur linux/include/linux/pci_ids.h linux-fam15h_power-10h/include/linux/pci_ids.h
> --- linux/include/linux/pci_ids.h	2016-03-27 19:55:45.768763651 +0200
> +++ linux-fam15h_power-10h/include/linux/pci_ids.h	2016-03-27 20:00:22.724766065 +0200
> @@ -521,6 +521,7 @@
>  #define PCI_DEVICE_ID_AMD_11H_NB_MISC	0x1303
>  #define PCI_DEVICE_ID_AMD_11H_NB_LINK	0x1304
>  #define PCI_DEVICE_ID_AMD_15H_M10H_F3	0x1403
> +#define PCI_DEVICE_ID_AMD_15H_M10H_NB_F4 0x1404

New PCI IDs should not be added to this file unless used more than once.
Please see the comment at the top of the file.

>  #define PCI_DEVICE_ID_AMD_15H_M30H_NB_F3 0x141d
>  #define PCI_DEVICE_ID_AMD_15H_M30H_NB_F4 0x141e
>  #define PCI_DEVICE_ID_AMD_15H_M60H_NB_F3 0x1573

