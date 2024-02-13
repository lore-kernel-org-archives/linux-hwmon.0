Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A145646A
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Feb 2024 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707831752; cv=none; b=KB4kt9XVOj9X3rZ11YFpcGG9+sKtWqeyhVzURjeQuetY/pTkHznnoouVK5viFnaP4XE/O9I7W0i+EMRFqSqPErh75Bz9ogzpwg9Qr6MT3wTv6Kt9ea/ENWO8uEsh756icCeImctBKjcB/nSItQkevNMOZ9hAee1DFiGr5UD+VUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707831752; c=relaxed/simple;
	bh=sqU8CWBYCpCtT0WVh42NGFNjFfhjI1FgaTgBLkB7j4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPhDDV53Itq0KK1/sf0S22v43JeeG2/FMjvxOesKprNcDA8eJfUazH2tUGrn7kXm1sVrqxnYzyUxsMRydcb7ETdSwLMRx0HkB0GbIktit8ncczHxljMNrX4kP7D6YsdioAp5ZriCGd1+Ai140e3y0EPoENmJXSVcRKZY9uketIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=AR/DDjkn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="AR/DDjkn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-296b2e44a3cso2288364a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Feb 2024 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1707831749; x=1708436549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wqk9RnAdmzkTU6vK/TdAMH/5ZEvIKD4DovGTx4NMMSE=;
        b=AR/DDjknVajtlN8kWc4aBj9EnxnpFAeLFSN1eEoyd3R2CKFuPkiTdDTjwVb9plqok5
         GhoflYKN5j8sPXMLiQEDmErlych/fbN13FcODpcrDC052ZMxULIFC3JIPKaSPWss8YAY
         Xoij1bntO7QL61pXADBeKgg5peIyBEUae2YZhSPsyEF/lmiDdpAwAogxrHA3QPCCRMlf
         kzb05OftOJjlDf8pbdgYXG6Eg8hLnMix30K9TP92EEyUjL3DwQL93JJ3dzO3nZx0WBbq
         28+8g95100L4N38bJ0qrnDpykXuLiOeVIHcEyydWhlB97jEOPsPwi85HyNSQM1DLxc1Q
         btXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707831749; x=1708436549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wqk9RnAdmzkTU6vK/TdAMH/5ZEvIKD4DovGTx4NMMSE=;
        b=Edm5ExlVULgx8CcFN2ApbIVDrAP1HlWiQWen7Sl0adRFEBH+6Gc3ClhkNiqo8ShM5k
         BYq/aFSSvRVaK0Yjux4EnSgVeDhyqKJnQDD+TQsnVpVmPtdzOW8sbJfuXiJjv2GXWVnL
         OuGthr1UmEmzmb1vhOMGTymHZgF7xPBgIX7p53i6jbvLD3f2TMoK5445wB3uwsFrY9hz
         TTW9KeyBdBB+t7kGCgLi9/6UPeEMBuTqVOcHlubBMTlSmkwL3gulyX1Mn7RI+0AjjVNs
         EHmOtFlZRYYvuPPw+L0az+vE3glQfcMT+Txam6witpk6voR6eS4Vb3daoowjM4Cb0rRJ
         BERA==
X-Forwarded-Encrypted: i=1; AJvYcCUxk5LD77PNAwn54D4nntzMymiqy4d5LO4FLpVaE6Aoy1qvPu5TxdlWnnxV9MN242/tcwuxsUDMjdWSaBMDes1NqIxHGv8jCbjLiig=
X-Gm-Message-State: AOJu0Yxfb3L4lHKonqbnlcN4cbfOw4aoP/id2wOLglc+4UdEhlFV8b62
	BgE3Abl91qzeRl6EAJDkc5EgLyYJe8DJR7gEAtKlEqJsMqjpjvAVfud87sIFEGNpf1EtsMF86aX
	yTQucO+l/F00wDIJq5CfnDizrtYFuPqP3bLxwRmPI/WJozejU40Y=
X-Google-Smtp-Source: AGHT+IHfkgz90jq0P0pE2m4FPBNOBJy5rQ3Pwm/G10giSDI+WYnSqSkh78viB+HIrt0/DzkXiltUDZW4SKoQlUss6NM=
X-Received: by 2002:a17:90a:db93:b0:297:fb7:fe1 with SMTP id
 h19-20020a17090adb9300b002970fb70fe1mr5854891pjv.46.1707831749457; Tue, 13
 Feb 2024 05:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130175140.3834889-1-naresh.solanki@9elements.com> <cd84b051-1608-48c0-8335-b038cd236f61@roeck-us.net>
In-Reply-To: <cd84b051-1608-48c0-8335-b038cd236f61@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 13 Feb 2024 19:12:19 +0530
Message-ID: <CABqG17jbOgAHWUemV5=VFKwufuGX_xyheTDETfJtvoOO9UWjvg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/mp2975) Fix IRQ masking
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, mazziesaccount@gmail.com, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,


