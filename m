Return-Path: <SRS0=cQ/s=VU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30066C7618B
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 16:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B76222239E
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 16:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="mCrqyp0a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfGWQG5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jul 2019 12:06:57 -0400
Received: from mout01.posteo.de ([185.67.36.65]:43643 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbfGWQG5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jul 2019 12:06:57 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 2AA5616005D
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2019 18:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1563898011; bh=3sKrwdwnmtq5lrHJAnHqLffx9wxpXnAulro6XktUxmY=;
        h=Subject:From:Date:Cc:To:Autocrypt:OpenPGP:From;
        b=mCrqyp0aTfHk1nZPlMBe2kYN0Uxn2Jrq04VIiG5YtKf5vHWxfpNDo9Zp/KSpYvN4m
         9FFiqqRScFUs2ucN43NgXtS3Nhk3E70R4L4k+LA6OoIMX8Bm/bD1SztqiWXq0tTU/j
         96fmvPMLlgieHyPDYNQEUn2tlPB5ju7/ls/u1pnh2nZUSZUD6QQ8eLRvb0wekryPSG
         H+6jQ35GzxTn03YOC2VxY/Q/7tmYnhStSZYZJvzAuDKAf5taOFGIdZL3Mm2QZ+4eFj
         PIT9JNLsegm+dxHgnmZIX8Gq+95cVcX3ezfgjqdFnNYacNLH9C28bbVKX9HFTMFJHQ
         Rj2S3hX7dZ0hw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 45tNdk0Vx2z6tmM;
        Tue, 23 Jul 2019 18:06:49 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
From:   =?utf-8?Q?Bj=C3=B6rn_Gerhart?= <gerhart@posteo.de>
In-Reply-To: <20190719193752.GA17575@roeck-us.net>
Date:   Tue, 23 Jul 2019 18:06:46 +0200
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E88FC5F-6A72-49B9-A168-9D4B0BB56BB2@posteo.de>
References: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
 <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
 <ABE6F128-F3AC-42F3-A970-BAF90A7A4727@posteo.de>
 <1940BFD4-9943-4E7F-B78A-8A15AA868C57@posteo.de>
 <20190719193752.GA17575@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.11)
Autocrypt: addr=gerhart@posteo.de; keydata=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
OpenPGP: url=https://posteo.de/keys/gerhart@posteo.de.asc
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for the review Guenter, I checked your proposals. Here comes an =
update of the patch, and I hope this time the format fits as it should.

Changes:
- simplified differences in register addresses
- although kept NCT6116_REG_TEMP_SOURCE, because otherwise the module
  throughs =E2=80=9EInvalid temperature source=E2=80=9C messages on =
loading for each
  register not available
- fixed fan enablements
- simplified case statement (fall through)

Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>
---
diff -Npaur a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
--- a/drivers/hwmon/nct6775.c	2019-07-10 17:08:30.710690605 +0200
+++ b/drivers/hwmon/nct6775.c	2019-07-23 10:17:33.217639944 +0200
@@ -34,6 +34,7 @@
  *
  * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
  * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
+ * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
  * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
  * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
  * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
@@ -72,12 +73,13 @@
=20
 #define USE_ALTERNATE
=20
-enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, =
nct6793,
-	     nct6795, nct6796, nct6797, nct6798 };
+enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, =
nct6792,
+	     nct6793, nct6795, nct6796, nct6797, nct6798 };
=20
 /* used to set data->name =3D nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] =3D {
 	"nct6106",
+	"nct6116",
 	"nct6775",
 	"nct6776",
 	"nct6779",
@@ -92,6 +94,7 @@ static const char * const nct6775_device
=20
 static const char * const nct6775_sio_names[] __initconst =3D {
 	"NCT6106D",
+	"NCT6116D",
 	"NCT6775F",
 	"NCT6776D/F",
 	"NCT6779D",
@@ -129,6 +132,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable d
 #define SIO_REG_ADDR		0x60	/* Logical device address (2 =
bytes) */
=20
 #define SIO_NCT6106_ID		0xc450
+#define SIO_NCT6116_ID		0xd280
 #define SIO_NCT6775_ID		0xb470
 #define SIO_NCT6776_ID		0xc330
 #define SIO_NCT6779_ID		0xc560
