Return-Path: <SRS0=6RM0=VN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275EDC76188
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jul 2019 13:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E02012173B
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jul 2019 13:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qp1jMvd/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733137AbfGPNoO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Jul 2019 09:44:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40135 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733132AbfGPNoO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Jul 2019 09:44:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id p184so9139043pfp.7
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2019 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pzz6qa90xHehZ6rMmJH+Crjgxy2oMJHNmmeGm0ekUPc=;
        b=Qp1jMvd/hWTuu8V7uk6tbzpFUkIjsVh2BZhk74ycLUUDidkjd5KGbo+pyYIvgvH0x/
         kNk1shZ8qj7MjXtM54mgmIusdUrc4OlE7HVE9k3eZ+e1blU/ye14QClL4bzFWsDKSON2
         IRD/C4M/tF1xiY5PvXtPjj3isGdujAtN+1OS3TLMtDe2OnbkDhHhespcWymZ7qJwrjyX
         DHta55hj6Hgd8a/8uf01tg3hLR/DlihY9iCFytF7E0AzQgXN1i3hyRfbjdAQC/l6D7W4
         hrtJFIC2MBB9lGLP+f/N2EuuOHreRAn1X66Mvf0lZi2E9gFqigZLiWRc//hMFF2xpszO
         xPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pzz6qa90xHehZ6rMmJH+Crjgxy2oMJHNmmeGm0ekUPc=;
        b=WV1/xQQ4/C4XXslUp2uj0vzaNxOuciUVy4246H+tGY6UMRXKYvvVJYSYD8Knh+1OZp
         iCrnNkwtI7+u0f4DKl8yhp9ce9U/yCOC86OmUVBe2ZKDg7oWS+6f+BH4/Av2IjUlt2ly
         hWI+LHVGd9efr1DyoaRBaGEpGreHUHfQv+FL0rs+/fKCbyJbsYTtkdz6CY1DlNQNmVZL
         Seaybi1E1q2nqcqFdv5+Qm3QoDZGp2tlX0M6xS6jKiVajwV29n7e0wWWXOFEuJT09bzD
         aTZsO+n8QPOdfYsAswYJYe4nifrKElYxiJ2WHHDBIQMR2+uGZyLlQFVAcDVGBdOOwob8
         NSZA==
X-Gm-Message-State: APjAAAXfJAmunaflyEtm9Tlla0bnqnsr49IAhDh3N4MGtRAISxGsh5oP
        HtL84TsVTuek5VwwrFIZ3PMz87bY
X-Google-Smtp-Source: APXvYqzZRH9/PeV/RGiSaysXMSuzD2VI8AGju9LJk/Gb46cyGOU2gt/VCwcxO6oVfShuX58F+DHaTg==
X-Received: by 2002:a63:6ec6:: with SMTP id j189mr34741826pgc.168.1563284652375;
        Tue, 16 Jul 2019 06:44:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r6sm34480307pjb.22.2019.07.16.06.44.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 06:44:11 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
To:     =?UTF-8?Q?Bj=c3=b6rn_Gerhart?= <gerhart@posteo.de>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
Date:   Tue, 16 Jul 2019 06:44:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/19 9:47 AM, Björn Gerhart wrote:
> Hello again and thanks for the early feedback! This is the re-worked patch of the one I sent last week. It’s created against kernel 5.1.15 and already depends on the preceding patch concerning the same code.
> 
> The nct6116 is the successor model of nct6106. Mainly, I’m unsure if certain details of the spec are mapped correctly to the code. These details are:
> - NCT6116_BEEP_BITS

looks good to me.

> - int cr24 (cr23 is new, and I’m unsure if the code has to get modified therefore)

I don't see cr23h in the datasheet available to me. What am I missing ?

But, yes, there are differences:

nct6116:
	cr1ah[2] determines AUXFANIN1/AUXFANOUT1 settings
	cr1b[1-1] and cr2a[1] determine AUXFANIN2/AUXFANOUT2 settings
	cr2b[7] is an alternate for AUXFANIN1/AUXFANOUT1
	cr2b[4] enable AUXFANIN0/AUXFANOUT0 (same as AUXFANIN/AUXFANOUT ?) on pin 6, 14
	cr24[3] enables AUXFANOUT on pin 14

