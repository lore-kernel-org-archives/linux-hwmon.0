Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:38172 "EHLO
        2.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750884AbdFTGlk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jun 2017 02:41:40 -0400
Received: from player692.ha.ovh.net (b6.ovh.net [213.186.33.56])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 423919403B
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Jun 2017 08:05:20 +0200 (CEST)
Subject: Re: [PATCH V2 2/2] hwmon: (ibmpowernv) Add current(A) sensor
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        linux@roeck-us.net, stewart@linux.vnet.ibm.com
References: <1497935293-31618-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
 <1497935293-31618-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Cc: jdelvare@suse.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
        ego@linux.vnet.ibm.com, linux-hwmon@vger.kernel.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f2e849bf-01a0-9af6-cb14-0c454a902d23@kaod.org>
Date: Tue, 20 Jun 2017 08:05:01 +0200
MIME-Version: 1.0
In-Reply-To: <1497935293-31618-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/20/2017 07:08 AM, Shilpasri G Bhat wrote:
> This patch exports current(A) sensors in inband sensors copied to
> main memory by OCC.
> 
> Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Changes from V1:
> - Rebased on top of Cedric's patch to remove legay-compatible type for
>   the current(A) sensor.
> 
>  drivers/hwmon/ibmpowernv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 6d8909c..9b11b13 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -50,6 +50,7 @@ enum sensors {
>  	TEMP,
>  	POWER_SUPPLY,
>  	POWER_INPUT,
> +	CURRENT,
>  	MAX_SENSOR_TYPE,
>  };
>  
> @@ -75,7 +76,8 @@ enum sensors {
>  	{ "fan"   },
>  	{ "temp"  },
>  	{ "in"    },
> -	{ "power" }
> +	{ "power" },
> +	{ "curr"  },
>  };
>  
>  struct sensor_data {
> 

