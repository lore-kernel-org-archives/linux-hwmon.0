Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE85C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 19:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234923AbiBGTAS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 14:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235497AbiBGS5g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 13:57:36 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E38C0401F5
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 10:57:22 -0800 (PST)
Received: from zn.tnic (dslb-088-067-221-104.088.067.pools.vodafone-ip.de [88.67.221.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BF1601EC02B9;
        Mon,  7 Feb 2022 19:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1644260234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=PPFoq/KfBO2kowrqfUfB0TFIrcrDCEWeUZ4fipD381w=;
        b=g31qGmHOW9+Y86dMxZ3u2lfC7Rc6TLQA4ocDZ1uCP24sEBgPz/ODaXfQ2P7DWSVrcjW6wW
        nfED86Z5aROr6s8U/0Krw+L0Q+LW4qisQc2QBgzhXdVaefLnuBIuyaiJVzz5uRaC5rSZZn
        whRZn8AsqTe2TGeZE5aboySxs8SQXGc=
Date:   Mon, 7 Feb 2022 19:57:13 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-hwmon@vger.kernel.org,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH 1/2] x86/Kconfig: move and modify CONFIG_I8K
Message-ID: <YgFrieUmgaw1yGkf@zn.tnic>
References: <20220207182940.242838-1-mat.jonczyk@o2.pl>
 <43bfd6d9-58a3-6f9c-0848-4ef147552afb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43bfd6d9-58a3-6f9c-0848-4ef147552afb@redhat.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Feb 07, 2022 at 07:51:10PM +0100, Hans de Goede wrote:
> For other reviewers, the only consumer of the CONFIG_I8K
> option is drivers/hwmon/dell-smm-hwmon.c
> which has a couple of:
> "#if IS_ENABLED(CONFIG_I8K)" checks to enable its old
> legacy /proc/i8k interface.
> 
> So this move definitely makes sense.

I love patches removing code from arch/x86/ so for the move:

Acked-by: Borislav Petkov <bp@suse.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
