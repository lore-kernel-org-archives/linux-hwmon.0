Return-Path: <SRS0=IsVg=P6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88143C282C3
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jan 2019 09:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6020A218D0
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jan 2019 09:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbfAVJzj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:55:39 -0500
Received: from foss.arm.com ([217.140.101.70]:49712 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726872AbfAVJzj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jan 2019 04:55:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD292EBD;
        Tue, 22 Jan 2019 01:55:38 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A1A43F6A8;
        Tue, 22 Jan 2019 01:55:37 -0800 (PST)
Date:   Tue, 22 Jan 2019 09:55:31 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Message-ID: <20190122095531.GA2656@e107155-lin>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
 <1547831700-15865-30-git-send-email-linux@roeck-us.net>
 <20190118182157.GA13374@e107155-lin>
 <20190118185844.GB5284@roeck-us.net>
 <20190121093854.GC13374@e107155-lin>
 <7ab7492f-7820-8abc-c695-a11df89ce5e6@roeck-us.net>
 <20190121152825.GB27784@e107155-lin>
 <d920b47d-157e-7bf6-7055-4caf75a58968@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d920b47d-157e-7bf6-7055-4caf75a58968@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 21, 2019 at 04:45:38PM -0800, Guenter Roeck wrote:
> On 1/21/19 7:28 AM, Sudeep Holla wrote:
> > On Mon, Jan 21, 2019 at 07:22:44AM -0800, Guenter Roeck wrote:
>

[...]

> After having another look ... did you check the entire series
> of patches ? Because for me, in hwmon-next:
>
> $ git grep "return S_.*" drivers/hwmon/ | sort | uniq
> $

No I didn't check applying the patches, just looked at the pattern in few
patches and thought of asking you directly the details.

--
Regards,
Sudeep
