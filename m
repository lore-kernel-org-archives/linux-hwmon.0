Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2132BC7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 20:12:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3166218F0
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 20:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXVftPUb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbfGVUMO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 16:12:14 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39003 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfGVUMO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 16:12:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so18182945pgi.6
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=elo/jgJ5a77jtRfwumg4PPmo1uLb1bzIqzszJAaDQj8=;
        b=TXVftPUbA8ux0n9mHr/kbLy47o3wG3AaUUqcC3GNKY7nnDJR8tEik8jGlR3Czu5/tg
         ZVCr8VVV27hkEqegUkADP5AQ+6fzPckSaF0iOfAbX6Z1OCL4ARoF+AGnpLu0Ln49v9Pp
         txWIpaCQg2A54mSYHRKJp8d+iIlNQGPK0zbSO2F+ppT9fG5bWCYRxp15zHqBTPBaMdml
         ymxWWN2FdA2rOKPJGvjWMo8+p21LxrSKgzuY5a4MM0CxjeGfjr512OlKsu4wcqN0Y4TC
         XqeVGqP1FKBHAPo7SEXYXaXH4M2OqZjH3VNKD5r+Zf7oUUOB4lvs81+8RJZHB8aF1Ot5
         NMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=elo/jgJ5a77jtRfwumg4PPmo1uLb1bzIqzszJAaDQj8=;
        b=SMQ/sBbvbhcuUv5smFjDLC/QP/P+jqhbyA/XfnVUODom065mjfTBa1xrCVXGwTpWzG
         1o0THvdNH3RaKH5M2tL8qm9L8f7Bd5boMqoiF/KHK3xyXD1whBHCFTGQWxR904isjL6i
         zXPWY3AxYEuMxFe0jXj+u75PnzgFJ7SBTkIK3CTogUssvup2U8ERprALVFpRXXbdkRhA
         Fu3yzwe1RX2/NWmFUytMo32ND3IXukX08unts7HcrTr/ASXP2YB715Ecpt1GKE8ogTsf
         6OaS++gD5JOBaS7AmRo1VzbBVnfEtvG3JTaZACLULnWUFX+4Sz03xI/yUrgbovcOuRR1
         i9dQ==
X-Gm-Message-State: APjAAAWH4pKlZGl4thEvHZ4FIZS0xz+fT3CAthmtBT3hKxE05tfri+aW
        tSl8s5p/fAtXfHQfXNozb3Sbgs8A
X-Google-Smtp-Source: APXvYqxdA4JmSR8kDgX+gns/JCCPtA7u75eu3Z5hnnovBJr0JV9+uDfdQWhXn+NHUXD3PJFdsmgP0Q==
X-Received: by 2002:a63:5a4d:: with SMTP id k13mr70868318pgm.174.1563826333438;
        Mon, 22 Jul 2019 13:12:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s66sm43157991pfs.8.2019.07.22.13.12.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 13:12:12 -0700 (PDT)
Date:   Mon, 22 Jul 2019 13:12:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Integrated new model nct6116
Message-ID: <20190722201211.GA20957@roeck-us.net>
References: <EF878FB0-E5F3-41A2-9970-572B716AF973@posteo.de>
 <1d123c12-f8f3-729e-35ad-95f6c3289e15@roeck-us.net>
 <ABE6F128-F3AC-42F3-A970-BAF90A7A4727@posteo.de>
 <1940BFD4-9943-4E7F-B78A-8A15AA868C57@posteo.de>
 <20190719193752.GA17575@roeck-us.net>
 <ed5c1d6701258f740de6d7328285b35e@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed5c1d6701258f740de6d7328285b35e@posteo.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 07:46:58PM +0200, Björn Gerhart wrote:
> Thanks for the review Guenter, I checked your proposals, and here I comes an
> update of the patch.
> 
> Changes:
> - simplified differences in register addresses
> - fixed fan enablements
> - simplified case statement
> 
> Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>

