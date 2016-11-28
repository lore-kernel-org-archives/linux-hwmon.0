Return-path: <john@jmuir.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 3/3] hwmon: tmp108: Update driver to use hwmon_chip_info.
From: John Muir <john@jmuir.com>
In-Reply-To: <20161127230035.GA19132@roeck-us.net>
Date: Sun, 27 Nov 2016 18:10:46 -0800
Cc: Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux List <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6A7DE8C-950A-4BC6-8186-308E3152FD9D@jmuir.com>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <1480223737-82080-4-git-send-email-john@jmuir.com>
 <20161127230035.GA19132@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

> On 2016.11.27, at 15:00 , Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On Sat, Nov 26, 2016 at 09:15:37PM -0800, John Muir wrote:
>> Move the tmp108 driver from hwmon attribute groups to
>> hwmon_chip_info.
>>=20
>> Signed-off-by: John Muir <john@jmuir.com>
>> ---
>=20
> Hi John,
>=20
> please have a look at the following patch.
>=20
> Something else: Symbolic permissions are out of favor nowadays.
> You might instead just use 0644 / 0444. Not that I really care,
> but it prevents the inevitable follow-up patches.
>=20

Hi Guenter,

Thank you for this patch. I will attempt to implement the same changes =
using the older interfaces in my 4.4 implementation. I will incorporate =
your changes and other comments as soon as I can (early this week) and =
re-send my patch series.

Cheers,

John.
