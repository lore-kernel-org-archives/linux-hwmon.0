Return-Path: <SRS0=aQnN=VH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4309C74A35
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Jul 2019 20:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71E9420651
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Jul 2019 20:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJSbNvxA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfGJUit (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Jul 2019 16:38:49 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33451 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfGJUis (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jul 2019 16:38:48 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so1801470plo.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2019 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rj8npDUPqjfAvV7rRk+acRPdjBcSnHHL/YF1ynrhqvU=;
        b=JJSbNvxAHEA++0y7CbCW4+XHV0a8JbyAsACxnxsEjSEu41QK3mWOMnVQ+SClINNpx4
         YkEGFb91q2Pd16Unat5wzy3/I1guTRuiSnaXBsapzY94xi8ll1ZbZR4DQpo0uTBIOpWh
         jn2dI3tjmUEDpq1wzQf6o01s3qHz0QN0tV3nZrbFiWlT2guhVBIVBpngKY2jgklPMRzl
         B+plBKIVus6aw1y7STG5fTubtiylc3TZMAcIzDhUjk4vWWJBAqHQEot7w52ccBPMlH3T
         +7rWjoKxG+c2k6NXJ8wpPmHvkPxCtymXhNdzEKurEzhZ6E7n7uOS8niBejE1q+lPBrk4
         NijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=rj8npDUPqjfAvV7rRk+acRPdjBcSnHHL/YF1ynrhqvU=;
        b=VFV2QVo8jmAkeoZ6HfkB3qGi5oV2DR4YT8WUJEaDDMRLd3eyk1WBIf5CARQ8o+2EiU
         eiwvqeZEDSzVSqeraC+Ik3JlAyZyxpWGjnxvQehffTa0CgXZDCjEZxR17T/8PV3Glf8e
         CrBmOdnCRL20djonC2CmiPNGvoRDFDaJHrdPJy5B/MIJApu8L1hLx4IawnuevifkSK9C
         WP13RIIYQXj8vOpbkNyBAl/yILMSMZ81QPWSrgEWnQT4/yxHg7GYvaz1YmhBHOtcO8Mb
         9xnBkQluj1xhY5NHBOAi3LtcoQrJSIwjC1WEVkW5KT+v4DoOp88aCzurmzwswCjFFVC1
         r6nw==
X-Gm-Message-State: APjAAAVEpd7mjIS/Mty/TsNGOgGDGicZ0Mbb433sC6UqfRSX2DwQdP+S
        R4GtuWKEj2OZ0oi0HPWw6UqNy5NW
X-Google-Smtp-Source: APXvYqyMMKjw+sic3gor/xHh5R+KabMoP2X5Eu4ZoDDtLspa+9yoxLryROe1/mMfwIBEduH4Kchghw==
X-Received: by 2002:a17:902:7043:: with SMTP id h3mr233529plt.10.1562791127904;
        Wed, 10 Jul 2019 13:38:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1sm2998738pfi.91.2019.07.10.13.38.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 13:38:46 -0700 (PDT)
Date:   Wed, 10 Jul 2019 13:38:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
Message-ID: <20190710203845.GA6330@roeck-us.net>
References: <F40A0DFF-8B46-4DA3-A111-F729ED2D1327@posteo.de>
 <76CF99AD-62AF-4929-AA67-D441A68B00A0@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76CF99AD-62AF-4929-AA67-D441A68B00A0@posteo.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 10, 2019 at 09:29:55PM +0200, Björn Gerhart wrote:
> oh no, the patch is WRONG as I noticed right now. Sorry for the noise! I’ll re-work it and come back!
> 
Now I have to figure out what you mean ;-).
Couple of comments anyway below.

Guenter

> > Am 10.07.2019 um 21:19 schrieb Björn Gerhart <gerhart@posteo.de>:
> > 
> > The nct6116 is the successor model of nct6106. Mainly I’m unsure about my changes related to:
> > - NCT6116_BEEP_BITS
> > - int cr24 (cr23 is new, and I’m unsure if the code has to get modified therefore)
> > - NCT6116_REG_FAN_PULSES
> > - NCT6116_FAN_PULSE_SHIFT
> > - NCT6116_ALARM_BITS
> > 
> > With the nct6116 wired on my mainboard, the sensors command seems to work as I would expect.
> > 
> > Index: nct6775.c
> > ===================================================================
> > --- nct6775.c	(revision 16313)
> > +++ nct6775.c	(working copy)
> > @@ -34,6 +34,7 @@
> >  *
> >  * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
> >  * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
> > + * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
> >  * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
> >  * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
> >  * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
> > @@ -72,12 +73,13 @@
> > 
> > #define USE_ALTERNATE
> > 
> > -enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
> > -	     nct6795, nct6796, nct6797, nct6798 };
> > +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
> > +	     nct6793, nct6795, nct6796, nct6797, nct6798 };
> > 
> > /* used to set data->name = nct6775_device_names[data->sio_kind] */
> > static const char * const nct6775_device_names[] = {
> > 	"nct6106",
> > +	"nct6116",
> > 	"nct6775",
> > 	"nct6776",
> > 	"nct6779",
> > @@ -92,6 +94,7 @@
> > 
> > static const char * const nct6775_sio_names[] __initconst = {
> > 	"NCT6106D",
> > +	"NCT6116D",
> > 	"NCT6775F",
> > 	"NCT6776D/F",
> > 	"NCT6779D",
> > @@ -129,6 +132,7 @@
> > #define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
> > 
> > #define SIO_NCT6106_ID		0xc450
> > +#define SIO_NCT6116_ID		0xd280
> > #define SIO_NCT6775_ID		0xb470
> > #define SIO_NCT6776_ID		0xc330
> > #define SIO_NCT6779_ID		0xc560
> > @@ -819,18 +823,29 @@
> > 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09 };
> > 
> > static const u16 NCT6106_REG_TEMP[] = { 0x10, 0x11, 0x12, 0x13, 0x14, 0x15 };
> > +static const u16 NCT6116_REG_TEMP[] = { 0x10, 0x11, 0x12 };
> > static const u16 NCT6106_REG_TEMP_MON[] = { 0x18, 0x19, 0x1a };
> > static const u16 NCT6106_REG_TEMP_HYST[] = {
> > 	0xc3, 0xc7, 0xcb, 0xcf, 0xd3, 0xd7 };
> > +static const u16 NCT6116_REG_TEMP_HYST[] = {
> > +	0xc3, 0xc7, 0xcb };

Please move all NCT6116 related declarations/defines together.

> > static const u16 NCT6106_REG_TEMP_OVER[] = {
> > 	0xc2, 0xc6, 0xca, 0xce, 0xd2, 0xd6 };
> > +static const u16 NCT6116_REG_TEMP_OVER[] = {
> > +	0xc2, 0xc6, 0xca };
> > static const u16 NCT6106_REG_TEMP_CRIT_L[] = {
> > 	0xc0, 0xc4, 0xc8, 0xcc, 0xd0, 0xd4 };
> > +static const u16 NCT6116_REG_TEMP_CRIT_L[] = {
> > +	0xc0, 0xc4, 0xc8 };
> > static const u16 NCT6106_REG_TEMP_CRIT_H[] = {
> > 	0xc1, 0xc5, 0xc9, 0xcf, 0xd1, 0xd5 };
> > +static const u16 NCT6116_REG_TEMP_CRIT_H[] = {
> > +	0xc1, 0xc5, 0xc9 };
> > static const u16 NCT6106_REG_TEMP_OFFSET[] = { 0x311, 0x312, 0x313 };
> > static const u16 NCT6106_REG_TEMP_CONFIG[] = {
> > 	0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc };
> > +static const u16 NCT6116_REG_TEMP_CONFIG[] = {
> > +	0xb7, 0xb8, 0xb9 };
> > 
> > static const u16 NCT6106_REG_FAN[] = { 0x20, 0x22, 0x24 };
> > static const u16 NCT6106_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4 };
> > @@ -845,6 +860,8 @@
> > static const u16 NCT6106_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130 };
> > static const u16 NCT6106_REG_TEMP_SOURCE[] = {
> > 	0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
> > +static const u16 NCT6116_REG_TEMP_SOURCE[] = {
> > +	0xb0, 0xb1, 0xb2 };
> > 
> > static const u16 NCT6106_REG_CRITICAL_TEMP[] = { 0x11a, 0x12a, 0x13a };
> > static const u16 NCT6106_REG_CRITICAL_TEMP_TOLERANCE[] = {
> > @@ -886,6 +903,16 @@
> > 	48, -1				/* intrusion0, intrusion1 */
> > };
> > 
> > +static const s8 NCT6116_ALARM_BITS[] = {
> > +	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> > +	9, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
> > +	-1,				/* unused */
> > +	32, 33, 34, -1, -1,		/* fan1..fan5 */
> > +	-1, -1, -1,			/* unused */
> > +	16, 17, 18,			/* temp1..temp3 */
> > +	48, -1				/* intrusion0, intrusion1 */
> > +};
> > +
> > static const u16 NCT6106_REG_BEEP[NUM_REG_BEEP] = {
> > 	0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c4 };
> > 
> > @@ -1308,6 +1335,10 @@
> > 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> > 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
> > 		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> > +	case nct6116:
> > +		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> > +		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
> > +		  reg == 0x111 || reg == 0x121 || reg == 0x131;

Same as case statement for nct6106; please merge.

> > 	case nct6775:
> > 		return (((reg & 0xff00) == 0x100 ||
> > 		    (reg & 0xff00) == 0x200) &&
> > @@ -1687,6 +1718,7 @@
> > 			data->auto_pwm[i][data->auto_pwm_num] = 0xff;
> > 			break;
> > 		case nct6106:
> > +		case nct6116:
> > 		case nct6779:
> > 		case nct6791:
> > 		case nct6792:
> > @@ -3123,6 +3155,7 @@
> > 		case nct6776:
> > 			break; /* always enabled, nothing to do */
> > 		case nct6106:
> > +		case nct6116:
> > 		case nct6779:
> > 		case nct6791:
> > 		case nct6792:
> > @@ -3549,6 +3582,11 @@
> > 
> > 		fan3pin = !(cr24 & 0x80);
> > 		pwm3pin = cr24 & 0x08;
> > +	} else if (data->kind == nct6116) {
> > +		int cr24 = superio_inb(sioreg, 0x24);
> > +
> > +		fan3pin = !(cr24 & 0x80);
> > +		pwm3pin = cr24 & 0x08;

This is the same as the if statement for nct6106. Please merge into a single
if statement.

> > 	} else {
> > 		/*
> > 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> > @@ -3820,6 +3858,78 @@
> > 		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
> > 
> > 		break;
> > +	case nct6116:
> > +		data->in_num = 9;
> > +		data->pwm_num = 3;
> > +		data->auto_pwm_num = 4;
> > +		data->temp_fixed_num = 3;
> > +		data->num_temp_alarms = 3;
> > +		data->num_temp_beeps = 3;
> > +
> > +		data->fan_from_reg = fan_from_reg13;
> > +		data->fan_from_reg_min = fan_from_reg13;
> > +
> > +		data->temp_label = nct6776_temp_label;
> > +		data->temp_mask = NCT6776_TEMP_MASK;
> > +		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
> > +
> > +		data->REG_VBAT = NCT6106_REG_VBAT;
> > +		data->REG_DIODE = NCT6106_REG_DIODE;
> > +		data->DIODE_MASK = NCT6106_DIODE_MASK;
> > +		data->REG_VIN = NCT6106_REG_IN;
> > +		data->REG_IN_MINMAX[0] = NCT6106_REG_IN_MIN;
> > +		data->REG_IN_MINMAX[1] = NCT6106_REG_IN_MAX;
> > +		data->REG_TARGET = NCT6106_REG_TARGET;
> > +		data->REG_FAN = NCT6106_REG_FAN;
> > +		data->REG_FAN_MODE = NCT6106_REG_FAN_MODE;
> > +		data->REG_FAN_MIN = NCT6106_REG_FAN_MIN;
> > +		data->REG_FAN_PULSES = NCT6106_REG_FAN_PULSES;
> > +		data->FAN_PULSE_SHIFT = NCT6106_FAN_PULSE_SHIFT;
> > +		data->REG_FAN_TIME[0] = NCT6106_REG_FAN_STOP_TIME;
> > +		data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
> > +		data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
> > +		data->REG_PWM[0] = NCT6106_REG_PWM;
> > +		data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
> > +		data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
> > +		data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
> > +		data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
> > +		data->REG_PWM_READ = NCT6106_REG_PWM_READ;
> > +		data->REG_PWM_MODE = NCT6106_REG_PWM_MODE;
> > +		data->PWM_MODE_MASK = NCT6106_PWM_MODE_MASK;
> > +		data->REG_AUTO_TEMP = NCT6106_REG_AUTO_TEMP;
> > +		data->REG_AUTO_PWM = NCT6106_REG_AUTO_PWM;
> > +		data->REG_CRITICAL_TEMP = NCT6106_REG_CRITICAL_TEMP;
> > +		data->REG_CRITICAL_TEMP_TOLERANCE
> > +		  = NCT6106_REG_CRITICAL_TEMP_TOLERANCE;
> > +		data->REG_CRITICAL_PWM_ENABLE = NCT6106_REG_CRITICAL_PWM_ENABLE;
> > +		data->CRITICAL_PWM_ENABLE_MASK
> > +		  = NCT6106_CRITICAL_PWM_ENABLE_MASK;
> > +		data->REG_CRITICAL_PWM = NCT6106_REG_CRITICAL_PWM;
> > +		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
> > +		data->REG_TEMP_SOURCE = NCT6116_REG_TEMP_SOURCE;
> > +		data->REG_TEMP_SEL = NCT6106_REG_TEMP_SEL;
> > +		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
> > +		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
> > +		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
> > +		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
> > +		data->REG_ALARM = NCT6106_REG_ALARM;
> > +		data->ALARM_BITS = NCT6116_ALARM_BITS;
> > +		data->REG_BEEP = NCT6106_REG_BEEP;
> > +		data->BEEP_BITS = NCT6106_BEEP_BITS;
> > +
> > +		reg_temp = NCT6116_REG_TEMP;
> > +		reg_temp_mon = NCT6106_REG_TEMP_MON;
> > +		num_reg_temp = ARRAY_SIZE(NCT6116_REG_TEMP);
> > +		num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
> > +		reg_temp_over = NCT6116_REG_TEMP_OVER;
> > +		reg_temp_hyst = NCT6116_REG_TEMP_HYST;
> > +		reg_temp_config = NCT6116_REG_TEMP_CONFIG;
> > +		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
> > +		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
> > +		reg_temp_crit_l = NCT6116_REG_TEMP_CRIT_L;
> > +		reg_temp_crit_h = NCT6116_REG_TEMP_CRIT_H;
> > +
> > +		break;
> > 	case nct6775:
> > 		data->in_num = 9;
> > 		data->pwm_num = 3;
> > @@ -4365,6 +4475,7 @@
> > 		data->have_vid = (cr2a & 0x60) == 0x40;
> > 		break;
> > 	case nct6106:
> > +	case nct6116:
> > 	case nct6779:
> > 	case nct6791:
> > 	case nct6792:
> > @@ -4396,6 +4507,9 @@
> > 		case nct6106:
> > 			tmp |= 0xe0;
> > 			break;
> > +		case nct6116:
> > +			tmp |= 0xe0;
> > +			break;
Identical code; please merge with nct6106 case.

> > 		case nct6775:
> > 			tmp |= 0x1e;
> > 			break;
> > @@ -4589,6 +4703,9 @@
> > 	case SIO_NCT6106_ID:
> > 		sio_data->kind = nct6106;
> > 		break;
> > +	case SIO_NCT6116_ID:
> > +		sio_data->kind = nct6116;
> > +		break;
> > 	case SIO_NCT6775_ID:
> > 		sio_data->kind = nct6775;
> > 		break;
> > 
> 
