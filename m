Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544472;
	b=UQmZ0dZwxPB+kpQS9EYyUBhD7l4ewpe3SbDA43BmYIW3yyUNvDenHIqy3+RfgW/+MqFC
	 72VZ2UYo9WxQJgOTfVF7gfycS81oWW/JJoqebySBBAJ+XrLnMgx8edRrlxpdlFQfaYHED
	 +WtjrSjsqMCxs3SyiVLz3qGeFMmQtnkIB+vz3XYZkw5GeTmRh6btt3mw4bgPR5WbeA3zM
	 ZAFOi2fF4MvmZBIKHy64pT3e0ct0wlZ4Y8vGQwtpS+PYn1b9HOm167oqp+U5WYnyZa5rf
	 sHZ5Ma/gWc9c/ImA1YZWtz/OC+nhnGdbSKp5F5uhoF33Szn6buKW/v6W8A+uYgAbCUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544472;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Bfo4UtbB8XY/1iuWOEzIo7XtIFhZAa/dRMiAZLc5Jjk=;
	b=JUc+n/g5rfnSpxw2ggmQuiaWkr0/Fyk0ZfQJy9LAVBdlHOhgoZDmU6hGsDKkayImeN3x
	 fFdbMG1xprMBydyhPWLcmU1BfGBgGtLMpgdpB64GINyuFw3gcW6wG3+lEQzlgZ6KfZ8A0
	 WbaT4Y422CBitvIqH2IHXYvMpb7TgHdlaJzw6LQy1QpkHZlN6R8fh0OJaC9p1jnp23MKv
	 uk/iVX6xKReDAJlS5+lF94HWibxU3oeJBlrDZJq8JDkWV1BWtUlB5SOgkVxMckfAG4diE
	 p0R0QHcfokpO3uv2xztEQxW/Q1428sUTyloamZzj1JyJnUv4N64KdJO2bGVr/UX9bdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=e0rIPHZP;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EA2606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 14:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28EA2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=e0rIPHZP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793544456; x=1794149256; i=w_armin@gmx.de;
	bh=Bfo4UtbB8XY/1iuWOEzIo7XtIFhZAa/dRMiAZLc5Jjk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=e0rIPHZP/CLewK+Swm1NGQZTuMmr0kZh4MVazQswMDAUAP9PpI1ntlgFZQqJETlu
	 eb37gMctcDWk23p+nHUuU9mqQcQm5LKpFROK+NG8wkZCWnWrDw+CmgoS3sNskePqY
	 11WgKXBsYAClhfziSHrS1Q+jm/e4GPOL1iuqXZc9JWCbUfetL9RoD50OgHy5sCHL6
	 GitVJsMPy0jjIkAbSNbto9GPqZJICy0iiO6bisR+ZXFETBBnZ00iu9igT4jy89k2K
	 5Dkobc/50VJe/NS++5b3A84Jh/KSwX98V29ynRpAqKtBRfob8BXV6pBmsIVQu0VkR
	 sQL0wzU7wTwY0JLO6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1wNlE11zf7-0107Ot; Sun, 01
 Nov 2026 15:47:36 +0100
Message-ID: <88d6dda7-49d1-4b58-a166-98e6e0c60d03@gmx.de>
Date: Sun, 1 Nov 2026 15:47:35 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: LIght JUNction <lightjunction.me@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de>
 <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
 <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
 <dae6828e-2da3-441f-bc5e-a273819f7499@gmx.de>
 <CAOD9jOMcc78EK_HhkTMVGTihhVOLU1O=i0jh_R-C4SH=Gv8GzA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAOD9jOMcc78EK_HhkTMVGTihhVOLU1O=i0jh_R-C4SH=Gv8GzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dla1CXTlRLloUoB89NZ1t8HsbsRNBhTiyq1yXf1R/HxkBls2Wtr
 kPllRTxCP9C80Mya1bjkSUjSFDelhEm+D5MePTRGnNqyubH5zH4FxGCtZ71PMePNgaO4cNb
 6gNwecRCjLS46MiR+nh0yPimv9gaSeHn7ICN+QDzGQJB1D4oTzNFDm28nKaTeAv1ef0CIRI
 5d49PSFG9ly3vNXPjMoTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FTnbV7FWOsA=;DptCn+h7hZNDc7dr7ra3r3Cn5qa
 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
 zOJJRKy+4LHT+WBwBB0ucidOXKccRwr9cvynQ==

