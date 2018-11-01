Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yb1-f194.google.com ([209.85.219.194]:38919 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbeKBICV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Nov 2018 04:02:21 -0400
Received: by mail-yb1-f194.google.com with SMTP id j9-v6so47936ybj.6
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Nov 2018 15:57:21 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id j74-v6sm5503569ywj.20.2018.11.01.15.57.18
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Nov 2018 15:57:18 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id f15-v6so33335ybq.13
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Nov 2018 15:57:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <63e10688-5207-e8a4-dac2-d6c6094fbcc2@rasmusvillemoes.dk>
References: <20171108223020.24487-1-linux@rasmusvillemoes.dk>
 <20181026232409.16100-1-linux@rasmusvillemoes.dk> <CAGXu5j+eGQ3oo_1qSwW-BEVSK=vcLmNLWH8E7fPiawobo=_fbQ@mail.gmail.com>
 <63e10688-5207-e8a4-dac2-d6c6094fbcc2@rasmusvillemoes.dk>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 1 Nov 2018 15:57:17 -0700
Message-ID: <CAGXu5jL6RCL=WvCBJQytw=KnN74dp=1gd5wO-fO3i8tjAT=pvw@mail.gmail.com>
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

On Thu, Nov 1, 2018 at 3:06 PM, Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> On 2018-10-30 21:58, Kees Cook wrote:
>> On Sat, Oct 27, 2018 at 12:24 AM, Rasmus Villemoes
>> <linux@rasmusvillemoes.dk> wrote:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=kspp/format-security&id=ce9b938574042d09920650cb3c63ec29658edc87
>> The above seemed to "noisy" to send, but perhaps we should just land
>> it anyway. They really _should_ be const.
>>
>
> Isn't that 063246641d4a9e9de84a2466fbad50112faf88dc in mainline ;) ?

Oh, hah, so it is. So long ago I forgot. :P

> BTW, I don't agree with all the changes in there: For auto variables, this
>
> -       const char *cur_drv, *drv = "acpi-cpufreq";
> +       const char drv[] = "acpi-cpufreq";
> +       const char *cur_drv;
>
> makes gcc actually generate that string on the stack instead of just
> referring to an anonymous object in .rodata; one gets code gen like
>
> +:      31 c0                   xor    %eax,%eax
> +:      48 b8 61 63 70 69 2d    movabs $0x7570632d69706361,%rax # "acpi-cpu"
> +:      63 70 75
> +:      c7 44 24 0b 66 72 65    movl   $0x71657266,0xb(%rsp) # "freq"
> +:      71
> +:      c6 44 24 0f 00          movb   $0x0,0xf(%rsp) "\0"
> +:      48 89 44 24 03          mov    %rax,0x3(%rsp)

Oh that is nasty. Ugh. I hate the "const but not really ha ha" optimizations. :(

> It's not the-end-of-the-world-horrible, but it's better avoided,
> especially for patches that are not supposed to change anything. And
> longer strings would of course produce even more gunk like the above.
> A better fix which also silences -Wformat-security is to declare the
> variable itself const, i.e.
>
> const char *const drv = "acpi-cpufreq".

Yes, that would be much better. Seems like we could do a really easy
Coccinelle script to fix all of those?

@@
identifier VAR;
expression STRING;
@@

- const char VAR[]
+ const char * const VAR
  = STRING;

yields:
 517 files changed, 890 insertions(+), 891 deletions(-)

Worth doing at the end of -rc2?

> Yes, gcc should be able to infer the constness of drv from the fact that
> it's never assigned to elsewhere in the function... I think I saw that
> on some gcc todo list at some point.

If you find that bug, I'll add it to my gcc bug tracking list. :P

>> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=kspp/format-security&id=b7dcfc8f48caaafcc423e5793f7ef61b9bb5c458
>> This one covers cases where the pointer is pointing to a const string,
>> so really there's no sense in injecting the "%s", but I was collecting
>> them to make real ones stand out.
>
> I don't agree. Yes, a human can verify that _currently_, only "pencrypt"
> and "pdecrypt" can ever reach pcrypt_sysfs_add(). But without the
> compiler being smart enough to do that, one will never know if some new
> caller shows up, or one of those literals grows a % for some reason.
> Adding "%s" doesn't cost much, especially not in cases (like this one)
> where the fmt+args end up at kobject_set_name_vargs - for a "%s" +
> literal that does a (succesful) kstrdup_const(), so we never even hit
> the vsnprintf() engine.

Okay, then I'll forward this to akpm maybe?

>>> Patches 5,6,7 are
>>> some examples of where one might add fmtcheck() calls. I don't think
>>> we can get to a state where we can unconditionally add
>>> -Wformat-nonliteral to the build, but I think there's a lot of
>>> low-hanging fruit.
>>
>> How much work do you think it'd take to get to a
>> format-nonliteral-clean build? I think it's worth doing the work if
>> it's not totally intractable.
>
> Probably less than the VLA removal. But it kind of depends on which
> tools one allows. I can't see how to do it without something like
> fmtcheck() to annotate certain places (e.g. the nfs example). Maybe a
> no_fmtcheck() to annotate places which have been manually verified
> [modulo the above "but that may change..."] would also be needed
> (no_fmtcheck would be the same as fmtcheck for at !CONFIG_FMTCHECK
> kernel), similar to how we have no_printk.
>
> I kind of agree with Guenther that the hwmon example is a bad one. It
> would be better to have the compiler check all those string literals
> against a pattern at build time. Probably the format template plugin can
> be extended to apply to any "const char*" declaration, not just those
> sitting inside structs. But I'd rather get fmtcheck() in first before
> returning to work on that plugin.

Yeah, fair.

-Kees

-- 
Kees Cook
