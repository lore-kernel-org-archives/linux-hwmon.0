Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF56C6377C
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 23:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D9766108B
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Jul 2021 23:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhGUWsC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Jul 2021 18:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbhGUWsC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Jul 2021 18:48:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB01C061575;
        Wed, 21 Jul 2021 16:28:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GVWwx0lfNz9sV8;
        Thu, 22 Jul 2021 09:28:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1626910114; bh=GoKHY31AUl/WmIbrWvstEpC6nwWnu/aYYQ5eVh88pmQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=FA5Ym+Gs70MifbuFfkuM8sCA6mPXNMq4AZgTsP743W2eJikolBaegABYpt7ziNCX0
         YpbZ741z/evpIlqL0SNxLPw0AS5PEC0fMzizB5sG4pk7CscPu4KzNFlHg1OHNrKZwo
         wkOPAxugW5aO8km38+a3cmYqrWg5x5Da6PW4D9IHTXK0qi46nu/zj+Eg6OtIo7yQeR
         hOB+s8+o5p9RGW7ebPM2LQ/Qt305lDSU6dZ4v5aV6gUSCyVklP9F+G9wHbnK+pD+x8
         oDIXfKB6LbMNExnTOnUJCeyIPs0tXjbw4k8UR1Jj7/LBdpIh+7w23MeXjc573Os2zg
         VNwEbve7Xomag==
Message-ID: <de6a55a881eae463014af0fe165b60a378773d1d.camel@ozlabs.org>
Subject: Re: [PATCH 3/3] fsi: occ: Add dynamic debug to dump command and
 response
From:   Jeremy Kerr <jk@ozlabs.org>
To:     Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc:     linux-hwmon@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux@roeck-us.net, jdelvare@suse.com, joel@jms.id.au,
        alistair@popple.id.au, openbmc@lists.ozlabs.org
Date:   Thu, 22 Jul 2021 07:28:27 +0800
In-Reply-To: <20210716151850.28973-4-eajames@linux.ibm.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
         <20210716151850.28973-4-eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Eddie,

> Use the dynamic branching capability of the dynamic debug subsystem
> to dump the command and response with the correct OCC device name.

Would this be better done with a tracepoint? Given it's a fairly
well-defined pair of events, and there's data to dump in both cases.

We have a couple of existing tracepoionts in the core code if that
helps...

Cheers,


Jeremy

