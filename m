Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E931C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 16 Dec 2021 20:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241417AbhLPU3Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 16 Dec 2021 15:29:25 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:34776 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236123AbhLPU3Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Dec 2021 15:29:24 -0500
Received: by mail-ot1-f52.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso348891otj.1;
        Thu, 16 Dec 2021 12:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bDBqevOB85xRGIw/RBLVUuTMCIA2+fremlM1z3vOPh0=;
        b=QHzhkGYNERcqyHZE7XYrZQgTEi5C6HLUeCZ8v6W680AQuTJTkzb+dirxQ+9xcYsAsh
         9T4P/VDVHk0uPqJP3fDuNEmhc9HFI0zkTqmtdXA36w5sVsrjq3GLoMzViFq0/Tsp9oDF
         MdTC6dJrPw6A97UqWpvZ8FIx8eUWKMObfYkQp3lhExnpSucZOUo5WyBTKBS7HABuyyuG
         uw1fQQpPbRhxNqcGFKOqFmDGv4t7TIR+qqt0s0KJeDFNfU+Ohcnq7opU9XX9AR+1gJKS
         YhkJvtm3R72hTgbMvFzduKqc0n+1P7rLwVSLs4sMagoiCXNDMaH6g6Snj7eww9v+djVI
         KLUQ==
X-Gm-Message-State: AOAM533ZQ/cmZJw++Uv3vkZU2q5fZTNZI0Y1komDutv8uMjucypsBs5z
        NNfgfoinohcxgPXDJ9kdxw==
X-Google-Smtp-Source: ABdhPJy+B6a3x2FqVeUfnuWoMpK9XmwbhVz6YLYvC8ukefOb6l2pVnRu7UxvCf3lR1kjgugdCYMoAA==
X-Received: by 2002:a05:6830:1e97:: with SMTP id n23mr13515194otr.4.1639686563407;
        Thu, 16 Dec 2021 12:29:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h3sm1185255ooe.13.2021.12.16.12.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:29:22 -0800 (PST)
Received: (nullmailer pid 702224 invoked by uid 1000);
        Thu, 16 Dec 2021 20:29:21 -0000
Date:   Thu, 16 Dec 2021 14:29:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, Chris Lesiak <chris.lesiak@licor.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ntc_thermistor): Add Samsung 1404-001221 NTC
Message-ID: <YbuhoaaO6d/KjKuy@robh.at.kernel.org>
References: <20211215174241.1496169-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215174241.1496169-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 15 Dec 2021 18:42:41 +0100, Linus Walleij wrote:
> This adds the Samsung 1404-001221 NTC thermistor to the
> NTC thermistor driver. As far as I can tell it is electrically
> compatible with the Murata 47K NTC thermistor.
> 
> This thermistor is mounted in a variety of Samsung products.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Chris Lesiak <chris.lesiak@licor.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> The DT binding oneline is included, I see no point in splitting
> that into a separate patch.
> ---
>  Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml | 1 +
>  drivers/hwmon/ntc_thermistor.c                              | 4 ++++
>  2 files changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
