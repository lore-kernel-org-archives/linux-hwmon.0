Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D85C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 18:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346760AbiFESFP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 14:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346745AbiFESFN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 14:05:13 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D465B625B;
        Sun,  5 Jun 2022 11:05:11 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id h187so3937371oif.4;
        Sun, 05 Jun 2022 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zj8G0SMPepe0P+kW3RaiAwiwz0PvI6ZflB4t+U0SmIQ=;
        b=WqPAk1YPoUxsR/AhvFyA1/m8nz0jrFK4oRRpyMnDkfth8ZYJ/oMA1iNweBw2drcgFb
         8XVkiAe5b02CmV8vY6ZKzE+kgizIUeJXNMJ9OI//3kmV5Nt7TtDqf3sawuTaO1n3a7g8
         3MjokDb3T5DwynRyyzMWVezEc+Ey1txxYX945CsN95uJa6sdRD3dVfWUUzjSHUqXjBqV
         U4JBHUhmX/kZilh4x/3Yj03Cac6ylf20RlZLD0/4XQdKOIX1M2eTRo13VnsCygFWvxqu
         eXEOHPq2e9/eX5CIBrNTKrIWFwcYXJsBG32uANuE/hewAvGRYEgpnJVW7pUsHdbV/xtP
         zjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=zj8G0SMPepe0P+kW3RaiAwiwz0PvI6ZflB4t+U0SmIQ=;
        b=b/HUZ0VA7hp4/eI7Bly9fWmlgt2rBtcbuglqqV3xh3iD4maS7DrRmbxc68TIgwOyzL
         Qhr9REtGsuMypBCbgoP8Cqp4EllaUyqzU3XMzhPb0gnO0KxL+g5TISE2NAA0ubNbtKzk
         8WqIIqMe+8ut0DoySneUIi3cvvT+TRUpPPcz9SfN/J9RiD8zw8wE8sEjPMEvpX0Sou4X
         bbfYZHF/TkKRV489uDbPnlPshpQ1+8rm1sGl32sTCRhbwgz3gJm0NzR/u6UBAmkNTmAF
         YxkIWDKXzI562yPz8uCGPUD4yT8W4A0qn6DZXARez8AitrK5VwPTDP2cX9JCVf0bfde5
         gpiw==
X-Gm-Message-State: AOAM533n/IbYVlfgiixJzK+rSZGoge0WuOFi03YNb0D/45I+t3W+qn/X
        tZMVrAmhNUaasppvU+jPHF8=
X-Google-Smtp-Source: ABdhPJxeBgi8j2A110YeThMtYoTbjVNrr2buka/2fkAG4CnkiaopQxgmcEqicmmcPE9MNTcgOglO4Q==
X-Received: by 2002:aca:d707:0:b0:32b:4fb:148 with SMTP id o7-20020acad707000000b0032b04fb0148mr11375977oig.194.1654452311287;
        Sun, 05 Jun 2022 11:05:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4-20020a056830108400b0060b6a3a5eefsm883868oto.36.2022.06.05.11.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 11:05:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 11:05:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 5/7] hwmon: (lm90) Define maximum number of channels that
 are supported
Message-ID: <20220605180509.GA3151647@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-6-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-6-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:55AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Use this define in all the places where literal '3' was used in this
> context.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter
