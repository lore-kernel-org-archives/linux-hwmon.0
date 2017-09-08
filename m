Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkdaUtxLW9JkxuigXqWZ=H5Fin6_ePeLStyTS-qUQxdZ9ng@mail.gmail.com>
References: <20170906235001.d54617b600ae192ffc0cf206@videhug.ch>
 <20170907151053.GA15047@roeck-us.net> <CACRpkdaUtxLW9JkxuigXqWZ=H5Fin6_ePeLStyTS-qUQxdZ9ng@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 9 Sep 2017 00:38:37 +0200
Message-ID: <CACRpkdbW0LRGAesmFgJEOc7Dt_3C6jMjPFbD1xggcr7DQQj3Vw@mail.gmail.com>
Subject: Re: hwmon/sht15: gpio irq problem
To: Guenter Roeck <linux@roeck-us.net>
Cc: Davide Hug <d@videhug.ch>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Sep 8, 2017 at 11:27 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Maybe the driver needs to be converted to use GPIO
> descriptors first though :/

I got annoyed that the driver was so oldschool and sent a patch
fixing this. It'd be great if you could test it!

Yours,
Linus Walleij
