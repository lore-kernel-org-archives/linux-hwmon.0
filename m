Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA38C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 16:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F72E613C5
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 16:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhEMQ4A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 12:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhEMQzz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 12:55:55 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCCDC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 09:54:44 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id x8so26150751qkl.2
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GgD3A/VZ5Ryar84l5ebVwQ/YQHE5jvxe23cTUil06V4=;
        b=dgWaZBBtdvL0pE3dcwzVQLK2A7YJGdMIF+kC+XTiV5DKvITm7Jv/UMOUjBcZxpR7qr
         9MDxrBgim/LxsE9MMv70cAACJdhE/nUvgRhjFJALAdVuaH73YLgLY3jIJuJIj3xLsZrd
         YP5HMvKcHO14/Ql01sP+V2jWyTIumwyB487U+j6ap1LCjFJp8fuh0clQX7eQkYNMKx5b
         mev2jnqJOyW41242SC8T6jg0qpz+tjh9sAMIgFQWIDQMl3xaIgfclPB7Ncb6mEni/0GF
         T63D7NhZCeMB4Jaq+91g2LZElr3/Cyw+6kbQSyyeRWAuc3ClsQE+v3rD3ba8YS3eVv47
         v0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=GgD3A/VZ5Ryar84l5ebVwQ/YQHE5jvxe23cTUil06V4=;
        b=YayZrVloQ4Z/js/SoKeF3V9JlBEV94Dpu5gSKgeNjpoaCZU2hYNvvGRs3JS8c9XhDK
         XWnvAawqvRHsRu7fggdv8ku/nj6mthfBsCeZMqM5ERnc+i+dEy0c/7ITNDfeGS4spYKl
         RLmyuiK8A04lKCIDf6m0Tl33j6dmkpELRXo7o/6kN1OgYhB2scaD7F463/xqWYvXOUbs
         zM9+FiaUVqD//lYUboAu22vhWs6CClfVm1QLjLMVg/GQu+/lXVvoqXiVkZbkO2IBqCwj
         CoLrxIuEnzREW3n6xR01FZfKbD8xXiu1lktB+iYCL2zs4WnalJWgr2HzAtW+LO6z08Cj
         psQA==
X-Gm-Message-State: AOAM5316FoKSoc/O3sAxN2+Hn2fgp05xju8eB94WuurMPhU5P4MYFyZJ
        cJMt04firV8Bivfg4vFJPoyRShZselc=
X-Google-Smtp-Source: ABdhPJyFxsLuONFlKhwRMAbajQaor3qE8oCtDI17ycOOCPMYnBTQ9Q1DR3cODDxp1ufyTRN7Dbah6Q==
X-Received: by 2002:a05:620a:12b6:: with SMTP id x22mr39674372qki.97.1620924884198;
        Thu, 13 May 2021 09:54:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c185sm2850582qkg.96.2021.05.13.09.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 09:54:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 13 May 2021 09:54:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
Message-ID: <20210513165442.GA1249121@roeck-us.net>
References: <20210513154546.12430-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210513154546.12430-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 13, 2021 at 05:45:46PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> When support for up to 10 temp sensors and for disabling automatic BIOS
> fan control was added, noone updated the index values used for
> disallowing fan support and fan type calls.
> Fix those values.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Pali Rohár <pali@kernel.org>

Applied, with added Fixes: tag.

Guenter

> ---
> Tested on a Dell Latitude C600.
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 2970892bed82..f2221ca0aa7b 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] = {
>  static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>  			      int index)
>  {
> -	if (disallow_fan_support && index >= 8)
> +	if (disallow_fan_support && index >= 20)
>  		return 0;
>  	if (disallow_fan_type_call &&
> -	    (index == 9 || index == 12 || index == 15))
> +	    (index == 21 || index == 25 || index == 28))
>  		return 0;
>  	if (index >= 0 && index <= 1 &&
>  	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
