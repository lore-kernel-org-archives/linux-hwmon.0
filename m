From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Sat, 05 Jan 2019 09:43:10 -0800
Subject: Re: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
In-Reply-To: <20190104142722.24824-1-cgxu519@gmx.com>
Message-ID: <20190105174301.GA13667@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jan 04, 2019 at 10:27:22PM +0800, Chengguang Xu wrote:
> Just fix a typo in Documentation/hwmon/f71882fg.
> 
> Signed-off-by: Chengguang Xu <cgxu...@gmx.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/f71882fg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/f71882fg b/Documentation/hwmon/f71882fg
> index de91c0db5846..4c3cb8377d74 100644
> --- a/Documentation/hwmon/f71882fg
> +++ b/Documentation/hwmon/f71882fg
> @@ -94,7 +94,7 @@ Note that the lowest numbered temperature zone trip point 
> corresponds to
>  to the border between the highest and one but highest temperature zones, and
>  vica versa. So the temperature zone trip points 1-4 (or 1-2) go from high 
> temp
>  to low temp! This is how things are implemented in the IC, and the driver
> -mimicks this.
> +mimics this.
>  
>  There are 2 modes to specify the speed of the fan, PWM duty cycle (or DC
>  voltage) mode, where 0-100% duty cycle (0-100% of 12V) is specified. And RPM
