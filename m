Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF317C636D4
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Jan 2023 14:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjAaOoG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Jan 2023 09:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjAaOoF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2023 09:44:05 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3855B8
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Jan 2023 06:44:04 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 40B0931A;
        Tue, 31 Jan 2023 14:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40B0931A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675176243; bh=YGDUrA0SeI/jYdHuqlL0Cq1bXb1f+5JCiqVd4m41wqg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sFJM10Dd+tnCZXi+eqigfUPgHL+dC0hSBp/T4TTtkww66BM+/uoIIIhqwkok9e3pK
         GKcmOAdca5EWLnrRpmykUyOqkQf4J5giswFGJ2xgiilm7/Z4iyTZR6QaIFp91G2A0V
         tqpbVSMdRsmHPfaM2GGF94n4yibnZ0zo6J27Oh/EIo0qUDplSulF8Rv3jL2MnR+wKu
         IwCnXW8bKz3NMOnTSQTOJ7s+Da27gC+4qzAQA47/khyvxNCEy4h47/AdBL0JAejM+A
         1TmB30QVzgaLxfswmtUqEdGACc9MhT6Qmm2fNUZhd0OQByy+1lkxbKmo1lY9tNerhL
         1KOTRUP5I7g3Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Guenter Roeck <linux@roeck-us.net>, SeongJae Park <sj@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 4/8] Docs/hwmon/index: Add missing SPDX License
 Identifier
In-Reply-To: <20230131034404.GA837158@roeck-us.net>
References: <20230122213650.187710-1-sj@kernel.org>
 <20230122213650.187710-5-sj@kernel.org>
 <20230131034404.GA837158@roeck-us.net>
Date:   Tue, 31 Jan 2023 07:44:02 -0700
Message-ID: <87k0124vd9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Guenter Roeck <linux@roeck-us.net> writes:

> On Sun, Jan 22, 2023 at 09:36:46PM +0000, SeongJae Park wrote:
>> Add missing SPDX License Identifier for hwmon documentation index file.
>> 
>
> I do not feel comfortable accepting this change without confirmation
> that changing the license from <none> to an explicit <GPL v2.0> is
> legally acceptable.

As with many of these, this file was initially added by Mauro (added to
CC).  Mauro, can you confirm that GPLv2 was your intention for these
index.rst files?  That would clear the path for a lot of these patches.

Thanks,

jon
