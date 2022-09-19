Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F5EECAAD3
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 13:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiISNNI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 09:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiISNNH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 09:13:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89C818B07
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 06:13:06 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so6040041pjh.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=0SWMd1/dw8viGWJFir8vLYI252YhXo7+413gv8lkrKM=;
        b=jMG8Rgx8ILPtFbAjdCC4Oe0jdG8QNs3SVz0BOWN+HAc9kuR5OgpDh0ltIcULvcKhLu
         w4l9YzHCmEeKMToMayC2GPlTy2by5Lhq+5Rvj30ROI2IQV4tO0767bceYwZcV5Aq4WaZ
         Y4O8qSnweUBXAqrq1/CVjLfsjoHJJNstfTQ9sPJ5/cUMlQ1toH743LwszvLC4X/oLA3T
         2Mv+4flaRZYOgxQPetntXpf7kmTvLA9cRr2Zj/pANw0SGna44AwiXrmOAuptz1onbSJ5
         R6DNI3+DTFI7iZ8ZyE4Hb9brVJDZ1OfWvFCEowHFgHd5TeTkoTwC+VzhDQSvRPmpOO3J
         Dlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0SWMd1/dw8viGWJFir8vLYI252YhXo7+413gv8lkrKM=;
        b=zuC/o3YBvx+4QS8zwwFDr9SPvpZKwq0R/gJ5s96z0VFQCKwGIlkqmuio7AMIVvUbJR
         8Xlj49/58D8cTXcKcP/RZR/kd6dEbI2KeVbZXxWv00JqcWm/PgPvViNI+Bf4pKaY6RZd
         K9IoHJYbY6BLmUVd12aYuCruMckLEHDqxhMuUig3WJijk3lS5r4aTlQEEIbnt3rWAEVa
         KhDs5Lzd5KFZ3JGfiVX5MWZQR0qGy8oenEfZvqcMQLrUuqTq8bi5rn0dL0LlW4KjPZTO
         mqDJZlRrXpsBPJTXpBoiogvcaLRjHFXMaDVbYg+bbENoxR+iNu8kTcaScvPIUaOHEsLE
         Smvw==
X-Gm-Message-State: ACrzQf2K3U7X7f42GbTowaAfZVpb85wdUsPtX+OkxdS76sRlh3lz3rTV
        +EFt9dnBx5RlV4oavBaGoPY=
X-Google-Smtp-Source: AMsMyM5KLPsJwaIa/7tRyTleFbZdQl88/wKqOzR2JZQawM2ZKcrErncGQOcA/vlHqwiyYs+Qzw5CDw==
X-Received: by 2002:a17:902:e550:b0:177:f115:1646 with SMTP id n16-20020a170902e55000b00177f1151646mr13183688plf.112.1663593186365;
        Mon, 19 Sep 2022 06:13:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902784200b001754cfb5e21sm20625912pln.96.2022.09.19.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 06:13:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Sep 2022 06:13:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho): Add dependency on ARCH_ASPEED
Message-ID: <20220919131305.GA3545921@roeck-us.net>
References: <20220916120936.372591-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916120936.372591-1-pbrobinson@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 16, 2022 at 01:09:36PM +0100, Peter Robinson wrote:
> The SENSORS_ASPEED is part of the Aspeed silicon so it makes
> sense to depend on ARCH_ASPEED and for compile testing.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied.

Thanks,
Guenter
