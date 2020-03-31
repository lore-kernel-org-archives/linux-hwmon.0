Return-Path: <SRS0=Wymy=5Q=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9F3C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Mar 2020 23:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 041F120776
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Mar 2020 23:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=autistici.org header.i=@autistici.org header.b="Oi4KI7Co"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731325AbgCaXRR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Mar 2020 19:17:17 -0400
Received: from confino.investici.org ([212.103.72.250]:25379 "EHLO
        confino.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbgCaXRR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Mar 2020 19:17:17 -0400
X-Greylist: delayed 585 seconds by postgrey-1.27 at vger.kernel.org; Tue, 31 Mar 2020 19:17:16 EDT
Received: from mx1.investici.org (unknown [127.0.0.1])
        by confino.investici.org (Postfix) with ESMTP id C999C21790;
        Tue, 31 Mar 2020 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1585696050;
        bh=fd6I9rkVFEkP7gTPnDguC9y6JL2Hqo3amiTzWTRkwrc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Oi4KI7CouV2ymM38PZCV4mq4R1BCIBeqhM3OUaPXrh+lsmHIS5kpMafYijib0Ruvs
         XONd9NIjyptCkN0JjVGPTlXot0J7A6hxM1k8H23GKPnMN3F2EGnwrK7AdpN7SVMak3
         3TKlQSb47GG3uUK0F+3LIH5Ci7bjdPzwEAftdj8E=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250]) (Authenticated sender: mikefender@cryptolab.net) by localhost (Postfix) with ESMTPSA id 9BC1A2178E;
        Tue, 31 Mar 2020 23:07:30 +0000 (UTC)
Subject: Re: [PATCH] drivers/hwmon/dell-smm-hwmon.c: fix blank line
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20200331225708.52822-1-michelesr@autistici.org>
 <20200331230254.hxntiaq2s3ynk7pi@pali>
From:   Michele Sorcinelli <michelesr@autistici.org>
Message-ID: <2c3b2396-bad5-3e47-bc6c-bd0d20a19b8e@autistici.org>
Date:   Wed, 1 Apr 2020 00:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331230254.hxntiaq2s3ynk7pi@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/1/20 12:02 AM, Pali Rohár wrote:

> Hello! I'm fine with any coding style which is consistent. With or also
> without this blank line. So if Jean and Guenter as subsystem maintainers
> want this change I'm fine with it too and in this case you can add my
> Acked-by: Pali Rohár <pali@kernel.org>

I'm just wandering why this warnings are appearing?

WARNING: Missing a blank line after declarations
#122: FILE: drivers/hwmon/dell-smm-hwmon.c:122:
+       unsigned int eax;
+       unsigned int ebx __packed;

WARNING: Missing a blank line after declarations
#123: FILE: drivers/hwmon/dell-smm-hwmon.c:123:
+       unsigned int ebx __packed;
+       unsigned int ecx __packed;

WARNING: Missing a blank line after declarations
#124: FILE: drivers/hwmon/dell-smm-hwmon.c:124:
+       unsigned int ecx __packed;
+       unsigned int edx __packed;

WARNING: Missing a blank line after declarations
#125: FILE: drivers/hwmon/dell-smm-hwmon.c:125:
+       unsigned int edx __packed;
+       unsigned int esi __packed;

WARNING: Missing a blank line after declarations
#126: FILE: drivers/hwmon/dell-smm-hwmon.c:126:
+       unsigned int esi __packed;
+       unsigned int edi __packed;

They definitely look false positives, so maybe this behavior should be reported
to the maintainers of the checkpatch.pl script?
