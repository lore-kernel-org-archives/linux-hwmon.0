Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C56CC07EBF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 18:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51AF820823
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 18:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbfARSWF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 13:22:05 -0500
Received: from foss.arm.com ([217.140.101.70]:36212 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728792AbfARSWF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 13:22:05 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89CE480D;
        Fri, 18 Jan 2019 10:22:04 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 574323F6A8;
        Fri, 18 Jan 2019 10:22:03 -0800 (PST)
Date:   Fri, 18 Jan 2019 18:21:57 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Message-ID: <20190118182157.GA13374@e107155-lin>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
 <1547831700-15865-30-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547831700-15865-30-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 18, 2019 at 09:14:59AM -0800, Guenter Roeck wrote:
> Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
> to improve readbility, and to reduce the chance of inconsistencies.
> 

s/readbility/readability/

> Also replace any remaining S_<PERMS> in the driver with octal values.
> 
> The conversion was done automatically with coccinelle. The semantic patches
> and the scripts used to generate this commit log are available at
> https://github.com/groeck/coccinelle-patches/hwmon/.
> 
> This patch does not introduce functional changes. It was verified by
> compiling the old and new files and comparing text and data sizes.
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

Not related to this patch, just thought of asking. If the intention is
to avoid using S_<PERMS> macros and have direct values for readability,
shouldn't you consider the ones as return values mainly in is_visible
callbacks ?

Anyways,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
