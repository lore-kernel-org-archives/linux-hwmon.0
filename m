Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE07C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Nov 2022 10:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbiKDKcp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Nov 2022 06:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbiKDKca (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Nov 2022 06:32:30 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315542B188;
        Fri,  4 Nov 2022 03:32:29 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1oqtzv-0001Rb-8u; Fri, 04 Nov 2022 11:32:27 +0100
Message-ID: <69a138bb-1638-421b-a38c-f81a90701a3b@leemhuis.info>
Date:   Fri, 4 Nov 2022 11:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: (bug report) HWMON & Thermal interactions #forregzbot
Content-Language: en-US, de-DE
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Y1WHnJ6h1RSOipV4@e120937-lin>
 <b0bf779e-6195-4fad-377a-ba1e63419c5d@leemhuis.info>
In-Reply-To: <b0bf779e-6195-4fad-377a-ba1e63419c5d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667557949;5851c01c;
X-HE-SMSGID: 1oqtzv-0001Rb-8u
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 24.10.22 12:18, Thorsten Leemhuis wrote:
> On 23.10.22 20:27, Cristian Marussi wrote:
>>
>> Starting with v6.1-rc1 the SCMI HWMON driver failed probing on my JUNO due
>> to the fact that no trip points were (ever !) defined in the DT; bisecting it
>> looks like that after:
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced e51813313
> #regzbot title SCMI HWMON driver failed probing on JUNO
> #regzbot ignore-activity

#regzbot fixed-by: c4a7b9b587ca
