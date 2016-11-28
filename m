Return-path: <john@jmuir.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 1/3] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
From: John Muir <john@jmuir.com>
In-Reply-To: <20161128221916.GA13689@roeck-us.net>
Date: Mon, 28 Nov 2016 15:10:38 -0800
Cc: Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux List <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1398C020-EF5A-42F2-8A1A-7F6782DC3E4A@jmuir.com>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
 <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
 <20161128195825.GA10709@roeck-us.net>
 <BA794672-F2A5-4C18-96B2-7BEA53ECECCD@jmuir.com>
 <20161128221916.GA13689@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Nov 28, 2016, at 2:19 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> The tmp102 driver adds the timeout if the device was in shutdown mode =
(SD=3D1).
>=20
> 	if (tmp102->config_orig & TMP102_CONF_SD) {
> 		...
> 		tmp102->ready_time +=3D =
msecs_to_jiffies(CONVERSION_TIME_MS);
> 	}
>=20
> Your code adds the timeout if the device was in continuous operation =
mode (M1=3D1).
>=20
> 	if ((tmp108->config & TMP108_CONF_MODE_MASK)
> 	    =3D=3D TMP108_MODE_CONTINUOUS) {
> 		tmp108->ready_time +=3D
> 		msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
> 	}
>=20
> Unless I am missing something, that is exactly the opposite.

Note that the TMP102 code is looking at =E2=80=98config_orig=E2=80=99 =
which was the initial device state, whereas in my proposed driver the =
code looks at the current configuration.

The update_ready_time function was only intended to be called AFTER the =
device has moved to a new mode. For the probe case I simply ignored the =
fact that it was already in continuous mode at startup and lazily =
re-used the update_ready_time function causing the code to run through a =
few extra instructions. I was attempting to re-use the logic in multiple =
cases.

I=E2=80=99ll update the code in my next patch series and you can =
re-review.

> Side note: Per datasheet, M0 is irrelevant if M1=3D1. The above check =
does not
> match M1=3D1, M0=3D1, but that condition would still reflect =
continuous mode.
>=20

OK. Noted.

Thanks,

John.
