Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40248 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933136AbdABShB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Jan 2017 13:37:01 -0500
Date: Mon, 2 Jan 2017 10:36:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Ian King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Documentation: fix spelling mistakes of "Celcius" -- > "Celsius"
Message-ID: <20170102183658.GA22046@roeck-us.net>
References: <20161228215137.7675-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161228215137.7675-1-colin.king@canonical.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Dec 28, 2016 at 09:51:37PM +0000, Colin Ian King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/hwmon/ds1621            | 8 ++++----
>  Documentation/thermal/nouveau_thermal | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/ds1621 b/Documentation/hwmon/ds1621
> index f775e61..fa34079 100644
> --- a/Documentation/hwmon/ds1621
> +++ b/Documentation/hwmon/ds1621
> @@ -117,10 +117,10 @@ support, which is achieved via the R0 and R1 config register bits, where:
>  
>  R0..R1
>  ------
> - 0  0 => 9 bits, 0.5 degrees Celcius
> - 1  0 => 10 bits, 0.25 degrees Celcius
> - 0  1 => 11 bits, 0.125 degrees Celcius
> - 1  1 => 12 bits, 0.0625 degrees Celcius
> + 0  0 => 9 bits, 0.5 degrees Celsius
> + 1  0 => 10 bits, 0.25 degrees Celsius
> + 0  1 => 11 bits, 0.125 degrees Celsius
> + 1  1 => 12 bits, 0.0625 degrees Celsius
>  
>  Note:
>  At initial device power-on, the default resolution is set to 12-bits.
> diff --git a/Documentation/thermal/nouveau_thermal b/Documentation/thermal/nouveau_thermal
> index 60bc293..6e17a11 100644
> --- a/Documentation/thermal/nouveau_thermal
> +++ b/Documentation/thermal/nouveau_thermal
> @@ -42,7 +42,7 @@ thresholds can be configured thanks to the following HWMON attributes:
>   * Critical: temp1_crit and temp1_crit_hyst;
>   * Shutdown: temp1_emergency and temp1_emergency_hyst.
>  
> -NOTE: Remember that the values are stored as milli degrees Celcius. Don't forget
> +NOTE: Remember that the values are stored as milli degrees Celsius. Don't forget
>  to multiply!
>  
>  Fan management
