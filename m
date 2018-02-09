Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:42670 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752925AbeBIWGq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Feb 2018 17:06:46 -0500
Received: by mail-pg0-f67.google.com with SMTP id m28so4504301pgc.9
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Feb 2018 14:06:45 -0800 (PST)
Date: Fri, 9 Feb 2018 14:06:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Bargen <mail@dbrgn.ch>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        andreas.brauchli@sensirion.com
Subject: Re: [v2,2/2] hwmon: (sht3x) Update data sheet URL
Message-ID: <20180209220644.GA18799@roeck-us.net>
References: <20180202114235.19da068a@x2000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180202114235.19da068a@x2000>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Feb 02, 2018 at 11:42:35AM +0100, Danilo Bargen wrote:
> The previously used URL is dead.
> 
> Sensirion provides permalinks for their product datasheets at
> https://www.sensirion.com/en/about-us/links/.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/sht3x | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/sht3x b/Documentation/hwmon/sht3x
> index b0d88184f48e..d9daa6ab1e8e 100644
> --- a/Documentation/hwmon/sht3x
> +++ b/Documentation/hwmon/sht3x
> @@ -5,7 +5,7 @@ Supported chips:
>    * Sensirion SHT3x-DIS
>      Prefix: 'sht3x'
>      Addresses scanned: none
> -    Datasheet: http://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/Humidity/Sensirion_Humidity_Datasheet_SHT3x_DIS.pdf
> +    Datasheet: https://www.sensirion.com/file/datasheet_sht3x_digital
>  
>  Author:
>    David Frey <david.frey@sensirion.com>
