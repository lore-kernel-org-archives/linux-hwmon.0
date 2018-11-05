Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:41114 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbeKFFyH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 00:54:07 -0500
Date: Mon, 5 Nov 2018 21:32:26 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Woods, Brian" <Brian.Woods@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <bhelgaas@google.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 4/4] hwmon: k10temp: add support for AMD F17h M30h CPUs
Message-ID: <20181105203226.GD26868@zn.tnic>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-5-brian.woods@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Patch 3 added it here and now patch 4 moves it to pci_ids.h

Just put it straight there to avoid the unnecessary churn.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
