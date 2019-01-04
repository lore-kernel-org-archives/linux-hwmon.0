Return-Path: <SRS0=6G0q=PM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FEFC43387
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Jan 2019 16:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D81A721872
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Jan 2019 16:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4Id7XnH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfADQYa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Jan 2019 11:24:30 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32826 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfADQYa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Jan 2019 11:24:30 -0500
Received: by mail-oi1-f195.google.com with SMTP id c206so30808259oib.0;
        Fri, 04 Jan 2019 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:in-reply-to:references:mime-version:content-transfer-encoding
         :autocrypt:subject:to:cc:from:message-id;
        bh=AXvJ9DmSDHklY9ZpMwBKt0shChYkn2A+VWM/tF4u790=;
        b=k4Id7XnHKr6vZR6ECW2mUyERFfbwKCWwtYERnuwrnfg20SVLYKTRjK21kUNQ4w8X+W
         vxIgp2WJRYeJWH/ZiepZek8Lk3jakI9e+GSBRJYYcv25ExksPzRM3cuYV8GAangW/32h
         c1DNc+io0xfGz8lsSj51dW2a/FNAr47ib+cBl5zNhrp+8QoNj+8sY58USs3VZsInNvhv
         oCfbzNg+11H9+F6IjwDyZ44vnyBko2NSdf0zTCBY7UxY7aoh4dVDJA8WhRLkPMafrX0G
         N7qNMSlAHNmZGQ38DdouxWHHFVfxk7RaCArxnLygcLpRbhocvNDKeXvQxEQ6QIQIhe2K
         o5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:references:mime-version
         :content-transfer-encoding:autocrypt:subject:to:cc:from:message-id;
        bh=AXvJ9DmSDHklY9ZpMwBKt0shChYkn2A+VWM/tF4u790=;
        b=dh1HwCoLWfgpe6+tK+uNaqIm++rFChc7OVK67oNdTAx8DAK9jrn6GY+qyggpLNn43E
         fz4l+YPgr2AvQ46GLPVFH+rB6ARZb2hFCJ9ocHWPpsbfvN7mpEsaAxFMKuCsSvsupglv
         NC2SmxdLBhksh9+632AVWtrlyvnQJqW3VxywA2xmMH8VyZagiIJvJ3iu30EiE1vtO0aB
         ARbkvGLo/Uf77TOO1W85hGdWHJb6aenrGFOjBn7KYBmHToZMrtX/7B36eTa2bm5s+lGv
         n+mv9DHT6AqfWPtc38UbFEO3/p/V4wv6enNgdSyrjtCVP7fJZoky+DXQSh8qMn/miV9q
         Uy6A==
X-Gm-Message-State: AJcUukc0z4hscEFcv5gFE4o4J/b/JDMOIXzPrZHKNWcwhdwU6S/+wN05
        ZiBxAcUgexhfEh4a0iti/rI90u2i
X-Google-Smtp-Source: ALg8bN763ZpU26wC5nK8wrXAd031gwvhmIWfZZOvw8tyqs/UG1cZCnTt9YolahzZcvtVP885Xc/ynA==
X-Received: by 2002:aca:5b43:: with SMTP id p64mr1411751oib.41.1546619068810;
        Fri, 04 Jan 2019 08:24:28 -0800 (PST)
Received: from localhost (ip68-228-73-187.oc.oc.cox.net. [68.228.73.187])
        by smtp.gmail.com with ESMTPSA id w5sm28074324oif.48.2019.01.04.08.24.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jan 2019 08:24:28 -0800 (PST)