nct6106:
	cr24[7] enables AUXFANIN on pin 6
	cr24[3] enables AUXFANOUT on pin 14

> - NCT6116_REG_FAN_PULSES
> - NCT6116_FAN_PULSE_SHIFT
> - NCT6116_ALARM_BITS
> 
> With the nct6116 wired on my mainboard, the sensors command seems to work as I would expect.
> 
> Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>
> ---
> --- nct6775-5.1.15-1.el7.elrepo.x86_64-bugfixed/nct6775.c	2019-07-10 17:08:30.710690605 +0200
> +++ nct6775/nct6775.c	2019-07-10 17:30:38.012416414 +0200
> @@ -34,6 +34,7 @@
>    *
>    * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
>    * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
> + * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
>    * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
>    * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
>    * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
> @@ -72,12 +73,13 @@
>   
>   #define USE_ALTERNATE
>   
> -enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
> -	     nct6795, nct6796, nct6797, nct6798 };
> +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
> +	     nct6793, nct6795, nct6796, nct6797, nct6798 };
>   
>   /* used to set data->name = nct6775_device_names[data->sio_kind] */
>   static const char * const nct6775_device_names[] = {
>   	"nct6106",
> +	"nct6116",
>   	"nct6775",
>   	"nct6776",
>   	"nct6779",
> @@ -92,6 +94,7 @@
>   
>   static const char * const nct6775_sio_names[] __initconst = {
>   	"NCT6106D",
> +	"NCT6116D",
>   	"NCT6775F",
>   	"NCT6776D/F",
>   	"NCT6779D",
> @@ -129,6 +132,7 @@
>   #define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
>   
>   #define SIO_NCT6106_ID		0xc450
> +#define SIO_NCT6116_ID		0xd280
>   #define SIO_NCT6775_ID		0xb470
>   #define SIO_NCT6776_ID		0xc330
>   #define SIO_NCT6779_ID		0xc560
> @@ -910,6 +914,119 @@
>   	[12] = 0x205,
>   };
>   
> +/* NCT6112D/NCT6114D/NCT6116D specific data */
> +
> +#define NCT6116_REG_VBAT	0x318
> +#define NCT6116_REG_DIODE	0x319
> +#define NCT6116_DIODE_MASK	0x01
> +
> +static const u16 NCT6116_REG_IN_MAX[] = {
> +	0x90, 0x92, 0x94, 0x96, 0x98, 0x9a, 0x9e, 0xa0, 0xa2 };
> +static const u16 NCT6116_REG_IN_MIN[] = {
> +	0x91, 0x93, 0x95, 0x97, 0x99, 0x9b, 0x9f, 0xa1, 0xa3 };
> +static const u16 NCT6116_REG_IN[] = {
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09 };
> +
> +static const u16 NCT6116_REG_TEMP[] = { 0x10, 0x11, 0x12 };
> +static const u16 NCT6116_REG_TEMP_MON[] = { 0x18, 0x19, 0x1a };
> +static const u16 NCT6116_REG_TEMP_HYST[] = { 0xc3, 0xc7, 0xcb };
> +static const u16 NCT6116_REG_TEMP_OVER[] = { 0xc2, 0xc6, 0xca };
> +static const u16 NCT6116_REG_TEMP_CRIT_L[] = { 0xc0, 0xc4, 0xc8 };
> +static const u16 NCT6116_REG_TEMP_CRIT_H[] = { 0xc1, 0xc5, 0xc9 };
> +static const u16 NCT6116_REG_TEMP_OFFSET[] = { 0x311, 0x312, 0x313 };
> +static const u16 NCT6116_REG_TEMP_CONFIG[] = { 0xb7, 0xb8, 0xb9 };
> +
> +static const u16 NCT6116_REG_FAN[] = { 0x20, 0x22, 0x24, 0x26, 0x28 };
> +static const u16 NCT6116_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4, 0xe6, 0xe8 };
> +static const u16 NCT6116_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf6, 0xf6, 0xf5 };
> +static const u16 NCT6116_FAN_PULSE_SHIFT[] = { 0, 2, 4, 6, 6 };
> +
> +static const u8 NCT6116_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3 };
> +static const u8 NCT6116_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04 };
> +static const u16 NCT6116_REG_PWM[] = { 0x119, 0x129, 0x139, 0x199, 0x1a9 };
> +static const u16 NCT6116_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c };
> +static const u16 NCT6116_REG_FAN_MODE[] = { 0x113, 0x123, 0x133, 0x193, 0x1a3 };
> +static const u16 NCT6116_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130, 0x190, 0x1a0 };
> +static const u16 NCT6116_REG_TEMP_SOURCE[] = { 0xb0, 0xb1, 0xb2 };
> +
> +static const u16 NCT6116_REG_CRITICAL_TEMP[] = {
> +	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
> +static const u16 NCT6116_REG_CRITICAL_TEMP_TOLERANCE[] = {
> +	0x11b, 0x12b, 0x13b, 0x19b, 0x1ab };
> +
> +static const u16 NCT6116_REG_CRITICAL_PWM_ENABLE[] = {
> +	0x11c, 0x12c, 0x13c, 0x19c, 0x1ac };
> +#define NCT6116_CRITICAL_PWM_ENABLE_MASK	0x10
> +static const u16 NCT6116_REG_CRITICAL_PWM[] = {
> +	0x11d, 0x12d, 0x13d, 0x19d, 0x1ad };
> +
> +static const u16 NCT6116_REG_FAN_STEP_UP_TIME[] = {
> +	0x114, 0x124, 0x134, 0x194, 0x1a4 };
> +static const u16 NCT6116_REG_FAN_STEP_DOWN_TIME[] = {
> +	0x115, 0x125, 0x135, 0x195, 0x1a5 };
> +static const u16 NCT6116_REG_FAN_STOP_OUTPUT[] = {
> +	0x116, 0x126, 0x136, 0x196, 0x1a6 };
> +static const u16 NCT6116_REG_FAN_START_OUTPUT[] = {
> +	0x117, 0x127, 0x137, 0x197, 0x1a7 };
> +static const u16 NCT6116_REG_FAN_STOP_TIME[] = {
> +	0x118, 0x128, 0x138, 0x198, 0x1a8 };
> +static const u16 NCT6116_REG_TOLERANCE_H[] = {
> +	0x112, 0x122, 0x132, 0x192, 0x1a2 };
> +
> +static const u16 NCT6116_REG_TARGET[] = {
> +	0x111, 0x121, 0x131, 0x191, 0x1a1 };
> +
> +static const u16 NCT6116_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188 };
> +static const u16 NCT6116_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189 };
> +static const u16 NCT6116_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a };
> +static const u16 NCT6116_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b };
> +static const u16 NCT6116_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c };
> +static const u16 NCT6116_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d };
> +
> +static const u16 NCT6116_REG_AUTO_TEMP[] = {
> +	0x160, 0x170, 0x180, 0x1d0, 0x1e0 };
> +static const u16 NCT6116_REG_AUTO_PWM[] = {
> +	0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
> +
> +static const u16 NCT6116_REG_ALARM[NUM_REG_ALARM] = {
> +	0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d };
> +
> +static const s8 NCT6116_ALARM_BITS[] = {
> +	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> +	9, -1, -1, -1, -1, -1, -1,	/* in8..in9 */
> +	-1,				/* unused */
> +	32, 33, 34, 35, 36,		/* fan1..fan5 */
> +	-1, -1, -1,			/* unused */
> +	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
> +	48, -1				/* intrusion0, intrusion1 */
> +};
> +
> +static const u16 NCT6116_REG_BEEP[NUM_REG_BEEP] = {
> +	0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c4 };
> +
> +static const s8 NCT6116_BEEP_BITS[] = {
> +	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
> +	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
> +	32,				/* global beep enable */
> +	24, 25, 26, 27, 28,		/* fan1..fan5 */
> +	-1, -1, -1,			/* unused */
> +	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
> +	34, -1				/* intrusion0, intrusion1 */
> +};
> +
> +static const u16 NCT6116_REG_TEMP_ALTERNATE[32] = {
> +	[14] = 0x51,
> +	[15] = 0x52,
> +	[16] = 0x54,
> +};
> +
> +static const u16 NCT6116_REG_TEMP_CRIT[32] = {
> +	[11] = 0x204,
> +	[12] = 0x205,
> +};
> +
Unfortunately, this time you duplicated data for _all_ registers, not just
the different ones. Idea is to retain the registers which don't change
and only list the changed registers for a new chip.

> +
> +
No more than one empty line, please.

>   static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
>   {
>   	if (mode == 0 && pwm == 255)
> @@ -1308,6 +1425,11 @@
>   		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
>   		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
>   		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> +	case nct6116:
> +		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> +		  reg == 0x26 || reg == 0x28 || reg == 0xe0 || reg == 0xe2 ||
> +		  reg == 0xe4 || reg == 0xe6 || reg == 0xe8 || reg == 0x111 ||
> +		  reg == 0x121 || reg == 0x131 || reg == 0x191 || reg == 0x1a1;
>   	case nct6775:
>   		return (((reg & 0xff00) == 0x100 ||
>   		    (reg & 0xff00) == 0x200) &&
> @@ -1687,6 +1809,7 @@
>   			data->auto_pwm[i][data->auto_pwm_num] = 0xff;
>   			break;
>   		case nct6106:
> +		case nct6116:
>   		case nct6779:
>   		case nct6791:
>   		case nct6792:
> @@ -3123,6 +3246,7 @@
>   		case nct6776:
>   			break; /* always enabled, nothing to do */
>   		case nct6106:
> +		case nct6116:
>   		case nct6779:
>   		case nct6791:
>   		case nct6792:
> @@ -3544,7 +3668,7 @@
>   
>   		fan4min = fan4pin;
>   		pwm3pin = fan3pin;
> -	} else if (data->kind == nct6106) {
> +	} else if ((data->kind == nct6106) || (data->kind == nct6116)) {

nct6116 will need a separate if statement per above.

>   		int cr24 = superio_inb(sioreg, 0x24);
>   
>   		fan3pin = !(cr24 & 0x80);
> @@ -3821,6 +3945,79 @@
>   		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
>   
>   		break;
> +	case nct6116:
> +		data->in_num = 9;
> +		data->pwm_num = 3;
> +		data->auto_pwm_num = 4;
> +		data->temp_fixed_num = 3;
> +		data->num_temp_alarms = 3;
> +		data->num_temp_beeps = 3;
> +
> +		data->fan_from_reg = fan_from_reg13;
> +		data->fan_from_reg_min = fan_from_reg13;
> +
> +		data->temp_label = nct6776_temp_label;
> +		data->temp_mask = NCT6776_TEMP_MASK;
> +		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
> +
> +		data->REG_VBAT = NCT6116_REG_VBAT;
> +		data->REG_DIODE = NCT6116_REG_DIODE;
> +		data->DIODE_MASK = NCT6116_DIODE_MASK;
> +		data->REG_VIN = NCT6116_REG_IN;
> +		data->REG_IN_MINMAX[0] = NCT6116_REG_IN_MIN;
> +		data->REG_IN_MINMAX[1] = NCT6116_REG_IN_MAX;
> +		data->REG_TARGET = NCT6116_REG_TARGET;
> +		data->REG_FAN = NCT6116_REG_FAN;
> +		data->REG_FAN_MODE = NCT6116_REG_FAN_MODE;
> +		data->REG_FAN_MIN = NCT6116_REG_FAN_MIN;
> +		data->REG_FAN_PULSES = NCT6116_REG_FAN_PULSES;
> +		data->FAN_PULSE_SHIFT = NCT6116_FAN_PULSE_SHIFT;
> +		data->REG_FAN_TIME[0] = NCT6116_REG_FAN_STOP_TIME;
> +		data->REG_FAN_TIME[1] = NCT6116_REG_FAN_STEP_UP_TIME;
> +		data->REG_FAN_TIME[2] = NCT6116_REG_FAN_STEP_DOWN_TIME;
> +		data->REG_TOLERANCE_H = NCT6116_REG_TOLERANCE_H;
> +		data->REG_PWM[0] = NCT6116_REG_PWM;
> +		data->REG_PWM[1] = NCT6116_REG_FAN_START_OUTPUT;
> +		data->REG_PWM[2] = NCT6116_REG_FAN_STOP_OUTPUT;
> +		data->REG_PWM[5] = NCT6116_REG_WEIGHT_DUTY_STEP;
> +		data->REG_PWM[6] = NCT6116_REG_WEIGHT_DUTY_BASE;
> +		data->REG_PWM_READ = NCT6116_REG_PWM_READ;
> +		data->REG_PWM_MODE = NCT6116_REG_PWM_MODE;
> +		data->PWM_MODE_MASK = NCT6116_PWM_MODE_MASK;
> +		data->REG_AUTO_TEMP = NCT6116_REG_AUTO_TEMP;
> +		data->REG_AUTO_PWM = NCT6116_REG_AUTO_PWM;
> +		data->REG_CRITICAL_TEMP = NCT6116_REG_CRITICAL_TEMP;
> +		data->REG_CRITICAL_TEMP_TOLERANCE
> +		  = NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
> +		data->REG_CRITICAL_PWM_ENABLE = NCT6116_REG_CRITICAL_PWM_ENABLE;
> +		data->CRITICAL_PWM_ENABLE_MASK
> +		  = NCT6116_CRITICAL_PWM_ENABLE_MASK;
> +		data->REG_CRITICAL_PWM = NCT6116_REG_CRITICAL_PWM;
> +		data->REG_TEMP_OFFSET = NCT6116_REG_TEMP_OFFSET;
> +		data->REG_TEMP_SOURCE = NCT6116_REG_TEMP_SOURCE;
> +		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
> +		data->REG_WEIGHT_TEMP_SEL = NCT6116_REG_WEIGHT_TEMP_SEL;
> +		data->REG_WEIGHT_TEMP[0] = NCT6116_REG_WEIGHT_TEMP_STEP;
> +		data->REG_WEIGHT_TEMP[1] = NCT6116_REG_WEIGHT_TEMP_STEP_TOL;
> +		data->REG_WEIGHT_TEMP[2] = NCT6116_REG_WEIGHT_TEMP_BASE;
> +		data->REG_ALARM = NCT6116_REG_ALARM;
> +		data->ALARM_BITS = NCT6116_ALARM_BITS;
> +		data->REG_BEEP = NCT6116_REG_BEEP;
> +		data->BEEP_BITS = NCT6116_BEEP_BITS;
> +
> +		reg_temp = NCT6116_REG_TEMP;
> +		reg_temp_mon = NCT6116_REG_TEMP_MON;
> +		num_reg_temp = ARRAY_SIZE(NCT6116_REG_TEMP);
> +		num_reg_temp_mon = ARRAY_SIZE(NCT6116_REG_TEMP_MON);
> +		reg_temp_over = NCT6116_REG_TEMP_OVER;
> +		reg_temp_hyst = NCT6116_REG_TEMP_HYST;
> +		reg_temp_config = NCT6116_REG_TEMP_CONFIG;
> +		reg_temp_alternate = NCT6116_REG_TEMP_ALTERNATE;
> +		reg_temp_crit = NCT6116_REG_TEMP_CRIT;
> +		reg_temp_crit_l = NCT6116_REG_TEMP_CRIT_L;
> +		reg_temp_crit_h = NCT6116_REG_TEMP_CRIT_H;
> +
> +		break;
>   	case nct6775:
>   		data->in_num = 9;
>   		data->pwm_num = 3;
> @@ -4366,6 +4563,7 @@
>   		data->have_vid = (cr2a & 0x60) == 0x40;
>   		break;
>   	case nct6106:
> +	case nct6116:
>   	case nct6779:
>   	case nct6791:
>   	case nct6792:
> @@ -4397,6 +4595,9 @@
>   		case nct6106:
>   			tmp |= 0xe0;
>   			break;
> +		case nct6116:
> +			tmp |= 0xe0;
> +			break;
>   		case nct6775:
>   			tmp |= 0x1e;
>   			break;
> @@ -4590,6 +4791,9 @@
>   	case SIO_NCT6106_ID:
>   		sio_data->kind = nct6106;
>   		break;
> +	case SIO_NCT6116_ID:
> +		sio_data->kind = nct6116;
> +		break;
>   	case SIO_NCT6775_ID:
>   		sio_data->kind = nct6775;
>   		break;
> 
> 

