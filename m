Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52492 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757581AbcHBUXq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 2 Aug 2016 16:23:46 -0400
Date: Tue, 2 Aug 2016 15:54:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Baole Ni <baolex.ni@intel.com>
Cc: linux@roeck-us.net, airlied@linux.ie, kgene@kernel.org,
	k.kozlowski@samsung.com, dougthompson@xmission.com, bp@alien8.de,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	chuansheng.liu@intel.com, aduggan@synaptics.com,
	dianders@chromium.org
Subject: Re: [PATCH 0236/1285] Replace numeric parameter like 0444 with
 macro
Message-ID: <20160802155452.31b922e9@endymion>
In-Reply-To: <20160802105208.29480-1-baolex.ni@intel.com>
References: <20160802105208.29480-1-baolex.ni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Baole,

On Tue,  2 Aug 2016 18:52:08 +0800, Baole Ni wrote:
> I find that the developers often just specified the numeric value
> when calling a macro which is defined with a parameter for access permission.
> As we know, these numeric value for access permission have had the corresponding macro,
> and that using macro can improve the robustness and readability of the code,
> thus, I suggest replacing the numeric parameter with the macro.

1285 patches? One patch per file? With Cc to a dozens of people? For a
very minor and highly discussable cleanup? Please stop this madness
immediately.

First of all, do a few patches and see what feedback you get. Then
you'll now if your patches are welcome, and maybe you can send more.
Then ask subsystem maintainers who are interested whether they prefer
one patch per driver, or one patch for the whole subsystem.

Personally I don't see any value in replacing a number I understand by
4 constants with cryptic names. If there's a bug in 0644 I'll see it
immediately. If there's a typo in S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
there are good chances I'll never notice.

So nack from me. This is neither more robust nor more readable. If it
was just me we'd kill all these useless macros right away.

> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Signed-off-by: Baole Ni <baolex.ni@intel.com>
> ---
>  drivers/hwmon/acpi_power_meter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 579bdf9..11460f7 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -1008,7 +1008,7 @@ MODULE_AUTHOR("Darrick J. Wong <darrick.wong@oracle.com>");
>  MODULE_DESCRIPTION("ACPI 4.0 power meter driver");
>  MODULE_LICENSE("GPL");
>  
> -module_param(force_cap_on, bool, 0644);
> +module_param(force_cap_on, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
>  MODULE_PARM_DESC(force_cap_on, "Enable power cap even it is unsafe to do so.");
>  
>  module_init(acpi_power_meter_init);


-- 
Jean Delvare
SUSE L3 Support
