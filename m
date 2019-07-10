Return-Path: <SRS0=aQnN=VH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEFAC74A36
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Jul 2019 19:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA88420844
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Jul 2019 19:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ldJMXmXx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfGJTaF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Jul 2019 15:30:05 -0400
Received: from mout01.posteo.de ([185.67.36.65]:38007 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727148AbfGJTaF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jul 2019 15:30:05 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id D8C2616005F
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2019 21:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1562786999; bh=Ey2rMr0vArT7WNbJN6uWb9AFskfCjRGBrEDc6UxnXG8=;
        h=Subject:From:Date:Cc:To:Autocrypt:OpenPGP:From;
        b=ldJMXmXxjiX1NjlZCbVvs5X5oCaenCd8lHpW2vTNG82ogYCa6GUQtk0ya0MGYm01O
         z7XQtZKmfrLLJjonX/1wL2wwD07Ixn2QSfC5lxSSB/R3GGa1eSWmgA1CdVd2THNcpG
         T4Hf0ytEx6Hj+LHisCd64lOArcFTKTAYSr1UWVuR8LOjQqE5/yC0aYDFn8udBxkkKw
         x7pp8jCWNXxKBWm9d1VaOihAOs0E0YwkbbmBm4bCmF9NSp0vcnazCGojwHl0rt6gFE
         Yz1JLmqsoPBzpKEJR2acWi+MOG2moCGN0WG73gdYy8uMbgvluDprSWfVJ0WH20dWVW
         yATh6DnCwfPmQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 45kTm71Qwpz6tm7;
        Wed, 10 Jul 2019 21:29:59 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
From:   =?utf-8?Q?Bj=C3=B6rn_Gerhart?= <gerhart@posteo.de>
In-Reply-To: <F40A0DFF-8B46-4DA3-A111-F729ED2D1327@posteo.de>
Date:   Wed, 10 Jul 2019 21:29:55 +0200
Cc:     Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <76CF99AD-62AF-4929-AA67-D441A68B00A0@posteo.de>
References: <F40A0DFF-8B46-4DA3-A111-F729ED2D1327@posteo.de>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
Autocrypt: addr=gerhart@posteo.de; keydata=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
OpenPGP: url=https://posteo.de/keys/gerhart@posteo.de.asc
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

oh no, the patch is WRONG as I noticed right now. Sorry for the noise! =
I=E2=80=99ll re-work it and come back!

> Am 10.07.2019 um 21:19 schrieb Bj=C3=B6rn Gerhart <gerhart@posteo.de>:
>=20
> The nct6116 is the successor model of nct6106. Mainly I=E2=80=99m =
unsure about my changes related to:
> - NCT6116_BEEP_BITS
> - int cr24 (cr23 is new, and I=E2=80=99m unsure if the code has to get =
modified therefore)
> - NCT6116_REG_FAN_PULSES
> - NCT6116_FAN_PULSE_SHIFT
> - NCT6116_ALARM_BITS
>=20
> With the nct6116 wired on my mainboard, the sensors command seems to =
work as I would expect.
>=20
> Index: nct6775.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- nct6775.c	(revision 16313)
> +++ nct6775.c	(working copy)
> @@ -34,6 +34,7 @@
>  *
>  * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
>  * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
> + * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
>  * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
>  * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
>  * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
> @@ -72,12 +73,13 @@
>=20
> #define USE_ALTERNATE
>=20
> -enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, =
nct6793,
> -	     nct6795, nct6796, nct6797, nct6798 };
> +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, =
nct6792,
> +	     nct6793, nct6795, nct6796, nct6797, nct6798 };
>=20
> /* used to set data->name =3D nct6775_device_names[data->sio_kind] */
> static const char * const nct6775_device_names[] =3D {
> 	"nct6106",
> +	"nct6116",
> 	"nct6775",
> 	"nct6776",
> 	"nct6779",
> @@ -92,6 +94,7 @@
>=20
> static const char * const nct6775_sio_names[] __initconst =3D {
> 	"NCT6106D",
> +	"NCT6116D",
> 	"NCT6775F",
> 	"NCT6776D/F",
> 	"NCT6779D",
> @@ -129,6 +132,7 @@
> #define SIO_REG_ADDR		0x60	/* Logical device address (2 =
bytes) */
>=20
> #define SIO_NCT6106_ID		0xc450
> +#define SIO_NCT6116_ID		0xd280
> #define SIO_NCT6775_ID		0xb470
> #define SIO_NCT6776_ID		0xc330
> #define SIO_NCT6779_ID		0xc560
> @@ -819,18 +823,29 @@
> 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09 };
>=20
> static const u16 NCT6106_REG_TEMP[] =3D { 0x10, 0x11, 0x12, 0x13, =
0x14, 0x15 };
> +static const u16 NCT6116_REG_TEMP[] =3D { 0x10, 0x11, 0x12 };
> static const u16 NCT6106_REG_TEMP_MON[] =3D { 0x18, 0x19, 0x1a };
> static const u16 NCT6106_REG_TEMP_HYST[] =3D {
> 	0xc3, 0xc7, 0xcb, 0xcf, 0xd3, 0xd7 };
> +static const u16 NCT6116_REG_TEMP_HYST[] =3D {
> +	0xc3, 0xc7, 0xcb };
> static const u16 NCT6106_REG_TEMP_OVER[] =3D {
> 	0xc2, 0xc6, 0xca, 0xce, 0xd2, 0xd6 };
> +static const u16 NCT6116_REG_TEMP_OVER[] =3D {
> +	0xc2, 0xc6, 0xca };
> static const u16 NCT6106_REG_TEMP_CRIT_L[] =3D {
> 	0xc0, 0xc4, 0xc8, 0xcc, 0xd0, 0xd4 };
> +static const u16 NCT6116_REG_TEMP_CRIT_L[] =3D {
> +	0xc0, 0xc4, 0xc8 };
> static const u16 NCT6106_REG_TEMP_CRIT_H[] =3D {
> 	0xc1, 0xc5, 0xc9, 0xcf, 0xd1, 0xd5 };
> +static const u16 NCT6116_REG_TEMP_CRIT_H[] =3D {
> +	0xc1, 0xc5, 0xc9 };
> static const u16 NCT6106_REG_TEMP_OFFSET[] =3D { 0x311, 0x312, 0x313 =
};
> static const u16 NCT6106_REG_TEMP_CONFIG[] =3D {
> 	0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc };
> +static const u16 NCT6116_REG_TEMP_CONFIG[] =3D {
> +	0xb7, 0xb8, 0xb9 };
>=20
> static const u16 NCT6106_REG_FAN[] =3D { 0x20, 0x22, 0x24 };
> static const u16 NCT6106_REG_FAN_MIN[] =3D { 0xe0, 0xe2, 0xe4 };
> @@ -845,6 +860,8 @@
> static const u16 NCT6106_REG_TEMP_SEL[] =3D { 0x110, 0x120, 0x130 };
> static const u16 NCT6106_REG_TEMP_SOURCE[] =3D {
> 	0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
> +static const u16 NCT6116_REG_TEMP_SOURCE[] =3D {
> +	0xb0, 0xb1, 0xb2 };
>=20
> static const u16 NCT6106_REG_CRITICAL_TEMP[] =3D { 0x11a, 0x12a, 0x13a =
};
> static const u16 NCT6106_REG_CRITICAL_TEMP_TOLERANCE[] =3D {
> @@ -886,6 +903,16 @@
> 	48, -1				/* intrusion0, intrusion1 */
> };
>=20
> +static const s8 NCT6116_ALARM_BITS[] =3D {
> +	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> +	9, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> +	-1,				/* unused */
> +	32, 33, 34, -1, -1,		/* fan1..fan5 */
> +	-1, -1, -1,			/* unused */
> +	16, 17, 18,			/* temp1..temp3 */
> +	48, -1				/* intrusion0, intrusion1 */
> +};
> +
> static const u16 NCT6106_REG_BEEP[NUM_REG_BEEP] =3D {
> 	0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c4 };
>=20
> @@ -1308,6 +1335,10 @@
> 		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D =
0x24 ||
> 		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 =
||
> 		  reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D =
0x131;
> +	case nct6116:
> +		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D =
0x24 ||
> +		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 =
||
> +		  reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D =
0x131;
> 	case nct6775:
> 		return (((reg & 0xff00) =3D=3D 0x100 ||
> 		    (reg & 0xff00) =3D=3D 0x200) &&
> @@ -1687,6 +1718,7 @@
> 			data->auto_pwm[i][data->auto_pwm_num] =3D 0xff;
> 			break;
> 		case nct6106:
> +		case nct6116:
> 		case nct6779:
> 		case nct6791:
> 		case nct6792:
> @@ -3123,6 +3155,7 @@
> 		case nct6776:
> 			break; /* always enabled, nothing to do */
> 		case nct6106:
> +		case nct6116:
> 		case nct6779:
> 		case nct6791:
> 		case nct6792:
> @@ -3549,6 +3582,11 @@
>=20
> 		fan3pin =3D !(cr24 & 0x80);
> 		pwm3pin =3D cr24 & 0x08;
> +	} else if (data->kind =3D=3D nct6116) {
> +		int cr24 =3D superio_inb(sioreg, 0x24);
> +
> +		fan3pin =3D !(cr24 & 0x80);
> +		pwm3pin =3D cr24 & 0x08;
> 	} else {
> 		/*
> 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, =
NCT6796D,
> @@ -3820,6 +3858,78 @@
> 		reg_temp_crit_h =3D NCT6106_REG_TEMP_CRIT_H;
>=20
> 		break;
> +	case nct6116:
> +		data->in_num =3D 9;
> +		data->pwm_num =3D 3;
> +		data->auto_pwm_num =3D 4;
> +		data->temp_fixed_num =3D 3;
> +		data->num_temp_alarms =3D 3;
> +		data->num_temp_beeps =3D 3;
> +
> +		data->fan_from_reg =3D fan_from_reg13;
> +		data->fan_from_reg_min =3D fan_from_reg13;
> +
> +		data->temp_label =3D nct6776_temp_label;
> +		data->temp_mask =3D NCT6776_TEMP_MASK;
> +		data->virt_temp_mask =3D NCT6776_VIRT_TEMP_MASK;
> +
> +		data->REG_VBAT =3D NCT6106_REG_VBAT;
> +		data->REG_DIODE =3D NCT6106_REG_DIODE;
> +		data->DIODE_MASK =3D NCT6106_DIODE_MASK;
> +		data->REG_VIN =3D NCT6106_REG_IN;
> +		data->REG_IN_MINMAX[0] =3D NCT6106_REG_IN_MIN;
> +		data->REG_IN_MINMAX[1] =3D NCT6106_REG_IN_MAX;
> +		data->REG_TARGET =3D NCT6106_REG_TARGET;
> +		data->REG_FAN =3D NCT6106_REG_FAN;
> +		data->REG_FAN_MODE =3D NCT6106_REG_FAN_MODE;
> +		data->REG_FAN_MIN =3D NCT6106_REG_FAN_MIN;
> +		data->REG_FAN_PULSES =3D NCT6106_REG_FAN_PULSES;
> +		data->FAN_PULSE_SHIFT =3D NCT6106_FAN_PULSE_SHIFT;
> +		data->REG_FAN_TIME[0] =3D NCT6106_REG_FAN_STOP_TIME;
> +		data->REG_FAN_TIME[1] =3D NCT6106_REG_FAN_STEP_UP_TIME;
> +		data->REG_FAN_TIME[2] =3D =
NCT6106_REG_FAN_STEP_DOWN_TIME;
> +		data->REG_PWM[0] =3D NCT6106_REG_PWM;
> +		data->REG_PWM[1] =3D NCT6106_REG_FAN_START_OUTPUT;
> +		data->REG_PWM[2] =3D NCT6106_REG_FAN_STOP_OUTPUT;
> +		data->REG_PWM[5] =3D NCT6106_REG_WEIGHT_DUTY_STEP;
> +		data->REG_PWM[6] =3D NCT6106_REG_WEIGHT_DUTY_BASE;
> +		data->REG_PWM_READ =3D NCT6106_REG_PWM_READ;
> +		data->REG_PWM_MODE =3D NCT6106_REG_PWM_MODE;
> +		data->PWM_MODE_MASK =3D NCT6106_PWM_MODE_MASK;
> +		data->REG_AUTO_TEMP =3D NCT6106_REG_AUTO_TEMP;
> +		data->REG_AUTO_PWM =3D NCT6106_REG_AUTO_PWM;
> +		data->REG_CRITICAL_TEMP =3D NCT6106_REG_CRITICAL_TEMP;
> +		data->REG_CRITICAL_TEMP_TOLERANCE
> +		  =3D NCT6106_REG_CRITICAL_TEMP_TOLERANCE;
> +		data->REG_CRITICAL_PWM_ENABLE =3D =
NCT6106_REG_CRITICAL_PWM_ENABLE;
> +		data->CRITICAL_PWM_ENABLE_MASK
> +		  =3D NCT6106_CRITICAL_PWM_ENABLE_MASK;
> +		data->REG_CRITICAL_PWM =3D NCT6106_REG_CRITICAL_PWM;
> +		data->REG_TEMP_OFFSET =3D NCT6106_REG_TEMP_OFFSET;
> +		data->REG_TEMP_SOURCE =3D NCT6116_REG_TEMP_SOURCE;
> +		data->REG_TEMP_SEL =3D NCT6106_REG_TEMP_SEL;
> +		data->REG_WEIGHT_TEMP_SEL =3D =
NCT6106_REG_WEIGHT_TEMP_SEL;
> +		data->REG_WEIGHT_TEMP[0] =3D =
NCT6106_REG_WEIGHT_TEMP_STEP;
> +		data->REG_WEIGHT_TEMP[1] =3D =
NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
> +		data->REG_WEIGHT_TEMP[2] =3D =
NCT6106_REG_WEIGHT_TEMP_BASE;
> +		data->REG_ALARM =3D NCT6106_REG_ALARM;
> +		data->ALARM_BITS =3D NCT6116_ALARM_BITS;
> +		data->REG_BEEP =3D NCT6106_REG_BEEP;
> +		data->BEEP_BITS =3D NCT6106_BEEP_BITS;
> +
> +		reg_temp =3D NCT6116_REG_TEMP;
> +		reg_temp_mon =3D NCT6106_REG_TEMP_MON;
> +		num_reg_temp =3D ARRAY_SIZE(NCT6116_REG_TEMP);
> +		num_reg_temp_mon =3D ARRAY_SIZE(NCT6106_REG_TEMP_MON);
> +		reg_temp_over =3D NCT6116_REG_TEMP_OVER;
> +		reg_temp_hyst =3D NCT6116_REG_TEMP_HYST;
> +		reg_temp_config =3D NCT6116_REG_TEMP_CONFIG;
> +		reg_temp_alternate =3D NCT6106_REG_TEMP_ALTERNATE;
> +		reg_temp_crit =3D NCT6106_REG_TEMP_CRIT;
> +		reg_temp_crit_l =3D NCT6116_REG_TEMP_CRIT_L;
> +		reg_temp_crit_h =3D NCT6116_REG_TEMP_CRIT_H;
> +
> +		break;
> 	case nct6775:
> 		data->in_num =3D 9;
> 		data->pwm_num =3D 3;
> @@ -4365,6 +4475,7 @@
> 		data->have_vid =3D (cr2a & 0x60) =3D=3D 0x40;
> 		break;
> 	case nct6106:
> +	case nct6116:
> 	case nct6779:
> 	case nct6791:
> 	case nct6792:
> @@ -4396,6 +4507,9 @@
> 		case nct6106:
> 			tmp |=3D 0xe0;
> 			break;
> +		case nct6116:
> +			tmp |=3D 0xe0;
> +			break;
> 		case nct6775:
> 			tmp |=3D 0x1e;
> 			break;
> @@ -4589,6 +4703,9 @@
> 	case SIO_NCT6106_ID:
> 		sio_data->kind =3D nct6106;
> 		break;
> +	case SIO_NCT6116_ID:
> +		sio_data->kind =3D nct6116;
> +		break;
> 	case SIO_NCT6775_ID:
> 		sio_data->kind =3D nct6775;
> 		break;
>=20

