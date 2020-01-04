Return-Path: <SRS0=aFHl=2Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD81AC3F68F
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jan 2020 01:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A4BB222C3
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Jan 2020 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578099790;
	bh=+XCGUnQ29N3hu5XPHx1L404e6WOg7wPmWK/ZjA1/ydA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AZhonER/v/10shuRjR686Oo0bNQAM2ZyR3mFrcHvB6uAVIqUE9RPxQRL8Pw+88rBP
	 pN9sc95GoARm1JwsAg4Gq2IZLmXOhQqCjfgtxV9gHfwjDXXLUu5ONb4ROFceSkK6yF
	 jfly4XxGxMutOPz8oYbJ/1FnEooOrD5jUZtxIBMA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgADBDJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Jan 2020 20:03:09 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:39917 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgADBDJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Jan 2020 20:03:09 -0500
Received: by mail-il1-f193.google.com with SMTP id x5so38045441ila.6
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Jan 2020 17:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x/iGc+RKtnsFuMU64/4qfZ200vWGywjrQ0igZLbD2L0=;
        b=qwsHHDzTE+QOBQ2TWgd/Q8RZ7zLzKQxgSMx04QQV0akNz5iRhPkBleVyMggBEsvqT9
         4FT7A3s7pYLJAGY5GeOTXzbg0X6EFoWtqh1Y/KhSNlTVU2B5rpHdTWQo2oAKPWEmyGLL
         n52VN12npFzS9AmoPd8NL0aZ/lOR8kZM86pzA7YrzqssQvUB8ryA5XU5lAFzRRlYdDr+
         2c/El6S0Ji7eP7dc1ScZGFeCBy/qFCbs5OmJxQhK/Wwy3qunpumLI2+/PuxyZ2f2hZEc
         49uBfmwAZroRSa49RSsuxSlLaG+fP3/GpBJ/6LqUYPBdmAGBSWAM58s2FvrhOVFr6MU7
         tlGQ==
X-Gm-Message-State: APjAAAVB9W1fGZMoBG/btgz5DSMyT8ubUm9dIPKruV0uPz174gavKNSL
        R+2qti99I4aU3jNE/yfaE+kjE4U=
X-Google-Smtp-Source: APXvYqw4h9aD2MR4pOo5tE2oU2eb4XSv3zSF5dozEh75w4a0EoEUlpCFVbfpvg16nvkZpcQmFIvLeg==
X-Received: by 2002:a92:b749:: with SMTP id c9mr75697574ilm.143.1578099788414;
        Fri, 03 Jan 2020 17:03:08 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id a18sm21296462ilf.43.2020.01.03.17.03.06
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 17:03:07 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 18:03:05 -0700
Date:   Fri, 3 Jan 2020 18:03:05 -0700
From:   Rob Herring <robh@kernel.org>
To:     Beniamin Bia <beniamin.bia@analog.com>
Cc:     linux-hwmon@vger.kernel.org, Michael.Hennerich@analog.com,
        linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux@roeck-us.net, mark.rutland@arm.com, lgirdwood@gmail.com,
        broonie@kernel.org, devicetree@vger.kernel.org,
        biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
Subject: Re: [PATCH v2 2/3] dt-binding: hwmon: Add documentation for ADM1177
Message-ID: <20200104010305.GA21152@bogus>
References: <20191219114127.21905-1-beniamin.bia@analog.com>
 <20191219114127.21905-2-beniamin.bia@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219114127.21905-2-beniamin.bia@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 19 Dec 2019 13:41:26 +0200, Beniamin Bia wrote:
> Documentation for ADM1177 was added.
> 
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
> ---
> Changes in v2:
> -adi,r-sense-micro-ohms: replaced by shunt-resistor-micro-ohms 
>  .../bindings/hwmon/adi,adm1177.yaml           | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
