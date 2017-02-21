Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47554 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753192AbdBUQV7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Feb 2017 11:21:59 -0500
Date: Tue, 21 Feb 2017 08:21:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: corbet@lwn.net, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: Fix typo "Microship" should be "Microchip"
Message-ID: <20170221162155.GC16235@roeck-us.net>
References: <20170221093047.4085-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170221093047.4085-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Feb 21, 2017 at 10:30:47PM +1300, Chris Packham wrote:
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to -next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/tc654 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/tc654 b/Documentation/hwmon/tc654
> index 91a2843f5f98..47636a8077b4 100644
> --- a/Documentation/hwmon/tc654
> +++ b/Documentation/hwmon/tc654
> @@ -2,7 +2,7 @@ Kernel driver tc654
>  ===================
>  
>  Supported chips:
> -  * Microship TC654 and TC655
> +  * Microchip TC654 and TC655
>      Prefix: 'tc654'
>      Datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/20001734C.pdf
>  
> -- 
> 2.11.0.24.ge6920cf
> 
