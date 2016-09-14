Return-path: <mikey@neuling.org>
Message-ID: <1473815676.32111.64.camel@neuling.org>
Subject: Re: [PATCH] hwmon: (ibmpowernv) Fix label for cores numbers not
 threads
From: Michael Neuling <mikey@neuling.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Guenter Roeck
	 <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
Date: Wed, 14 Sep 2016 11:14:36 +1000
In-Reply-To: <f5dfed7e-9d43-42b9-fd44-baf0fafacdbc@kaod.org>
References: <1473745661-11890-1-git-send-email-mikey@neuling.org>
	 <f5dfed7e-9d43-42b9-fd44-baf0fafacdbc@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


> > Signed-off-by: Michael Neuling <mikey@neuling.org>
> Yes. This looks better. The DTS are related to the core so we don't=C2=A0
> really care about the threads.
>=20
> Acked-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks

>=20
> Side question, should we use the Physical ID and not the Linux=C2=A0
> logical one ? I don't know if it is exposed elsewhere in user space.

Yeah Linux logical is what the user sees for sysfs interfaces, /proc/cpuinf=
o,
taskset etc so that makes more sense than physical.

Mikey
