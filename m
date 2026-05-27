Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98179427A19
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892533; cv=none; b=BO4qPWhrU5HeQ6umI3CRtYRYVV1lGiuxXFDZpbCvGZuGSQQdaMWMFJ+upYbN7eWnsvgQiPv/wR27Z+GN2kAoxyq0+z0t0FvNHdaZNEAd7cdOSeBQtbrVhs+35RWt18qoZ8ru1QNpz89w92YOXK4NESTSLqMCU8aMpDEMSNGnDp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892533; c=relaxed/simple;
	bh=3WvURRv+0iGdxA52spNK9Vrx/EhqkX/wdqaVWGz9pO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9buMrLh05358sB+voPfSBYMMrlgoazuncmizp0taQyuWA5lCTTkIbFE2wYW1BOPFHLJR3Kr117O2I/W00+gIKyXlAWA3XNyCRWRO9gnPMYq/Sa3BcUK3hvM0vafozszmacibQewcthxW/dXQdjMPJ/1136UL4yjojNkib8aeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peaWFW+B; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peaWFW+B"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44a74032ff8so8772729f8f.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892526; x=1780497326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96VfRnvZ0QCw3hUcAbbbU59S7RhhCddL2r3UDNMDre4=;
        b=peaWFW+BO9b7N9ANM6TmONUvqn15q3Cuw95P3PMhYTZnIRb/26wbvozr485/vijz5+
         7OJDujmt3TB8a5dVL2oJwXCq9DeDf5cJmVhdFih0dw2+4UKtGdXkbfDOe44hlc7cvXXE
         7Z4w3kOUlj9PsmP7MS+kLK+dlRYdrApf3f0MtcdyCk2s+NOy0TW7TF42oHygIobSXtjF
         NYnsMwxoITP2Be5y4K4B8/nZRm9SVu0kHHLLVdyO/FSF44OyqhMkt2YW0MY/5CShNpH/
         le3pzH4VecRBsVmyv5mjJGrLHwaNzzRLngivDlNGXnI8rFPOWsx7J+U9mPHH886bZPG8
         yVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892526; x=1780497326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96VfRnvZ0QCw3hUcAbbbU59S7RhhCddL2r3UDNMDre4=;
        b=Clt/euAxfXjYcLxbiG3ol+IoM24XQmPtPvIrVKXTfLoR0N7AB/8DvkZZeeDpbqQ+79
         cfjQTwECGbABG7sIvR16AEy2ESymzPSj9i3OxXehBGHKt5K48b0pLeXjLiXyw6NpuAk9
         7/KeUlyiL+iyHK8JAp9oMk5YQkp2919icdfrD8jkQjrPfS1NEQKNVtYaUevvIIbcwxRz
         WvtQ6tujwy2+L3O0YWoaIRVZhe4aoKTYAW0BcjtRz01iM/ll/yqEid88Smi8wKyyxAUW
         0e7GlgfvQpzbyZnhAFBZpfJPhYphHGwOBpS9Uza0ntW21EV/efBCpIxMg9TM36Eq4BXT
         oJ8w==
X-Forwarded-Encrypted: i=1; AFNElJ94gA7QwqdEn+rw0YOjt0A5DvTHia/ck3hgXhvvl5bG1TXq7rjAf3+aFwii7AEKLiPlJ8URJKOpFscLuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrvxsfb+g+Qw1LPTmqSKMoltDskc7sCxXx3shs/1wp8Cr5r94f
	snDD//150qhTTQYLHY9xsqxn09jcKbkdfxavhn3eb8wwsZrnwD1+Rokz
X-Gm-Gg: Acq92OG6wWIFVqUjgeXTVD+/73MxJHEOFNsoWWoFTRI4O3n7D6urODzw3eGHgeLNobH
	To/ngALpsSOjY298yKstsl8Fb8BwoOnhfpG/P3bGMl9DHCH5JmgA3bx+gtnTPTuJqKepqy5Cmsh
	7Q1w/FJ/W1A6OHHDzB6X4TiBY+JPJ17Ht1z/cwgPQ7iI0qQ0L8RyS2Z4SpfZc/oI4h/CXafjghf
	S+ZvAetC7hu4duPdXTu6Be2NPIiotFSygzQJr5AhNfEHrSFlq2FuCT/DevjC7Qg02MAl6ulaetL
	2tFA4gx8l1HKllA0Mr/APt2pPfr7D/Z1zoBlEeDS1DdBv6WF20IbrwPLPsSUi264NhmpEmo3tZE
	+RHFPA4qrCCnF+YW0h5q9gukFMyeyDZ7saDaeqzh64Fj+46ZGDChSTbzNr3GdLg4GMOmfJVgRyi
	Byw1XjgnzbvLzdGo8=
