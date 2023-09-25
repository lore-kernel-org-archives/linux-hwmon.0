Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3F7CE7AB5
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Sep 2023 18:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjIYSCO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Sep 2023 14:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjIYSCN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 14:02:13 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C467E111
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 11:02:06 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c5ff5f858dso21371265ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 11:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695664926; x=1696269726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8eSsSBJ8Vq4Qi6ZMfaWUsInrqRpqyqKIrqUaEPasYuI=;
        b=BI5J06qjkQ7ljgnowfX42qKmMVLVqjKY9nFTkGMX+7kt2qyLHxaU8AHwc8CMMbQTHq
         EMkXck8eAHwtyetfitVwakO3E8PSKHpQ/NASXyVOj4TgzGVaeJlfZe1bE7oTHtmX9kCt
         /s5Zl8J292KOITX6AqFJbfYlWR2kjXivcBexo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664926; x=1696269726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eSsSBJ8Vq4Qi6ZMfaWUsInrqRpqyqKIrqUaEPasYuI=;
        b=G/f/JEwTAZGurvpMg0gei9DKMe8pVbun48D7v9Ec9YDEPjvVE0y5yeiOSyJovqqGsB
         L5fPUwp6pjqAZw5bviCAWepsQQcfvUUSmRbrYGx0a2ig+tbCkoB6isNmW2RAVU+mq2fi
         CW2Oe1GS/+1hM08e07Uivb556+QHyAZXZcnbFkHG+HAqo7LAYqoDplf+CMQ0bCGdsKoQ
         4QPioxt/PvPPbnzr5o9BgANEOXqtLAH1vNFIsXCJ5Cfo4leX8if0TnmbtpvWsQxvmbXS
         kHMJsK9rcP7MadgGonLR2UiPdI3teZ/nuPMaBvWf6qkKLfuQNFfA7y095Ga3+paUxWhq
         K9pg==
X-Gm-Message-State: AOJu0YxRl+b0DULf+Q8/dz1EiMDw7vkfpi+rhHjzk/iSouwOngy53l5E
        QYO13LF2flxbKMfqHzzR7dahYlKNXwh6qaek7l8=
X-Google-Smtp-Source: AGHT+IHld3ZFV0+XNf/j9xLn/Bc27rzyru1qiqAoZ2oWmrXp9wmOwRx86JiK/FA3B/MoWE1xxRrRCg==
X-Received: by 2002:a17:903:2308:b0:1c6:2acc:62ea with SMTP id d8-20020a170903230800b001c62acc62eamr1069374plh.57.1695664926254;
        Mon, 25 Sep 2023 11:02:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a11-20020a170902eccb00b001bb28b9a40dsm9161300plh.11.2023.09.25.11.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:02:05 -0700 (PDT)
Date:   Mon, 25 Sep 2023 11:02:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: (acpi_power_meter) replace open-coded
 kmemdup_nul
Message-ID: <202309251101.1544F5F@keescook>
References: <20230925-strncpy-drivers-hwmon-acpi_power_meter-c-v4-1-3bac7534f10f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925-strncpy-drivers-hwmon-acpi_power_meter-c-v4-1-3bac7534f10f@google.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 25, 2023 at 03:43:23AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> Let's refactor this kcalloc() + strncpy() into a kmemdup_nul() which has
> more obvious behavior and is less error prone.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v4:
> - drop +1 from length arg (thanks Kees)
> - reword subject line (thanks Kees)
> - rebase onto 6465e260f4879080
> - Link to v3: https://lore.kernel.org/r/20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com
> 
> Changes in v3:
> - refactor to use kmemdup_nul() (thanks Thomas and Kees)
> - change commit msg to reflect ^
> - rebase onto 2cf0f71562387282
> - Link to v2: https://lore.kernel.org/r/20230919-strncpy-drivers-hwmon-acpi_power_meter-c-v2-1-8348432d6442@google.com
> 
> Changes in v2:
> - use memcpy over strscpy (thanks Kees)
> - Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-hwmon-acpi_power_meter-c-v1-1-905297479fe8@google.com
> ---
>  drivers/hwmon/acpi_power_meter.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index fa28d447f0df..c13b5c8a0433 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -796,14 +796,13 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
>  			goto error;
>  		}
>  
> -		*str = kcalloc(element->string.length + 1, sizeof(u8),
> -			       GFP_KERNEL);
> +		*str = kmemdup_nul(element->string.pointer, element->string.length,
> +						 GFP_KERNEL);

This whitespace looks weird -- I'd expect this to line up with
"element", like this:

> +		*str = kmemdup_nul(element->string.pointer, element->string.length,
> +				   GFP_KERNEL);

Otherwise, yes, looks correct.

-- 
Kees Cook
