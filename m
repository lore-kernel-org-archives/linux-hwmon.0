Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yw1-f66.google.com ([209.85.161.66]:43460 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbeJaFx4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 01:53:56 -0400
Received: by mail-yw1-f66.google.com with SMTP id j75-v6so5536106ywj.10
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Oct 2018 13:58:52 -0700 (PDT)
Received: from mail-yw1-f46.google.com (mail-yw1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id l128-v6sm5994227ywd.35.2018.10.30.13.58.49
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 13:58:49 -0700 (PDT)
Received: by mail-yw1-f46.google.com with SMTP id j75-v6so5535972ywj.10
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Oct 2018 13:58:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20181026232409.16100-1-linux@rasmusvillemoes.dk>
References: <20171108223020.24487-1-linux@rasmusvillemoes.dk> <20181026232409.16100-1-linux@rasmusvillemoes.dk>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 30 Oct 2018 13:58:48 -0700
Message-ID: <CAGXu5j+eGQ3oo_1qSwW-BEVSK=vcLmNLWH8E7fPiawobo=_fbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] runtime format string checking
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        linux-hwmon@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Oct 27, 2018 at 12:24 AM, Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> This is a resurrection of something I sent out about a year ago. In
> the relatively few places where we use a non-literal as format string,
> we can annotate the source with a fmtcheck() call that will (a) at
> build time, allow the compiler to check the variadic arguments against
> the template, and (b) at runtime, check that the format specifiers
> present in the actual format string match those in the template (and
> if not, WARN and use the template to ensure runtime type safety).
>
> Finding places to annotate is just
>
>   make -j8 KCFLAGS='-Wformat-nonliteral'
>
> So far, in about half the places I looked, one might as well get
> completely rid of the non-literal format string.

Agreed. When I was still updating format string sites regularly, I had
a couple "just make the build quiet" patches to do this:

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=kspp/format-security&id=ce9b938574042d09920650cb3c63ec29658edc87
The above seemed to "noisy" to send, but perhaps we should just land
it anyway. They really _should_ be const.

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=kspp/format-security&id=b7dcfc8f48caaafcc423e5793f7ef61b9bb5c458
This one covers cases where the pointer is pointing to a const string,
so really there's no sense in injecting the "%s", but I was collecting
them to make real ones stand out.

> Patches 5,6,7 are
> some examples of where one might add fmtcheck() calls. I don't think
> we can get to a state where we can unconditionally add
> -Wformat-nonliteral to the build, but I think there's a lot of
> low-hanging fruit.

How much work do you think it'd take to get to a
format-nonliteral-clean build? I think it's worth doing the work if
it's not totally intractable.

-Kees

>
> This is on top of Miguel's compiler attributes series [1], which I
> hope will land in mainline soon.
>
> [1] https://github.com/ojeda/linux.git tags/compiler-attributes-for-linus-4.20-rc1
>
> Rasmus Villemoes (7):
>   compiler_attributes.h: add __attribute__((format_arg)) shorthand
>   lib/vsprintf.c: add fmtcheck utility
>   kernel.h: implement fmtmatch() wrapper around fmtcheck()
>   lib/test_printf.c: add a few fmtcheck() test cases
>   kernel/kthread.c: do runtime check of format string in
>     kthread_create_on_cpu()
>   nfs: use fmtcheck() in root_nfs_data
>   drivers: hwmon: add runtime format string checking
>
>  drivers/hwmon/hwmon.c               |  3 +-
>  fs/nfs/nfsroot.c                    |  2 +-
>  include/linux/compiler_attributes.h | 13 ++++++
>  include/linux/kernel.h              | 25 +++++++++++
>  kernel/kthread.c                    |  4 +-
>  lib/Kconfig.debug                   |  9 ++++
>  lib/test_printf.c                   | 43 +++++++++++++++++++
>  lib/vsprintf.c                      | 65 +++++++++++++++++++++++++++++
>  8 files changed, 160 insertions(+), 4 deletions(-)
>
> --
> 2.19.1.6.gbde171bbf5
>



-- 
Kees Cook
