Return-Path: <SRS0=fB8N=3T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4126AC2D0DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Jan 2020 22:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F2CA20674
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Jan 2020 22:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th7Hxjd7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgA3WKP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Jan 2020 17:10:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50625 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgA3WKP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Jan 2020 17:10:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so5595636wmb.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jan 2020 14:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7PG1R+pcw6VQFUbkI4i6qIT/xsFaFivQsuyJDDhyjbU=;
        b=Th7Hxjd7TULGR5XwAXNWMouY/o5pC6jLTlx9aD/hu27GVKNHvY/KlkZ44Zq9yhvnLx
         hqISKIm2nt5LF6c1fZIbu/ndASUijhPDEdJ1yZdH1uNAgw+VUkUM4C3xu/VpiXW8ANHC
         Pki/j669eyv91ANtj2tTablYtALTLO2uzbcu5F5U3cKsn+2e8HeFY3Wewtww6JtX4h0t
         PhuxErzMJ+Ee6pLqEkki6GSWbKW3NAy5ytxxB7c64bydFsqYy0FU7CCejHsJiXOtNYJe
         CpY4rz23WylNlecWV2G9QpPKpM70gOkF1PQH4bNGqYYfRelqtSUEwmlFVnXWwihp8FBO
         XkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7PG1R+pcw6VQFUbkI4i6qIT/xsFaFivQsuyJDDhyjbU=;
        b=XzJEIpDD/PJrfysj+KFl291UCUKqxQ/5KNtQyInUjdALNgKwTdcOJvhGtoEJGyCd1N
         4pon/aDkcFo2y8ekgWpUE/y6ZsV7KJMhylPBTVQ9dU6KDWBzTCJi23nZIsHctAOdDzrv
         Ca4DDoXDnX9wgxMV4yz5nXx7BDFOKOlTzGcI7jEF96a+BOI8Fghq+hVnpsZjR/FeJZp5
         B/aIPMS5KbYJxuOV8ZBhRPcRLG2tKgK0TzwLnDXp7w+rqQ4aYEdOccb830IJRCj9yK5T
         bTcG8x1D8dfUdHAbderJVILJpTpWKHVl9BmG1aSMH29Z0NHblbW31nOpxasN2vy0iSOg
         +CcA==
X-Gm-Message-State: APjAAAWKfjpNscvD3NBiqPY9WJAm/99LwNNGUgw4/mXa1yz0MbcaOu6k
        B7aK7iX1XtRhf2FiOa/XFBc=
X-Google-Smtp-Source: APXvYqxdgfqRHTtLLF9yv4kBgv6Iyelz7vY5dkuVEUBCeOYrBsomfdOvyxvRo55RLgKuGaYXGZGcSg==
X-Received: by 2002:a1c:9e89:: with SMTP id h131mr7766983wme.161.1580422213212;
        Thu, 30 Jan 2020 14:10:13 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z6sm8339783wrw.36.2020.01.30.14.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 14:10:12 -0800 (PST)
Date:   Thu, 30 Jan 2020 23:10:11 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Haochen Tong <i@hexchain.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCH 1/2] dell-smm-hwmon: add XPS 13 9360 to supported devices
 list
Message-ID: <20200130221011.kg3bwineutsdege7@pali>
References: <20200129150839.122689-1-i@hexchain.org>
 <20200129150839.122689-2-i@hexchain.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129150839.122689-2-i@hexchain.org>
User-Agent: NeoMutt/20180716
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wednesday 29 January 2020 16:08:38 Haochen Tong wrote:
> Tests have shown that this module works fine on XPS 13 9360: it can
> successfully detect and report fan status.
> 
> Signed-off-by: Haochen Tong <i@hexchain.org>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 17583bf8c2dc..d9f6394c08d6 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1104,6 +1104,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_config_data[DELL_XPS],
>  	},
> +	{
> +		.ident = "Dell XPS 13 9360",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),

Hello! In patch 2/2 you are using DMI_EXACT_MATCH. I think it does not
make sense to use substring match in one case and exact match in another
case for one specific machine. I would suggest to use one type of match
for both cases.

> +		},
> +	},
>  	{
>  		.ident = "Dell XPS 15 9560",
>  		.matches = {

-- 
Pali Rohár
pali.rohar@gmail.com
