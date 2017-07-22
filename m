Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:37526 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750864AbdGVQ0R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Jul 2017 12:26:17 -0400
MIME-Version: 1.0
In-Reply-To: <1500733843-22721-1-git-send-email-linux@roeck-us.net>
References: <1500733843-22721-1-git-send-email-linux@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Jul 2017 09:26:16 -0700
Message-ID: <CA+55aFxr-PfDKrCT49sJ7hRpRvz9q-ZAXyhTN3+V3NnT8wLx-A@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon fixes for v4.13-rc2
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Jul 22, 2017 at 7:30 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> Hi Linus,
>
> Please pull hwmon fixes for Linux v4.13-rc2 from signed tag:
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-linus-v4.13-rcX

Please fix whatever broken script it is that generates this.

The real tag name comes later in the email:

>   git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-linus-v4.13-rc2

See the difference?

One works, one does not.

Please don't add a non-working thing just to confuse and annoy people, ok?

                Linus