Am 30.10.26 um 21:44 schrieb LIght JUNction:

> Hi Armin,
>
> I added 0x046D to the read-only ECRR probe and sampled it 10 times on=20
> the GM6PX0X. With 0x046C as the high byte, 0x046D produced 4934=E2=80=93=
4979=20
> RPM; the verified 0x046B path produced 4994 RPM in the same samples.=20
> So 0x046D also gives plausible fan-speed readings, but the values=20
> differ. This does not establish which offset is correct; I can only=20
> confirm that 0x046B matches the existing sensor readings on this machine=
.
>
Interesting, on my machine register 0x046B always returns 0x0F, so it seem=
s that only some models
report values values inside this new register. Because of this i suggest t=
hat we use register 0x046D
for now.

> I still won't load uniwill_laptop with force=3D1 on this running system.=
=20
> The probe writes several EC settings, including CTGP, lightbar and=20
> keyboard-backlight state, and I have no complete way to snapshot and=20
> restore them. I have not tested whether a cold boot reinitializes all=20
> of those settings, so I can't rely on that as a recovery method.
>
Can you share the output of acpidump and dmidecode? I can then provide you=
 with a patch that only enables
a subset of known safe features on your device. Because i am very against =
having a second driver using
the exact same hardware interface as the uniwill-laptop driver, so this pa=
tch will not fly with me.

Thanks,
Armin Wolf

