Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f181.google.com ([74.125.82.181]:44327 "EHLO
        mail-ot0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751858AbdKZW7L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Nov 2017 17:59:11 -0500
Received: by mail-ot0-f181.google.com with SMTP id d27so22701019ote.11
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Nov 2017 14:59:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171126233817.19eb94766dc58ee5286de655@videhug.ch>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
 <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
 <CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
 <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
 <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
 <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch> <1511279379.29108.7.camel@nxp.com>
 <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch> <CAOMZO5C4K-+nqTOQQsbO-FOAZ5o10Wps3-Fe96ikyg+s4jEAEQ@mail.gmail.com>
 <20171125010340.97aa0df241720c59eacc4e27@videhug.ch> <CAOMZO5DHWrhK1Sj3-svh+VxBUvakiFd1q63BZ_UHFkA7R=nhjw@mail.gmail.com>
 <20171125104126.67e9096572a108a2f183d9a8@videhug.ch> <CAOMZO5AtTbxyWSGNSUxdZAaPT4DZrxpSb0NKeHYMEOj9m7Xdgw@mail.gmail.com>
 <20171126233817.19eb94766dc58ee5286de655@videhug.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 26 Nov 2017 20:59:10 -0200
Message-ID: <CAOMZO5AyCtEuKyF=ri7fOA1+h2B_n7OLRWq6QSFnDO9+dafrDQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
To: Davide Hug <d@videhug.ch>
Cc: Marco Franchi <marco.franchi@nxp.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "arm@kernel.org" <arm@kernel.org>,
        "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Davide,

On Sun, Nov 26, 2017 at 8:38 PM, Davide Hug <d@videhug.ch> wrote:

> There is a thread in the linux-gpio mailing list on this topic[1]. There it was
> suggested to me to fix the sht15 driver, so I started the thread here. But in
> the meantime in the linux-gpio thread it was suggested to make gpiolib support
> what the sht15 driver does.
> So my plan would be to see if that works out and otherwise propose a patch for
> the sht15 driver here on linux-hwmon. It was proposed to use a simple polling
> loop and avoid using irq and this works really well for me.

Ok, great.

In case you post a patch, please keep myself and Marco on Cc so that
we can test it on our imx7d-sdb board.

Thanks
