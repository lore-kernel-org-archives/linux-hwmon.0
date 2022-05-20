Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7815C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 10:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348294AbiETK6F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 06:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245475AbiETK6E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 06:58:04 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6787E13F926
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 03:58:01 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <t480s.localdomain>
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 12:57:57 +0200 (CEST)
Date:   Fri, 20 May 2022 12:57:56 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: Add 'extended-range-enable'
 property support in lm90
Message-ID: <Yod0NMnkxb3JLcmL@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-3-sst@poczta.fm>
 <3e1ccf50-754c-c149-225d-e041c38e968f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e1ccf50-754c-c149-225d-e041c38e968f@linaro.org>
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653044279;
        bh=Wy8pyzyvokVc1KSEapeTeJx0pFhAXyszK0MUgDZBfEA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=DUOqUg9IKWxBDgufQNTI2ktIn08q8uL2Dxm1w+KLAwK5YkAsi9jVMdLHrV1F8bu97
         mzXpSMTS11XcOxF5jyScs9Hzv3YThtOvLRMukZ+BTabE9wGJJXKCBqRhmS774VfutQ
         4AWqJn/qF/8NHVz5Ibrfu2nysV/hV7nPAZ+6o4uY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 20, 2022 12:09, Krzysztof Kozlowski wrote:
> On 20/05/2022 11:32, Slawomir Stepien wrote:
> > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > 
> > Using the 'extended-range-enable' prop will enable the extended
> > measurement range for device (if supported by the device).
> 
> No. Please see other patchset:
> https://lore.kernel.org/all/20220517135614.8185-1-holger.brunck@hitachienergy.com/

Oh that's nice! I will drop this patch then.

-- 
Slawomir Stepien
