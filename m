Return-Path: <SRS0=FL+M=VP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0866EC76195
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jul 2019 20:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A45B2173B
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jul 2019 20:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Pwj3hgd+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391364AbfGRUTW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Jul 2019 16:19:22 -0400
Received: from mout02.posteo.de ([185.67.36.66]:35917 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391428AbfGRUTW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Jul 2019 16:19:22 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 052B22400E5
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2019 22:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1563481158; bh=FbeEsgi9yBU2S+rM8mMvQVT7s+IlRugaMBZCPWh5AIY=;
        h=Subject:From:Date:Cc:To:Autocrypt:OpenPGP:From;
        b=Pwj3hgd+9gJiYvxxullR6GgcxUwwmG5hABxhKo1ORUdh0xd1XJwvwRk7XodhiGni2
         Nq8E+QKLQCsrcLu/IrrOzaikr/wR+U7v0++4c4ltG/CGJpK4j3fSyevyAPgsjDWeqg
         IFN92UFXi+z80PR/Y6E1y2uOzsl0ykyKX5Sng0BIQqnGbp3fw8vNAkXlhKGOzaZYDK
         79+aaXjZT4xMftJYx9AXxI+uNta5WHHcNhWYOWnI7dbYjvlpIW1klsqDGSim+LfbTI
         T0m1N8rcMqYJ54IWU23r/dbS/PY1UmDajXM4ugRjslFyIJojAuTQkOeHDcf1JPvI/q
         6759o3bpR8ZeA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 45qQTK1CgSz9rxK;
        Thu, 18 Jul 2019 22:19:16 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
From:   =?utf-8?Q?Bj=C3=B6rn_Gerhart?= <gerhart@posteo.de>
In-Reply-To: <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
Date:   Thu, 18 Jul 2019 22:19:16 +0200
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABE6F128-F3AC-42F3-A970-BAF90A7A4727@posteo.de>
References: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
 <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.11)
Autocrypt: addr=gerhart@posteo.de; keydata=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
OpenPGP: url=https://posteo.de/keys/gerhart@posteo.de.asc
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks Guenter! Please see my comments below.


> Am 16.07.2019 um 15:44 schrieb Guenter Roeck <linux@roeck-us.net>:
>=20
> On 7/15/19 9:47 AM, Bj=C3=B6rn Gerhart wrote:
>> Hello again and thanks for the early feedback! This is the re-worked =
patch of the one I sent last week. It=E2=80=99s created against kernel =
5.1.15 and already depends on the preceding patch concerning the same =
code.
>> The nct6116 is the successor model of nct6106. Mainly, I=E2=80=99m =
unsure if certain details of the spec are mapped correctly to the code. =
These details are:
>> - NCT6116_BEEP_BITS
>=20
> looks good to me.
>=20
>> - int cr24 (cr23 is new, and I=E2=80=99m unsure if the code has to =
get modified therefore)
>=20
> I don't see cr23h in the datasheet available to me. What am I missing =
?
>=20
My fault - there is no cr23h at all.

> But, yes, there are differences:
>=20
> nct6116:
> 	cr1ah[2] determines AUXFANIN1/AUXFANOUT1 settings
> 	cr1b[1-1] and cr2a[1] determine AUXFANIN2/AUXFANOUT2 settings
> 	cr2b[7] is an alternate for AUXFANIN1/AUXFANOUT1
> 	cr2b[4] enable AUXFANIN0/AUXFANOUT0 (same as AUXFANIN/AUXFANOUT =
?) on pin 6, 14
> 	cr24[3] enables AUXFANOUT on pin 14
>=20
> nct6106:
> 	cr24[7] enables AUXFANIN on pin 6
> 	cr24[3] enables AUXFANOUT on pin 14
>=20
This part turns to be the most tricky one. For me the =
meaning/interpretation of all the possible options is quite confusing. =
Especially when some contents might get mirrored to different registers.

The nct6116 covers 5 fans in total, and I identified fan4 as AUXFAN1 and =
fan5 as AUXFAN2. So respectively, AUXFAN0 should be the same as AUXFAN =
and reference to fan3.

