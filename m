Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] driver: adm1275: set the m,b and R coefficients correctly
 for power
To: Shikhar Dogra <shidogra@cisco.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
References: <20170327231644.GA6121@sjc-ads-4188.cisco.com>
Cc: xe-linux-external@cisco.com, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0c247229-0981-fad7-9ff3-b27584792312@roeck-us.net>
Date: Mon, 27 Mar 2017 19:44:49 -0700
MIME-Version: 1.0
In-Reply-To: <20170327231644.GA6121@sjc-ads-4188.cisco.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

On 03/27/2017 04:16 PM, Shikhar Dogra wrote:
> Seems like coefficient values for m, b and R under power have been
> put in the wrong order. Rearranging them properly to get correct
> values of coefficients for power.
>

Oops :-(

Thanks a lot, applied.

Guenter

> For specs, please refer to table 7 (page 35) on
> http://www.analog.com/media/en/technical-documentation/data-sheets/ADM1075.pdf
>
> Fixes: 904b296f308d ("hwmon: (adm1275) Introduce configuration data structure for coeffcients")
> Signed-off-by: Shikhar Dogra <shidogra@cisco.com>
> Cc: xe-linux-external@cisco.com
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/hwmon/pmbus/adm1275.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 188af4c..18477dd 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -95,8 +95,8 @@ static const struct coefficients adm1075_coefficients[] = {
>  	[0] = { 27169, 0, -1 },		/* voltage */
>  	[1] = { 806, 20475, -1 },	/* current, irange25 */
>  	[2] = { 404, 20475, -1 },	/* current, irange50 */
> -	[3] = { 0, -1, 8549 },		/* power, irange25 */
> -	[4] = { 0, -1, 4279 },		/* power, irange50 */
> +	[3] = { 8549, 0, -1 },		/* power, irange25 */
> +	[4] = { 4279, 0, -1 },		/* power, irange50 */
>  };
>
>  static const struct coefficients adm1275_coefficients[] = {
>
