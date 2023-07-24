Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7880BC001DF
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jul 2023 14:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbjGXOGk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jul 2023 10:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjGXOGi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jul 2023 10:06:38 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C05E77
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jul 2023 07:06:36 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2632336f75fso2780367a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jul 2023 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690207596; x=1690812396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHH03pujRyc7JD6vKyZocMas7ZBnQXJMh/XHKEclmys=;
        b=YyqaUl0caMDFneaDK62qWa2zEQc2uicNjMGkHfJS1eS+Ra9Z507bwaXNsDD5diafU0
         9flSzzadMj/Mlxsbqh8Ni/afFc/Cif31pb60TONo+/h0V0iiR22clCLx0ywUupzLT7xH
         bbp/n8NYT8iicnOToTvbH9xJ9KzICY3IsdtHrlx+EPDckKgYsNjQfoymwLYl53dIeHeE
         yTCYd/OFa0ehGpcdjV+zeJ2YHn3fGDbFlftK4UVlO/AXRgawrolarXOW6Scbmg22VZm7
         wzYR41pPSKLEhitkN1y4L3QMCdK5qwCVY1uQEjmkfEDyMzMFsqn/HzXrgqv3PTIscE/C
         vmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207596; x=1690812396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHH03pujRyc7JD6vKyZocMas7ZBnQXJMh/XHKEclmys=;
        b=UHnQlgLPsmwLbColTEiLb0sop9L4inH9PZ+bK+WINBObr96gqjpRL3u8CqCvGlM72R
         IwFqEUjOY4+M7qJHkSDEMe8P4//XjMBIMRXoXjp/L3aVxPQ23cyreumPjlH8yxLGTnFF
         cAI4w703RA1SRb5tXu3YiyX95m66BUzT7oToQqeEdb86bcvZKt+tT+lIwo+aYxDk0vmU
         sUHArtUbZ4UKVsomsA+OV48jArebJ0c3Su7fYs80lGZKE+M3g4RwE7G+fp42UVzyCk5m
         wPqN35k0jWfoO1uJqL+mIf0E5riSc3mtearLp/Up8zQ75nOUKYKmFzUn2Jpk2jfHoCL8
         y/Zg==
X-Gm-Message-State: ABy/qLbUeJiPY136ZNoGZPWJu5kbNZkBl3UhPaSn/vgqcJrNxkJ/g0dw
        7J/X/P0/b2bKxbK0M6qepzQTcq/h2GY=
X-Google-Smtp-Source: APBJJlHBPYLtFqB/zDwYBSNQuRjspflJ+S11QWzT1Yaf4jHaB5uPIedSgrkkcRCgsxc5gPISRekvuA==
X-Received: by 2002:a17:90a:b283:b0:262:e3aa:fd73 with SMTP id c3-20020a17090ab28300b00262e3aafd73mr10866881pjr.17.1690207595975;
        Mon, 24 Jul 2023 07:06:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a21-20020a17090abe1500b0026801e06ac1sm2904347pjs.30.2023.07.24.07.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:06:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 24 Jul 2023 07:06:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed
 even if PECI1 disabled
Message-ID: <4beb5d71-fefb-4cd1-ae7c-986135100e68@roeck-us.net>
References: <DU0PR10MB62526435ADBC6A85243B90E08002A@DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR10MB62526435ADBC6A85243B90E08002A@DU0PR10MB6252.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 24, 2023 at 08:04:44AM +0000, Gilles Buloz wrote:
> Because of hex value 0x46 used instead of decimal 46, the temp6
> (PECI1) temperature is always declared visible and then displayed
> even if disabled in the chip
> 
> Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
> ---
> V2 :
> - Same patch resent with another mailer because context lines were
>   corrupted by extra spaces

I wondered where that was coming from. Thanks for figuring it out.
Applied.

On a side note, I still see

CHECK: From:/Signed-off-by: email comments mismatch:
    'From: Gilles Buloz <Gilles.Buloz@kontron.com>' != 'Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>'
                         ^      ^                                                    ^      ^

Thanks,
Guenter
