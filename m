Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA31FEB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jul 2023 18:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjGESuI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jul 2023 14:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjGESuH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jul 2023 14:50:07 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABAF170B;
        Wed,  5 Jul 2023 11:50:06 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6687446eaccso5269969b3a.3;
        Wed, 05 Jul 2023 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688583006; x=1691175006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OY7dqMRwXdGa3P/Q2Gj116UIajkax3SZ5ZcmILC+jLc=;
        b=WQYuHOGRCLtiC0gI7B0hjM+nabR8LYkXXnQfVs5HVz1nfTjydNj8qhoZsZc7Iy3tw9
         QZUY8eFlpx5T4b+8BqHrHAFFodOdBhC76uVy+XvUZu0Cbk3PMRAsEfipDHMLD0+mJMoW
         BP5YqiYfbLIva3nuagIgELp98CWQketla/05taONqNk1K/79g/DFPAzL7vR0n6ZqnIBA
         y40iQ+oMWX7kxCWhI1RQ57rHBTiSMW9pYh+R7tFQH5yIO7zIB5A5One0y2cXaxu3VQiZ
         1NiF+ZC9HOTFvY8x1XAOCH/eg/xPJ/8od2zv+ta9kgEiWaaw8FwPKDkXjPVE6NFj8PJ9
         /0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583006; x=1691175006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY7dqMRwXdGa3P/Q2Gj116UIajkax3SZ5ZcmILC+jLc=;
        b=dW0uau8zr+3ya95ajwSJZ7l5UT2jMH4bCqYsMU/HHa72YR/EpfPR1+1cvTgIHHL8rF
         m7+Vn9Zp6yN5EUGL85Vl9iylhLfl2TPCLTf5MKjkC7ckkcYlQKn/gFvwbCMNo/vuWpow
         x2ou4wDROuT84PiAGW60B1n05QM4rzskxtD7J2z4BL1ja047K7wbECdpyhd5QFtKZUrN
         xvx9yrB40cXMvroAxDEs9sBlHnb2cxyuLbsG3vCamQvyAbxe3AeDH2UAzzNuoIXQHWc4
         Kr7f/LFnxnZucAzmAbsQMkmkGjt5GtJ5wkA1zON2FbAsos916BAnfrhxUmsIl4DDz5vW
         nzRA==
X-Gm-Message-State: ABy/qLbTHlvVjg5d9Boo1aZaLRSsmjl7O+JZJChDV8QbuXtP0gqOUmwN
        8Fu4RAPPxOJefoxHftn5sFJoJ2VTCQE=
X-Google-Smtp-Source: APBJJlEa+PfHCbk69zikJtdudeewwB1/L0TYJDqsROOdS5zt+ZmrOhsiFiy7qKHou7u2s8Nxohc9jQ==
X-Received: by 2002:a05:6a00:1704:b0:682:2fea:39f0 with SMTP id h4-20020a056a00170400b006822fea39f0mr21610659pfc.5.1688583005781;
        Wed, 05 Jul 2023 11:50:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9fac:a99f:7f0a:397])
        by smtp.gmail.com with ESMTPSA id x16-20020a056a00271000b0067459e92801sm16163933pfv.64.2023.07.05.11.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 11:50:05 -0700 (PDT)
Date:   Wed, 5 Jul 2023 11:50:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        samsagax@gmail.com, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 3/3] driver core: remove devm_device_add_groups()
Message-ID: <ZKW7WuP0T9QdCR+G@google.com>
References: <20230704131715.44454-5-gregkh@linuxfoundation.org>
 <20230704131715.44454-8-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704131715.44454-8-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 04, 2023 at 02:17:19PM +0100, Greg Kroah-Hartman wrote:
> There is no more in-kernel users of this function, and no driver should
> ever be using it, so remove it from the kernel.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
