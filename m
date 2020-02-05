Return-Path: <SRS0=vXYV=3Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB065C35247
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Feb 2020 16:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2516217BA
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Feb 2020 16:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ21f8Bd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgBEQD2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Feb 2020 11:03:28 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33076 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgBEQD2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Feb 2020 11:03:28 -0500
Received: by mail-pl1-f195.google.com with SMTP id ay11so1061500plb.0;
        Wed, 05 Feb 2020 08:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lwzRWT19O/6EWZAZN5+8cbnobKlxcqATu6y9++oUh3Q=;
        b=mZ21f8BdL0BQdFgronFUSHE+D69XR2X9dDAJK8mC8QNqoQt0rPxt4ei4rO/nqm02D9
         eThp9s/LhRc9mV7lyf5nX2AdzbXfGlmmkBAwrwGlCfX0dDK1GMtppyvhoWDfLb9S7QyG
         Fzkfq2IlwxA0x/ZNDCt1favYjO3bTfi+Sg0pRWu4t0XFATD590ID/f9qIWgZzalihySU
         XeLws0X+T8mvh8gbHLd6aYJ4ghgVZnLzVjPJwX32ZT5+HRKhWk9xtINDx++aJG1eoo4i
         w6qZMFPa5j8L3kIEw0DKKtjs8K0gQKso16S70vc6rF7C6FxSpFNlS96eE8kCDxDjFcij
         9yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=lwzRWT19O/6EWZAZN5+8cbnobKlxcqATu6y9++oUh3Q=;
        b=H5TeD4Eb2x+7q7FehwM6Jt9VGMI2ituxcuBa/mj+y6xEBWIA6DBp3UFQQg1Lqj1FMn
         WTFLhyURIFnPn3vFWyqERZ5pm0exunku8Fs8UgByn0NshMPE9HJoN6b+71KL14gN9a+i
         FSqiEw0VBaGEJPF1Jpnsmyxmjr308w8duXI0JGNYgdwDKo3sfJonALFaLABN9GVE5Hbt
         wjcotcM97z801KFt4hx/I7jSrMzJm2ZosBeYmwNi5J0wKMnb0u+kc1D6X+E7uQ+LM8Mu
         IM/XQPM45L5uaVib2vWE0s/Sc13Xlplfbg74y6tW7LPgNqIpzUlaUDTBc3Eiq81mB7LY
         czzw==
X-Gm-Message-State: APjAAAWIVwjuGpkifhev03toB94gtJ1pp69EoUXrWCZ3vPYUoUsrc5p4
        /lDnUGlHAStEae7tgpyyI8kiUFKZ
X-Google-Smtp-Source: APXvYqy0GhETUHo5gQlEDqgf1vkCNJh5ZVE8HnS6M13YjSsa49Jf3cQEwmBEUia4nBeysNENYo/9Tg==
X-Received: by 2002:a17:902:ff11:: with SMTP id f17mr34529835plj.273.1580918607351;
        Wed, 05 Feb 2020 08:03:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k1sm30009595pfg.66.2020.02.05.08.03.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 08:03:26 -0800 (PST)
Date:   Wed, 5 Feb 2020 08:03:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] hwmon: Support ADI Fan Control IP
Message-ID: <20200205160325.GA25403@roeck-us.net>
References: <20191009102806.262241-1-nuno.sa@analog.com>
 <20191020161231.GA27783@roeck-us.net>
 <7755456dfbaf6ae0a45baf7b1a3ed7eb9a817d4a.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7755456dfbaf6ae0a45baf7b1a3ed7eb9a817d4a.camel@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Feb 05, 2020 at 08:11:49AM +0000, Sa, Nuno wrote:
> Hi Guenter,
> 
> On Sun, 2019-10-20 at 09:12 -0700, Guenter Roeck wrote:
> > [External]
> > 
> > On Wed, Oct 09, 2019 at 12:28:05PM +0200, Nuno Sá wrote:
> > > The purpose of this IP Core is to control the fan used for the
> > > cooling of a
> > > Xilinx Zynq Ultrascale+ MPSoC without the need of any external
> > > temperature
> > > sensors. To achieve this, the IP core uses the PL SYSMONE4
> > > primitive to
> > > obtain the PL temperature and, based on those readings, it then
> > > outputs
> > > a PWM signal to control the fan rotation accordingly.
> > > 
> > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > 
> > Applied to hwmon-next.
> 
> Did you somehow decided not to merge this driver or did you forget
> about it? I was trying to find it mainline to sync our trees with the
> reviewed version and I could not see it there...
> 
Hmm. I have no idea what happened. I marked it as accepted,
and as mentioned above claimed that I added it to hwmon-next,
but it isn't there. Weird. Maybe I was waiting for a new version
after Rob's feedback for the bindings, but if so I should have
communicated that. My apologies. I queued it up for the next kernel
release, with the bindings change as requested by Rob
(adi,pulses-per-revolution -> pulses-per-revolution). It will show
up in hwmon-next (and linux-next) after the commit window closes.

Guenter
