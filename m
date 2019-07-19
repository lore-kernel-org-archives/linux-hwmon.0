Return-Path: <SRS0=zEzc=VQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A85CC7618F
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 19:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E4762085A
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Jul 2019 19:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmIQthQz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfGSTh4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Jul 2019 15:37:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37424 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbfGSThz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Jul 2019 15:37:55 -0400
Received: by mail-pg1-f196.google.com with SMTP id i70so4148481pgd.4
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2019 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Aixx/V4+FD6CG1yHezu6jJHbckMHZ3DmQzMZxeQO18s=;
        b=gmIQthQzEr+6UzYSnUN6DLDnD+OzFlQr/oT29cwqQhqhwX61b044BJiPfHx8ku1y4M
         VFqVv9cxH6/Ulwo0tK/n/YnJ3sCNAd9936ghtW18cA1XRWFF6RO2DynEjqPnugeWkZKR
         ZkAr9rYRrRA3WZ3UpU+lT1hcDz/RJJr52OSu40Pegy0DYOK1WMlO+QL+vpmFswWYTYkb
         G2tZGHXVniQODmdp9+LCWfZF0Bq6rTpd9dsZ+wBsDQcVrri+fdhIL6VFSpTSwXmFo/tK
         TcgHdh//iA4/2S4kyyfh6aUddWIZuh6S5Jv1Wa6al66Ncdqh9XXBPSv/BgWHgF8Ag5Ic
         vBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=Aixx/V4+FD6CG1yHezu6jJHbckMHZ3DmQzMZxeQO18s=;
        b=Y9AR5vVPcGp2neYxaAvTtBDwoHCBI0frbvHajAVaj/JV5SArCS8EgvCDQcagX/B9ed
         Z5RwHM3hkmi66g5gVQVWnSyUdCDbEV0pG5MxFNVNyn9CM+B4hiy3EbKY6Za6Akp48vFD
         cFjGO32zWq/zcatmx4lFQC7boHHwW0bOMWBcRGOmw34GjalOmBtwg54vaHQK7kCMCLbn
         z1kMiVM6Mkhi2mKnDl7OqRgVXnhXjOJXEuCaErwGrTOemEDIl1yqV2f9mW17K4F6Wkks
         NHD6aRIttS7WtaJlSazhmhQncZFxJyVYuEsdHLsZ39AEbvmsN5AXlpNOeVm6LE9E/jYk
         fYdw==
X-Gm-Message-State: APjAAAXrrJ2F8wFcZ7inb2jsL8GWeCgtqFQrK/6nF2bnil8yARLWW+mC
        PTgjiXBd458ogkK+9+3Cwm2ckQMf
X-Google-Smtp-Source: APXvYqwj12REfsIpCmOlrpFU4Bh9eq7DNsX20OHcnwHQqdn9MT3FOlPpupkhx2lWa6SNlFH6sNy4bg==
X-Received: by 2002:a63:607:: with SMTP id 7mr55165151pgg.240.1563565074812;
        Fri, 19 Jul 2019 12:37:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w197sm42005660pfd.41.2019.07.19.12.37.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 12:37:53 -0700 (PDT)
Date:   Fri, 19 Jul 2019 12:37:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
Message-ID: <20190719193752.GA17575@roeck-us.net>
References: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
 <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
 <ABE6F128-F3AC-42F3-A970-BAF90A7A4727@posteo.de>
 <1940BFD4-9943-4E7F-B78A-8A15AA868C57@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1940BFD4-9943-4E7F-B78A-8A15AA868C57@posteo.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 19, 2019 at 08:01:21PM +0200, Björn Gerhart wrote:
> Hi Guenter,
> 
> I reworked the code after studying the details of the spec.
> 
> Changes:
> - patch created against the tree of the kernel sources base dir
> - only define the different registers in contrast to nct6106
> - fixed details of the fan configuration
> 

Getting closer ... some more comments below.

Thanks,
Guenter

> Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>
> ---
> diff -Naur a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> --- a/drivers/hwmon/nct6775.c	2019-07-19 15:29:34.960278982 +0200
> +++ b/drivers/hwmon/nct6775.c	2019-07-19 15:29:47.332805721 +0200
> @@ -34,6 +34,7 @@
>   *
>   * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
>   * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
> + * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
>   * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
>   * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
>   * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
> @@ -72,12 +73,13 @@
>  
>  #define USE_ALTERNATE
>  
> -enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
> -	     nct6795, nct6796, nct6797, nct6798 };
> +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
> +	     nct6793, nct6795, nct6796, nct6797, nct6798 };
>  
>  /* used to set data->name = nct6775_device_names[data->sio_kind] */
>  static const char * const nct6775_device_names[] = {
>  	"nct6106",
> +	"nct6116",
>  	"nct6775",
>  	"nct6776",
>  	"nct6779",
> @@ -92,6 +94,7 @@
>  
>  static const char * const nct6775_sio_names[] __initconst = {
>  	"NCT6106D",
> +	"NCT6116D",
>  	"NCT6775F",
>  	"NCT6776D/F",
>  	"NCT6779D",
> @@ -129,6 +132,7 @@
>  #define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
>  
>  #define SIO_NCT6106_ID		0xc450
> +#define SIO_NCT6116_ID		0xd280
>  #define SIO_NCT6775_ID		0xb470
>  #define SIO_NCT6776_ID		0xc330
>  #define SIO_NCT6779_ID		0xc560
> @@ -910,6 +914,78 @@
>  	[12] = 0x205,
>  };
>  
> +/* NCT6112D/NCT6114D/NCT6116D specific data */
> +
> +static const u16 NCT6116_REG_TEMP[] = { 0x10, 0x11, 0x12 };
	Unnecessary: The first three registers in NCT6106_REG_TEMP
	match.
> +static const u16 NCT6116_REG_TEMP_HYST[] = { 0xc3, 0xc7, 0xcb };
> +static const u16 NCT6116_REG_TEMP_OVER[] = { 0xc2, 0xc6, 0xca };
> +static const u16 NCT6116_REG_TEMP_CRIT_L[] = { 0xc0, 0xc4, 0xc8 };
> +static const u16 NCT6116_REG_TEMP_CRIT_H[] = { 0xc1, 0xc5, 0xc9 };
> +static const u16 NCT6116_REG_TEMP_CONFIG[] = { 0xb7, 0xb8, 0xb9 };
	Same for all of the above.
> +
> +static const u16 NCT6116_REG_FAN[] = { 0x20, 0x22, 0x24, 0x26, 0x28 };
> +static const u16 NCT6116_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4, 0xe6, 0xe8 };
> +static const u16 NCT6116_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf6, 0xf6, 0xf5 };
> +static const u16 NCT6116_FAN_PULSE_SHIFT[] = { 0, 2, 4, 6, 6 };
> +
> +static const u8 NCT6116_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3 };
> +static const u8 NCT6116_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04 };
	The above two defines match 6106.

> +static const u16 NCT6116_REG_PWM[] = { 0x119, 0x129, 0x139, 0x199, 0x1a9 };
> +static const u16 NCT6116_REG_FAN_MODE[] = { 0x113, 0x123, 0x133, 0x193, 0x1a3 };
> +static const u16 NCT6116_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130, 0x190, 0x1a0 };
> +static const u16 NCT6116_REG_TEMP_SOURCE[] = { 0xb0, 0xb1, 0xb2 };
	NCT6116_REG_TEMP_SEL and NCT6116_REG_TEMP_SOURCE not needed (as above)

