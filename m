Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115F18AE2
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729949; cv=none; b=Zwsig1RMEt1mxbGl37lP963d9QurTEmic2r5nkxFjmpETBEUpkVJ6pMgc0rQV0MSa/CiHYLjcfD1P6p3qEN+yXDJNt+qsvXDJ0fj+QATR++0Yo4+Ym5SN2dbzkWVZues/JW0ztoiOabCyM13rGsZXPO3ZlF2zVj7qsjgMviN2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729949; c=relaxed/simple;
	bh=JI3Tic8kGKB1wdh+cjilfB7nx7M8j1Iv145J4brxnvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNKEikZs4B82IlsrWoHEv8pIJhkkrbNaRhNoxoyRtnXDMZvevIJFVIM3oP6+TDJJCZrCWIgworQxjfHdA9AY8R4ApRFwgn1e5gkpRd0BF2FjroBncNiVOIYitf73Cy/ek1kvjGUC4h+qfQhQKVPcAdXTK3q/hEQLUEc3XFMTisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YscnQzUs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YscnQzUs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so80107485e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 20:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778729947; x=1779334747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9MV03PlSAgIq6woleWvfcysA/R9I3vTW8H0Yie2PHQ=;
        b=YscnQzUsLfIL8cThKRo51clSC66ECXJGqUd2tgOn9oxQyM7i5JxZUO1HSgAe2QePr6
         xiDiPTbxy8oOd8wvDYoSsvVE4NF3CJJA/VNKrMdnv/uxW62ZuFBDP1mY5WOyI2TFt0EV
         GdwDCI98nItemvB5+kcVqu5cxZFsEXbYEkVdAXR/TxbUCORFlFInPenm87BnTYsMXmtB
         E0QII6c8dCV+XbACa11OoCrldwFdu8CgAmVn+KJSinp+r3z3QHwaqwrcP21ZWwWFV3aG
         ICcB7BoRAJcIjeBQknbpdddODBG5tUEUcrf8V1rGgabMBbkUOFcHsZTbqtSA3cPwpaJ9
         +EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778729947; x=1779334747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9MV03PlSAgIq6woleWvfcysA/R9I3vTW8H0Yie2PHQ=;
        b=KyaXjRiR2r3afABsNnBUpKQf55AhHJnBB2AZiUjlVD2yh7MhuIVIQKLfCBaStHNo9y
         T7gLpIeqqt0WVfuxQVwggnu7C8sqklTRAKVo9fsB8cSPIdRxP5Lz5uC695QM1NY2/ufJ
         fXUh6J5sx9hLmElq3Za4N3RCM5HtzrwzyIWvITgLrISaCGCJJwwUIB9Bp+5XM0BNjlkZ
         y2BYD5x7f+OTN9UHjirio4yqDo+Kpn317r153k0xkJGnFBVzpMUt0lS7qlvLO6jXIg3L
         dJT3viJRsvXSm8bxIbrqIEBVstvUPJEREDnhH08OnT+SnLEbkfmf7obmubtpf0cyxoMR
         zwxg==
X-Gm-Message-State: AOJu0YyG0NEEr1vSjCo3nf7a9MFk3fwNUriMkdoxufVBGQ0eKY/mD6EK
	cgOzMq3/S3iWlEZs8417dbpnj4BGQzHLqrvfa03UqXAwMSYb3+6oFXFns6+jV7aB
X-Gm-Gg: Acq92OENNISUpE3zdqGVAi8h7Q7CxFHuoyzo27tdZsLlqk3K2OY5+LLPWacgGyYW9fi
	/QxrsYyOQPSjdMX09g1DEIdybsnxoP2E/s3KPJ8FyBLw8FK7qlnCQzU0Zn9hnMzpGqAZZfPI0u3
	CS8PD77B7zJXbG78vq+ssyuvo5HO5AsYzzkWPsr3W/KstYFYGJL27sNTpmKEMPuYcd6O1LYeGfD
	lmVRj+rabNuQlaxk4f8T9T1Es7iR95U14NiBsxAyomA5KENgWCsVp9nXj8yQnnOaOopSiEsv6wb
	jjqLbzx3ChjVbDDZiy/mC8l/QsbnFWtsdtaoWeQtUDxL2RsP4nAzfc3nNok306M8Kq+ZHINZd3l
	G19Tnyouc0aEoBoJiS2fkENCFarv2j1j9elBxDlhgXasyzMWisXX7keXb4KH7MoMdIpQDCSYYGG
	Hnk0LBhsMuvtP20R7XTMq6/8xUpKXKwHj51UmZTQ==
