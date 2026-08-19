Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442D1DF736
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173566; cv=none; b=JiHPyXoe2vA9XOIPb2C0kUsOgbuZSuRr3ioRIApADF+3hFMCa5pgCtrG93ocPExic30ySDx+10InbJaINb1ESTUSzmdNIAYLboaShOBaRvOkIwwbrasaYqBuXgPZ7431Jpt4MjuvFgRtVYmsk678vDxg6qFr5J061yuXrWimM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173566; c=relaxed/simple;
	bh=Elx6dL9G/AknfEHrdQH99+c64PpUPn8ymRDWUvUJims=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si8FocLJHvRIGCyGH1wtU/p5b2nN/+NeAaGdp3mDqMSHAB0QmYJasrL2XzmZa3X6Silsk3aoB3dUw6dOYWL8d62eHh8HpK6SdZMCPe+pF6oEHpoDUVjVAdqnkFuiqlxonbBJ5517CQZKiC5PGEMEXYI7tmeXooBxLTKqUcHAKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZnEXIj8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwKb6pvd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZnEXIj8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwKb6pvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787173563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wnq/mMUvYPT2FqKv0iWXvqnhMPqfjLROzvncWakdzS0=;
	b=AZnEXIj8k0akbFuqOXjEL+YOO4V2CQSyYVHioYBqlp++Mx1Bbg8txXVrnGSbZfoSjbMwXo
	VnTTYmp1nRI5ioffCFfGZrIpgm90EU6AUyuD6hWp0az9QZX56smT5FrqSqfrkUcoRcYXk7
	dw2fi9kBy4CGFCCQtd+7zy3BFqCq//w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-zZuHcgocPkOdPi1araA8sw-1; Wed, 19 Aug 2026 17:05:57 -0400
X-MC-Unique: zZuHcgocPkOdPi1araA8sw-1
X-Mimecast-MFC-AGG-ID: zZuHcgocPkOdPi1araA8sw_1787173557
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f45dde7595so12613996d6.3
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787173557; x=1787778357; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wnq/mMUvYPT2FqKv0iWXvqnhMPqfjLROzvncWakdzS0=;
        b=QwKb6pvdGIQn3xJmWv4bp5mb0bGt43lkwh4uZfTvHTpP9jl8oA75qBKUckP+vCltEr
         F8QXa5EQiL805qWj1aZgMSlavUOjNzy6Hbv6rQNZUYUFL93K1AeuCwiSPhBor1DSgOR4
         OORkReoNP/9rBBtG1durEUWa6SVIQfBSjHol3f/NEaG8B5POiDXi5QwdGKQ5F0CZObov
         5psjKDlbfmya/xAdWk4EU72Z8qwTpVm5m+PJfLWdamgtQSqSHvwOYHTd2hp2wNN/1JTS
         KAOammA7cB2k462P7EuIrmYmGRNKyOnt7ozOwnK0tE4eQlzL8vWeF1adxq7EhNTkVcib
         m4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173557; x=1787778357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wnq/mMUvYPT2FqKv0iWXvqnhMPqfjLROzvncWakdzS0=;
        b=EF8LxgiMW5v/c2lrQ3FY93PqNzcilupyTTsYgpskbFQupM52RCDoGtOXkWo64JN9Jm
         f1dNArbR3oA3at1NwG0wTXA0UJaE8AM9IVFmfeYldu2D6JNtBy0LLYbQ0Enr968Z4ZwT
         fURRK6yQK1wwEqa9pzT/7kiLERTsU1Y4Nr6RRTyKIN2Bh3aQT3pYE8lEorLT7Lkui7UJ
         uv/tl9LppBlsQTm8BP7bnsYK2CJk1TV3suJAqHb9d1hCh7yGfdfLOlllF17ZvsZj8MO1
         gTp9MIIM/BPm2nwI+9PtynUnMNLmzOdg3Fc9hmirY+tFzCAW8hLFHDX0qAsSNMI689gY
         weug==
X-Gm-Message-State: AFuF++n9HGYjgkqZoa3Hlzfb/7YSpr+WWwKaM+BSw8yds2951V9lqzgY
	IFbJeA6A8T3DP/fq918DK6xmJ2qj/aWy0pT1JMOxMHUVWUbV3blwr9EN0kTGggzmxxOyiMOpx7s
	zwDhNq3Hx9hJ3+D03KA/N0w5Ufs9kQnJFrGTqUC//B0I5Os2keEKOw3uhLohjLwq3
