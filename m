Return-Path: <SRS0=ZzD2=R7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E952C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 15:19:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFD5620823
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553786352;
	bh=0aQHF0Nztcww9w4LapAErMji/2ks10Qbw+bdxgWcjD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LRiQGOjVH0v0CqpRGa+/DofK2lHT0DEusaKaTG8ysiNPSn4stEHl7tlq4rJG+s9yI
	 yd5Ij9sy/ziyq8/37ga3ZDgjmYeIpd8P/Q4ojK79e+ngWTEiNQZG90Tr4K6i4uwdBB
	 Ch+ujphZ1S2GVkvXuoqn5kSqXPesNHgBOSREPERw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfC1PTL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:19:11 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34199 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfC1PTL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Mar 2019 11:19:11 -0400
Received: by mail-oi1-f193.google.com with SMTP id v10so11711524oib.1;
        Thu, 28 Mar 2019 08:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tMD3VGQlfAZQ2xlsaw+KRG20bnMH6/YDaYb02mpc7ZI=;
        b=Rw2g3MzWcoSb28x4GeX+2ggwnsPIA4wQFO54L04Tw+uMdv8/trPJFMNGOH0cNRmmZz
         We7ZTMjY2DmA2urcyUEvdjRsknSf27YOayC7u9r/bjgg4tNzlAqbAMIdYY6XMYgk8lyG
         /LgIAubEPVwy88G3v3yl8LWDNX1xEfx5SKIXb7TJxAllrsTPs8uJC+iXfKT3VAbwVscu
         6f9DoHmV/yB4rGPcX2LTzFRZezg5C6VTC42k2kOnYjjQpxp6a2kIX0fij4vSfQ0xBJQp
         HnnGZ2r8ay3PK37g9yvfS2otj3A4E2bagAR7LPh47F68ovxpSM4B4j8zT0Lsrt9mHSn3
         jwGw==
X-Gm-Message-State: APjAAAVDZq6XufcqKpI4v8IN/POdGjiG4aa0Qd7JGPW3L1HlxogMArDO
        ZswT+9RtMTlCiXemBUT/sQ==
X-Google-Smtp-Source: APXvYqy6GgHq6dKYiu31FMIlZrF0Je2iJEjIdcUhFS6kBfukNY4HBqFmpietRbqcCqPiERLgyvFbfA==
X-Received: by 2002:aca:5c88:: with SMTP id q130mr341372oib.79.1553786350229;
        Thu, 28 Mar 2019 08:19:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n16sm1334897oic.7.2019.03.28.08.19.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 08:19:09 -0700 (PDT)
Date:   Thu, 28 Mar 2019 10:19:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Carlos Menin <menin@carlosaurelio.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: (adc128d818) Specify ti,mode
 property  size
Message-ID: <20190328151908.GA23332@bogus>
References: <20190313141125.GA26062@carlosaurelio.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313141125.GA26062@carlosaurelio.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 13 Mar 2019 11:11:26 -0300, Carlos Menin wrote:
> By default, cells in DT are 32-bit in size. The driver reads "ti,mode"
> using the function of_property_read_u8() which causes the value to be
> read incorrectly in little-endian architectures if the size is not
> specified.
> 
> Make it explicit in the binding documentation that this prorperty must
> be set as a 8-bit value.
> 
> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
> ---
>  Documentation/devicetree/bindings/hwmon/adc128d818.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
