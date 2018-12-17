Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48726 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726505AbeLQK7E (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Dec 2018 05:59:04 -0500
Date: Mon, 17 Dec 2018 11:59:02 +0100
From: Jean Delvare <jdelvare@suse.de>
To: =?UTF-8?B?T25kxZllaiBMeXNvbsSbaw==?= <olysonek@redhat.com>
Cc: linux-hwmon@vger.kernel.org, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: libsensors soname bump
Message-ID: <20181217115902.15e538fe@endymion>
In-Reply-To: <3799b201-38f9-d74f-273d-f819736dcfb6@redhat.com>
References: <20181216124344.49d06b69@endymion>
        <514c8587-ccf3-f7af-b88d-744add6f1da2@redhat.com>
        <3799b201-38f9-d74f-273d-f819736dcfb6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 17 Dec 2018 11:35:46 +0100, Ondřej Lysoněk wrote:
> I mean, I would love to revert the soname change, however doing so now
> seems like a bad thing to do - people may have already adopted
> lm_sensors 3.5.0. So I'd like to avoid reverting the change unless there
> is a good justification to do so.

It's not in Debian yet:
https://packages.debian.org/sid/lm-sensors

Gentoo have picked it but it is still in testing:
https://packages.gentoo.org/packages/sys-apps/lm_sensors

You'll know better than I do about Fedora.

For openSUSE, I have packaged lm-sensors 3.5.0 but with a patch
reverting the undue soname change. I used "4.5.0" instead. I intend to
carry this patch for as long as I have to. This goes against our policy
of sticking to upstream as much as possible, but in this specific case,
I consider it the least of 2 evils.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
