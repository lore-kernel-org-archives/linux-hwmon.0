Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89DEC07E9D
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 14:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiIXOhe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 10:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiIXOhd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 10:37:33 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF01B4E80
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:37:31 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y136so2709231pfb.3
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=jlxg6Qgxx2c+yhN+TFEqDPIMqxH1P8OS0brkQmMaJfY=;
        b=b4WE4sBDrBznlLQ8AuBS+xNmY5qi1+wzdVOk6nnKAs8711ozYxH4p1e39IH8aoQP9j
         4gm5b9eib1lDumb8Aala6hQLufmRGCYIFXn3pzDoxjT6t/QD+NyzAYwRAcSG++tk7+g+
         xuS8ACJcTCiTOIIbUEShiB/m8mNVVanDnQ7RoLsIVYpxxgQAE1bsctS6UsAnxlAYzT4p
         Ke5LEA6eVhvliVrPu7+EaLYD1yy54tYqdwr7yG8z5VOPoVxUhHjUis+fmbI3xKWxS4gM
         9QGm8EJ1i9vcOO0gU+lAjlexBYQ6q9f8RtssBOoV6uSrZ/ougpM3YZsTCnbf0n6T+/ov
         mJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jlxg6Qgxx2c+yhN+TFEqDPIMqxH1P8OS0brkQmMaJfY=;
        b=xF9v+SuKIIls6zfmUoEkWRFc/KDqEPjmwk+4aEDAkBrv+rQCl16URRRXXpsTSJ3JOv
         bO3QWb4VdceqIXwMJqV/1fXBwkgC5NAh7KTBDY0omtAEtG9QwmaA3m9UngoIH+S4QCRA
         Vul7651A7qUEARkVp5IYma3kNfvmevVU6YKulYdqQHD3YoiBH5e/E7H1rK91BDQkTOJS
         iIi468t85bLVubgChfEMsIPPTt4Up/VaXAV2MZGfKgMUICTI5ePKL/oqx5qnyle6Riy/
         4ueqIobmIAl8HPLgpAbD7EhO21jdeKksG7tXs5giWwVrmIKZ+3FoQ031/PXPe/et5xAd
         oZXg==
X-Gm-Message-State: ACrzQf0Xq43Y9poCSnzRxHLfFEGvDD5tWCgQH+3pMg/vIGGcVvDfeY3f
        0iQ2g7vEznur4GmDE0PXsDs=
X-Google-Smtp-Source: AMsMyM5R2aItqN+Rao6yOnjlUrtA751/pktszvW3y6mhtOqn/Z63zIoXkajU03vMy2Vccpe8F/E7Tg==
X-Received: by 2002:a65:6e0d:0:b0:42d:707c:94ee with SMTP id bd13-20020a656e0d000000b0042d707c94eemr12065176pgb.260.1664030251415;
        Sat, 24 Sep 2022 07:37:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b00178ac4e70dcsm7789618pla.185.2022.09.24.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 07:37:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 24 Sep 2022 07:37:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] hwmon: sis5595: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220924143729.GA2300272@roeck-us.net>
References: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
 <20220924135738.234051-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924135738.234051-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 24, 2022 at 03:57:38PM +0200, Uwe Kleine-König wrote:
> Declarations for static symbols are useless repetition unless there are
> cyclic dependencies.
> 
> Reorder the functions and variables to get rid of 4 forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, after fixing up subject (via686a, not sis5595).

Thanks,
Guenter