> Thanks,
> LIghtJUNction
>
> On Sat, Oct 31, 2026 at 2:42=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>
>     Am 30.10.26 um 10:16 schrieb LIght JUNction:
>     > Hi Armin,
>     >
>     > One clarification: I won't load uniwill_laptop with force=3D1 on t=
his
>     > machine. The force path enables nearly every feature. Probe sets E=
C
>     > 0x0741 bit 0, initializes CTGP at 0x0743-0x0746, modifies the
>     lightbar
>     > registers, and writes keyboard-backlight settings, including
>     enabling
>     > China mode and clearing KBD_POWER_OFF.
>     >
>     > On unload, the driver clears the bit at 0x0741, but it does not
>     > restore the CTGP, lightbar, or keyboard-backlight values. The
>     > installed tuxedo_nb02_nvidia_power_ctrl exposes only ctgp_offset
>     here,
>     > so I cannot snapshot and restore the other values. Its GM6PX0X pat=
h
>     > also deliberately preserves the firmware power configuration.
>
>     Those settings should be reinitialized by the EC during a cold boot.
>
>     Thanks,
>     Armin Wolf
>
>     > I therefore cannot verify force=3D1 safely on this running system.
>     This
>     > remains a source-level assessment; I have not loaded the driver wi=
th
>     > force=3D1.
>     >
>     > Thanks,
>     > LIghtJUNction
>     >
>     > On Fri, 30 Oct 2026 03:54:55 -0500, LIght JUNction
>     > <lightjunction.me@gmail.com> wrote:
>     >> Hi Armin,
>     >>
>     >> I checked the in-tree uniwill_laptop driver and its force path.
>     I have not loaded it with force=3D1 on the GM6PX0X. For an
>     unsupported DMI entry, force enables all features except the
>     battery charge limit. Probe sets EC 0x0741 bit 0 and initializes
>     NVIDIA CTGP, writing 0 to the CTGP offset at 0x0744. The current
>     ctgp_offset here is 25, so this would overwrite the active value.
>     >>
>     >> The sensor map is a partial match: CPU/GPU temperatures and the
>     primary fan address match. The secondary fan low byte differs:
>     uniwill_laptop uses 0x046D; the verified GM6PX0X map uses 0x046B.
>     The generic driver also reads the fan bytes without the
>     high/low/high check in my patch.
>     >>
>     >> I can't confirm full operation with force=3D1 on this model. A
>     sensor-only test path without those EC writes would be needed to
>     verify it.
>     >>
>     >> Thanks,
>     >> LIghtJUNction
>     >>
>     >> On Fri, 30 Oct 2026 08:37:43 +0100, Armin Wolf <W_Armin@gmx.de>
>     wrote:
>     >>> Am 29.10.26 um 21:35 schrieb LIght JUNction:
>     >>>> From: LIghtJUNction <lightjunction.me@gmail.com>
>     >>>>
>     >>>> The GM6PX0X firmware exposes CPU and GPU temperatures and fan
>     speeds
>     >>>> through the INOU.ECRR ACPI method. Add a read-only hwmon
>     driver for
>     >>>> these sensors, scoped to the verified MECHREVO Kuangshi16Pro
>     GM6PX0X,
>     >>>> board GM6PX0X, and BIOS N.1.09MRO07.
>     >>>>
>     >>>> The driver checks the firmware project ID and fan capability
>     before
>     >>>> registering the device. It uses only ECRR reads and exposes
>     standard
>     >>>> hwmon temperature and fan input attributes. It does not write E=
C
>     >>>> registers or expose fan controls. Fan counters are sampled
>     high/low/high
>     >>>> to reject a high-byte rollover.
>     >>>>
>     >>>> Tested on MECHREVO Kuangshi16Pro Series GM6PX0X, board
>     GM6PX0X, BIOS
>     >>>> N.1.09MRO07, running 7.2.11-arch1-1: the module built with
>     W=3D1, loaded
>     >>>> beside the installed sensor module, provided all four
>     readings, and
>     >>>> unloaded without removing the existing module. Other systems
>     and BIOS
>     >>>> versions have not been tested.
>     >>>
>     >>> Hi,
>     >>>
>     >>> can you check if the uniwill-laptop driver works by loading it
>     with the
>     >>> force module option being set to 1?
>     >>>
>     >>> Thanks,
>     >>> Armin Wolf
>     >>>
>     >>>> Assisted-by: Codex:GPT-6
>     >>>> Signed-off-by: LIghtJUNction <lightjunction.me@gmail.com>
>     >>>> ---
>     >>>> AI assistance: Codex was used to draft the read-only driver,
>     its Kconfig
>     >>>> and Makefile integration, documentation, and commit message.
>     The request
>     >>>> was to prepare a hwmon submission for the locally verified
>     GM6PX0X using
>     >>>> the firmware read interface and no EC writes.
>     >>>>
>     >>>> Validation is limited to an external-module W=3D1 build and
>     runtime reads on
>     >>>> the laptop and BIOS listed above; no full kernel-tree build
>     was performed.
>     >>>> checkpatch --strict reports no errors and one advisory about
>     a new
>     >>>> MAINTAINERS entry. The general HWMON entry covers these paths.
>     >>>>
>     >>>>=C2=A0 =C2=A0 Documentation/hwmon/index.rst=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +
>     >>>>=C2=A0 =C2=A0 Documentation/hwmon/mechrevo-ec.rst |=C2=A0 31 +++
>     >>>>=C2=A0 =C2=A0 drivers/hwmon/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 ++
>     >>>>=C2=A0 =C2=A0 drivers/hwmon/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +
>     >>>>=C2=A0 =C2=A0 drivers/hwmon/mechrevo-ec.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 290
>     ++++++++++++++++++++++++++++
>     >>>>=C2=A0 =C2=A0 5 files changed, 334 insertions(+)
>     >>>>=C2=A0 =C2=A0 create mode 100644 Documentation/hwmon/mechrevo-ec=
.rst
>     >>>>=C2=A0 =C2=A0 create mode 100644 drivers/hwmon/mechrevo-ec.c
>     >>>>
>     >>>> diff --git a/Documentation/hwmon/index.rst
>     b/Documentation/hwmon/index.rst
>     >>>> index 199ca79..6bd4ece 100644
>     >>>> --- a/Documentation/hwmon/index.rst
>     >>>> +++ b/Documentation/hwmon/index.rst
>     >>>> @@ -189,6 +189,7 @@ Hardware Monitoring Kernel Drivers
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0mc34vr500
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0mcp3021
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0mcp9982
>     >>>> +=C2=A0 =C2=A0mechrevo-ec
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0menf21bmc
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0minisforum-um780xtx
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0mlxreg-fan
>     >>>> diff --git a/Documentation/hwmon/mechrevo-ec.rst
>     >>>> b/Documentation/hwmon/mechrevo-ec.rst
>     >>>> new file mode 100644
>     >>>> index 0000000..91ffd77
>     >>>> --- /dev/null
>     >>>> +++ b/Documentation/hwmon/mechrevo-ec.rst
>     >>>> @@ -0,0 +1,31 @@
>     >>>> +.. SPDX-License-Identifier: GPL-2.0
>     >>>> +
>     >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>     >>>> +MECHREVO GM6PX0X EC
>     >>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>     >>>> +
>     >>>> +Supported systems:
>     >>>> +
>     >>>> +=C2=A0 * MECHREVO Kuangshi16Pro Series GM6PX0X, board GM6PX0X
>     >>>> +=C2=A0 * BIOS N.1.09MRO07
>     >>>> +
>     >>>> +The driver exposes two EC temperatures and two fan speeds
>     through hwmon. It
>     >>>> +uses the firmware ACPI method ``\_SB.INOU.ECRR`` to read EC
>     bytes. Temperatures
>     >>>> +are reported in millidegrees Celsius and fan speeds in RPM.
>     The CPU and GPU
>     >>>> +temperature bytes are at ``0x043e`` and ``0x044f``. The
>     16-bit CPU and GPU fan
>     >>>> +counters use high/low bytes at ``0x0464``/``0x0465`` and
>     ``0x046c``/``0x046b``,
>     >>>> +respectively.
>     >>>> +
>     >>>> +Each successful ECRR read is followed by a 6 to 12 ms delay.
>     Fan reads sample
>     >>>> +the high byte before and after the low byte and retry up to
>     three times if the
>     >>>> +high byte changes. The EC updates independently, so the
>     driver cannot provide
>     >>>> +an atomic snapshot of the two bytes.
>     >>>> +
>     >>>> +At probe, the driver checks EC project ID ``0x10`` at
>     ``0x0740`` and bit 6 of
>     >>>> +the capability byte at ``0x078e``. It only binds the exact
>     DMI identity and
>     >>>> +BIOS version listed above. Other models and BIOS versions
>     have not been
>     >>>> +validated.
>     >>>> +
>     >>>> +The driver is read-only. It does not call the firmware write
>     method, change EC
>     >>>> +configuration, or expose fan-control attributes. Values
>     above 125 degrees C
>     >>>> +are reported as unavailable; zero is passed through as read
>     from firmware.
>     >>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>     >>>> index 18c682e..7e397c2 100644
>     >>>> --- a/drivers/hwmon/Kconfig
>     >>>> +++ b/drivers/hwmon/Kconfig
>     >>>> @@ -2888,6 +2888,17 @@ config SENSORS_HP_WMI
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can=
 also be built as a module. If
