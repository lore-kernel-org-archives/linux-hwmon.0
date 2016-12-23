Return-path: <linus971@gmail.com>
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <1482432934-22961-1-git-send-email-linux@roeck-us.net>
References: <1482432934-22961-1-git-send-email-linux@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Dec 2016 10:35:52 -0800
Message-ID: <CA+55aFympX7vK9+RqdG-20sAyFNsTv+jtQDuR2kz7ApWMGedyg@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for v4.10 (take 2)
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Dec 22, 2016 at 10:55 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>
> As mentioned in the tag, this patch series was auto-generated using coccinelle.
> I would like to have it applied either now or right after -rc1, at your
> preference.

My preference is to not apply it at all.

Several of the commit messages I looked at were actively misleading,
talking about the coccinelle transformation for the RO case, but then
the patch itself was actually RW.

I'm not going to bother with this kind of broken thing the day before
xmas eve.

This will not be pulled.

               Linus
