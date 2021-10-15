Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D90C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29682610D1
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243415AbhJOW46 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243407AbhJOW46 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:56:58 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09542C061570;
        Fri, 15 Oct 2021 15:54:51 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id y207so15138705oia.11;
        Fri, 15 Oct 2021 15:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EltKhWGvCa2RkiyQgHNtu3bYyGX2czy9WKkQqHoxKxg=;
        b=jpniQaa39KQ4Ng+t9Eva/DQo4jzZgfhqnYAUjbTqq4ji4vzc17PI2IqBwkdy+TDBTP
         gZnwpHjlIJ/yd3OnATPml0mbDVfyhmrhnVlEOtTCE+po/qmXyQSatGgX/J+VYXRQwBtc
         ktysIfHs1j5QDaHSxr02BIFIIbWxphsu0Vi9J8NV2gTxhYqW4k0gZ66z91lPWrA0YKp8
         ybIayaVuIY/dxHZ0RM9LXVjECCnzJyPMukJ7vqVp3uFG6au4dWFucWYCdNgSx9JP9Lpc
         pk5KrNvnybZalGpACWnjTkZyE0nhQzQq2ojB39bHtmOAOtOl5n8qaGY0cO3SYVEN7OFd
         ABZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=EltKhWGvCa2RkiyQgHNtu3bYyGX2czy9WKkQqHoxKxg=;
        b=0xYKRSDAxzje/ZrCJT5QVMt2GkY3qln288EPrP1yzN/z2VqTcz9hr1UlZ11FMWAZN7
         T+Fn6oDhuorjezWwSfiED3smviaZOpLyFhlSXJvAj3efHAtycovrukucaSir7xGsxtBK
         5s3cpLKKscCl5WdXL3twaVT3LQkUj16qLvU3gfHNbQHF9DX/rgCzztUcFAEkjD4CIlaw
         D/+HU3nqH6CwkQge6EvicDBPezQUwgXLhJG7TarMaaQEk8ojoUuAN8ZhxfC95l4DRGie
         I7dukcAtBjIN16wLS+cX30/L3MTFmDRvdNtl9EAAWD/XoG4nmdvuBtUctmMn3thwdF8g
         mVkw==
X-Gm-Message-State: AOAM533NfTUdDDvFGrZcHLp7jF1TpppryUk8FwTUpS2skuoZDjQOJ0z3
        bHEpfKz9Y8YC96JbooauDns=
X-Google-Smtp-Source: ABdhPJz+r7AiaE1lbLNGqgCrffaMIuVOkbyu1cCzC2pSSu4LeBJ5Iv0l34zqTTRqIjmBLPj1Pp/9kA==
X-Received: by 2002:a05:6808:118a:: with SMTP id j10mr19717996oil.101.1634338490426;
        Fri, 15 Oct 2021 15:54:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9sm1461772otn.77.2021.10.15.15.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:54:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:54:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/9] hwmon: (tmp421) update documentation
Message-ID: <20211015225448.GA1485811@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <6ae22fdf18513ddd09f430ef9c5e46c17e27886b.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae22fdf18513ddd09f430ef9c5e46c17e27886b.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:10:44PM +0200, Krzysztof Adamski wrote:
> Sysfs interface of the tmp421 driver was extended in the recent patches
> so lets update the documentation to reflect that.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied, again after the fixup.

Guenter

> ---
>  Documentation/hwmon/tmp421.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/hwmon/tmp421.rst b/Documentation/hwmon/tmp421.rst
> index ddcd5159c75d..a3002117bbd7 100644
> --- a/Documentation/hwmon/tmp421.rst
> +++ b/Documentation/hwmon/tmp421.rst
> @@ -64,3 +64,13 @@ the temperature values via the following sysfs files:
>  **temp[1-4]_input**
>  
>  **temp[2-4]_fault**
> +
> +Each sensor can be individually disabled via Devicetree or from sysfs
> +via:
> +
> +**temp[1-4]_enable**
> +
> +If labels were specified in Devicetree, additional sysfs files will
> +be present:
> +
> +**temp[1-4]_label**
