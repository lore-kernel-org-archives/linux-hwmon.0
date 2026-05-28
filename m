Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBFA282F24
	for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976587; cv=none; b=D01dVRiw60VoQocbxGXKo9IUqMoJXNgMmzA/hs3qjLHiW51Z5M9h4PN4/iRe0veEpHa1PySfnS3Sy6fCZttHxi0hdn1SlOFplyLGRZtk8nK0mSKsLA8uBNUgCpkO7LC9VGxM2hScYRaRWP1hxOyqd2H1sv5OIKMun064978OnGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976587; c=relaxed/simple;
	bh=ikJN4+ppf7CAL6VedXVT9Rr0ah5xg0XI8JjcHi2o698=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfPjWO1z8XtwQwocvOO37awO2AtmA3QZuWWqZNukscC8qZ9z1rYuzad0M5pI/nwRor9t0iOJkWf/OtiDN+qhy7hUK+XP/TZwe3fn9H9dlQyS4bRvq2PAainh2OjbgbSS/AYZm27vpb2HSKrKusP3GRSeweiSJ7OFtO7iprN7RWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZVB5wdZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZVB5wdZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso295860f8f.3
        for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976585; x=1780581385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZIl+KJ+fQQlmznLbm0KPLsHpzwpU8dKWXm9Uhfft88=;
        b=KZVB5wdZ8jDHgQuJWHY6pp0+Tja+/EWI/SMPJDGBzyxHSaYtIWpaCys4rljse6xnfl
         zi+ox4YwyWqDlGLc3kF4D7MpBOqVI41qor4TD5tFSZ+465w/A/wbvaGAgyoAhvu14hqw
         o5wSAtyGP9NhrUYm8teO6a2erBynU33RnZI9gy4PmSr7wx3VHXNpOJq0ElWrxJNf/koX
         zGwHEGGbfQQ8EauMyKt/6u4XdaFyqnbrCdbiO2D8OSF2vEgFB9tF73sEXUOJBNJLncuR
         IdRKDdu1bO07+eyoOAiBdJCRSyHnBUeGh6+wCuytehzdVc8FYZvzNzASOYyB6XIZklMB
         BuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976585; x=1780581385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZIl+KJ+fQQlmznLbm0KPLsHpzwpU8dKWXm9Uhfft88=;
        b=FbRClaujR3osFpNhnhiH3cdtRBmbo5/9qrqLP+eGWGa5eCxzyv0x4R3hgTel6hI9+l
         vxtP+5SACFVX/wI0Ng6b5kVBSB5tFx+TLxTksu1dEIS4pgrc4RPYMtf2CZ1AnVTEYh9r
         KyyFStymAJAYVv+qy/QINbOxyLGVi0c1l12YGyBVuYaaqiKO+c92CBpGwq9yHHIVCtnk
         OKn24PrX73DvlNEklf9Y9BlLLg5cn4mpyGGXrquVz8IENUKYSWcC4iTaKtZNe/DypaTt
         DigH0b7LGsx+XetEL0Rmcp8sqeBwz7ymGp8gh7PTr0Wx2YJ0isoV7wZGO0j53SLQqq5a
         I7OA==
X-Forwarded-Encrypted: i=1; AFNElJ9XYp39mu3qlL/yuBqMNKG16XEC2um5KvYIVPC+ymiN4Y9k2BWYjniZsX05CBYQ32XSXOAOJnKsF6uL4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Q6o5D4OkeIN/hLD8SbOJlnFDytnQV0V5AS57egkwvyMXnlK1
	YRETJ6vo9I3bxdhu/AWr4SOZhpaylwgtOBgTPrFHGTgHdKe/XWDw/rL/
X-Gm-Gg: Acq92OGq3XJz28BwtbSGUfblk7whViLFumC9664t9LbTh+Xymv1+zj+PIvLj50WYigh
	ZNjBpN1eiXU+NIcqf4z4TxtESQ6p8zkPB/nah6/Rj76D4Hl8/ad583r7JWM+TSmTA+pbUAyF9Wx
	guCivF7StL2Wiub+LcEjYrpiFaS5wHlETgRMifBbenn4WqmvcTiPi9Paxcrf6GXo1DhzUVwTxRx
	1gFBN1+azdMoQkfFKOWkt8gpa/jVZMdXRXyOQI7vuSzvlLwNDMsaAN+rn1JfqxRJw/GAQOVMBPK
	pywopy8a+Kmfyjg6huxP2IEP70dSrokJ4qe5eVrw1fqLqZ3NWdIvGBVKGrw8HQFbzFgbePrlnZu
	z7LlpBpD6jggVxX/st+0kCUYTCXZbZ6Z5/ya2sMH0YebBGl26cmusisglV3K43AnG80ll59EBec
	5OMAhU8UWUUFS/C/cXkvN4WIP/0cCu52l7nMPcDpuI0Z2Jwv/aegC5GyCZQiVNBrmlFp+GRJImB
	FAW5l/qQun/0Ck+tsVtLDWyhZVOO4ditt9CNN8wMU3JzRn+wJscauLJkQot