@@ -839,10 +843,8 @@ static const u16 NCT6106_FAN_PULSE_SHIFT
=20
 static const u8 NCT6106_REG_PWM_MODE[] =3D { 0xf3, 0xf3, 0xf3 };
 static const u8 NCT6106_PWM_MODE_MASK[] =3D { 0x01, 0x02, 0x04 };
-static const u16 NCT6106_REG_PWM[] =3D { 0x119, 0x129, 0x139 };
 static const u16 NCT6106_REG_PWM_READ[] =3D { 0x4a, 0x4b, 0x4c };
 static const u16 NCT6106_REG_FAN_MODE[] =3D { 0x113, 0x123, 0x133 };
-static const u16 NCT6106_REG_TEMP_SEL[] =3D { 0x110, 0x120, 0x130 };
 static const u16 NCT6106_REG_TEMP_SOURCE[] =3D {
 	0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
=20
@@ -910,6 +912,70 @@ static const u16 NCT6106_REG_TEMP_CRIT[3
 	[12] =3D 0x205,
 };
=20
+/* NCT6112D/NCT6114D/NCT6116D specific data */
+
+static const u16 NCT6116_REG_FAN[] =3D { 0x20, 0x22, 0x24, 0x26, 0x28 =
};
+static const u16 NCT6116_REG_FAN_MIN[] =3D { 0xe0, 0xe2, 0xe4, 0xe6, =
0xe8 };
+static const u16 NCT6116_REG_FAN_PULSES[] =3D { 0xf6, 0xf6, 0xf6, 0xf6, =
0xf5 };
+static const u16 NCT6116_FAN_PULSE_SHIFT[] =3D { 0, 2, 4, 6, 6 };
+
+static const u16 NCT6116_REG_PWM[] =3D { 0x119, 0x129, 0x139, 0x199, =
0x1a9 };
+static const u16 NCT6116_REG_FAN_MODE[] =3D { 0x113, 0x123, 0x133, =
0x193, 0x1a3 };
+static const u16 NCT6116_REG_TEMP_SEL[] =3D { 0x110, 0x120, 0x130, =
0x190, 0x1a0 };
+static const u16 NCT6116_REG_TEMP_SOURCE[] =3D {
+	0xb0, 0xb1, 0xb2 };
+
+static const u16 NCT6116_REG_CRITICAL_TEMP[] =3D {
+	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
+static const u16 NCT6116_REG_CRITICAL_TEMP_TOLERANCE[] =3D {
+	0x11b, 0x12b, 0x13b, 0x19b, 0x1ab };
+
+static const u16 NCT6116_REG_CRITICAL_PWM_ENABLE[] =3D {
+	0x11c, 0x12c, 0x13c, 0x19c, 0x1ac };
+static const u16 NCT6116_REG_CRITICAL_PWM[] =3D {
+	0x11d, 0x12d, 0x13d, 0x19d, 0x1ad };
+
+static const u16 NCT6116_REG_FAN_STEP_UP_TIME[] =3D {
+	0x114, 0x124, 0x134, 0x194, 0x1a4 };
+static const u16 NCT6116_REG_FAN_STEP_DOWN_TIME[] =3D {
+	0x115, 0x125, 0x135, 0x195, 0x1a5 };
+static const u16 NCT6116_REG_FAN_STOP_OUTPUT[] =3D {
+	0x116, 0x126, 0x136, 0x196, 0x1a6 };
+static const u16 NCT6116_REG_FAN_START_OUTPUT[] =3D {
+	0x117, 0x127, 0x137, 0x197, 0x1a7 };
+static const u16 NCT6116_REG_FAN_STOP_TIME[] =3D {
+	0x118, 0x128, 0x138, 0x198, 0x1a8 };
+static const u16 NCT6116_REG_TOLERANCE_H[] =3D {
+	0x112, 0x122, 0x132, 0x192, 0x1a2 };
+
+static const u16 NCT6116_REG_TARGET[] =3D {
+	0x111, 0x121, 0x131, 0x191, 0x1a1 };
+
+static const u16 NCT6116_REG_AUTO_TEMP[] =3D {
+	0x160, 0x170, 0x180, 0x1d0, 0x1e0 };
+static const u16 NCT6116_REG_AUTO_PWM[] =3D {
+	0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
+
+static const s8 NCT6116_ALARM_BITS[] =3D {
+	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
+	9, -1, -1, -1, -1, -1, -1,	/* in8..in9 */
+	-1,				/* unused */
+	32, 33, 34, 35, 36,		/* fan1..fan5 */
+	-1, -1, -1,			/* unused */
+	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
+	48, -1				/* intrusion0, intrusion1 */
+};
+
+static const s8 NCT6116_BEEP_BITS[] =3D {
+	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
+	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
+	32,				/* global beep enable */
+	24, 25, 26, 27, 28,		/* fan1..fan5 */
+	-1, -1, -1,			/* unused */
+	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
+	34, -1				/* intrusion0, intrusion1 */
+};
+
 static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
 {
 	if (mode =3D=3D 0 && pwm =3D=3D 255)
@@ -1308,6 +1374,11 @@ static bool is_word_sized(struct nct6775
 		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D =
0x24 ||
 		  reg =3D=3D 0xe0 || reg =3D=3D 0xe2 || reg =3D=3D 0xe4 =
||
 		  reg =3D=3D 0x111 || reg =3D=3D 0x121 || reg =3D=3D =
0x131;
+	case nct6116:
+		return reg =3D=3D 0x20 || reg =3D=3D 0x22 || reg =3D=3D =
0x24 ||
+		  reg =3D=3D 0x26 || reg =3D=3D 0x28 || reg =3D=3D 0xe0 =
|| reg =3D=3D 0xe2 ||
+		  reg =3D=3D 0xe4 || reg =3D=3D 0xe6 || reg =3D=3D 0xe8 =
|| reg =3D=3D 0x111 ||
+		  reg =3D=3D 0x121 || reg =3D=3D 0x131 || reg =3D=3D =
0x191 || reg =3D=3D 0x1a1;
 	case nct6775:
 		return (((reg & 0xff00) =3D=3D 0x100 ||
 		    (reg & 0xff00) =3D=3D 0x200) &&
@@ -1687,6 +1758,7 @@ static void nct6775_update_pwm_limits(st
 			data->auto_pwm[i][data->auto_pwm_num] =3D 0xff;
 			break;
 		case nct6106:
+		case nct6116:
 		case nct6779:
 		case nct6791:
 		case nct6792:
@@ -3123,6 +3195,7 @@ store_auto_pwm(struct device *dev, struc
 		case nct6776:
 			break; /* always enabled, nothing to do */
 		case nct6106:
+		case nct6116:
 		case nct6779:
 		case nct6791:
 		case nct6792:
@@ -3549,6 +3622,23 @@ nct6775_check_fan_inputs(struct nct6775_
=20
 		fan3pin =3D !(cr24 & 0x80);
 		pwm3pin =3D cr24 & 0x08;
+	} else if (data->kind =3D=3D nct6116) {
+		int cr1a =3D superio_inb(sioreg, 0x1a);
+		int cr1b =3D superio_inb(sioreg, 0x1b);
+		int cr24 =3D superio_inb(sioreg, 0x24);
+		int cr2a =3D superio_inb(sioreg, 0x2a);
+		int cr2b =3D superio_inb(sioreg, 0x2b);
+		int cr2f =3D superio_inb(sioreg, 0x2f);
+
+		fan3pin =3D !(cr2b & 0x10);
+		fan4pin =3D (cr2b & 0x80) ||			// pin =
1(2)
+			(!(cr2f & 0x10) && (cr1a & 0x04));	// pin =
65(66)
+		fan5pin =3D (cr2b & 0x80) ||			// pin =
126(127)
+			(!(cr1b & 0x03) && (cr2a & 0x02));	// pin =
94(96)
+
+		pwm3pin =3D fan3pin && (cr24 & 0x08);
+		pwm4pin =3D fan4pin;
+		pwm5pin =3D fan5pin;
 	} else {
 		/*
 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, =
NCT6796D,
@@ -3779,7 +3869,7 @@ static int nct6775_probe(struct platform
 		data->REG_FAN_TIME[1] =3D NCT6106_REG_FAN_STEP_UP_TIME;
 		data->REG_FAN_TIME[2] =3D =
NCT6106_REG_FAN_STEP_DOWN_TIME;
 		data->REG_TOLERANCE_H =3D NCT6106_REG_TOLERANCE_H;
-		data->REG_PWM[0] =3D NCT6106_REG_PWM;
+		data->REG_PWM[0] =3D NCT6116_REG_PWM;
 		data->REG_PWM[1] =3D NCT6106_REG_FAN_START_OUTPUT;
 		data->REG_PWM[2] =3D NCT6106_REG_FAN_STOP_OUTPUT;
 		data->REG_PWM[5] =3D NCT6106_REG_WEIGHT_DUTY_STEP;
@@ -3798,7 +3888,7 @@ static int nct6775_probe(struct platform
 		data->REG_CRITICAL_PWM =3D NCT6106_REG_CRITICAL_PWM;
 		data->REG_TEMP_OFFSET =3D NCT6106_REG_TEMP_OFFSET;
 		data->REG_TEMP_SOURCE =3D NCT6106_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL =3D NCT6106_REG_TEMP_SEL;
+		data->REG_TEMP_SEL =3D NCT6116_REG_TEMP_SEL;
 		data->REG_WEIGHT_TEMP_SEL =3D =
NCT6106_REG_WEIGHT_TEMP_SEL;
 		data->REG_WEIGHT_TEMP[0] =3D =
NCT6106_REG_WEIGHT_TEMP_STEP;
 		data->REG_WEIGHT_TEMP[1] =3D =
NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
@@ -3821,6 +3911,79 @@ static int nct6775_probe(struct platform
 		reg_temp_crit_h =3D NCT6106_REG_TEMP_CRIT_H;
=20
 		break;
+	case nct6116:
+		data->in_num =3D 9;
+		data->pwm_num =3D 3;
+		data->auto_pwm_num =3D 4;
+		data->temp_fixed_num =3D 3;
+		data->num_temp_alarms =3D 3;
+		data->num_temp_beeps =3D 3;
+
+		data->fan_from_reg =3D fan_from_reg13;
+		data->fan_from_reg_min =3D fan_from_reg13;
+
+		data->temp_label =3D nct6776_temp_label;
+		data->temp_mask =3D NCT6776_TEMP_MASK;
+		data->virt_temp_mask =3D NCT6776_VIRT_TEMP_MASK;
+
+		data->REG_VBAT =3D NCT6106_REG_VBAT;
+		data->REG_DIODE =3D NCT6106_REG_DIODE;
+		data->DIODE_MASK =3D NCT6106_DIODE_MASK;
+		data->REG_VIN =3D NCT6106_REG_IN;
+		data->REG_IN_MINMAX[0] =3D NCT6106_REG_IN_MIN;
+		data->REG_IN_MINMAX[1] =3D NCT6106_REG_IN_MAX;
+		data->REG_TARGET =3D NCT6116_REG_TARGET;
+		data->REG_FAN =3D NCT6116_REG_FAN;
+		data->REG_FAN_MODE =3D NCT6116_REG_FAN_MODE;
+		data->REG_FAN_MIN =3D NCT6116_REG_FAN_MIN;
+		data->REG_FAN_PULSES =3D NCT6116_REG_FAN_PULSES;
+		data->FAN_PULSE_SHIFT =3D NCT6116_FAN_PULSE_SHIFT;
+		data->REG_FAN_TIME[0] =3D NCT6116_REG_FAN_STOP_TIME;
+		data->REG_FAN_TIME[1] =3D NCT6116_REG_FAN_STEP_UP_TIME;
+		data->REG_FAN_TIME[2] =3D =
NCT6116_REG_FAN_STEP_DOWN_TIME;
+		data->REG_TOLERANCE_H =3D NCT6116_REG_TOLERANCE_H;
+		data->REG_PWM[0] =3D NCT6116_REG_PWM;
+		data->REG_PWM[1] =3D NCT6116_REG_FAN_START_OUTPUT;
+		data->REG_PWM[2] =3D NCT6116_REG_FAN_STOP_OUTPUT;
+		data->REG_PWM[5] =3D NCT6106_REG_WEIGHT_DUTY_STEP;
+		data->REG_PWM[6] =3D NCT6106_REG_WEIGHT_DUTY_BASE;
+		data->REG_PWM_READ =3D NCT6106_REG_PWM_READ;
+		data->REG_PWM_MODE =3D NCT6106_REG_PWM_MODE;
+		data->PWM_MODE_MASK =3D NCT6106_PWM_MODE_MASK;
+		data->REG_AUTO_TEMP =3D NCT6116_REG_AUTO_TEMP;
+		data->REG_AUTO_PWM =3D NCT6116_REG_AUTO_PWM;
+		data->REG_CRITICAL_TEMP =3D NCT6116_REG_CRITICAL_TEMP;
+		data->REG_CRITICAL_TEMP_TOLERANCE
+		  =3D NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
+		data->REG_CRITICAL_PWM_ENABLE =3D =
NCT6116_REG_CRITICAL_PWM_ENABLE;
+		data->CRITICAL_PWM_ENABLE_MASK
+		  =3D NCT6106_CRITICAL_PWM_ENABLE_MASK;
+		data->REG_CRITICAL_PWM =3D NCT6116_REG_CRITICAL_PWM;
+		data->REG_TEMP_OFFSET =3D NCT6106_REG_TEMP_OFFSET;
+		data->REG_TEMP_SOURCE =3D NCT6116_REG_TEMP_SOURCE;
+		data->REG_TEMP_SEL =3D NCT6116_REG_TEMP_SEL;
+		data->REG_WEIGHT_TEMP_SEL =3D =
NCT6106_REG_WEIGHT_TEMP_SEL;
+		data->REG_WEIGHT_TEMP[0] =3D =
NCT6106_REG_WEIGHT_TEMP_STEP;
+		data->REG_WEIGHT_TEMP[1] =3D =
NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
+		data->REG_WEIGHT_TEMP[2] =3D =
NCT6106_REG_WEIGHT_TEMP_BASE;
+		data->REG_ALARM =3D NCT6106_REG_ALARM;
+		data->ALARM_BITS =3D NCT6116_ALARM_BITS;
+		data->REG_BEEP =3D NCT6106_REG_BEEP;
+		data->BEEP_BITS =3D NCT6116_BEEP_BITS;
+
+		reg_temp =3D NCT6106_REG_TEMP;
+		reg_temp_mon =3D NCT6106_REG_TEMP_MON;
+		num_reg_temp =3D ARRAY_SIZE(NCT6106_REG_TEMP);
+		num_reg_temp_mon =3D ARRAY_SIZE(NCT6106_REG_TEMP_MON);
+		reg_temp_over =3D NCT6106_REG_TEMP_OVER;
+		reg_temp_hyst =3D NCT6106_REG_TEMP_HYST;
+		reg_temp_config =3D NCT6106_REG_TEMP_CONFIG;
+		reg_temp_alternate =3D NCT6106_REG_TEMP_ALTERNATE;
+		reg_temp_crit =3D NCT6106_REG_TEMP_CRIT;
+		reg_temp_crit_l =3D NCT6106_REG_TEMP_CRIT_L;
+		reg_temp_crit_h =3D NCT6106_REG_TEMP_CRIT_H;
+
+		break;
 	case nct6775:
 		data->in_num =3D 9;
 		data->pwm_num =3D 3;
@@ -4366,6 +4529,7 @@ static int nct6775_probe(struct platform
 		data->have_vid =3D (cr2a & 0x60) =3D=3D 0x40;
 		break;
 	case nct6106:
+	case nct6116:
 	case nct6779:
 	case nct6791:
 	case nct6792:
@@ -4395,6 +4559,7 @@ static int nct6775_probe(struct platform
 				  NCT6775_REG_CR_FAN_DEBOUNCE);
 		switch (data->kind) {
 		case nct6106:
+		case nct6116:
 			tmp |=3D 0xe0;
 			break;
 		case nct6775:
@@ -4590,6 +4755,9 @@ static int __init nct6775_find(int sioad
 	case SIO_NCT6106_ID:
 		sio_data->kind =3D nct6106;
 		break;
+	case SIO_NCT6116_ID:
+		sio_data->kind =3D nct6116;
+		break;
 	case SIO_NCT6775_ID:
 		sio_data->kind =3D nct6775;
 		break;

