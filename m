Return-Path: <SRS0=8Yp8=3E=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BCBC33CB1
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jan 2020 16:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6542222C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Jan 2020 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579104352;
	bh=Dtcn/YnZDwg9WFLU5oqFR6vBCUquKYQu4iAKHdq2xsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hsnCpqmAmKNb5sZiXmLeSBXg42UgPocBF/IlH21pw4lE5Iyom3VGnGRYRwzweEdD7
	 JBq1o5PI8aPaDPHb3y7wXQPnLAmuyuR3lKu7+V1CpBKMmR25oE0mN/2LLHVu5uHlDK
	 lEc5E2DEt2b7aMboiYOXsewZ/Od70PBjb5AU+okQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgAOQFw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Jan 2020 11:05:52 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41552 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgAOQFw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Jan 2020 11:05:52 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so15845800oie.8
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jan 2020 08:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P3c88juq31x4Ss0d0V98lCGrkb22T0s+IsQbeNCxdqg=;
        b=LFkZ850MoNv8pxR5uBrkntlzzhL4Y4RbyTiobWQ54RdLai1ulMVdb2xZuXDUrttTyo
         k/d8ywzAdPWtDdlHOhBTXKjfsgKiRaBWapfuR8EexkYJbt/T6BfMrANCLmhUwQ/qOHJw
         IoIEZw7dSFomKFXTqsy20TA/f7FhfXFkEdYq4Fpecl8Sg35cX5pdY5PP82s/O55Fy67M
         ErwfyI7zs0suTx47I25EsOTo13cb3PBXucY08DH/RjcuIWWToPvkMS8OZbWHJrPD9yhz
         QQ2dxdYTEiQ+w2Y8Nk8fxXfHaOJsh9mdQYWScIg5E8THk6GTXax2xapWRGpx0/QWnwdA
         WtdA==
X-Gm-Message-State: APjAAAU/if06OlY2XVPf1WcqVjNjnXZeYRUPCxYKqKDgGx+PGsDbkwCV
        RK3p+gaa6qphWqx5Q06ijY1O4n0=
X-Google-Smtp-Source: APXvYqxtm3IQDshwAf+FTbnhxpkg3U4kKU0dFrWoBEdRqs334MGvoBi3VzDwB2sACePLvdJSH+bHvA==
X-Received: by 2002:aca:6545:: with SMTP id j5mr428997oiw.60.1579104351090;
        Wed, 15 Jan 2020 08:05:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j20sm6659507otp.24.2020.01.15.08.05.50
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 08:05:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 10:05:49 -0600
Date:   Wed, 15 Jan 2020 10:05:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH hwmon-next v1 5/6] dt-bindings: Add TI and Infineon VR
 Controllers as trivial devices
Message-ID: <20200115160549.GA19960@bogus>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-6-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-6-vadimp@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 13 Jan 2020 15:08:40 +0000, Vadim Pasternak wrote:
> Add Texas Instruments Dual channel DCAP+ multiphase controllers:
> TPS53679, TPS53688, and Infineon Multi-phase Digital VR controllers
> XDPE12284, XDPE12254 as trivial devices.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> RFC-v1:
>  Changes added by Vadim:
>  - Drop others than xdpe12284, xdpe12254 devices, since there is not
>    clear confirmation from Infineon regarding availability of the
>    others.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Applied, thanks.

Rob
