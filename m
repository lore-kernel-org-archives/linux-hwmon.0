Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D266C07E9D
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Sep 2022 21:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbiIWVdn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 17:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiIWVdm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 17:33:42 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519F59E8BC
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 14:33:41 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id b5so1378611pgb.6
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 14:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=o11RzJt0XqRZEXLBy5+3PLGf6g2FOM08jU3QlHnhH00=;
        b=jGjChtTYPkgcvhGWhK/7gW9imwu8K1EoR+5asKOC8R8Ipep1cNplOXo+eJAyg8PnHM
         p6r7pOxy05Biy3esLrehM8rBtX0GROpsBWMQLI3dZ8rXF1GTDncwbsBbnbn+5oLhHyZq
         6Ng5U0VazH53Wnce2nctLfTOFYNCGRHdhJALkfhRvXUUYgZJDXdTJmOBc9fv3nMvkoAH
         15+aReocok3zN8veyUcz5DwrRsmAm07+f+Y1AcoKBiXHpQ2d2/ILhiSrvKCm5hS2CJDr
         57RkhTL+JYbAQa8PN1MXIe9nlAzLPENYygtsT6KyaYZhpfhgjgovdhyBg6Pt04PaP5PE
         Vsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o11RzJt0XqRZEXLBy5+3PLGf6g2FOM08jU3QlHnhH00=;
        b=qDQtYAVLhn0gawU8aRyMr++7LA7qFMWs+ftVP6Ecx01ppTgGRmjtZh+6q4/pmwpHfV
         0L3X3faNZjLhXgDQdFeJWaPhpXky5cHuT4RUxnBbSPlUYSG07t+wC/14HNlcrZ6/AOHq
         rF4XDjR4a5BmH3X6EbdXKS7Aypi01NRS6yBDEMO0071RT1tk7DGw7FnD7/rW2o4u61B2
         i7JjTblKirSHLWWBv5rOW9Ilcd6uPMyjQwOXZ8BY530UvhAd5znp3/3iPuP4imFWwQle
         3YRQYQB6/VIB++Ee98uA8dJRRlbfChbN3VQsUPzVx141fnphOMc0bZ+gfss1BLOzH5U+
         +ipA==
X-Gm-Message-State: ACrzQf2Ug2PoeNRjSkB65PddTLJArvjAc168je9NLuT9lfl0UiM7WM61
        9BTyJiAMDlIz4X6Pq0ibunxKHPAV+/QhkQ==
X-Google-Smtp-Source: AMsMyM4xDcXhVyyRqL5jKj6tjC4bLsxdWQWNv1vfJK0MJid1sKadz74QxydFpyN5sxXVqyIbGf7dcg==
X-Received: by 2002:a63:e306:0:b0:42c:414a:95e9 with SMTP id f6-20020a63e306000000b0042c414a95e9mr9680391pgh.139.1663968820847;
        Fri, 23 Sep 2022 14:33:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j13-20020a170903024d00b00179b9fb9fd8sm3494923plh.230.2022.09.23.14.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 14:33:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 23 Sep 2022 14:33:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, kernel@pengutronix.de,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: sis5595: Introduce a #define for the driver
 name and use it
Message-ID: <20220923213338.GA808829@roeck-us.net>
References: <20220922074900.2763331-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922074900.2763331-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 22, 2022 at 09:48:59AM +0200, Uwe Kleine-König wrote:
> Make use of the cpp symbol DRIVER_NAME to set the driver's name and use
> it instead of all explicit usages of the same string. Also make use of
> it instead of sis5595_driver.driver.name which breaks a cyclic dependency
> between sis5595_probe() and sis5595_driver that in the next commit allows
> to drop some forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
