Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F20C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 11:46:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06B8B61AE0
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Oct 2021 11:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbhJBLry (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Oct 2021 07:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhJBLry (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Oct 2021 07:47:54 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD3AC061570
        for <linux-hwmon@vger.kernel.org>; Sat,  2 Oct 2021 04:46:08 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so14905943ota.13
        for <linux-hwmon@vger.kernel.org>; Sat, 02 Oct 2021 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4s/DZFI848ly6eHUed3i3tWfaq8wYpkiltaAkxeIAEE=;
        b=mn8BaKuyfPCUS0Pbkm3UJ/cEiyyBbpVknOk4rTj/s8WdeO2zS/3Ay3knClv4eriPY9
         OJlM7ZokkBlO/eRhxM+sTnQqFN2zEXIv1DwGfo7hHwgEpZEL8bk1O6Zyf8M3syb72IWs
         GZsSAiAWSHpBtJnVZDaIbqbLoroCVkEBgH38I6xQSwIhnMVIJMW3psGYlVhmo+Wsrnim
         4FS2kwFv90YLB+fb1AmVG10sBhIrg79N3acMtEUWY6suSJOKeZABMkSc4nIYzCHIY2E/
         RJWDmZO2FoCp+nkyI+nkkWarFaacKKxnZcW9VhTfnlfFd9Dqf0kKdUzyc0aVsUldJ44h
         qp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4s/DZFI848ly6eHUed3i3tWfaq8wYpkiltaAkxeIAEE=;
        b=yCweiAsGKADJ9KP5yUS2/ooO2aADjXGX0N0C9kpwH9u4VWgmYADH2wZEzu97TIY0E3
         mlGHFoMiy7Ene9ia467YUe3Ym4hajuNXzK9UqfubFtBe4ZPgv5VXsCzRbNcKsHfPHbDi
         FuGGmkUKnZePj0WH5Ofo8Nk73RRzdj+zcOFMRZVm/JEfGCwSaFcyspHXtz6llzZ/TinR
         eEfCUq81CEi5MBZENfCpqfZt+k2M4wDX9t+7einYIDL/S+H3gkjjTHJCnyo54WqbI7JF
         knNS+lwqf1zwRzEtzExDpfzk7QTm9ukn5LoZrXvAlR501lbKE8nW4fcV8cbmUwxZn/Zp
         h+Mw==
X-Gm-Message-State: AOAM533tSdjWAhqbxBggHGstiPKxwSsAwIUODOwQ2fFLappU9T6O0gFX
        n7I36LI09m5GW38LXm2wHTRaXIaEVpw=
X-Google-Smtp-Source: ABdhPJxaWWiLUeU9kGsMjjJFCe7CNrW1727RwIRQG0IBsCqP09WBqcIFM5u1FrGA23pLL7MyYbyB3g==
X-Received: by 2002:a05:6830:2781:: with SMTP id x1mr2259804otu.349.1633175168002;
        Sat, 02 Oct 2021 04:46:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h91sm1682042otb.38.2021.10.02.04.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 04:46:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 04:46:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon 1/1] hwmon: (pmbus/mp2975) Add missed POUT
 attribute for page 1 mp2975 controller
Message-ID: <20211002114606.GA1279026@roeck-us.net>
References: <20210927070740.2149290-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927070740.2149290-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 27, 2021 at 10:07:40AM +0300, Vadim Pasternak wrote:
> Add missed attribute for reading POUT from page 1.
> It is supported by device, but has been missed in initial commit.
> 
> Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/mp2975.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
> index eb94bd5f4e2a..51986adfbf47 100644
> --- a/drivers/hwmon/pmbus/mp2975.c
> +++ b/drivers/hwmon/pmbus/mp2975.c
> @@ -54,7 +54,7 @@
>  
>  #define MP2975_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
>  				 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
> -				 PMBUS_PHASE_VIRTUAL)
> +				 PMBUS_HAVE_POUT | PMBUS_PHASE_VIRTUAL)
>  
>  struct mp2975_data {
>  	struct pmbus_driver_info info;
