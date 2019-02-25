Return-Path: <SRS0=SUeP=RA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9336C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 14:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A9E920842
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551104906;
	bh=patOsKUnXRSIZgJveP27C8p7e+xWBIOBKWqTUwjR3D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kNn30Ln9KkSuXF0pL60hEUcZeDczcecq403frg5nxyM1JjxKoUVTMtTS5APWystbM
	 REXTRnDkKMAGyieYpFznIX7F77rRuj2bcnLD5Da8Jti+F+He1T34zku3/QlqCmJWd4
	 EHs2mZnwpGprs7Ju9Nvv0ZgRzCiSas6oDU4Nt14g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbfBYO20 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Feb 2019 09:28:26 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33013 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfBYO20 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Feb 2019 09:28:26 -0500
Received: by mail-ot1-f66.google.com with SMTP id q24so7998718otk.0;
        Mon, 25 Feb 2019 06:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EllrbFQ7vE+1ITepsmd1uD9S5thtIVCRiGZMwLKLjM8=;
        b=B60FJlJ13Pvxm4suco1JNltsu4VMKH1vaRjHvlQZOp3dn4vs06Jvx/iCSp9TcZVoCS
         SvXunnTuGxGLXQBL/bTnl4KDLLP+l6pje5Oec7CuJK2XTYSVFgQuCA9G4lPgUbEgwWco
         sr5zOLX5xjbXoOh7kzp+qy2h6WqmJHzCmAGoxetMPjkp9gkvbEXjesqHHp97PbzXfJQo
         kuUSGkY4Chl+Ic0X1TKhUccBtZrV6sQsQitUbV5q5PsaJt1EhcGyz5fNdc/MCaSz+u5x
         MnNTlJNx2ZWlS8qNBflkKZ5gPSdEk8MoqWcEGiTxz5ZFhbEOLBNeA9Jb8B9iKqDPPsbB
         3oYw==
X-Gm-Message-State: AHQUAuY7Awj5qOuaO8Q6KVGVmzwNxX+y/O8Xfn1ujX+NJuX8CtB2OCJH
        K+84hJZUa6BwFnCxU3U07e9taUU=
X-Google-Smtp-Source: AHgI3IbgceGxazPglnNe08kFQ5M5tGwQepvMCd7eB5oaRs9sUqkrWItOxLw9LXMvrCvyq/roW+R8Zg==
X-Received: by 2002:a9d:6355:: with SMTP id y21mr6550802otk.6.1551104905391;
        Mon, 25 Feb 2019 06:28:25 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q1sm4071758oth.42.2019.02.25.06.28.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Feb 2019 06:28:24 -0800 (PST)
Date:   Mon, 25 Feb 2019 08:28:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (ad741x) Add DT bindings for Analog Devices
 AD741x
Message-ID: <20190225142824.GA29617@bogus>
References: <20190128210637.22323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128210637.22323-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 28 Jan 2019 22:06:36 +0100, Linus Walleij wrote:
> This adds device tree bindings for Analog Devices AD741x
> as found in Gateway routers.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/hwmon/ad741x.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
