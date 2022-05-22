Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F82C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 May 2022 14:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347371AbiEVOw4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 May 2022 10:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbiEVOwy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 May 2022 10:52:54 -0400
Received: from smtpo62.interia.pl (smtpo62.interia.pl [217.74.67.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0D117A9B
        for <linux-hwmon@vger.kernel.org>; Sun, 22 May 2022 07:52:50 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Sun, 22 May 2022 16:52:46 +0200 (CEST)
Date:   Sun, 22 May 2022 16:52:45 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com
Subject: Re: [PATCH 0/8] Add support for ADT7481 in lm90
Message-ID: <YopOPSnafQi4n9Y+@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <c1b1f02a-42c2-bc67-ab92-c0bf9dabbe94@roeck-us.net>
 <62a519ee-c909-bdb8-e686-084ffe8a8bcf@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62a519ee-c909-bdb8-e686-084ffe8a8bcf@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653231168;
        bh=Sz3m3vre36p1cqH46TvtV+zIlbOozY8sTtr3eQQQT1E=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=E2IK7/t+ZxUAupcn3mlCaNJ8yLY/yUpSSF1GsuNZwH28df17Vt2ZLboWDhwePLccj
         BHx5EdcV3EzUCX5PkpsGFhSKvs5eo5hu2/afM7OWln+pDPFTdU7bQlROSQYPW5wKqm
         aigqT5y3pFueptkzfLGflBZ0KJ9/av92qRS5ns1o=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 20, 2022 09:01, Guenter Roeck wrote:
> On 5/20/22 06:45, Guenter Roeck wrote:
> > On 5/20/22 02:32, Slawomir Stepien wrote:
> > > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > > 
> > > This patch series adds support for ADT7481 in lm90.c driver and extends the
> > > device-tree options for it.
> > > 
> > > The ADT7481 is quite similar to MAX6696 (already supported in lm90) so a lot of
> > > code is reused.
> > > 
> > > One major problem in fitting the ADT7481 in lm90.c is the chip detection.
> > > However it seems that the chip has been designed and produced with correct
> > > values at locations: 0xfe (manufactured id) and 0xff (chip id), but this is not
> > > documented in the datasheet.
> > > 
> > 
> > Before we go too far along this route, would you mind using my own patch series
> > as base to implement the devicetree changes ? I had prepared an extensive
> > patch series a while ago, adding not only support for ADT7481 but for
> > several other chips as well, I just never got around to sending it out.
> > 
> 
> I made my lm90 patch series available in branch hwmon-lm90 of
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> 
> The patches in this series were module tested and tested on real hardware
> with the test scripts at git@github.com:groeck/module-tests.git;
> look for scripts/lm90-real.sh and scripts/lm90.sh.

I will test that out.

If I would be happy with that branch, should I rebase all my changes based on that branch and send
the patches to the lists?

-- 
Slawomir Stepien
