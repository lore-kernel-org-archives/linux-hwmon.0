Return-Path: <linus971@gmail.com>
Return-path: <linus971@gmail.com>
MIME-Version: 1.0
References: <1535574760-11636-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1535574760-11636-1-git-send-email-linux@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Aug 2018 16:07:34 -0700
Message-ID: <CA+55aFzUVOKJgXpfUEwC2eK7mNhhJktse=Dbrwh0x8AmUxwEcQ@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon fixes for v4.19-rc2
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Aug 29, 2018 at 1:32 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Please pull hwmon fixes for Linux v4.19-rc2 from signed tag:

That actually isn't a signed tag at all, it's just a bare tag (ie just
directly points to the commit).

I guess I don't care *that* much, since it's from kernel.org, but you
should check what happened to your workflow. *Normally* you do
actually have signed tags.

            Linus
