Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EB5C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 18:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239019AbiEXSQJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 14:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240121AbiEXSQI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 14:16:08 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1A1393FE;
        Tue, 24 May 2022 11:16:06 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-f189b07f57so23295720fac.1;
        Tue, 24 May 2022 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V8RTAO4MHqfT9521jG72P0PcRHkLapBKeamANRvSCd8=;
        b=LrQSJDNKvzRl6UcHjs+CXvUsjrWbVx7ZFQsi6uN1Nd1UXF4+1uVnsqJ+6vYHW4lzx4
         bV+pWyIRsocW85gpHYuA6qzieqs8OI5lTQ3kr1pdlsnkGhpDSe1okFtsu+E2XlzDDzs3
         /pqtwbLVxgMkWyl3uhjAiut3KmnFw+3PRiZ+BxUJUSh+x0m5MNFPHmMvPqCeIW+elHgy
         SXQgj0x+vsOLy2ooHyfztOVwJfgf4YmfSV73UBL5DqP3HdC/bVqk7cTQqPpkpMBosux8
         HPllHJ7M0dt47Xyi0NdYApN0kh++0AqKi2Rz2DCdcQ+hVmMJaOhz7MXS0HAZxFkRNMtg
         keEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=V8RTAO4MHqfT9521jG72P0PcRHkLapBKeamANRvSCd8=;
        b=1A2RTNtb3iiUyVBTctObo7r46xfzsqkuMIVFXUJXX7OZACZIcO83bZFmBYe0sa9QV1
         GKbaLpI7Xq5JvBmRfek7tV5VT+PCz8qrrrypXT5RDU681k+AbhYNSlrfCnUraLzoL63s
         v0IUjPCuXIJ03uovcB5Bmn8GJ/8+l10oeKylfwcef/yI1KNG/RqO9bE3Ude9c+hCkuTH
         dIkRM0EeuJZ6Eily37ep+1Ng/y+wmyDiBcySaL2bx5CWpZpGa8BALvkv9u7XrfXDUsgZ
         6PruDQl7AXbacczclDOH1x5jYS6B0aKCUq78SFVuDT57o8rrWEWvy3KpXZoKXG6m6QAR
         XYug==
X-Gm-Message-State: AOAM530u+X2QwmQNTnebe8KIEpk+SPD2jvnmHMWhZRKd1Nm/ny7CkCma
        bddgQo+966uAYWFgCziMc1g=
X-Google-Smtp-Source: ABdhPJwmcpzV7fgABACcWZmKf1+Tmh3ViQVvty+81JL9Ndf4c7y+uG5t9ku3Sou5hceWmbRVrsxa4w==
X-Received: by 2002:a05:6870:9586:b0:f1:d7f9:f0da with SMTP id k6-20020a056870958600b000f1d7f9f0damr3092535oao.259.1653416166046;
        Tue, 24 May 2022 11:16:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r16-20020a9d7cd0000000b006069a0f13dcsm5231210otn.36.2022.05.24.11.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 11:16:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 May 2022 11:16:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michael Shych <michaelsh@nvidia.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: Re: [PATCH v1 1/3] hwmon: (emc2305) add support for EMC2301/2/3/5
 RPM-based PWM Fan Speed Controller.
Message-ID: <20220524181603.GA3984141@roeck-us.net>
References: <20220430114905.53448-1-michaelsh@nvidia.com>
 <20220430114905.53448-2-michaelsh@nvidia.com>
 <20220430125721.GA1888736@roeck-us.net>
 <DM6PR12MB4074A364BA0FD76A12BF054FD4D79@DM6PR12MB4074.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR12MB4074A364BA0FD76A12BF054FD4D79@DM6PR12MB4074.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 24, 2022 at 04:17:01PM +0000, Michael Shych wrote:
> 
> > > +static umode_t
> > > +emc2305_is_visible(const void *data, enum hwmon_sensor_types type,
> > > +u32 attr, int channel) {
> > > +	int max_channel = emc2305_get_max_channel((struct emc2305_data
> > > +*)data);
> > 
> > Unnecessary typecast.
> It's required as otherwise there is compilation warning.
> 

Arguable. The critical part is the change from a const pointer
to a non-const pointer, which is in general not a good idea.
It doesn't matter here, but it would be better to declare
the parameter of emc2305_get_max_channel to be a const *.

Guenter
