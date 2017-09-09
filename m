Return-Path: <festevam@gmail.com>
Return-path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170908223706.18412-1-linus.walleij@linaro.org>
References: <20170908223706.18412-1-linus.walleij@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Sep 2017 12:02:11 -0300
Message-ID: <CAOMZO5BhykzvQRng1tG0=D37hBm9cg9P9bZR23w6g=xqQ9h+hQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon/sht15: Root out platform data
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@cam.ac.uk>, linux-hwmon@vger.kernel.org,
	"arm@kernel.org" <arm@kernel.org>, Davide Hug <d@videhug.ch>,
	Marco Antonio Franchi <marcofrk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Sep 8, 2017 at 7:37 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>         /* Try requesting the GPIOs */
> -       ret = devm_gpio_request_one(&pdev->dev, data->pdata->gpio_sck,
> -                       GPIOF_OUT_INIT_LOW, "SHT15 sck");
> -       if (ret) {
> +       data->sck = devm_gpiod_get(&pdev->dev, "clk", GPIOD_OUT_LOW);
> +       if (IS_ERR(data->sck)) {
>                 dev_err(&pdev->dev, "clock line GPIO request failed\n");

Missed to update ret here:

 ret = PTR_ERR(data->sck);

>                 goto err_release_reg;
>         }
> -
> -       ret = devm_gpio_request(&pdev->dev, data->pdata->gpio_data,
> -                               "SHT15 data");
> -       if (ret) {
> +       data->data = devm_gpiod_get(&pdev->dev, "data", GPIOD_IN);
> +       if (IS_ERR(data->data)) {
>                 dev_err(&pdev->dev, "data line GPIO request failed\n");

Missed to update ret here:

 ret = PTR_ERR(data->sck);

If you send a v2, please add Marco Franchi on Cc as he has hardware to
test this driver with dt support.
