Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36827 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388939AbeHGSfX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Aug 2018 14:35:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id h12-v6so8079181pgs.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Aug 2018 09:20:20 -0700 (PDT)
Date: Tue, 7 Aug 2018 09:20:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Michael Larabel <michael@phoronix.com>
Subject: Re: [PATCH] k10temp: 27C Offset needed for Threadripper2
Message-ID: <20180807162018.GA29384@roeck-us.net>
References: <1533658648-29154-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1533658648-29154-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 07, 2018 at 09:17:28AM -0700, Guenter Roeck wrote:
> From: Michael Larabel <michael@phoronix.com>
> 
> For at least the Threadripper 2950X and Threadripper 2990WX, it's confirmed a 27 degree offset is needed.

Applied to hwmon-next, and added stable tag. Michael, I took the
freedom to add your Signed-off-by:. Please let me know if that is
not ok.

Thanks,
Guenter

> ---
>  drivers/hwmon/k10temp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 17c6460ae351..577e2ede5a1a 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -105,6 +105,8 @@ static const struct tctl_offset tctl_offset_table[] = {
>  	{ 0x17, "AMD Ryzen Threadripper 1950", 10000 },
>  	{ 0x17, "AMD Ryzen Threadripper 1920", 10000 },
>  	{ 0x17, "AMD Ryzen Threadripper 1910", 10000 },
> +	{ 0x17, "AMD Ryzen Threadripper 2950X", 27000 },
> +	{ 0x17, "AMD Ryzen Threadripper 2990WX", 27000 },
>  };
>  
>  static void read_htcreg_pci(struct pci_dev *pdev, u32 *regval)
> -- 
> 2.17.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