Following, the piece of code which I hope to reflect this part of the =
datasheet properly:
        { else if (data->kind =3D=3D nct6116) {
                int cr1a =3D superio_inb(sioreg, 0x1a);
                int cr1b =3D superio_inb(sioreg, 0x1b);
                int cr24 =3D superio_inb(sioreg, 0x24);
                int cr2a =3D superio_inb(sioreg, 0x2a);
=20
                pwm3pin =3D cr24 & 0x08;
                fan3pin =3D cr2b & 0x10;
                pwm4pin =3D cr1a & 0x04;
                if !(cr1b & 0x03) {
                        pwm5pin =3D cr2a & 0x02;
                }

The registers described in the spec do not differ between pwmpin and =
fanpin. Which one shall get used?
If the same content is good for in and out, is pwm4pin =3D=3D fan4pin?

>> - NCT6116_REG_FAN_PULSES
>> - NCT6116_FAN_PULSE_SHIFT
>> - NCT6116_ALARM_BITS
>> With the nct6116 wired on my mainboard, the sensors command seems to =
work as I would expect.
>> Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>
>> ---
>> --- nct6775-5.1.15-1.el7.elrepo.x86_64-bugfixed/nct6775.c	=
2019-07-10 17:08:30.710690605 +0200
>> +++ nct6775/nct6775.c	2019-07-10 17:30:38.012416414 +0200
>> @@ -34,6 +34,7 @@
>>   *
>>   * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
>>   * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
>> + * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
>>   * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
>>   * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
>>   * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
>> @@ -72,12 +73,13 @@
>>    #define USE_ALTERNATE
>>  -enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, =
nct6793,
>> -	     nct6795, nct6796, nct6797, nct6798 };
>> +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, =
nct6792,
>> +	     nct6793, nct6795, nct6796, nct6797, nct6798 };
>>    /* used to set data->name =3D nct6775_device_names[data->sio_kind] =
*/
>>  static const char * const nct6775_device_names[] =3D {
>>  	"nct6106",
>> +	"nct6116",
>>  	"nct6775",
>>  	"nct6776",
>>  	"nct6779",
>> @@ -92,6 +94,7 @@
>>    static const char * const nct6775_sio_names[] __initconst =3D {
>>  	"NCT6106D",
>> +	"NCT6116D",
>>  	"NCT6775F",
>>  	"NCT6776D/F",
>>  	"NCT6779D",
>> @@ -129,6 +132,7 @@
>>  #define SIO_REG_ADDR		0x60	/* Logical device =
address (2 bytes) */
>>    #define SIO_NCT6106_ID		0xc450
>> +#define SIO_NCT6116_ID		0xd280
>>  #define SIO_NCT6775_ID		0xb470
>>  #define SIO_NCT6776_ID		0xc330
>>  #define SIO_NCT6779_ID		0xc560
>> @@ -910,6 +914,119 @@
>>  	[12] =3D 0x205,
>>  };
>>  +/* NCT6112D/NCT6114D/NCT6116D specific data */
>> +
>> +#define NCT6116_REG_VBAT	0x318
>> +#define NCT6116_REG_DIODE	0x319
>> +#define NCT6116_DIODE_MASK	0x01
>> +
>> +static const u16 NCT6116_REG_IN_MAX[] =3D {
>> +	0x90, 0x92, 0x94, 0x96, 0x98, 0x9a, 0x9e, 0xa0, 0xa2 };
>> +static const u16 NCT6116_REG_IN_MIN[] =3D {
>> +	0x91, 0x93, 0x95, 0x97, 0x99, 0x9b, 0x9f, 0xa1, 0xa3 };
>> +static const u16 NCT6116_REG_IN[] =3D {
>> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09 };
>> +
>> +static const u16 NCT6116_REG_TEMP[] =3D { 0x10, 0x11, 0x12 };
>> +static const u16 NCT6116_REG_TEMP_MON[] =3D { 0x18, 0x19, 0x1a };
>> +static const u16 NCT6116_REG_TEMP_HYST[] =3D { 0xc3, 0xc7, 0xcb };
>> +static const u16 NCT6116_REG_TEMP_OVER[] =3D { 0xc2, 0xc6, 0xca };
>> +static const u16 NCT6116_REG_TEMP_CRIT_L[] =3D { 0xc0, 0xc4, 0xc8 };
>> +static const u16 NCT6116_REG_TEMP_CRIT_H[] =3D { 0xc1, 0xc5, 0xc9 };
>> +static const u16 NCT6116_REG_TEMP_OFFSET[] =3D { 0x311, 0x312, 0x313 =
};
>> +static const u16 NCT6116_REG_TEMP_CONFIG[] =3D { 0xb7, 0xb8, 0xb9 };
>> +
>> +static const u16 NCT6116_REG_FAN[] =3D { 0x20, 0x22, 0x24, 0x26, =
0x28 };
>> +static const u16 NCT6116_REG_FAN_MIN[] =3D { 0xe0, 0xe2, 0xe4, 0xe6, =
0xe8 };
>> +static const u16 NCT6116_REG_FAN_PULSES[] =3D { 0xf6, 0xf6, 0xf6, =
0xf6, 0xf5 };
>> +static const u16 NCT6116_FAN_PULSE_SHIFT[] =3D { 0, 2, 4, 6, 6 };
>> +
>> +static const u8 NCT6116_REG_PWM_MODE[] =3D { 0xf3, 0xf3, 0xf3 };
>> +static const u8 NCT6116_PWM_MODE_MASK[] =3D { 0x01, 0x02, 0x04 };
>> +static const u16 NCT6116_REG_PWM[] =3D { 0x119, 0x129, 0x139, 0x199, =
0x1a9 };
>> +static const u16 NCT6116_REG_PWM_READ[] =3D { 0x4a, 0x4b, 0x4c };
>> +static const u16 NCT6116_REG_FAN_MODE[] =3D { 0x113, 0x123, 0x133, =
0x193, 0x1a3 };
>> +static const u16 NCT6116_REG_TEMP_SEL[] =3D { 0x110, 0x120, 0x130, =
0x190, 0x1a0 };
>> +static const u16 NCT6116_REG_TEMP_SOURCE[] =3D { 0xb0, 0xb1, 0xb2 };
>> +
>> +static const u16 NCT6116_REG_CRITICAL_TEMP[] =3D {
>> +	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
>> +static const u16 NCT6116_REG_CRITICAL_TEMP_TOLERANCE[] =3D {
>> +	0x11b, 0x12b, 0x13b, 0x19b, 0x1ab };
>> +
>> +static const u16 NCT6116_REG_CRITICAL_PWM_ENABLE[] =3D {
>> +	0x11c, 0x12c, 0x13c, 0x19c, 0x1ac };
>> +#define NCT6116_CRITICAL_PWM_ENABLE_MASK	0x10
>> +static const u16 NCT6116_REG_CRITICAL_PWM[] =3D {
>> +	0x11d, 0x12d, 0x13d, 0x19d, 0x1ad };
>> +
>> +static const u16 NCT6116_REG_FAN_STEP_UP_TIME[] =3D {
>> +	0x114, 0x124, 0x134, 0x194, 0x1a4 };
>> +static const u16 NCT6116_REG_FAN_STEP_DOWN_TIME[] =3D {
>> +	0x115, 0x125, 0x135, 0x195, 0x1a5 };
>> +static const u16 NCT6116_REG_FAN_STOP_OUTPUT[] =3D {
>> +	0x116, 0x126, 0x136, 0x196, 0x1a6 };
>> +static const u16 NCT6116_REG_FAN_START_OUTPUT[] =3D {
>> +	0x117, 0x127, 0x137, 0x197, 0x1a7 };
>> +static const u16 NCT6116_REG_FAN_STOP_TIME[] =3D {
>> +	0x118, 0x128, 0x138, 0x198, 0x1a8 };
>> +static const u16 NCT6116_REG_TOLERANCE_H[] =3D {
>> +	0x112, 0x122, 0x132, 0x192, 0x1a2 };
>> +
>> +static const u16 NCT6116_REG_TARGET[] =3D {
>> +	0x111, 0x121, 0x131, 0x191, 0x1a1 };
>> +
>> +static const u16 NCT6116_REG_WEIGHT_TEMP_SEL[] =3D { 0x168, 0x178, =
0x188 };
>> +static const u16 NCT6116_REG_WEIGHT_TEMP_STEP[] =3D { 0x169, 0x179, =
0x189 };
>> +static const u16 NCT6116_REG_WEIGHT_TEMP_STEP_TOL[] =3D { 0x16a, =
0x17a, 0x18a };
>> +static const u16 NCT6116_REG_WEIGHT_DUTY_STEP[] =3D { 0x16b, 0x17b, =
0x18b };
>> +static const u16 NCT6116_REG_WEIGHT_TEMP_BASE[] =3D { 0x16c, 0x17c, =
0x18c };
>> +static const u16 NCT6116_REG_WEIGHT_DUTY_BASE[] =3D { 0x16d, 0x17d, =
0x18d };
>> +
>> +static const u16 NCT6116_REG_AUTO_TEMP[] =3D {
>> +	0x160, 0x170, 0x180, 0x1d0, 0x1e0 };
>> +static const u16 NCT6116_REG_AUTO_PWM[] =3D {
>> +	0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
>> +
>> +static const u16 NCT6116_REG_ALARM[NUM_REG_ALARM] =3D {
>> +	0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d };
>> +
>> +static const s8 NCT6116_ALARM_BITS[] =3D {
>> +	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
>> +	9, -1, -1, -1, -1, -1, -1,	/* in8..in9 */
>> +	-1,				/* unused */
>> +	32, 33, 34, 35, 36,		/* fan1..fan5 */
>> +	-1, -1, -1,			/* unused */
>> +	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
>> +	48, -1				/* intrusion0, intrusion1 */
>> +};
>> +
>> +static const u16 NCT6116_REG_BEEP[NUM_REG_BEEP] =3D {
>> +	0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c4 };
>> +
>> +static const s8 NCT6116_BEEP_BITS[] =3D {
>> +	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
>> +	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
>> +	32,				/* global beep enable */
>> +	24, 25, 26, 27, 28,		/* fan1..fan5 */
>> +	-1, -1, -1,			/* unused */
>> +	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
>> +	34, -1				/* intrusion0, intrusion1 */
>> +};
>> +
>> +static const u16 NCT6116_REG_TEMP_ALTERNATE[32] =3D {
>> +	[14] =3D 0x51,
>> +	[15] =3D 0x52,
>> +	[16] =3D 0x54,
>> +};
>> +
>> +static const u16 NCT6116_REG_TEMP_CRIT[32] =3D {
>> +	[11] =3D 0x204,
>> +	[12] =3D 0x205,
>> +};
>> +
> Unfortunately, this time you duplicated data for _all_ registers, not =
just
> the different ones. Idea is to retain the registers which don't change
> and only list the changed registers for a new chip.
>=20
>> +
>> +
> No more than one empty line, please.
>=20
>>  static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
>>  {
>>  	if (mode =3D=3D 0 && pwm =3D=3D 255)
>> @@ -1308,6 +1425,11 @@
>>  		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D =
0x24 ||
>>  		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 =
||
>>  		  reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D =
0x131;
>> +	case nct6116:
>> +		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D =
0x24 ||
>> +		  reg =3D=3D 0x26 || reg =3D=3D 0x28 || reg =3D=3D 0xe0 =
|| reg =3D=3D 0xe2 ||
>> +		  reg =3D=3D 0xe4 || reg =3D=3D 0xe6 || reg =3D=3D 0xe8 =
|| reg =3D=3D 0x111 ||
>> +		  reg =3D=3D 0x121 || reg =3D=3D 0x131 || reg =3D=3D =
0x191 || reg =3D=3D 0x1a1;
>>  	case nct6775:
>>  		return (((reg & 0xff00) =3D=3D 0x100 ||
>>  		    (reg & 0xff00) =3D=3D 0x200) &&
>> @@ -1687,6 +1809,7 @@
>>  			data->auto_pwm[i][data->auto_pwm_num] =3D 0xff;
>>  			break;
>>  		case nct6106:
>> +		case nct6116:
>>  		case nct6779:
>>  		case nct6791:
>>  		case nct6792:
>> @@ -3123,6 +3246,7 @@
>>  		case nct6776:
>>  			break; /* always enabled, nothing to do */
>>  		case nct6106:
>> +		case nct6116:
>>  		case nct6779:
>>  		case nct6791:
>>  		case nct6792:
>> @@ -3544,7 +3668,7 @@
>>    		fan4min =3D fan4pin;
>>  		pwm3pin =3D fan3pin;
>> -	} else if (data->kind =3D=3D nct6106) {
>> +	} else if ((data->kind =3D=3D nct6106) || (data->kind =3D=3D =
nct6116)) {
>=20
> nct6116 will need a separate if statement per above.
>=20
>>  		int cr24 =3D superio_inb(sioreg, 0x24);
>>    		fan3pin =3D !(cr24 & 0x80);
>> @@ -3821,6 +3945,79 @@
>>  		reg_temp_crit_h =3D NCT6106_REG_TEMP_CRIT_H;
>>    		break;
>> +	case nct6116:
>> +		data->in_num =3D 9;
>> +		data->pwm_num =3D 3;
>> +		data->auto_pwm_num =3D 4;
>> +		data->temp_fixed_num =3D 3;
>> +		data->num_temp_alarms =3D 3;
>> +		data->num_temp_beeps =3D 3;
>> +
>> +		data->fan_from_reg =3D fan_from_reg13;
>> +		data->fan_from_reg_min =3D fan_from_reg13;
>> +
>> +		data->temp_label =3D nct6776_temp_label;
>> +		data->temp_mask =3D NCT6776_TEMP_MASK;
>> +		data->virt_temp_mask =3D NCT6776_VIRT_TEMP_MASK;
>> +
>> +		data->REG_VBAT =3D NCT6116_REG_VBAT;
>> +		data->REG_DIODE =3D NCT6116_REG_DIODE;
>> +		data->DIODE_MASK =3D NCT6116_DIODE_MASK;
>> +		data->REG_VIN =3D NCT6116_REG_IN;
>> +		data->REG_IN_MINMAX[0] =3D NCT6116_REG_IN_MIN;
>> +		data->REG_IN_MINMAX[1] =3D NCT6116_REG_IN_MAX;
>> +		data->REG_TARGET =3D NCT6116_REG_TARGET;
>> +		data->REG_FAN =3D NCT6116_REG_FAN;
>> +		data->REG_FAN_MODE =3D NCT6116_REG_FAN_MODE;
>> +		data->REG_FAN_MIN =3D NCT6116_REG_FAN_MIN;
>> +		data->REG_FAN_PULSES =3D NCT6116_REG_FAN_PULSES;
>> +		data->FAN_PULSE_SHIFT =3D NCT6116_FAN_PULSE_SHIFT;
>> +		data->REG_FAN_TIME[0] =3D NCT6116_REG_FAN_STOP_TIME;
>> +		data->REG_FAN_TIME[1] =3D NCT6116_REG_FAN_STEP_UP_TIME;
>> +		data->REG_FAN_TIME[2] =3D =
NCT6116_REG_FAN_STEP_DOWN_TIME;
>> +		data->REG_TOLERANCE_H =3D NCT6116_REG_TOLERANCE_H;
>> +		data->REG_PWM[0] =3D NCT6116_REG_PWM;
>> +		data->REG_PWM[1] =3D NCT6116_REG_FAN_START_OUTPUT;
>> +		data->REG_PWM[2] =3D NCT6116_REG_FAN_STOP_OUTPUT;
>> +		data->REG_PWM[5] =3D NCT6116_REG_WEIGHT_DUTY_STEP;
>> +		data->REG_PWM[6] =3D NCT6116_REG_WEIGHT_DUTY_BASE;
>> +		data->REG_PWM_READ =3D NCT6116_REG_PWM_READ;
>> +		data->REG_PWM_MODE =3D NCT6116_REG_PWM_MODE;
>> +		data->PWM_MODE_MASK =3D NCT6116_PWM_MODE_MASK;
>> +		data->REG_AUTO_TEMP =3D NCT6116_REG_AUTO_TEMP;
>> +		data->REG_AUTO_PWM =3D NCT6116_REG_AUTO_PWM;
>> +		data->REG_CRITICAL_TEMP =3D NCT6116_REG_CRITICAL_TEMP;
>> +		data->REG_CRITICAL_TEMP_TOLERANCE
>> +		  =3D NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
>> +		data->REG_CRITICAL_PWM_ENABLE =3D =
NCT6116_REG_CRITICAL_PWM_ENABLE;
>> +		data->CRITICAL_PWM_ENABLE_MASK
>> +		  =3D NCT6116_CRITICAL_PWM_ENABLE_MASK;
>> +		data->REG_CRITICAL_PWM =3D NCT6116_REG_CRITICAL_PWM;
>> +		data->REG_TEMP_OFFSET =3D NCT6116_REG_TEMP_OFFSET;
>> +		data->REG_TEMP_SOURCE =3D NCT6116_REG_TEMP_SOURCE;
>> +		data->REG_TEMP_SEL =3D NCT6116_REG_TEMP_SEL;
>> +		data->REG_WEIGHT_TEMP_SEL =3D =
NCT6116_REG_WEIGHT_TEMP_SEL;
>> +		data->REG_WEIGHT_TEMP[0] =3D =
NCT6116_REG_WEIGHT_TEMP_STEP;
>> +		data->REG_WEIGHT_TEMP[1] =3D =
NCT6116_REG_WEIGHT_TEMP_STEP_TOL;
>> +		data->REG_WEIGHT_TEMP[2] =3D =
NCT6116_REG_WEIGHT_TEMP_BASE;
>> +		data->REG_ALARM =3D NCT6116_REG_ALARM;
>> +		data->ALARM_BITS =3D NCT6116_ALARM_BITS;
>> +		data->REG_BEEP =3D NCT6116_REG_BEEP;
>> +		data->BEEP_BITS =3D NCT6116_BEEP_BITS;
>> +
>> +		reg_temp =3D NCT6116_REG_TEMP;
>> +		reg_temp_mon =3D NCT6116_REG_TEMP_MON;
>> +		num_reg_temp =3D ARRAY_SIZE(NCT6116_REG_TEMP);
>> +		num_reg_temp_mon =3D ARRAY_SIZE(NCT6116_REG_TEMP_MON);
>> +		reg_temp_over =3D NCT6116_REG_TEMP_OVER;
>> +		reg_temp_hyst =3D NCT6116_REG_TEMP_HYST;
>> +		reg_temp_config =3D NCT6116_REG_TEMP_CONFIG;
>> +		reg_temp_alternate =3D NCT6116_REG_TEMP_ALTERNATE;
>> +		reg_temp_crit =3D NCT6116_REG_TEMP_CRIT;
>> +		reg_temp_crit_l =3D NCT6116_REG_TEMP_CRIT_L;
>> +		reg_temp_crit_h =3D NCT6116_REG_TEMP_CRIT_H;
>> +
>> +		break;
>>  	case nct6775:
>>  		data->in_num =3D 9;
>>  		data->pwm_num =3D 3;
>> @@ -4366,6 +4563,7 @@
>>  		data->have_vid =3D (cr2a & 0x60) =3D=3D 0x40;
>>  		break;
>>  	case nct6106:
>> +	case nct6116:
>>  	case nct6779:
>>  	case nct6791:
>>  	case nct6792:
>> @@ -4397,6 +4595,9 @@
>>  		case nct6106:
>>  			tmp |=3D 0xe0;
>>  			break;
>> +		case nct6116:
>> +			tmp |=3D 0xe0;
>> +			break;
>>  		case nct6775:
>>  			tmp |=3D 0x1e;
>>  			break;
>> @@ -4590,6 +4791,9 @@
>>  	case SIO_NCT6106_ID:
>>  		sio_data->kind =3D nct6106;
>>  		break;
>> +	case SIO_NCT6116_ID:
>> +		sio_data->kind =3D nct6116;
>> +		break;
>>  	case SIO_NCT6775_ID:
>>  		sio_data->kind =3D nct6775;
>>  		break;