X-Received: by 2002:a05:6000:470b:b0:452:d03a:7aad with SMTP id ffacd0b85a97d-45eb38a6d8cmr39575261f8f.36.1779892526169;
        Wed, 27 May 2026 07:35:26 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:25 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jic23@kernel.org,
	lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] iio: flow: add Sensirion SLF3x liquid flow sensor driver
Date: Wed, 27 May 2026 16:35:06 +0200
Message-ID: <20260527143515.102794-9-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <4349f634-dd7b-468a-912c-5ceb8a283954@roeck-us.net>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-4-wafgo01@gmail.com> <4349f634-dd7b-468a-912c-5ceb8a283954@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 24 May 2026 14:40:51 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Sice you are at it, it might make sense to also support SLF3S-1300F.

Done in v2.  scale_den = 30 000 000 (500 (ml/min)^-1, Table 15 of
the LQ_DS_SLF3S-1300F datasheet) and sub_type byte 0x02 (Table 13,
product number 0x07030202).  Re-checked 0600F (0x07030302 -> 0x03)
and 4000B (0x07030501 -> 0x05) while I was at it, so all three
entries now match the published product numbers.

> > +	{ "sensirion,slf3s-0600f", "slf3s-0600f", ... }
> > drivers/iio/flow/slf3x.c
> What does the "X" refer to ? Why not "S" ?

Done in v2.  Renamed everywhere - slf3x.c -> slf3s.c, SLF3X_* ->
SLF3S_*, Kconfig symbol and MAINTAINERS title too.

> > +static const u8 slf3x_cmd_start_water[]	= { 0x36, 0x08 };  
> 
> I looked at LQ_DS_SLF3S-1300F, LQ_DS_SLF3S-0600F, and LQ_DS_SLF3S-4000B.
> They all also support Isopropyl alcohol (IPA) measurements.
> 
> Would it make sense to also provide support for other liquid types
> besides water ? That could be a sysfs attribute and/or a devicetree
> property.

Picked up in v2.  All three variants are factory-calibrated for
H2O and IPA; the scale factor and temperature interpretation are
identical, only the start command differs (0x3608 vs 0x3615).
v2 adds a "sensirion,medium" DT property (enum "water" / "ipa",
default water) that selects the start command at probe time, and
the binding (patch 2/3) documents it.  Kept this as a probe-time
choice instead of a sysfs attribute since switching mid-run needs
a stop anyway per the datasheet.

> > +static int slf3x_verify_crc(const u8 *block)
> > +{
> > +	return crc8(slf3x_crc_table, block, 2, SLF3X_CRC8_INIT) == block[2] ?
> > +		       0 :
> > +		       -EIO;  
> This returns -EIO on error ...
> > +
> > +	for (i = 0; i < SLF3X_PRODUCT_ID_LEN; i += 3) {
> > +		if (slf3x_verify_crc(&buf[i])) {  
> ... which is then ignored here and replaced by -EIO.
> 
> Why not just have it return a boolean ?

Done in v2.  slf3s_crc_valid() returns bool now; the call sites
translate false into -EIO themselves.

> > +	dev_err(&client->dev, "unsupported SLF3x sub-type 0x%02x\n",
> > +		buf[SLF3X_SUBTYPE_BYTE]);  
> 
> Not my call to make, but the driver is way too noisy for my liking.

Toned down in v2:

  - Unknown sub-type / unexpected family byte -> dev_dbg() and
    keep going (also covers Jonathan's fallback-compatibles point).
  - CRC mismatches -> dev_err_probe() in probe / dev_err() in
    read_raw, one line per failure instead of per-byte spam.

Thanks,
Wadim
