Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="amw0D/zB"
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B08210E0
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Dec 2023 10:44:41 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8A7FB240103
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Dec 2023 19:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1702061078; bh=gdJEGxQD1dyTYKJxTTItwkIZdG3P5X6tnnWz/BIIbGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=amw0D/zBG/8sz8L4nO/+ln4b5LjUMs1PA4MawALRr6ZpulJNfzf/bPIOmnZSmy8Li
	 RcykgmhG4a28WzK3OkBQQqb1kWsOVXeS8bBDZB7Jyo/ER+EGyiTWgJi6lzH6gI1LEM
	 h/ZyoVDY+iKFTML//fBtr54MbX7b/SHT1BC7tq+IL7uJJ2z1bQ/6eJoPVoDKHxKpcA
	 dSAfNGMNJxpu+KYx4588/x6ryy+5JSoaz4/YjIiRSFmL3WFd8uBPf3LQYCiG4OTprs
	 fs0X7UmXa7GwS5sMsrzloIwPViRiOtAyXN34GjrXTWlG3N2NlA6rGq0J2XEK+AsK7X
	 1HDafKZLDiQhw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Sn0Rn1jvRz6txc;
	Fri,  8 Dec 2023 19:44:37 +0100 (CET)
Date: Fri,  8 Dec 2023 18:44:36 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Fix probe when built-in
Message-ID: <20231208194436.37e62928@posteo.net>
In-Reply-To: <20231207210723.222552-1-W_Armin@gmx.de>
References: <20231207210723.222552-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  7 Dec 2023 22:07:23 +0100
Armin Wolf <W_Armin@gmx.de> wrote:

Just forgot. Did both, works just fine. Is it okay that way? This is my first
time.

Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

> It seems that when the driver is built-in, the HID bus is
> initialized after the driver is loaded, which whould cause
> module_hid_driver() to fail.
> Fix this by registering the driver after the HID bus using
> late_initcall() in accordance with other hwmon HID drivers.
> 
> Compile-tested only.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/corsair-psu.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 904890598c11..2c7c92272fe3 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -899,7 +899,23 @@ static struct hid_driver corsairpsu_driver = {
>  	.reset_resume	= corsairpsu_resume,
>  #endif
>  };
> -module_hid_driver(corsairpsu_driver);
> +
> +static int __init corsair_init(void)
> +{
> +	return hid_register_driver(&corsairpsu_driver);
> +}
> +
> +static void __exit corsair_exit(void)
> +{
> +	hid_unregister_driver(&corsairpsu_driver);
> +}
> +
> +/*
> + * With module_init() the driver would load before the HID bus when
> + * built-in, so use late_initcall() instead.
> + */
> +late_initcall(corsair_init);
> +module_exit(corsair_exit);
> 
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Wilken Gottwalt <wilken.gottwalt@posteo.net>");
> --
> 2.39.2
> 

