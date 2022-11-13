Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87F1C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Nov 2022 20:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiKMUmS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Nov 2022 15:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiKMUmS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2022 15:42:18 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAE42A7;
        Sun, 13 Nov 2022 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668372113; bh=9WtOxHZnv4TWmnTY+DZYbVcLWfzSpaBUBAwrjRqn/GY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=UIBHm0TL0Rbl3BQHpcwFfvZDrdhp9nlAWHXIwDNWiNEdxv5a+r5Wv/SMK6c0Am6xh
         T3oaMDrR4vdIzSg13cVhHUkGLbBeRNwdhooI0YAszPWg+HpttKRJw/UVl8QKX9eQpL
         fZikdsGWZmofs0FSpqt0azHMdA9cZvkNaq5b5Awfoggi4zWrqKvj1l5DSKAkkyYf/v
         t+EIVnCEMe03XiOAkc7FLt3INAE7fICCr7Uq++HYRkBW1YnVC2TNrCPuxSQO0wuD7s
         av5RUE/bsDb+KQ+HCa4RfdcRsPM5u0JTaexOA/nlNjh54M8BgvtMKabYwwPDHdtPff
         nV7mM/EUMypAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7GS-1ooJGU3uI6-00BeDQ; Sun, 13
 Nov 2022 21:41:53 +0100
Subject: Re: [PATCH v6] hwmon: add OneXPlayer mini AMD sensors driver
To:     =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= 
        <samsagax@gmail.com>, pobrn@protonmail.com
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <20221104140659.593608-1-samsagax@gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <5b7fdb3d-7874-feb3-ad0b-c20201b5a871@gmx.de>
Date:   Sun, 13 Nov 2022 21:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20221104140659.593608-1-samsagax@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:iab1DwP0TEX7K+2bbCgD9OE7UM2Tvtq3nq83VJCTtQmc8fvg+SS
 5jzzTJAa3q7LgQclpcyxP+dM7eEybRaUTkeF261VppYsaaVhV//ZNlybvRORGRvako23nDc
 89iOy2WA5LpXr/XsrlE8Z+r9D5GQ0KqbQC8t78tsamksanN+3sarCT595VSWpR/7q+hUyBg
 +skIAdYjdbGxifiARzyEg==
UI-OutboundReport: notjunk:1;M01:P0:mudQtIBa284=;pjzLj2LOC3p6LxsHFJcuDValyMu
 Jp6WZPaD2wYudDQrXuPND13f4hKQIYInxOgq+E3kdOnJVOkp0U/mblipKYw1l9+/9a9RzPbyJ
 9UVNlrUOxRzZe9zo1TwBHj/07wBpIm7SVi2Jb+JgJnxmuExv5xkYhIq3GkPptbh3VsTpxJVuq
 dhxeUCDqVI64ZZNX1xrPoNsWTaz2/eNfWTcpn0ZgrEWolSwUqbym9GAS82JfZFCWX8BXr41/x
 MP6XQNJnI1WlYCebI678sZ6Qqy5QrXhA2fzfDpIyGgQcPc33Kp5FBfnKv/liRMn+EDC45i2ad
 +80UkdRcO0WI2FtTIv5WxoS9p7kz5PgKwn0TcHDjtNKiLhjYgM8TEQkMoDKYScSWpYS9bLIZO
 6j1/65yalM7rQhslBoNnxTf4B6ChvyKSauPCfp8gqIjsWv6GH4Y1xF9RM0IcwR8ymMP+a5ON/
 A1kvcM7nKZLQPkgW0jCV8lrYquOC0Ax4rQIIdw+H+gy/pnfa5EufDcWeiUgnsd7CJMhXKYY3k
 R2XQENnIwJMLyZSOOctAJC10M4ND8kLMr8++qnXQO5QAVGHfP8UbpRvg77sNj1tYpfYoPR//T
 iXrN7qTshlNui++rk66yGX4mcKHwTL8GIM7uy7l7bgNvwHYbrUs6BMbOt+3fMhvXdBnVX+F6O
 RywzTlQaUgNU92S2H6qFchWVFNDx5QKHtDJcQ1gezh4yEIkU4XsYHvYc1IxRzP/ErRdMKrb6p
 fHTvlk9EKqkWH7ceDgmKGj71I3A9Mvelyh2cKGu0aZnWvLbs1A3MNpesH4lMTUO8qyc/YuTsh
 1xVBERymHjsKoRg/GhDe23iBWLkfp4EGBr14NycFa8XkZNkGKS1E+QEV70pvapryYQMo/kKMS
 PyytsOA2jcmj3vsM5S/HavuKaTngK3zRJ5Ye0pmLaw0eJxo6wM4NGp+teH/oO5FDM6tBJVlkP
 EN4rbCg1IRzasJoFLr9XNjEk7zY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 04.11.22 um 15:07 schrieb Joaqu=C3=ADn Ignacio Aramend=C3=ADa:

> Sensors driver for OXP Handhelds from One-Netbook that expose fan readin=
g
> and control via hwmon sysfs.
>
> As far as I could gather all OXP boards have the same DMI strings and
> they can be told appart only by the boot cpu vendor (Intel/AMD).
> Currently only AMD boards are supported since Intel have different EC
> registers and values to read/write.
>
> Fan control is provided via pwm interface in the range [0-255]. AMD
> boards have [0-100] as range in the EC, the written value is scaled to
> accommodate for that.
>
> Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>

...

> +/*
> + * module_platform_driver() may be used here but somehow it breaks the =
module
> + * either by preventing it from loading or not exposing hwmon attribute=
s.
> + * Either way I'm not smart enough to figure it out so I'll leave init/=
exit
> + * macros for now.
> + */
> +module_init(oxp_platform_init);
> +module_exit(oxp_platform_exit);
> +

Hello,

i know i am a bit late to point that out, but AFAIK module_platform_driver=
() only registers a platform driver,
not the corresponding platform device. With the platform device missing, t=
he platform driver will never load.
This is the reason why platform_create_bundle() exists, it basically regis=
ters a platform driver and
a platform device together.

Should i send a separate patch to remove the comment?.

Armin Wolf

> +MODULE_AUTHOR("Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>=
");
> +MODULE_DESCRIPTION("Platform driver that handles EC sensors of OneXPlay=
er devices");
> +MODULE_LICENSE("GPL");
> --
> 2.38.1
>
