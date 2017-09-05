Return-Path: <SRS0=LLLD=AG=ladisch.de=clemens@webclient5.webclient5.de>
Return-path: <SRS0=LLLD=AG=ladisch.de=clemens@webclient5.webclient5.de>
Subject: Re: [PATCH] hwmon: (k10temp) Add support for family 17h
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <0565cf17-62d9-e319-8fe5-fbdf2d69335a@ladisch.de>
Date: Tue, 5 Sep 2017 08:47:28 +0200
MIME-Version: 1.0
In-Reply-To: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Guenter Roeck wrote:
> Add support for temperature sensors on Family 17h (Ryzen) processors.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Some of this is guesswork, but afaics it is working. No idea if there
> is a better way to determine the temperature offset.

The reported value is not an absolute temperature on any CPU.

As far as I know, the offset is not guaranteed to be fixed for any model,
i.e., it would be pointless to apply the offset observed on one specific
chip.

> @@ -25,6 +25,10 @@
>  #include <linux/pci.h>
>  #include <asm/processor.h>
>
> +#ifndef PCI_DEVICE_ID_AMD_17H_DF_F3
> +#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
> +#endif
> +

Please move this down to the other symbols.


Regards,
Clemens
