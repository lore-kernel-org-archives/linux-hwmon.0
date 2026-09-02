Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424249C4AA
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354072; cv=none; b=oBryhhvPaaNCqnx3l13L+jmRz1Jq5+5LFDWKT1pp3cXUJITyKhRBXKS3B7sGiu1khPomtP7hncBUNb+ItEvpgU2ICy1stLYyM+NUKg6h8itngt7dGZyvKBefT/kxM0CCWvlodogwrvfmupHeYupHP8GvHN6zFSnS5CHFA67+PZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354072; c=relaxed/simple;
	bh=8oS/0o7cbFR6d0ZNPiKRUaGlfNnV83oR76X/iueXojc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTmGupSxz2n+aYWJ+BAExIuucfRWAzMVX64bJpottVh/dsFu93vnMNeV+7xQNkxisjadJalDjqlWqHcDUIEQ0dDKmTcEB8UYSQ7yMKDoNxw2huSMUT2ahtHayTQlbrGP74yT+FPvH1VQSs0NY5npsA1uTXdZIkoCiWSHH3my5N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9/EOGjH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9/EOGjH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so818001b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354071; x=1788958871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7I3yfmBz4sZhZWkBTulqc5Y1o3WUiX91xHY8kVn60w=;
        b=c9/EOGjHFydswb+mB31CPhpzj/WR4Ybsxa+lzHNHfvodVlxOSplegH1cxTM2WWy+x/
         lljWNh/islMZFKsLlk0hBL4vDs14KAZVrQuk9dp9vPsVJoyZ9KLYEv3QM+U7TuYTTgNT
         Yvba7ZeO6khEBW6Nc4+mGr5U6RQJs1eg1CD2CKA13QHmqHqpkq981IH5LTETCQ0UHkmT
         ixJG23xYRDDrwt0zJm0QOFN6zZGtKCZrl6B6BS2zSjNk2FZqDz9LBHx05Vv0+Kd3h4T5
         GvOOUTBW2OksqkzRJYTv88BRUyk+Y433kHSGmmjSUENGSGaYJ4bwRt++x9zFIo4O8n5u
         e50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354071; x=1788958871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7I3yfmBz4sZhZWkBTulqc5Y1o3WUiX91xHY8kVn60w=;
        b=NRBA7weCbkyKsFKJeNFalRVvfnne5tWl5ybZXQMmp80TwxcogvN9B3KjhEkBjTptAY
         tfcKiaxZ73aZ4XWualNEfc6YyMdsJQWxUQKNURInyNyrqA/wk8PD/brmYF3nh0bmB5IB
         v9LTrDTd/4nf6WfX8SkF010wVvAuLEVSrWO6Llh+/67iUStJIkEQ9sZXE0V7q2Y3gOh8
         uZOHXvHokvs5o+unlDfAyUt26jGlwaa6eDMB12X4cSURCgljXKGI3Xj1VwhM9XPbB9ym
         /+qXvUWx1n2bcusEfIgY6s1dXapM0/IsJSP8blhe21AMz4MrukBDFThmvh++uCerBdqm
         Uw+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8WCzsC12/UHgj9AxVEnInrn0TU8LqbZBe8+c3+mCr67HSD0L4PKzp9xS3jzRGH+niJeutn08cPgc2gg==@vger.kernel.org
X-Gm-Message-State: AFuF++lZF3xaXqI5HMxtNC6GiqErBU/SfFJV3WpxNQUyXFPwo4np3ADJ
	gvvw3oPqM1ge8jzZVHf/Nco4LpdRDfjPpGZjLF3fBChUh7vry3Sg+eJC
X-Gm-Gg: AYBFou2Wnh0602foFQScaFFSLFHEyCQSxn7ay+AoNtp8BUzcIPE4Szw6eoWsZUlerUf
	RCDuBcxThDt9UlJfie0yMwywz6DvJYruv4IXhXVY54wMXgCePCcYy4yIEbZuWHeJxaK/f1O6AUR
	EQ6UQ12khQ3J00d4nmHFeqj/l/nW9hknQrKR3gk4/yhC4SZ/SmPjA/gI7vlG0v+E8qg1iBS6MYm
	y9hB3gLU/JThM/GqXhdy36f+kdt6mzyx0ybyu5086KFckvGzalCe5RZ+c+MNd3xg4WSq7mzooHE
	LCK1lFqpeoOAi30jZ2ZeAMMI6wd+gbbNW01xIPZheP7CBwF1cX4zD0JpsLdLf5kNTPnv2SEIbOD
	ms6qVN4ClmY46fGODtQmf5zskVeVOpKmIkq6k1X8pKgu5nRKQ2Ch1q6s4ON/XOR0ab+nKpGBPVG
	vpWG8tRo2C3szl4tbYVhucdU/9J1BJJ012wdS2ybnYQQ3jH8xXwcYVWWU0HzLRLXdUf9bgk5E/w
	w==
X-Received: by 2002:a05:6a00:a90c:b0:857:727c:a1f3 with SMTP id d2e1a72fcca58-85ed4446f43mr7765503b3a.21.1788354070164;
        Wed, 02 Sep 2026 06:01:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f4140sm1333636b3a.1.2026.09.02.06.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:01:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 06:01:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Marius Zachmann <mail@mariuszachmann.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] hwmon: (corsair-cpro) Remove debugfs entries when probe
 fails
Message-ID: <58b477f2-ceae-4569-9227-93be3db9940f@roeck-us.net>
References: <20260828061949.3151191-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828061949.3151191-1-lilinmao@kylinos.cn>

On Fri, Aug 28, 2026 at 02:19:49PM +0800, Linmao Li wrote:
> ccp_debugfs_init() registers debugfs files whose private data is the devm
> allocated ccp.  If hwmon_device_register_with_info() fails right after it,
> ccp_probe() returns without removing them: the HID core then frees ccp,
> and ccp_remove() is not called for a failed probe, so the files stay
> behind.  Reading one of them dereferences the freed pointer.
> 
> Remove the debugfs entries on that error path.  debugfs_remove_recursive()
> waits for readers already inside the show callbacks, so ccp is no longer
> reachable through debugfs by the time probe returns.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Applied.

Thanks,
Guenter