On Wed, 31 Jan 2024 at 03:30, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jan 30, 2024 at 11:21:39PM +0530, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > The MP2971/MP2973 use a custom 16bit register format for
> > SMBALERT_MASK which doesn't follow the PMBUS specification.
> >
> > Map the PMBUS defined bits used by the common code onto the custom
> > format used by MPS and since the SMBALERT_MASK is currently never read
> > by common code only implement the mapping for write transactions.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  drivers/hwmon/pmbus/mp2975.c | 57 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> >
> > base-commit: 909d8d33f8b4664c9b6c7fd585114921af77fc2b
> >
> > diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
> > index b9bb469e2d8f..788ec2c5a45f 100644
> > --- a/drivers/hwmon/pmbus/mp2975.c
> > +++ b/drivers/hwmon/pmbus/mp2975.c
> > @@ -377,6 +377,62 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
> >       return ret;
> >  }
> >
> > +static int mp2973_write_word_data(struct i2c_client *client, int page,
> > +                               int reg, u16 word)
> > +{
> > +     u8 target, mask;
> > +     int ret;
> > +
> > +     if (reg != PMBUS_SMBALERT_MASK)
> > +             return -ENODATA;
> > +
> > +     /*
> > +      * Vendor-specific SMBALERT_MASK register with 16 maskable bits.
> > +      */
> > +     ret = pmbus_read_word_data(client, 0, 0, PMBUS_SMBALERT_MASK);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     target = word & 0xff;
> > +     mask = word >> 8;
> > +
> > +#define SWAP(cond, bit) (ret = (cond) ? (ret & ~BIT(bit)) : (ret | BIT(bit)))
>
> This isn't really a "SWAP", but setting or clearing of bits in "ret"
> depending on a bit set in "cond". I don't have a good idea for a
> better name, but either case I think a comment describing what it
> does would be useful.
Yes. will add below comment
/*
 * Set/Clear 'bit' in 'ret' based on condition
 */
>
> "ret" use is implied, but "mask" is always provided as parameter.
> Please either provide both as arguments, or make both implied.
Sure. Will update as:
#define SWAP(cond, bit) ret = (mask & cond) ? (ret & ~BIT(bit)) : (ret
| BIT(bit))

>
> Also, the first parameter is a bit mask, while the second parameter
> is a bit position. Please used defines for the second parameter
> and make it a mask as well.
Sure will be adding defines for second parameter as well.
#define MP2973_INVALID_DATA     8
#define MP2973_INVALID_COMMAND  9
#define MP2973_OTHER_COMM       5
#define MP2973_PACKET_ERROR     7
#define MP2973_VOLTAGE_UV       13
#define MP2973_VOLTAGE_OV       14
#define MP2973_IOUT_OC          11
#define MP2973_IOUT_OC_LV       10
#define MP2973_TEMP_OT          0

>
> > +     switch (target) {
> > +     case PMBUS_STATUS_CML:
> > +             SWAP(mask & PB_CML_FAULT_INVALID_DATA, 8);
> > +             SWAP(mask & PB_CML_FAULT_INVALID_COMMAND,  9);
> > +             SWAP(mask & PB_CML_FAULT_OTHER_COMM, 5);
> > +             SWAP(mask & PB_CML_FAULT_PACKET_ERROR, 7);
> > +             break;
> > +     case PMBUS_STATUS_VOUT:
> > +             SWAP(mask & PB_VOLTAGE_UV_FAULT, 13);
> > +             SWAP(mask & PB_VOLTAGE_OV_FAULT, 14);
> > +             break;
> > +     case PMBUS_STATUS_IOUT:
> > +             SWAP(mask & PB_IOUT_OC_FAULT, 11);
> > +             SWAP(mask & PB_IOUT_OC_LV_FAULT, 10);
> > +             break;
> > +     case PMBUS_STATUS_TEMPERATURE:
> > +             SWAP(mask & PB_TEMP_OT_FAULT, 0);
> > +             break;
> > +     /*
> > +      * Map remaining bits to MFR specific to let the PMBUS core mask
> > +      * those bits by default.
> > +      */
> > +     case PMBUS_STATUS_MFR_SPECIFIC:
> > +             SWAP(mask & BIT(1), 1);
> > +             SWAP(mask & BIT(3), 3);
> > +             SWAP(mask & BIT(4), 4);
> > +             SWAP(mask & BIT(6), 6);
> > +             break;
>
> Coming back to using defines for the second parameter: The
> above bit positions appear to be purely random. Having defines for
> those bits will at least explain what is being masked (and hopefully
> explain why bit 2, 12, and 15 are not covered at all).
> For example, at least one other chip from the same vendor defines
> bit 6 as CRC_ERROR, and the matching status register bit is bit
> 4 (memory fault detected) in STATUS_CML. Also, it is unclear why
> the chip would not issue any alerts when warning limits are exceeded.
> Without knowing what the bits in SMBALERT_MASK mean it is impossible
> to validate if the above is correct and/or complete.
Agree. Bit 2 & 15 are reserved & will add a comment to mention that.
For others, I will add #define as below..
#define MP2973_VIN_UVLO         1
#define MP2973_VIN_OVP          3
#define MP2973_MTP_FAULT        4
#define MP2973_MTP_BLK_TRIG     6
#define MP2973_VOUT_MAX_MIN_WARNING 12

Regards,
Naresh
>
> Thanks,
> Guenter
