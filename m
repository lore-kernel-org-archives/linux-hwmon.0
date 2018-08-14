Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net> <CACRpkdY0y_q-MXvwmW_aF=DnNy2X9z+=7jY8SGObrBuvs8h2_A@mail.gmail.com>
 <20180813141438.GH3978217@devbig004.ftw2.facebook.com> <20180813162614.GB12580@roeck-us.net>
In-Reply-To: <20180813162614.GB12580@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Aug 2018 23:31:36 +0200
Message-ID: <CACRpkdaux3kmQEKujnKb80F-wgajbhBAS7FQ2tQiOzT5j7ugVA@mail.gmail.com>
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Aug 13, 2018 at 6:26 PM Guenter Roeck <linux@roeck-us.net> wrote:

> The goal is to be able to access all environmental values with a single
> command or set of commands, such as the "sensors" command. This command
> depends on libsensors, which currently gets its data exclusively from
> hwmon drivers.
>
> A possible alternative might be to implement some kind of plugin interfac=
e
> in libsensors, to let it pull environmental data from other entities besi=
des
> kernel drivers. This would enable uses cases like this (presumably with
> a daemon which would connect to libsensors). Technically this should not
> be too difficult; the biggest challenge might be to find someone with
> enough time to design and implement it.

My experience after working with libnjb, the implementation of the
Media Transfer Protocol that is used to microkernel-ishy from userspace
to communicate with all media players out there would be please just
do it in kernelspace.

The main reason is that I think the kernel should abstract hardware
and present it to userspace in a uniform way. Hwmon is excellent at
this.

The kernel is also awesome and highly performant at doing arbitration
between clients. in this case arbitration between this code and userspace
SMART toools is done by the queue in the block layer, which is
awesome at what it's doing.

We have a loose ideal to let userspace deal with "policy" (it is a bit uncl=
ear
what that means) and other SMART usage like disk diagnostics and
self-test etc is definately policy IMO (smartmontools even have a
daemon for it, in the manpage it is stated how to instruct it to ignore
the temperature beacause it "changes too often"), so the temperature
of the hard disk is dubious as "policy", it is more of a fact which we
have a dedicated ABI for.

Just my =E2=82=AC0.01
Linus Walleij
