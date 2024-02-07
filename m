Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624E924B57
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299491; cv=none; b=Cy7UcnYMZH7QJ35NRg9SbVz/OPMJvgibpm4PAFLxEG6OvzMhJpHkrwwf38MkPMDK4iY/lzv5l194AtbNNGW+rnT6LBx2FYXHszU7ILY2IZnIeeiQWl/Bf6P92JeJclpRqBAgz+xLFJ7+wKE7i1EnBriNyleYlT22njaeLedxLgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299491; c=relaxed/simple;
	bh=6GPYFA4ShzhNMNlmbqAaQcw+sGbfTq0bwjYTC6KlKIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTtNH+0Uvf0ABD/zEhEiRbg9HJqiI9BE3xAhFx7CVWJZ+3Gg7l93OxEY2394D7q+IjfK7/q9Kjf5loYsZ8I2b8PHoaPS+5jlirkhC4gMbEqiUGjQJnDaYbkc0z7EJtHjC9pwUYXDfQ6IORh743nr4FbNf0yiNDaJUWCGrTE/U8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQyFrzgS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQyFrzgS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso573804a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 01:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299487; x=1707904287; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXsk+ZIrwUBexLOb5IDrfU2pgC4S1yhEtaZaH3st1rw=;
        b=tQyFrzgSrqdCEBSIgOBdUcRluJhsw9ND4DYIvDFMI4x1Pv/chsfwAC+uE05otIeaYu
         ZJbkBsifK+C2Rp+kJdu922tQSqBQHDjFpGANnyty5JmnTbSrYbo+qomDU4gZRp/lBLPp
         jsQi+pmtRGLMurx67wY3HrsrMHUXOSH7KuumNrEahangj5jBxAeGKc40Or+2IjK7C/Gj
         Bae/xSz7/H5229mcPA+TLEhXPfydFcq7VBGKtKn8+m1LFQyLQukq0bcaFpLVxruzbRw4
         p3C8tOKJU6d93aGI70i0B1EpWSTt8bPCuq+PqkCT7pWnPhSy3TID1mzjxrJeTOpwxWXX
         AULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299487; x=1707904287;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXsk+ZIrwUBexLOb5IDrfU2pgC4S1yhEtaZaH3st1rw=;
        b=JXXXw1DDzskrBXjDjLRSL3dTMDuElZuRQtP52OTNy9b8MXWOJwt3Scv4fDaZFpyfzz
         cFslU+6dhi3tXKbcE5j2dXRMX2Nao369QXt5W1Zrh6YCpqLMlmmVu9hGbdMJ5nuqY7Jq
         qHatNRvXaSQzMTTB4KeCHA3hT5kGi8q6ZU7DRNsxQaDYFTREYHVNHTzdRLLnNjpO8fMU
         vZ2ycOxqlSnVBD0TLKdqYJODsmlXgGrYu/KE+DDnmjTD0ALBQlPr4zzNw+LsmQzhI3Kt
         x1ew6zjczvV5mgWyvnlu3fM0w1fi2jrBENoQT6WvrwdBS+iMRJA/D3J8ZL0Pu1Dgachh
         6qvA==
X-Gm-Message-State: AOJu0YzeMUCL+QGjY7zdaQ0W5I47cmthirqNpLn9EVocEmztyDP31xIo
	gIbHg7zylK/OykK63bvtKh0IWYirg/jQ2tj/U6UKHTg9cahqwasvtrvKYzeWPaY=
X-Google-Smtp-Source: AGHT+IGPf6sXEn6vUNaoiIKl8cGmLekGAkpGPC3WHgmldkLoLrN9VcJaEYLdp+hdKcVKXn2oPbtc5A==
X-Received: by 2002:a17:907:2d90:b0:a37:4765:658 with SMTP id gt16-20020a1709072d9000b00a3747650658mr4870440ejc.34.1707299487534;
        Wed, 07 Feb 2024 01:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmWDsro69DYrUJXg++GaY22wVNm2ipjJnORdr44P2h65y5ZC+dfWA7sxzrTMi0dpc8qf8YhvLvtG2MjiO87KnSWzAQV+FGCBw=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w23-20020a17090633d700b00a3634a461f9sm555846eja.109.2024.02.07.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 01:51:27 -0800 (PST)
Date: Wed, 7 Feb 2024 12:51:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Nuno Sa,

The patch 848a5019ded5: "hwmon: ltc4282: add support for the LTC4282
chip" from Jan 29, 2024 (linux-next), leads to the following Smatch
static checker warning:

	drivers/hwmon/ltc4282.c:732 ltc4282_write_voltage_byte_cached()
	warn: no lower bound on 'val' rl='s64min-4294967294'

drivers/hwmon/ltc4282.c
    723 static int ltc4282_write_voltage_byte_cached(const struct ltc4282_state *st,
    724                                              u32 reg, u32 fs, long val,
    725                                              u32 *cache_raw)
    726 {
    727         u32 in;
    728 
    729         if (val >= fs)
    730                 in = U8_MAX;
    731         else
--> 732                 in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);

It looks like val comes from the user via hwmon_attr_store().  Do we
need to check if it's negative?

    733 
    734         if (cache_raw) {
    735                 *cache_raw = in;
    736                 return 0;
    737         }
    738 
    739         return regmap_write(st->map, reg, in);
    740 }

regards,
dan carpenter
