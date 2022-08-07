Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F28FC19F2A
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 Aug 2022 06:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiHGGFh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 Aug 2022 02:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbiHGGFg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 Aug 2022 02:05:36 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B20460F5
        for <linux-hwmon@vger.kernel.org>; Sat,  6 Aug 2022 23:05:35 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id p125so2097116pfp.2
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Aug 2022 23:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc;
        bh=/ZL6MuGSZ0fbyhZczXSChEhRBJbhpcc1DJVt1TcXOm8=;
        b=Qr/O+7zZYUZbgQNfaz96veuhwlbUrTIpwKXmQUW3IG1kJq9vCIaj011+cYvdkOidqs
         bhda3jVAy449gvIZCnuxYRPzmyvFYhx9C6i/OTdUdSteDalkoaI3VPTA7Abr8drAvhU2
         o6RSEMRoueeK3S9WvmCIRCIk6F8wpxAOfTZAiyiasz808jCn7ps6XSPba489tGPc94ca
         WsU/dg+N7+/Q1df0rYeMFd5+h9SgOSKxdtQHuOfY6g1Obj2UTh6z8jw95UumZ8CFgkXO
         +f9PPD/eUcf43G0jV52bKdIGU5pCVoT2yL0l1ebGKChnPUUzNnZ3PTPaDBPKR6wfff7/
         w2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc;
        bh=/ZL6MuGSZ0fbyhZczXSChEhRBJbhpcc1DJVt1TcXOm8=;
        b=rbBxuJMdqD9GrF6FnFK41kFqmnRhqlJLLzI7QEbE0lIrRZjhhLHZ3JwdMBW02O4Mhr
         JpftDxVnfCzBo70u2ZRpblfu1MUMwdy/KGcuoztDlnJ4xyWBH1ZpsKDTO0m4mETh6DJV
         ywvEjfe+ozNspKlMFaVszk2IeVUlGkLLu/KSwqPxEQxIjWIfg769n4bnIvvoadUHCAfv
         4Dq7TfqNEAjwt6nBtet6EMsZldW8hG9kwNR8KjuA2HOq3xNKSOV27vU5al0jdJJS5ZJA
         5u0w3xEMM1G03lFdmipcG5kTxO8G+CsV9Tq6fv505IP1WRrPoAv077btQTji8E57wnW/
         XHug==
X-Gm-Message-State: ACgBeo30A579mCdTkeJ2I87gNoOrTedfDfvBbfGj19lw2N1jxsqn8+JQ
        ui+SC5b3tk0S0rYZKKm3Hf0=
X-Google-Smtp-Source: AA6agR6Q3u5B8WNIU/tO6WbYtJH27XYXP9n5SLKIBmTeBi2uAKOZNYkppANEL7KErWG25fB9+QdUEw==
X-Received: by 2002:a05:6a00:2cb:b0:52d:64bc:9a2a with SMTP id b11-20020a056a0002cb00b0052d64bc9a2amr13556259pft.38.1659852333474;
        Sat, 06 Aug 2022 23:05:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b0016c78f9f024sm6158583plg.104.2022.08.06.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 23:05:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 6 Aug 2022 23:05:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tokunori Ikegami <ikegami.t@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] nvme: hwmon: Add support for throttling temperature
 feature
Message-ID: <20220807060530.GA4018377@roeck-us.net>
References: <20220806054606.7280-1-ikegami.t@gmail.com>
 <20220806083113.GA3986075@roeck-us.net>
 <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Aug 06, 2022 at 08:58:49PM +0900, Tokunori Ikegami wrote:
> Note: Sorry let me resend the mail below as text format since it was not
> delivered to the mailing lists as contained HTML subpart.
> 
> Hi,
> 
> Thanks for your comments.
> 
> On 2022/08/06 17:31, Guenter Roeck wrote:
> > On Sat, Aug 06, 2022 at 02:46:06PM +0900, Tokunori Ikegami wrote:
> > > NVMe drives support host controlled thermal management feature as optional.
> > > The thermal management temperature are different from the temperature threshold.
> > > So add functionality to set the throttling temperature values.
> > > 
> > > Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> 
> I think actually the suggested attributes are not met with the throttling
> temperatures as below.
> 
>   temp[1-*]_emergency: Temperature emergency max value, for chips supporting
> more than two upper temperature limits.
>   temp[1-*]_lcrit: Temperature critical min value, typically lower than
> corresponding temp_min values.
> 
>   Thermal Management Temperature 1 (TMT1): This field specifies the
> temperature, in Kelvins, when the controller begins to transition to lower
> power active power states or performs vendor specific thermal management
> actions while minimizing the impact on performance (e.g., light throttling)
> in order to attempt to reduce the Composite Temperature.
>   Thermal Management Temperature 2 (TMT2): This field specifies the
> temperature, in Kelvins, when the controller begins to transition to lower
> power active power states or perform vendor specific thermal management
> actions regardless of the impact on performance (e.g., heavy throttling) in
> order to attempt to reduce the Composite Temperature.
> 
That happens a lot. That is neither a reason nor an argument to introducing
new attributes to match chip descriptions. If we would do that, we would end
up with lots and lots of different and unmanageable attributes.

Please note that the functionality is associated with thermal management,
so you might want to discuss your attributes with the thermal subsystem
maintainers.

Guenter
