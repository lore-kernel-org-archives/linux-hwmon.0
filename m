Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA16C07E9A
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 11:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA44361374
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 11:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhGNLDj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jul 2021 07:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhGNLDi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jul 2021 07:03:38 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93039C06175F
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 04:00:47 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id s23so1863851oij.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 04:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IjP+VO9HlCryLY9YYTWKHnfSwx0XT8FG1QsYRajAPPo=;
        b=Yzc0vi1Az4QNbdiJDnXVTuMC4O680j8OYlTZc2rjd09J12n+8ggVBRkZBup4oEfCvg
         9CDjaLjrAbf9NjR4X1HbNLm3lGl9EeMvlwBoADa+E7+GOJchSFSFWTg6DlEyyV6KNah0
         pqTIXy6/gO61y0mIhYk7vJHLnAZXEvcFXpCMOKjyCgCrhUCTc4sDPAYxm6BrZkvjYfF3
         fDmEX37m0m1wN6cxCpqPiNpNR6FazBrG0PThyf1c2fhWRswNAkaaTnh045LlgTzzw+aR
         2qAu/MMrFqG8D/LjbSlEny304BkLTzh7B4SR08VqovPn2wb5on0bI63zgdCxkRBuPjtz
         eb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IjP+VO9HlCryLY9YYTWKHnfSwx0XT8FG1QsYRajAPPo=;
        b=Uj3Pq2FQCc04L0ybfmA58O7p/dVyP0lOT2aAI0ujryH6B7mDBuj8/1AlS/I1gcG82q
         tuuvrlC1QLJ0lG208J9OwpKr0bag7AOUXmvwt92IyNXyY1UoIlrJFwKXEnabr6kV4fo6
         YN5JDSxQfJPwnXdW0CglYxMPGH/H/V4kjMbNlA8Rx9HlB0KnwfxME5FPxtaFNe2L8vms
         22W/Ez/a+Sp1N74EuPJ3UZP6I+fzBzTEOtGsuBg+Dhe6i/UOMmb3oZcY1iPu6KWqGBPf
         IpmF/kqO9QFWnkNCwitcboVY50idmVEX+XZPM3MEcj7kUEuWYIMjnJmMqvo+TiVBqBRy
         YUXQ==
X-Gm-Message-State: AOAM533BJFgs2Z2AijNDEeHlnUN2xef+oHA8PqMXBZAFYJ3l6BvPNHOP
        8LQ5kEuj1k/j3PDewGh9ldsX8tNTxi0=
X-Google-Smtp-Source: ABdhPJxebnF7tXqJsidmGJmYrMSkjhBWRUGCKztskDz8Me7STto2AwCklgVlWDOnKeDklgW7dqs8Tg==
X-Received: by 2002:aca:1111:: with SMTP id 17mr781583oir.53.1626260446725;
        Wed, 14 Jul 2021 04:00:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 2sm415272ota.58.2021.07.14.04.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 04:00:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage reading NCT6796D
To:     Henk <henk.vergonet@gmail.com>, linux-hwmon@vger.kernel.org
References: <202107080039.1680d7Eo018443@systol.god.lan>
 <CAMFK4TPNYJeEJdfu5Wti7G34m+-tcZvA2wv0N87aPsGq2eygvw@mail.gmail.com>
 <CAMFK4TM0MCEGWs=zCJZLsdnUJKqvM+-0fxZTDhJd864SAG8=ng@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <545ad722-d2de-21bb-21c5-7104097c76c4@roeck-us.net>
Date:   Wed, 14 Jul 2021 04:00:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMFK4TM0MCEGWs=zCJZLsdnUJKqvM+-0fxZTDhJd864SAG8=ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/14/21 2:48 AM, Henk wrote:
> The nuvoton driver has quite some longstanding issues, as far as I can
> tell the alarm bits and input registers are not properly configured
> for a bunch of the chips.
> And this patch only addresses a tiny proportion of the issues.
> 
> It would be helpful to get some meaningful feedback.
> 
> Is there at least any interest in solving this issue?
> 

There is a lot of interest, but you'll have to do your part and send
patches in an acceptable form. So far you have not done that.

Guenter
