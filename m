Return-Path: <philipp_subx@redfish-solutions.com>
Return-path: <philipp_subx@redfish-solutions.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Question about nct6775 and w83627ehf
From: Philip Prindeville <philipp_subx@redfish-solutions.com>
In-Reply-To: <0d70a41e-1b14-1f30-067e-c7d6085179ac@roeck-us.net>
Date: Sun, 18 Jun 2017 13:51:44 -0600
Cc: linux-hwmon@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <119B8D97-1DE5-4868-AF3D-3FF0C9646F68@redfish-solutions.com>
References: <48F7D8C9-21F9-4439-9069-34C05FBCF6A7@redfish-solutions.com>
 <0d70a41e-1b14-1f30-067e-c7d6085179ac@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>


> On Jun 15, 2017, at 6:35 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On 06/15/2017 03:34 PM, Philip Prindeville wrote:
>> Hi.
>> I=E2=80=99m working on a platform that uses the nct6775, and if I =
load a generic =E2=80=9Ceverything and the kitchen since=E2=80=9D kernel =
on it, then the w83627ehf module ends up claiming the nct6775 chipset.
>> My understanding was that the nct6775 driver supplants the w83627ehf =
for supporting the nct6775/6.
>> But if that=E2=80=99s the case, shouldn=E2=80=99t =
ec3e5a16446fef1891611fe3bdfa5954d1ddf5e4 have been partially backed out?
>> Well, there would have been a few others, too, I guess:
>> d42e869acf0da4502c452b786dee35f0ecf4cbc8
>> ad77c3e1808f07fa70f707b1c92a683b7c7d3f85
>> 585c0fd8216e0c9f98e2434092af7ec0f999522d
>> 33fa9b620409edfc71aa6cf01a51f990fbe46ab8
>> What=E2=80=99s the chance of the nct6775 stuff all getting scrubbed =
out?
>=20
> Yes, we had a patch in the works to do that but right now it is =
stalled.
> Feel free to submit a patch yourself to do it.
>=20
> Normally though those drivers are built as modules and loaded =
explicitly
> from /etc/modules or a similar configuration file. In other words, it =
is
> the user's choice. Building a Super-IO chip driver into the kernel is =
in
> general a bad idea since they all try to instantiate themselves. Worst
> case that may result in misdetection and even crashes.
>=20
> Guenter


Well, I was going through the first commit, =
ec3e5a16446fef1891611fe3bdfa5954d1ddf5e4, and it occurred to me that I =
couldn=E2=80=99t tell if ALL of the commit was necessary and relevant =
exclusively to the nct6775/6 functionality (and therefore could all be =
backed out), or if some of it was generalized cleanup and/or improvement =
which was prompted (or required) by the new functionality but could also =
stand alone on its own merit.

That is, does ALL of this commit need to be backed out, or does it =
contain improvements which (might have been a separate, isolated commit) =
can be left behind because they improve overall code quality and/or =
functionality?

-Philip
