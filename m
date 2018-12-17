Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:20144 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732154AbeLQJqp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Dec 2018 04:46:45 -0500
Subject: Re: libsensors soname bump
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org
References: <20181216124344.49d06b69@endymion>
From: =?UTF-8?Q?Ond=c5=99ej_Lyson=c4=9bk?= <olysonek@redhat.com>
Message-ID: <514c8587-ccf3-f7af-b88d-744add6f1da2@redhat.com>
Date: Mon, 17 Dec 2018 10:46:43 +0100
MIME-Version: 1.0
In-Reply-To: <20181216124344.49d06b69@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jean,

On 16. 12. 18 12:43, Jean Delvare wrote:
> Hi Ondřej,
> 
> You have recently released lm-sensors 3.5.0 with a new soname for
> libsensors:
> 
> -LIBMAINVER := 4
> -LIBMINORVER := 4.0
> +LIBMAINVER := 5
> +LIBMINORVER := 0.0
> 
> -#define SENSORS_API_VERSION            0x440
> +#define SENSORS_API_VERSION            0x500
> 
> This is declaring the new library as incompatible with the previous
> version, meaning that distributions will have to build and ship both
> libsensors4 and libsensors5 for a long time until all applications have
> been updated and rebuilt to link with the new library. This is a
> significant effort for the whole community and should only be done when
> necessary.

I thought there was an ABI change, which would warrant a soname bump. Or
am I wrong in thinking that? I was mistaken however and I'm sorry about
that, there was no ABI change.

I don't see why distributions would have to ship two versions of the
library. The *name* of the library didn't change, it's still libsensors
(not libsensors4 or libsensors5).
[~/git/lm-sensors]$ make
...
[~/git/lm-sensors]$ ls lib/ | grep libsensors.so
libsensors.so
libsensors.so.5
libsensors.so.5.0.0

So all distros need to do is rebuild dependent packages. No changes to
other packages should be required.

Am I missing something?

Thanks.

Ondra

> 
> In this specific case, I can't see what warranted such a change of
> major library version change. From
> lm-sensors/doc/developers/release_checklist:
> 
>   Remember: update main number when interface changes, minor if new
>   functionality is added, and patch if only bugs are fixed.
> 
> In this case I can only see new functionality added, there is no
> interface change. Therefore the correct value for SENSORS_API_VERSION
> was 0x450, not 0x500. This would avoid the parallel maintenance and
> installation of 2 versions of the library for several years to come.
> 
> Would you consider quickly releasing lm-sensors 3.5.1 with the proper
> library version number, to save all that work to all application
> authors/maintainers and distribution package maintainers?
> 
> Thanks,
> 