>     so, the module
>     >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be called =
hp_wmi_sensors.
>     >>>>
>     >>>> +config SENSORS_MECHREVO_EC
>     >>>> +=C2=A0 tristate "MECHREVO GM6PX0X EC sensors"
>     >>>> +=C2=A0 depends on X86 && ACPI
>     >>>> +=C2=A0 help
>     >>>> +=C2=A0 =C2=A0 If you say yes here you get read-only temperatur=
e and
>     fan speed
>     >>>> +=C2=A0 =C2=A0 monitoring for the MECHREVO Kuangshi16Pro Series=
 GM6PX0X
>     with BIOS
>     >>>> +=C2=A0 =C2=A0 N.1.09MRO07, using its firmware ACPI method.
>     >>>> +
>     >>>> +=C2=A0 =C2=A0 This driver can also be built as a module. If so=
, the module
>     >>>> +=C2=A0 =C2=A0 will be called mechrevo_ec.
>     >>>> +
>     >>>>=C2=A0 =C2=A0 endif # ACPI
>     >>>>
>     >>>>=C2=A0 =C2=A0 endif # HWMON
>     >>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>     >>>> index d4c345e..ac362a1 100644
>     >>>> --- a/drivers/hwmon/Makefile
>     >>>> +++ b/drivers/hwmon/Makefile
>     >>>> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ASUS_EC)=C2=A0 =C2=A0 +=
=3D
>     asus-ec-sensors.o
>     >>>>=C2=A0 =C2=A0 obj-$(CONFIG_SENSORS_ASUS_WMI)=C2=A0 +=3D asus_wmi=
_sensors.o
>     >>>>=C2=A0 =C2=A0 obj-$(CONFIG_SENSORS_HONOR_FMI) +=3D honor-fmi.o
>     >>>>=C2=A0 =C2=A0 obj-$(CONFIG_SENSORS_HP_WMI)=C2=A0 =C2=A0 +=3D hp-=
wmi-sensors.o
>     >>>> +obj-$(CONFIG_SENSORS_MECHREVO_EC) +=3D mechrevo-ec.o
>     >>>>
>     >>>>=C2=A0 =C2=A0 # Native drivers
>     >>>>=C2=A0 =C2=A0 # asb100, then w83781d go first, as they can overr=
ide
>     other drivers' addresses.
>     >>>> diff --git a/drivers/hwmon/mechrevo-ec.c
>     b/drivers/hwmon/mechrevo-ec.c
>     >>>> new file mode 100644
>     >>>> index 0000000..d4a3430
>     >>>> --- /dev/null
>     >>>> +++ b/drivers/hwmon/mechrevo-ec.c
>     >>>> @@ -0,0 +1,290 @@
>     >>>> +// SPDX-License-Identifier: GPL-2.0+
>     >>>> +/* Read-only hwmon driver for the MECHREVO Kuangshi16Pro
>     GM6PX0X. */
>     >>>> +
>     >>>> +#include <linux/acpi.h>
>     >>>> +#include <linux/delay.h>
>     >>>> +#include <linux/dmi.h>
>     >>>> +#include <linux/err.h>
>     >>>> +#include <linux/hwmon.h>
>     >>>> +#include <linux/module.h>
>     >>>> +#include <linux/mutex.h>
>     >>>> +#include <linux/platform_device.h>
>     >>>> +#include <linux/slab.h>
>     >>>> +
>     >>>> +#define MECHREVO_ECRR_DELAY_MIN_US 6000
>     >>>> +#define MECHREVO_ECRR_DELAY_MAX_US 12000
>     >>>> +#define MECHREVO_RPM_ATTEMPTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A03
>     >>>> +
>     >>>> +struct mechrevo_ec_data {
>     >>>> +=C2=A0 acpi_handle inou;
>     >>>> +=C2=A0 /* Serialize the three ECRR calls that make up one fan
>     sample. */
>     >>>> +=C2=A0 struct mutex rpm_lock;
>     >>>> +};
>     >>>> +
>     >>>> +static const struct dmi_system_id mechrevo_ec_dmi_table[] =3D =
{
>     >>>> +=C2=A0 {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
>     >>>> + DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
>     >>>> + DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
>     >>>> + "Kuangshi16Pro Series GM6PX0X"),
>     >>>> + DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6PX0X"),
>     >>>> + DMI_EXACT_MATCH(DMI_BIOS_VERSION, "N.1.09MRO07"),
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>     >>>> +=C2=A0 },
>     >>>> +=C2=A0 {}
>     >>>> +};
>     >>>> +MODULE_DEVICE_TABLE(dmi, mechrevo_ec_dmi_table);
>     >>>> +
>     >>>> +static int mechrevo_ec_read_byte(struct mechrevo_ec_data
>     *data, u16 address,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *value)
>     >>>> +{
>     >>>> +=C2=A0 union acpi_object argument =3D {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .integer.type =3D ACPI_TYPE=
_INTEGER,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .integer.value =3D address,
>     >>>> +=C2=A0 };
>     >>>> +=C2=A0 struct acpi_object_list arguments =3D {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .count =3D 1,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pointer =3D &argument,
>     >>>> +=C2=A0 };
>     >>>> +=C2=A0 unsigned long long raw;
>     >>>> +=C2=A0 acpi_status status;
>     >>>> +
>     >>>> +=C2=A0 status =3D acpi_evaluate_integer(data->inou, "ECRR",
>     &arguments, &raw);
>     >>>> +=C2=A0 if (ACPI_FAILURE(status))
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>     >>>> +
>     >>>> +=C2=A0 /* Match the delay used by the in-tree Uniwill ECRR
>     transport. */
>     >>>> +=C2=A0 usleep_range(MECHREVO_ECRR_DELAY_MIN_US,
>     MECHREVO_ECRR_DELAY_MAX_US);
>     >>>> +=C2=A0 if (raw > 255)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ERANGE;
>     >>>> +
>     >>>> +=C2=A0 *value =3D raw;
>     >>>> +=C2=A0 return 0;
>     >>>> +}
>     >>>> +
>     >>>> +static int mechrevo_ec_read_temp(struct mechrevo_ec_data
>     *data, int channel,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long *value)
>     >>>> +{
>     >>>> +=C2=A0 u16 address;
>     >>>> +=C2=A0 u8 raw;
>     >>>> +=C2=A0 int ret;
>     >>>> +
>     >>>> +=C2=A0 switch (channel) {
>     >>>> +=C2=A0 case 0:
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address =3D 0x043e;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     >>>> +=C2=A0 case 1:
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address =3D 0x044f;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     >>>> +=C2=A0 default:
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOPNOTSUPP;
>     >>>> +=C2=A0 }
>     >>>> +
>     >>>> +=C2=A0 ret =3D mechrevo_ec_read_byte(data, address, &raw);
>     >>>> +=C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>     >>>> +=C2=A0 if (raw > 125)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODATA;
>     >>>> +
>     >>>> +=C2=A0 *value =3D raw * 1000;
>     >>>> +=C2=A0 return 0;
>     >>>> +}
>     >>>> +
>     >>>> +static int mechrevo_ec_read_fan(struct mechrevo_ec_data
>     *data, int channel,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long *value)
>     >>>> +{
>     >>>> +=C2=A0 u16 high_address, low_address;
>     >>>> +=C2=A0 u8 high, low, check;
>     >>>> +=C2=A0 int attempt, ret;
>     >>>> +
>     >>>> +=C2=A0 switch (channel) {
>     >>>> +=C2=A0 case 0:
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 high_address =3D 0x0464;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 low_address =3D 0x0465;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     >>>> +=C2=A0 case 1:
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 high_address =3D 0x046c;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 low_address =3D 0x046b;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     >>>> +=C2=A0 default:
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOPNOTSUPP;
>     >>>> +=C2=A0 }
>     >>>> +
>     >>>> +=C2=A0 /* The EC can update between byte reads; reject a
>     high-byte rollover. */
>     >>>> +=C2=A0 mutex_lock(&data->rpm_lock);
>     >>>> +=C2=A0 for (attempt =3D 0; attempt < MECHREVO_RPM_ATTEMPTS;
>     attempt++) {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mechrevo_ec_read_by=
te(data, high_address,
>     &high);
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto out_unlock;
>     >>>> +
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mechrevo_ec_read_by=
te(data, low_address, &low);
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto out_unlock;
>     >>>> +
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mechrevo_ec_read_by=
te(data, high_address,
>     &check);
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto out_unlock;
>     >>>> +
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (high =3D=3D check) {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 *value =3D ((long)high << 8) | low;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret =3D 0;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto out_unlock;
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     >>>> +=C2=A0 }
>     >>>> +=C2=A0 ret =3D -EAGAIN;
>     >>>> +
>     >>>> +out_unlock:
>     >>>> +=C2=A0 mutex_unlock(&data->rpm_lock);
>     >>>> +=C2=A0 return ret;
>     >>>> +}
>     >>>> +
>     >>>> +static umode_t mechrevo_ec_is_visible(const void *data,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum hwmon_sensor_types =
type,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 attr, int channel)
>     >>>> +{
>     >>>> +=C2=A0 if (channel < 0 || channel > 1)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>     >>>> +
>     >>>> +=C2=A0 if (type =3D=3D hwmon_temp)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return attr =3D=3D hwmon_te=
mp_input || attr =3D=3D
>     hwmon_temp_label ? 0444 : 0;
>     >>>> +=C2=A0 if (type =3D=3D hwmon_fan)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return attr =3D=3D hwmon_fa=
n_input || attr =3D=3D
>     hwmon_fan_label ? 0444 : 0;
>     >>>> +
>     >>>> +=C2=A0 return 0;
>     >>>> +}
>     >>>> +
>     >>>> +static int mechrevo_ec_read(struct device *dev, enum
>     hwmon_sensor_types type,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 u32 attr, int channel, long *value)
>     >>>> +{
>     >>>> +=C2=A0 struct mechrevo_ec_data *data =3D dev_get_drvdata(dev);
>     >>>> +
>     >>>> +=C2=A0 if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_in=
put)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mechrevo_ec_read_tem=
p(data, channel, value);
>     >>>> +=C2=A0 if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_inpu=
t)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mechrevo_ec_read_fan=
(data, channel, value);
>     >>>> +
>     >>>> +=C2=A0 return -EOPNOTSUPP;
>     >>>> +}
>     >>>> +
>     >>>> +static int mechrevo_ec_read_string(struct device *dev,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum hwmon_sensor_types type,
>     u32 attr,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int channel, const char **value)
>     >>>> +{
>     >>>> +=C2=A0 if (channel < 0 || channel > 1)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOPNOTSUPP;
>     >>>> +
>     >>>> +=C2=A0 if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_la=
bel)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D channel ? "GPU E=
C" : "CPU EC";
>     >>>> +=C2=A0 else if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan=
_label)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D channel ? "GPU f=
an" : "CPU fan";
>     >>>> +=C2=A0 else
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOPNOTSUPP;
>     >>>> +
>     >>>> +=C2=A0 return 0;
>     >>>> +}
>     >>>> +
>     >>>> +static const struct hwmon_ops mechrevo_ec_hwmon_ops =3D {
>     >>>> +=C2=A0 .is_visible =3D mechrevo_ec_is_visible,
>     >>>> +=C2=A0 .read =3D mechrevo_ec_read,
>     >>>> +=C2=A0 .read_string =3D mechrevo_ec_read_string,
>     >>>> +};
>     >>>> +
>     >>>> +static const struct hwmon_channel_info * const
>     mechrevo_ec_hwmon_info[] =3D {
>     >>>> +=C2=A0 HWMON_CHANNEL_INFO(temp,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HWMON_T_INPUT | HWMON_T_LABEL,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HWMON_T_INPUT | HWMON_T_LABEL),
>     >>>> +=C2=A0 HWMON_CHANNEL_INFO(fan,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HWMON_F_INPUT | HWMON_F_LABEL,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0HWMON_F_INPUT | HWMON_F_LABEL),
>     >>>> +=C2=A0 NULL
>     >>>> +};
>     >>>> +
>     >>>> +static const struct hwmon_chip_info mechrevo_ec_chip_info =3D =
{
>     >>>> +=C2=A0 .ops =3D &mechrevo_ec_hwmon_ops,
>     >>>> +=C2=A0 .info =3D mechrevo_ec_hwmon_info,
>     >>>> +};
>     >>>> +
>     >>>> +static int mechrevo_ec_probe(struct platform_device *pdev)
>     >>>> +{
>     >>>> +=C2=A0 struct mechrevo_ec_data *data;
>     >>>> +=C2=A0 struct device *hwmon_dev;
>     >>>> +=C2=A0 u8 project, capability;
>     >>>> +=C2=A0 acpi_status status;
>     >>>> +=C2=A0 int ret;
>     >>>> +
>     >>>> +=C2=A0 if (!dmi_check_system(mechrevo_ec_dmi_table))
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>     >>>> +
>     >>>> +=C2=A0 data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KE=
RNEL);
>     >>>> +=C2=A0 if (!data)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
>     >>>> +
>     >>>> +=C2=A0 mutex_init(&data->rpm_lock);
>     >>>> +=C2=A0 status =3D acpi_get_handle(NULL, "\\_SB.INOU", &data->i=
nou);
>     >>>> +=C2=A0 if (ACPI_FAILURE(status) || !acpi_has_method(data->inou=
,
>     "ECRR"))
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dev_err_probe(&pdev-=
>dev, -ENODEV,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"missing INOU.ECRR method=
\n");
>     >>>> +
>     >>>> +=C2=A0 ret =3D mechrevo_ec_read_byte(data, 0x0740, &project);
>     >>>> +=C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dev_err_probe(&pdev-=
>dev, ret,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"failed to read EC projec=
t
>     ID\n");
>     >>>> +=C2=A0 ret =3D mechrevo_ec_read_byte(data, 0x078e, &capability=
);
>     >>>> +=C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dev_err_probe(&pdev-=
>dev, ret,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"failed to read EC fan
>     capability\n");
>     >>>> +=C2=A0 if (project !=3D 0x10 || !(capability & 0x40))
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dev_err_probe(&pdev-=
>dev, -ENODEV,
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"unsupported EC project o=
r
>     fan layout\n");
>     >>>> +
>     >>>> +=C2=A0 platform_set_drvdata(pdev, data);
>     >>>> +=C2=A0 hwmon_dev =3D
>     devm_hwmon_device_register_with_info(&pdev->dev, "mechrevo",
>     >>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0data,
>     >>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0&mechrevo_ec_chip_info,
>     >>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);
>     >>>> +=C2=A0 return PTR_ERR_OR_ZERO(hwmon_dev);
>     >>>> +}
>     >>>> +
>     >>>> +static struct platform_driver mechrevo_ec_driver =3D {
>     >>>> +=C2=A0 .probe =3D mechrevo_ec_probe,
>     >>>> +=C2=A0 .driver =3D {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "mechrevo-ec-hwmo=
n",
>     >>>> +=C2=A0 },
>     >>>> +};
>     >>>> +
>     >>>> +static struct platform_device *mechrevo_ec_device;
>     >>>> +
>     >>>> +static int __init mechrevo_ec_init(void)
>     >>>> +{
>     >>>> +=C2=A0 int ret;
>     >>>> +
>     >>>> +=C2=A0 if (!dmi_check_system(mechrevo_ec_dmi_table))
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>     >>>> +
>     >>>> +=C2=A0 ret =3D platform_driver_register(&mechrevo_ec_driver);
>     >>>> +=C2=A0 if (ret)
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>     >>>> +
>     >>>> +=C2=A0 mechrevo_ec_device =3D
>     platform_device_register_simple("mechrevo-ec-hwmon",
>     >>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLATFORM_DEVID_NONE,
>     >>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0);
>     >>>> +=C2=A0 if (IS_ERR(mechrevo_ec_device)) {
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(mechrevo_ec=
_device);
>     >>>> + platform_driver_unregister(&mechrevo_ec_driver);
>     >>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>     >>>> +=C2=A0 }
>     >>>> +
>     >>>> +=C2=A0 return 0;
>     >>>> +}
>     >>>> +
>     >>>> +static void __exit mechrevo_ec_exit(void)
>     >>>> +{
>     >>>> + platform_device_unregister(mechrevo_ec_device);
>     >>>> + platform_driver_unregister(&mechrevo_ec_driver);
>     >>>> +}
>     >>>> +
>     >>>> +module_init(mechrevo_ec_init);
>     >>>> +module_exit(mechrevo_ec_exit);
>     >>>> +
>     >>>> +MODULE_DESCRIPTION("MECHREVO GM6PX0X EC hwmon driver");
>     >>>> +MODULE_LICENSE("GPL");
>     >
>