Formatting is all messed up :-(. Can you have a look ?

Thanks,
Guenter

> ---
> diff -Naur a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> --- a/drivers/hwmon/nct6775.c 2019-07-10 17:08:30.710690605 +0200
> +++ b/drivers/hwmon/nct6775.c 2019-07-22 16:02:17.363091327 +0200
> @@ -34,6 +34,7 @@
>  *
>  * Chip #vin #fan #pwm #temp chip IDs man ID
>  * nct6106d 9 3 3 6+3 0xc450 0xc1 0x5ca3
> + * nct6116d 9 5 5 3+3 0xd280 0xc1 0x5ca3
>  * nct6775f 9 4 3 6+3 0xb470 0xc1 0x5ca3
>  * nct6776f 9 5 3 6+3 0xc330 0xc1 0x5ca3
>  * nct6779d 15 5 5 2+6 0xc560 0xc1 0x5ca3
> @@ -72,12 +73,13 @@
> 
>  #define USE_ALTERNATE
> 
> -enum kinds { nct6106, nct6775, nct6776, nct6779, nct6791, nct6792, nct6793,
> - nct6795, nct6796, nct6797, nct6798 };
> +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
> + nct6793, nct6795, nct6796, nct6797, nct6798 };
> 
>  /* used to set data->name = nct6775_device_names[data->sio_kind] */
>  static const char * const nct6775_device_names[] = {
>  "nct6106",
> + "nct6116",
>  "nct6775",
>  "nct6776",
>  "nct6779",
> @@ -92,6 +94,7 @@
> 
>  static const char * const nct6775_sio_names[] __initconst = {
>  "NCT6106D",
> + "NCT6116D",
>  "NCT6775F",
>  "NCT6776D/F",
>  "NCT6779D",
> @@ -129,6 +132,7 @@
>  #define SIO_REG_ADDR 0x60 /* Logical device address (2 bytes) */
> 
>  #define SIO_NCT6106_ID 0xc450
> +#define SIO_NCT6116_ID 0xd280
>  #define SIO_NCT6775_ID 0xb470
>  #define SIO_NCT6776_ID 0xc330
>  #define SIO_NCT6779_ID 0xc560
> @@ -839,10 +843,8 @@
> 
>  static const u8 NCT6106_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3 };
>  static const u8 NCT6106_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04 };
> -static const u16 NCT6106_REG_PWM[] = { 0x119, 0x129, 0x139 };
>  static const u16 NCT6106_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c };
>  static const u16 NCT6106_REG_FAN_MODE[] = { 0x113, 0x123, 0x133 };
> -static const u16 NCT6106_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130 };
>  static const u16 NCT6106_REG_TEMP_SOURCE[] = {
>  0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
> 
> @@ -910,6 +912,68 @@
>  [12] = 0x205,
>  };
> 
> +/* NCT6112D/NCT6114D/NCT6116D specific data */
> +
> +static const u16 NCT6116_REG_FAN[] = { 0x20, 0x22, 0x24, 0x26, 0x28 };
> +static const u16 NCT6116_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4, 0xe6, 0xe8 };
> +static const u16 NCT6116_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf6, 0xf6, 0xf5
> };
> +static const u16 NCT6116_FAN_PULSE_SHIFT[] = { 0, 2, 4, 6, 6 };
> +
> +static const u16 NCT6116_REG_PWM[] = { 0x119, 0x129, 0x139, 0x199, 0x1a9 };
> +static const u16 NCT6116_REG_FAN_MODE[] = { 0x113, 0x123, 0x133, 0x193,
> 0x1a3 };
> +static const u16 NCT6116_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130, 0x190,
> 0x1a0 };
> +
> +static const u16 NCT6116_REG_CRITICAL_TEMP[] = {
> + 0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
> +static const u16 NCT6116_REG_CRITICAL_TEMP_TOLERANCE[] = {
> + 0x11b, 0x12b, 0x13b, 0x19b, 0x1ab };
> +
> +static const u16 NCT6116_REG_CRITICAL_PWM_ENABLE[] = {
> + 0x11c, 0x12c, 0x13c, 0x19c, 0x1ac };
> +static const u16 NCT6116_REG_CRITICAL_PWM[] = {
> + 0x11d, 0x12d, 0x13d, 0x19d, 0x1ad };
> +
> +static const u16 NCT6116_REG_FAN_STEP_UP_TIME[] = {
> + 0x114, 0x124, 0x134, 0x194, 0x1a4 };
> +static const u16 NCT6116_REG_FAN_STEP_DOWN_TIME[] = {
> + 0x115, 0x125, 0x135, 0x195, 0x1a5 };
> +static const u16 NCT6116_REG_FAN_STOP_OUTPUT[] = {
> + 0x116, 0x126, 0x136, 0x196, 0x1a6 };
> +static const u16 NCT6116_REG_FAN_START_OUTPUT[] = {
> + 0x117, 0x127, 0x137, 0x197, 0x1a7 };
> +static const u16 NCT6116_REG_FAN_STOP_TIME[] = {
> + 0x118, 0x128, 0x138, 0x198, 0x1a8 };
> +static const u16 NCT6116_REG_TOLERANCE_H[] = {
> + 0x112, 0x122, 0x132, 0x192, 0x1a2 };
> +
> +static const u16 NCT6116_REG_TARGET[] = {
> + 0x111, 0x121, 0x131, 0x191, 0x1a1 };
> +
> +static const u16 NCT6116_REG_AUTO_TEMP[] = {
> + 0x160, 0x170, 0x180, 0x1d0, 0x1e0 };
> +static const u16 NCT6116_REG_AUTO_PWM[] = {
> + 0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
> +
> +static const s8 NCT6116_ALARM_BITS[] = {
> + 0, 1, 2, 3, 4, 5, 7, 8, /* in0.. in7 */
> + 9, -1, -1, -1, -1, -1, -1, /* in8..in9 */
> + -1, /* unused */
> + 32, 33, 34, 35, 36, /* fan1..fan5 */
> + -1, -1, -1, /* unused */
> + 16, 17, 18, -1, -1, -1, /* temp1..temp6 */
> + 48, -1 /* intrusion0, intrusion1 */
> +};
> +
> +static const s8 NCT6116_BEEP_BITS[] = {
> + 0, 1, 2, 3, 4, 5, 7, 8, /* in0.. in7 */
> + 9, 10, 11, 12, -1, -1, -1, /* in8..in14 */
> + 32, /* global beep enable */
> + 24, 25, 26, 27, 28, /* fan1..fan5 */
> + -1, -1, -1, /* unused */
> + 16, 17, 18, -1, -1, -1, /* temp1..temp6 */
> + 34, -1 /* intrusion0, intrusion1 */
> +};
> +
>  static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
>  {
>  if (mode == 0 && pwm == 255)
> @@ -1308,6 +1372,11 @@
>  return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
>  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
>  reg == 0x111 || reg == 0x121 || reg == 0x131;
> + case nct6116:
> + return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> + reg == 0x26 || reg == 0x28 || reg == 0xe0 || reg == 0xe2 ||
> + reg == 0xe4 || reg == 0xe6 || reg == 0xe8 || reg == 0x111 ||
> + reg == 0x121 || reg == 0x131 || reg == 0x191 || reg == 0x1a1;
>  case nct6775:
>  return (((reg & 0xff00) == 0x100 ||
>  (reg & 0xff00) == 0x200) &&
> @@ -1687,6 +1756,7 @@
>  data->auto_pwm[i][data->auto_pwm_num] = 0xff;
>  break;
>  case nct6106:
> + case nct6116:
>  case nct6779:
>  case nct6791:
>  case nct6792:
> @@ -3123,6 +3193,7 @@
>  case nct6776:
>  break; /* always enabled, nothing to do */
>  case nct6106:
> + case nct6116:
>  case nct6779:
>  case nct6791:
>  case nct6792:
> @@ -3549,6 +3620,23 @@
> 
>  fan3pin = !(cr24 & 0x80);
>  pwm3pin = cr24 & 0x08;
> + } else if (data->kind == nct6116) {
> + int cr1a = superio_inb(sioreg, 0x1a);
> + int cr1b = superio_inb(sioreg, 0x1b);
> + int cr24 = superio_inb(sioreg, 0x24);
> + int cr2a = superio_inb(sioreg, 0x2a);
> + int cr2b = superio_inb(sioreg, 0x2b);
> + int cr2f = superio_inb(sioreg, 0x2f);
> +
> + fan3pin = !(cr2b & 0x10);
> + fan4pin = (cr2b & 0x80) || // pin 1(2)
> + (!(cr2f & 0x10) && (cr1a & 0x04)); // pin 65(66)
> + fan5pin = (cr2b & 0x80) || // pin 126(127)
> + (!(cr1b & 0x03) && (cr2a & 0x02)); // pin 94(96)
> +
> + pwm3pin = fan3pin && (cr24 & 0x08);
> + pwm4pin = fan4pin;
> + pwm5pin = fan5pin;
>  } else {
>  /*
>  * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> @@ -3779,7 +3867,7 @@
>  data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
>  data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
>  data->REG_TOLERANCE_H = NCT6106_REG_TOLERANCE_H;
> - data->REG_PWM[0] = NCT6106_REG_PWM;
> + data->REG_PWM[0] = NCT6116_REG_PWM;
>  data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
>  data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
>  data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
> @@ -3798,7 +3886,7 @@
>  data->REG_CRITICAL_PWM = NCT6106_REG_CRITICAL_PWM;
>  data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
>  data->REG_TEMP_SOURCE = NCT6106_REG_TEMP_SOURCE;
> - data->REG_TEMP_SEL = NCT6106_REG_TEMP_SEL;
> + data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
>  data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
>  data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
>  data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
> @@ -3821,6 +3909,79 @@
>  reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
> 
>  break;
> + case nct6116:
> + data->in_num = 9;
> + data->pwm_num = 3;
> + data->auto_pwm_num = 4;
> + data->temp_fixed_num = 3;
> + data->num_temp_alarms = 3;
> + data->num_temp_beeps = 3;
> +
> + data->fan_from_reg = fan_from_reg13;
> + data->fan_from_reg_min = fan_from_reg13;
> +
> + data->temp_label = nct6776_temp_label;
> + data->temp_mask = NCT6776_TEMP_MASK;
> + data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
> +
> + data->REG_VBAT = NCT6106_REG_VBAT;
> + data->REG_DIODE = NCT6106_REG_DIODE;
> + data->DIODE_MASK = NCT6106_DIODE_MASK;
> + data->REG_VIN = NCT6106_REG_IN;
> + data->REG_IN_MINMAX[0] = NCT6106_REG_IN_MIN;
> + data->REG_IN_MINMAX[1] = NCT6106_REG_IN_MAX;
> + data->REG_TARGET = NCT6116_REG_TARGET;
> + data->REG_FAN = NCT6116_REG_FAN;
> + data->REG_FAN_MODE = NCT6116_REG_FAN_MODE;
> + data->REG_FAN_MIN = NCT6116_REG_FAN_MIN;
> + data->REG_FAN_PULSES = NCT6116_REG_FAN_PULSES;
> + data->FAN_PULSE_SHIFT = NCT6116_FAN_PULSE_SHIFT;
> + data->REG_FAN_TIME[0] = NCT6116_REG_FAN_STOP_TIME;
> + data->REG_FAN_TIME[1] = NCT6116_REG_FAN_STEP_UP_TIME;
> + data->REG_FAN_TIME[2] = NCT6116_REG_FAN_STEP_DOWN_TIME;
> + data->REG_TOLERANCE_H = NCT6116_REG_TOLERANCE_H;
> + data->REG_PWM[0] = NCT6116_REG_PWM;
> + data->REG_PWM[1] = NCT6116_REG_FAN_START_OUTPUT;
> + data->REG_PWM[2] = NCT6116_REG_FAN_STOP_OUTPUT;
> + data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
> + data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
> + data->REG_PWM_READ = NCT6106_REG_PWM_READ;
> + data->REG_PWM_MODE = NCT6106_REG_PWM_MODE;
> + data->PWM_MODE_MASK = NCT6106_PWM_MODE_MASK;
> + data->REG_AUTO_TEMP = NCT6116_REG_AUTO_TEMP;
> + data->REG_AUTO_PWM = NCT6116_REG_AUTO_PWM;
> + data->REG_CRITICAL_TEMP = NCT6116_REG_CRITICAL_TEMP;
> + data->REG_CRITICAL_TEMP_TOLERANCE
> + = NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
> + data->REG_CRITICAL_PWM_ENABLE = NCT6116_REG_CRITICAL_PWM_ENABLE;
> + data->CRITICAL_PWM_ENABLE_MASK
> + = NCT6106_CRITICAL_PWM_ENABLE_MASK;
> + data->REG_CRITICAL_PWM = NCT6116_REG_CRITICAL_PWM;
> + data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
> + data->REG_TEMP_SOURCE = NCT6106_REG_TEMP_SOURCE;
> + data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
> + data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
> + data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
> + data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
> + data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
> + data->REG_ALARM = NCT6106_REG_ALARM;
> + data->ALARM_BITS = NCT6116_ALARM_BITS;
> + data->REG_BEEP = NCT6106_REG_BEEP;
> + data->BEEP_BITS = NCT6116_BEEP_BITS;
> +
> + reg_temp = NCT6106_REG_TEMP;
> + reg_temp_mon = NCT6106_REG_TEMP_MON;
> + num_reg_temp = ARRAY_SIZE(NCT6106_REG_TEMP);
> + num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
> + reg_temp_over = NCT6106_REG_TEMP_OVER;
> + reg_temp_hyst = NCT6106_REG_TEMP_HYST;
> + reg_temp_config = NCT6106_REG_TEMP_CONFIG;
> + reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
> + reg_temp_crit = NCT6106_REG_TEMP_CRIT;
> + reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
> + reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
> +
> + break;
>  case nct6775:
>  data->in_num = 9;
>  data->pwm_num = 3;
> @@ -4366,6 +4527,7 @@
>  data->have_vid = (cr2a & 0x60) == 0x40;
>  break;
>  case nct6106:
> + case nct6116:
>  case nct6779:
>  case nct6791:
>  case nct6792:
> @@ -4395,6 +4557,7 @@
>  NCT6775_REG_CR_FAN_DEBOUNCE);
>  switch (data->kind) {
>  case nct6106:
> + case nct6116:
>  tmp |= 0xe0;
>  break;
>  case nct6775:
> @@ -4590,6 +4753,9 @@
>  case SIO_NCT6106_ID:
>  sio_data->kind = nct6106;
>  break;
> + case SIO_NCT6116_ID:
> + sio_data->kind = nct6116;
> + break;
>  case SIO_NCT6775_ID:
>  sio_data->kind = nct6775;
>  break;
> 
