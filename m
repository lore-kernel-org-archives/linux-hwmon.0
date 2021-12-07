Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5D7C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Dec 2021 22:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241957AbhLGWGd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Dec 2021 17:06:33 -0500
Received: from mout.gmx.net ([212.227.15.19]:59779 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237203AbhLGWGc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Dec 2021 17:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638914580;
        bh=y54+VU2zygeqhyH8Pthk1iibPYr3Fcnz4wYDf79PLd8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=P1uDoygyCQdug5temfInbnzPEwzUGWit84RhOGP1NsWh0K+iRYDuG7YamJ42q2lal
         a7NIsWl4N3tFu4X1g671HzY8cKiMPl+FZQYit26Iwl4s61R+aLrdAZ84t2ClkDb6ck
         faMlImOkfjyZ3MPM5K9GYFG8fQFQMHSIww4WxLbk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.100.20] ([46.142.32.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3W0-1n8OLq22gg-00LT5u for
 <linux-hwmon@vger.kernel.org>; Tue, 07 Dec 2021 23:03:00 +0100
Message-ID: <75c5760c-ca24-27ef-45e9-5e0234142438@gmx.de>
Date:   Tue, 7 Dec 2021 23:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: de-DE
From:   Ronald Warsow <rwarsow@gmx.de>
To:     linux-hwmon@vger.kernel.org
Subject: support for an "ROG STRIX B560-G GAMING WIFI" ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G2WKRsWH4rsHryWPHIviEgjFptf5KCZwsHpaPr5BIVEzUAnlzDB
 qLvPleik6LTTngDddcgM7xL8500Gpq7iXuS0NpSJijhjQ8bpOV9CeSRYmxQ4/cCayEQDo1L
 PXR7eomZi9jxotcWY1ooBalsb7aXWCP8X6Dk3HrvNjyHUjQKrVqLaawki9OVgUkdtIlWXxG
 LQGJiGTwPcCO/tmye6wdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JiiWg/qzzJg=:HRcOAw/udBq9Y6bzm4+hqr
 H0skdOgB7WH53nLhASjphH8RrItAvRIJHDf7ZkvCCe/8PFjW8JMwPi8KT8PrAb0WwgzEu/Zyr
 KIdkdvBSR0VOKNRjq5ky/uNJEQTrFul/K8HF501zbKHNU4oPKT8duYfji8wyq5k4/6PX3OY9b
 7a5o/3RxzKgVvcxVBEUwAnsmuLf9rsCARjT8lbVlh8egLoRmN4i0hDUwGtS9aTKvSHnUkGmZn
 MprXzOtywL5r4nlgQdf4nepn3geUbwKiv5Tf/oSYRbs7f36uEnYrG2fTJxowxDG8ZwzQvJksp
 YVeJH+wgsTlP71fslgk9I3Uol4JFRxD3azgJQ/dxUpiEUN2hUKH84ynCACnM3rfUZTZ/yY74r
 cMUGccEFq9hEQ9kOQ9z3wYLFNRR9wUBZRKTa4j/I+JfAN2KSFy24CDxvw4KGi82D1qAu+MzuW
 qkK0u+xBTcEE/+q+Z0ksFSgOjFScSfoPXMsiqHluDh/0DCwKpYz29eaxZjcNHPXrSoaJqFltr
 foN6z0uy9Q8cw1rlBKJ+ExsE97VvZC4W7ozoH6k0kkq8mZfyH5hObt4eA9lgVKDTyz0Nz1ZOJ
 6K3I15uK2JSViQuS6hTTYID6Eh6MbSA10QnnsthkpISWTts3N3C6AGdG8ik+Tta4s41p2zIwi
 38+GAjjzI/Xr2/Y85MrcTk9LbfBsl+kX68zMSiCCjiNg1OjfPmF+ZFSvJlLstNA6wWJOKGo5u
 CDEUpGlHo9dNzWF9ozuKbqbPCyRBUjLwE/ym+AsrFp8h/BM7S3eZsd7ZKXK93lN/Ulih9XqSW
 8hdATK+FcVlo2Dg8806MaEHVZzd0lV6QvhHk3BLVj4pSAZG/ctUoBgJvOyGwJnAs9hhUVeZbw
 yYdse2lNls76BvnLtTCbgT0RUz3R4dUo8HRb3cgIxISw0xIQipVUDpt1dRu1rQBmRZbEtLUqB
 Uch8YwbBptjiCpQvksJPsiX37XU62VL2YoG2SmRX0Vv1IRlGa3oe9x8BI5qW+KzyNdkBaRMfD
 SLj7c7IViciR1kC1HoMqUjZ8GYEuj613HlQmoMHSMKLxtLPwv0BftQH4hkgGQ65a5P2rZuZuM
 mbfOjDbrAfkRbg=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hallo

is there a chance to get support for

Asus ROG STRIX B560-G GAMING WIFI

the board seems to be full (?) supported by "CPUID HWMonitor", but
currently not under linux.

see below
=3D=3D=3D=3D=3D=3D=3D=3D=3D

CPUID HWMonitor Report

=2D-----------------------------------------------------------------------=
-



Binaries

=2D-----------------------------------------------------------------------=
-



HWMonitor version	1.4.5.0



Monitoring

=2D-----------------------------------------------------------------------=
-



Mainboard Model		ROG STRIX B560-G GAMING WIFI (0x00000735 - 0x33ACB308)



LPCIO

=2D-----------------------------------------------------------------------=
-



LPCIO Vendor			Nuvoton

LPCIO Model			NCT6798D-R

LPCIO Vendor ID			0x5CA3

LPCIO Chip ID			0xD4

LPCIO Revision ID		0x2B

Config Mode I/O address		0x2E

Config Mode LDN			0xB

Config Mode registers

		00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F

	00	FF FF 00 FF FF FF FF 0B FF FF FF FF FF FF FF FF

	10	CF C3 FF 0C B8 FF FF FF FF FF 00 00 35 04 FF FF

	20	D4 2B FF 00 00 00 10 00 00 FF 58 06 20 30 00 F4

	30	01 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	40	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	50	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	60	02 90 0B 00 0A 00 FF FF FF FF FF FF FF FF FF FF

	70	00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

Register space			LPC, base address =3D 0x0290



Register space			PMIO, base address =3D 0x0A00





Hardware Monitors

=2D-----------------------------------------------------------------------=
-



Hardware monitor		Nuvoton NCT6796

	Voltage 7		0.61 Volts [0x4C] (VIN7)

	Voltage 8		0.66 Volts [0x52] (VIN8)

	Voltage 9		0.22 Volts [0x1C] (VIN9)

	Voltage 10		1.02 Volts [0x7F] (VIN10)

	Voltage 11		1.01 Volts [0x7E] (VIN11)

	Voltage 12		0.18 Volts [0x16] (VIN12)

	Voltage 13		1.18 Volts [0x93] (VIN13)

	Voltage 14		0.53 Volts [0x42] (VIN14)

	Voltage 15		1.69 Volts [0xD3] (VIN15)

	Voltage 16		0.18 Volts [0x16] (VIN16)

	Voltage 17		0.98 Volts [0x7A] (VIN17)

	Voltage 18		0.92 Volts [0x73] (VIN18)

	Temperature 0		27 degC (80 degF) [0x1B] (SYSTIN)

	Temperature 1		28 degC (81 degF) [0x37] (CPUTIN)

	Temperature 3		26 degC (78 degF) [0x1A] (TMPIN3)

	Temperature 5		27 degC (80 degF) [0x1B] (TMPIN5)

	Temperature 6		27 degC (80 degF) [0x1B] (TMPIN6)

	Temperature 8		23 degC (73 degF) [0x17] (TMPIN8)

	Temperature 12		103 degC (217 degF) [0x67] (AUXTIN0)

	Temperature 13		15 degC (59 degF) [0xF] (AUXTIN1)

	Temperature 14		23 degC (73 degF) [0x17] (AUXTIN2)

	Temperature 15		103 degC (217 degF) [0x67] (AUXTIN3)

	Temperature 16		30 degC (86 degF) [0x1E] (AUXTIN4)

	Fan 0			478 RPM [0x1DE] (SYSFANIN)

	Fan 1			390 RPM [0x186] (CPUFANIN)

	Fan 3			510 RPM [0x1FE] (AUXFANIN1)

	Fan 5			774 RPM [0x306] (AUXFANIN3)

Hardware registers

Register space			LPC, base address =3D 0x0290

bank 0

		00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F

	00	03 70 03 41 00 FF FF FF FF FF FF FF FF FF FF FF

	10	03 99 03 6F 03 99 03 CC 40 FF FF FF FF FF FF FF

	20	FF FF FF FF FF FF FF 1B 03 FF FF DA 00 00 00 00

	30	00 00 00 00 00 00 00 00 00 50 4B FF FF FF FF FF

	40	03 0E 10 FF FF 00 3F FF 2D FF FF 10 08 55 00 A3

	50	15 FF FF FF FF FF FF FF C1 FF FF FF FF 01 00 01

	60	A0 00 FF FF FF 01 00 FF FF FF FF FF FF FF FF FF

	70	00 0A 00 1B 00 1B 00 67 00 1B 00 67 00 29 00 FF

	80	FF FF FF FF FF 05 05 05 00 00 00 00 00 00 00 00

	90	0A 00 00 00 00 FD FD FD 0A 95 EF 80 FF 40 46 C4

	A0	0E FF 00 00 FF 00 00 FF 00 00 80 66 06 06 03 00

	B0	00 00 00 00 00 00 26 00 04 10 00 08 E0 FF 04 00

	C0	FF FF FF FF FF FF FF FF FF 0E 03 04 FF FF FF FF

	D0	05 05 05 05 00 00 00 00 00 00 00 00 FD FD FD FD

	E0	55 80 00 00 00 FF FF FF FF FF 00 00 00 00 00 00

	F0	00 00 00 00 00 00 00 FF 1C 00 22 1B CA FF FF FF

bank 4

		00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F

	00	00 29 00 00 00 00 00 00 00 00 00 00 00 FF FF FF

	10	FF FF FF FF FF FF FF FF FF 00 00 FF FF FF FF FF

	20	FF FF FF 96 64 96 64 E1 96 00 FF FF FF FF FF FF

	30	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	40	FF 09 00 00 FF 00 FF FF FF FF 00 00 00 00 04 FF

	50	03 FB FF FF 00 00 00 FF FF 0E 03 33 09 00 FF FF

	60	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	70	6E 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	80	4E 7E D4 D4 7F 73 16 D4 C8 42 4C 42 93 1C 16 7A

	90	1B 1B 67 0F 17 67 1E 26 40 1B 1B 67 1B 67 00 29

	A0	67 1B FF FF FF FF 70 41 00 6F 00 00 00 00 00 00

	B0	58 00 6B 19 FF 1F 52 14 FF 1F 35 18 00 CC 00 00

	C0	01 DF 01 87 00 00 01 FE 00 00 03 10 FF 1F 00 00

	D0	00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF

	E0	70 41 99 6F 99 CC FF FF FF FF FF FF FF FF FF FF

	F0	1A 80 00 00 1B 00 01 00 50 00 51 00 00 00 00 FF



Hardware monitor		Nuvoton NCT6791D

	Voltage 0		5.04 Volts [0x7E] (+5V)

	Voltage 1		3.38 Volts [0xD3] (+3.3V)

	Voltage 2		12.19 Volts [0x7F] (+12V)

	Voltage 3		0.53 Volts [0x42] (VIN3)

	Voltage 4		0.35 Volts [0x16] (VIN4)

	Voltage 5		0.73 Volts [0x52] (VCORE)

	Voltage 6		1.18 Volts [0x93] (VIN6)

	Voltage 7		0.45 Volts [0x1C] (VIN7)

	Temperature 0		27 degC (80 degF) [0x1B] (Mainboard)

	Temperature 1		26 degC (78 degF) [0x1A] (CPU)

	Temperature 2		27 degC (80 degF) [0x1B] (TMPIN2)

	Temperature 3		27 degC (80 degF) [0x1B] (TMPIN3)

	Temperature 4		103 degC (217 degF) [0x67] (TMPIN4)

	Temperature 5		15 degC (59 degF) [0xF] (TMPIN5)

	Temperature 6		23 degC (73 degF) [0x17] (TMPIN6)

	Fan 0			478 RPM [0x1DE] (Chassis #1)

	Fan 1			390 RPM [0x186] (CPU)

	Fan 3			510 RPM [0x1FE] (Chassis #3)

	Fan 5			774 RPM [0x306] (Chassis #5)

	Fan 7			65280 RPM [0xFF00] (Chassis #7)

Register space			PMIO, base address =3D 0x0A00



		00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F

	00	4E 7E D4 D4 7F 73 16 D4 C8 42 4C 42 93 1B 16 7A

	10	1B 1B 67 0F 17 67 1E 26 6E 1B 1B 67 1B 67 29 0B

	20	1B 02 70 41 00 6F 00 CC 00 00 00 00 00 00 58 00

	30	6B 19 FF 1F 52 14 FF 1F 35 18 01 DF 01 87 00 00

	40	01 FE 00 00 03 10 00 00 FF FF 1F 00 70 41 99 6F

	50	99 CC 1A 80 00 00 00 29 00 00 00 00 00 00 00 00

	60	00 00 00 67 00 FF FF 00 FF FF FF FF FF FF FF 00

	70	00 1B 00 01 00 1B 1B 80 FF FF FF FF FF FF FF FF

	80	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	90	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	A0	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	B0	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	C0	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	D0	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	E0	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF

	F0	FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF



Hardware monitor		ACPI

	Temperature 0		28 degC (82 degF) [0xBC2] (TZ00)


...

I shorten it here.

maybe relevant
I see this with kernel 5.15.7-rc1:

[    1.136508] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[    1.136515] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20210730/utaddress-204=
)




if you need more info's please mail to rwarsow@gmx.de
- I'm currently NOT subscribed to hwmon ML -
=2D-
regards

Ronald

