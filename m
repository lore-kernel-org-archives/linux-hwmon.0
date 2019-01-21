Return-Path: <SRS0=brSS=P5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F0C2F42E
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Jan 2019 15:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 436CE2085A
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Jan 2019 15:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfAUP2a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Jan 2019 10:28:30 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:36278 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728539AbfAUP23 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jan 2019 10:28:29 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81318EBD;
        Mon, 21 Jan 2019 07:28:29 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70D6F3F5C1;
        Mon, 21 Jan 2019 07:28:28 -0800 (PST)
Date:   Mon, 21 Jan 2019 15:28:25 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Message-ID: <20190121152825.GB27784@e107155-lin>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
 <1547831700-15865-30-git-send-email-linux@roeck-us.net>
 <20190118182157.GA13374@e107155-lin>
 <20190118185844.GB5284@roeck-us.net>
 <20190121093854.GC13374@e107155-lin>
 <7ab7492f-7820-8abc-c695-a11df89ce5e6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab7492f-7820-8abc-c695-a11df89ce5e6@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 21, 2019 at 07:22:44AM -0800, Guenter Roeck wrote:
> On 1/21/19 1:38 AM, Sudeep Holla wrote:

[...]

> > Sorry for not being clear, I was referring to these:
> > $ git grep "return S_.*" drivers/hwmon/ | sort | uniq
> >

[...]

> > drivers/hwmon/tmp102.c:		return S_IRUGO;
> > drivers/hwmon/tmp102.c:		return S_IRUGO | S_IWUSR;
> > drivers/hwmon/tmp421.c:		return S_IRUGO;
> >
>
> The series only includes auto-converted drivers, and the conversion
> focused on auto-converting SENSOR_ attributes. While it tried to convert
> various instances of the above, that was not the primary focus. I will
> likely submit one or more follow-up series to address remaining
> SENSOR_... attributes as well as any leftover S_<perms> definitions.
>

OK sounds good, just wanted to make sure I understood the intention
for this right.

--
Regards,
Sudeep
