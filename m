Return-Path: <aurelien@aurel32.net>
Date: Mon, 17 Dec 2018 12:27:13 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: =?utf-8?Q?Ond=C5=99ej_Lyson=C4=9Bk?= <olysonek@redhat.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: libsensors soname bump
Message-ID: <20181217112713.jvobrvrmxpkfeshi@aurel32.net>
References: <20181216124344.49d06b69@endymion>
 <514c8587-ccf3-f7af-b88d-744add6f1da2@redhat.com>
 <3799b201-38f9-d74f-273d-f819736dcfb6@redhat.com>
 <20181217115902.15e538fe@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181217115902.15e538fe@endymion>
Sender: Aurelien Jarno <aurelien@aurel32.net>
List-ID: <linux-hwmon@vger.kernel.org>

On 2018-12-17 11:59, Jean Delvare wrote:
> On Mon, 17 Dec 2018 11:35:46 +0100, Ond=C5=99ej Lyson=C4=9Bk wrote:
> > I mean, I would love to revert the soname change, however doing so now
> > seems like a bad thing to do - people may have already adopted
> > lm_sensors 3.5.0. So I'd like to avoid reverting the change unless there
> > is a good justification to do so.
>=20
> It's not in Debian yet:
> https://packages.debian.org/sid/lm-sensors

It's available in the experimental suite with the soname change:
https://packages.debian.org/experimental/lm-sensors

And it's waiting for a transition slot to rebuild all the
reverse dependencies in sid:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D915790

So on the Debian side, there is still time to revert the soname change.

Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