> +
> +static const u16 NCT6116_REG_CRITICAL_TEMP[] = {
> +	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
> +static const u16 NCT6116_REG_CRITICAL_TEMP_TOLERANCE[] = {
> +	0x11b, 0x12b, 0x13b, 0x19b, 0x1ab };
> +
> +static const u16 NCT6116_REG_CRITICAL_PWM_ENABLE[] = {
> +	0x11c, 0x12c, 0x13c, 0x19c, 0x1ac };
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
> +static const u16 NCT6116_REG_AUTO_TEMP[] = {
> +	0x160, 0x170, 0x180, 0x1d0, 0x1e0 };
> +static const u16 NCT6116_REG_AUTO_PWM[] = {
> +	0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
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
>  static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
>  {
>  	if (mode == 0 && pwm == 255)
> @@ -1308,6 +1384,11 @@
>  		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
>  		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
>  		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> +	case nct6116:
> +		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> +		  reg == 0x26 || reg == 0x28 || reg == 0xe0 || reg == 0xe2 ||
> +		  reg == 0xe4 || reg == 0xe6 || reg == 0xe8 || reg == 0x111 ||
> +		  reg == 0x121 || reg == 0x131 || reg == 0x191 || reg == 0x1a1;
>  	case nct6775:
>  		return (((reg & 0xff00) == 0x100 ||
>  		    (reg & 0xff00) == 0x200) &&
> @@ -1687,6 +1768,7 @@
>  			data->auto_pwm[i][data->auto_pwm_num] = 0xff;
>  			break;
>  		case nct6106:
> +		case nct6116:
>  		case nct6779:
>  		case nct6791:
>  		case nct6792:
> @@ -3123,6 +3205,7 @@
>  		case nct6776:
>  			break; /* always enabled, nothing to do */
>  		case nct6106:
> +		case nct6116:
>  		case nct6779:
>  		case nct6791:
>  		case nct6792:
> @@ -3549,6 +3632,28 @@
>  
>  		fan3pin = !(cr24 & 0x80);
>  		pwm3pin = cr24 & 0x08;
> +	} else if (data->kind == nct6116) {
> +		int cr1a = superio_inb(sioreg, 0x1a);
> +		int cr1b = superio_inb(sioreg, 0x1b);
> +		int cr24 = superio_inb(sioreg, 0x24);
> +		int cr2a = superio_inb(sioreg, 0x2a);
> +		int cr2b = superio_inb(sioreg, 0x2b);
> +		int cr2f = superio_inb(sioreg, 0x2f);
> +

This thing drives me crazy. Bear with me if I gat something
(or everything) wrong below.

> +		fan3pin = !(cr2b & 0x10);

That seems correct.

> +		if (!(cr2f & 0x10))
> +			fan4pin = cr1a & 0x04;
> +		else
> +			fan4pin = 0;

else is unnecessary; fan4pin is false by default. 
Overall,
		fan4pin = !(cr2f & 0x10) && (cr1a & 0x04);
might be a bit easier and would avoid the if/else.

However, I think it should be
		fan4pin = (cr2b & 0x80) ||			// pin 1
			(!(cr2f & 0x10) && (cr1a & 0x04));	// pin 65

> +
> +		if (!(cr1b & 0x03))
> +			fan5pin = cr2a & 0x02;
> +		else
> +			fan5pin = cr2b & 0x80;
> +

		fan5pin = (cr2b & 0x80) ||			// pin 126
			(!(cr1b & 0x03) && (cr2a & 0x02));	// pin 96

> +		pwm3pin = cr24 & 0x08;

The comments associated with GPIO8 group in combination with the pinout
suggest that it should be
		pwm3pin = fan3pin && (cr24 & 0x08);

> +		pwm4pin = cr2b & 0x80;

I think it is:
		pwm4pin = (cr2b & 0x80) ||			// pin 2
			(!(cr2f & 0x10) && (cr1a & 0x04));	// pin 66
or, in other words,
		pwm4pin = fan4pin;

> +		pwm5pin = pwm4pin;

Same here:
		pwm5pin = (cr2b & 0x80) ||			// pin 127
			(!(cr1b & 0x03) && (cr2a & 0x02));	// pin 96

or, in other words,
		pwm5pin = fan5pin;

Does this make sense ?

>  	} else {
>  		/*
>  		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> @@ -3821,6 +3926,79 @@
>  		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
>  
>  		break;
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
> +		data->REG_VBAT = NCT6106_REG_VBAT;
> +		data->REG_DIODE = NCT6106_REG_DIODE;
> +		data->DIODE_MASK = NCT6106_DIODE_MASK;
> +		data->REG_VIN = NCT6106_REG_IN;
> +		data->REG_IN_MINMAX[0] = NCT6106_REG_IN_MIN;
> +		data->REG_IN_MINMAX[1] = NCT6106_REG_IN_MAX;
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
> +		data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
> +		data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
> +		data->REG_PWM_READ = NCT6106_REG_PWM_READ;
> +		data->REG_PWM_MODE = NCT6116_REG_PWM_MODE;
> +		data->PWM_MODE_MASK = NCT6116_PWM_MODE_MASK;
> +		data->REG_AUTO_TEMP = NCT6116_REG_AUTO_TEMP;
> +		data->REG_AUTO_PWM = NCT6116_REG_AUTO_PWM;
> +		data->REG_CRITICAL_TEMP = NCT6116_REG_CRITICAL_TEMP;
> +		data->REG_CRITICAL_TEMP_TOLERANCE
> +		  = NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
> +		data->REG_CRITICAL_PWM_ENABLE = NCT6116_REG_CRITICAL_PWM_ENABLE;
> +		data->CRITICAL_PWM_ENABLE_MASK
> +		  = NCT6106_CRITICAL_PWM_ENABLE_MASK;
> +		data->REG_CRITICAL_PWM = NCT6116_REG_CRITICAL_PWM;
> +		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
> +		data->REG_TEMP_SOURCE = NCT6116_REG_TEMP_SOURCE;
> +		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
> +		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
> +		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
> +		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
> +		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
> +		data->REG_ALARM = NCT6106_REG_ALARM;
> +		data->ALARM_BITS = NCT6116_ALARM_BITS;
> +		data->REG_BEEP = NCT6106_REG_BEEP;
> +		data->BEEP_BITS = NCT6116_BEEP_BITS;
> +
> +		reg_temp = NCT6116_REG_TEMP;
> +		reg_temp_mon = NCT6106_REG_TEMP_MON;
> +		num_reg_temp = ARRAY_SIZE(NCT6116_REG_TEMP);
> +		num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
> +		reg_temp_over = NCT6116_REG_TEMP_OVER;
> +		reg_temp_hyst = NCT6116_REG_TEMP_HYST;
> +		reg_temp_config = NCT6116_REG_TEMP_CONFIG;
> +		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
> +		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
> +		reg_temp_crit_l = NCT6116_REG_TEMP_CRIT_L;
> +		reg_temp_crit_h = NCT6116_REG_TEMP_CRIT_H;
> +
> +		break;
>  	case nct6775:
>  		data->in_num = 9;
>  		data->pwm_num = 3;
> @@ -4366,6 +4544,7 @@
>  		data->have_vid = (cr2a & 0x60) == 0x40;
>  		break;
>  	case nct6106:
> +	case nct6116:
>  	case nct6779:
>  	case nct6791:
>  	case nct6792:
> @@ -4397,6 +4576,9 @@
>  		case nct6106:
>  			tmp |= 0xe0;
>  			break;
> +		case nct6116:
> +			tmp |= 0xe0;
> +			break;

Please combine above case statements.

>  		case nct6775:
>  			tmp |= 0x1e;
>  			break;
> @@ -4590,6 +4772,9 @@
>  	case SIO_NCT6106_ID:
>  		sio_data->kind = nct6106;
>  		break;
> +	case SIO_NCT6116_ID:
> +		sio_data->kind = nct6116;
> +		break;
>  	case SIO_NCT6775_ID:
>  		sio_data->kind = nct6775;
>  		break;
> 