X-Received: by 2002:a5d:5f54:0:b0:45e:73a5:e1ed with SMTP id ffacd0b85a97d-45eb36adb4dmr48541589f8f.27.1779976584446;
        Thu, 28 May 2026 06:56:24 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eec5eba06sm2528147f8f.22.2026.05.28.06.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:56:23 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 28 May 2026 14:56:19 +0100
To: Jonathan Cameron <jic23@kernel.org>, Wadim Mueller <wafgo01@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxwell Doose <m32285159@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
	Andreas Klinger <ak@it-klinger.de>, Lars-Peter Clausen <lars@metafoo.de>, 
	linux-hwmon@vger.kernel.org, Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: Re: [PATCH v2 3/3] iio: flow: add Sensirion SLF3S liquid flow sensor
 driver
Message-ID: <iks556caxplhs2pb4ca645xpuosoa7e4xkzldjfxuziwbz2cta@t7pndtbm6xbm>
References: <20260524205112.26638-1-wafgo01@gmail.com>
 <20260527184257.141635-1-wafgo01@gmail.com>
 <20260527184257.141635-4-wafgo01@gmail.com>
 <20260528122244.2e408dd3@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528122244.2e408dd3@jic23-huawei>

On 26/05/28 12:22PM, Jonathan Cameron wrote:
> On Wed, 27 May 2026 20:42:54 +0200
> Wadim Mueller <wafgo01@gmail.com> wrote:
> 
> > Add a driver for the Sensirion SLF3S family of digital liquid-flow
> > sensors (SLF3S-0600F, SLF3S-1300F and SLF3S-4000B).  The sensors
> > communicate over I2C and return a 16-bit signed flow value, a 16-bit
> > signed temperature reading and a status word - each protected by a
> > CRC-8 byte - in every measurement frame.
> > 
> > The driver exposes:
> > 
> >   in_volumeflow_raw     - signed raw counts
> >   in_volumeflow_scale   - litres per second per LSB (per variant)
> >   in_temp_raw           - signed raw counts
> >   in_temp_scale         - millidegrees Celsius per LSB
> > 
> > The variant is auto-detected from the product-info word read at
> > probe time.  All three SLF3S devices are factory-calibrated for both
> > water and isopropyl alcohol; the calibration medium is selected via
> > the sensirion,medium device property and defaults to water.
> > 
> > Scale factors are taken from the respective datasheets (Table 16
> > for SLF3S-0600F, Table 15 for SLF3S-1300F and SLF3S-4000B):
> > 
> >   SLF3S-0600F:  10 (ul/min)^-1  -> 1/600 000 000 (l/s)/LSB
> >   SLF3S-1300F: 500 (ml/min)^-1  -> 1/30 000 000  (l/s)/LSB
> >   SLF3S-4000B:  32 (ml/min)^-1  -> 1/1 920 000   (l/s)/LSB

...

> > +static int slf3s_read_raw(struct iio_dev *indio_dev,
> > +			  struct iio_chan_spec const *chan, int *val,
> > +			  int *val2, long mask)
> > +{
> > +	struct slf3s_data *sf = iio_priv(indio_dev);
> > +	int flow, temp, ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (!iio_device_claim_direct(indio_dev))
> > +			return -EBUSY;
> > +
> > +		ret = slf3s_read_sample(sf, &flow, &temp);
> > +		iio_device_release_direct(indio_dev);
> > +		if (ret)
> > +			return ret;
> > +
> > +		*val = (chan->type == IIO_VOLUMEFLOW) ? flow : temp;
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		if (chan->type == IIO_VOLUMEFLOW) {
> > +			*val = sf->variant->scale_num;
> > +			*val2 = sf->variant->scale_den;
> 
> Sashiko (probably correctly) identifies that the formatting that the IIO core
> does for an IIO_VAL_FRACTIONAL only goes to 9 decimal places.  That means
> in some cases the scale is truncated to 1 digit losing much of its usefulness.
> https://sashiko.dev/#/patchset/20260527184257.141635-1-wafgo01%40gmail.com
> 
> As such we need to increase the number of digits or maybe switch to using
> https://lore.kernel.org/all/20260524-adf41513-iio-driver-v14-6-06824d9c15f4@analog.com/
> 
> Which defines IIO_VAL_DECIMAL64_PICO

yes, pico would be enough, but IIO_VAL_DECIMAL64_FEMTO could also be defined if needed. 
There will be a v15, then let me know if any changes are needed.

-- 
Kind regards,

Rodrigo Alencar
