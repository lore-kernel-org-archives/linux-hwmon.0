Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:43958 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752895AbeBIWFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Feb 2018 17:05:17 -0500
Received: by mail-pg0-f65.google.com with SMTP id f6so4499768pgs.10
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Feb 2018 14:05:17 -0800 (PST)
Date: Fri, 9 Feb 2018 14:05:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Bargen <mail@dbrgn.ch>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        andreas.brauchli@sensirion.com
Subject: Re: [v2,1/2] hwmon: (sht21) Update data sheet URLs
Message-ID: <20180209220515.GA18720@roeck-us.net>
References: <20180202114052.065b6d08@x2000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180202114052.065b6d08@x2000>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Feb 02, 2018 at 11:40:52AM +0100, Danilo Bargen wrote:
> The previously used URLs are dead.
> 
> Sensirion provides permalinks for their product datasheets at
> https://www.sensirion.com/en/about-us/links/.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/sht21 | 6 +++---
>  drivers/hwmon/sht21.c     | 3 +--
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/sht21 b/Documentation/hwmon/sht21
> index 47f4765db256..8b3cdda541c1 100644
> --- a/Documentation/hwmon/sht21
> +++ b/Documentation/hwmon/sht21
> @@ -6,13 +6,13 @@ Supported chips:
>      Prefix: 'sht21'
>      Addresses scanned: none
>      Datasheet: Publicly available at the Sensirion website
> -    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
> +    http://www.sensirion.com/file/datasheet_sht21
>  
>    * Sensirion SHT25
> -    Prefix: 'sht21'
> +    Prefix: 'sht25'
>      Addresses scanned: none
>      Datasheet: Publicly available at the Sensirion website
> -    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT25.pdf
> +    http://www.sensirion.com/file/datasheet_sht25
>  
>  Author:
>    Urs Fleisch <urs.fleisch@sensirion.com>
> diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
> index 06706d288355..e23736e21422 100644
> --- a/drivers/hwmon/sht21.c
> +++ b/drivers/hwmon/sht21.c
> @@ -16,8 +16,7 @@
>   * along with this program; if not, write to the Free Software
>   * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA
>   *
> - * Data sheet available (5/2010) at
> - * http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
> + * Data sheet available at http://www.sensirion.com/file/datasheet_sht21
>   */
>  
>  #include <linux/module.h>
