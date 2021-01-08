Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62025C433DB
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Jan 2021 15:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 201AB239A1
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Jan 2021 15:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbhAHPgW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Jan 2021 10:36:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbhAHPgW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Jan 2021 10:36:22 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F2DC061381
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Jan 2021 07:35:42 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id x13so11730585oic.5
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Jan 2021 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E4hL7hWcJ0igfc+aprwTRBAGfuL3tVmM1sjATNEeJmI=;
        b=n7ivfy5hnhGlJvSeEfjANiE7+AkBwa7ioS+TB06FeVrOlM9DwA8eDFXypB03vli0rN
         mggURhyf9hRt5mVb7qfhRCIr3EdKpRPUrfVQWJsnCV7H+ZSMNE9u1C9b5AhON59g4MpQ
         lZ0H5+GIfomikcf2SalIo0qSZyIJte7rRI9ovHKiHUi/9sUmfb/6WaZMBY08YeGn24sG
         Wp+qqC/fNyqT5cmOzYd6P59ydaMjw7Vza4k3rUvb+QgTugAthdw9djr1yik/r5/h2dXK
         SsOGTtaTgk3oPV02go+gzCsOXu0uXl3sy9nRQ82HAa1OnDLQtZqlkgNiM5CdvW+nyW5J
         6IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=E4hL7hWcJ0igfc+aprwTRBAGfuL3tVmM1sjATNEeJmI=;
        b=ZS0aPqmFI1WliQ/3Z7T0fm+IC4/lmDBBOe/n8PiIwXV0FItGcUAss91L/dq2MSGDp4
         vTgYjxRd1K/iBcVf9U5x/HmzNWz6e4wvNZmSRzA7qVOdLQ84D1EtbFVUIqwr8B/0+6Qx
         d3L5aC+naq01xz4NC5ivJCVqTAv3o9FSxyaFk1QCYC5o3FwtMYP1Fx9xy3flQWXBPwSe
         RjdP7ghZ8SXlLU2e/35QJIUpYh6WPxpzFGB42gPJZGtcPLooL1Y1EAgBgaemzJKzE3ek
         lvXUzeYqkCt3p4Sxzq4WECjP+siT1lSVe/AWFKb50B5XOlFzU2A2P8TYxWRiV4wdQRd6
         UByQ==
X-Gm-Message-State: AOAM533ECk75+0Un/0tqHkg554Ld5//fB4vZhk48bHL+0uvIlDpMvNJV
        vhboqetZYdqjXp+VZZNbtMY=
X-Google-Smtp-Source: ABdhPJzpE80NZSOUeH07BSFeQYPeOpmC10QBlc8FwQrGc+bk5gEFTSavaasmTfYyfnvomlRbO7kZ4Q==
X-Received: by 2002:aca:bf54:: with SMTP id p81mr2727456oif.86.1610120141871;
        Fri, 08 Jan 2021 07:35:41 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l134sm2014219oig.25.2021.01.08.07.35.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 07:35:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Jan 2021 07:35:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jdelvare@suse.com, joel@jms.id.au, andrew@aj.id.au,
        p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho): Switch to using the new API
 kobj_to_dev()
Message-ID: <20210108153540.GA4766@roeck-us.net>
References: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 04, 2021 at 10:05:45AM +0800, Tian Tao wrote:
> fixed the following coccicheck:
> drivers/hwmon/aspeed-pwm-tacho.c:634:60-61: WARNING opportunity for
> kobj_to_dev()
> drivers/hwmon/aspeed-pwm-tacho.c:623:60-61: WARNING opportunity for
> kobj_to_dev()
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Acked-by: Joel Stanley <joel@jms.id.au>

Applied.

Thanks,
Guenter