X-Received: by 2002:a05:600c:444b:b0:48e:706b:53e3 with SMTP id 5b1f17b1804b1-48fc9a0231emr91759905e9.1.1778729946546;
        Wed, 13 May 2026 20:39:06 -0700 (PDT)
Received: from localhost ([2001:863:36e:5104:a331:7451:88e0:34ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb271468sm16981835e9.4.2026.05.13.20.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 20:39:06 -0700 (PDT)
Message-ID: <106e2981-35a1-4559-ae20-2026c224f590@gmail.com>
Date: Thu, 14 May 2026 05:39:04 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260512214703.655633-3-sautier.louis@gmail.com>
 <20260514010209.5C3ABC19425@smtp.kernel.org>
Content-Language: en-US-large
From: Louis Sautier <sautier.louis@gmail.com>
In-Reply-To: <20260514010209.5C3ABC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2026 03:02, sashiko-bot@kernel.org wrote:
> Could exposing this read to unprivileged users lead to excessive firmware
> requests and mutex contention?
> 
> Since the sysfs files are world-readable, any local user can read them in a
> tight loop. Every read directly calls mpt3sas_config_get_iounit_pg7(), which
> issues synchronous requests to the firmware over the PCIe bus and acquires
> the shared config_cmds.mutex:
> 
> _hwmon_read() ->
>     mpt3sas_config_get_iounit_pg7() ->
>         _config_request() ->
>             mutex_lock(&ioc->config_cmds.mutex)
> 
> Does this allow an unprivileged user to starve other storage subsystem
> components that rely on this mutex for administrative tasks or device
> discovery?
> 
> Could we implement a caching mechanism (for example, caching the readings
> for a short period using jiffies) to rate-limit these firmware requests?

My initial implementation had a 1-second jiffies-based cache; I
dropped it after seeing that drivers/nvme/host/hwmon.c follows the
same no-cache pattern.

The cover letter's contention figure came from a less direct
measurement and was too optimistic. I re-measured directly on
ioc->config_cmds.mutex, hammering the sysfs temperature file from
N concurrent unprivileged workers on a 9500-8i / SAS3816 while a
separate "administrative" reader runs in the foreground. The same
setup against the system's NVMe is included below for comparison:

hwmon: mpt3sas (/sys/class/hwmon/hwmon3/temp1_input)
nproc: 16

baseline (no concurrent readers): p50=14.6µs  p95=18.9µs

Foreground reader latency with N concurrent unprivileged hammers:

  N   agg r/s   p50 µs   p95 µs   max µs
  1     65244     38.0     60.2     60.8
  2     57722     57.0     60.1    120.5
  4     55026     90.8    115.5    152.9
  8     53688    207.2    247.9    300.1
 16     52188    345.8    390.3    444.8

hwmon: nvme (/sys/class/hwmon/hwmon2/temp1_input)
nproc: 16

baseline (no concurrent readers): p50=268.6µs  p95=289.4µs

Foreground reader latency with N concurrent unprivileged hammers:

  N   agg r/s   p50 µs   p95 µs   max µs
  1      3558    803.8    839.8   1008.3
  2      3549   1342.0   1443.6   1558.7
  4      3543   2154.8   2473.0   2756.6
  8      3518   4130.9   4459.6   4677.4
 16      3522   7394.6   8743.6   8804.3

Aggregate throughput is mutex-bound: every hwmon read takes
config_cmds.mutex, so contention is bounded. The worst
foreground p95 I observed was ~8.5 ms at N=nproc=96 on the
9305-24i (below).

Across the other two test boxes:
- 9305-24i / SAS3224 (nproc=96): mpt3sas baseline 31 µs, p95 at
  N=96 ~8.5 ms; same shape, ~2x slower per read than the more
  recent 9500-8i / SAS3816 above.
- 9211-4i / SAS2004: no mpt3sas sensors reported, no hwmon
  device registered, no contention surface (graceful-skip path
  in the cover letter).

If a maintainer thinks the cache should come back to bound this
independently of the attacker count, I am happy to re-add it.