X-Gm-Gg: AR+sD13QwXmO6sbHHa2rCz6/TZXKkiMpafFzAo+8kDqJjlNB3Wvvhd3V6xD+vD9B3/a
	68PHijjI9eaD1P2/Ohhh3cxINxeTJplU+1+lYfR0EcquhO7QWm97aA1lcva7nXGRLwEtBbvR/Cg
	U5X9XujV6RQiu4tlViTVBTMYxMWe6bCxZps7YvgE2n7WGIukHz56UcyoJUiiHyyrE6aQqCeLand
	DB1f9AVHVMdx1YYRepKexPC9VKRMVI4hGMG/8VJGFqHLNIuEVrQ92za70v+bI9Cr8BOcTTnvgn+
	08TBhwlWzWAB1TEpJKeW3V4ALAjsGfOc6qjsHpMmaS1cXZg4Bn42tAgQ3tEsQa/TBkZzpubAfB5
	lPxTTeDNawg==
X-Received: by 2002:ad4:5ae4:0:b0:908:958f:4db with SMTP id 6a1803df08f44-90c5e94ec0bmr76601676d6.3.1787173556838;
        Wed, 19 Aug 2026 14:05:56 -0700 (PDT)
X-Received: by 2002:ad4:5ae4:0:b0:908:958f:4db with SMTP id 6a1803df08f44-90c5e94ec0bmr76600906d6.3.1787173556170;
        Wed, 19 Aug 2026 14:05:56 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b4ad5sm23304906d6.42.2026.08.19.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:05:55 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:05:52 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (ina2xx) Track active alarm in ina2xx_data
Message-ID: <aoYasBdVYNYa1OBB@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-3-349f7b2f1df8@redhat.com>
 <20260729161824.5D4C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729161824.5D4C01F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 04:18:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> [snip]
> 
> [Severity: Medium]
> Will this new state also be checked in ina226_alert_read()?
> 
> If an unconfigured alarm triggers, could it incorrectly return 1 since both
> alarms map to the same hardware mask?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_read() {
>     ...
>     mask = ina2xx_alert_type_to_mask(alert);
>     *val = (regval & mask) && (regval & INA226_ALERT_FUNCTION_FLAG);
>     ...
> }

The state check is added in patch 4/4. I think I split the commits too
much though; I'll squash these in v2.

> [snip]
> 
> [Severity: High]
> If a user writes 0 to an inactive alert limit, will it unintentionally clear
> the hardware mask at the beginning of ina226_alert_limit_write() and wipe out
> the currently active alert?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_limit_write() {
>     ...
>     ret = regmap_update_bits(regmap, INA226_MASK_ENABLE,
>                  INA226_ALERT_CONFIG_MASK, 0);
>     ...
> }

Same as in [1], this is an explicit design choice documented in
Documentation/hwmon/ina2xx.rst.

[1]: https://lore.kernel.org/all/aoYYxM63yFRgrxFD@rh-jkangas-kernel/

> 
> [Severity: High]
> This is a pre-existing issue, but on 32-bit architectures, does this clamp
> operation compute a negative boundary for INA2XX_POWER?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
>     ...
>     case INA2XX_POWER:
>         val = clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
>     ...
> }
> 
> Because UINT_MAX is cast to signed long by clamp_val(), it could result in a
> negative upper bound, forcing val to a negative number which is then clamped
> to 0.
> 
> [Severity: High]
> This is also a pre-existing issue, but does setting a large shunt voltage
> limit cause an integer overflow on 32-bit architectures?
> 
> drivers/hwmon/ina2xx.c:ina226_alert_to_reg() {
>     ...
>     case INA2XX_SHUNT_VOLTAGE:
>         val = clamp_val(val, 0, SHRT_MAX * data->config->shunt_div);
>         val *= data->config->shunt_div;
>     ...
> }
> 
> If a user sets a large valid limit on a 32-bit system, the multiplication
> might overflow the signed 32-bit long into a negative number, which is then
> incorrectly clamped to 0.

These are addressed in e6c80061ca23 ("hwmon: (ina2xx) Fix various
overflow issues").

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=3

