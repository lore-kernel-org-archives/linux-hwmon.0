Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F96C54EE9
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Sep 2022 14:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiITO3K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Sep 2022 10:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiITO3I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 10:29:08 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2D5226
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:29:08 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id go6so3273312pjb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=sN+tnCLTaVXdrPWq24qn9jsX8VkFaGUEFyw1E5zWDqY=;
        b=T34+LzwkDVJvANJnkgGrcV4TfyhvgW9W+AhRog7PHjuB9iCgSpmcPnjGgUBhpNeieN
         zADypWo8uC58opj5NFXACxRW1CQcZPEyx4mPQlM6D1Jj5tYLaoUaB3M6gVR5pjmdkR9e
         30JNpYYQ9C3CTncNsNsZY9X+7QDPzk0Q268I2fUmVhW9wndhnhtTgQLK6sD8vZ4BEjkW
         QQoK8HlSxLm7C3OQaB2+UPy9OJ/fDAODI5KpSB/IPPCY4LuFb6Zgcq5C3vkCEwdLcsU0
         lz1vplBlNtf95hFe1C1YV3vWse5i3yKNaaRO/qKtpfxHuGLdQhaRfHmcXCwSLiUZ2FL5
         BvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sN+tnCLTaVXdrPWq24qn9jsX8VkFaGUEFyw1E5zWDqY=;
        b=ZcRyysbt2i/KKKLlZUu3UczlsPAB5QM1P9qSB88fzEkyn4ui6htBJ36VAILTYQAqaU
         5AJmAWdfxnj1yyHYAr6ayeqEF7OVUIBiOQNOiYEYl4bvYprZFiCZIq5FigXkhGt4b37l
         8jmOe/7YbS+6k5DU7tlTMOscGzL0x+j9Zclp8bSt1CsBKlzjE064XBFv98Tj+i9QYB9I
         MeGG3LTmsN7UGRdV1U9qj9mEYzDc2vMmsxwcsviZeKEKoBxp71JIJmlmzw1VCVhrN14P
         JLasOkvFMFrJaDP+nZv/sTBp2qC3m3Y1Moa47352Zy063jJlKZK0jWOZtBASaY7CIZsy
         KBkg==
X-Gm-Message-State: ACrzQf2cjFIzRJUktET4bZyYB+Mien4Uff4tfm3OLMRX3xZwR9IY2ejh
        XjX9HD4vwY4DyxFlVCmger8=
X-Google-Smtp-Source: AMsMyM747Jwg9Ei1568Vk+NF4vlY31jOouy4kczMRpmUmqSFe5FV0ZbQoTVkaYcZjHCO4H8yTodVyg==
X-Received: by 2002:a17:903:1c4:b0:176:e348:c386 with SMTP id e4-20020a17090301c400b00176e348c386mr25712plh.3.1663684147804;
        Tue, 20 Sep 2022 07:29:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090a0c4900b0020322204672sm95006pje.38.2022.09.20.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:29:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 20 Sep 2022 07:29:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Roger Lucas <vt8231@hiddenengine.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] hwmon: vt8231: Introduce a #define for the driver
 name and use it
Message-ID: <20220920142906.GA4025822@roeck-us.net>
References: <20220920135617.1046361-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920135617.1046361-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 20, 2022 at 03:56:16PM +0200, Uwe Kleine-König wrote:
> Make use of the cpp symbol DRIVER_NAME to set the driver's name and use
> it instead of all explicit usages of the same string. Also make use of
> it instead of vt8231_driver.driver.name which breaks a cyclic dependency
> between vt8231_probe() and vt8231_driver that in the next commit allows
> to drop some forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
