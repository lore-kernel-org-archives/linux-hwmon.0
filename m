Return-Path: <SRS0=i7X4=EB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4A5C2D0A3
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Oct 2020 07:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4323222B9
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Oct 2020 07:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=fnarfbargle.com header.i=@fnarfbargle.com header.b="ONaibu/q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1768983AbgJZHRr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Oct 2020 03:17:47 -0400
Received: from ns3.fnarfbargle.com ([103.4.19.87]:42112 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1421373AbgJZHRr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Oct 2020 03:17:47 -0400
X-Greylist: delayed 1976 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 03:17:46 EDT
Received: from srv.home ([10.8.0.1] ident=heh23485)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <lists2009@fnarfbargle.com>)
        id 1kWwEK-0000Io-Id
        for linux-hwmon@vger.kernel.org; Mon, 26 Oct 2020 14:43:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=WSmaoTxPAAM0fikXusQJ/xLBu86ApZp0mv7JINIB4bE=;
        b=ONaibu/qdHUJeVg0HpshICOZNduqOw7IbbgZCzNpbNsL4lIWD76jzTyPpcu6O01ts/rHq3KpxgdFEBv+Gw5CEt4YBou5hPSLLhjFHXpQgPEkK2452lDCZkKZ/VzI41BE62D38Um05FUE3Mb5KFATEeUeiAn1p0VMP4h/2NFInlk=;
To:     linux-hwmon@vger.kernel.org
From:   Brad Campbell <lists2009@fnarfbargle.com>
Subject: applesmc Battery charge limiter
Message-ID: <0831391e-e8d0-1398-d835-a14d7ac0a310@fnarfbargle.com>
Date:   Mon, 26 Oct 2020 17:43:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

G'day all,

As has been recently documented on loads of Mac forums, it turns out that some older Macbook hardware can set the SMC to stop charging at an arbitrary battery charge level.
On supported machines this is the BCLM SMC key. I've also found that on my MacbookPro 11,1 the BFCL key sets the threshold at which the SMC changes the charging led from orange to green (that doesn't seem to be documented anywhere).

On my machine I set them to 4b & 4a respectively, and the battery stops charging at ~75% and the led goes green. I boot into OSX and use smcutil to set this, but it sticks until either a firmware update or SMC reset and hasn't caused an issues in Linux with suspend or hibernate for the month or so I've had it working.

I've been considering adding this to the applesmc driver, but as it tends to take me inordinate amounts of time to do this stuff I thought I'd ask before I start :

- Would it likely be accepted?
- Apple seems to set BFCL at ~5% less than BCLM. Would it be policy to do similarly arbitrary, or should the keys be exposed independently?

I'm happy to do a bit of work and put some patches forward, but I'd rather gauge interest and get some direction before I start.

My VAIO had this 10 years ago so it's nice to see Apple catch up, even if the functionality has been there but hidden for years.

Regards,
Brad
