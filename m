Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:37256 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751619AbeA0QJ3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:09:29 -0500
Received: by mail-ot0-f196.google.com with SMTP id a24so2946617otd.4
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2018 08:09:28 -0800 (PST)
Subject: Re: [PATCH] hwmon: (sht21) Update data sheet URLs
To: Danilo Bargen <danilo@dbrgn.ch>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, andreas.brauchli@sensirion.com,
        Danilo Bargen <mail@dbrgn.ch>
References: <20180126233100.17995-1-mail@dbrgn.ch>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8168b9b5-66c4-a6be-07d7-67eee60f9471@roeck-us.net>
Date: Sat, 27 Jan 2018 08:09:26 -0800
MIME-Version: 1.0
In-Reply-To: <20180126233100.17995-1-mail@dbrgn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/26/2018 03:31 PM, Danilo Bargen wrote:

Some prosa expected here.

> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>   Documentation/hwmon/sht21 | 6 +++---
>   drivers/hwmon/sht21.c     | 7 +------
>   2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/hwmon/sht21 b/Documentation/hwmon/sht21
> index 47f4765db256..e913605e1d70 100644
> --- a/Documentation/hwmon/sht21
> +++ b/Documentation/hwmon/sht21
> @@ -6,13 +6,13 @@ Supported chips:
>       Prefix: 'sht21'
>       Addresses scanned: none
>       Datasheet: Publicly available at the Sensirion website
> -    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
> +    https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/2_Humidity_Sensors/Sensirion_Humidity_Sensors_SHT21_Datasheet.pdf
>   
>     * Sensirion SHT25
> -    Prefix: 'sht21'
> +    Prefix: 'sht25'
>       Addresses scanned: none
>       Datasheet: Publicly available at the Sensirion website
> -    http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT25.pdf
> +    https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/2_Humidity_Sensors/Sensirion_Humidity_Sensors_SHT25_Datasheet.pdf
>   
>   Author:
>     Urs Fleisch <urs.fleisch@sensirion.com>
> diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
> index 06706d288355..984f14b3e89a 100644
> --- a/drivers/hwmon/sht21.c
> +++ b/drivers/hwmon/sht21.c
> @@ -12,12 +12,7 @@
>    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>    * GNU General Public License for more details.
>    *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA
> - *
> - * Data sheet available (5/2010) at
> - * http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT21.pdf
> + * Data sheet available at https://www.sensirion.com/sht2x/

This does a bit more than updating the link to the datasheet.

Guenter