Date:   Fri, 04 Jan 2019 08:24:19 -0800
In-Reply-To: <20190104021547.15527-1-marex@denx.de>
References: <20190104021547.15527-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 mQGiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyRxGlk
 aOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQX3IzRnWo
 qlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0EAICDzi3l7pmC
 5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0dZdWX6fqkJJlu9cSD
 vWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAXSAgsrBhcgGl2Rl5gh/jk
 eA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYcnzJJ63ng3tHhnwHXZOu8hL4n
 qwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbhqIWgvr3SIEuR6ayY3f5j0f2ejUMY
 lYYnKdiHXFlF9uXm1ELrb0YX4GMHz7QnRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFp
 bC5jb20+iGYEExECACYCGyMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBh
 V5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSC5BA0E
 SM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqO
 vdi7YidfBVdKi0wxHhSuRBfuOppupdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qX
 Y5Dcagk9LqFNGhJQzUGHAsIshap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXG
 uVtZLT52nK6Wv2EZ1TiTOiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/Towdie
 F1rWN/MYHlkpyj9cRpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKm
 YwZgA8DrrB0MoaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBo
 BwE3Z3MY31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3m
 FrROBbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsEFRui
 SVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo7IiYaNss
 CS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48mvIyQ4Ijnb6GT
 rtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4PWU11Nr9i/qoV8QCo
 12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+HZA8SL54j479ubxhfuoT
 u5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjWHaKaX23Awt97AqQZXegbfkJw
 X2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mzJoil+u3k01ofvJMK0ZdzGUZ/aPMZ
 16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKykuVag+IijCIom78P9jRtB1q1Q5lwZp2T
 LAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4
 H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTCy5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6D
 ChDrguup2aJVU4hPBBgRAgAPAhsMBQJUX9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMe
 qX5aD/aq/dsbXSfyAKC45Go0YyxVHGuUuzv+GKZ6nsysJw==
Subject: Re: [PATCH V4] net: phy: tja11xx: Add TJA11xx PHY driver
To:     Marek Vasut <marex@denx.de>, netdev@vger.kernel.org
CC:     Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <E29570D9-3298-443A-8809-7E5BC4147FCD@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
Message-ID: <20190104162419.uPKR-Rr26krJ9Aq93Qb9SimSlPszF6rjyvPTYGtLOGM@z>



On January 3, 2019 6:15:47 PM PST, Marek Vasut <marex@denx=2Ede> wrote:
>Add driver for the NXP TJA1100 and TJA1101 PHYs=2E These PHYs are special
>BroadRReach 100BaseT1 PHYs used in automotive=2E
>
>Signed-off-by: Marek Vasut <marex@denx=2Ede>
>Cc: Andrew Lunn <andrew@lunn=2Ech>
>Cc: Florian Fainelli <f=2Efainelli@gmail=2Ecom>
>Cc: Guenter Roeck <linux@roeck-us=2Enet>
>Cc: Heiner Kallweit <hkallweit1@gmail=2Ecom>
>Cc: Jean Delvare <jdelvare@suse=2Ecom>
>Cc: linux-hwmon@vger=2Ekernel=2Eorg
>---
>V2: - Use phy_modify(), phy_{set,clear}_bits()
>    - Drop enable argument of tja11xx_enable_link_control()
>    - Use PHY_BASIC_T1_FEATURES and dont modify supported/advertised
>      features in config_init callback
>    - Use genphy_soft_reset() instead of opencoding the reset sequence=2E
>    - Drop the aneg parts, since the PHY datasheet claims it does not
>      support aneg
>V3: - Replace clr with mask
>    - Add hwmon support
>    - Check commstat in tja11xx_read_status() only if link is up
>    - Use PHY_ID_MATCH_MODEL()
>V4: - Use correct bit in tja11xx_hwmon_read() hwmon_temp_crit_alarm
>    - Use ENOMEM if devm_kstrdup() fails
>    - Check $type in tja11xx_hwmon_read() in addition to $attr
>---

[Snip]

>+	ret =3D tja11xx_enable_reg_write(phydev);
>+	if (ret)
>+		return ret;
>+
>+	phydev->irq =3D PHY_POLL;

The PHY driver should not be imposing that, leave it up to the platform co=
nfiguration to set that=2E

>+	phydev->autoneg =3D AUTONEG_DISABLE;
>+	phydev->speed =3D SPEED_100;
>+	phydev->duplex =3D DUPLEX_FULL;
>+	phydev->pause =3D 0;
>+	phydev->asym_pause =3D 0;

Are any of those necessary if you set basic T1 features?

Everything else looks good to me=2E Thanks!
--=20
Florian
