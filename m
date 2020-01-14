Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FE5C33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDC512072B
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5mdVxD5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbgANOEe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:04:34 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35326 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgANOEe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:04:34 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so5291519plt.2;
        Tue, 14 Jan 2020 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KSJiQv5EH8uw9CtliQf9CJHwVlGgkZAi69kID9fXKZs=;
        b=O5mdVxD58pz2HsG5OXcxiK7iBPzNc60dpNT6NgYDYHYUD4N7aV+RqWEbLtbpnMZILT
         eeqtUlymThQZ98QE7+rDL5UL2ZQ4LK7G53CA+SzAyFIVgBWMZ4DZVdbeHMAzZQQWhyPq
         A9YtxiXhK8MDF6E3BKRn7UnNirRiO6HUumxwWAv0CIrtxoCdFXilYWw7+uYsVkNGwXjX
         CtyWWUkSwJY/4nNG6COPoMp/PpBNQSMwVfCeti2Qvio+GmssfyY+OQtxMMA2569Tj40w
         KwYzlYZMGeiwV8PGogBIe9OPZ/KVgwUMiPrGSoBT/GjU5gZRa8uVI74DEEGATgJ5XdYZ
         odeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KSJiQv5EH8uw9CtliQf9CJHwVlGgkZAi69kID9fXKZs=;
        b=HG7s+DZOtdQt1fzFi946QUySRGnfygbGNTI4kreipVH+JnSnAh/jz9XG/jCp3Pnvts
         aeWOm42JDn/XrJdeyGoQ1UT2tBiByn+E4T6lQeuW5Q0lM92uxqVCsMunrkK/kPqLcAVY
         4pwMXrSLSW4fUq3aE/0cezKqm+HAzl6eqc7DmgkOXLOIwB+CvQTXT8bwNokDcgE7diy6
         RKbkF8RntqEkkCm1Ag5peKXS2k7is3M4BHIu9GQvxvSv9M15PxltutoLdMDC62dxYxRG
         21m9W1GVcgINpgEMbix047ZX2wHq4vTnOdfgjpsEWOZMWT9Xwxgw9XF6MZUvOXiD4pDX
         xoEQ==
X-Gm-Message-State: APjAAAUgToIYBRKsTyEO9slJQaSntPDuGjGWMaRrNikRceE/mGmV0AhJ
        ijISNkLLdxj/T7uAQCNGS6w=
X-Google-Smtp-Source: APXvYqxxwWiDTo9PZQtO0UJ5Rb4CZTZ3JfWAISkiWemVyIWT2sqk0oVpekanhYU36oWjaoc9KdxOCA==
X-Received: by 2002:a17:902:82c9:: with SMTP id u9mr20060329plz.264.1579010673849;
        Tue, 14 Jan 2020 06:04:33 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u26sm17524067pfn.46.2020.01.14.06.04.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:04:21 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:04:19 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v1 5/6] dt-bindings: Add TI and Infineon VR
 Controllers as trivial devices
Message-ID: <20200114140419.GA18109@roeck-us.net>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-6-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-6-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:40PM +0000, Vadim Pasternak wrote:
> Add Texas Instruments Dual channel DCAP+ multiphase controllers:
> TPS53679, TPS53688, and Infineon Multi-phase Digital VR controllers
> XDPE12284, XDPE12254 as trivial devices.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

I assume this patch will be pushed through the devicetree branch. If not,
let me know and I'll apply it to hwmon-next.

> ---
> RFC-v1:
>  Changes added by Vadim:
>  - Drop others than xdpe12284, xdpe12254 devices, since there is not
>    clear confirmation from Infineon regarding availability of the
>    others.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 765fd1c170df..dfe22e0a82eb 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -104,6 +104,10 @@ properties:
>            - infineon,slb9645tt
>              # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
>            - infineon,tlv493d-a1b6
> +            # Infineon Multi-phase Digital VR Controller xdpe12254
> +          - infineon,xdpe12254
> +            # Infineon Multi-phase Digital VR Controller xdpe12284
> +          - infineon,xdpe12284
>              # Inspur Power System power supply unit version 1
>            - inspur,ipsps1
>              # Intersil ISL29028 Ambient Light and Proximity Sensor
> @@ -354,6 +358,10 @@ properties:
>            - ti,tmp103
>              # Digital Temperature Sensor
>            - ti,tmp275
> +            # TI Dual channel DCAP+ multiphase controller TPS53679
> +          - ti,tps53679
> +            # TI Dual channel DCAP+ multiphase controller TPS53688
> +          - ti,tps53688
>              # Winbond/Nuvoton H/W Monitor
>            - winbond,w83793
>              # i2c trusted platform module (TPM)
