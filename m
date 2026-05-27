Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6C428821
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892527; cv=none; b=V1Wu0XSZZtzlEOuHHaojaYFHx7mmb/WVNx0Vgh0c3MFYKUg/XR1SiAn1HW14AEWE3T3x8JgUlqxLYGlSLAXj07Id85XONzKXuCRC/n2KPL2yEbm2l+/GQ7S7/RM1YESPSTRUMEp4ktBXBWoaeIEYvmBclOT9FOp/WVNjTWcw0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892527; c=relaxed/simple;
	bh=WTcPO5jx3m8I3dAcwWfqNAsiqQwEq6XdVKR3O/E/HPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3NyhBZvRvKbZFQmoYqndbyF5C6M+7MEczQET/mhfwF5/Tx+pf05lVx16w+A0XMbAKYI28API+Urn6qR8dc+Qmzncc5lkLQE0DwcojWETLzZnJvyd58lWYdjsBRp5g6+S3D2Ub1DoVc/BzETIBYVby+keskxY9bPYvlOU9nH/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS6EeIFz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS6EeIFz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d734223e4so7431169f8f.0
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892524; x=1780497324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGLUdia9Sn33UtIAjIRo2viP4FX9Z32Gv1ySJx1Aq8o=;
        b=nS6EeIFz2mphXjAba0hsnvpPilXsQFyq8V5Cv6k20E93+3vK/fNGaaWQSibUZTNNyr
         NpKlXTSoeh96uEID4c20on51llVXZbkfs94N7cJyyLT1G+DAHsAb9BAnY1JZEsIfNgvu
         PtL69EY0qz9kVWbXQFPlZ3wOjDAdLVF7+NTZR65qZuP22D7c4Xud8grECU2dH2/n4UKq
         ACrF6mk7MbQbiTLYhdL80bnwzVq5cM3yxFa6QNe87lwDtSIzEIPlewhrKMriqZBbQnAz
         XxetIqi6e0Y/HqmsLjbzNl2oTCp9MPUg6KIquwQUyAJeNYdupb5x8emvFMYtk3ykhpOy
         sjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892524; x=1780497324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGLUdia9Sn33UtIAjIRo2viP4FX9Z32Gv1ySJx1Aq8o=;
        b=UqhiCMn5vGUxOJw07zkTWbWwKJcEfkyyFDmSdCk1SIoLG9sLRHxG0b0vk8LrMDbavK
         no/4WoivETrfGSq6+4RdakZqLUSmzzA3S0z+5KNwZpgJlrvUAD5W4wteHEWQB4Ge93VF
         YBwkxyNJv664MnR2vtydqKTmzQ64zbn2yCQBmxumDd/iUFq6oKlVf32x+8rpzWazf9zx
         vJGKzYAvap/X3KA7YaDUszlGw9Aqhi1zf1V8+ZAKuXGblygrg2VPwyLkzoqk7qt2zRzP
         ipTc2ODrNYbSzd3qo7wtMIu+R36eZlX7sa2SkhLPGj1qJvp3iGpyraYW9o6+dyT8J5qx
         FI5g==
X-Forwarded-Encrypted: i=1; AFNElJ9iO1DU39pcaGXMQBXPN8laSvdVlqnh/tat25OKfl6gjeqs373bBr5L4UCEraSVw8zwsqgDRVsh8wLmVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8XzsBNua3Yve4yxsTqTuPQjuNsqVcpqui7OFH8ooKac9KKn/H
	BnlV+XmOcMlqQTufGNNStTUUYlKDVRiXz2Y16GHK7dUa4fA2cphUQD7m
X-Gm-Gg: Acq92OFVI+cXeDaSF3mw+VkPmMGTEdIBp/3IpjbCDnm638xtNbquy+V583b2E/I8vOi
	AJ41q/ocUxP8fS1OlCI93ba5f1JXUDo8lTbgQcE4aouTLGSovmkuagVRXgcuOr9Q36KPi+u0tMr
	Cqf+qmJB7u7XCF1EX8jVBuEIdzDXT/0ZoH/Am93RGyEXG/orcu2iNI8TCReryEnewMUOx9+pm2J
	e5tGw8RDn5GcTjzfpK1SjCk+BQjtBEs5f+CKuqfHq2DwATYIPCqWWI5ztcoRVNDt6+11xzWtTi7
	g9h5nZrWI8ZS5G+ne8cAiKZsPHB4eDUW0kCZLFvs42qAjT9WUC756ECgJsIIaG1g0oiL9lJOXQz
	+vvrpSzONE+UcoCIFV4oCOWpL9074iakJie/psgR0CuHXaaf4R0kSgbVxjPXO4CKmnF8/p6vSjy
	Eua+Y4R7onev6C8zE=
X-Received: by 2002:a05:6000:26c4:b0:453:9897:76aa with SMTP id ffacd0b85a97d-45ea31a36d2mr42115457f8f.21.1779892523971;
        Wed, 27 May 2026 07:35:23 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:23 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
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
Date: Wed, 27 May 2026 16:35:04 +0200
Message-ID: <20260527143515.102794-7-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526170618.14f45e2d@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-4-wafgo01@gmail.com> <4349f634-dd7b-468a-912c-5ceb8a283954@roeck-us.net> <20260526170618.14f45e2d@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:06:18 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > > What does the "X" refer to ? Why not "S" ?  
> 
> Absolutely - no wild cards in file names or indeed in variables etc.
> Just pick a part to name after.  Wild cards go wrong far too often!

Done in v2.  Renamed everywhere: slf3x.c -> slf3s.c, SLF3X_* ->
SLF3S_*, CONFIG_SENSIRION_SLF3X -> CONFIG_SENSIRION_SLF3S,
MAINTAINERS and binding titles too.

> > > +			dev_err(&client->dev,
> > > +				"unexpected device family 0x%02x\n",
> > > +				buf[SLF3X_FAMILY_BYTE]);
> > > +			return -ENODEV;  
> 
> Similar to below. This can't be an error or we break fallback
> compatibles in DT. There are historic drivers that do this that
> we haven't fixed up yet - but no new ones please!

Done in v2.  Unexpected family byte and unknown sub-type both
go to dev_dbg() now; the driver keeps the variant the compatible
/ id_table selected.  Only CRC failures and bus errors fail probe.

> Given the need to support fallback compatibles from device tree we don't
> fail at all on mismatches as that prevents use supporting a new fully
> backwards compatible (other than IDs) part in older kernels.
> 
> Whether a dev_info() or dev_dbg() is appropriate for such a case is
> less obvious but definitely dev_err().

Went with dev_dbg() for the unknown-sub-type / fallback path -
silent by default, discoverable when chasing a quirk.

Thanks,
Wadim
