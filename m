Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC49C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Feb 2022 15:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiBMP3D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Feb 2022 10:29:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiBMP3C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Feb 2022 10:29:02 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3CD5F8C2
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Feb 2022 07:28:56 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id x4so4689436oic.9
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Feb 2022 07:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=asyFQgHRNYGS7aLqOvLWDB6Skz85LjFIoQwIUaEw7e0=;
        b=puzsaG8mrPd17Kqpuavsj3zE6yiF+LH9OsO6b2AmloGefTjj+z8NIMC1C5DvTIWh0m
         4k3Cx7VlZRBZcqbCJcRbm4PE0DJthDm8NAeHZx/lV55sx70lBqhMQaKUSXTLLHXY6KOH
         YHBp4VgefWpmrlvb1gsrxQQD0y7QPQrm7b/OzqYXNmDJftNImk/+CXUevX7VsJHpkMtO
         18dgCW4PKD1ADtF549RywHZSWa1kMZoczSYDfdun2j1sR2dpaOOWUxNnoVGS40CuPvg7
         A2FEW2lrOufXnink2p++rwv7ITgv7zbItLYIllC8C0X1wp2Rad614ltLQnPTDr+DA2sV
         a4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=asyFQgHRNYGS7aLqOvLWDB6Skz85LjFIoQwIUaEw7e0=;
        b=a8VDBR74y8E6VozkErpm6ZfyaqTrEitgB+jz5KAZCnDJjHHTerNxi7XnsZozUH3A5q
         IgMzlW4rnNzNdp2uhIFBJ5DHjxzphqCtBqM7G1yNlY8ugVhAU5D5LpJkNQYIwTgMLmIQ
         50AP67EsJawpKTgNc4bjZCv0gYifnW6aMGUHv1P6E+1tFQc10eSozKGsQOVeQAOwA2aG
         Vr/efA+NsjDfJg66aj4Zuhwes/X9k+29vmAhvrUcFU7zsATV9P+jIAX78AQrVHDMQ0RC
         c341OqiUO0hg3OeQN15se1G8BUe/MUhnq60n+B6BeSYDahmYL110uCIxk2q2JpRvTXNg
         xX/Q==
X-Gm-Message-State: AOAM531ZI2CM3QbvzX1P6bRLUV/Xbi5WY1n6M6BDXkhLT2TBcWOyXnfm
        ZIVUTXGaJFsWx0KgZelNumQ=
X-Google-Smtp-Source: ABdhPJxV20lSVd9y8Za+iiY2pZbVs7WTcx1+rSiKUHs4cjBwO9eqYdEcps0p3fEIKxenxixPIgLbAA==
X-Received: by 2002:a05:6808:23ca:: with SMTP id bq10mr3561710oib.281.1644766136152;
        Sun, 13 Feb 2022 07:28:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e16sm11585011otr.11.2022.02.13.07.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 07:28:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 13 Feb 2022 07:28:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v3] hwmon: (tc654) Add thermal_cooling device support
Message-ID: <20220213152854.GA4074109@roeck-us.net>
References: <20220213004733.2421193-1-chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213004733.2421193-1-chunkeey@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Feb 13, 2022 at 01:47:33AM +0100, Christian Lamparter wrote:
> Adds thermal_cooling device support to the tc654/tc655
> driver. This make it possible to integrate it into a
> device-tree supported thermal-zone node as a
> cooling device.
> 
> I have been using this patch as part of the Netgear WNDR4700
> Centria NAS Router support within OpenWrt since 2016.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
